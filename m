Return-Path: <linuxppc-dev+bounces-8199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4595AA52E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 19:48:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znl6B2hgZz301G;
	Thu,  1 May 2025 03:48:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746035314;
	cv=none; b=eFDI/G10ZhYg4h6rFwMU+/CBraEdd3qsmO750kUqKvN4V3sqF9+q1R0hBz+z5D3h4/BAX9oZdS0FU2aVrRneEOD/kMJFWKQqmv5esw/yJ8gZBzt1L8MtKv8OvAX9k2XydwX+1hmKkvA5kVT4oSrMMl9/aKQQIuZGKyJ79DX0fPx5tkvu/uE0Sg5lNJ6b20/I0b38LgSrkp6CleFVPAzhbYGMebi6tG1yWKlZiYa87JvqNkpcYYQB3foZGpl5MMjKJ8vhNn74vxxIvl+iMwPIf0KX+zn5x7peLm3cY3sSKYMDKbo+5s2FUCFVB0+EOcCSZBehRkRXofPoObMK3C3Uxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746035314; c=relaxed/relaxed;
	bh=qpJGX9+h+gTHIetaz3YRmMwjLsCGItIjG65DtWufLYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYClPSmgM0igwUPlD4Dz/m7olmtE45x4kGpwQyYzgTn+YNy4TJdwkxq4Dg5bvzlAsPXu2ZPwddxZRcE2S1FS8DURJUUMHaCf2I+PqrkgL+nxzwOabgHBPw2bx0p4teWZdXN5xQPauTh7rI9d1FETgUL98wSSnHvScg/ZEDGjscBAYqUv4ilf6J+s2odfzk72ZK4T7PDc1FqpJ7GbT9TsTXZZk4qvB7kw91DfQJ3+kRvj9rR5cGB+yvWKm5nz2RQpYiDAFaKqAhL7wU81Ide8oFpI57qZLF7Oq/yvwSnyp/1mAmkeLS0GdxJXMADwjJ4qXFrKxWv2piB8IUZKuI+ONw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Fy8WkF8z; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Fy8WkF8z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Znl692msTz2ySg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 03:48:33 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54e7967cf67so162259e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 10:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746035310; x=1746640110; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpJGX9+h+gTHIetaz3YRmMwjLsCGItIjG65DtWufLYY=;
        b=Fy8WkF8zgYWyM7Ezh0NahJwZ711qQBrHs/ODG2BInjJO4mRP9CQi3kbNDlfsaEbkW2
         dNaVodSR7dOGrytbLyBi38WuwpoiW84gJgQh4HPxusD8TMSDnzcyzb8gTZ7ggZmV+kyV
         7xlKwgoyovSgmzUVvetx1NokqVt3JmUAlSUUhYqSA4t/u4gK5dR9/w9sAhqfuvHAQQuq
         7qRziYjyAYnYx9qcVgDqpGWkERO3/KIx1xPARUKGw/PcD1HKMb2JY9t+pYwnCTuEenzy
         f/tIpHVi2BazNdG4pXvxeT1j8I0uEbpHF3DCs8DlSNZi2YDs16mv7uJ4KPy3pG/xmwla
         5NSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035310; x=1746640110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpJGX9+h+gTHIetaz3YRmMwjLsCGItIjG65DtWufLYY=;
        b=b+sHFuPVUPnU7zG6kBz1rMAC9Q4z4Fu/VDgTNkWtRgwSUSIojCRlraHJuAJ28wx+ky
         vJCXlhcAKmzRx9BcIHz2Vqn3ygAE9UtCxH/QwlW6JpALqF4S4VnPqOFJYxdcs6Ijh/sF
         0iw4BoaH4MNDwUCMz1T9t0yHtfLvB6Z9jmU/zhYJAtPFnB7XwIhKCNlwOLWBk1MfmthD
         4eqMfxKlif6O1yvl3BUBPH4sAIRmYslyRFNGyactlXaOKeKKkyKyaqKawNz4xXo/W2Np
         LAAFDyqdQvK1OrRiEkfVBK2R2G6JEySuNsbXR5ZWRh4EaLTq86JHY6BBI5zw3JXll0i2
         O0rw==
