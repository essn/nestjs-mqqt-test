import { Module } from '@nestjs/common';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { AppController } from './app.controller';

@Module({
  imports: [
    ClientsModule.register([{ name: 'APP_SERVICE', transport: Transport.MQTT }]),
  ],
  controllers: [AppController],
})
export class AppModule { }
