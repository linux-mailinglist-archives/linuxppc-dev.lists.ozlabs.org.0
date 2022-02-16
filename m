Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D97CC4B90A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 19:45:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzRjh3HY7z3cY7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 05:45:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ravnborg.org
 (client-ip=91.221.196.215; helo=mx1.smtp.larsendata.com;
 envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzRjF28yhz30KR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 05:45:20 +1100 (AEDT)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 7cf017e4-8f58-11ec-baa1-0050568c148b;
 Wed, 16 Feb 2022 18:44:35 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3B79C194B3E;
 Wed, 16 Feb 2022 19:44:17 +0100 (CET)
Date: Wed, 16 Feb 2022 19:44:13 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
Message-ID: <Yg1F/VT4vRX4aHEt@ravnborg.org>
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
 viro@zeniv.linux.org.uk, shorne@gmail.com, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 davem@davemloft.net, green.hu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

Fix spelling in $subject...

sparc/Kconfig b/arch/sparc/Kconfig
> index 9f6f9bce5292..9276f321b3e3 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -46,7 +46,6 @@ config SPARC
>  	select LOCKDEP_SMALL if LOCKDEP
>  	select NEED_DMA_MAP_STATE
>  	select NEED_SG_DMA_LENGTH
> -	select SET_FS
>  	select TRACE_IRQFLAGS_SUPPORT
>  
>  config SPARC32
> @@ -101,6 +100,7 @@ config SPARC64
>  	select HAVE_SETUP_PER_CPU_AREA
>  	select NEED_PER_CPU_EMBED_FIRST_CHUNK
>  	select NEED_PER_CPU_PAGE_FIRST_CHUNK
> +	select SET_FS
This looks wrong - looks like some merge went wrong here.

>  
>  config ARCH_PROC_KCORE_TEXT
>  	def_bool y
> diff --git a/arch/sparc/include/asm/processor_32.h b/arch/sparc/include/asm/processor_32.h
> index 647bf0ac7beb..b26c35336b51 100644
> --- a/arch/sparc/include/asm/processor_32.h
> +++ b/arch/sparc/include/asm/processor_32.h
> @@ -32,10 +32,6 @@ struct fpq {
>  };
>  #endif
>  
> -typedef struct {
> -	int seg;
> -} mm_segment_t;
> -
>  /* The Sparc processor specific thread struct. */
>  struct thread_struct {
>  	struct pt_regs *kregs;
> @@ -50,11 +46,9 @@ struct thread_struct {
>  	unsigned long   fsr;
>  	unsigned long   fpqdepth;
>  	struct fpq	fpqueue[16];
> -	mm_segment_t current_ds;
>  };
>  
>  #define INIT_THREAD  { \
> -	.current_ds = KERNEL_DS, \
>  	.kregs = (struct pt_regs *)(init_stack+THREAD_SIZE)-1 \
>  }
>  
> diff --git a/arch/sparc/include/asm/uaccess_32.h b/arch/sparc/include/asm/uaccess_32.h
> index 367747116260..9fd6c53644b6 100644
> --- a/arch/sparc/include/asm/uaccess_32.h
> +++ b/arch/sparc/include/asm/uaccess_32.h
> @@ -12,19 +12,6 @@
>  #include <linux/string.h>
>  
>  #include <asm/processor.h>
> -
> -/* Sparc is not segmented, however we need to be able to fool access_ok()
> - * when doing system calls from kernel mode legitimately.
> - *
> - * "For historical reasons, these macros are grossly misnamed." -Linus
> - */
> -
> -#define KERNEL_DS   ((mm_segment_t) { 0 })
> -#define USER_DS     ((mm_segment_t) { -1 })
> -
> -#define get_fs()	(current->thread.current_ds)
> -#define set_fs(val)	((current->thread.current_ds) = (val))
> -
>  #include <asm-generic/access_ok.h>
>  
>  /* Uh, these should become the main single-value transfer routines..
> diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
> index 2dc0bf9fe62e..88c0c14aaff0 100644
> --- a/arch/sparc/kernel/process_32.c
> +++ b/arch/sparc/kernel/process_32.c
> @@ -300,7 +300,6 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
>  		extern int nwindows;
>  		unsigned long psr;
>  		memset(new_stack, 0, STACKFRAME_SZ + TRACEREG_SZ);
> -		p->thread.current_ds = KERNEL_DS;
>  		ti->kpc = (((unsigned long) ret_from_kernel_thread) - 0x8);
>  		childregs->u_regs[UREG_G1] = sp; /* function */
>  		childregs->u_regs[UREG_G2] = arg;
> @@ -311,7 +310,6 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
>  	}
>  	memcpy(new_stack, (char *)regs - STACKFRAME_SZ, STACKFRAME_SZ + TRACEREG_SZ);
>  	childregs->u_regs[UREG_FP] = sp;
> -	p->thread.current_ds = USER_DS;
>  	ti->kpc = (((unsigned long) ret_from_fork) - 0x8);
>  	ti->kpsr = current->thread.fork_kpsr | PSR_PIL;
>  	ti->kwim = current->thread.fork_kwim;

Other than the above the sparc32 changes looks fine, and with the Kconf
stuff fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org> # for sparc32 changes
