Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C48D5842116
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 11:21:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPLmp5KR0z3c44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 21:21:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPLmN4ZDKz2yth
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 21:21:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D91FADA7;
	Tue, 30 Jan 2024 02:21:18 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.48.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 035BD3F5A1;
	Tue, 30 Jan 2024 02:20:30 -0800 (PST)
Date: Tue, 30 Jan 2024 10:20:28 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v10 6/6] arm64: introduce copy_mc_to_kernel()
 implementation
Message-ID: <ZbjNbA1Onnjd6kyp@FVFF77S0Q05N>
References: <20240129134652.4004931-1-tongtiangen@huawei.com>
 <20240129134652.4004931-7-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129134652.4004931-7-tongtiangen@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, "H. Peter Anvin" <hpa@zytor.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, linuxppc-dev@lists.ozlabs.org, Guohanjun <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 29, 2024 at 09:46:52PM +0800, Tong Tiangen wrote:
> The copy_mc_to_kernel() helper is memory copy implementation that handles
> source exceptions. It can be used in memory copy scenarios that tolerate
> hardware memory errors(e.g: pmem_read/dax_copy_to_iter).
> 
> Currnently, only x86 and ppc suuport this helper, after arm64 support
> machine check safe framework, we introduce copy_mc_to_kernel()
> implementation.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/arm64/include/asm/string.h  |   5 +
>  arch/arm64/include/asm/uaccess.h |  21 +++
>  arch/arm64/lib/Makefile          |   2 +-
>  arch/arm64/lib/memcpy_mc.S       | 257 +++++++++++++++++++++++++++++++
>  mm/kasan/shadow.c                |  12 ++
>  5 files changed, 296 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/lib/memcpy_mc.S

Looking at the diffstat and code, this duplicates arch/arm64/lib/memcpy.S with
a few annotations. Duplicating that code is not maintainable, and so we cannot
take this as-is.

If you want a version that can handle faults that *must* be written such that
the code is shared with the regular memcpy. That could be done by using macros
to instantiate two copies (one with fault handling, the other without).

It would also be very helpful to see *any* indication that this has been
tested, which is sorely lacking in the series as-is.

Mark.

