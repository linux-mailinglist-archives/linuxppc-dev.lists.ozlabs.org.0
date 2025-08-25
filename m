Return-Path: <linuxppc-dev+bounces-11253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A66B3402A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 14:56:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9W5j2vGfz3cj2;
	Mon, 25 Aug 2025 22:56:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::233"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756126617;
	cv=none; b=S3CvOjwMrXyHpwLiZGGDnoUssVcb8Zo2vjHAqeoGG5xu+FTEL6AWZVPTN7MBTFlKn6RnYUqS/9TqnIJtvIPUOLCgem7lvBlrp+qrdCkC2sEKCnP3Wtw1kt6K6a6FXYEQFz+V2+IU62Q0KopQa6A/7jtKqBJx6OUIu1WzLejjbOneGEpfZGf/9VosxZ6WsSXU8/At+W9LFt8y6wq14YnacycyNHhENx0/TpQ5fQqsWG77p3Jz5Gs4kkSI5fw85St8HrPVJ+8z6nSMwpx8RykeE8E5Ds/veyZ6BweH78pXumQcJ1o203GFuA3V8MCYaafIfQlBu/Dp6Z/QzLBC1qhzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756126617; c=relaxed/relaxed;
	bh=qnMFRUI7OrpeFHOHQnTbYDUskSBfz/K49TJPo7jgp3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdW+mJji1dvB+xDDCcJ21pxI+i8cJq+TOA3nL/jmc9ooGwLs4PrHEcSW2cg/VdERbj8jZxO9/CtaNqCIJ12k+jWDl12pLgocjkRQKC7nwQUU4rLcWoNgbMXZX7rnJHQRzrkJsELfONa1teWj8uON8J9i+HGvCsmnkaFsMtwXlPzasBjYJ5HYLgz2WarzGZ3HxTcMg7hYbqiRAqptudfrDjFh2pHFlwPrKObdYiOhejHbHu4MT9tFAE+Xtf+qlf3kPAFms1nxks2aJDVtIzZ3JKCGKqzw3N2HaHoAj2zrJUlMEUE5uKlk/h/kTTxIZxR8mqPkmqL49/tzXzfidY1WJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=vKlL/NcZ; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=vKlL/NcZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9W5g54s7z3cj1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 22:56:54 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-33682342180so1434771fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 05:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756126610; x=1756731410; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnMFRUI7OrpeFHOHQnTbYDUskSBfz/K49TJPo7jgp3o=;
        b=vKlL/NcZD+MBMVFdu0LfYHI0WHY7PBPaRE25RPSOh7bs7uzCxdorwAHOOfKgknCzSr
         DLgK6IKPmCr4dFB4uF7fwpiJoOIH3Mobd+aFUbbJ6+ptKlYpsqA1SM+E8noSLI9rxrql
         sOUkybieZjtw38fyWg+Cg9cwfHcS6+16lM5uyVBJx3bP72kZB3G8YnObBgI9b4K0L234
         NqYaVzBiV/8j11kH32FgD3Zz5+COt2hfrmg7Z9zaPHteURLYP29oB0waLXefKHeUmPiC
         E5ZCXSmp7wUzivlmRXNiTWmN6ZoxLWUDBlUG9xO6v/NZEtDtX34PPcQrcXFYXeCw8dsz
         8xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126610; x=1756731410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnMFRUI7OrpeFHOHQnTbYDUskSBfz/K49TJPo7jgp3o=;
        b=TcnIUvan46K/D2WMofGQ+qH+CkeqXvviZecg5Ay9zWh8haPwh3eGI7oMNuIj/zcgq8
         E5SRcpTkTR2wfJ7nsKo5t0cxGCd4VVMHO10UuvozAfeTZnFiYUIWUWuCmW9ISnPtiqNU
         uRtkt45It6iubpK4Se6nw2GcYtbNQVpAqJrLbB/CKj4jr4TSyWPzOKHSvxOSMqqQECGl
         Kz8+pAwlTbUENT0Z7zBXDlcIMdNC8VgUhsatnQV9Z/x0lqw1vV3YmQ5JycIvAIuEIbfs
         37YXlvcKBL9thdchio3yg2ESNdcIJZh07MNgOIVL5Ld+dJdFUeP99m3MKzPSeqkHZiSr
         IhTA==
