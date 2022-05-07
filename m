Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04AB51E745
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 15:15:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwSbY47nbz3cCq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 23:15:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iDB5qYBi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iDB5qYBi; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwSZw1zPHz3bZC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 23:14:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92AC7611BE
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 13:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05179C385A9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651929285;
 bh=9uTgmNAvlTbzN50Cu5IwNYqzF7atwTKQUljfe2kjZUc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iDB5qYBiUdSDJDY3O1arHfq2ckrvDBaDIMlb7N58i6l8UufbIQONCWG8ZbwlwTljF
 KyZo/hhehnk7kRManj/hXE/Xf6ablwp6uaz3H+cBB4vBVPeAgH732SRJbXPv9Dr4k0
 S7zoxMWxBPrPYWsEJfLjGVmZbARPc6NzJX2LtXm+eLiMebx1S4KIEnelXP2SHvorOM
 eK4JRw+FZBI1rgbtWeqvQmurUOzyYr1JkAmvNV2ZlZyNux/dZ4x1R7e4c8ddbBifDP
 oQqQITpYOOXmUtpX0yuTadeMaMIgc907CguayKPAWLawKbG0wnf2Tss7SLDlp09t3c
 SAr9UQSbLHl0Q==
Received: by mail-yb1-f172.google.com with SMTP id f38so17353145ybi.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 May 2022 06:14:44 -0700 (PDT)
X-Gm-Message-State: AOAM5320NsZbhTFX0pVz5XzCPRZNzvb3atNnwEsuLUe9s204Yf/oLCgf
 qrFr+rnG2MoyzY+bXAGp4kR6REBGpesH5jEwpyo=
X-Google-Smtp-Source: ABdhPJxbpJWGFV6icMBoxijo70JK/8WaaDtoVIOoN93PiTf8ADZqw87+hT03oX7HblceCPV66kg3inBF049Gp/XoA2E=
X-Received: by 2002:a81:1697:0:b0:2fa:32f9:78c8 with SMTP id
 145-20020a811697000000b002fa32f978c8mr6670913yww.135.1651929273816; Sat, 07
 May 2022 06:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220505195342.GA509942@bhelgaas>
 <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org>
 <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com>
 <7dfa7578-039-e132-c573-ad89bd3215@linux-m68k.org>
In-Reply-To: <7dfa7578-039-e132-c573-ad89bd3215@linux-m68k.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 7 May 2022 15:14:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3tds8O+Gg2nF3MfrVVcmtLbtdQ2TnCJaDYz28cyhhWkg@mail.gmail.com>
Message-ID: <CAK8P3a3tds8O+Gg2nF3MfrVVcmtLbtdQ2TnCJaDYz28cyhhWkg@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To: Finn Thain <fthain@linux-m68k.org>
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

On Sat, May 7, 2022 at 2:01 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Fri, 6 May 2022, Niklas Schnelle wrote:
> > On Fri, 2022-05-06 at 19:12 +1000, Finn Thain wrote:
> > > On Thu, 5 May 2022, Bjorn Helgaas wrote:
> > > >
> > > > I mooted a s390 inb() implementation like "return ~0" because that's
> > > > what happens on most arches when there's no device to respond to the
> > > > inb().
> > > >
> > > > The HAS_IOPORT dependencies are fairly ugly IMHO, and they clutter
> > > > drivers that use I/O ports in some cases but not others.  But maybe
> > > > it's the most practical way.
> > > >
> > >
> > > Do you mean, "the most practical way to avoid a compiler warning on
> > > s390"? What about "#pragma GCC diagnostic ignored"?
> >
> > This actually happens with clang.
>
> That suggests a clang bug to me. If you believe GCC should behave like
> clang, then I guess the pragma above really is the one you want. If you
> somehow feel that the kernel should cater to gcc and clang even where they
> disagree then you would have to use "#pragma clang diagnostic ignored".

I don't see how you can blame the compiler for this. On architectures
with a zero PCI_IOBASE, an inb(0x2f8) literally becomes

        var = *(u8*)((NULL + 0x2f8);

If you run a driver that does this, the kernel gets a page fault for
the NULL page
and reports an Oops. clang tells you 'warning: performing pointer
arithmetic on a null pointer has undefined behavior', which is not exactly
spot on, but close enough to warn you that you probably shouldn't do this. gcc
doesn't warn here, but it does warn about an array out-of-bounds access when
you pass such a pointer into memcpy or another string function.

> > Apart from that, I think this would also fall under the same argument as
> > the original patch Linus unpulled. We would just paint over someting
> > that we know at compile time won't work:
> >
> > https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> >
>
> I wasn't advocating adding any warnings.
>
> If you know at compile time that a driver won't work, the usual solution
> is scripts/config -d CONFIG_SOME_UNDESIRED_DRIVER. Why is that no
> longer appropriate for drivers that use IO ports?

This was never an option, we rely on 'make allmodconfig' to build without
warnings on all architectures for finding regressions. Any driver that depends
on architecture specific interfaces must not get selected on architectures that
don't have those interfaces.

         Arnd
