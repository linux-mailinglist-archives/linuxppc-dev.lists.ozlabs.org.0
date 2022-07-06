Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437C3569530
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 00:20:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdYs617PYz3blX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 08:20:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.176; helo=mail-yw1-f176.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdLpy36xJz3bk0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 00:03:06 +1000 (AEST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-317a66d62dfso141052987b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Jul 2022 07:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WBBLwGm3VvIAnm4uSuSyiWShri4w+bgQrIyP7HIMtP0=;
        b=Yz7O2Nley7/vcb9PiICW4XhYqMEjP0I/ZL4B2LNUzaMNFxKVAJeZ5G9Exv/kA4ZUYb
         X6F7bQFjBvFHa7mnPn9GSsGJ5IqPJqP0qIz8Jkl0+l5z/aaeZAjwCkapwz1hO70abNjx
         oj5R9RRDSPpsqyVD/WfZLpBlzWZhlyh6gzUe9NZEJiltSI3J7WOmgojf9O70ldyhK5Dn
         O5k6shZA6KBD//Xnvs4jaGjlx+xY4mNR7/7M0jvlHSnoYQv15HsBQvYY+PI5V0J6embU
         wKTLPSKJD/steLbv9aX2ZX/LS49+d8bM8OlPn7aLMWaIWbclG+7lYp2sblhXIUetOiYI
         uYJw==
X-Gm-Message-State: AJIora+eVKMTwvFX1E7FsBDMg/ArJIPxl8cDwq5fH8+AHcpbeWibK9yH
	boMoSqUmIbJMSzgJO5yDKKmy3Td/AjQ55bzgcZo=
X-Google-Smtp-Source: AGRyM1shXjwii2Xu/qgQ1B1HadHYSMjqitGmbFlHxf4P7RndZwyBhPC2CaCRixiXqBuDMvjO7JXHYGnoD2iVhXDPhek=
X-Received: by 2002:a81:a184:0:b0:31c:b00e:b5c4 with SMTP id
 y126-20020a81a184000000b0031cb00eb5c4mr15058481ywg.149.1657116183677; Wed, 06
 Jul 2022 07:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.188449351@infradead.org>
In-Reply-To: <20220608144517.188449351@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 6 Jul 2022 16:02:52 +0200
Message-ID: <CAJZ5v0i4xX75TK=Qg_PUk93aghJgpi0AR0gsa3Repw8G4XyDuw@mail.gmail.com>
Subject: Re: [PATCH 20/36] arch/idle: Change arch_cpu_idle() IRQ behaviour
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 07 Jul 2022 08:18:29 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Benjamin Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>, Alexander Gordeev <agordeev@linux.ibm.com>, srivatsa@csail.mit.edu, linux-arch <linux-arch@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Andy Gross <agross@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, dl-linux-imx <linux-imx@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org, mattst88@gmail.com, Christian Borntraeger <borntraeger@linux.ibm.com>, Michael Turquette <mturquette@baylibre.com>, sammy@sammy.net, Petr Mladek <pmladek@suse.com>, Linux PM <linux-pm@vger.kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, Thomas Gleixner <tglx@
 linutronix.de>, Linux OMAP Mailing List <linux-omap@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, rth@twiddle.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, Sven Schnelle <svens@linux.ibm.com>, jolsa@kernel.org, Paul Mackerras <paulus@samba.org>, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, virtualization@lists.linux-foundation.org, James Bottomley <James.Bottomley@hansenpartnership.com>, jcmvbkbc@gmail.com, Thierry Reding <thierry.reding@gmail.com>, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, John Ogness <john.ogness@linutronix.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Linux-sh list <linux-sh@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jon H
 unter <jonathanh@nvidia.com>, Mathieu Desnoyers <math

ieu.desnoyers@efficios.com>, Frederic Weisbecker <frederic@kernel.org>, Len Brown <lenb@kernel.org>, linux-xtensa@linux-xtensa.org, Sascha Hauer <kernel@pengutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-alpha@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, Stafford Horne <shorne@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Chris Zankel <chris@zankel.net>, Stephen Boyd <sboyd@kernel.org>, dinguyen@kernel.org, Daniel Bristot de Oliveira <bristot@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Joel Fernandes <joel@joelfernandes.org>, Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Hilman <khilman@kernel.org>, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, Mel Gorman <mgorman@suse.de>, Jacob Pan <jacob.jun.pan@linux.inte
 l.com>, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk <linux-clk@vger.kernel.org>, Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>, bcain@quicinc.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, David Miller <davem@davemloft.net>, Rich Felker <dalias@libc.org>, Tony Lindgren <tony@atomide.com>, amakhalov@vmware.com, Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, anton.ivanov@cambridgegreys.com, jonas@southpole.se, Yury Norov <yury.norov@gmail.com>, Richard Weinberger <richard@nod.at>, the arch/x86 maintainers <x86@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Al
 bert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney" <
paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra <linux-tegra@vger.kernel.org>, namhyung@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jpoimboe@kernel.org, Juergen Gross <jgross@suse.com>, Michal Simek <monstr@monstr.eu>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, ink@jurassic.park.msu.ru, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 8, 2022 at 4:46 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Current arch_cpu_idle() is called with IRQs disabled, but will return
> with IRQs enabled.
>
> However, the very first thing the generic code does after calling
> arch_cpu_idle() is raw_local_irq_disable(). This means that
> architectures that can idle with IRQs disabled end up doing a
> pointless 'enable-disable' dance.
>
> Therefore, push this IRQ disabling into the idle function, meaning
> that those architectures can avoid the pointless IRQ state flipping.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  arch/alpha/kernel/process.c      |    1 -
>  arch/arc/kernel/process.c        |    3 +++
>  arch/arm/kernel/process.c        |    1 -
>  arch/arm/mach-gemini/board-dt.c  |    3 ++-
>  arch/arm64/kernel/idle.c         |    1 -
>  arch/csky/kernel/process.c       |    1 -
>  arch/csky/kernel/smp.c           |    2 +-
>  arch/hexagon/kernel/process.c    |    1 -
>  arch/ia64/kernel/process.c       |    1 +
>  arch/microblaze/kernel/process.c |    1 -
>  arch/mips/kernel/idle.c          |    8 +++-----
>  arch/nios2/kernel/process.c      |    1 -
>  arch/openrisc/kernel/process.c   |    1 +
>  arch/parisc/kernel/process.c     |    2 --
>  arch/powerpc/kernel/idle.c       |    5 ++---
>  arch/riscv/kernel/process.c      |    1 -
>  arch/s390/kernel/idle.c          |    1 -
>  arch/sh/kernel/idle.c            |    1 +
>  arch/sparc/kernel/leon_pmc.c     |    4 ++++
>  arch/sparc/kernel/process_32.c   |    1 -
>  arch/sparc/kernel/process_64.c   |    3 ++-
>  arch/um/kernel/process.c         |    1 -
>  arch/x86/coco/tdx/tdx.c          |    3 +++
>  arch/x86/kernel/process.c        |   15 ++++-----------
>  arch/xtensa/kernel/process.c     |    1 +
>  kernel/sched/idle.c              |    2 --
>  26 files changed, 28 insertions(+), 37 deletions(-)
>
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -57,7 +57,6 @@ EXPORT_SYMBOL(pm_power_off);
>  void arch_cpu_idle(void)
>  {
>         wtint(0);
> -       raw_local_irq_enable();
>  }
>
>  void arch_cpu_idle_dead(void)
> --- a/arch/arc/kernel/process.c
> +++ b/arch/arc/kernel/process.c
> @@ -114,6 +114,8 @@ void arch_cpu_idle(void)
>                 "sleep %0       \n"
>                 :
>                 :"I"(arg)); /* can't be "r" has to be embedded const */
> +
> +       raw_local_irq_disable();
>  }
>
>  #else  /* ARC700 */
> @@ -122,6 +124,7 @@ void arch_cpu_idle(void)
>  {
>         /* sleep, but enable both set E1/E2 (levels of interrupts) before committing */
>         __asm__ __volatile__("sleep 0x3 \n");
> +       raw_local_irq_disable();
>  }
>
>  #endif
> --- a/arch/arm/kernel/process.c
> +++ b/arch/arm/kernel/process.c
> @@ -78,7 +78,6 @@ void arch_cpu_idle(void)
>                 arm_pm_idle();
>         else
>                 cpu_do_idle();
> -       raw_local_irq_enable();
>  }
>
>  void arch_cpu_idle_prepare(void)
> --- a/arch/arm/mach-gemini/board-dt.c
> +++ b/arch/arm/mach-gemini/board-dt.c
> @@ -42,8 +42,9 @@ static void gemini_idle(void)
>          */
>
>         /* FIXME: Enabling interrupts here is racy! */
> -       local_irq_enable();
> +       raw_local_irq_enable();
>         cpu_do_idle();
> +       raw_local_irq_disable();
>  }
>
>  static void __init gemini_init_machine(void)
> --- a/arch/arm64/kernel/idle.c
> +++ b/arch/arm64/kernel/idle.c
> @@ -42,5 +42,4 @@ void noinstr arch_cpu_idle(void)
>          * tricks
>          */
>         cpu_do_idle();
> -       raw_local_irq_enable();
>  }
> --- a/arch/csky/kernel/process.c
> +++ b/arch/csky/kernel/process.c
> @@ -101,6 +101,5 @@ void arch_cpu_idle(void)
>  #ifdef CONFIG_CPU_PM_STOP
>         asm volatile("stop\n");
>  #endif
> -       raw_local_irq_enable();
>  }
>  #endif
> --- a/arch/csky/kernel/smp.c
> +++ b/arch/csky/kernel/smp.c
> @@ -314,7 +314,7 @@ void arch_cpu_idle_dead(void)
>         while (!secondary_stack)
>                 arch_cpu_idle();
>
> -       local_irq_disable();
> +       raw_local_irq_disable();
>
>         asm volatile(
>                 "mov    sp, %0\n"
> --- a/arch/hexagon/kernel/process.c
> +++ b/arch/hexagon/kernel/process.c
> @@ -44,7 +44,6 @@ void arch_cpu_idle(void)
>  {
>         __vmwait();
>         /*  interrupts wake us up, but irqs are still disabled */
> -       raw_local_irq_enable();
>  }
>
>  /*
> --- a/arch/ia64/kernel/process.c
> +++ b/arch/ia64/kernel/process.c
> @@ -241,6 +241,7 @@ void arch_cpu_idle(void)
>                 (*mark_idle)(1);
>
>         raw_safe_halt();
> +       raw_local_irq_disable();
>
>         if (mark_idle)
>                 (*mark_idle)(0);
> --- a/arch/microblaze/kernel/process.c
> +++ b/arch/microblaze/kernel/process.c
> @@ -138,5 +138,4 @@ int dump_fpu(struct pt_regs *regs, elf_f
>
>  void arch_cpu_idle(void)
>  {
> -       raw_local_irq_enable();
>  }
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -33,13 +33,13 @@ static void __cpuidle r3081_wait(void)
>  {
>         unsigned long cfg = read_c0_conf();
>         write_c0_conf(cfg | R30XX_CONF_HALT);
> -       raw_local_irq_enable();
>  }
>
>  void __cpuidle r4k_wait(void)
>  {
>         raw_local_irq_enable();
>         __r4k_wait();
> +       raw_local_irq_disable();
>  }
>
>  /*
> @@ -57,7 +57,6 @@ void __cpuidle r4k_wait_irqoff(void)
>                 "       .set    arch=r4000      \n"
>                 "       wait                    \n"
>                 "       .set    pop             \n");
> -       raw_local_irq_enable();
>  }
>
>  /*
> @@ -77,7 +76,6 @@ static void __cpuidle rm7k_wait_irqoff(v
>                 "       wait                                            \n"
>                 "       mtc0    $1, $12         # stalls until W stage  \n"
>                 "       .set    pop                                     \n");
> -       raw_local_irq_enable();
>  }
>
>  /*
> @@ -103,6 +101,8 @@ static void __cpuidle au1k_wait(void)
>         "       nop                             \n"
>         "       .set    pop                     \n"
>         : : "r" (au1k_wait), "r" (c0status));
> +
> +       raw_local_irq_disable();
>  }
>
>  static int __initdata nowait;
> @@ -245,8 +245,6 @@ void arch_cpu_idle(void)
>  {
>         if (cpu_wait)
>                 cpu_wait();
> -       else
> -               raw_local_irq_enable();
>  }
>
>  #ifdef CONFIG_CPU_IDLE
> --- a/arch/nios2/kernel/process.c
> +++ b/arch/nios2/kernel/process.c
> @@ -33,7 +33,6 @@ EXPORT_SYMBOL(pm_power_off);
>
>  void arch_cpu_idle(void)
>  {
> -       raw_local_irq_enable();
>  }
>
>  /*
> --- a/arch/openrisc/kernel/process.c
> +++ b/arch/openrisc/kernel/process.c
> @@ -102,6 +102,7 @@ void arch_cpu_idle(void)
>         raw_local_irq_enable();
>         if (mfspr(SPR_UPR) & SPR_UPR_PMP)
>                 mtspr(SPR_PMR, mfspr(SPR_PMR) | SPR_PMR_DME);
> +       raw_local_irq_disable();
>  }
>
>  void (*pm_power_off)(void) = NULL;
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -187,8 +187,6 @@ void arch_cpu_idle_dead(void)
>
>  void __cpuidle arch_cpu_idle(void)
>  {
> -       raw_local_irq_enable();
> -
>         /* nop on real hardware, qemu will idle sleep. */
>         asm volatile("or %%r10,%%r10,%%r10\n":::);
>  }
> --- a/arch/powerpc/kernel/idle.c
> +++ b/arch/powerpc/kernel/idle.c
> @@ -51,10 +51,9 @@ void arch_cpu_idle(void)
>                  * Some power_save functions return with
>                  * interrupts enabled, some don't.
>                  */
> -               if (irqs_disabled())
> -                       raw_local_irq_enable();
> +               if (!irqs_disabled())
> +                       raw_local_irq_disable();
>         } else {
> -               raw_local_irq_enable();
>                 /*
>                  * Go into low thread priority and possibly
>                  * low power mode.
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -39,7 +39,6 @@ extern asmlinkage void ret_from_kernel_t
>  void arch_cpu_idle(void)
>  {
>         cpu_do_idle();
> -       raw_local_irq_enable();
>  }
>
>  void __show_regs(struct pt_regs *regs)
> --- a/arch/s390/kernel/idle.c
> +++ b/arch/s390/kernel/idle.c
> @@ -66,7 +66,6 @@ void arch_cpu_idle(void)
>         idle->idle_count++;
>         account_idle_time(cputime_to_nsecs(idle_time));
>         raw_write_seqcount_end(&idle->seqcount);
> -       raw_local_irq_enable();
>  }
>
>  static ssize_t show_idle_count(struct device *dev,
> --- a/arch/sh/kernel/idle.c
> +++ b/arch/sh/kernel/idle.c
> @@ -25,6 +25,7 @@ void default_idle(void)
>         raw_local_irq_enable();
>         /* Isn't this racy ? */
>         cpu_sleep();
> +       raw_local_irq_disable();
>         clear_bl_bit();
>  }
>
> --- a/arch/sparc/kernel/leon_pmc.c
> +++ b/arch/sparc/kernel/leon_pmc.c
> @@ -57,6 +57,8 @@ static void pmc_leon_idle_fixup(void)
>                 "lda    [%0] %1, %%g0\n"
>                 :
>                 : "r"(address), "i"(ASI_LEON_BYPASS));
> +
> +       raw_local_irq_disable();
>  }
>
>  /*
> @@ -70,6 +72,8 @@ static void pmc_leon_idle(void)
>
>         /* For systems without power-down, this will be no-op */
>         __asm__ __volatile__ ("wr       %g0, %asr19\n\t");
> +
> +       raw_local_irq_disable();
>  }
>
>  /* Install LEON Power Down function */
> --- a/arch/sparc/kernel/process_32.c
> +++ b/arch/sparc/kernel/process_32.c
> @@ -71,7 +71,6 @@ void arch_cpu_idle(void)
>  {
>         if (sparc_idle)
>                 (*sparc_idle)();
> -       raw_local_irq_enable();
>  }
>
>  /* XXX cli/sti -> local_irq_xxx here, check this works once SMP is fixed. */
> --- a/arch/sparc/kernel/process_64.c
> +++ b/arch/sparc/kernel/process_64.c
> @@ -59,7 +59,6 @@ void arch_cpu_idle(void)
>  {
>         if (tlb_type != hypervisor) {
>                 touch_nmi_watchdog();
> -               raw_local_irq_enable();
>         } else {
>                 unsigned long pstate;
>
> @@ -90,6 +89,8 @@ void arch_cpu_idle(void)
>                         "wrpr %0, %%g0, %%pstate"
>                         : "=&r" (pstate)
>                         : "i" (PSTATE_IE));
> +
> +               raw_local_irq_disable();
>         }
>  }
>
> --- a/arch/um/kernel/process.c
> +++ b/arch/um/kernel/process.c
> @@ -216,7 +216,6 @@ void arch_cpu_idle(void)
>  {
>         cpu_tasks[current_thread_info()->cpu].pid = os_getpid();
>         um_idle_sleep();
> -       raw_local_irq_enable();
>  }
>
>  int __cant_sleep(void) {
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -178,6 +178,9 @@ void __cpuidle tdx_safe_halt(void)
>          */
>         if (__halt(irq_disabled, do_sti))
>                 WARN_ONCE(1, "HLT instruction emulation failed\n");
> +
> +       /* XXX I can't make sense of what @do_sti actually does */
> +       raw_local_irq_disable();
>  }
>
>  static bool read_msr(struct pt_regs *regs)
> --- a/arch/x86/kernel/process.c
> +++ b/arch/x86/kernel/process.c
> @@ -699,6 +699,7 @@ EXPORT_SYMBOL(boot_option_idle_override)
>  void __cpuidle default_idle(void)
>  {
>         raw_safe_halt();
> +       raw_local_irq_disable();
>  }
>  #if defined(CONFIG_APM_MODULE) || defined(CONFIG_HALTPOLL_CPUIDLE_MODULE)
>  EXPORT_SYMBOL(default_idle);
> @@ -804,13 +805,7 @@ static void amd_e400_idle(void)
>
>         default_idle();
>
> -       /*
> -        * The switch back from broadcast mode needs to be called with
> -        * interrupts disabled.
> -        */
> -       raw_local_irq_disable();
>         tick_broadcast_exit();
> -       raw_local_irq_enable();
>  }
>
>  /*
> @@ -849,12 +844,10 @@ static __cpuidle void mwait_idle(void)
>                 }
>
>                 __monitor((void *)&current_thread_info()->flags, 0, 0);
> -               if (!need_resched())
> +               if (!need_resched()) {
>                         __sti_mwait(0, 0);
> -               else
> -                       raw_local_irq_enable();
> -       } else {
> -               raw_local_irq_enable();
> +                       raw_local_irq_disable();
> +               }
>         }
>         __current_clr_polling();
>  }
> --- a/arch/xtensa/kernel/process.c
> +++ b/arch/xtensa/kernel/process.c
> @@ -183,6 +183,7 @@ void coprocessor_flush_release_all(struc
>  void arch_cpu_idle(void)
>  {
>         platform_idle();
> +       raw_local_irq_disable();
>  }
>
>  /*
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -79,7 +79,6 @@ void __weak arch_cpu_idle_dead(void) { }
>  void __weak arch_cpu_idle(void)
>  {
>         cpu_idle_force_poll = 1;
> -       raw_local_irq_enable();
>  }
>
>  /**
> @@ -96,7 +95,6 @@ void __cpuidle default_idle_call(void)
>
>                 cpuidle_rcu_enter();
>                 arch_cpu_idle();
> -               raw_local_irq_disable();
>                 cpuidle_rcu_exit();
>
>                 start_critical_timings();
>
>
