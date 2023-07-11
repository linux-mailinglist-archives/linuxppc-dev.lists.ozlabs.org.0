Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E49B274F866
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:31:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fUjSfsi7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0rbK5jYfz3cH2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 05:31:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fUjSfsi7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0gjP2gp0z30XQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 22:51:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9147E614BE;
	Tue, 11 Jul 2023 12:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555A7C433C7;
	Tue, 11 Jul 2023 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689079879;
	bh=v+qEn9CoklXqxP1Sa+MFkzpKjgr7E+g5iZSiirA+nSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUjSfsi7J0u/QQbtQMCDtiEKTIE7W5W0WBpPNSQMzTFUcRkYSb04jbHJs21fv800g
	 EThrQaUqs7NsBFe05IcCLgYzLYXYWoW8KeI98C2YcabyFUIYGnWFvDeTxCtiBR76jr
	 w/Zr0d0700gwvjaTe1JlnCUhU8AS5VndNnODqvgRp53hJh/zIs47unszqpTHBzrQaK
	 1xiXUMMc6WfSsUWm4s9ZEif1kEg2vCGCmP2azN/sbKPrUei4Ggr2CXmDG8Mzu44IK0
	 429B8vdVSRgfpn5E02EAVJjTXmzixyzoj9+S/Iq6iOYedIetr84v91WQhSf1jA/jj4
	 7ALpPYBl5adoQ==
Date: Tue, 11 Jul 2023 14:51:01 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v3 2/5] fs: Add fchmodat4()
Message-ID: <ZK1QNRidZuGcfOSd@example.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
 <83363cbb-2431-4520-81a9-0d71f420cb36@app.fastmail.com>
 <20230711-demolieren-nilpferd-80ffe47563ad@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711-demolieren-nilpferd-80ffe47563ad@brauner>
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

On Tue, Jul 11, 2023 at 01:52:01PM +0200, Christian Brauner wrote:
> On Tue, Jul 11, 2023 at 01:42:19PM +0200, Arnd Bergmann wrote:
> > On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> > > From: Palmer Dabbelt <palmer@sifive.com>
> > >
> > > On the userspace side fchmodat(3) is implemented as a wrapper
> > > function which implements the POSIX-specified interface. This
> > > interface differs from the underlying kernel system call, which does not
> > > have a flags argument. Most implementations require procfs [1][2].
> > >
> > > There doesn't appear to be a good userspace workaround for this issue
> > > but the implementation in the kernel is pretty straight-forward.
> > >
> > > The new fchmodat4() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
> > > unlike existing fchmodat.
> > >
> > > [1] 
> > > https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/fchmodat.c;h=17eca54051ee28ba1ec3f9aed170a62630959143;hb=a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> > > [2] 
> > > https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=718f363bc2067b6487900eddc9180c84e7739f80#n28
> > >
> > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > 
> > I don't know the history of why we ended up with the different
> > interface, or whether this was done intentionally in the kernel
> > or if we want this syscall.
> > 
> > Assuming this is in fact needed, I double-checked that the
> > implementation looks correct to me and is portable to all the
> > architectures, without the need for a compat wrapper.
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> The system call itself is useful afaict. But please,
> 
> s/fchmodat4/fchmodat2/

Sure. I will.

> With very few exceptions we don't version by argument number but by
> revision and we should stick to one scheme:
> 
> openat()->openat2()
> eventfd()->eventfd2()
> clone()/clone2()->clone3()
> dup()->dup2()->dup3() // coincides with nr of arguments
> pipe()->pipe2() // coincides with nr of arguments
> renameat()->renameat2()
> 

-- 
Rgrds, legion

