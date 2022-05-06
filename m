Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FAA51DB61
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 17:02:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvv270DbDz3cHl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 01:02:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.47; helo=mail-oa1-f47.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvv1j2BR6z3bZC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 01:02:32 +1000 (AEST)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-edeb6c3642so7468713fac.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 May 2022 08:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T95DKyI860o0Ni6h4dJD+E7diEEpmm2y8EkaKK0YMZc=;
 b=aunC/ite0C6izG1Ounf1t5N4TmGKneV+15yP2d0w1S6guqEUEvoQRM0SmGRr2jCjw7
 aLH+ieGPCVxRVoAUP6+zxRkB0XoM9GSr1cOx3EN5FbzWMhYZdlfKXM38Ai/Ak8/NBC2A
 CjBiUkXP+9k9JsjW3qFxXjFPzzUZNTBnQE3imoFjnlo/eMG9Dxyu3CQDaaKwB5tvpwZD
 iFzWWvtGLIIYNLjRhHwqkiBQKy61MQgkULP7GBg0ZJnPpuCJqcVA++sRP9AOJY2LixVh
 NDN07zmym8DZQJyhshPAZUVxRoW347vUtE0QZD9IkJL2ltwsFiUpe79o1e549YzkZnWD
 VJSQ==
X-Gm-Message-State: AOAM533x1IH9wr0yl5T1PSCi5BZEgrWlOfRXVz9aCKY3ibLPFW4IUHst
 3/OlMhh8kLmx9WPqXoL2gG3ygoR6mBf1rw==
X-Google-Smtp-Source: ABdhPJw0EIfwP+E5DM+q7A++dO9ESJONswCsjtpaFsHUx67vuiiMvtuxg8WwSFWz/bfjv2eS0fEvGA==
X-Received: by 2002:a05:6870:ed8d:b0:ee:468e:3c64 with SMTP id
 fz13-20020a056870ed8d00b000ee468e3c64mr53628oab.179.1651849350252; 
 Fri, 06 May 2022 08:02:30 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
 [209.85.210.47]) by smtp.gmail.com with ESMTPSA id
 s43-20020a4a96ae000000b0035eb4e5a6cbsm2025118ooi.33.2022.05.06.08.02.29
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 08:02:29 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id
 z15-20020a9d65cf000000b00605f064482cso5095273oth.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 May 2022 08:02:29 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr2817893ybu.604.1651849338111; Fri, 06
 May 2022 08:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
 <62c1bf6687ac4abc98d4015852930241@AcuMS.aculab.com>
In-Reply-To: <62c1bf6687ac4abc98d4015852930241@AcuMS.aculab.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 May 2022 17:02:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1HpUNKdZDqd0e5BKfr-FqGrwGJJ_xTKw5Z55bdEJa+Q@mail.gmail.com>
Message-ID: <CAMuHMdV1HpUNKdZDqd0e5BKfr-FqGrwGJJ_xTKw5Z55bdEJa+Q@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To: David Laight <David.Laight@aculab.com>
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:IA64 \(Itanium\) PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci <linux-pci@vger.kernel.org>,
 Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Arnd Bergmann <arnd@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi David

On Fri, May 6, 2022 at 4:05 PM David Laight <David.Laight@aculab.com> wrote:
> From: Geert Uytterhoeven
> > Sent: 06 May 2022 14:09
> > > The same is really true for other bus type - including ISA and EISA.
> > > (Ignoring the horrid of probing ISI bus devices - hopefully they
> > > are in the ACPI tables??_
> > > If a driver is probed on a ISA bus there ought to be functions
> > > equivalent to pci_ioremap() (for both memory and IO addresses)
> > > that return tokens appropriate for the specific bus.
> > >
> > > That is all a different load of churn.
> >
> > A loooong time ago,  it was suggested to add register accessor
> > functions to struct device, so e.g. readl(dev, offset) would call
> > into these accessors, which would implement the bus-specific behavior.
> > No more worries about readl(), __raw_readl(), ioread32b(), or whatever
> > quirk is needed, at the (small on nowadays' machines) expense of
> > some indirection...
>
> I was just thinking that the access functions might need a 'device'.
> Although you also need the BAR (or equivalent).
> So readl(dev, bar_token, offset) or readl(dev, bar_token + offset).

Note that we do have such a system: regmap.

> Clearly the 'dev' parameter could be compiled out for non-DEBUG
> build on x86 - leaving the current(ish) object code.

Assumed all devices are PCI devices.
E.g. USB devices would still need the indirection.

> You don't want an indirect call (this year), but maybe real
> function call and a few tests won't make that much difference.
> They might affect PCIe writes, but PCIe reads are so slow you
> need to avoid them whenever possible.
> I've not timed reads into something like an ethernet chip,
> but into our fpga they are probably 1000 clocks+.
>
> OTOH I wouldn't want any overhead on the PIO fifo reads
> on one of our small ppc devices.
> We push a lot of data though that fifo and anything extra
> would kill performance.

Right.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
