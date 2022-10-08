Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDA85F818C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 02:24:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkmBp1fZTz3dq6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 11:24:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dLa9rcro;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dLa9rcro;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mkm9q6wlKz30D1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 11:23:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B66B3B8248D
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 00:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DBDC433C1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 00:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665188601;
	bh=sgFxqSsEF0+bcN38uHnAUtCzYqPWkGv+/tZCP/6JQvw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dLa9rcrowpgVtq+iFYBKyTsJRXjwt2l1ZoU9dK0QG9IYeZ2a62zgJvBsG6oDXjiRU
	 g8IoKrAwYQj7iljuM7UWlAR6Dt/2U7zsJfp2vplIpTVOwfHqsWzcac8KjUdZ0Dc2yA
	 RCczFaeQ5B8FiF0ufVKuJ7JdzaK+mtRyW2F+KPQWg/+aUW90XGHd6DH5O5vfBk1pI0
	 5tBoKEeNTFgtz/mLCbyE4fMKLadfq7AQG2zG37YF0cD05zufKdpxw6lgYxQKwr4/wi
	 LrejuG/TFjbqp+GYbPrEG+2DskVrU3NKjmdfN2fZ2S+EirBDox7F3IDgaSR54AyyZg
	 9SPR0ZPOxd4OA==
Received: by mail-oi1-f180.google.com with SMTP id l5so7279142oif.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Oct 2022 17:23:21 -0700 (PDT)
X-Gm-Message-State: ACrzQf2RGowOOhg1WxZJPPYW5A8ZcjiMBeGFfAdq7v0n/z84E6O3nYtS
	4SWC0aOFypCCFpg13c0xZ/GrTLbmqj81WGjSo7Q=
X-Google-Smtp-Source: AMsMyM6d1vEFgVz7vAhL63BB/M/+P/PP5ZhiAkdB3z/coca0NEdVvl3lU8eJKhAXTwQbJjldnSeasVabLKztwU34kGU=
X-Received: by 2002:aca:6155:0:b0:353:e740:ce01 with SMTP id
 v82-20020aca6155000000b00353e740ce01mr8708756oib.19.1665188600393; Fri, 07
 Oct 2022 17:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221007154145.1877054-1-vschneid@redhat.com> <20221007154533.1878285-5-vschneid@redhat.com>
In-Reply-To: <20221007154533.1878285-5-vschneid@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 8 Oct 2022 08:23:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQs62gJ7hTrqKNX=og7NuR=ou5S8WZp9Mf9JXxs0-duwA@mail.gmail.com>
Message-ID: <CAJF2gTQs62gJ7hTrqKNX=og7NuR=ou5S8WZp9Mf9JXxs0-duwA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/5] treewide: Rename and trace arch-definitions of smp_send_reschedule()
To: Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-hexagon@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vg
 er.kernel.org, Daniel Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 7, 2022 at 11:46 PM Valentin Schneider <vschneid@redhat.com> wrote:
>
> To be able to trace invocations of smp_send_reschedule(), rename the
> arch-specific definitions of it to arch_smp_send_reschedule() and wrap it
> into an smp_send_reschedule() that contains a tracepoint.
>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>  arch/alpha/kernel/smp.c          | 2 +-
>  arch/arc/kernel/smp.c            | 2 +-
>  arch/arm/kernel/smp.c            | 2 +-
>  arch/arm64/kernel/smp.c          | 2 +-
>  arch/csky/kernel/smp.c           | 2 +-
>  arch/hexagon/kernel/smp.c        | 2 +-
>  arch/ia64/kernel/smp.c           | 4 ++--
>  arch/loongarch/include/asm/smp.h | 2 +-
>  arch/mips/include/asm/smp.h      | 2 +-
>  arch/openrisc/kernel/smp.c       | 2 +-
>  arch/parisc/kernel/smp.c         | 4 ++--
>  arch/powerpc/kernel/smp.c        | 4 ++--
>  arch/riscv/kernel/smp.c          | 4 ++--
>  arch/s390/kernel/smp.c           | 2 +-
>  arch/sh/kernel/smp.c             | 2 +-
>  arch/sparc/kernel/smp_32.c       | 2 +-
>  arch/sparc/kernel/smp_64.c       | 2 +-
>  arch/x86/include/asm/smp.h       | 2 +-
>  arch/xtensa/kernel/smp.c         | 2 +-
>  include/linux/smp.h              | 1 +
>  kernel/smp.c                     | 6 ++++++
>  21 files changed, 30 insertions(+), 23 deletions(-)
>
> diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
> index f4e20f75438f..38637eb9eebd 100644
> --- a/arch/alpha/kernel/smp.c
> +++ b/arch/alpha/kernel/smp.c
> @@ -562,7 +562,7 @@ handle_ipi(struct pt_regs *regs)
>  }
>
>  void
> -smp_send_reschedule(int cpu)
> +arch_smp_send_reschedule(int cpu)
>  {
>  #ifdef DEBUG_IPI_MSG
>         if (cpu == hard_smp_processor_id())
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index ab9e75e90f72..ae2e6a312361 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -292,7 +292,7 @@ static void ipi_send_msg(const struct cpumask *callmap, enum ipi_msg_type msg)
>                 ipi_send_msg_one(cpu, msg);
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         ipi_send_msg_one(cpu, IPI_RESCHEDULE);
>  }
> diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
> index 3b280d55c1c4..f216ac890b6f 100644
> --- a/arch/arm/kernel/smp.c
> +++ b/arch/arm/kernel/smp.c
> @@ -745,7 +745,7 @@ void __init set_smp_ipi_range(int ipi_base, int n)
>         ipi_setup(smp_processor_id());
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 937d2623e06b..8d108edc4a89 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -976,7 +976,7 @@ void __init set_smp_ipi_range(int ipi_base, int n)
>         ipi_setup(smp_processor_id());
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
> index 4b605aa2e1d6..fd7f81be16dd 100644
> --- a/arch/csky/kernel/smp.c
> +++ b/arch/csky/kernel/smp.c
> @@ -140,7 +140,7 @@ void smp_send_stop(void)
>         on_each_cpu(ipi_stop, NULL, 1);
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
For csky part, Acked-by: Guo Ren <guoren@kernel.org>

