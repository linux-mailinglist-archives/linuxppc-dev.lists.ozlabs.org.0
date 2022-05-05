Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2827E51C658
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 19:40:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvLZn0PQFz3brF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 03:40:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gDuRGk4U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gDuRGk4U; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvLZ73dlRz2y7K
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 03:40:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0741B61F04
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 17:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6F0C385B0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 17:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651772411;
 bh=2IoE4BfEuAg77WmuhMuImyNDvTFHhyYDFxiBCowXMW0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gDuRGk4UTOFgyiPRSSXBtXdg7RapyCYPQMe3RDG1agV2g91eoA8Rc96OoXhcxZktS
 iUqVfHohjgqHBdDDtxw5t6xJ9Nhm9sSAdlyGvUTs6m+xZUhtZqKl1GSzm0PLJcqji6
 Zwu22sg5c8SYB8EGXGM0c7T9GFi09LU2w9lyRv2qYfUyzADinYvcwB9oYxIjNKRSXB
 rJbPM+FqCEOPUai83HD9yI1FPF1fml1W/bN4kUJP38WtlPPBBIi5VUu91BjitmDOp7
 5K3I4ZAYpbF0sj+30Pw4r5dr3PVF7qz49AwnJbcV/PZGH4xcfoqBLRAey6ism0Mvsj
 /lk9y6IRiCqfg==
Received: by mail-wm1-f50.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so3062203wme.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 May 2022 10:40:11 -0700 (PDT)
X-Gm-Message-State: AOAM531NtdnPGDmB42cUEDaHM0K1AjT358Z4TUFgILCspwodJvoy3mag
 5wVj4oloh2OgjXL6I73QvsX9CkqQ9mUIUbKMZ2s=
X-Google-Smtp-Source: ABdhPJxtMhUha7a+dwpeZyyg5w+ON9JC8vKB6RB8veyDWjdr1D7VRDLkqvJBk615pYcXmnWu5kgj+KPCSrbSxhVU2uo=
X-Received: by 2002:a7b:cc93:0:b0:394:2622:fcd9 with SMTP id
 p19-20020a7bcc93000000b003942622fcd9mr6321312wma.20.1651772399229; Thu, 05
 May 2022 10:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
In-Reply-To: <20220505161028.GA492600@bhelgaas>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 5 May 2022 19:39:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
Message-ID: <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To: Bjorn Helgaas <helgaas@kernel.org>
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
 linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
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

On Thu, May 5, 2022 at 6:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> >
> > The main goal is to avoid c), which is what happens on s390, but
> > can also happen elsewhere. Catching b) would be nice as well,
> > but is much harder to do from generic code as you'd need an
> > architecture specific inline asm statement to insert a ex_table
> > fixup, or a runtime conditional on each access.
>
> Or s390 could implement its own inb().
>
> I'm hearing that generic powerpc kernels have to run both on machines
> that have I/O port space and those that don't.  That makes me think
> s390 could do something similar.

No, this is actually the current situation, and it makes absolutely no
sense. s390 has no way of implementing inb()/outb() because there
are no instructions for it and it cannot tunnel them through a virtual
address mapping like on most of the other architectures. (it has special
instructions for accessing memory space, which is not the same as
a pointer dereference here).

The existing implementation gets flagged as a NULL pointer dereference
by a compiler warning because it effectively is.

powerpc kernels generally map the I/O space into a section of the
physical address space, where it gets mapped into a fixed virtual
address and accessed through pointer dereference. This works on
any powerpc CPU as long as it is implemented in the PCI host
bridge in the usual way. The only difference between powerpc and
arm here is that there are fewer implementations, so one can
make assumptions about which PCI host bridge is used based on
a CPU core.

     Arnd
