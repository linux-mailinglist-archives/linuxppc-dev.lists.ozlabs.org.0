Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C37E74EF1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:38:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iaLj/w/b;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iaLj/w/b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0gQg0Th0z3c1m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 22:38:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iaLj/w/b;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iaLj/w/b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fweimer@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0g7J0vhMz30K1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 22:25:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689078312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xjRw+jQ/3UZ/6JfODln6k9FlUepnlRP0EJXqY57Twrc=;
	b=iaLj/w/bLQGROJGlJU+JizBSbrE2BsScB9+ftMax/xZL7SowLlVDAUMpxbvyd8VqiIdjpi
	wRvkfDc/DBjz8i7nX621VWHqZAwOUSLyGqPBwB4I6gcsMvdKQojLngQfAecaX33F+AgEdm
	KQ6NYjyquxLyUGhH8MGi/uMY529XLnA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689078312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xjRw+jQ/3UZ/6JfODln6k9FlUepnlRP0EJXqY57Twrc=;
	b=iaLj/w/bLQGROJGlJU+JizBSbrE2BsScB9+ftMax/xZL7SowLlVDAUMpxbvyd8VqiIdjpi
	wRvkfDc/DBjz8i7nX621VWHqZAwOUSLyGqPBwB4I6gcsMvdKQojLngQfAecaX33F+AgEdm
	KQ6NYjyquxLyUGhH8MGi/uMY529XLnA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-7TmWQ9O4NwC7vHZLlcVKgA-1; Tue, 11 Jul 2023 08:25:06 -0400
X-MC-Unique: 7TmWQ9O4NwC7vHZLlcVKgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E5E628EC108;
	Tue, 11 Jul 2023 12:25:04 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96DBB200AD6E;
	Tue, 11 Jul 2023 12:24:53 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Alexey Gladkov <legion@kernel.org>
Subject: Re: [PATCH v3 0/5] Add a new fchmodat4() syscall
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
	<cover.1689074739.git.legion@kernel.org>
Date: Tue, 11 Jul 2023 14:24:51 +0200
In-Reply-To: <cover.1689074739.git.legion@kernel.org> (Alexey Gladkov's
	message of "Tue, 11 Jul 2023 13:25:41 +0200")
Message-ID: <87lefmbppo.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Tue, 11 Jul 2023 22:37:01 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, peterz@infradead.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, fenghua.yu@intel.com, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk, James.Bottomley@HansenPart
 nership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Alexey Gladkov:

> This patch set adds fchmodat4(), a new syscall. The actual
> implementation is super simple: essentially it's just the same as
> fchmodat(), but LOOKUP_FOLLOW is conditionally set based on the flags.
> I've attempted to make this match "man 2 fchmodat" as closely as
> possible, which says EINVAL is returned for invalid flags (as opposed to
> ENOTSUPP, which is currently returned by glibc for AT_SYMLINK_NOFOLLOW).
> I have a sketch of a glibc patch that I haven't even compiled yet, but
> seems fairly straight-forward:
>
>     diff --git a/sysdeps/unix/sysv/linux/fchmodat.c b/sysdeps/unix/sysv/linux/fchmodat.c
>     index 6d9cbc1ce9e0..b1beab76d56c 100644
>     --- a/sysdeps/unix/sysv/linux/fchmodat.c
>     +++ b/sysdeps/unix/sysv/linux/fchmodat.c
>     @@ -29,12 +29,36 @@
>      int
>      fchmodat (int fd, const char *file, mode_t mode, int flag)
>      {
>     -  if (flag & ~AT_SYMLINK_NOFOLLOW)
>     -    return INLINE_SYSCALL_ERROR_RETURN_VALUE (EINVAL);
>     -#ifndef __NR_lchmod		/* Linux so far has no lchmod syscall.  */
>     +  /* There are four paths through this code:
>     +      - The flags are zero.  In this case it's fine to call fchmodat.
>     +      - The flags are non-zero and glibc doesn't have access to
>     +	__NR_fchmodat4.  In this case all we can do is emulate the error codes
>     +	defined by the glibc interface from userspace.
>     +      - The flags are non-zero, glibc has __NR_fchmodat4, and the kernel has
>     +	fchmodat4.  This is the simplest case, as the fchmodat4 syscall exactly
>     +	matches glibc's library interface so it can be called directly.
>     +      - The flags are non-zero, glibc has __NR_fchmodat4, but the kernel does

If you define __NR_fchmodat4 on all architectures, we can use these
constants directly in glibc.  We no longer depend on the UAPI
definitions of those constants, to cut down the number of code variants,
and to make glibc's system call profile independent of the kernel header
version at build time.

Your version is based on 2.31, more recent versions have some reasonable
emulation for fchmodat based on /proc/self/fd.  I even wrote a comment
describing the same buggy behavior that you witnessed:

+      /* Some Linux versions with some file systems can actually
+        change symbolic link permissions via /proc, but this is not
+        intentional, and it gives inconsistent results (e.g., error
+        return despite mode change).  The expected behavior is that
+        symbolic link modes cannot be changed at all, and this check
+        enforces that.  */
+      if (S_ISLNK (st.st_mode))
+       {
+         __close_nocancel (pathfd);
+         __set_errno (EOPNOTSUPP);
+         return -1;
+       }

I think there was some kernel discussion about that behavior before, but
apparently, it hasn't led to fixes.

I wonder if it makes sense to add a similar error return to the system
call implementation?

>     +	not.  In this case we must respect the error codes defined by the glibc
>     +	interface instead of returning ENOSYS.
>     +    The intent here is to ensure that the kernel is called at most once per
>     +    library call, and that the error types defined by glibc are always
>     +    respected.  */
>     +
>     +#ifdef __NR_fchmodat4
>     +  long result;
>     +#endif
>     +
>     +  if (flag == 0)
>     +    return INLINE_SYSCALL (fchmodat, 3, fd, file, mode);
>     +
>     +#ifdef __NR_fchmodat4
>     +  result = INLINE_SYSCALL (fchmodat4, 4, fd, file, mode, flag);
>     +  if (result == 0 || errno != ENOSYS)
>     +    return result;
>     +#endif

The last if condition is the recommended approach, but in the past, it
broke container host compatibility pretty badly due to seccomp filters
that return EPERM instead of ENOSYS.  I guess we'll learn soon enough if
that's been fixed by now. 8-P

Thanks,
Florian

