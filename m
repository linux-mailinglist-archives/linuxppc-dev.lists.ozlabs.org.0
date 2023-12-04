Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00672803C96
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 19:16:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bXyl5/vp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkX1T3Gd0z3d8W
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 05:16:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bXyl5/vp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkX0c47sXz2xdf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 05:16:00 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-67a934a5b7eso25312776d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Dec 2023 10:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701713757; x=1702318557; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrXoxXZcL5o0bwmshlpciFrBa2ROqvh7a5sct4i1UKg=;
        b=bXyl5/vp0Nxx9pilp9wAEbr2FnxXXRW5guc12XWkj/x//RHNU6r1SsjjcWySZbczbg
         QaM56ZeZy3emq8Zj9MDUxjA5vgpQawV7qgk/chfrSH5sJv7nWgEX7kbb2cy+n+7O61y5
         ZidSqWEBRJstn9iikjCKR5Gk30np/3G6QPGu/YWJktv5lcLnNruLxN9kM0++CFi30rSr
         V6H+e5ncY8i6Ice30x4Smt+w2hYdHdRqE6ck0efzH1ut1yNcTMSUSv1CVDFRctVibQTm
         p7iJLv4wECneUYW87G925UaUV9DHQrZ9Hh5ruXjfHOZHM4ZC6XR4bYrlXWxNl8aBTAXp
         938Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701713757; x=1702318557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrXoxXZcL5o0bwmshlpciFrBa2ROqvh7a5sct4i1UKg=;
        b=tatpFCzxPFa7je8e+HHF70GkK0NotkQUVoNRy+0CpW2B/i88OkXVgZUG6KgwzzUXob
         rDwU0a4Ln/O3fI0xeWAKUpzWZF/J3UB+h2pDB/gDiWEpMhR1bzJ0J3EB9+9zuhOYVCUY
         7ErBy2SzR5Y0d7aqkTcq+WsSL/vRdmQqD7H3bq4maQek8Rnnpa385jnHyDCxraP4wiA3
         Lll5syY3Z+RSpP+kjPGApTlop1aEewb1SD3JQ+qjQW4NE5lqDFHAx2hFbxvWXvo99gxC
         +YRsa5JeiI0O6VzybRyzapbV/S5Ap5xRWSMhS+4qjzK1eCM81wNnxSNL43fZsu6QLK6T
         Lweg==
X-Gm-Message-State: AOJu0YxcTTVCoB09q2msH6pL7mP89jcnmd5R52/tiw/0OGM5+DsXGmiG
	5hJ6C1WSatTb6n9cif2WAY2qictu7tLNDCODda0=
X-Google-Smtp-Source: AGHT+IEjajfDd9RKlx7gFUwETBFW3qgAL1nJLNuT4J6PaOtDNdIF8ZKAVyxaqgT8rgBPT4oZQm5GDMnO9BQ+GnLJeQ0=
X-Received: by 2002:a05:6214:1409:b0:67a:96c7:4c90 with SMTP id
 pr9-20020a056214140900b0067a96c74c90mr5715457qvb.38.1701713757080; Mon, 04
 Dec 2023 10:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20231204180603.470421-1-gnstark@salutedevices.com> <20231204180603.470421-4-gnstark@salutedevices.com>
In-Reply-To: <20231204180603.470421-4-gnstark@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Dec 2023 20:15:21 +0200
Message-ID: <CAHp75VeQ86JnDF=nJ_AK5zTPB7BkOvn9wU+GottY_PV7JHzGTg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] leds: aw2013: use devm API to cleanup module's resources
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

> +static void aw2013_chip_disable_action(void *data)
> +{
> +       struct aw2013 *chip =3D (struct aw2013 *)data;
> +
> +       aw2013_chip_disable(chip);
> +}

As with mutex release, this also can be oneliner

static void aw2013_chip_disable_action(void *chip)
{
       aw2013_chip_disable(chip);
}

...

> +       if (devm_mutex_init(&client->dev, &chip->mutex))
> +               return -ENOMEM;

Shouldn be

       ret =3D devm_mutex_init(&client->dev, &chip->mutex);
       if (ret)
           return ret;

?

> +               return -ENOMEM;

--=20
With Best Regards,
Andy Shevchenko
