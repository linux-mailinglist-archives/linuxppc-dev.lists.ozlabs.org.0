Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEDA18AA3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 02:12:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jTQb6z8wzDr6Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 12:12:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jTNC1kxjzDr28
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 12:10:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Zb3sKzT6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48jTNB4zmfz9sPR;
 Thu, 19 Mar 2020 12:10:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584580202;
 bh=dsAYUpBIHWyRqWv4FX0udbRGa8tLjAzSdzZd9Xm8pUc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Zb3sKzT6T9ViFk6GbzMBqYOtExyqc326gRnRRFeY93+ikmdpL/2w3BjoZYonb8xdB
 zNGeceQor22vgMsAqPzV2zcAEAQUhN/6BsBts7nvjXHmHscSS+eLB8ZFbBgwCe9amv
 NacobufLfRXgHz8hrby6XyLxQ3lsJUIsOARwMvDXgt85rL5f/2LK+yI42UsqXzRn41
 Fa8suzuIUejDuskRsHDvt9HYad1CfrU9dJvQ1JQGcMp1+eLS+4qK2FiqAG9Pf99xm+
 EahjJq64zjm9cSrJ5jwNLAy+G5YP9Kfy9U56PFB4b85CGiBQZxnicbvCaM3SjNcVen
 pnT8waua6xXjw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anton Blanchard <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/vdso: Fix multiple issues with sys_call_table
In-Reply-To: <20200306135705.7f80fcad@kryten.localdomain>
References: <20200306135705.7f80fcad@kryten.localdomain>
Date: Thu, 19 Mar 2020 12:10:03 +1100
Message-ID: <87pnd9duac.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anton Blanchard <anton@ozlabs.org> writes:
> The VDSO exports a bitmap of valid syscalls. vdso_setup_syscall_map()
> sets this up, but there are both little and big endian bugs. The issue
> is with:
>
>        if (sys_call_table[i] != sys_ni_syscall)
>
> On little endian, instead of comparing pointers to the two functions,
> we compare the first two instructions of each function. If a function
> happens to have the same first two instructions as sys_ni_syscall, then
> we have a spurious match and mark the instruction as not implemented.
> Fix this by removing the inline declarations.
>
> On big endian we have a further issue where sys_ni_syscall is a function
> descriptor and sys_call_table[] holds pointers to the instruction text.
> Fix this by using dereference_kernel_function_descriptor().
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>

That's some pretty epic breakage.

Is it even worth keeping, or should we just rip it out and declare that
the syscall map is junk? Userspace can hardly rely on it given it's been
this broken for so long.

If not it would be really nice to have a selftest of this stuff so we
can verify it works and not break it again in future.

cheers

> ---
> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index b9a108411c0d..d186b729026e 100644
> --- a/arch/powerpc/kernel/vdso.c
> +++ b/arch/powerpc/kernel/vdso.c
> @@ -17,6 +17,7 @@
>  #include <linux/elf.h>
>  #include <linux/security.h>
>  #include <linux/memblock.h>
> +#include <linux/syscalls.h>
>  
>  #include <asm/pgtable.h>
>  #include <asm/processor.h>
> @@ -30,6 +31,7 @@
>  #include <asm/vdso.h>
>  #include <asm/vdso_datapage.h>
>  #include <asm/setup.h>
> +#include <asm/syscall.h>
>  
>  #undef DEBUG
>  
> @@ -644,19 +646,16 @@ static __init int vdso_setup(void)
>  static void __init vdso_setup_syscall_map(void)
>  {
>  	unsigned int i;
> -	extern unsigned long *sys_call_table;
> -#ifdef CONFIG_PPC64
> -	extern unsigned long *compat_sys_call_table;
> -#endif
> -	extern unsigned long sys_ni_syscall;
> +	unsigned long ni_syscall;
>  
> +	ni_syscall = (unsigned long)dereference_kernel_function_descriptor(sys_ni_syscall);
>  
>  	for (i = 0; i < NR_syscalls; i++) {
>  #ifdef CONFIG_PPC64
> -		if (sys_call_table[i] != sys_ni_syscall)
> +		if (sys_call_table[i] != ni_syscall)
>  			vdso_data->syscall_map_64[i >> 5] |=
>  				0x80000000UL >> (i & 0x1f);
> -		if (compat_sys_call_table[i] != sys_ni_syscall)
> +		if (compat_sys_call_table[i] != ni_syscall)
>  			vdso_data->syscall_map_32[i >> 5] |=
>  				0x80000000UL >> (i & 0x1f);
>  #else /* CONFIG_PPC64 */
