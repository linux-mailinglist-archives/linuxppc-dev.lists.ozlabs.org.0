Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA8E51D6BD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 13:34:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvpPJ6WK2z3cDW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 21:34:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WWSZiZ6A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WWSZiZ6A; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvpNc22dgz3bbk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 21:33:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD1FCB83591
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 11:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C453C385B1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651836810;
 bh=mPb8Q8Ok2oNk7WAjedaRk8DoRYKS47EIw5ypxOHVuLY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WWSZiZ6Av+Csqa/4o5LVEuZFS3DJz7bi5gem/5b+fSqMF/bztOWB7Uv0UN6PKf1iR
 bIkeemtz1+eEPJSsxwshNfqV0neFGBEsrkdriS1XVQTfHCon4dlnzVssO79rvne83V
 WEsdFGEqAfFTTia1860HjAAZDFTA2MG5xtW85SdHUVN4/302qVZ7mV7/1f5rOoeLF7
 3Ib23+tQfIklwvq/B0nmy0PEdT9DYV74TS5IrYAW2P7K9UHk4o/CsMa0XoA2T/Z/sM
 FFRO2q3aPyOcC9hEPgHvpgVc8ahqS97LC9PLDio9DDKV6tmaNDNbmA/BFYZm1jQ8cK
 dteb9336iWplA==
Received: by mail-yb1-f172.google.com with SMTP id y2so12318755ybi.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 May 2022 04:33:30 -0700 (PDT)
X-Gm-Message-State: AOAM531+1rzq+DJWfQMqnkfhBX97usIGJDbJ8+VR9A8rdvp08cniGSuV
 44aViIGG4ZJN5CU5YUsSaHcm7QeDJ9Icz50lyh0=
X-Google-Smtp-Source: ABdhPJy5Vv8YTgA/+Yk25Xv8xMKQhcEw8LiqaQy/3bb0wg6KVBd/5y4hLeqVF7Zu5FslZtdBqz1tOtNTiterOIoDfDE=
X-Received: by 2002:a25:d3c2:0:b0:645:74df:f43d with SMTP id
 e185-20020a25d3c2000000b0064574dff43dmr1886331ybf.394.1651836798896; Fri, 06
 May 2022 04:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 6 May 2022 13:33:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
Message-ID: <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
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
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 6, 2022 at 12:20 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Thu, 5 May 2022, Arnd Bergmann wrote:
>  I think I'm missing something here.  IIUC we're talking about a PCI/PCIe
> bus used with s390 hardware, right?
>
>  (It has to be PCI/PCIe, because other than x86/IA-64 host buses there are
> only PCI/PCIe and EISA/ISA buses out there that define I/O access cycles
> and EISA/ISA have long been obsoleted except perhaps from some niche use.)
>
>  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> pattern put on the bus/in the TLP in the address phase.  So what is there
> inherent to the s390 architecture that prevents that different bit pattern
> from being used?

The hardware design for PCI on s390 is very different from any other
architecture, and more abstract. Rather than implementing MMIO register
access as pointer dereference, this is a separate CPU instruction that
takes a device/bar plus offset as arguments rather than a pointer, and
Linux encodes this back into a fake __iomem token.

>  If anything, I could imagine the same limitation as with current POWER9
> implementations, that is whatever glue is used to wire PCI/PCIe to the
> rest of the system does not implement a way to use said bit pattern (which
> has nothing to do with the POWER9 processor instruction set).
>
>  But that has nothing to do with the presence or absence of any specific
> processor instructions.  It's just a limitation of bus glue.  So I guess
> it's just that all PCI/PCIe glue logic implementations for s390 have such
> a limitation, right?

There are separate instructions for PCI memory and config space, but
no instructions for I/O space, or for non-PCI MMIO that it could be mapped
into.

       Arnd
