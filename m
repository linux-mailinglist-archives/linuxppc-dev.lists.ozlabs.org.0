Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF8F7637FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 15:47:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iLrm54/O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9wDj6byMz3cHr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 23:47:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iLrm54/O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9wCp0XH5z2yVb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 23:46:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3D2861AC3;
	Wed, 26 Jul 2023 13:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A6EC433C7;
	Wed, 26 Jul 2023 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690379171;
	bh=YMmxomfMr9G4i/xBDFo8a+tJ6BzX3X5lQtLwpyL37dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLrm54/OyVAkeX7XRTdQI6vJKk7fvA9E8WFuxeM1GUgON2oCeY1wjM8yTYrtIi4IQ
	 Oo3FMgcMnRzknsY84kWAeTJ0inxm7fg97Q/tOUTzG6ZMmI5ATwnzUC945HbXcM2RRW
	 HKanW7qmiSF3lCZhc3wQfBbpJJOtev2Fm0SsXZJptqvFFvEwrKyC1aKGldedLK/9Vz
	 62DImdurXvwbmhgOteOs/aXLApFhcpwiLDIG+sQUeQFLsagl1k2OVSVn88v78BFAcl
	 Vj6NEoPbw1eyE9ZIq7xYhoiahGzuo+q0Lii/UprIQXPLwFPgjeIIKj3g1kimIqX0ng
	 b/060n7yg03AQ==
Date: Wed, 26 Jul 2023 15:45:56 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Message-ID: <ZMEjlDNJkFpYERr1@example.org>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, Palmer Dabbelt <palmer@sifive.com>, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, fweimer@redhat.com, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, James.Bottomley@hansenpartnership.com, monstr@m
 onstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 26, 2023 at 02:36:25AM +1000, Aleksa Sarai wrote:
> On 2023-07-11, Alexey Gladkov <legion@kernel.org> wrote:
> > On the userspace side fchmodat(3) is implemented as a wrapper
> > function which implements the POSIX-specified interface. This
> > interface differs from the underlying kernel system call, which does not
> > have a flags argument. Most implementations require procfs [1][2].
> > 
> > There doesn't appear to be a good userspace workaround for this issue
> > but the implementation in the kernel is pretty straight-forward.
> > 
> > The new fchmodat2() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
> > unlike existing fchmodat.
> > 
> > [1] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/fchmodat.c;h=17eca54051ee28ba1ec3f9aed170a62630959143;hb=a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> > [2] https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=718f363bc2067b6487900eddc9180c84e7739f80#n28
> > 
> > Co-developed-by: Palmer Dabbelt <palmer@sifive.com>
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  fs/open.c                | 18 ++++++++++++++----
> >  include/linux/syscalls.h |  2 ++
> >  2 files changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/open.c b/fs/open.c
> > index 0c55c8e7f837..39a7939f0d00 100644
> > --- a/fs/open.c
> > +++ b/fs/open.c
> > @@ -671,11 +671,11 @@ SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
> >  	return err;
> >  }
> >  
> > -static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
> > +static int do_fchmodat(int dfd, const char __user *filename, umode_t mode, int lookup_flags)
> 
> I think it'd be much neater to do the conversion of AT_ flags here and
> pass 0 as a flags argument for all of the wrappers (this is how most of
> the other xyz(), fxyz(), fxyzat() syscall wrappers are done IIRC).

I just addressed the Al Viro's suggestion.

https://lore.kernel.org/lkml/20190717014802.GS17978@ZenIV.linux.org.uk/

> >  {
> >  	struct path path;
> >  	int error;
> > -	unsigned int lookup_flags = LOOKUP_FOLLOW;
> > +
> >  retry:
> >  	error = user_path_at(dfd, filename, lookup_flags, &path);
> >  	if (!error) {
> > @@ -689,15 +689,25 @@ static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
> >  	return error;
> >  }
> >  
> > +SYSCALL_DEFINE4(fchmodat2, int, dfd, const char __user *, filename,
> > +		umode_t, mode, int, flags)
> > +{
> > +	if (unlikely(flags & ~AT_SYMLINK_NOFOLLOW))
> > +		return -EINVAL;
> 
> We almost certainly want to support AT_EMPTY_PATH at the same time.
> Otherwise userspace will still need to go through /proc when trying to
> chmod a file handle they have.

I'm not sure I understand. Can you explain what you mean?

-- 
Rgrds, legion