> diff --git a/arch/arm64/include/asm/string.h b/arch/arm64/include/asm/string.h
> index 3a3264ff47b9..995b63c26e99 100644
> --- a/arch/arm64/include/asm/string.h
> +++ b/arch/arm64/include/asm/string.h
> @@ -35,6 +35,10 @@ extern void *memchr(const void *, int, __kernel_size_t);
>  extern void *memcpy(void *, const void *, __kernel_size_t);
>  extern void *__memcpy(void *, const void *, __kernel_size_t);
>  
> +#define __HAVE_ARCH_MEMCPY_MC
> +extern int memcpy_mcs(void *, const void *, __kernel_size_t);
> +extern int __memcpy_mcs(void *, const void *, __kernel_size_t);
> +
>  #define __HAVE_ARCH_MEMMOVE
>  extern void *memmove(void *, const void *, __kernel_size_t);
>  extern void *__memmove(void *, const void *, __kernel_size_t);
> @@ -57,6 +61,7 @@ void memcpy_flushcache(void *dst, const void *src, size_t cnt);
>   */
>  
>  #define memcpy(dst, src, len) __memcpy(dst, src, len)
> +#define memcpy_mcs(dst, src, len) __memcpy_mcs(dst, src, len)
>  #define memmove(dst, src, len) __memmove(dst, src, len)
>  #define memset(s, c, n) __memset(s, c, n)
>  
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index 14be5000c5a0..61e28ef2112a 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -425,4 +425,25 @@ static inline size_t probe_subpage_writeable(const char __user *uaddr,
>  
>  #endif /* CONFIG_ARCH_HAS_SUBPAGE_FAULTS */
>  
> +#ifdef CONFIG_ARCH_HAS_COPY_MC
> +/**
> + * copy_mc_to_kernel - memory copy that handles source exceptions
> + *
> + * @dst:	destination address
> + * @src:	source address
> + * @len:	number of bytes to copy
> + *
> + * Return 0 for success, or #size if there was an exception.
> + */
> +static inline unsigned long __must_check
> +copy_mc_to_kernel(void *to, const void *from, unsigned long size)
> +{
> +	int ret;
> +
> +	ret = memcpy_mcs(to, from, size);
> +	return (ret == -EFAULT) ? size : 0;
> +}
> +#define copy_mc_to_kernel copy_mc_to_kernel
> +#endif
> +
>  #endif /* __ASM_UACCESS_H */
> diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
> index a2fd865b816d..899d6ae9698c 100644
> --- a/arch/arm64/lib/Makefile
> +++ b/arch/arm64/lib/Makefile
> @@ -3,7 +3,7 @@ lib-y		:= clear_user.o delay.o copy_from_user.o		\
>  		   copy_to_user.o copy_page.o				\
>  		   clear_page.o csum.o insn.o memchr.o memcpy.o		\
>  		   memset.o memcmp.o strcmp.o strncmp.o strlen.o	\
> -		   strnlen.o strchr.o strrchr.o tishift.o
> +		   strnlen.o strchr.o strrchr.o tishift.o memcpy_mc.o
>  
>  ifeq ($(CONFIG_KERNEL_MODE_NEON), y)
>  obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
> diff --git a/arch/arm64/lib/memcpy_mc.S b/arch/arm64/lib/memcpy_mc.S
> new file mode 100644
> index 000000000000..7076b500d154
> --- /dev/null
> +++ b/arch/arm64/lib/memcpy_mc.S
> @@ -0,0 +1,257 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2012-2021, Arm Limited.
> + *
> + * Adapted from the original at:
> + * https://github.com/ARM-software/optimized-routines/blob/afd6244a1f8d9229/string/aarch64/memcpy.S
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/assembler.h>
> +
> +/* Assumptions:
> + *
> + * ARMv8-a, AArch64, unaligned accesses.
> + *
> + */
> +
> +#define L(label) .L ## label
> +
> +#define dstin	x0
> +#define src	x1
> +#define count	x2
> +#define dst	x3
> +#define srcend	x4
> +#define dstend	x5
> +#define A_l	x6
> +#define A_lw	w6
> +#define A_h	x7
> +#define B_l	x8
> +#define B_lw	w8
> +#define B_h	x9
> +#define C_l	x10
> +#define C_lw	w10
> +#define C_h	x11
> +#define D_l	x12
> +#define D_h	x13
> +#define E_l	x14
> +#define E_h	x15
> +#define F_l	x16
> +#define F_h	x17
> +#define G_l	count
> +#define G_h	dst
> +#define H_l	src
> +#define H_h	srcend
> +#define tmp1	x14
> +
> +/* This implementation handles overlaps and supports both memcpy and memmove
> +   from a single entry point.  It uses unaligned accesses and branchless
> +   sequences to keep the code small, simple and improve performance.
> +
> +   Copies are split into 3 main cases: small copies of up to 32 bytes, medium
> +   copies of up to 128 bytes, and large copies.  The overhead of the overlap
> +   check is negligible since it is only required for large copies.
> +
> +   Large copies use a software pipelined loop processing 64 bytes per iteration.
> +   The destination pointer is 16-byte aligned to minimize unaligned accesses.
> +   The loop tail is handled by always copying 64 bytes from the end.
> +*/
> +
> +SYM_FUNC_START(__pi_memcpy_mcs)
> +	add	srcend, src, count
> +	add	dstend, dstin, count
> +	cmp	count, 128
> +	b.hi	L(copy_long)
> +	cmp	count, 32
> +	b.hi	L(copy32_128)
> +
> +	/* Small copies: 0..32 bytes.  */
> +	cmp	count, 16
> +	b.lo	L(copy16)
> +	CPY_MC(9998f, ldp	A_l, A_h, [src])
> +	CPY_MC(9998f, ldp	D_l, D_h, [srcend, -16])
> +	CPY_MC(9998f, stp	A_l, A_h, [dstin])
> +	CPY_MC(9998f, stp	D_l, D_h, [dstend, -16])
> +	mov x0, #0
> +	ret
> +
> +	/* Copy 8-15 bytes.  */
> +L(copy16):
> +	tbz	count, 3, L(copy8)
> +	CPY_MC(9998f, ldr	A_l, [src])
> +	CPY_MC(9998f, ldr	A_h, [srcend, -8])
> +	CPY_MC(9998f, str	A_l, [dstin])
> +	CPY_MC(9998f, str	A_h, [dstend, -8])
> +	mov x0, #0
> +	ret
> +
> +	.p2align 3
> +	/* Copy 4-7 bytes.  */
> +L(copy8):
> +	tbz	count, 2, L(copy4)
> +	CPY_MC(9998f, ldr	A_lw, [src])
> +	CPY_MC(9998f, ldr	B_lw, [srcend, -4])
> +	CPY_MC(9998f, str	A_lw, [dstin])
> +	CPY_MC(9998f, str	B_lw, [dstend, -4])
> +	mov x0, #0
> +	ret
> +
> +	/* Copy 0..3 bytes using a branchless sequence.  */
> +L(copy4):
> +	cbz	count, L(copy0)
> +	lsr	tmp1, count, 1
> +	CPY_MC(9998f, ldrb	A_lw, [src])
> +	CPY_MC(9998f, ldrb	C_lw, [srcend, -1])
> +	CPY_MC(9998f, ldrb	B_lw, [src, tmp1])
> +	CPY_MC(9998f, strb	A_lw, [dstin])
> +	CPY_MC(9998f, strb	B_lw, [dstin, tmp1])
> +	CPY_MC(9998f, strb	C_lw, [dstend, -1])
> +L(copy0):
> +	mov x0, #0
> +	ret
> +
> +	.p2align 4
> +	/* Medium copies: 33..128 bytes.  */
> +L(copy32_128):
> +	CPY_MC(9998f, ldp	A_l, A_h, [src])
> +	CPY_MC(9998f, ldp	B_l, B_h, [src, 16])
> +	CPY_MC(9998f, ldp	C_l, C_h, [srcend, -32])
> +	CPY_MC(9998f, ldp	D_l, D_h, [srcend, -16])
> +	cmp	count, 64
> +	b.hi	L(copy128)
> +	CPY_MC(9998f, stp	A_l, A_h, [dstin])
> +	CPY_MC(9998f, stp	B_l, B_h, [dstin, 16])
> +	CPY_MC(9998f, stp	C_l, C_h, [dstend, -32])
> +	CPY_MC(9998f, stp	D_l, D_h, [dstend, -16])
> +	mov x0, #0
> +	ret
> +
> +	.p2align 4
> +	/* Copy 65..128 bytes.  */
> +L(copy128):
> +	CPY_MC(9998f, ldp	E_l, E_h, [src, 32])
> +	CPY_MC(9998f, ldp	F_l, F_h, [src, 48])
> +	cmp	count, 96
> +	b.ls	L(copy96)
> +	CPY_MC(9998f, ldp	G_l, G_h, [srcend, -64])
> +	CPY_MC(9998f, ldp	H_l, H_h, [srcend, -48])
> +	CPY_MC(9998f, stp	G_l, G_h, [dstend, -64])
> +	CPY_MC(9998f, stp	H_l, H_h, [dstend, -48])
> +L(copy96):
> +	CPY_MC(9998f, stp	A_l, A_h, [dstin])
> +	CPY_MC(9998f, stp	B_l, B_h, [dstin, 16])
> +	CPY_MC(9998f, stp	E_l, E_h, [dstin, 32])
> +	CPY_MC(9998f, stp	F_l, F_h, [dstin, 48])
> +	CPY_MC(9998f, stp	C_l, C_h, [dstend, -32])
> +	CPY_MC(9998f, stp	D_l, D_h, [dstend, -16])
> +	mov x0, #0
> +	ret
> +
> +	.p2align 4
> +	/* Copy more than 128 bytes.  */
> +L(copy_long):
> +	/* Use backwards copy if there is an overlap.  */
> +	sub	tmp1, dstin, src
> +	cbz	tmp1, L(copy0)
> +	cmp	tmp1, count
> +	b.lo	L(copy_long_backwards)
> +
> +	/* Copy 16 bytes and then align dst to 16-byte alignment.  */
> +
> +	CPY_MC(9998f, ldp	D_l, D_h, [src])
> +	and	tmp1, dstin, 15
> +	bic	dst, dstin, 15
> +	sub	src, src, tmp1
> +	add	count, count, tmp1	/* Count is now 16 too large.  */
> +	CPY_MC(9998f, ldp	A_l, A_h, [src, 16])
> +	CPY_MC(9998f, stp	D_l, D_h, [dstin])
> +	CPY_MC(9998f, ldp	B_l, B_h, [src, 32])
> +	CPY_MC(9998f, ldp	C_l, C_h, [src, 48])
> +	CPY_MC(9998f, ldp	D_l, D_h, [src, 64]!)
> +	subs	count, count, 128 + 16	/* Test and readjust count.  */
> +	b.ls	L(copy64_from_end)
> +
> +L(loop64):
> +	CPY_MC(9998f, stp	A_l, A_h, [dst, 16])
> +	CPY_MC(9998f, ldp	A_l, A_h, [src, 16])
> +	CPY_MC(9998f, stp	B_l, B_h, [dst, 32])
> +	CPY_MC(9998f, ldp	B_l, B_h, [src, 32])
> +	CPY_MC(9998f, stp	C_l, C_h, [dst, 48])
> +	CPY_MC(9998f, ldp	C_l, C_h, [src, 48])
> +	CPY_MC(9998f, stp	D_l, D_h, [dst, 64]!)
> +	CPY_MC(9998f, ldp	D_l, D_h, [src, 64]!)
> +	subs	count, count, 64
> +	b.hi	L(loop64)
> +
> +	/* Write the last iteration and copy 64 bytes from the end.  */
> +L(copy64_from_end):
> +	CPY_MC(9998f, ldp	E_l, E_h, [srcend, -64])
> +	CPY_MC(9998f, stp	A_l, A_h, [dst, 16])
> +	CPY_MC(9998f, ldp	A_l, A_h, [srcend, -48])
> +	CPY_MC(9998f, stp	B_l, B_h, [dst, 32])
> +	CPY_MC(9998f, ldp	B_l, B_h, [srcend, -32])
> +	CPY_MC(9998f, stp	C_l, C_h, [dst, 48])
> +	CPY_MC(9998f, ldp	C_l, C_h, [srcend, -16])
> +	CPY_MC(9998f, stp	D_l, D_h, [dst, 64])
> +	CPY_MC(9998f, stp	E_l, E_h, [dstend, -64])
> +	CPY_MC(9998f, stp	A_l, A_h, [dstend, -48])
> +	CPY_MC(9998f, stp	B_l, B_h, [dstend, -32])
> +	CPY_MC(9998f, stp	C_l, C_h, [dstend, -16])
> +	mov x0, #0
> +	ret
> +
> +	.p2align 4
> +
> +	/* Large backwards copy for overlapping copies.
> +	   Copy 16 bytes and then align dst to 16-byte alignment.  */
> +L(copy_long_backwards):
> +	CPY_MC(9998f, ldp	D_l, D_h, [srcend, -16])
> +	and	tmp1, dstend, 15
> +	sub	srcend, srcend, tmp1
> +	sub	count, count, tmp1
> +	CPY_MC(9998f, ldp	A_l, A_h, [srcend, -16])
> +	CPY_MC(9998f, stp	D_l, D_h, [dstend, -16])
> +	CPY_MC(9998f, ldp	B_l, B_h, [srcend, -32])
> +	CPY_MC(9998f, ldp	C_l, C_h, [srcend, -48])
> +	CPY_MC(9998f, ldp	D_l, D_h, [srcend, -64]!)
> +	sub	dstend, dstend, tmp1
> +	subs	count, count, 128
> +	b.ls	L(copy64_from_start)
> +
> +L(loop64_backwards):
> +	CPY_MC(9998f, stp	A_l, A_h, [dstend, -16])
> +	CPY_MC(9998f, ldp	A_l, A_h, [srcend, -16])
> +	CPY_MC(9998f, stp	B_l, B_h, [dstend, -32])
> +	CPY_MC(9998f, ldp	B_l, B_h, [srcend, -32])
> +	CPY_MC(9998f, stp	C_l, C_h, [dstend, -48])
> +	CPY_MC(9998f, ldp	C_l, C_h, [srcend, -48])
> +	CPY_MC(9998f, stp	D_l, D_h, [dstend, -64]!)
> +	CPY_MC(9998f, ldp	D_l, D_h, [srcend, -64]!)
> +	subs	count, count, 64
> +	b.hi	L(loop64_backwards)
> +
> +	/* Write the last iteration and copy 64 bytes from the start.  */
> +L(copy64_from_start):
> +	CPY_MC(9998f, ldp	G_l, G_h, [src, 48])
> +	CPY_MC(9998f, stp	A_l, A_h, [dstend, -16])
> +	CPY_MC(9998f, ldp	A_l, A_h, [src, 32])
> +	CPY_MC(9998f, stp	B_l, B_h, [dstend, -32])
> +	CPY_MC(9998f, ldp	B_l, B_h, [src, 16])
> +	CPY_MC(9998f, stp	C_l, C_h, [dstend, -48])
> +	CPY_MC(9998f, ldp	C_l, C_h, [src])
> +	CPY_MC(9998f, stp	D_l, D_h, [dstend, -64])
> +	CPY_MC(9998f, stp	G_l, G_h, [dstin, 48])
> +	CPY_MC(9998f, stp	A_l, A_h, [dstin, 32])
> +	CPY_MC(9998f, stp	B_l, B_h, [dstin, 16])
> +	CPY_MC(9998f, stp	C_l, C_h, [dstin])
> +	mov x0, #0
> +	ret
> +
> +9998:	mov x0, #-EFAULT
> +	ret
> +SYM_FUNC_END(__pi_memcpy_mcs)
> +
> +SYM_FUNC_ALIAS(__memcpy_mcs, __pi_memcpy_mcs)
> +EXPORT_SYMBOL(__memcpy_mcs)
> +SYM_FUNC_ALIAS_WEAK(memcpy_mcs, __memcpy_mcs)
> +EXPORT_SYMBOL(memcpy_mcs)
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 9ef84f31833f..e6519fd329b2 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -79,6 +79,18 @@ void *memcpy(void *dest, const void *src, size_t len)
>  }
>  #endif
>  
> +#ifdef __HAVE_ARCH_MEMCPY_MC
> +#undef memcpy_mcs
> +int memcpy_mcs(void *dest, const void *src, size_t len)
> +{
> +	if (!check_memory_region((unsigned long)src, len, false, _RET_IP_) ||
> +	    !check_memory_region((unsigned long)dest, len, true, _RET_IP_))
> +		return (unsigned long)len;
> +
> +	return __memcpy_mcs(dest, src, len);
> +}
> +#endif
> +
>  void *__asan_memset(void *addr, int c, ssize_t len)
>  {
>  	if (!kasan_check_range(addr, len, true, _RET_IP_))
> -- 
> 2.25.1
> 
