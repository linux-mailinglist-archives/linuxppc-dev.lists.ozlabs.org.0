Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B245992D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 03:58:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M84fJ6JF1z3cdn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 11:58:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o92Wkus4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o92Wkus4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M84QY345nz3bVt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 11:48:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 918DD6142E
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 01:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07263C43147
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 01:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660873680;
	bh=5JatSOxYSIl5vDUQiorJPobY5OCnJz2Lpd3CiqC5c7c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o92Wkus4Gun/HKgQhH8d0eBMVCpmCdlW8KEESP8A4DPwvdJcQNGcvNjFA0WMGs275
	 darUrKzPyVpYB1fULzaeeoPvRwZC8ItbGQNcwte/iRmK9uYD1NXIOfxOlXNtOCwL/3
	 jnXMjpcPcPion0GnZi9gme1v4y8PqThy2wpEWiceMhTD+kBPb2kPE3AKyTKBTVpyeH
	 aB54q2Aeo2PeRHQCoNRUW0qOagpmKrdNAG1f+3S2wVgU2Nn/A5Ud4dBf9qRX/+N4nD
	 fIedb6JAK+px5I2d9CUo9JeeNcsglTkOzb9hFHkoTFeP/RFB5wCZ/L37eGR6OLunqJ
	 VAHl5tf34822g==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-11c4d7d4683so3756416fac.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 18:47:59 -0700 (PDT)
X-Gm-Message-State: ACgBeo0OELeEmIlMAi/cpDY+e7k3NBa4+YihcxtE+2rHoALvKNcFBUZD
	R/rL4vur6kJrcLn46srVEBRaacAelj8pIsevcR0=
X-Google-Smtp-Source: AA6agR4OyqmepS4+VTsu9a8dSLWpo0jz7CjT66zOKAEPn9pWyDEV5uDKfXPjUxFtFMX/enUe8dxNMNdryyp/ovEVZgs=
X-Received: by 2002:a05:6870:c596:b0:101:6409:ae62 with SMTP id
 ba22-20020a056870c59600b001016409ae62mr5559480oab.112.1660873668265; Thu, 18
 Aug 2022 18:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 19 Aug 2022 09:47:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ1FEtQoZ4RpCR9xxzMsKsw1MHFnKe0EtB-JjfsyLbX=w@mail.gmail.com>
Message-ID: <CAJF2gTQ1FEtQoZ4RpCR9xxzMsKsw1MHFnKe0EtB-JjfsyLbX=w@mail.gmail.com>
Subject: Re: [PATCH] kernel: exit: cleanup release_thread()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 19 Aug 2022 11:57:23 +1000
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
Cc: Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org, linux-snps-arc@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christ
 ian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>, Chris Zankel <chris@zankel.net>, linux-um@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Richard Weinberger <r
 ichard@nod.at>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For csky part

Acked-by: Guo Ren <guoren@kernel.org>

