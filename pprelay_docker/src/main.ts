import { NestFactory } from '@nestjs/core';
import { ConfigService } from '@nestjs/config';
import { NestExpressApplication } from '@nestjs/platform-express';

import { AppModule } from './app.module';

async function bootstrap() {
  try {
    const app = await NestFactory.create<NestExpressApplication>(AppModule, { cors: true });
    app.enableCors({
      origin: '*',
      methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
      allowedHeaders: 'Content-Type, Accept',
    });
    const configService = app.get(ConfigService);
    let port = configService.get('base.port');
    await app.listen(port);

    console.log('app listening to', port);


  } catch (err) {
    console.log('err', err.message);
  }
}

bootstrap();
