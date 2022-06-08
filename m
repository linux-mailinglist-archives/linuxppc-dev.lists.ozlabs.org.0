Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 662EA54407F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 02:21:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPsK2Hn3z3hPX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 10:21:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.175; helo=mail-yb1-f175.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJFhf2y0sz3bdF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 04:13:21 +1000 (AEST)
Received: by mail-yb1-f175.google.com with SMTP id i39so9837355ybj.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun 2022 11:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZQePx5uIM1fUidMEiJVM5nuB6ZzPVeEu38qEpc1UrpE=;
        b=IdcptieX5xRcmlDo2eYf0ZefoNn6k6CFAjfN/VXKI9uV2WNKIXzI7aLDo03D+ztbnV
         N+zTzjxwYbA85H+GG28Fi5lVR1aaX9MgwB19ABtTWfDyMbn1oRxttfCet1AKYgOJ5u9Q
         9o02/YV0UTCMuQq5ZRLbd/dnGYOTOwjn3t7nZdKiNNkPzs1vZoRY56P8+YhfAlXlLtJc
         elO8cua7zFYyt3ImK90EUubbSwtgVPgabxM+ogeUzCiefIh5LC8OtwQDMD32f/th1q0e
         h7JhubAE2eWWi8CskkaHfXrcetjWAPBY7wP4TS2zlBwVUcVnk8qdS2L4TO4sdC38PNaM
         rOeQ==
X-Gm-Message-State: AOAM5309ChLqA3zF0X4B4OB7Hx10FeA8Q0/Mao7I7L8pqaJHRNyhIC1W
	ZTRJ3CHOcD3HFXVsHHq9TTSAoPkUFh4eae4qoXg=
X-Google-Smtp-Source: ABdhPJyd1CrHem+vVK3IGyX/t5xH0MretwaFF4fsfRB0Td7tNKI/Gb3F1VH58WOF1ULS3yEBVcV2AFovGma6uhuJi5U=
X-Received: by 2002:a5b:4a:0:b0:663:7c5b:a5ba with SMTP id e10-20020a5b004a000000b006637c5ba5bamr17352131ybp.81.1654711998678;
 Wed, 08 Jun 2022 11:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144516.047149313@infradead.org>
In-Reply-To: <20220608144516.047149313@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 8 Jun 2022 20:13:07 +0200
Message-ID: <CAJZ5v0g=jcRkMhVoNkZzSaM0viK0C7WN6T5C1_3VQ5GGGQkSzQ@mail.gmail.com>
Subject: Re: [PATCH 02/36] x86/idle: Replace x86_idle with a static_call
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:55:19 +1000
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

ieu.desnoyers@efficios.com>, Frederic Weisbecker <frederic@kernel.org>, Len Brown <lenb@kernel.org>, linux-xtensa@linux-xtensa.org, Sascha Hauer <kernel@pengutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-alpha@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, Stafford Horne <shorne@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, chris@zankel.net, Stephen Boyd <sboyd@kernel.org>, dinguyen@kernel.org, Daniel Bristot de Oliveira <bristot@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, lpieralisi@kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Joel Fernandes <joel@joelfernandes.org>, Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Hilman <khilman@kernel.org>, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, Mel Gorman <mgorman@suse.de>, Jacob Pan <jacob.jun.pan@linux.intel.com>, Arnd Bergmann <arnd@arndb.d
 e>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk <linux-clk@vger.kernel.org>, Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>, bcain@quicinc.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, David Miller <davem@davemloft.net>, Rich Felker <dalias@libc.org>, Tony Lindgren <tony@atomide.com>, amakhalov@vmware.com, Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, anton.ivanov@cambridgegreys.com, jonas@southpole.se, Yury Norov <yury.norov@gmail.com>, Richard Weinberger <richard@nod.at>, the arch/x86 maintainers <x86@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, "P
 aul E. McKenney" <paulmck@kernel.org>, Heiko Carstens
 <hca@linux.ibm.com>, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra <linux-tegra@vger.kernel.org>, namhyung@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jpoimboe@kernel.org, Juergen Gross <jgross@suse.com>, Michal Simek <monstr@monstr.eu>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, ink@jurassic.park.msu.ru, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 8, 2022 at 4:47 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Typical boot time setup; no need to suffer an indirect call for that.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  arch/x86/kernel/process.c |   50 +++++++++++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 22 deletions(-)
