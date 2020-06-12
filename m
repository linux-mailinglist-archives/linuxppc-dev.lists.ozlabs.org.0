Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE881F73C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 08:16:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jr843B1zzDqrW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 16:16:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jr6B6Wd2zDqrV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 16:14:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Y/zKqAD7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49jr6B3WM1z9sRN;
 Fri, 12 Jun 2020 16:14:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591942466;
 bh=1YJnYR9z/45esv/J18zW4OOwO7MRt5CJKQ2IjWZSsKI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Y/zKqAD7oAVP4/DaucC59H2SDTW1oBiFkMGVBLrorcxK9zGc+TOLIcRUh1eITSJjj
 kyU535LFMoOXzbL/kF5jQE4BNnItOQ5hIZ+F9JUN/vB/QXhiq2cPDvGEpJDyJUMw9j
 cYaOI/qEsRqILqk4/S8cMaK4++ylckW4iCIaaZMpK4LkTsxZGol/XLr8faGnkhrA6o
 eGpnBgFYnPavTKQxiJtW5st2lOzYwBy0fuSeGZvec0Ph7ih7FiQLCjMf+9YB5uNoly
 q9n7FDRVlSXm6cGE/zhw7U04UT6RnNj+TI+iRKoar5+EvKleNlIducDzo0JabBek2z
 B1QaoMch+3NaQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/64s: remove PROT_SAO support
In-Reply-To: <20200607120209.463501-1-npiggin@gmail.com>
References: <20200607120209.463501-1-npiggin@gmail.com>
Date: Fri, 12 Jun 2020 16:14:49 +1000
Message-ID: <87d064g692.fsf@mpe.ellerman.id.au>
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

Nicholas Piggin <npiggin@gmail.com> writes:
> ISA v3.1 does not support the SAO storage control attribute required to
> implement PROT_SAO. PROT_SAO was used by specialised system software
> (Lx86) that has been discontinued for about 7 years, and is not thought
> to be used elsewhere, so removal should not cause problems.
>
> We rather remove it than keep support for older processors, because
> live migrating guest partitions to newer processors may not be possible
> if SAO is in use.

They key details being:
 - you don't remove PROT_SAO from the uapi header, so code using the
   definition will still build.
 - you change arch_validate_prot() to reject PROT_SAO, which means code
   using it will see a failure from mmap() at runtime.


This obviously risks breaking userspace, even if we think it won't in
practice. I guess we don't really have any option given the hardware
support is being dropped.

Can you repost with a wider Cc list, including linux-mm and linux-arch?

I wonder if we should add a comment to the uapi header, eg?

diff --git a/arch/powerpc/include/uapi/asm/mman.h b/arch/powerpc/include/uapi/asm/mman.h
index c0c737215b00..d4fdbe768997 100644
--- a/arch/powerpc/include/uapi/asm/mman.h
+++ b/arch/powerpc/include/uapi/asm/mman.h
@@ -11,7 +11,7 @@
 #include <asm-generic/mman-common.h>
 
 
-#define PROT_SAO	0x10		/* Strong Access Ordering */
+#define PROT_SAO	0x10		/* Unsupported since v5.9 */
 
 #define MAP_RENAME      MAP_ANONYMOUS   /* In SunOS terminology */
 #define MAP_NORESERVE   0x40            /* don't reserve swap pages */


> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index f17442c3a092..d9e92586f8dc 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -20,9 +20,13 @@
>  #define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
>  #define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
>  #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
> -#define _PAGE_SAO		0x00010 /* Strong access order */
> +
> +#define _PAGE_CACHE_CTL		0x00030 /* Bits for the folowing cache modes */
> +			/*	No bits set is normal cacheable memory */
> +			/*	0x00010 unused, is SAO bit on radix POWER9 */
>  #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */
>  #define _PAGE_TOLERANT		0x00030 /* tolerant memory, cache inhibited */
> +

Why'd you do it that way vs just dropping _PAGE_SAO from the or below?

> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
> index bac2252c839e..c7e923b0000a 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -191,7 +191,6 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTR_SPURR			LONG_ASM_CONST(0x0000000001000000)
>  #define CPU_FTR_DSCR			LONG_ASM_CONST(0x0000000002000000)
>  #define CPU_FTR_VSX			LONG_ASM_CONST(0x0000000004000000)
> -#define CPU_FTR_SAO			LONG_ASM_CONST(0x0000000008000000)

Can you do:

+// Free				LONG_ASM_CONST(0x0000000008000000)

> diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
> index 9bb9bb370b53..579c9229124b 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_64.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_64.h
> @@ -400,7 +400,8 @@ static inline bool hpte_cache_flags_ok(unsigned long hptel, bool is_ci)
>  
>  	/* Handle SAO */
>  	if (wimg == (HPTE_R_W | HPTE_R_I | HPTE_R_M) &&
> -	    cpu_has_feature(CPU_FTR_ARCH_206))
> +	    cpu_has_feature(CPU_FTR_ARCH_206) &&
> +	    !cpu_has_feature(CPU_FTR_ARCH_31))
>  		wimg = HPTE_R_M;

Shouldn't it reject that combination if the host can't support it?

Or I guess it does, but yikes that code is not clear.

> diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
> index d610c2e07b28..43a62f3e21a0 100644
> --- a/arch/powerpc/include/asm/mman.h
> +++ b/arch/powerpc/include/asm/mman.h
> @@ -13,38 +13,24 @@
>  #include <linux/pkeys.h>
>  #include <asm/cpu_has_feature.h>
>  
> -/*
> - * This file is included by linux/mman.h, so we can't use cacl_vm_prot_bits()
> - * here.  How important is the optimization?
> - */

This comment seems confused, but also unrelated to this patch?

> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 3a409517c031..8d2e4043702f 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -622,7 +622,7 @@ static struct dt_cpu_feature_match __initdata
>  	{"processor-control-facility-v3", feat_enable_dbell, CPU_FTR_DBELL},
>  	{"processor-utilization-of-resources-register", feat_enable_purr, 0},
>  	{"no-execute", feat_enable, 0},
> -	{"strong-access-ordering", feat_enable, CPU_FTR_SAO},
> +	{"strong-access-ordering", feat_enable, 0},

Would it make more sense to drop it entirely? Or leave it commented out.


cheers