>  {
>         send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/arch/hexagon/kernel/smp.c b/arch/hexagon/kernel/smp.c
> index 4ba93e59370c..4e8bee25b8c6 100644
> --- a/arch/hexagon/kernel/smp.c
> +++ b/arch/hexagon/kernel/smp.c
> @@ -217,7 +217,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>         }
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         send_ipi(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/arch/ia64/kernel/smp.c b/arch/ia64/kernel/smp.c
> index e2cc59db86bc..ea4f009a232b 100644
> --- a/arch/ia64/kernel/smp.c
> +++ b/arch/ia64/kernel/smp.c
> @@ -220,11 +220,11 @@ kdump_smp_send_init(void)
>   * Called with preemption disabled.
>   */
>  void
> -smp_send_reschedule (int cpu)
> +arch_smp_send_reschedule (int cpu)
>  {
>         ia64_send_ipi(cpu, IA64_IPI_RESCHEDULE, IA64_IPI_DM_INT, 0);
>  }
> -EXPORT_SYMBOL_GPL(smp_send_reschedule);
> +EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
>
>  /*
>   * Called with preemption disabled.
> diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
> index 71189b28bfb2..3fcca134dfb1 100644
> --- a/arch/loongarch/include/asm/smp.h
> +++ b/arch/loongarch/include/asm/smp.h
> @@ -83,7 +83,7 @@ extern void show_ipi_list(struct seq_file *p, int prec);
>   * it goes straight through and wastes no time serializing
>   * anything. Worst case is that we lose a reschedule ...
>   */
> -static inline void smp_send_reschedule(int cpu)
> +static inline void arch_smp_send_reschedule(int cpu)
>  {
>         loongson3_send_ipi_single(cpu, SMP_RESCHEDULE);
>  }
> diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
> index 5d9ff61004ca..9806e79895d9 100644
> --- a/arch/mips/include/asm/smp.h
> +++ b/arch/mips/include/asm/smp.h
> @@ -66,7 +66,7 @@ extern void calculate_cpu_foreign_map(void);
>   * it goes straight through and wastes no time serializing
>   * anything. Worst case is that we lose a reschedule ...
>   */
> -static inline void smp_send_reschedule(int cpu)
> +static inline void arch_smp_send_reschedule(int cpu)
>  {
>         extern const struct plat_smp_ops *mp_ops;       /* private */
>
> diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
> index e1419095a6f0..0a7a059e2dff 100644
> --- a/arch/openrisc/kernel/smp.c
> +++ b/arch/openrisc/kernel/smp.c
> @@ -173,7 +173,7 @@ void handle_IPI(unsigned int ipi_msg)
>         }
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
> index 7dbd92cafae3..b7fc859fa87d 100644
> --- a/arch/parisc/kernel/smp.c
> +++ b/arch/parisc/kernel/smp.c
> @@ -246,8 +246,8 @@ void kgdb_roundup_cpus(void)
>  inline void
>  smp_send_stop(void)    { send_IPI_allbutself(IPI_CPU_STOP); }
>
> -void
> -smp_send_reschedule(int cpu) { send_IPI_single(cpu, IPI_RESCHEDULE); }
> +void
> +arch_smp_send_reschedule(int cpu) { send_IPI_single(cpu, IPI_RESCHEDULE); }
>
>  void
>  smp_send_all_nop(void)
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 169703fead57..2d7b217392f2 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -364,12 +364,12 @@ static inline void do_message_pass(int cpu, int msg)
>  #endif
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         if (likely(smp_ops))
>                 do_message_pass(cpu, PPC_MSG_RESCHEDULE);
>  }
> -EXPORT_SYMBOL_GPL(smp_send_reschedule);
> +EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
>
>  void arch_send_call_function_single_ipi(int cpu)
>  {
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 760a64518c58..213602e89a8b 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -235,8 +235,8 @@ void smp_send_stop(void)
>                            cpumask_pr_args(cpu_online_mask));
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         send_ipi_single(cpu, IPI_RESCHEDULE);
>  }
> -EXPORT_SYMBOL_GPL(smp_send_reschedule);
> +EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
> diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
> index 30c91d565933..9d1c36571106 100644
> --- a/arch/s390/kernel/smp.c
> +++ b/arch/s390/kernel/smp.c
> @@ -542,7 +542,7 @@ void arch_send_call_function_single_ipi(int cpu)
>   * it goes straight through and wastes no time serializing
>   * anything. Worst case is that we lose a reschedule ...
>   */
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         pcpu_ec_call(pcpu_devices + cpu, ec_schedule);
>  }
> diff --git a/arch/sh/kernel/smp.c b/arch/sh/kernel/smp.c
> index 65924d9ec245..5cf35a774dc7 100644
> --- a/arch/sh/kernel/smp.c
> +++ b/arch/sh/kernel/smp.c
> @@ -256,7 +256,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
>                (bogosum / (5000/HZ)) % 100);
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         mp_ops->send_ipi(cpu, SMP_MSG_RESCHEDULE);
>  }
> diff --git a/arch/sparc/kernel/smp_32.c b/arch/sparc/kernel/smp_32.c
> index ad8094d955eb..87eaa7719fa2 100644
> --- a/arch/sparc/kernel/smp_32.c
> +++ b/arch/sparc/kernel/smp_32.c
> @@ -120,7 +120,7 @@ void cpu_panic(void)
>
>  struct linux_prom_registers smp_penguin_ctable = { 0 };
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         /*
>          * CPU model dependent way of implementing IPI generation targeting
> diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
> index a55295d1b924..e5964d1d8b37 100644
> --- a/arch/sparc/kernel/smp_64.c
> +++ b/arch/sparc/kernel/smp_64.c
> @@ -1430,7 +1430,7 @@ static unsigned long send_cpu_poke(int cpu)
>         return hv_err;
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         if (cpu == smp_processor_id()) {
>                 WARN_ON_ONCE(preemptible());
> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> index a73bced40e24..5ff5815149bd 100644
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -99,7 +99,7 @@ static inline void play_dead(void)
>         smp_ops.play_dead();
>  }
>
> -static inline void smp_send_reschedule(int cpu)
> +static inline void arch_smp_send_reschedule(int cpu)
>  {
>         smp_ops.smp_send_reschedule(cpu);
>  }
> diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
> index 4dc109dd6214..d95907b8e4d3 100644
> --- a/arch/xtensa/kernel/smp.c
> +++ b/arch/xtensa/kernel/smp.c
> @@ -389,7 +389,7 @@ void arch_send_call_function_single_ipi(int cpu)
>         send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC);
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/include/linux/smp.h b/include/linux/smp.h
> index a80ab58ae3f1..a67e7aad17b9 100644
> --- a/include/linux/smp.h
> +++ b/include/linux/smp.h
> @@ -125,6 +125,7 @@ extern void smp_send_stop(void);
>  /*
>   * sends a 'reschedule' event to another CPU:
>   */
> +extern void arch_smp_send_reschedule(int cpu);
>  extern void smp_send_reschedule(int cpu);
>
>
> diff --git a/kernel/smp.c b/kernel/smp.c
> index 387735180aed..9dfe057424f8 100644
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -166,6 +166,12 @@ static inline void send_call_function_ipi_mask(const struct cpumask *mask)
>         arch_send_call_function_ipi_mask(mask);
>  }
>
> +void smp_send_reschedule(int cpu)
> +{
> +       trace_ipi_send_cpu(_RET_IP_, cpu);
> +       arch_smp_send_reschedule(cpu);
> +}
> +
>  #ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
>
>  static DEFINE_STATIC_KEY_FALSE(csdlock_debug_enabled);
> --
> 2.31.1
>


-- 
Best Regards
 Guo Ren
