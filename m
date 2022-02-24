Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68F4C268F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:45:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K461r0pHZz3bNg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:45:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QwrQh1nT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=shorne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QwrQh1nT; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K461922DZz2x9d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:45:17 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 195so1177102pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gLheBiXaCIZv8KHzq30zHorn4EV2qXcMwSNimbQy3zI=;
 b=QwrQh1nTAs6HWSBbTgcJdMSEiNEUscEPR6LVipt4zco4UfK3QMG1kDTv85LlJqxzbq
 wZn61KKRq/32svzWYROphqPRi2FPheMJ/g/9dchCsUXgUuTqhHouRDy5/6MXp5On99j7
 nvOPblSQCxQH+P0xnEGGTg/VwYMIBdQFmq6NDB9Q3wRu19H+54lBNwNa8bvhSyvE9cX3
 oQwhmxVg3y02LCITjXXbbruMi0Xr4cG2rAbFeubCXTVNorrx3qFmWinc80XIHdzzUQnd
 zX43zyplPkT2vh8L0m5mINyBaqY2YB6UruNdQhrUcDMCPE1c3hUNMSODOsaPp4k3D3aP
 CbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gLheBiXaCIZv8KHzq30zHorn4EV2qXcMwSNimbQy3zI=;
 b=GisXPcPqV5RFc6GgB8aZb0upr5AoEZslgcAzoLAXVb16ShIJ5JJOsL3lKk8iIC1EPl
 wUE8WzjnTX0cDvU9jgxth5H9YVsa4yIAW4C7oKDE+5E3GB/J5CEpkwy9yk2PnOOBK0Eb
 q9UZ+akiaebbRlaE0FegkIW3yuB7OnKw8hoVpQlgzVswg4l8dPeSszogrTqEGmJwJazy
 E8/O4Bsnt/09U2VISi1IpYkpSIq734pfksMxz+pU1t9bhqIKKBGt0UTKoKIVIt23ggkA
 eJzm/K4Imph5ZFg8DK7k4fgUPhCW70seyXx08i9eDKbVjSOm7MJeK5jxH7FZs6toY1Rg
 mcfw==
X-Gm-Message-State: AOAM531YGXfbcFFwrJq9+i0s8MHJ3lhGbleT9F5FnIGul7zhPKCR4Fas
 3sIt0tS0eCRylpU6+9S7sJw=
X-Google-Smtp-Source: ABdhPJzHuWUaI0haa/d8NA1a6mLYXfr6ftwTf4CoKjIXTJjTcUMpviDRBLxgqOmd6vUhNHBcWbhqWw==
X-Received: by 2002:a05:6a00:13aa:b0:4f1:1e5f:1c39 with SMTP id
 t42-20020a056a0013aa00b004f11e5f1c39mr1622641pfg.24.1645692314566; 
 Thu, 24 Feb 2022 00:45:14 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id n37sm1994077pgl.48.2022.02.24.00.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 00:45:13 -0800 (PST)
