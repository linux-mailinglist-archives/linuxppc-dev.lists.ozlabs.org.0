Return-Path: <linuxppc-dev+bounces-8197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4609AA52B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 19:37:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnksW06zPz304f;
	Thu,  1 May 2025 03:37:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::235"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746034654;
	cv=none; b=dClNxUZPWO8MKLgz7MOeeS9/HCFBC58l7tEH7k6pi3FqJoRCpgKOCXDsYF0fTlPBmAfYOe7vTZf7jjmwf1e9/pwIg+Hl0XtzMRYB3i/4RSh2uKHjzrOxm5AGf1YobcjSAF5DFxlgvTmddGv026a0JNSy4oH1ezJ6W4VL1GzkvzvseVnfD5t2KoIYNxZen4K1/uu33X7HqLohJWfvWi/XhM7bjj2YUkLZbupQpUWUEBvkV+bAalzrJ7C5/PsqjR78hJ0FN/PkF7nMSoeeWg5TJn/f1WZpJzRFFp5OAjH+/4aLnMr8PVe/aR+lY8+5Y1V2jZVK22bvjwbLGjUjcupkSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746034654; c=relaxed/relaxed;
	bh=B80QHmr+sB5OMT7DkCFdd8/2a+nIvyDwd83EjF1b7wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8COF0S7jEZOJXo49YvbosNF0NQ++9Uhl3e81PO363yoypNQr3OiPovchNt6HAKYUHOvcs6LAAQYsSAyjYTwynCAkZslquO/mJvQEKIO1INwj7dAbiwd9M0i78QXIfphWOlVReg2XYueSD0t0O5c3r2GWwcsFhHfIEweHbCfVW0VVgfCw2X38qvCq3qEls4sE1VFWEj1+1pgIX9f4cHIqRRiqACksb/hzOwHjKg8k4f3zocQB0nyO6JuOw8rzq8zPfZDFpzEciZ2Oxjw9Ce6JBOk0agcmeytwZiLm+6oJ8KHbAj3I4hGFENDKYA8Hn7I9Mfq1t6BwJ2Ijg/zS4NUng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=C1HShPkj; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=C1HShPkj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnksS6w5Dz301G
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 03:37:32 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso486151fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 10:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746034647; x=1746639447; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B80QHmr+sB5OMT7DkCFdd8/2a+nIvyDwd83EjF1b7wg=;
        b=C1HShPkjYaECuJczghQfLNFfigUzKyVNiyGTIudN0qjecFKynD8/XqJytpZFV29+qw
         KAlaK6nw+H1hAzFwJDw3soTe676Gk3w89GlCYcrsSsJeKxQ+9hQfEhgaisPaa2VR1Gpo
         sI6kYrFVq2jGVpa9Fp+rwv9uk5iqagzMEVjPi0b4+1AMECOF2kYvQNMH/cL0hufjJEoC
         ZVywMGkdFsqls7XMa8DsraGq9fMAYDka1Hjkw6ww3RwCFcFVMdZMTxSFEuwBupaoKyp5
         IKq0lY0GteWSTo9fMYoeLtb4sJOFdsBN+U9vzb/94/lkU7tIclDUiD0P5ymvqE2LYRfE
         pnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034647; x=1746639447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B80QHmr+sB5OMT7DkCFdd8/2a+nIvyDwd83EjF1b7wg=;
        b=D7tnpJid2mQZjmU7xsBXDfGGkqLbntEPoLeGyJW6GBgaHQKWkTOUP1Ls0T29RnLi+u
         +xodDEjATDCmi9KnoXDsMr0bfqu0bJG/8zesQDPbZL4Oy3br3hcuGfuq5eTN8PtjnmBU
         q9qIHMBJsjQ4rdVprAnAO4Jqek1TaDysZVRAJ57by9rsiKdrVYeXIXTZjXKmA1+jhJhi
         gpZ/9jBd5FESxZ9egMbkMOzTk1KCby8Uou6218Q9oHfEiJZ5MGBOhUmMEf4IXpzfoKol
         GAQI+WP45BzlMeIK1e6zHTu2kCPsSJzysToERYAhq21n/3YQrvGR++39qfhqEkdR+yZ1
         p1GA==