X-Forwarded-Encrypted: i=1; AJvYcCUglYpg+kIgAcj8cWqfflOuTDjub+NoIKd1q1WSRcvjpTrcroEQpVoWOANwVsG4F0YPVhfngA2x3Az/nbU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzeWRjq+Q3KplQW1t+QKVWherHzeImmOBklqSO0bx4xceGXaLub
	ayTw64wUNTJxX1TtQg/TfdYRU/2HAPBrkDh0sKTz0Kj4KOLah3uJciyIvTeqeIa+dR/YRTQuspB
	TQINGnX4Wr0KPx3aY+byIJ081oFSw+u9dJvKtsA==
X-Gm-Gg: ASbGnct2EPC0HTxAIzvSI5rdt5wQxrW5iB7QUzPtYs+W2GVWK5OSIBIzcaFsdkCKW8R
	Mvht9F5YzCmgXNxYO9ddcOAku//MZSDko1a9rl5mhcLPm06GTJgECF6X69uAOgkH4XO+wSNSbAm
	8Mu1/J67f9uKFoQrYVCijzAs+GG8xpDol8gBQ39jZigrbh0SIK8VHN/w==
X-Google-Smtp-Source: AGHT+IFQ67uvPfDk2IC9gMdbwUwG5ozHU8ifWNIm2kpJQe5MUQrHtoSLGWBpWg5s+akHjnbM1ZGlWV32hbFW1I86oMY=
X-Received: by 2002:ac2:4e07:0:b0:54d:68bd:2856 with SMTP id
 2adb3069b0e04-54ea3363a60mr1289824e87.24.1746035309924; Wed, 30 Apr 2025
 10:48:29 -0700 (PDT)
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
 <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
 <4a6e8ac1-b4e8-49e1-bc8a-d1854985bb31@csgroup.eu> <CAMRc=MesdgXAivzDnm1RW-jcxs_5goZiyKvK0-JLwqDv=9F6LQ@mail.gmail.com>
 <11e1a1e7-7bd3-4d48-804c-45b53b5e15d5@csgroup.eu>
In-Reply-To: <11e1a1e7-7bd3-4d48-804c-45b53b5e15d5@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Apr 2025 19:48:19 +0200
X-Gm-Features: ATxdqUGjB0gCz481F3EdLKjtPBE29miYqhVUozl3mGg7-bSczgf2pXdTmq-UqSY
Message-ID: <CAMRc=McOxP5j=HTm6xybdr_09X-khHcanz4chfEwa-m6y1+gZQ@mail.gmail.com>
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

On Wed, Apr 30, 2025 at 7:47=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 30/04/2025 =C3=A0 19:37, Bartosz Golaszewski a =C3=A9crit :
> > On Wed, Apr 30, 2025 at 7:33=E2=80=AFPM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 08/04/2025 =C3=A0 09:21, Bartosz Golaszewski a =C3=A9crit :
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> struct gpio_chip now has callbacks for setting line values that retur=
n
> >>> an integer, allowing to indicate failures. Convert the driver to usin=
g
> >>> them.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>>    arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
> >>>    1 file changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/po=
werpc/platforms/83xx/mcu_mpc8349emitx.c
> >>> index 4d8fa9ed1a67..d4ba6dbb86b2 100644
> >>> --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> >>> +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> >>> @@ -92,7 +92,7 @@ static void mcu_power_off(void)
> >>>        mutex_unlock(&mcu->lock);
> >>>    }
> >>>
> >>> -static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, in=
t val)
> >>> +static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> >>>    {
> >>>        struct mcu *mcu =3D gpiochip_get_data(gc);
> >>>        u8 bit =3D 1 << (4 + gpio);
> >>> @@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, un=
signed int gpio, int val)
> >>>
> >>>        i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_=
ctrl);
> >>>        mutex_unlock(&mcu->lock);
> >>> +
> >>> +     return 0;
> >>
> >> i2c_smbus_write_byte_data() can fail, why not return the value returne=
d
> >> by i2c_smbus_write_byte_data() ?
> >>
> >
> > The calls to i2c_smbus_write_byte_data() in this driver are
> > universally not checked. I cannot test it and wasn't sure if that's on
> > purpose so I decided to stay safe. Someone who has access to this
> > platform could potentially fix it across the file.
>
> As far as I can see this function is called three times in this file.
>
> First time is in mcu_power_off(), which must return void.
> Second time is inside a forever loop in shutdown_thread_fn(), and I
> can't see what could be done with the returned value.
>
> Last time is in the function you are changing. Wouldn't it make sense to
> take the value into account here ? IIUC it is the purpose of the change,
> isn't it ?
>
> Christophe
>

Sure, I can do it. The purpose is first and foremost to convert all
drivers so that we can drop the old callbacks but I see what you mean.

Bart

