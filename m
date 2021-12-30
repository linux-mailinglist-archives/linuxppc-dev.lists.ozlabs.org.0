Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B51CE481A9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 09:02:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPgjt4rcCz3dp6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 19:02:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jV/ycMyo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jV/ycMyo; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPWQL3nV2z2yb6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 12:48:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64743615C5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 01:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E7BC36AF4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 01:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640828918;
 bh=81MO7TacqQe8I5ko0Q8CwbDD4h/99BabB8aCDnWo0lQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jV/ycMyovnmu9pbcNLGboBsGNIaWSzFTvzZh+Mx9BwCcRQ4wkFdLiGVgRkSKcn1av
 ACLs6uhvkNBtfi0XHerEvqHG9aDTvnP0DnkZJ23UYJg1+rpYpog6ujNkprLhWymjWQ
 hVule2DRwuMYA/yBJYRWrQwKgFOWg5pmJP5humJTKlsctrnxGtyKKZV5MSDWgxD4iF
 I5CuYOMx73K52jL6eCERvW0K/qJG/CffLHmjFLJmfkBjIdmKueJ2GntN8tpN5P6Axu
 +/iJu6EgjHsacUxqabHsXc98pimqrGXyEBPg4rn/eSXczdd7VTgu9//4yKsbFR5Bjg
 v0Y95G8jR3CDw==
Received: by mail-ed1-f47.google.com with SMTP id bm14so92430406edb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 17:48:38 -0800 (PST)
X-Gm-Message-State: AOAM530UFPRcUh0A4mk3BgHMt4dbN25TcQCO8L0zaNXcPlKgy/5LAywk
 nqxBnJFHePCUMc4rhdnaLeGVBYlgTVHN+TKH4v0=
X-Google-Smtp-Source: ABdhPJzYCdRT3l8EecUhPG5EkJz2cutHHKG9LloyzIQNKSKV94+pfG1Ig6YswCjGB6BOha4SzAwDhMxmrauWo4kartQ=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr22454231wru.12.1640828906053; 
 Wed, 29 Dec 2021 17:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
In-Reply-To: <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 29 Dec 2021 20:48:23 -0500
X-Gmail-Original-Message-ID: <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
Message-ID: <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 30 Dec 2021 18:58:16 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 John Garry <john.garry@huawei.com>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 28, 2021 at 11:15 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 29.12.2021 um 16:41 schrieb Arnd Bergmann:
> > On Tue, Dec 28, 2021 at 8:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> I'd hope not - we spent some effort to make sure setting ATARI_ROM_ISA
> does not affect other m68k platforms when e.g. building multiplatform
> kernels.

Ok

> Replacing inb() by readb() without any address translation won't do much
> good for m68k though - addresses in the traditional ISA I/O port range
> would hit the (unmapped) zero page.

Correct, this is exactly the problem that Niklas is trying to solve here:
we do have drivers that hit this bug, and on s390 clang actually produces
a compile-time error for drivers that cause a NULL pointer dereference
this way.

What some other architectures do is to rely on inb()/outb() to have a
zero-based offset, and use an io_offset in PCI buses to ensure that a
low port number on the bus gets translated into a pointer value for the
virtual mapping in the kernel, which is then represented as an unsigned
int.

As this is indistinguishable from architectures that just don't have
a base address for I/O ports (we unfortunately picked 0 as the default
PCI_IOBASE value), my suggestion was to start marking architectures
that may have this problem as using HAS_IOPORT in order to keep
the existing behavior unchanged. If m68k does not suffer from this,
making HAS_IOPORT conditional on those config options that actually
need it would of course be best.

         Arnd
