Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1B276186E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 14:33:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kbsxLGNF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9GfV20Pyz3ckZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 22:33:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kbsxLGNF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9DjP1gCSz3bZF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 21:06:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F3086164D;
	Tue, 25 Jul 2023 11:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A34EC433CA;
	Tue, 25 Jul 2023 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690283155;
	bh=pOXvioLmt4HpMqW57Xv4XXd6GlnOcDy+UqsXfhkHrFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbsxLGNFdM6qSh1jsLLP+MSRG3Nkflp9aMdnQyXq9KRnC7jcnHrYscu5AiJyW/CjG
	 6vidsGf1xTa3w/b9fcx6JxLPhCpsmeaqJ+tu976ejqJN7wAnGdbGlU6QuWVEG17TOW
	 rsAyVWCFCZxfnHGF9MOOEVjBTGhN1QP4VWQjCIpV24KKAqKhH3hrLvErt0bITTzA4b
	 uQMoXtGGG92ctUBFbJvXZzxBOHsP01uMxujb2oj61jq3+VhVIPsXeIC4CFrq+i23Af
	 amrQLDym688RQVV6YIHxxMOi5kxCv3SxAF6cWfPNZ/OE5H7fNQnSQkRJa31J+pQBLa
	 k4YHM0VOJB5JQ==
Date: Tue, 25 Jul 2023 13:05:40 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v3 0/5] Add a new fchmodat4() syscall
Message-ID: <ZL+shMg5LJgYlsDd@example.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <87lefmbppo.fsf@oldenburg.str.redhat.com>
 <20230711-quintessenz-auswechseln-92a4640c073d@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711-quintessenz-auswechseln-92a4640c073d@brauner>
X-Mailman-Approved-At: Tue, 25 Jul 2023 22:32:02 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, peterz@infradead.org, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, axboe@kernel.dk, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, Florian Weimer <fweimer@re
 dhat.com>, James.Bottomley@hansenpartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 05:14:24PM +0200, Christian Brauner wrote:
