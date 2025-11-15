clear

%% Create BLE Object
% >> blelist
% と入力すると，名前が確認できる
m5 = ble("Arduino");

%% Check the Chracteristics
% char(java.util.UUID.randomUUID())
% ans =
%     'fce70352-c544-48f4-9760-7568263b7922'
% char(java.util.UUID.randomUUID())
% ans =
%     'b570118e-df2f-4545-9cf9-eff837991f54'
ServiceUUID = "fce70352-c544-48f4-9760-7568263b7922";
characteristicUID = "b570118e-df2f-4545-9cf9-eff837991f54"; 

% Get the characteristic for writing (send data)
data_c = characteristic(m5, ServiceUUID, characteristicUID);

%% Example to send data to M5Stack

while 1
    ref = input("ref = ");   % -128 ～ 127 の値を入力
    
    % int8 → uint8 に変換（ビットパターン保持）
    valuesToSend = typecast(int8(ref), 'uint8');
    
    write(data_c, valuesToSend);
end
