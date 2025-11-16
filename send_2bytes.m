clear

m5 = ble("Arduino");

% UUID の設定
Service        = "fce70352-c544-48f4-9760-7568263b7922";
Characteristic = "b570118e-df2f-4545-9cf9-eff837991f54";

data_c = characteristic(m5, Service, Characteristic);

while 1
    ref = input("ref = ");   % -32768 ～ 32767 の値を入力
    
    % --- int16 を 2 バイトの uint8 に変換（ビットパターン保持）---
    bytesToSend = typecast(int16(ref), 'uint8');  % 1x2 の uint8 ベクトルになる
    
    write(data_c, bytesToSend);
end