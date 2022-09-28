Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 623485EDC5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 14:15:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McwSC6Kc0z3cBK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 22:15:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kZ+g9cd1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McwRb6f2rz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 22:15:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kZ+g9cd1;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4McwRY4MD2z4wgv;
	Wed, 28 Sep 2022 22:15:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664367305;
	bh=W/3Ic8ZIL0Nrr7CEJiA+Ku8Aq/xkLrBD/eyQRs8P5Mk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kZ+g9cd1upeJtNzXhPmIJqlYd9S02rv+qpblBxMWuDSoKxuDfvLnELCAcYr0tY+ru
	 sOGUiS3ttQbscOvqOQdAOAXosq2wbSgLL58IhrZ0jR8rF7rRERRJESXYUXlkYnZ1KD
	 1fShgPFcmFx1NKCa0wbAdmDZQ50jFDQ0PgGDqPqf6jhMSSi9x52GUr8/WSYASHg2j0
	 q8UOQrhrd5D2m2YkAL6XegGS48QG89rINt9QmvHXKXg+FaW2zbZ22rvzPC7WmgVn02
	 AMhzCp9LHsSHupG3fI0KQwXgaPayWB/6IfBpFrTlH2zeOfImMIuSmMKqQVhoM4Yesq
	 pLTXlwOAE/V4g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 13/25] powerpc: Remove direct call to mmap2 syscall
 handlers
In-Reply-To: <20220921065605.1051927-14-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-14-rmclure@linux.ibm.com>
Date: Wed, 28 Sep 2022 22:15:05 +1000
Message-ID: <87k05ng0fq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rohan McLure <rmclure@linux.ibm.com> writes:
> Syscall handlers should not be invoked internally by their symbol names,
> as these symbols defined by the architecture-defined SYSCALL_DEFINE
> macro. Move the compatibility syscall definition for mmap2 to
> syscalls.c, so that all mmap implementations can share a helper function.
>
> Remove 'inline' on static mmap helper.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> V2: Move mmap2 compat implementation to asm/kernel/syscalls.c.
> V4: Move to be applied before syscall wrapper introduced.
> V5: Remove 'inline' in helper.
> ---
>  arch/powerpc/kernel/sys_ppc32.c |  9 ---------
>  arch/powerpc/kernel/syscalls.c  | 17 ++++++++++++++---
>  2 files changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
> index d961634976d8..776ae7565fc5 100644
> --- a/arch/powerpc/kernel/sys_ppc32.c
> +++ b/arch/powerpc/kernel/sys_ppc32.c
> @@ -25,7 +25,6 @@
>  #include <linux/poll.h>
>  #include <linux/personality.h>
>  #include <linux/stat.h>
> -#include <linux/mman.h>
>  #include <linux/in.h>
>  #include <linux/syscalls.h>
>  #include <linux/unistd.h>
> @@ -48,14 +47,6 @@
>  #include <asm/syscalls.h>
>  #include <asm/switch_to.h>
>  
> -unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
> -			  unsigned long prot, unsigned long flags,
> -			  unsigned long fd, unsigned long pgoff)
> -{
> -	/* This should remain 12 even if PAGE_SIZE changes */
> -	return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
> -}
> -
>  compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
>  			     u32 reg6, u32 pos1, u32 pos2)
>  {
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
> index a04c97faa21a..9830957498b0 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -36,9 +36,9 @@
>  #include <asm/time.h>
>  #include <asm/unistd.h>
>  
> -static inline long do_mmap2(unsigned long addr, size_t len,
> -			unsigned long prot, unsigned long flags,
> -			unsigned long fd, unsigned long off, int shift)
> +static long do_mmap2(unsigned long addr, size_t len,
> +		     unsigned long prot, unsigned long flags,
> +		     unsigned long fd, unsigned long off, int shift)
>  {
>  	if (!arch_validate_prot(prot, addr))
>  		return -EINVAL;
> @@ -56,6 +56,17 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, size_t, len,
>  	return do_mmap2(addr, len, prot, flags, fd, pgoff, PAGE_SHIFT-12);
>  }
>  
> +#ifdef CONFIG_COMPAT
> +COMPAT_SYSCALL_DEFINE6(mmap2,
> +		       unsigned long, addr, size_t, len,
> +		       unsigned long, prot, unsigned long, flags,
> +		       unsigned long, fd, unsigned long, pgoff)
> +{
> +	/* This should remain 12 even if PAGE_SIZE changes */
> +	return do_mmap2(addr, len, prot, flags, fd, pgoff << 12, PAGE_SHIFT-12);

This isn't quite right.

The comment about it remaining 12 is kind of misleading, it was true
when compat_sys_mmap2() called sys_mmap(), but it's wrong now that we're
calling do_mmap2().

The incoming "pgoff" here is in units of 4K.

do_mmap2() takes "off" in whatever units, but also takes "shift", which
has to tell us how to shift "off" into PAGE_SIZE units.

If we pass off = pgoff << 12, that's in bytes, so we need to page
shift = PAGE_SHIFT.

But I think it makes more sense to do the same as mmap2() and pass the
4K offset through, and pass shift = PAGE_SHIFT - 12. I also borrowed the
"off_4k" name from arm64. End result:

#ifdef CONFIG_COMPAT
COMPAT_SYSCALL_DEFINE6(mmap2,
		       unsigned long, addr, size_t, len,
		       unsigned long, prot, unsigned long, flags,
		       unsigned long, fd, unsigned long, off_4k)
{
	return do_mmap2(addr, len, prot, flags, fd, off_4k, PAGE_SHIFT-12);
}
#endif

With that my G5 boots again :)

cheers
