Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D93A268F165
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 15:56:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBjkH5VDwz3f48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 01:56:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IIUuXKjb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IIUuXKjb;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBjjN5fsvz2yYt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 01:55:34 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id g2so22362497ybk.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Feb 2023 06:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C9FYaHZff0n04HIlu0pgHp/yoYQMAR6EN4kK+A76acU=;
        b=IIUuXKjbtNG+brYJkm3mEz/Fq2Pb+VqZxm9M/D7mrcI0D62GgsPuJzrGVbt3bjOgAe
         FKHgjDRBffBmgUhp+Zqa3GhW+SJYVkyXIOx4UZjGR/NTZwRH+8Ec9dhaymaPJYoDF/ul
         uhZIWfEjC/tNp17EsrH4ckdmUbeyIs5G5o9m7zp+yGzEj3sRZGfW5ns8qaXo3UmiN25P
         jXTHx/9TXUF8ZpeVstcTHKPqER+clJey1/KPBN1LViaw99zwQggNemG7kwAykjT9Ya89
         TEAScCGhuWQAgdfnh+kSg3K5nsReT9OKxs5o5HSi74s3waAxRJs36+1uPauU5VDw9KHc
         l0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9FYaHZff0n04HIlu0pgHp/yoYQMAR6EN4kK+A76acU=;
        b=D5CRFNx2yJEiDVnznw3LhsECDS4dUWEdKtuBu6ySA7T792gshBfFj/Kc+V0CS7bKzd
         I8iUpbK+hcFXUM5/9zOe9u+5pliuD9VKdUnVA9z96S9ItFVehC5EEkkgKvJnxI9O7tV2
         l6QtEf2+wv495gNHnHrM2dYgtx/CbIIYmpeKR/BAXlD4n1/nX0KRGptIMJEWDSMjfE2f
         Q6d5QSh4OB1/Zkwm7DMDVaTRnvOS6+YYtRe2lEMjuZomzYeOzUdC9c3MJHOjQOol9Lvf
         J8+F855VGG6kE5QO93S3KpruCq+HdKcsSo4zDVFFNg65j5szJllDO3ubOK5VcJH1LIg4
         8HHw==
X-Gm-Message-State: AO0yUKW4u3ImDL4HrLlEjZC53Gw3leo9ws8O3RCToAGIxeOn4+QOHLxe
	NOIodNxrbxGica0wjJ7sYad/rF6ALyqU2No+KFcePA==
X-Google-Smtp-Source: AK7set9QWN7XZu0/Jygke0mZWpl6dDT6sBRDV263lswVqW9oVhi8Kruq1x//EDsHd+Bda51X+66lj6ea/+9i3ige8Q4=
X-Received: by 2002:a5b:6c5:0:b0:88f:946:bd98 with SMTP id r5-20020a5b06c5000000b0088f0946bd98mr1003903ybq.24.1675868130850;
 Wed, 08 Feb 2023 06:55:30 -0800 (PST)
MIME-Version: 1.0
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
 <20230207142952.51844-7-andriy.shevchenko@linux.intel.com>
 <CACRpkdaPgjDijPjCdinWy5_Rd8g3idv-8K=YPTv5iTfJKFuJfw@mail.gmail.com>
 <Y+LWyc4rqCVq5hEi@smile.fi.intel.com> <Y+O2/dVDcvnXByc+@smile.fi.intel.com>
In-Reply-To: <Y+O2/dVDcvnXByc+@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 8 Feb 2023 15:55:19 +0100
Message-ID: <CACRpkdacHyxPKg=Dw4xdpOPZUMMNsFAuVRuSo1093E_j4a+W-Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] gpiolib: split linux/gpio/driver.h out of linux/gpio.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-sh@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Schmidt <stefan@datenfreihafen.org>, linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, linux-input@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, brcm80211-dev-list.pdl@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-doc-tw-discuss@lists.sourceforge.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 8, 2023 at 3:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Feb 08, 2023 at 12:55:06AM +0200, Andy Shevchenko wrote:
> > On Tue, Feb 07, 2023 at 03:55:23PM +0100, Linus Walleij wrote:
> > > On Tue, Feb 7, 2023 at 3:29 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > Almost all gpio drivers include linux/gpio/driver.h, and other
> > > > files should not rely on includes from this header.
> > > >
> > > > Remove the indirect include from here and include the correct
> > > > headers directly from where they are used.
> >
> > ...
> >
> > > Make sure you push this to the kernel.org build servers (zeroday builds),
> >
> > Of course, that is the purpose of publishing this before the release (so we
> > will have some TODO list that eventually this can be applied for v6.4-rc1).
> >
> > > I think this patch needs to hit some more files, in my tests with a similar
> > > patch at least these:
> >
> > Right. I forgot to also incorporate your stuff into this series.
> > Do you have anything that I can take as is?
>
> I'm going to incorporate the following:
>
>         gpio: Make the legacy <linux/gpio.h> consumer-only
>         ARM: s3c24xx: Use the right include
>         ARM: orion/gpio: Use the right include
>         hte: tegra-194: Use proper includes
>         pcmcia: pxa2xx_viper: Include dependency

Excellent, thanks. I don't care about being credited, just want things
to go smooth so you run into less snags.

Yours,
Linus Walleij
