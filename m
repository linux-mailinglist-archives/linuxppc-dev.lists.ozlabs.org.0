Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0322E428A17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 11:46:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSYq14Pk0z2ywc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 20:46:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hR14YdOB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hR14YdOB; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSYpL0S4jz2xXB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 20:46:17 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E39260F43
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633945575;
 bh=qRyh8ehsFmtn9ig4J8UbiRrew6heVcGUFCDbxxmKZf8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hR14YdOBybFf5arZDs0f5DTqL6oR83P1/SqbLyNrJwFHJBLTWaQazeIMc9uvTN1P8
 hAJqlZo6mlDfyVaItk+Gi7YQ6+xNmx+znUVD17u7+ezaHXrH34IV6jliAyYty27gK6
 2mJ0yYTHSWgVF+AO4LndCnRGcw4aDl9YdAaPanPAX3GDErqHtLO7iqAtTk0e2u7D6d
 7XHOe1RxkdihQ8rXcjEn1LyF918Jy6+gc6Tia4YX9/YFhMiQYAATwHxBriDyPRaPet
 xFver0G8OWX4Feq7uBsjBvSONLORuv0Fvdhgu6mrQdkDyNHT/6mP5a5/9dczhqsYKi
 kUx/6+qsAs0Cg==
Received: by mail-wr1-f54.google.com with SMTP id g25so7672169wrb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 02:46:15 -0700 (PDT)
X-Gm-Message-State: AOAM530A8sPI9ydGyvnPg+z9Mi6y76dcWro6qJQP7BVkig7keOCgaQ6T
 XJDbm6r8/qdQiRdF/NeKIOeOl28k3wc2y9Q77oU=
X-Google-Smtp-Source: ABdhPJyHs3mE6IoiFv5FE4vcliRHFQyxAEDWB/Wlg8v0WqzlUPkK8zWA+LhRJS54ay+HCTZiOLGsUmbAhjIFcqWae2k=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr23576993wra.428.1633945563612; 
 Mon, 11 Oct 2021 02:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210928075216.4193128-1-arnd@kernel.org>
 <9dedf9bb-5377-9f2c-cbb1-2a57b40493da@molgen.mpg.de>
 <CAMuHMdXspk27xd95YAsXa73ES8rfKxii3RUEtsBtxQTk9qLztA@mail.gmail.com>
In-Reply-To: <CAMuHMdXspk27xd95YAsXa73ES8rfKxii3RUEtsBtxQTk9qLztA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 11 Oct 2021 11:45:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3s5tu8MfdtXpoCeA8rrAUD3sscCMqLaoUVdUY9G-9AvQ@mail.gmail.com>
Message-ID: <CAK8P3a3s5tu8MfdtXpoCeA8rrAUD3sscCMqLaoUVdUY9G-9AvQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 Paul Menzel <pmenzel@molgen.mpg.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Simon Trimmer <simont@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

On Mon, Oct 11, 2021 at 10:42 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sat, Oct 9, 2021 at 11:24 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> > Am 28.09.21 um 09:50 schrieb Arnd Bergmann:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > +#
> > +# ARM System Control and Management Interface Protocol
> > +#
> > +# end of ARM System Control and Management Interface Protocol
> > +
> > +# CONFIG_FIRMWARE_MEMMAP is not set
> > +# CONFIG_GOOGLE_FIRMWARE is not set
> > +
> > +#
> > +# Tegra firmware driver
> > +#
> > +# end of Tegra firmware driver
> > +# end of Firmware Drivers
> > +
> >   # CONFIG_GNSS is not set
> >   CONFIG_MTD=m
> >   # CONFIG_MTD_TESTS is not set
> > ```
> >
> > No idea if the entries could be hidden for platforms not supporting them.
> >
> >          ARM System Control and Management Interface Protocol  ----
> >      [ ] Add firmware-provided memory map to sysfs
> >      [ ] Google Firmware Drivers  ----
> >          Tegra firmware driver  ----
>
> GOOGLE_FIRMWARE should probably depend on something.
> I highly doubt Google is running servers on e.g. h8300 and nds32.

GOOGLE_FIRMWARE is only the 'menuconfig' option that contains
the other options, but on architectures that have neither CONFIG_OF
nor CONFIG_ACPI, this is empty.  Most architectures of course
do support or require CONFIG_OF, so it's unclear whether we should
show the options for coreboot. Since it's a software-only driver, I
would tend to keep showing it, given that coreboot can be ported
to every architecture. The DT binding [1] seems to be neither
Google nor Arm specific.

CONFIG_FIRMWARE_MEMMAP in turn can be used for
anything that has memory hotplug, and in theory additional
drivers that register with this interface.

I'd lean towards "leave as is" for both, to avoid having to
change the dependencies again whenever something else
can use these.

        Arnd

[1] Documentation/devicetree/bindings/firmware/coreboot.txt