Date: Thu, 24 Feb 2022 17:45:12 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
Message-ID: <YhdFmCay+YCVsrRY@antec>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org>
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 ardb@kernel.org, mingo@redhat.com, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 02:13:32PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are no remaining callers of set_fs(), so CONFIG_SET_FS
> can be removed globally, along with the thread_info field and
> any references to it.
> 
> This turns access_ok() into a cheaper check against TASK_SIZE_MAX.
> 
> With CONFIG_SET_FS gone, so drop all remaining references to
> set_fs()/get_fs(), mm_segment_t and uaccess_kernel().
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
...
>  arch/openrisc/Kconfig                     |  1 -
>  arch/openrisc/include/asm/thread_info.h   |  7 ---
>  arch/openrisc/include/asm/uaccess.h       | 23 --------
...
>  fs/exec.c                                 |  6 --
>  include/asm-generic/access_ok.h           | 10 +---
>  include/asm-generic/uaccess.h             | 25 +-------
>  include/linux/syscalls.h                  |  4 --
>  include/linux/uaccess.h                   | 33 -----------
>  include/rdma/ib.h                         |  2 +-
>  kernel/events/callchain.c                 |  4 --
>  kernel/events/core.c                      |  3 -
>  kernel/exit.c                             | 14 -----
>  kernel/kthread.c                          |  5 --
>  kernel/stacktrace.c                       |  3 -
>  kernel/trace/bpf_trace.c                  |  4 --
>  mm/maccess.c                              | 11 ----
>  mm/memory.c                               |  8 ---
>  net/bpfilter/bpfilter_kern.c              |  2 +-
>  72 files changed, 10 insertions(+), 522 deletions(-)
>  delete mode 100644 arch/arc/include/asm/segment.h
>  delete mode 100644 arch/csky/include/asm/segment.h
>  delete mode 100644 arch/h8300/include/asm/segment.h
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index fa5db36bda67..99349547afed 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -24,9 +24,6 @@ config KEXEC_ELF
>  config HAVE_IMA_KEXEC
>  	bool
>  
> -config SET_FS
> -	bool
> -
>  config HOTPLUG_SMT
>  	bool
>  
...
> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index f724b3f1aeed..0d68adf6e02b 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -36,7 +36,6 @@ config OPENRISC
>  	select ARCH_WANT_FRAME_POINTERS
>  	select GENERIC_IRQ_MULTI_HANDLER
>  	select MMU_GATHER_NO_RANGE if MMU
> -	select SET_FS
>  	select TRACE_IRQFLAGS_SUPPORT
>  
>  config CPU_BIG_ENDIAN
> diff --git a/arch/openrisc/include/asm/thread_info.h b/arch/openrisc/include/asm/thread_info.h
> index 659834ab87fa..4af3049c34c2 100644
> --- a/arch/openrisc/include/asm/thread_info.h
> +++ b/arch/openrisc/include/asm/thread_info.h
> @@ -40,18 +40,12 @@
>   */
>  #ifndef __ASSEMBLY__
>  
> -typedef unsigned long mm_segment_t;
> -
>  struct thread_info {
>  	struct task_struct	*task;		/* main task structure */
>  	unsigned long		flags;		/* low level flags */
>  	__u32			cpu;		/* current CPU */
>  	__s32			preempt_count; /* 0 => preemptable, <0 => BUG */
>  
> -	mm_segment_t		addr_limit; /* thread address space:
> -					       0-0x7FFFFFFF for user-thead
> -					       0-0xFFFFFFFF for kernel-thread
> -					     */
>  	__u8			supervisor_stack[0];
>  
>  	/* saved context data */
> @@ -71,7 +65,6 @@ struct thread_info {
>  	.flags		= 0,				\
>  	.cpu		= 0,				\
>  	.preempt_count	= INIT_PREEMPT_COUNT,		\
> -	.addr_limit	= KERNEL_DS,			\
>  	.ksp            = 0,                            \
>  }
>  
> diff --git a/arch/openrisc/include/asm/uaccess.h b/arch/openrisc/include/asm/uaccess.h
> index 8f049ec99b3e..d6500a374e18 100644
> --- a/arch/openrisc/include/asm/uaccess.h
> +++ b/arch/openrisc/include/asm/uaccess.h
> @@ -22,29 +22,6 @@
>  #include <linux/string.h>
>  #include <asm/page.h>
>  #include <asm/extable.h>
> -
> -/*
> - * The fs value determines whether argument validity checking should be
> - * performed or not.  If get_fs() == USER_DS, checking is performed, with
> - * get_fs() == KERNEL_DS, checking is bypassed.
> - *
> - * For historical reasons, these macros are grossly misnamed.
> - */
> -
> -/* addr_limit is the maximum accessible address for the task. we misuse
> - * the KERNEL_DS and USER_DS values to both assign and compare the
> - * addr_limit values through the equally misnamed get/set_fs macros.
> - * (see above)
> - */
> -
> -#define KERNEL_DS	(~0UL)
> -
> -#define USER_DS		(TASK_SIZE)
> -#define get_fs()	(current_thread_info()->addr_limit)
> -#define set_fs(x)	(current_thread_info()->addr_limit = (x))
> -
> -#define uaccess_kernel()	(get_fs() == KERNEL_DS)
> -
>  #include <asm-generic/access_ok.h>
>  
>  /*
...
> diff --git a/fs/exec.c b/fs/exec.c
> index 79f2c9483302..bc68a0c089ac 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -1303,12 +1303,6 @@ int begin_new_exec(struct linux_binprm * bprm)
>  	if (retval)
>  		goto out_unlock;
>  
> -	/*
> -	 * Ensure that the uaccess routines can actually operate on userspace
> -	 * pointers:
> -	 */
> -	force_uaccess_begin();
> -
>  	if (me->flags & PF_KTHREAD)
>  		free_kthread_struct(me);
>  	me->flags &= ~(PF_RANDOMIZE | PF_FORKNOEXEC | PF_KTHREAD |
> diff --git a/include/asm-generic/access_ok.h b/include/asm-generic/access_ok.h
> index 1aad8964d2ed..88a7cb5d9aad 100644
> --- a/include/asm-generic/access_ok.h
> +++ b/include/asm-generic/access_ok.h
> @@ -16,16 +16,8 @@
>  #define TASK_SIZE_MAX			TASK_SIZE
>  #endif
>  
> -#ifndef uaccess_kernel
> -#ifdef CONFIG_SET_FS
> -#define uaccess_kernel()		(get_fs().seg == KERNEL_DS.seg)
> -#else
> -#define uaccess_kernel()		(0)
> -#endif
> -#endif
> -
>  #ifndef user_addr_max
> -#define user_addr_max()			(uaccess_kernel() ? ~0UL : TASK_SIZE_MAX)
> +#define user_addr_max()			TASK_SIZE_MAX
>  #endif
>  
>  #ifndef __access_ok
> diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
> index ebc685dc8d74..a5be9e61a2a2 100644
> --- a/include/asm-generic/uaccess.h
> +++ b/include/asm-generic/uaccess.h
> @@ -8,6 +8,7 @@
>   * address space, e.g. all NOMMU machines.
>   */
>  #include <linux/string.h>
> +#include <asm-generic/access_ok.h>
>  
>  #ifdef CONFIG_UACCESS_MEMCPY
>  #include <asm/unaligned.h>
> @@ -94,30 +95,6 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>  #define INLINE_COPY_TO_USER
>  #endif /* CONFIG_UACCESS_MEMCPY */
>  
> -#ifdef CONFIG_SET_FS
> -#define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
> -
> -#ifndef KERNEL_DS
> -#define KERNEL_DS	MAKE_MM_SEG(~0UL)
> -#endif
> -
> -#ifndef USER_DS
> -#define USER_DS		MAKE_MM_SEG(TASK_SIZE - 1)
> -#endif
> -
> -#ifndef get_fs
> -#define get_fs()	(current_thread_info()->addr_limit)
> -
> -static inline void set_fs(mm_segment_t fs)
> -{
> -	current_thread_info()->addr_limit = fs;
> -}
> -#endif
> -
> -#endif /* CONFIG_SET_FS */
> -
> -#include <asm-generic/access_ok.h>
> -
>  /*
>   * These are the main single-value transfer routines.  They automatically
>   * use the right size if we just have the right pointer type.
> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> index 819c0cb00b6d..a34b0f9a9972 100644
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -290,10 +290,6 @@ static inline void addr_limit_user_check(void)
>  		return;
>  #endif
>  
> -	if (CHECK_DATA_CORRUPTION(uaccess_kernel(),
> -				  "Invalid address limit on user-mode return"))
> -		force_sig(SIGKILL);
> -
>  #ifdef TIF_FSCHECK
>  	clear_thread_flag(TIF_FSCHECK);
>  #endif
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 2c31667e62e0..2421a41f3a8e 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -10,39 +10,6 @@
>  
>  #include <asm/uaccess.h>
>  
> -#ifdef CONFIG_SET_FS
> -/*
> - * Force the uaccess routines to be wired up for actual userspace access,
> - * overriding any possible set_fs(KERNEL_DS) still lingering around.  Undone
> - * using force_uaccess_end below.
> - */
> -static inline mm_segment_t force_uaccess_begin(void)
> -{
> -	mm_segment_t fs = get_fs();
> -
> -	set_fs(USER_DS);
> -	return fs;
> -}
> -
> -static inline void force_uaccess_end(mm_segment_t oldfs)
> -{
> -	set_fs(oldfs);
> -}
> -#else /* CONFIG_SET_FS */
> -typedef struct {
> -	/* empty dummy */
> -} mm_segment_t;
> -
> -static inline mm_segment_t force_uaccess_begin(void)
> -{
> -	return (mm_segment_t) { };
> -}
> -
> -static inline void force_uaccess_end(mm_segment_t oldfs)
> -{
> -}
> -#endif /* CONFIG_SET_FS */
> -
>  /*
>   * Architectures should provide two primitives (raw_copy_{to,from}_user())
>   * and get rid of their private instances of copy_{to,from}_user() and
> diff --git a/include/rdma/ib.h b/include/rdma/ib.h
> index 83139b9ce409..f7c185ff7a11 100644
> --- a/include/rdma/ib.h
> +++ b/include/rdma/ib.h
> @@ -75,7 +75,7 @@ struct sockaddr_ib {
>   */
>  static inline bool ib_safe_file_access(struct file *filp)
>  {
> -	return filp->f_cred == current_cred() && !uaccess_kernel();
> +	return filp->f_cred == current_cred();
>  }
>  
>  #endif /* _RDMA_IB_H */
> diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> index 58cbe357fb2b..1273be84392c 100644
> --- a/kernel/events/callchain.c
> +++ b/kernel/events/callchain.c
> @@ -209,17 +209,13 @@ get_perf_callchain(struct pt_regs *regs, u32 init_nr, bool kernel, bool user,
>  		}
>  
>  		if (regs) {
> -			mm_segment_t fs;
> -
>  			if (crosstask)
>  				goto exit_put;
>  
>  			if (add_mark)
>  				perf_callchain_store_context(&ctx, PERF_CONTEXT_USER);
>  
> -			fs = force_uaccess_begin();
>  			perf_callchain_user(&ctx, regs);
> -			force_uaccess_end(fs);
>  		}
>  	}
>  
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 57c7197838db..11ca7303d6df 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6746,7 +6746,6 @@ perf_output_sample_ustack(struct perf_output_handle *handle, u64 dump_size,
>  		unsigned long sp;
>  		unsigned int rem;
>  		u64 dyn_size;
> -		mm_segment_t fs;
>  
>  		/*
>  		 * We dump:
> @@ -6764,9 +6763,7 @@ perf_output_sample_ustack(struct perf_output_handle *handle, u64 dump_size,
>  
>  		/* Data. */
>  		sp = perf_user_stack_pointer(regs);
> -		fs = force_uaccess_begin();
>  		rem = __output_copy_user(handle, (void *) sp, dump_size);
> -		force_uaccess_end(fs);
>  		dyn_size = dump_size - rem;
>  
>  		perf_output_skip(handle, rem);
> diff --git a/kernel/exit.c b/kernel/exit.c
> index b00a25bb4ab9..0884a75bc2f8 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -737,20 +737,6 @@ void __noreturn do_exit(long code)
>  
>  	WARN_ON(blk_needs_flush_plug(tsk));
>  
> -	/*
> -	 * If do_dead is called because this processes oopsed, it's possible
> -	 * that get_fs() was left as KERNEL_DS, so reset it to USER_DS before
> -	 * continuing. Amongst other possible reasons, this is to prevent
> -	 * mm_release()->clear_child_tid() from writing to a user-controlled
> -	 * kernel address.
> -	 *
> -	 * On uptodate architectures force_uaccess_begin is a noop.  On
> -	 * architectures that still have set_fs/get_fs in addition to handling
> -	 * oopses handles kernel threads that run as set_fs(KERNEL_DS) by
> -	 * default.
> -	 */
> -	force_uaccess_begin();
> -
>  	kcov_task_exit(tsk);
>  
>  	coredump_task_exit(tsk);
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 38c6dd822da8..16c2275d4b50 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -55,7 +55,6 @@ struct kthread {
>  	int result;
>  	int (*threadfn)(void *);
>  	void *data;
> -	mm_segment_t oldfs;
>  	struct completion parked;
>  	struct completion exited;
>  #ifdef CONFIG_BLK_CGROUP
> @@ -1441,8 +1440,6 @@ void kthread_use_mm(struct mm_struct *mm)
>  		mmdrop(active_mm);
>  	else
>  		smp_mb();
> -
> -	to_kthread(tsk)->oldfs = force_uaccess_begin();
>  }
>  EXPORT_SYMBOL_GPL(kthread_use_mm);
>  
> @@ -1457,8 +1454,6 @@ void kthread_unuse_mm(struct mm_struct *mm)
>  	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
>  	WARN_ON_ONCE(!tsk->mm);
>  
> -	force_uaccess_end(to_kthread(tsk)->oldfs);
> -
>  	task_lock(tsk);
>  	/*
>  	 * When a kthread stops operating on an address space, the loop
> diff --git a/kernel/stacktrace.c b/kernel/stacktrace.c
> index 9c625257023d..9ed5ce989415 100644
> --- a/kernel/stacktrace.c
> +++ b/kernel/stacktrace.c
> @@ -226,15 +226,12 @@ unsigned int stack_trace_save_user(unsigned long *store, unsigned int size)
>  		.store	= store,
>  		.size	= size,
>  	};
> -	mm_segment_t fs;
>  
>  	/* Trace user stack if not a kernel thread */
>  	if (current->flags & PF_KTHREAD)
>  		return 0;
>  
> -	fs = force_uaccess_begin();
>  	arch_stack_walk_user(consume_entry, &c, task_pt_regs(current));
> -	force_uaccess_end(fs);
>  
>  	return c.len;
>  }
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index 21aa30644219..8115fff17018 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -332,8 +332,6 @@ BPF_CALL_3(bpf_probe_write_user, void __user *, unsafe_ptr, const void *, src,
>  	if (unlikely(in_interrupt() ||
>  		     current->flags & (PF_KTHREAD | PF_EXITING)))
>  		return -EPERM;
> -	if (unlikely(uaccess_kernel()))
> -		return -EPERM;
>  	if (unlikely(!nmi_uaccess_okay()))
>  		return -EPERM;
>  
> @@ -835,8 +833,6 @@ static int bpf_send_signal_common(u32 sig, enum pid_type type)
>  	 */
>  	if (unlikely(current->flags & (PF_KTHREAD | PF_EXITING)))
>  		return -EPERM;
> -	if (unlikely(uaccess_kernel()))
> -		return -EPERM;
>  	if (unlikely(!nmi_uaccess_okay()))
>  		return -EPERM;
>  
> diff --git a/mm/maccess.c b/mm/maccess.c
> index cbd1b3959af2..106820b33a2b 100644
> --- a/mm/maccess.c
> +++ b/mm/maccess.c
> @@ -113,14 +113,11 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
>  long copy_from_user_nofault(void *dst, const void __user *src, size_t size)
>  {
>  	long ret = -EFAULT;
> -	mm_segment_t old_fs = force_uaccess_begin();
> -
>  	if (access_ok(src, size)) {
>  		pagefault_disable();
>  		ret = __copy_from_user_inatomic(dst, src, size);
>  		pagefault_enable();
>  	}
> -	force_uaccess_end(old_fs);
>  
>  	if (ret)
>  		return -EFAULT;
> @@ -140,14 +137,12 @@ EXPORT_SYMBOL_GPL(copy_from_user_nofault);
>  long copy_to_user_nofault(void __user *dst, const void *src, size_t size)
>  {
>  	long ret = -EFAULT;
> -	mm_segment_t old_fs = force_uaccess_begin();
>  
>  	if (access_ok(dst, size)) {
>  		pagefault_disable();
>  		ret = __copy_to_user_inatomic(dst, src, size);
>  		pagefault_enable();
>  	}
> -	force_uaccess_end(old_fs);
>  
>  	if (ret)
>  		return -EFAULT;
> @@ -176,17 +171,14 @@ EXPORT_SYMBOL_GPL(copy_to_user_nofault);
>  long strncpy_from_user_nofault(char *dst, const void __user *unsafe_addr,
>  			      long count)
>  {
> -	mm_segment_t old_fs;
>  	long ret;
>  
>  	if (unlikely(count <= 0))
>  		return 0;
>  
> -	old_fs = force_uaccess_begin();
>  	pagefault_disable();
>  	ret = strncpy_from_user(dst, unsafe_addr, count);
>  	pagefault_enable();
> -	force_uaccess_end(old_fs);
>  
>  	if (ret >= count) {
>  		ret = count;
> @@ -216,14 +208,11 @@ long strncpy_from_user_nofault(char *dst, const void __user *unsafe_addr,
>   */
>  long strnlen_user_nofault(const void __user *unsafe_addr, long count)
>  {
> -	mm_segment_t old_fs;
>  	int ret;
>  
> -	old_fs = force_uaccess_begin();
>  	pagefault_disable();
>  	ret = strnlen_user(unsafe_addr, count);
>  	pagefault_enable();
> -	force_uaccess_end(old_fs);
>  
>  	return ret;
>  }
> diff --git a/mm/memory.c b/mm/memory.c
> index c125c4969913..9a6ebf68a846 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5256,14 +5256,6 @@ void print_vma_addr(char *prefix, unsigned long ip)
>  #if defined(CONFIG_PROVE_LOCKING) || defined(CONFIG_DEBUG_ATOMIC_SLEEP)
>  void __might_fault(const char *file, int line)
>  {
> -	/*
> -	 * Some code (nfs/sunrpc) uses socket ops on kernel memory while
> -	 * holding the mmap_lock, this is safe because kernel memory doesn't
> -	 * get paged out, therefore we'll never actually fault, and the
> -	 * below annotations will generate false positives.
> -	 */
> -	if (uaccess_kernel())
> -		return;
>  	if (pagefault_disabled())
>  		return;
>  	__might_sleep(file, line);
> diff --git a/net/bpfilter/bpfilter_kern.c b/net/bpfilter/bpfilter_kern.c
> index 51a941b56ec3..422ec6e7ccff 100644

Acked-by: Stafford Horne <shorne@gmail.com> [openrisc, asm-generic]

Thanks!
