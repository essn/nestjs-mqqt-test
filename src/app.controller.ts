import { Controller, Inject, Logger } from '@nestjs/common';
import { ClientProxy, MessagePattern } from '@nestjs/microservices';

@Controller()
export class AppController {

  private readonly logger: Logger = new Logger(AppController.name)

  constructor(
    @Inject('APP_SERVICE') private readonly client: ClientProxy) { }

  @MessagePattern('greet')
  greet(data: string): string {
    this.logger.log("Topic: Greet - Recieved data")
    this.logger.log("Data", data)
    return data;
  }

  @MessagePattern('echo')
  echo(data: string): string {
    this.logger.log("Topic: echo - Recieved data")
    this.logger.log("Data", data)
    this.client.send('echo', data)
  }
}
