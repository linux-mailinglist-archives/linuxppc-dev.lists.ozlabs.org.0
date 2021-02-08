Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F56313ACC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 18:25:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZCb43zTTzDrYX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 04:25:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZCY04DSjzDqXb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 04:23:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZCXq1FdBzB09ZW;
 Mon,  8 Feb 2021 18:23:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9HdQLzwMdMP6; Mon,  8 Feb 2021 18:23:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZCXq04QnzB09ZT;
 Mon,  8 Feb 2021 18:23:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 83ECC8B7BF;
 Mon,  8 Feb 2021 18:23:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TOn0mfSVIhje; Mon,  8 Feb 2021 18:23:28 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AE0028B7BA;
 Mon,  8 Feb 2021 18:23:21 +0100 (CET)
Subject: Re: [RFC PATCH 1/3] powerpc/lib: implement strlen() in assembly for
 PPC64
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 wei.guo.simon@gmail.com, segher@kernel.crashing.org
References: <a272622d3444a1787a0fc4bf61e9192fb0c3cd64.1530780629.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <79450ec6-ed09-4484-42f8-34e6a8067665@csgroup.eu>
Date: Mon, 8 Feb 2021 18:23:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a272622d3444a1787a0fc4bf61e9192fb0c3cd64.1530780629.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/07/2018 à 10:53, Christophe Leroy a écrit :
> The generic implementation of strlen() reads strings byte per byte.
> 
> This patch implements strlen() in assembly based on a read of entire
> words, in the same spirit as what some other arches and glibc do.
> 
> strlen() selftest on an XXXXXXXX provides the following values:
> 
> Before the patch (ie with the generic strlen() in lib/string.c):
> 
> After the patch:


I think we should implement it in C using word-at-a-time

Christophe


> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   This serie applies on top of the PPC32 strlen optimisation serie
> 
>   Untested
> 
>   arch/powerpc/include/asm/string.h |  3 +-
>   arch/powerpc/lib/Makefile         |  4 +-
>   arch/powerpc/lib/strlen_64.S      | 88 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 91 insertions(+), 4 deletions(-)
>   create mode 100644 arch/powerpc/lib/strlen_64.S
> 
> diff --git a/arch/powerpc/include/asm/string.h b/arch/powerpc/include/asm/string.h
> index 1647de15a31e..8fdcb532de72 100644
> --- a/arch/powerpc/include/asm/string.h
> +++ b/arch/powerpc/include/asm/string.h
> @@ -13,6 +13,7 @@
>   #define __HAVE_ARCH_MEMCHR
>   #define __HAVE_ARCH_MEMSET16
>   #define __HAVE_ARCH_MEMCPY_FLUSHCACHE
> +#define __HAVE_ARCH_STRLEN
>   
>   extern char * strcpy(char *,const char *);
>   extern char * strncpy(char *,const char *, __kernel_size_t);
> @@ -50,8 +51,6 @@ static inline void *memset64(uint64_t *p, uint64_t v, __kernel_size_t n)
>   	return __memset64(p, v, n * 8);
>   }
>   #else
> -#define __HAVE_ARCH_STRLEN
> -
>   extern void *memset16(uint16_t *, uint16_t, __kernel_size_t);
>   #endif
>   #endif /* __KERNEL__ */
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index 670286808928..93706b4cdbde 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -12,7 +12,7 @@ CFLAGS_REMOVE_feature-fixups.o = $(CC_FLAGS_FTRACE)
>   
>   obj-y += string.o alloc.o code-patching.o feature-fixups.o
>   
> -obj-$(CONFIG_PPC32)	+= div64.o copy_32.o crtsavres.o strlen_32.o
> +obj-$(CONFIG_PPC32)	+= div64.o copy_32.o crtsavres.o
>   
>   # See corresponding test in arch/powerpc/Makefile
>   # 64-bit linker creates .sfpr on demand for final link (vmlinux),
> @@ -33,7 +33,7 @@ obj64-$(CONFIG_ALTIVEC)	+= vmx-helper.o
>   obj64-$(CONFIG_KPROBES_SANITY_TEST) += test_emulate_step.o
>   
>   obj-y			+= checksum_$(BITS).o checksum_wrappers.o \
> -			   string_$(BITS).o memcmp_$(BITS).o
> +			   string_$(BITS).o memcmp_$(BITS).o strlen_$(BITS).o
>   
>   obj-y			+= sstep.o ldstfp.o quad.o
>   obj64-y			+= quad.o
> diff --git a/arch/powerpc/lib/strlen_64.S b/arch/powerpc/lib/strlen_64.S
> new file mode 100644
> index 000000000000..c9704f2b697d
> --- /dev/null
> +++ b/arch/powerpc/lib/strlen_64.S
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * strlen() for PPC64
> + *
> + * Copyright (C) 2018 Christophe Leroy CS Systemes d'Information.
> + *
> + * Inspired from glibc implementation
> + */
> +#include <asm/ppc_asm.h>
> +#include <asm/export.h>
> +#include <asm/cache.h>
> +
> +	.text
> +
> +/*
> + * Algorithm:
> + *
> + * 1) Given a word 'x', we can test to see if it contains any 0 bytes
> + *    by subtracting 0x01010101, and seeing if any of the high bits of each
> + *    byte changed from 0 to 1. This works because the least significant
> + *    0 byte must have had no incoming carry (otherwise it's not the least
> + *    significant), so it is 0x00 - 0x01 == 0xff. For all other
> + *    byte values, either they have the high bit set initially, or when
> + *    1 is subtracted you get a value in the range 0x00-0x7f, none of which
> + *    have their high bit set. The expression here is
> + *    (x - 0x01010101) & ~x & 0x80808080), which gives 0x00000000 when
> + *    there were no 0x00 bytes in the word.  You get 0x80 in bytes that
> + *    match, but possibly false 0x80 matches in the next more significant
> + *    byte to a true match due to carries.  For little-endian this is
> + *    of no consequence since the least significant match is the one
> + *    we're interested in, but big-endian needs method 2 to find which
> + *    byte matches.
> + * 2) Given a word 'x', we can test to see _which_ byte was zero by
> + *    calculating ~(((x & ~0x80808080) - 0x80808080 - 1) | x | ~0x80808080).
> + *    This produces 0x80 in each byte that was zero, and 0x00 in all
> + *    the other bytes. The '| ~0x80808080' clears the low 7 bits in each
> + *    byte, and the '| x' part ensures that bytes with the high bit set
> + *    produce 0x00. The addition will carry into the high bit of each byte
> + *    iff that byte had one of its low 7 bits set. We can then just see
> + *    which was the most significant bit set and divide by 8 to find how
> + *    many to add to the index.
> + *    This is from the book 'The PowerPC Compiler Writer's Guide',
> + *    by Steve Hoxey, Faraydon Karim, Bill Hay and Hank Warren.
> + */
> +
> +_GLOBAL(strlen)
> +	andi.   r0, r3, 7
> +	lis	r7, 0x0101
> +	addi	r10, r3, -8
> +	addic	r7, r7, 0x0101	/* r7 = 0x01010101 (lomagic) & clear XER[CA] */
> +	rldimi	r7, r7, 32, 0	/* r7 = 0x0101010101010101 (lomagic) */
> +	rotldi	r6, r7, 31 	/* r6 = 0x8080808080808080 (himagic) */
> +	bne-	3f
> +	.balign IFETCH_ALIGN_BYTES
> +1:	ldu	r9, 8(r10)
> +2:	subf	r8, r7, r9
> +	andc	r11, r6, r9
> +	and.	r8, r8, r11
> +	beq+	1b
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +	andc	r8, r9, r6
> +	orc	r9, r9, r6
> +	subfe	r8, r6, r8
> +	nor	r8, r8, r9
> +	cntlzd	r8, r8
> +	subf	r3, r3, r10
> +	srdi	r8, r8, 3
> +	add	r3, r3, r8
> +#else
> +	addi	r9, r8, -1
> +	addi	r10, r10, 7
> +	andc	r8, r9, r8
> +	cntlzd	r8, r8
> +	subf	r3, r3, r10
> +	srdi	r8, r8, 3
> +	subf	r3, r8, r3
> +#endif
> +	blr
> +
> +	/* Missaligned string: make sure bytes before string are seen not 0 */
> +3:	xor	r10, r10, r0
> +	orc	r8, r8, r8
> +	ldu	r9, 8(r10)
> +	slwi	r0, r0, 3
> +	srw	r8, r8, r0
> +	orc	r9, r9, r8
> +	b	2b
> +EXPORT_SYMBOL(strlen)
> 