X-Forwarded-Encrypted: i=1; AJvYcCVHZ9o4nVljs/MvgSwjyeAAOfvF2ssliMEykxKcPekYFAvCHdl42Uv/HdLqtyClRdKSk3QWQvMi+W2hsrM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxN2n4BbjbWy22iY7nkClcuALrk7h2160mYM6zHOaiDoI4ESZPN
	10CarLiCDtzJzkAemRx0+d2sKHDXGirXSnLTgP0mr/+aByGy1bI8KrT8OSpZSGFGcGJHU4iaZSc
	mRNRTZizIa2RqS7AKGcTn0zTOQh1YCjve/qKbDQ==
X-Gm-Gg: ASbGncuWU0kli8Fo8zPMC7Ev1jEn1lXKxwRgdeZre2QwW5jNGaeJtG0lN8Ltrr2juJf
	HQMPz/7RKKcK4iusLz7SW9GOoOPmzCFhNb/u9oWhCoGdZgKSKLxnLMQTd5kO1NOlF1/Yhm/t+hf
	Hhj6MERj3S2KmwxfmKU0WiwhAs2QytjS+YShrerslyT5XnfQUZouTgiQ==
X-Google-Smtp-Source: AGHT+IHEUyDS2y73x5UTLVTCAeSkmZ9cGIaS0WUiShuP4klNjjtKcVRhzpqZk/qxLOTTSObt/mVmSixEfyP9TzJHf3w=
X-Received: by 2002:a05:651c:2112:b0:30b:a185:47d8 with SMTP id
 38308e7fff4ca-31e69d17438mr13186651fa.4.1746034647109; Wed, 30 Apr 2025
 10:37:27 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
 <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org> <4a6e8ac1-b4e8-49e1-bc8a-d1854985bb31@csgroup.eu>
In-Reply-To: <4a6e8ac1-b4e8-49e1-bc8a-d1854985bb31@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Apr 2025 19:37:14 +0200
X-Gm-Features: ATxdqUEh34Gz1POqWO9v2IKaGBTgS6zz7pi2s7vMr2oV8EN8tMuslc97xocJ6hQ
Message-ID: <CAMRc=MesdgXAivzDnm1RW-jcxs_5goZiyKvK0-JLwqDv=9F6LQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] powerpc: 83xx/gpio: use new line value setter callbacks
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 30, 2025 at 7:33=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 08/04/2025 =C3=A0 09:21, Bartosz Golaszewski a =C3=A9crit :
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powe=
rpc/platforms/83xx/mcu_mpc8349emitx.c
> > index 4d8fa9ed1a67..d4ba6dbb86b2 100644
> > --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> > +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> > @@ -92,7 +92,7 @@ static void mcu_power_off(void)
> >       mutex_unlock(&mcu->lock);
> >   }
> >
> > -static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int =
val)
> > +static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v=
al)
> >   {
> >       struct mcu *mcu =3D gpiochip_get_data(gc);
> >       u8 bit =3D 1 << (4 + gpio);
> > @@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsi=
gned int gpio, int val)
> >
> >       i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctr=
l);
> >       mutex_unlock(&mcu->lock);
> > +
> > +     return 0;
>
> i2c_smbus_write_byte_data() can fail, why not return the value returned
> by i2c_smbus_write_byte_data() ?
>

The calls to i2c_smbus_write_byte_data() in this driver are
universally not checked. I cannot test it and wasn't sure if that's on
purpose so I decided to stay safe. Someone who has access to this
platform could potentially fix it across the file.

Bartosz

> >   }
> >
> >   static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, =
int val)
> > @@ -123,7 +125,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
> >       gc->can_sleep =3D 1;
> >       gc->ngpio =3D MCU_NUM_GPIO;
> >       gc->base =3D -1;
> > -     gc->set =3D mcu_gpio_set;
> > +     gc->set_rv =3D mcu_gpio_set;
> >       gc->direction_output =3D mcu_gpio_dir_out;
> >       gc->parent =3D dev;
> >
> >
>

