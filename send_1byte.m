clear

m5 = ble("Arduino");

% UUID の設定
Service        = "fce70352-c544-48f4-9760-7568263b7922";
Characteristic = "b570118e-df2f-4545-9cf9-eff837991f54";

data_c = characteristic(m5, Service, Characteristic);

while 1
    ref = input("ref = ");   % -128 ～ 127 の値を入力
    
    % int8 を uint8 に変換（ビットパターン保持）
    valuesToSend = typecast(int8(ref), 'uint8');
    
    write(data_c, valuesToSend);
end