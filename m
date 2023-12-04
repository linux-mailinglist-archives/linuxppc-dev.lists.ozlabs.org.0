Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75993803CA5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 19:17:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R/kjo27K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkX2f6vDMz3vfm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 05:17:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R/kjo27K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkX1q5ZFPz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 05:17:03 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-679dd3055faso28686886d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Dec 2023 10:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701713820; x=1702318620; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKrXivUU4s4Ix2KPkaOEslUQnUKTTONTEc2Vza38tik=;
        b=R/kjo27K1r3Lr9a7jyySPrID5EXhy6eLEXmRnJ9EdUoMaMmXeZ3VQNw+3G8wWEd6aD
         /9V3yu0RE06WtH16Ddnrex2mesSQqtWSA6EAHKFGxijsjMewKdTFNau4/ZjIKLFUm8eJ
         td6ZG4DzR/rCIKx9c7qsdSJcchZGQtelZu8H33aYhZEkmsIWUxGID9gJWjekkcu0XeI9
         HAquZprmxUgwKkXMQdVNiIpiYD0fMKZYx2LqSyGX0V6VSoifB3tdxSMZ29pCkHCvGFxb
         faEzlmSTYbd6yxQBNwZc6JyVEPq35SzS7ouML396xjS5h+SRuh0l2gghsZscLA21QON1
         xnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701713820; x=1702318620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKrXivUU4s4Ix2KPkaOEslUQnUKTTONTEc2Vza38tik=;
        b=E11o3ELaGXPYqiQ5FrL+M+ZjBs+owZcz91nGFpI9TnYFcjs7YflMVGd0UnhckAzhwS
         XcjD8BZMj71GKpCTGXInux9MLJWK6BjF/mwuPPSN8A0mK1JziCYkNa41se8PUXZxZKgy
         a2OwvCt9cKCA9Ju2tQW38wVTR6XWdQk7TersA5EqC9p9AToXscO/ioAfWIEONDOhjCaS
         qbU1UNy/gSXKcjfRrcRsfXmcsl56vcFEuHCAHJcNPgdygSIJ9aZj+GK7N0qAxehDvNz7
         C4QWmetP9dFy9s4l5DXOnluIX4JDjk9F/Z42JoUoKHcqA90KMXjFu9TlzORGKGt0cPZ5
         G91A==
X-Gm-Message-State: AOJu0YxLklPDmyQisk6RSIV0js/F3yDmzD5aIGgFyi3UP2U7HV4wSpD1
	EyTg/MlQnL5hXsj2MjjrS0xiaYDFZ69U0kf0YsOB2K2Nzuk=
X-Google-Smtp-Source: AGHT+IENXN54JfD+GXTqScuy8jrajcws4TOEJiG6ht7UYF6f/npWH1zpa4uDEUtYwikXtEemxs1oijBNhnLkIElizdQ=
X-Received: by 2002:a0c:fec7:0:b0:67a:cafa:ce13 with SMTP id
 z7-20020a0cfec7000000b0067acaface13mr1629751qvs.53.1701713820408; Mon, 04 Dec
 2023 10:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20231204180603.470421-1-gnstark@salutedevices.com> <20231204180603.470421-5-gnstark@salutedevices.com>
In-Reply-To: <20231204180603.470421-5-gnstark@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Dec 2023 20:16:24 +0200
Message-ID: <CAHp75VeNhGFtmjQOR5K52bmb3t6ufqtMoS-1mLkk_swDgO+-gg@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] leds: aw200xx: use devm API to cleanup module's resources
To: George Stark <gnstark@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, kernel@salutedevices.com, lee@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, hdegoede@redhat.com, pavel@ucw.cz, linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 4, 2023 at 8:07=E2=80=AFPM George Stark <gnstark@salutedevices.=
com> wrote:
>
> In this driver LEDs are registered using devm_led_classdev_register()
> so they are automatically unregistered after module's remove() is done.
> led_classdev_unregister() calls module's led_set_brightness() to turn off
> the LEDs and that callback uses resources which were destroyed already
> in module's remove() so use devm API instead of remove().

...

> +static void aw200xx_chip_reset_action(void *data)
> +{
> +       const struct aw200xx *chip =3D (struct aw200xx *)data;
> +
> +       aw200xx_chip_reset(chip);
> +}
> +
> +static void aw200xx_disable_action(void *data)
> +{
> +       const struct aw200xx *chip =3D (struct aw200xx *)data;
> +
> +       aw200xx_disable(chip);
> +}

They can be made oneliners.

...

> +       if (devm_mutex_init(&client->dev, &chip->mutex))
> +               return -ENOMEM;

Do not shadow the real error code.

--=20
With Best Regards,
Andy Shevchenko
