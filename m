Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32D4EAD34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 14:31:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSTT51rxxz3c03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 23:31:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rghn0NZ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=bgdev.pl
 (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=rghn0NZ7; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSTSQ0JQFz2x98
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 23:31:00 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id lr4so26375161ejb.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 05:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nRQGNy0JNeG8yPE1QXXWKqsK/KgT2iVgd9NOSAmnpao=;
 b=rghn0NZ7veo+c7F9TgovwmfTphDZN1nzJMzcXj5lds+VNPPlWVx4s9Km9UFuESnj9C
 0j6zPwG/Xf6D92JpGQDO2SsY514Cc3dispUkIKCGzRnO4C9HS7T9TWQ6L1NWItI9HoVR
 Wk/smMInsq69ioZO8yNZDu546rixqBUH1Q7RKjgyI+USlKpBx73H+Jxrz2inmb2EkToU
 H2vf7Sa/pckmLcWFoAxiMBDzr7UgHBsB2Q8hra4/Kl5ny0G8cLhgWaE+yEkyTutDGHt1
 d/7ehdh+gvbKH2tMg6SF+fI/PRBhqZLpgBB/Oz9YxV+MxEClGvdSUz2pl20OT0F+Mpvd
 d2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nRQGNy0JNeG8yPE1QXXWKqsK/KgT2iVgd9NOSAmnpao=;
 b=dXPy6fmAr3oSyl4WfSPlrohpQXqg/hJHsXvNSxl2VLuZDK5QlGq45TIS8fcKeRMmIg
 94URVIWP4PX38TNbYOhxfJDDI3t8WNH8p0jAsb9Irgoz5gKo1ynyCyThfEh5P7aG9Jik
 f1/gVMPuh96FyPeutFIR/KlSdtgReW49KF6xtD7GhYdKbZWhtE59owmaY3sC0J9RKoSE
 7a25vx0rzTXO08pqpbfQQAyUDCoWvvBDUbcR2zG5TxDatLlN+U/KKJOF8XulK9HWif+p
 CPOHrHe1f+Ky9T4YCYGH5w3D9X0y2wQBr8FRalQ2T1OVMt4glAeQKnzUAvMS6DdMHxct
 FHkA==
X-Gm-Message-State: AOAM533q+YxbTrz7yBOsRBMIWeR1JsdOihIvlbnqDrU+y7yCAXisBdb7
 xAWx1wyBX8wEp9dfidYeGaUpq1PQ3LJvCKAJ7C3kew==
X-Google-Smtp-Source: ABdhPJyPZNX8y3gOGfSZgg3AGAll74j9kjPNXJs0DTpnrEh1/wBVEgROdTkgglF1+DGDwH7nabIubcnQbpp8LiNpfow=
X-Received: by 2002:a17:907:d2a:b0:6e0:963c:97d9 with SMTP id
 gn42-20020a1709070d2a00b006e0963c97d9mr28430774ejc.736.1648557051475; Tue, 29
 Mar 2022 05:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-9-benni@stuerz.xyz>
In-Reply-To: <20220326165909.506926-9-benni@stuerz.xyz>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Mar 2022 14:30:40 +0200
Message-ID: <CAMRc=Md5qTnP1ZYak4f3hyqmaOR6jT_KL=rNr5cwAOcZ22yXfg@mail.gmail.com>
Subject: Re: [PATCH 09/22] gpio-winbond: Use C99 initializers
To: =?UTF-8?Q?Benjamin_St=C3=BCrz?= <benni@stuerz.xyz>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-atm-general@lists.sourceforge.net,
 linux-ia64@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 dave.hansen@linux.intel.com, linux-pci@vger.kernel.org, robert.moore@intel.com,
 laforge@gnumonks.org, alim.akhtar@samsung.com, hpa@zytor.com,
 wcn36xx@lists.infradead.org, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com,
 Linux Input <linux-input@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, Robert Richter <rric@kernel.org>,
 ajd@linux.ibm.com, Arnd Bergmann <arnd@arndb.de>, kvalo@kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 loic.poulain@linaro.org, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, linux@simtec.co.uk,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, devel@acpica.org,
 isdn@linux-pingi.de, Tony Luck <tony.luck@intel.com>, nico@fluxnic.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, netdev <netdev@vger.kernel.org>,
 fbarrat@linux.ibm.com, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 pali@kernel.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 26, 2022 at 6:00 PM Benjamin St=C3=BCrz <benni@stuerz.xyz> wrot=
e:
>
> This replaces comments with C99's designated
> initializers because the kernel supports them now.
>
> Signed-off-by: Benjamin St=C3=BCrz <benni@stuerz.xyz>
> ---
>  drivers/gpio/gpio-winbond.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-winbond.c b/drivers/gpio/gpio-winbond.c
> index 7f8f5b02e31d..0b637fdb407c 100644
> --- a/drivers/gpio/gpio-winbond.c
> +++ b/drivers/gpio/gpio-winbond.c
> @@ -249,7 +249,7 @@ struct winbond_gpio_info {
>  };
>
>  static const struct winbond_gpio_info winbond_gpio_infos[6] =3D {
> -       { /* 0 */
> +       [0] =3D {
>                 .dev =3D WB_SIO_DEV_GPIO12,
>                 .enablereg =3D WB_SIO_GPIO12_REG_ENABLE,
>                 .enablebit =3D WB_SIO_GPIO12_ENABLE_1,
> @@ -266,7 +266,7 @@ static const struct winbond_gpio_info winbond_gpio_in=
fos[6] =3D {
>                         .warnonly =3D true
>                 }
>         },
> -       { /* 1 */
> +       [1] =3D {
>                 .dev =3D WB_SIO_DEV_GPIO12,
>                 .enablereg =3D WB_SIO_GPIO12_REG_ENABLE,
>                 .enablebit =3D WB_SIO_GPIO12_ENABLE_2,
> @@ -277,7 +277,7 @@ static const struct winbond_gpio_info winbond_gpio_in=
fos[6] =3D {
>                 .datareg =3D WB_SIO_GPIO12_REG_DATA2
>                 /* special conflict handling so doesn't use conflict data=
 */
>         },
> -       { /* 2 */
> +       [2] =3D {
>                 .dev =3D WB_SIO_DEV_GPIO34,
>                 .enablereg =3D WB_SIO_GPIO34_REG_ENABLE,
>                 .enablebit =3D WB_SIO_GPIO34_ENABLE_3,
> @@ -294,7 +294,7 @@ static const struct winbond_gpio_info winbond_gpio_in=
fos[6] =3D {
>                         .warnonly =3D true
>                 }
>         },
> -       { /* 3 */
> +       [3] =3D {
>                 .dev =3D WB_SIO_DEV_GPIO34,
>                 .enablereg =3D WB_SIO_GPIO34_REG_ENABLE,
>                 .enablebit =3D WB_SIO_GPIO34_ENABLE_4,
> @@ -311,7 +311,7 @@ static const struct winbond_gpio_info winbond_gpio_in=
fos[6] =3D {
>                         .warnonly =3D true
>                 }
>         },
> -       { /* 4 */
> +       [4] =3D {
>                 .dev =3D WB_SIO_DEV_WDGPIO56,
>                 .enablereg =3D WB_SIO_WDGPIO56_REG_ENABLE,
>                 .enablebit =3D WB_SIO_WDGPIO56_ENABLE_5,
> @@ -328,7 +328,7 @@ static const struct winbond_gpio_info winbond_gpio_in=
fos[6] =3D {
>                         .warnonly =3D true
>                 }
>         },
> -       { /* 5 */
> +       [5] =3D {
>                 .dev =3D WB_SIO_DEV_WDGPIO56,
>                 .enablereg =3D WB_SIO_WDGPIO56_REG_ENABLE,
>                 .enablebit =3D WB_SIO_WDGPIO56_ENABLE_6,
> --
> 2.35.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