>
> --- a/arch/x86/kernel/process.c
> +++ b/arch/x86/kernel/process.c
> @@ -24,6 +24,7 @@
>  #include <linux/cpuidle.h>
>  #include <linux/acpi.h>
>  #include <linux/elf-randomize.h>
> +#include <linux/static_call.h>
>  #include <trace/events/power.h>
>  #include <linux/hw_breakpoint.h>
>  #include <asm/cpu.h>
> @@ -692,7 +693,23 @@ void __switch_to_xtra(struct task_struct
>  unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
>  EXPORT_SYMBOL(boot_option_idle_override);
>
> -static void (*x86_idle)(void);
> +/*
> + * We use this if we don't have any better idle routine..
> + */
> +void __cpuidle default_idle(void)
> +{
> +       raw_safe_halt();
> +}
> +#if defined(CONFIG_APM_MODULE) || defined(CONFIG_HALTPOLL_CPUIDLE_MODULE)
> +EXPORT_SYMBOL(default_idle);
> +#endif
> +
> +DEFINE_STATIC_CALL_NULL(x86_idle, default_idle);
> +
> +static bool x86_idle_set(void)
> +{
> +       return !!static_call_query(x86_idle);
> +}
>
>  #ifndef CONFIG_SMP
>  static inline void play_dead(void)
> @@ -715,28 +732,17 @@ void arch_cpu_idle_dead(void)
>  /*
>   * Called from the generic idle code.
>   */
> -void arch_cpu_idle(void)
> -{
> -       x86_idle();
> -}
> -
> -/*
> - * We use this if we don't have any better idle routine..
> - */
> -void __cpuidle default_idle(void)
> +void __cpuidle arch_cpu_idle(void)
>  {
> -       raw_safe_halt();
> +       static_call(x86_idle)();
>  }
> -#if defined(CONFIG_APM_MODULE) || defined(CONFIG_HALTPOLL_CPUIDLE_MODULE)
> -EXPORT_SYMBOL(default_idle);
> -#endif
>
>  #ifdef CONFIG_XEN
>  bool xen_set_default_idle(void)
>  {
> -       bool ret = !!x86_idle;
> +       bool ret = x86_idle_set();
>
> -       x86_idle = default_idle;
> +       static_call_update(x86_idle, default_idle);
>
>         return ret;
>  }
> @@ -859,20 +865,20 @@ void select_idle_routine(const struct cp
>         if (boot_option_idle_override == IDLE_POLL && smp_num_siblings > 1)
>                 pr_warn_once("WARNING: polling idle and HT enabled, performance may degrade\n");
>  #endif
> -       if (x86_idle || boot_option_idle_override == IDLE_POLL)
> +       if (x86_idle_set() || boot_option_idle_override == IDLE_POLL)
>                 return;
>
>         if (boot_cpu_has_bug(X86_BUG_AMD_E400)) {
>                 pr_info("using AMD E400 aware idle routine\n");
> -               x86_idle = amd_e400_idle;
> +               static_call_update(x86_idle, amd_e400_idle);
>         } else if (prefer_mwait_c1_over_halt(c)) {
>                 pr_info("using mwait in idle threads\n");
> -               x86_idle = mwait_idle;
> +               static_call_update(x86_idle, mwait_idle);
>         } else if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
>                 pr_info("using TDX aware idle routine\n");
> -               x86_idle = tdx_safe_halt;
> +               static_call_update(x86_idle, tdx_safe_halt);
>         } else
> -               x86_idle = default_idle;
> +               static_call_update(x86_idle, default_idle);
>  }
>
>  void amd_e400_c1e_apic_setup(void)
> @@ -925,7 +931,7 @@ static int __init idle_setup(char *str)
>                  * To continue to load the CPU idle driver, don't touch
>                  * the boot_option_idle_override.
>                  */
> -               x86_idle = default_idle;
> +               static_call_update(x86_idle, default_idle);
>                 boot_option_idle_override = IDLE_HALT;
>         } else if (!strcmp(str, "nomwait")) {
>                 /*
>
>
