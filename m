Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6992E74F86C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:35:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oEo8yqXL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0rg82HSxz3cJ6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 05:35:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oEo8yqXL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0l5q0yrGz30JF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 01:24:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 04CBD61548;
	Tue, 11 Jul 2023 15:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E26C433C8;
	Tue, 11 Jul 2023 15:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689089052;
	bh=nyE4suotIowU8lKnKt+Umw+WI2Pk9iMcLZepBf+apY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEo8yqXLBQcJ016nZmVI6o/nx3t9By5un0RV4fbIKnHDk0VPSpp+yaNMirBtqzWpT
	 bol75aJRCGOWCT+N9yMrkrQVwEwDB8XWpgODtk3yI+ILPLq5smsYwABPzHWMi/M7KG
	 kUQJPylWrx/7Ql611uTnEHF8Ca7MkikIUy5rcrlWGkGARPI3nHILM6AFuZYEin+imM
	 n1HaEaVU7q0NQmuz7v6I6ZbkSVwp4NjRBykveJpCllqGcxPS/L657fKrCDqE1FNaLz
	 6d5tD55ouC0ebYXHDNhkXWIbv52u/QY77xgQ0vpiUD4ePJr/j3HQZKSAuDU9No0IwC
	 1j5Imns1pImTQ==
Date: Tue, 11 Jul 2023 17:23:50 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v3 2/5] fs: Add fchmodat4()
Message-ID: <ZK10BmqxjL/Njbmj@example.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
 <83363cbb-2431-4520-81a9-0d71f420cb36@app.fastmail.com>
 <20230711-demolieren-nilpferd-80ffe47563ad@brauner>
 <ZK1QNRidZuGcfOSd@example.org>
 <20230711-verpennen-turnier-717bb9682e19@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711-verpennen-turnier-717bb9682e19@brauner>
X-Mailman-Approved-At: Wed, 12 Jul 2023 05:30:07 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>, heiko.carstens@de.ibm.com, stefan@agner.ch, ldv@altlinux.org, David Howells <dhowells@redhat.com>, Kim Phillips <kim.phillips@arm.com>, Paul Mackerras <paulus@samba.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, hare@suse.com, Florian Weimer <fweimer@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, firoz.khan@linaro.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <ma
 ttst88@gmail.com>, linux-mips@vger.kernel.org, gor@linux.ibm.com, fenghua.yu@intel.com, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, glebfm@altlinux.org, tycho@tycho.ws, Arnaldo Carvalho de Melo <acme@kernel.org>, schwidefsky@de.ibm.com, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, christian@brauner.io, rth@twiddle.net, Jens Axboe <axboe@kernel.dk>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 04:01:03PM +0200, Christian Brauner wrote:
> On Tue, Jul 11, 2023 at 02:51:01PM +0200, Alexey Gladkov wrote:
> > On Tue, Jul 11, 2023 at 01:52:01PM +0200, Christian Brauner wrote:
> > > On Tue, Jul 11, 2023 at 01:42:19PM +0200, Arnd Bergmann wrote:
> > > > On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> > > > > From: Palmer Dabbelt <palmer@sifive.com>
> > > > >
> > > > > On the userspace side fchmodat(3) is implemented as a wrapper
> > > > > function which implements the POSIX-specified interface. This
> > > > > interface differs from the underlying kernel system call, which does not
> > > > > have a flags argument. Most implementations require procfs [1][2].
> > > > >
> > > > > There doesn't appear to be a good userspace workaround for this issue
> > > > > but the implementation in the kernel is pretty straight-forward.
> > > > >
> > > > > The new fchmodat4() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
> > > > > unlike existing fchmodat.
> > > > >
> > > > > [1] 
> > > > > https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/fchmodat.c;h=17eca54051ee28ba1ec3f9aed170a62630959143;hb=a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> > > > > [2] 
> > > > > https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=718f363bc2067b6487900eddc9180c84e7739f80#n28
> > > > >
> > > > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > > > > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > > > 
> > > > I don't know the history of why we ended up with the different
> > > > interface, or whether this was done intentionally in the kernel
> > > > or if we want this syscall.
> > > > 
> > > > Assuming this is in fact needed, I double-checked that the
> > > > implementation looks correct to me and is portable to all the
> > > > architectures, without the need for a compat wrapper.
> > > > 
> > > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > The system call itself is useful afaict. But please,
> > > 
> > > s/fchmodat4/fchmodat2/
> > 
> > Sure. I will.
> 
> Thanks. Can you also wire this up for every architecture, please?
> I don't see that this has been done in this series.

Sure. I have already added in all architectures as far as I can tell:

$ diff -s <(find arch/ -name '*.tbl' |sort -u) <(git grep -lw fchmodat2 arch/ |sort -u)
Files /dev/fd/63 and /dev/fd/62 are identical

-- 
Rgrds, legion

