Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E69056DD5F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 10:50:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwfgx6JYDz3fCj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 18:50:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.173; helo=mail-yw1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwfgS70Kfz3c7X
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 18:50:28 +1000 (AEST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5491fa028adso469056817b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 01:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681203025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XsMmfYvpqHWFGERwzpiHyCVbGoq54hxk7fbEhr0Ujk=;
        b=wsxZk2J9CtKLFDaXtTSL/bqCzauLjL6X8NXbqATAqSF+Yx7o8xYlN+pLeyYvtOsXaV
         d48UxhcQIQB/uLo9Et5Pi7W4ykcfqJa+m1hdUGkOMTEpEo2c1v4AiK0JYq2h9WAWNzg/
         upB1IFHznYogqC/sceJCGkRvZngwn81+KRpopKVSmboi1WECJVKNlMR5Ni4E0ki9RIaS
         POcaGEDXQHtqjuveDkUU83BaTeFt04SxieLp97PdvNFPb+iJR3M5G45rAtQrXxnrXke7
         d39RnoMCAQ3lx+l8PkoKXrHHqTFSQQLz5cuJol/zlDev9zPb88H6sCagnPcA33vh0dtN
         xqoA==
X-Gm-Message-State: AAQBX9fwBK6bQD4gnBaC5W/ugRWclMGGx7Hs6OWAaeULuUYxLWOSUSg3
	JaDiR/YcCw/MRzEvSvXHvcviYCAOFp+ZNA==
X-Google-Smtp-Source: AKy350a+SXyws1VP4Sk+hapNpTATUCP/5YeuVpUPGmwzlj4oQerkq9f9OekX3ECwt1wZQK+LJ3piVQ==
X-Received: by 2002:a81:9a93:0:b0:54f:223b:3cf6 with SMTP id r141-20020a819a93000000b0054f223b3cf6mr4412001ywg.7.1681203025602;
        Tue, 11 Apr 2023 01:50:25 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id bo5-20020a05690c058500b00545a08184fesm3307932ywb.142.2023.04.11.01.50.25
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:50:25 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-54ee108142eso147725487b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 01:50:25 -0700 (PDT)
X-Received: by 2002:a81:bc08:0:b0:54e:e490:d190 with SMTP id
 a8-20020a81bc08000000b0054ee490d190mr1268334ywi.4.1681203004780; Tue, 11 Apr
 2023 01:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230323163354.1454196-1-schnelle@linux.ibm.com>
 <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
 <B1EC1AC7-6BB5-4B66-B171-24687C3CBFB3@zytor.com> <d8686aaf-f12e-446b-9a80-335bb4266a4d@app.fastmail.com>
 <ccff565cde1440b8bff92d96f94a32b5@AcuMS.aculab.com>
In-Reply-To: <ccff565cde1440b8bff92d96f94a32b5@AcuMS.aculab.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:49:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe+U3yOOfy+z19apZaT0q7WhrR2beR=t0Jkbd3ODYbyw@mail.gmail.com>
Message-ID: <CAMuHMdWe+U3yOOfy+z19apZaT0q7WhrR2beR=t0Jkbd3ODYbyw@mail.gmail.com>
Subject: Re: [PATCH v4] Kconfig: introduce HAS_IOPORT option and select it as necessary
To: David Laight <David.Laight@aculab.com>
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
Cc: "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, Huacai Chen <chenhuacai@kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Rich Felker <dalias@libc.org>, "H. Peter Anvin" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Linux-Arch <linux-arch@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.osdn.me>, Russell King <linux@armlinux.org.uk>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com
 >, Alan Stern <stern@rowland.harvard.edu>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-mips@vger.kernel.org" <
 linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi David,

On Wed, Apr 5, 2023 at 11:37=E2=80=AFPM David Laight <David.Laight@aculab.c=
om> wrote:
> From: Linuxppc-dev Arnd Bergmann
> > Sent: 05 April 2023 21:32
> >
> > On Wed, Apr 5, 2023, at 22:00, H. Peter Anvin wrote:
> > > On April 5, 2023 8:12:38 AM PDT, Niklas Schnelle <schnelle@linux.ibm.=
com> wrote:
> > >>On Thu, 2023-03-23 at 17:33 +0100, Niklas Schnelle wrote:
> > >>> We introduce a new HAS_IOPORT Kconfig option to indicate support fo=
r I/O
> > >>> Port access. In a future patch HAS_IOPORT=3Dn will disable compilat=
ion of
> > >>> the I/O accessor functions inb()/outb() and friends on architecture=
s
> > >>> which can not meaningfully support legacy I/O spaces such as s390.
> > >>> >>
> > >>Gentle ping. As far as I can tell this hasn't been picked to any tree
> > >>sp far but also hasn't seen complains so I'm wondering if I should se=
nd
> > >>a new version of the combined series of this patch plus the added
> > >>HAS_IOPORT dependencies per subsystem or wait until this is picked up=
.
> > >
> > > You need this on a system supporting not just ISA but also PCI.
> > >
> > > Typically on non-x86 architectures this is simply mapped into a memor=
y window.
> >
> > I'm pretty confident that the list is correct here, as the HAS_IOPORT
> > symbol is enabled exactly for the architectures that have a way to
> > map the I/O space. PCIe generally works fine without I/O space, the
> > only exception are drivers for devices that were around as early PCI.
>
> Isn't there a difference between cpu that have inb()/outb() (probably
> only x86?) and architectures (well computer designs) that can generate
> PCI 'I/O' cycles by some means.
> It isn't even just PCI I/O cycles, I've used an ARM cpu (SA1100)
> that mapped a chuck of physical address space onto PCMCIA I/O cycles.
>
> If the hardware can map a PCI 'IO' bar into normal kernel address
> space then the bar and accesses can be treated exactly like a memory bar.
> This probably leaves x86 as the outlier where you need (IIRC) io_readl()
> and friends that can generate in/out instructions for those accesses.
>
> There are also all the x86 ISA devices which need in/out instructions.
> But (with the likely exception of the UART) they are pretty much
> platform specific.
>
> So, to my mind at least, HAS_IOPORT is just the wrong question.

Not all PCI controllers support mapping the I/O bar in MMIO space, so
in general you cannot say that CONFIG_PCI=3Dy means CONFIG_HAS_IOPORT=3Dy.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