> On Tue, Jul 11, 2023 at 02:24:51PM +0200, Florian Weimer wrote:
> > * Alexey Gladkov:
> > 
> > > This patch set adds fchmodat4(), a new syscall. The actual
> > > implementation is super simple: essentially it's just the same as
> > > fchmodat(), but LOOKUP_FOLLOW is conditionally set based on the flags.
> > > I've attempted to make this match "man 2 fchmodat" as closely as
> > > possible, which says EINVAL is returned for invalid flags (as opposed to
> > > ENOTSUPP, which is currently returned by glibc for AT_SYMLINK_NOFOLLOW).
> > > I have a sketch of a glibc patch that I haven't even compiled yet, but
> > > seems fairly straight-forward:
> > >
> > >     diff --git a/sysdeps/unix/sysv/linux/fchmodat.c b/sysdeps/unix/sysv/linux/fchmodat.c
> > >     index 6d9cbc1ce9e0..b1beab76d56c 100644
> > >     --- a/sysdeps/unix/sysv/linux/fchmodat.c
> > >     +++ b/sysdeps/unix/sysv/linux/fchmodat.c
> > >     @@ -29,12 +29,36 @@
> > >      int
> > >      fchmodat (int fd, const char *file, mode_t mode, int flag)
> > >      {
> > >     -  if (flag & ~AT_SYMLINK_NOFOLLOW)
> > >     -    return INLINE_SYSCALL_ERROR_RETURN_VALUE (EINVAL);
> > >     -#ifndef __NR_lchmod		/* Linux so far has no lchmod syscall.  */
> > >     +  /* There are four paths through this code:
> > >     +      - The flags are zero.  In this case it's fine to call fchmodat.
> > >     +      - The flags are non-zero and glibc doesn't have access to
> > >     +	__NR_fchmodat4.  In this case all we can do is emulate the error codes
> > >     +	defined by the glibc interface from userspace.
> > >     +      - The flags are non-zero, glibc has __NR_fchmodat4, and the kernel has
> > >     +	fchmodat4.  This is the simplest case, as the fchmodat4 syscall exactly
> > >     +	matches glibc's library interface so it can be called directly.
> > >     +      - The flags are non-zero, glibc has __NR_fchmodat4, but the kernel does
> > 
> > If you define __NR_fchmodat4 on all architectures, we can use these
> > constants directly in glibc.  We no longer depend on the UAPI
> > definitions of those constants, to cut down the number of code variants,
> > and to make glibc's system call profile independent of the kernel header
> > version at build time.
> > 
> > Your version is based on 2.31, more recent versions have some reasonable
> > emulation for fchmodat based on /proc/self/fd.  I even wrote a comment
> > describing the same buggy behavior that you witnessed:
> > 
> > +      /* Some Linux versions with some file systems can actually
> > +        change symbolic link permissions via /proc, but this is not
> > +        intentional, and it gives inconsistent results (e.g., error
> > +        return despite mode change).  The expected behavior is that
> > +        symbolic link modes cannot be changed at all, and this check
> > +        enforces that.  */
> > +      if (S_ISLNK (st.st_mode))
> > +       {
> > +         __close_nocancel (pathfd);
> > +         __set_errno (EOPNOTSUPP);
> > +         return -1;
> > +       }
> > 
> > I think there was some kernel discussion about that behavior before, but
> > apparently, it hasn't led to fixes.
> 
> I think I've explained this somewhere else a couple of months ago but
> just in case you weren't on that thread or don't remember and apologies
> if you should already know.
> 
> A lot of filesystem will happily update the mode of a symlink. The VFS
> doesn't do anything to prevent this from happening. This is filesystem
> specific.
> 
> The EOPNOTSUPP you're seeing very likely comes from POSIX ACLs.
> Specifically it comes from filesystems that call posix_acl_chmod(),
> e.g., btrfs via
> 
>         if (!err && attr->ia_valid & ATTR_MODE)
>                 err = posix_acl_chmod(idmap, dentry, inode->i_mode);
> 
> Most filesystems don't implement i_op->set_acl() for POSIX ACLs.
> So posix_acl_chmod() will report EOPNOTSUPP. By the time
> posix_acl_chmod() is called, most filesystems will have finished
> updating the inode. POSIX ACLs also often aren't integrated into
> transactions so a rollback wouldn't even be possible on some
> filesystems.
> 
> Any filesystem that doesn't implement POSIX ACLs at all will obviously
> never fail unless it blocks mode changes on symlinks. Or filesystems
> that do have a way to rollback failures from posix_acl_chmod(), or
> filesystems that do return an error on chmod() on symlinks such as 9p,
> ntfs, ocfs2.
> 
> > 
> > I wonder if it makes sense to add a similar error return to the system
> > call implementation?
> 
> Hm, blocking symlink mode changes is pretty regression prone. And just
> blocking it through one interface seems weird and makes things even more
> inconsistent.
> 
> So two options I see:
> (1) minimally invasive:
>     Filesystems that do call posix_acl_chmod() on symlinks need to be
>     changed to stop doing that.
> (2) might hit us on the head invasive:
>     Try and block symlink mode changes in chmod_common().
> 
> Thoughts?
> 

We have third option. We can choose not to call chmod_common and return an
error right away:

diff --git a/fs/open.c b/fs/open.c
index 39a7939f0d00..86a427a2a083 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -679,7 +679,9 @@ static int do_fchmodat(int dfd, const char __user *filename, umode_t mode, int l
 retry:
        error = user_path_at(dfd, filename, lookup_flags, &path);
        if (!error) {
-               error = chmod_common(&path, mode);
+               error = -EOPNOTSUPP;
+               if (!(flags & AT_SYMLINK_NOFOLLOW) || !S_ISLNK(path.dentry->d_inode->i_mode))
+                       error = chmod_common(&path, mode);
                path_put(&path);
                if (retry_estale(error, lookup_flags)) {
                        lookup_flags |= LOOKUP_REVAL;

It doesn't seem to be invasive.

-- 
Rgrds, legion

