Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0477B428904
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 10:42:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSXNx4Hqrz2yNp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 19:42:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.47; helo=mail-ua1-f47.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSXNT5jQ3z2xXs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 19:42:16 +1100 (AEDT)
Received: by mail-ua1-f47.google.com with SMTP id a2so7572726uaq.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 01:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ILfhQ1xCyJpzVVyTRUeYiOGgGsjH3OkmEIE6ubpYA5A=;
 b=w6CERzSb+Zu9HFXy5V4f4fa8ps3lbN89eTAob5GUIf1+S/KOXmNv2fpfNSGPXfecUH
 /Mi9CoAkf2n+7FYpkp6huNMTesfgtYdS0G+5ssgDt0kRNgtr1JlG7u/r1Z9O96Yq0sAG
 TaoIrbpsVNKmMMNnFzahGzoTQ70A81kYeBenzdKSAit7B+EoX105NU6mQLejGOICQzKG
 RKHkbm3aA0Yq8QZmBTsuqFfWtGrWAFfFfFZT4SmwZyyJr7TKIKGxzurMSytOw7DI6B2F
 lskrc7kcp2H1ure0fUowM5Z9JpjASOmvPik+OhnpSP1kL54RzQaF1OcHPVx2KZNCyv+l
 i2Fg==
X-Gm-Message-State: AOAM531XxhVXrRODwS9E1OkZVXYfDaF8RKGTsjtx3vIFLhGZXaOlA/BC
 +BkCAiNxg/MxMteScdUEn/W585B0tXij4ekpxpQ=
X-Google-Smtp-Source: ABdhPJwa+ZKiDHz9Zuw89anDy7yDddQI/ykQ73DcJ03VPWJOB8v+U/bqxFKnAP+C/tFj6uQTW+VjIp5j6a2L9ifXyto=
X-Received: by 2002:ab0:538a:: with SMTP id k10mr13426605uaa.14.1633941731939; 
 Mon, 11 Oct 2021 01:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210928075216.4193128-1-arnd@kernel.org>
 <9dedf9bb-5377-9f2c-cbb1-2a57b40493da@molgen.mpg.de>
In-Reply-To: <9dedf9bb-5377-9f2c-cbb1-2a57b40493da@molgen.mpg.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Oct 2021 10:42:00 +0200
Message-ID: <CAMuHMdXspk27xd95YAsXa73ES8rfKxii3RUEtsBtxQTk9qLztA@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Simon Trimmer <simont@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 9, 2021 at 11:24 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> [Cc: +linuxppc-dev@lists.ozlabs.org]
>
> Am 28.09.21 um 09:50 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Compile-testing drivers that require access to a firmware layer
> > fails when that firmware symbol is unavailable. This happened
> > twice this week:
> >
> >   - My proposed to change to rework the QCOM_SCM firmware symbol
> >     broke on ppc64 and others.
> >
> >   - The cs_dsp firmware patch added device specific firmware loader
> >     into drivers/firmware, which broke on the same set of
> >     architectures.
> >
> > We should probably do the same thing for other subsystems as well,
> > but fix this one first as this is a dependency for other patches
> > getting merged.
> >

> With this change, I have the new entries below in my .config:
>
> ```
> $ diff -u .config.old .config
> --- .config.old 2021-10-07 11:38:39.544000000 +0200
> +++ .config     2021-10-09 10:02:03.156000000 +0200
> @@ -1992,6 +1992,25 @@
>
>   CONFIG_CONNECTOR=y
>   CONFIG_PROC_EVENTS=y
> +
> +#
> +# Firmware Drivers
> +#
> +
> +#
> +# ARM System Control and Management Interface Protocol
> +#
> +# end of ARM System Control and Management Interface Protocol
> +
> +# CONFIG_FIRMWARE_MEMMAP is not set
> +# CONFIG_GOOGLE_FIRMWARE is not set
> +
> +#
> +# Tegra firmware driver
> +#
> +# end of Tegra firmware driver
> +# end of Firmware Drivers
> +
>   # CONFIG_GNSS is not set
>   CONFIG_MTD=m
>   # CONFIG_MTD_TESTS is not set
> ```
>
> No idea if the entries could be hidden for platforms not supporting them.
>
>          ARM System Control and Management Interface Protocol  ----
>      [ ] Add firmware-provided memory map to sysfs
>      [ ] Google Firmware Drivers  ----
>          Tegra firmware driver  ----

GOOGLE_FIRMWARE should probably depend on something.
I highly doubt Google is running servers on e.g. h8300 and nds32.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