On Fri, Aug 19, 2022 at 9:39 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Only x86 has own release_thread(), introduce a new weak
> release_thread() function to clean empty definitions in
> other ARCHs.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/alpha/include/asm/processor.h      | 2 --
>  arch/alpha/kernel/process.c             | 5 -----
>  arch/arc/include/asm/processor.h        | 3 ---
>  arch/arm/include/asm/processor.h        | 3 ---
>  arch/arm/kernel/process.c               | 4 ----
>  arch/arm64/include/asm/processor.h      | 3 ---
>  arch/arm64/kernel/process.c             | 4 ----
>  arch/csky/include/asm/processor.h       | 5 -----
>  arch/hexagon/include/asm/processor.h    | 4 ----
>  arch/hexagon/kernel/process.c           | 7 -------
>  arch/ia64/include/asm/processor.h       | 7 -------
>  arch/loongarch/include/asm/processor.h  | 3 ---
>  arch/m68k/include/asm/processor.h       | 5 -----
>  arch/microblaze/include/asm/processor.h | 5 -----
>  arch/mips/include/asm/processor.h       | 3 ---
>  arch/nios2/include/asm/processor.h      | 5 -----
>  arch/openrisc/include/asm/processor.h   | 1 -
>  arch/openrisc/kernel/process.c          | 4 ----
>  arch/parisc/include/asm/processor.h     | 3 ---
>  arch/parisc/kernel/process.c            | 4 ----
>  arch/powerpc/include/asm/processor.h    | 1 -
>  arch/powerpc/kernel/process.c           | 5 -----
>  arch/riscv/include/asm/processor.h      | 5 -----
>  arch/s390/include/asm/processor.h       | 3 ---
>  arch/sh/include/asm/processor_32.h      | 3 ---
>  arch/sh/kernel/process_32.c             | 5 -----
>  arch/sparc/include/asm/processor_32.h   | 3 ---
>  arch/sparc/include/asm/processor_64.h   | 3 ---
>  arch/um/include/asm/processor-generic.h | 4 ----
>  arch/x86/include/asm/processor.h        | 3 ---
>  arch/xtensa/include/asm/processor.h     | 3 ---
>  include/linux/sched/task.h              | 3 +++
>  kernel/exit.c                           | 4 ++++
>  33 files changed, 7 insertions(+), 118 deletions(-)
>
> diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
> index 43e234c518b1..714abe494e5f 100644
> --- a/arch/alpha/include/asm/processor.h
> +++ b/arch/alpha/include/asm/processor.h
> @@ -36,8 +36,6 @@ extern void start_thread(struct pt_regs *, unsigned long, unsigned long);
>
>  /* Free all resources held by a thread. */
>  struct task_struct;
> -extern void release_thread(struct task_struct *);
> -
>  unsigned long __get_wchan(struct task_struct *p);
>
>  #define KSTK_EIP(tsk) (task_pt_regs(tsk)->pc)
> diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
> index e2e25f8b5e76..dbf1bc5e2ad2 100644
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -225,11 +225,6 @@ flush_thread(void)
>         current_thread_info()->pcb.unique = 0;
>  }
>
> -void
> -release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  /*
>   * Copy architecture-specific thread state
>   */
> diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
> index 54db9d7bb562..fb844fce1ab6 100644
> --- a/arch/arc/include/asm/processor.h
> +++ b/arch/arc/include/asm/processor.h
> @@ -43,9 +43,6 @@ struct task_struct;
>  #define task_pt_regs(p) \
>         ((struct pt_regs *)(THREAD_SIZE + (void *)task_stack_page(p)) - 1)
>
> -/* Free all resources held by a thread */
> -#define release_thread(thread) do { } while (0)
> -
>  /*
>   * A lot of busy-wait loops in SMP are based off of non-volatile data otherwise
>   * get optimised away by gcc
> diff --git a/arch/arm/include/asm/processor.h b/arch/arm/include/asm/processor.h
> index bdc35c0e8dfb..326864f79d18 100644
> --- a/arch/arm/include/asm/processor.h
> +++ b/arch/arm/include/asm/processor.h
> @@ -81,9 +81,6 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
>  /* Forward declaration, a strange C thing */
>  struct task_struct;
>
> -/* Free all resources held by a thread. */
> -extern void release_thread(struct task_struct *);
> -
>  unsigned long __get_wchan(struct task_struct *p);
>
>  #define task_pt_regs(p) \
> diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
> index 3d9cace63884..712d3e6d9be9 100644
> --- a/arch/arm/kernel/process.c
> +++ b/arch/arm/kernel/process.c
> @@ -232,10 +232,6 @@ void flush_thread(void)
>         thread_notify(THREAD_NOTIFY_FLUSH, thread);
>  }
>
> -void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  asmlinkage void ret_from_fork(void) __asm__("ret_from_fork");
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> index 86eb0bfe3b38..4cfb4cd1d475 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -323,9 +323,6 @@ static inline bool is_ttbr1_addr(unsigned long addr)
>  /* Forward declaration, a strange C thing */
>  struct task_struct;
>
> -/* Free all resources held by a thread. */
> -extern void release_thread(struct task_struct *);
> -
>  unsigned long __get_wchan(struct task_struct *p);
>
>  void update_sctlr_el1(u64 sctlr);
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 92bcc1768f0b..9015f49c206e 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -279,10 +279,6 @@ void flush_thread(void)
>         flush_tagged_addr_state();
>  }
>
> -void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  void arch_release_task_struct(struct task_struct *tsk)
>  {
>         fpsimd_release_task(tsk);
> diff --git a/arch/csky/include/asm/processor.h b/arch/csky/include/asm/processor.h
> index 9638206bc44f..63ad71fab30d 100644
> --- a/arch/csky/include/asm/processor.h
> +++ b/arch/csky/include/asm/processor.h
> @@ -69,11 +69,6 @@ do {                                                                 \
>  /* Forward declaration, a strange C thing */
>  struct task_struct;
>
> -/* Free all resources held by a thread. */
> -static inline void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  /* Prepare to copy thread state - unlazy all lazy status */
>  #define prepare_to_copy(tsk)    do { } while (0)
>
> diff --git a/arch/hexagon/include/asm/processor.h b/arch/hexagon/include/asm/processor.h
> index 615f7e49968e..0cd39c2cdf8f 100644
> --- a/arch/hexagon/include/asm/processor.h
> +++ b/arch/hexagon/include/asm/processor.h
> @@ -60,10 +60,6 @@ struct thread_struct {
>  #define KSTK_EIP(tsk) (pt_elr(task_pt_regs(tsk)))
>  #define KSTK_ESP(tsk) (pt_psp(task_pt_regs(tsk)))
>
> -/*  Free all resources held by a thread; defined in process.c  */
> -extern void release_thread(struct task_struct *dead_task);
> -
> -/* Get wait channel for task P.  */
>  extern unsigned long __get_wchan(struct task_struct *p);
>
>  /*  The following stuff is pretty HEXAGON specific.  */
> diff --git a/arch/hexagon/kernel/process.c b/arch/hexagon/kernel/process.c
> index f0552f98a7ba..e15eeaebd785 100644
> --- a/arch/hexagon/kernel/process.c
> +++ b/arch/hexagon/kernel/process.c
> @@ -112,13 +112,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>         return 0;
>  }
>
> -/*
> - * Release any architecture-specific resources locked by thread
> - */
> -void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  /*
>   * Some archs flush debug and FPU info here
>   */
> diff --git a/arch/ia64/include/asm/processor.h b/arch/ia64/include/asm/processor.h
> index 757c2f6d8d4b..d1978e004054 100644
> --- a/arch/ia64/include/asm/processor.h
> +++ b/arch/ia64/include/asm/processor.h
> @@ -318,13 +318,6 @@ struct thread_struct {
>  struct mm_struct;
>  struct task_struct;
>
> -/*
> - * Free all resources held by a thread. This is called after the
> - * parent of DEAD_TASK has collected the exit status of the task via
> - * wait().
> - */
> -#define release_thread(dead_task)
> -
>  /* Get wait channel for task P.  */
>  extern unsigned long __get_wchan (struct task_struct *p);
>
> diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarch/include/asm/processor.h
> index 1c4b4308378d..6954dc5d24e9 100644
> --- a/arch/loongarch/include/asm/processor.h
> +++ b/arch/loongarch/include/asm/processor.h
> @@ -176,9 +176,6 @@ struct thread_struct {
>
>  struct task_struct;
>
> -/* Free all resources held by a thread. */
> -#define release_thread(thread) do { } while (0)
> -
>  enum idle_boot_override {IDLE_NO_OVERRIDE = 0, IDLE_HALT, IDLE_NOMWAIT, IDLE_POLL};
>
>  extern unsigned long           boot_option_idle_override;
> diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
> index d86b4009880b..7a2da780830b 100644
> --- a/arch/m68k/include/asm/processor.h
> +++ b/arch/m68k/include/asm/processor.h
> @@ -145,11 +145,6 @@ static inline void start_thread(struct pt_regs * regs, unsigned long pc,
>  /* Forward declaration, a strange C thing */
>  struct task_struct;
>
> -/* Free all resources held by a thread. */
> -static inline void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  unsigned long __get_wchan(struct task_struct *p);
>  void show_registers(struct pt_regs *regs);
>
> diff --git a/arch/microblaze/include/asm/processor.h b/arch/microblaze/include/asm/processor.h
> index 7e9e92670df3..4e193c7550df 100644
> --- a/arch/microblaze/include/asm/processor.h
> +++ b/arch/microblaze/include/asm/processor.h
> @@ -63,11 +63,6 @@ struct thread_struct {
>         .pgdir = swapper_pg_dir, \
>  }
>
> -/* Free all resources held by a thread. */
> -static inline void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  unsigned long __get_wchan(struct task_struct *p);
>
>  /* The size allocated for kernel stacks. This _must_ be a power of two! */
> diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
> index 4bb24579d12e..3fde1ff72bd1 100644
> --- a/arch/mips/include/asm/processor.h
> +++ b/arch/mips/include/asm/processor.h
> @@ -344,9 +344,6 @@ struct thread_struct {
>
>  struct task_struct;
>
> -/* Free all resources held by a thread. */
> -#define release_thread(thread) do { } while(0)
> -
>  /*
>   * Do necessary setup to start up a newly executed thread.
>   */
> diff --git a/arch/nios2/include/asm/processor.h b/arch/nios2/include/asm/processor.h
> index b8125dfbcad2..8916d93d5c2d 100644
> --- a/arch/nios2/include/asm/processor.h
> +++ b/arch/nios2/include/asm/processor.h
> @@ -64,11 +64,6 @@ extern void start_thread(struct pt_regs *regs, unsigned long pc,
>
>  struct task_struct;
>
> -/* Free all resources held by a thread. */
> -static inline void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  extern unsigned long __get_wchan(struct task_struct *p);
>
>  #define task_pt_regs(p) \
> diff --git a/arch/openrisc/include/asm/processor.h b/arch/openrisc/include/asm/processor.h
> index aa1699c18add..ed9efb430afa 100644
> --- a/arch/openrisc/include/asm/processor.h
> +++ b/arch/openrisc/include/asm/processor.h
> @@ -72,7 +72,6 @@ struct thread_struct {
>
>
>  void start_thread(struct pt_regs *regs, unsigned long nip, unsigned long sp);
> -void release_thread(struct task_struct *);
>  unsigned long __get_wchan(struct task_struct *p);
>
>  #define cpu_relax()     barrier()
> diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
> index 52dc983ddeba..f94b5ec06786 100644
> --- a/arch/openrisc/kernel/process.c
> +++ b/arch/openrisc/kernel/process.c
> @@ -125,10 +125,6 @@ void show_regs(struct pt_regs *regs)
>         show_registers(regs);
>  }
>
> -void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  /*
>   * Copy the thread-specific (arch specific) info from the current
>   * process to the new one p
> diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
> index 4621ceb51314..a608970b249a 100644
> --- a/arch/parisc/include/asm/processor.h
> +++ b/arch/parisc/include/asm/processor.h
> @@ -266,9 +266,6 @@ on downward growing arches, it looks like this:
>
>  struct mm_struct;
>
> -/* Free all resources held by a thread. */
> -extern void release_thread(struct task_struct *);
> -
>  extern unsigned long __get_wchan(struct task_struct *p);
>
>  #define KSTK_EIP(tsk)  ((tsk)->thread.regs.iaoq[0])
> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> index 7c37e09c92da..3db0e97e6c06 100644
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -146,10 +146,6 @@ void flush_thread(void)
>         */
>  }
>
> -void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  /*
>   * Idle thread support
>   *
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index fdfaae194ddd..92e332415d02 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -75,7 +75,6 @@ extern int _chrp_type;
>
>  struct task_struct;
>  void start_thread(struct pt_regs *regs, unsigned long fdptr, unsigned long sp);
> -void release_thread(struct task_struct *);
>
>  #define TS_FPR(i) fp_state.fpr[i][TS_FPROFFSET]
>  #define TS_CKFPR(i) ckfp_state.fpr[i][TS_FPROFFSET]
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 0fbda89cd1bb..991cda25b9a9 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1655,11 +1655,6 @@ EXPORT_SYMBOL_GPL(set_thread_tidr);
>
>  #endif /* CONFIG_PPC64 */
>
> -void
> -release_thread(struct task_struct *t)
> -{
> -}
> -
>  /*
>   * this gets called so that we can store coprocessor state into memory and
>   * copy the current task into the new thread.
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 19eedd4af4cd..94a0590c6971 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -65,11 +65,6 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
>  extern void start_thread(struct pt_regs *regs,
>                         unsigned long pc, unsigned long sp);
>
> -/* Free all resources held by a thread. */
> -static inline void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  extern unsigned long __get_wchan(struct task_struct *p);
>
>
> diff --git a/arch/s390/include/asm/processor.h b/arch/s390/include/asm/processor.h
> index bd66f8e34949..c52fe651eeba 100644
> --- a/arch/s390/include/asm/processor.h
> +++ b/arch/s390/include/asm/processor.h
> @@ -186,9 +186,6 @@ struct pt_regs;
>  void show_registers(struct pt_regs *regs);
>  void show_cacheinfo(struct seq_file *m);
>
> -/* Free all resources held by a thread. */
> -static inline void release_thread(struct task_struct *tsk) { }
> -
>  /* Free guarded storage control block */
>  void guarded_storage_release(struct task_struct *tsk);
>  void gs_load_bc_cb(struct pt_regs *regs);
> diff --git a/arch/sh/include/asm/processor_32.h b/arch/sh/include/asm/processor_32.h
> index 45240ec6b85a..27aebf1e75a2 100644
> --- a/arch/sh/include/asm/processor_32.h
> +++ b/arch/sh/include/asm/processor_32.h
> @@ -127,9 +127,6 @@ struct task_struct;
>
>  extern void start_thread(struct pt_regs *regs, unsigned long new_pc, unsigned long new_sp);
>
> -/* Free all resources held by a thread. */
> -extern void release_thread(struct task_struct *);
> -
>  /*
>   * FPU lazy state save handling.
>   */
> diff --git a/arch/sh/kernel/process_32.c b/arch/sh/kernel/process_32.c
> index a808843375e7..92b6649d4929 100644
> --- a/arch/sh/kernel/process_32.c
> +++ b/arch/sh/kernel/process_32.c
> @@ -84,11 +84,6 @@ void flush_thread(void)
>  #endif
>  }
>
> -void release_thread(struct task_struct *dead_task)
> -{
> -       /* do nothing */
> -}
> -
>  asmlinkage void ret_from_fork(void);
>  asmlinkage void ret_from_kernel_thread(void);
>
> diff --git a/arch/sparc/include/asm/processor_32.h b/arch/sparc/include/asm/processor_32.h
> index b26c35336b51..ba8b70ffec08 100644
> --- a/arch/sparc/include/asm/processor_32.h
> +++ b/arch/sparc/include/asm/processor_32.h
> @@ -80,9 +80,6 @@ static inline void start_thread(struct pt_regs * regs, unsigned long pc,
>                              : "memory");
>  }
>
> -/* Free all resources held by a thread. */
> -#define release_thread(tsk)            do { } while(0)
> -
>  unsigned long __get_wchan(struct task_struct *);
>
>  #define task_pt_regs(tsk) ((tsk)->thread.kregs)
> diff --git a/arch/sparc/include/asm/processor_64.h b/arch/sparc/include/asm/processor_64.h
> index 89850dff6b03..2667f35d5ea5 100644
> --- a/arch/sparc/include/asm/processor_64.h
> +++ b/arch/sparc/include/asm/processor_64.h
> @@ -176,9 +176,6 @@ do { \
>         regs->tstate &= ~TSTATE_PEF;    \
>  } while (0)
>
> -/* Free all resources held by a thread. */
> -#define release_thread(tsk)            do { } while (0)
> -
>  unsigned long __get_wchan(struct task_struct *task);
>
>  #define task_pt_regs(tsk) (task_thread_info(tsk)->kregs)
> diff --git a/arch/um/include/asm/processor-generic.h b/arch/um/include/asm/processor-generic.h
> index d0fc1862da95..bb5f06480da9 100644
> --- a/arch/um/include/asm/processor-generic.h
> +++ b/arch/um/include/asm/processor-generic.h
> @@ -55,10 +55,6 @@ struct thread_struct {
>         .request                = { 0 } \
>  }
>
> -static inline void release_thread(struct task_struct *task)
> -{
> -}
> -
>  /*
>   * User space process size: 3GB (default).
>   */
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> index 356308c73951..67c9d73b31fa 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -587,9 +587,6 @@ static inline void load_sp0(unsigned long sp0)
>
>  #endif /* CONFIG_PARAVIRT_XXL */
>
> -/* Free all resources held by a thread. */
> -extern void release_thread(struct task_struct *);
> -
>  unsigned long __get_wchan(struct task_struct *p);
>
>  /*
> diff --git a/arch/xtensa/include/asm/processor.h b/arch/xtensa/include/asm/processor.h
> index 76bc63127c66..5abde43c570c 100644
> --- a/arch/xtensa/include/asm/processor.h
> +++ b/arch/xtensa/include/asm/processor.h
> @@ -221,9 +221,6 @@ struct thread_struct {
>  struct task_struct;
>  struct mm_struct;
>
> -/* Free all resources held by a thread. */
> -#define release_thread(thread) do { } while(0)
> -
>  extern unsigned long __get_wchan(struct task_struct *p);
>
>  #define KSTK_EIP(tsk)          (task_pt_regs(tsk)->pc)
> diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
> index 81cab4b01edc..d6c48163c6de 100644
> --- a/include/linux/sched/task.h
> +++ b/include/linux/sched/task.h
> @@ -127,6 +127,9 @@ static inline void put_task_struct_many(struct task_struct *t, int nr)
>
>  void put_task_struct_rcu_user(struct task_struct *task);
>
> +/* Free all architecture-specific resources held by a thread. */
> +void release_thread(struct task_struct *dead_task);
> +
>  #ifdef CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT
>  extern int arch_task_struct_size __read_mostly;
>  #else
> diff --git a/kernel/exit.c b/kernel/exit.c
> index 80376b4ac763..30cabf933fed 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -183,6 +183,10 @@ void put_task_struct_rcu_user(struct task_struct *task)
>                 call_rcu(&task->rcu, delayed_put_task_struct);
>  }
>
> +void __weak release_thread(struct task_struct *dead_task)
> +{
> +}
> +
>  void release_task(struct task_struct *p)
>  {
>         struct task_struct *leader;
> --
> 2.35.3
>


-- 
Best Regards
 Guo Ren
