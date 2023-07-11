Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 867AE74F86B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:34:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mDFv4m1Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0rfB2pPdz3cbP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 05:34:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mDFv4m1Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0ktp67vYz301T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 01:14:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22A2E61360;
	Tue, 11 Jul 2023 15:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0348C433C8;
	Tue, 11 Jul 2023 15:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689088479;
	bh=bX8Zc81k/ncwGh5PXE1iM2yYHZ5h1mgr1P4ipGrAm1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mDFv4m1QNbIupDgbm/yNE10IK+Jeb4u+Hp68VFw3gYEYHzXTkpqsmiBmls8OBQfPi
	 8gjlYbWsgsODgNYCmyXngE6+ER4yrQMBktLYNPkyJSjO2PjqzRDQj3KdGcUbf36wgu
	 7aVrn48sPOFnWH131NWsle3XUxWV/2e0lFw26VzHHXoO8mymCN/o1hXTzSRRVodm0Y
	 B5206f1UngBXiceL8iWamazSHAkYPEyz7ifXvbgPuGcFqApic+fgdAUQdD0SmUf4Kh
	 EnHPx7buKqGizbTbYPcPVdErtwKB6c7QWKWmK02m4duXrEZGbjqNnptXpu0XsScJBM
	 QLRMPGbf7fjgw==
Date: Tue, 11 Jul 2023 17:14:24 +0200
From: Christian Brauner <brauner@kernel.org>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH v3 0/5] Add a new fchmodat4() syscall
Message-ID: <20230711-quintessenz-auswechseln-92a4640c073d@brauner>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <87lefmbppo.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87lefmbppo.fsf@oldenburg.str.redhat.com>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, peterz@infradead.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, fenghua.yu@intel.com, tycho@tycho.ws, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, linuxppc-dev@lists.ozlabs.org, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel
 .dk, James.Bottomley@HansenPartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, Alexey Gladkov <legion@kernel.org>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 02:24:51PM +0200, Florian Weimer wrote:
> * Alexey Gladkov:
> 
> > This patch set adds fchmodat4(), a new syscall. The actual
> > implementation is super simple: essentially it's just the same as
> > fchmodat(), but LOOKUP_FOLLOW is conditionally set based on the flags.
> > I've attempted to make this match "man 2 fchmodat" as closely as
> > possible, which says EINVAL is returned for invalid flags (as opposed to
> > ENOTSUPP, which is currently returned by glibc for AT_SYMLINK_NOFOLLOW).
> > I have a sketch of a glibc patch that I haven't even compiled yet, but
> > seems fairly straight-forward:
> >
> >     diff --git a/sysdeps/unix/sysv/linux/fchmodat.c b/sysdeps/unix/sysv/linux/fchmodat.c
> >     index 6d9cbc1ce9e0..b1beab76d56c 100644
> >     --- a/sysdeps/unix/sysv/linux/fchmodat.c
> >     +++ b/sysdeps/unix/sysv/linux/fchmodat.c
> >     @@ -29,12 +29,36 @@
> >      int
> >      fchmodat (int fd, const char *file, mode_t mode, int flag)
> >      {
> >     -  if (flag & ~AT_SYMLINK_NOFOLLOW)
> >     -    return INLINE_SYSCALL_ERROR_RETURN_VALUE (EINVAL);
> >     -#ifndef __NR_lchmod		/* Linux so far has no lchmod syscall.  */
> >     +  /* There are four paths through this code:
> >     +      - The flags are zero.  In this case it's fine to call fchmodat.
> >     +      - The flags are non-zero and glibc doesn't have access to
> >     +	__NR_fchmodat4.  In this case all we can do is emulate the error codes
> >     +	defined by the glibc interface from userspace.
> >     +      - The flags are non-zero, glibc has __NR_fchmodat4, and the kernel has
> >     +	fchmodat4.  This is the simplest case, as the fchmodat4 syscall exactly
> >     +	matches glibc's library interface so it can be called directly.
> >     +      - The flags are non-zero, glibc has __NR_fchmodat4, but the kernel does
> 
> If you define __NR_fchmodat4 on all architectures, we can use these
> constants directly in glibc.  We no longer depend on the UAPI
> definitions of those constants, to cut down the number of code variants,
> and to make glibc's system call profile independent of the kernel header
> version at build time.
> 
> Your version is based on 2.31, more recent versions have some reasonable
> emulation for fchmodat based on /proc/self/fd.  I even wrote a comment
> describing the same buggy behavior that you witnessed:
> 
> +      /* Some Linux versions with some file systems can actually
> +        change symbolic link permissions via /proc, but this is not
> +        intentional, and it gives inconsistent results (e.g., error
> +        return despite mode change).  The expected behavior is that
> +        symbolic link modes cannot be changed at all, and this check
> +        enforces that.  */
> +      if (S_ISLNK (st.st_mode))
> +       {
> +         __close_nocancel (pathfd);
> +         __set_errno (EOPNOTSUPP);
> +         return -1;
> +       }
> 
> I think there was some kernel discussion about that behavior before, but
> apparently, it hasn't led to fixes.

I think I've explained this somewhere else a couple of months ago but
just in case you weren't on that thread or don't remember and apologies
if you should already know.

A lot of filesystem will happily update the mode of a symlink. The VFS
doesn't do anything to prevent this from happening. This is filesystem
specific.

The EOPNOTSUPP you're seeing very likely comes from POSIX ACLs.
Specifically it comes from filesystems that call posix_acl_chmod(),
e.g., btrfs via

        if (!err && attr->ia_valid & ATTR_MODE)
                err = posix_acl_chmod(idmap, dentry, inode->i_mode);

Most filesystems don't implement i_op->set_acl() for POSIX ACLs.
So posix_acl_chmod() will report EOPNOTSUPP. By the time
posix_acl_chmod() is called, most filesystems will have finished
updating the inode. POSIX ACLs also often aren't integrated into
transactions so a rollback wouldn't even be possible on some
filesystems.

Any filesystem that doesn't implement POSIX ACLs at all will obviously
never fail unless it blocks mode changes on symlinks. Or filesystems
that do have a way to rollback failures from posix_acl_chmod(), or
filesystems that do return an error on chmod() on symlinks such as 9p,
ntfs, ocfs2.

> 
> I wonder if it makes sense to add a similar error return to the system
> call implementation?

Hm, blocking symlink mode changes is pretty regression prone. And just
blocking it through one interface seems weird and makes things even more
inconsistent.

So two options I see:
(1) minimally invasive:
    Filesystems that do call posix_acl_chmod() on symlinks need to be
    changed to stop doing that.
(2) might hit us on the head invasive:
    Try and block symlink mode changes in chmod_common().

Thoughts?
