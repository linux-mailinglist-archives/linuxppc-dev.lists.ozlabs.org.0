Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5261B22D707
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 13:23:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDNxP1WQTzDrqV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 21:23:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDNvY6jkPzF0nY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 21:22:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=T6iREe84; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BDNvX2BG8z9sR4;
 Sat, 25 Jul 2020 21:22:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595676137;
 bh=1WrvH7nv1f3Bjem3KtcRo081yUBDpwZ9nkJKgtI84fQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=T6iREe84tTThKux1ZQz8EADWdtsEvOiPmHyfbZd6aVxUSbfmG2BZiguaqtVX8eZyJ
 1ce7pohXhAkysfDyw0RGiJUPFEZmdFF2WNE9D8uRvR5DDBV2fVvbjCHqwLLs5XB9Iq
 EGkamKMdXioB1AKqaxBqGTNJX2T5KcqzjqabI2irQRak6lTVd/hhgzOEiOjRvyWP8B
 O4PF48WZMoKmMrvZ1XNNHfu7Gza0Nr4l0DfDDofe7kunAghV7qKR2gglWvIsJ0zcc6
 lh1g4PhApu6ETfJGGjyqzQfOXEKg9pHovWtVs/Wo+c46CdqAH0k8HqRgpMW2WqmZHA
 0cOSKDGmrx0+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2] powerpc/uaccess: simplify the get_fs() set_fs() logic
In-Reply-To: <dd2876b808ea38eb7b7f760ecd6ce06096c61fb5.1580295551.git.christophe.leroy@c-s.fr>
References: <dd2876b808ea38eb7b7f760ecd6ce06096c61fb5.1580295551.git.christophe.leroy@c-s.fr>
Date: Sat, 25 Jul 2020 21:22:11 +1000
Message-ID: <87mu3nyh3w.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Unfortunately this would collide messily with "uaccess: remove
segment_eq" in linux-next, so I'll ask you to do a respin based on that,
some comments below.

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> On powerpc, we only have USER_DS and KERNEL_DS
>
> Today, this is managed as an 'unsigned long' data space limit
> which is used to compare the passed address with, plus a bit
> in the thread_info flags that is set whenever modifying the limit
> to enable the verification in addr_limit_user_check()
>
> The limit is either the last address of user space when USER_DS is
> set, and the last address of address space when KERNEL_DS is set.
> In both cases, the limit is a compiletime constant.
>
> get_fs() returns the limit, which is part of thread_info struct
> set_fs() updates the limit then set the TI_FSCHECK flag.
> addr_limit_user_check() check the flag, and if it is set it checks
> the limit is the user limit, then unsets the TI_FSCHECK flag.
>
> In addition, when the flag is set the syscall exit work is involved.
> This exit work is heavy compared to normal syscall exit as it goes
> through normal exception exit instead of the fast syscall exit.
>
> Rename this TI_FSCHECK flag to TIF_KERNEL_DS flag which tells whether
> KERNEL_DS or USER_DS is set. Get mm_segment_t be redifined as a bool
> struct that is either false (for USER_DS) or true (for KERNEL_DS).
> When TIF_KERNEL_DS is set, the limit is ~0UL. Otherwise it is
> TASK_SIZE_USER (resp TASK_SIZE_USER64 on PPC64). When KERNEL_DS is
> set, there is no range to check. Define TI_FSCHECK as an alias to
> TIF_KERNEL_DS.

I'd rather avoid the "DS" name any more than we have to. Maybe it means
"data space" but that's not a very common term.

The generic helper these days is called uaccess_kernel(), which returns
true when uaccess routines are allowed to access the kernel.

So calling it TIF_UACCESS_KERNEL would work I think?

The bool could be called uaccess_kernel.
And END_OF_USER_DS could be USER_ADDR_MAX.

> On exit, involve exit work when the bit is set, i.e. when KERNEL_DS
> is set. addr_limit_user_check() will clear the bit and kill the
> user process.

I guess this is safe. The check was added to make sure we never return
to userspace with KERNEL_DS set, but using the actual TIF flag to
determine the address limit should be equally safe, and avoid the
overhead of the check in the good case.

cheers


> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index 8387698bd5b6..e9e3c3b0f05e 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -84,7 +84,7 @@ void start_thread(struct pt_regs *regs, unsigned long fdptr, unsigned long sp);
>  void release_thread(struct task_struct *);
>  
>  typedef struct {
> -	unsigned long seg;
> +	bool is_kernel_ds;
>  } mm_segment_t;
>  
>  #define TS_FPR(i) fp_state.fpr[i][TS_FPROFFSET]
> @@ -148,7 +148,6 @@ struct thread_struct {
>  	unsigned long	ksp_vsid;
>  #endif
>  	struct pt_regs	*regs;		/* Pointer to saved register state */
> -	mm_segment_t	addr_limit;	/* for get_fs() validation */
>  #ifdef CONFIG_BOOKE
>  	/* BookE base exception scratch space; align on cacheline */
>  	unsigned long	normsave[8] ____cacheline_aligned;
> @@ -289,7 +288,6 @@ struct thread_struct {
>  #define INIT_THREAD { \
>  	.ksp = INIT_SP, \
>  	.ksp_limit = INIT_SP_LIMIT, \
> -	.addr_limit = KERNEL_DS, \
>  	.pgdir = swapper_pg_dir, \
>  	.fpexc_mode = MSR_FE0 | MSR_FE1, \
>  	SPEFSCR_INIT \
> @@ -298,7 +296,6 @@ struct thread_struct {
>  #define INIT_THREAD  { \
>  	.ksp = INIT_SP, \
>  	.regs = (struct pt_regs *)INIT_SP - 1, /* XXX bogus, I think */ \
> -	.addr_limit = KERNEL_DS, \
>  	.fpexc_mode = 0, \
>  	.fscr = FSCR_TAR | FSCR_EBB \
>  }
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index a2270749b282..a681ce624ab7 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -69,7 +69,7 @@ struct thread_info {
>  #define INIT_THREAD_INFO(tsk)			\
>  {						\
>  	.preempt_count = INIT_PREEMPT_COUNT,	\
> -	.flags =	0,			\
> +	.flags =	_TIF_KERNEL_DS,		\
>  }
>  
>  #define THREAD_SIZE_ORDER	(THREAD_SHIFT - PAGE_SHIFT)
> @@ -90,7 +90,8 @@ void arch_setup_new_exec(void);
>  #define TIF_SYSCALL_TRACE	0	/* syscall trace active */
>  #define TIF_SIGPENDING		1	/* signal pending */
>  #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
> -#define TIF_FSCHECK		3	/* Check FS is USER_DS on return */
> +#define TIF_KERNEL_DS		3	/* KERNEL_DS is set */
> +#define TIF_FSCHECK	TIF_KERNEL_DS
>  #define TIF_SYSCALL_EMU		4	/* syscall emulation active */
>  #define TIF_RESTORE_TM		5	/* need to restore TM FP/VEC/VSX */
>  #define TIF_PATCH_PENDING	6	/* pending live patching update */
> @@ -130,7 +131,7 @@ void arch_setup_new_exec(void);
>  #define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
>  #define _TIF_EMULATE_STACK_STORE	(1<<TIF_EMULATE_STACK_STORE)
>  #define _TIF_NOHZ		(1<<TIF_NOHZ)
> -#define _TIF_FSCHECK		(1<<TIF_FSCHECK)
> +#define _TIF_KERNEL_DS		(1 << TIF_KERNEL_DS)
>  #define _TIF_SYSCALL_EMU	(1<<TIF_SYSCALL_EMU)
>  #define _TIF_SYSCALL_DOTRACE	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
>  				 _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT | \
> @@ -139,7 +140,7 @@ void arch_setup_new_exec(void);
>  #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
>  				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
>  				 _TIF_RESTORE_TM | _TIF_PATCH_PENDING | \
> -				 _TIF_FSCHECK)
> +				 _TIF_KERNEL_DS)
>  #define _TIF_PERSYSCALL_MASK	(_TIF_RESTOREALL|_TIF_NOERROR)
>  
>  /* Bits in local_flags */
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index c92fe7fe9692..391c3a26f980 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -21,43 +21,44 @@
>  
>  #define MAKE_MM_SEG(s)  ((mm_segment_t) { (s) })
>  
> -#define KERNEL_DS	MAKE_MM_SEG(~0UL)
> -#ifdef __powerpc64__
> -/* We use TASK_SIZE_USER64 as TASK_SIZE is not constant */
> -#define USER_DS		MAKE_MM_SEG(TASK_SIZE_USER64 - 1)
> -#else
> -#define USER_DS		MAKE_MM_SEG(TASK_SIZE - 1)
> -#endif
> +#define KERNEL_DS	MAKE_MM_SEG(true)
> +#define USER_DS		MAKE_MM_SEG(false)
> +
> +#define get_fs()	(MAKE_MM_SEG(test_thread_flag(TIF_KERNEL_DS)))
>  
> -#define get_fs()	(current->thread.addr_limit)
> +#define segment_eq(a, b)	((a).is_kernel_ds == (b).is_kernel_ds)
>  
>  static inline void set_fs(mm_segment_t fs)
>  {
> -	current->thread.addr_limit = fs;
> -	/* On user-mode return check addr_limit (fs) is correct */
> -	set_thread_flag(TIF_FSCHECK);
> +	update_thread_flag(TIF_KERNEL_DS, segment_eq(fs, KERNEL_DS));
>  }
>  
> -#define segment_eq(a, b)	((a).seg == (b).seg)
> -
> -#define user_addr_max()	(get_fs().seg)
> +#define user_addr_max()	(segment_eq(get_fs(), KERNEL_DS) ? ~0UL : END_OF_USER_DS - 1)
>  
>  #ifdef __powerpc64__
> +
> +#define END_OF_USER_DS		TASK_SIZE_USER64
> +
>  /*
>   * This check is sufficient because there is a large enough
>   * gap between user addresses and the kernel addresses
>   */
>  #define __access_ok(addr, size, segment)	\
> -	(((addr) <= (segment).seg) && ((size) <= (segment).seg))
> +	segment_eq(segment, KERNEL_DS) ?	\
> +	1 : (addr) < END_OF_USER_DS && ((size) < END_OF_USER_DS)
>  
>  #else
>  
> +#define END_OF_USER_DS		TASK_SIZE
> +
>  static inline int __access_ok(unsigned long addr, unsigned long size,
>  			mm_segment_t seg)
>  {
> -	if (addr > seg.seg)
> +	if (segment_eq(seg, KERNEL_DS))
> +		return 1;
> +	if (addr >= END_OF_USER_DS)
>  		return 0;
> -	return (size == 0 || size - 1 <= seg.seg - addr);
> +	return addr + size <= END_OF_USER_DS;
>  }
>  
>  #endif
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index c077acb983a1..bf005dd9407e 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -110,7 +110,7 @@ static nokprobe_inline long address_ok(struct pt_regs *regs,
>  		return 1;
>  	if (__access_ok(ea, 1, USER_DS))
>  		/* Access overlaps the end of the user region */
> -		regs->dar = USER_DS.seg;
> +		regs->dar = END_OF_USER_DS;
>  	else
>  		regs->dar = ea;
>  	return 0;
> -- 
> 2.25.0