X-Forwarded-Encrypted: i=1; AJvYcCXfuFyU0ED8Po7aQotThQF+Ol5K94hwr17HKNuWUCTA1fLfIoxYi7P64jKk8Tvpyyr7iOLd5lMJynHnAFs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxzSvlEimp3yf01vvQPho9pIXquZpmUVBFAxYW/iB4FF+wN4U+C
	LYpIuMsTzpPCqFUf0AoU7u0M53gTlRD7Rudb34LQC4nuoN92xG8BLASXZlcAfIzbcMaHOkk//gr
	jZ1R+OdC6BOF6MASLgkNgq9LP1oZfWE8/OuBGbNG29w==
X-Gm-Gg: ASbGncuDUFQLClYeMJP62SFEP5YRdzgpdswiqdbW1TuUBCfozv8iro1XEbvtjcxPtlJ
	fQ+751CzaXXhlXOKldI6eULeV6GZByvUiMrJOlpOjdrNHrR+XtGIsSCzNe2NpOyN7Wlnh6KnDhu
	izyxPbmSf/mII3Me/x9/P7x9vySu9qY8qKG4i5Iom5/w2AfoTT7QknsfEG+zgldv1qO3g3Z3Nsx
	L/iCyPpQpRIImJEtxb21O0zw+a42CLH9Ru54Fk=
X-Google-Smtp-Source: AGHT+IEKuRSYDRBEFcUoSaQJpuUMdlcesI/FHii7hOjk4oxM01a0EqmTFPiCYNu0z4GmlScnxLvw71vWU7C0gmCrYWM=
X-Received: by 2002:a05:651c:e0a:b0:333:faea:760e with SMTP id
 38308e7fff4ca-33650e28035mr29572141fa.4.1756126610386; Mon, 25 Aug 2025
 05:56:50 -0700 (PDT)
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
References: <cover.1756104334.git.christophe.leroy@csgroup.eu> <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 14:56:39 +0200
X-Gm-Features: Ac12FXyribtDrV6nGrkt8B-SxFaigB01Pq-K7rMjlp_S8j2j5Cn5-EuT5Gchlm4
Message-ID: <CAMRc=MfPTtdFtE63UKfbuK3h1mLEk2aUGazBsbRS-OLZzm7e9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] soc: fsl: qe: Change GPIO driver to a proper
 platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 25, 2025 at 8:53=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In order to be able to add interrupts to the GPIOs, first change the
> QE GPIO driver to the proper platform driver in order to allow
> initialisation to be done in the right order, otherwise the GPIOs
> get added before the interrupts are registered.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi! I retracted my review tag under v1 because...

[snip]

> -       return 0;
> +       qe_gc =3D devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
> +       if (!qe_gc)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&qe_gc->lock);
> +
> +       mm_gc =3D &qe_gc->mm_gc;
> +       gc =3D &mm_gc->gc;
> +
> +       mm_gc->save_regs =3D qe_gpio_save_regs;
> +       gc->ngpio =3D QE_PIO_PINS;
> +       gc->direction_input =3D qe_gpio_dir_in;
> +       gc->direction_output =3D qe_gpio_dir_out;
> +       gc->get =3D qe_gpio_get;
> +       gc->set =3D qe_gpio_set;
> +       gc->set_multiple =3D qe_gpio_set_multiple;
> +
> +       return of_mm_gpiochip_add_data(np, mm_gc, qe_gc);

... I believe this can be dropped now and replaced with
devm_gpiochip_add_data().

Bart

> +}
> +
> +static const struct of_device_id qe_gpio_match[] =3D {
> +       {
> +               .compatible =3D "fsl,mpc8323-qe-pario-bank",
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, qe_gpio_match);
> +
> +static struct platform_driver qe_gpio_driver =3D {
> +       .probe          =3D qe_gpio_probe,
> +       .driver         =3D {
> +               .name   =3D "qe-gpio",
> +               .of_match_table =3D qe_gpio_match,
> +       },
> +};
> +
> +static int __init qe_gpio_init(void)
> +{
> +       return platform_driver_register(&qe_gpio_driver);
>  }
> -arch_initcall(qe_add_gpiochips);
> +arch_initcall(qe_gpio_init);
> --
> 2.49.0
>

