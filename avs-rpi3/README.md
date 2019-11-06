# Building avs-device-sdk binaries for the Raspberry Pi 3
Tested using a Pi 3 B+

```
docker build --build-arg clientid=your_client_id \
    --build-arg productid=your_product_id \
    -t avs-rpi3 \
    .
```
