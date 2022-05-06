Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFED51DB4B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 16:57:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvtw84Sp9z3cCn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 00:57:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.173;
 helo=mail-qt1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvtvl3Zrbz2yHZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 00:57:22 +1000 (AEST)
Received: by mail-qt1-f173.google.com with SMTP id t16so6139201qtr.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 May 2022 07:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TFKDqxAl8kAhgchSspFlV1jC/a94gKje1e9uHi6vXps=;
 b=tDNEoB109PiNGPZcrC3At4w1E8m7uelTXkpvxmFm5naS/08TnQutJjFW+nsFAZWV+4
 WZUhV4ixG/yKT8GqJG5tbqgQYcDLLgmNeNql0ysgVZUdIbmqhheRXjHg97rXnyCKeNrJ
 muntDYUNxdUPLICXM68hcYzmrMJFyay8cXm6DID5B9w2mA/7oa7RsrFTVddiqbvpYAw9
 x4aChqP/0iPnZLUSuroNeu35+bhoAhKQz59O1C9Tyqb0lddckf9pbhqglCi3C4FtSW7M
 iW+vo/cWPM2VaaVELxXhaFa56gFv2TL+qYP/fabVHBDWiWNqyCdHPDcHrdeCehYZxbsx
 rLRQ==
X-Gm-Message-State: AOAM530rtiVDiK3ah+sKDj7nkAk687tZeJhNYdULOp17eZkZvilPjevt
 ASqqYjCgvUoKj/DeF1TpSSChKJ86+hWrmg==
X-Google-Smtp-Source: ABdhPJzn9gNmm8JxTuobbmScvU7tFQv77IsYfj2Odeqap/A8fotTkpDv+7hhOOwTIspJqCSi2PxBzA==
X-Received: by 2002:a05:622a:510:b0:2f3:81aa:cac2 with SMTP id
 l16-20020a05622a051000b002f381aacac2mr3078982qtx.679.1651849039836; 
 Fri, 06 May 2022 07:57:19 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 a26-20020ac84d9a000000b002f39b99f676sm2611065qtw.16.2022.05.06.07.57.18
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 07:57:19 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id y76so13335183ybe.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 May 2022 07:57:18 -0700 (PDT)
X-Received: by 2002:a05:6902:352:b0:63e:94c:883c with SMTP id
 e18-20020a056902035200b0063e094c883cmr2500583ybs.365.1651849027963; Fri, 06
 May 2022 07:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061412080.52331@angie.orcam.me.uk>
 <3669a28a055344a792b51439c953fd30@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 May 2022 16:56:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
Message-ID: <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
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
 David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Maciej,

On Fri, May 6, 2022 at 4:44 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Fri, 6 May 2022, David Laight wrote:
> > >  It was retrofitted in that x86 systems already existed for ~15 years when
> > > PCI came into picture.  Therefore the makers of the CPU ISA couldn't have
> > > envisaged the need for config access instructions like they did for memory
> > > and port access.
> >
> > Rev 2.0 of the PCI spec (1993) defines two mechanisms for config cycles.
> > #2 is probably the first one and maps all of PCI config space into
> > 4k of IO space (PCI bridges aren't supported).
>
>  This one is even more horrid than #1 in that it requires two separate
> preparatory I/O writes rather than just one, one to the Forward Register
> (at 0xcfa) to set the bus number, and another to the Configuration Space
> Enable Register (at 0xcf8) to set the function number, before you can
> issue a configuration read or write to a device.  So you need MP locking
> too.
>
>  NB only peer bridges aren't supported with this mechanism, normal PCI-PCI
> bridges are, via the Forward Register.
>
> > #1 requires a pair of accesses (and SMP locking).
> >
> > Neither is really horrid.
>
>  Both are.  First neither is MP-safe and second both are indirect in that
> you need to poke at some chipset registers before you can issue the actual
> read or write.
>
>  Sane access would require a single CPU instruction to read or write from
> the configuration space.  To access the conventional PCI configuration
> space in a direct linear manner you need 256 * 21 * 8 * 256 = 10.5MiB of
> address space.  Such amount of address space seems affordable even with
> 32-bit systems.

Won't have fit in the legacy 1 MiB space ("640 KiB...").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
