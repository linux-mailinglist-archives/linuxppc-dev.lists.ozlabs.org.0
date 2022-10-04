Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C22195F4207
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 13:35:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhbGV3MKfz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 22:34:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J/vrmB9K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J/vrmB9K;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhZbd17c6z2xYy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 22:04:42 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id b5so12413436pgb.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Oct 2022 04:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+dGyZLAFgGMTjfv/XBtu0TYoOq7FF1Gy12H3Maj7VZQ=;
        b=J/vrmB9Kw/kUjuLA94+GiSaAb/ysKsHCJMt0q/b5C4hTvjWvpD/4gYcz8wiDYH+wDu
         VauelbAc6rvn6GfwX8AzvYum0016wmpfk7JfWsZRIuqW+7uz8x5trzhgQfsbK6Oez4C2
         oI3/xkCQmxaR27+SGOcFsxA52mzB06l623Nv5Xai/ZW6o0aFNiEoJd0NtydxpISZgCqY
         Huu19sneopcpPoTb7AatH5ql62Y6l79ODVmUp4xYd601QVsvCsOcL4Dye3nIrsebtAO/
         TFi2QIhE77HgLndavZo56yiYGlFlIpX3fKxDC/yQxRz8ukXbuLPZ751WaoRstUHwOqJr
         oOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+dGyZLAFgGMTjfv/XBtu0TYoOq7FF1Gy12H3Maj7VZQ=;
        b=TQVlc0RSY7rT4Yi/o8rZOTWyRqHZWnSU2aQJElBzKJn6OQPKQmP4rQsgAAbWiYqWGf
         B4SCz0TR9Lyjuqxgfa0VcJ2LBV5aAHx8mVVpXGn1DoPaD7m3KhMFOsXzRIVhgEgZWn4K
         uwJ7RDMLn6FXbzCFqWOCGKEV/EUip9n4GnvrfWLniJE8NOT3XTuCJIk2Zu8lGjjltCB5
         CpfRY3+rhT1jJJ4Z2aHb861cjQb99eDw3BX91Jo3MUIY2bdHXVYMRkV+n0ONkU47an0w
         t3xyma2hn+0Q3LUo3WmX4FDON7Zqk9WTfMFmr3AJrqO0XbO/Xro6X28qiN35M0wlQ+yJ
         j6cg==
X-Gm-Message-State: ACrzQf2mS3CgvJ3oASsIkZDz9QHrQcWBaaeLogmYej0zFc8M92/Xnk3W
	YXoIcVvE4zed4NRtdwFkfBO8MIuQffis55c3qvN5Aw==
X-Google-Smtp-Source: AMsMyM47WQGEEYS8ORE4jd8BkC5HxomBqw3qkNOIDDeZpMqnq0xrIZB9jUW0aBX+JhUuuIkJBe/Q8EmYOwJGbohmCJY=
X-Received: by 2002:a63:90c1:0:b0:450:75b5:29fe with SMTP id
 a184-20020a6390c1000000b0045075b529femr6949580pge.541.1664881475536; Tue, 04
 Oct 2022 04:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101521.139727471@infradead.org>
In-Reply-To: <20220919101521.139727471@infradead.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Oct 2022 13:03:57 +0200
Message-ID: <CAPDyKFqTWd4W5Ofk76CtC4X43dxBTNHtmY9YzN355-vpviLsPw@mail.gmail.com>
Subject: Re: [PATCH v2 12/44] cpuidle,dt: Push RCU-idle into driver
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 04 Oct 2022 22:33:53 +1100
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, linux-clk@vger.kernel.org, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, linux-sh@vger.kernel.org, kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org, mingo@redhat.com, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, lpieralisi@kernel.org, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, kernel@pengutronix.de, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel
 .com, virtualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, jolsa@kernel.org, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, chenhuacai@kernel.org, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, mturquette@baylibre.com, paul.walmsley@sifive.com, linux@rasmusvillemoes.dk, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, tony@atomide.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.
 pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, anup@brainfault.org, ryabinin.a.a@gmail.com, linux-alpha@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, pv-drivers@vmware.com, hpa@zytor.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, amakhalov@vmware.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, agross@kernel.org, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, atishp@atishpatra.org, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyu
 kov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, linux-hexagon@vger.kernel.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Sept 2022 at 12:18, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Doing RCU-idle outside the driver, only to then temporarily enable it
> again before going idle is daft.
>
> Notably: this converts all dt_init_idle_driver() and
> __CPU_PM_CPU_IDLE_ENTER() users for they are inextrably intertwined.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  arch/arm/mach-omap2/cpuidle34xx.c    |    4 ++--
>  drivers/acpi/processor_idle.c        |    2 ++
>  drivers/cpuidle/cpuidle-arm.c        |    1 +
>  drivers/cpuidle/cpuidle-big_little.c |    8 ++++++--
>  drivers/cpuidle/cpuidle-psci.c       |    1 +
>  drivers/cpuidle/cpuidle-qcom-spm.c   |    1 +
>  drivers/cpuidle/cpuidle-riscv-sbi.c  |    1 +
>  drivers/cpuidle/dt_idle_states.c     |    2 +-
>  include/linux/cpuidle.h              |    4 ++++
>  9 files changed, 19 insertions(+), 5 deletions(-)
>
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -1200,6 +1200,8 @@ static int acpi_processor_setup_lpi_stat
>                 state->target_residency = lpi->min_residency;
>                 if (lpi->arch_flags)
>                         state->flags |= CPUIDLE_FLAG_TIMER_STOP;
> +               if (lpi->entry_method == ACPI_CSTATE_FFH)
> +                       state->flags |= CPUIDLE_FLAG_RCU_IDLE;

I assume the state index here will never be 0?

If not, it may lead to that acpi_processor_ffh_lpi_enter() may trigger
CPU_PM_CPU_IDLE_ENTER_PARAM() to call ct_cpuidle_enter|exit() for an
idle-state that doesn't have the CPUIDLE_FLAG_RCU_IDLE bit set.

>                 state->enter = acpi_idle_lpi_enter;
>                 drv->safe_state_index = i;
>         }
> --- a/drivers/cpuidle/cpuidle-arm.c
> +++ b/drivers/cpuidle/cpuidle-arm.c
> @@ -53,6 +53,7 @@ static struct cpuidle_driver arm_idle_dr
>          * handler for idle state index 0.
>          */
>         .states[0] = {
> +               .flags                  = CPUIDLE_FLAG_RCU_IDLE,

Comparing arm64 and arm32 idle-states/idle-drivers, the $subject
series ends up setting the CPUIDLE_FLAG_RCU_IDLE for the ARM WFI idle
state (state zero), but only for the arm64 and psci cases (mostly
arm64). For arm32 we would need to update the ARM_CPUIDLE_WFI_STATE
too, as that is what most arm32 idle-drivers are using. My point is,
the code becomes a bit inconsistent.

Perhaps it's easier to avoid setting the CPUIDLE_FLAG_RCU_IDLE bit for
all of the ARM WFI idle states, for both arm64 and arm32?

>                 .enter                  = arm_enter_idle_state,
>                 .exit_latency           = 1,
>                 .target_residency       = 1,
> --- a/drivers/cpuidle/cpuidle-big_little.c
> +++ b/drivers/cpuidle/cpuidle-big_little.c
> @@ -64,7 +64,8 @@ static struct cpuidle_driver bl_idle_lit
>                 .enter                  = bl_enter_powerdown,
>                 .exit_latency           = 700,
>                 .target_residency       = 2500,
> -               .flags                  = CPUIDLE_FLAG_TIMER_STOP,
> +               .flags                  = CPUIDLE_FLAG_TIMER_STOP |
> +                                         CPUIDLE_FLAG_RCU_IDLE,
>                 .name                   = "C1",
>                 .desc                   = "ARM little-cluster power down",
>         },
> @@ -85,7 +86,8 @@ static struct cpuidle_driver bl_idle_big
>                 .enter                  = bl_enter_powerdown,
>                 .exit_latency           = 500,
>                 .target_residency       = 2000,
> -               .flags                  = CPUIDLE_FLAG_TIMER_STOP,
> +               .flags                  = CPUIDLE_FLAG_TIMER_STOP |
> +                                         CPUIDLE_FLAG_RCU_IDLE,
>                 .name                   = "C1",
>                 .desc                   = "ARM big-cluster power down",
>         },
> @@ -124,11 +126,13 @@ static int bl_enter_powerdown(struct cpu
>                                 struct cpuidle_driver *drv, int idx)
>  {
>         cpu_pm_enter();
> +       ct_idle_enter();
>
>         cpu_suspend(0, bl_powerdown_finisher);
>
>         /* signals the MCPM core that CPU is out of low power state */
>         mcpm_cpu_powered_up();
> +       ct_idle_exit();
>
>         cpu_pm_exit();
>
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -357,6 +357,7 @@ static int psci_idle_init_cpu(struct dev
>          * PSCI idle states relies on architectural WFI to be represented as
>          * state index 0.
>          */
> +       drv->states[0].flags = CPUIDLE_FLAG_RCU_IDLE;
>         drv->states[0].enter = psci_enter_idle_state;
>         drv->states[0].exit_latency = 1;
>         drv->states[0].target_residency = 1;
> --- a/drivers/cpuidle/cpuidle-qcom-spm.c
> +++ b/drivers/cpuidle/cpuidle-qcom-spm.c
> @@ -72,6 +72,7 @@ static struct cpuidle_driver qcom_spm_id
>         .owner = THIS_MODULE,
>         .states[0] = {
>                 .enter                  = spm_enter_idle_state,
> +               .flags                  = CPUIDLE_FLAG_RCU_IDLE,
>                 .exit_latency           = 1,
>                 .target_residency       = 1,
>                 .power_usage            = UINT_MAX,
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -332,6 +332,7 @@ static int sbi_cpuidle_init_cpu(struct d
>         drv->cpumask = (struct cpumask *)cpumask_of(cpu);
>
>         /* RISC-V architectural WFI to be represented as state index 0. */
> +       drv->states[0].flags = CPUIDLE_FLAG_RCU_IDLE;
>         drv->states[0].enter = sbi_cpuidle_enter_state;
>         drv->states[0].exit_latency = 1;
>         drv->states[0].target_residency = 1;
> --- a/drivers/cpuidle/dt_idle_states.c
> +++ b/drivers/cpuidle/dt_idle_states.c
> @@ -77,7 +77,7 @@ static int init_state_node(struct cpuidl
>         if (err)
>                 desc = state_node->name;
>
> -       idle_state->flags = 0;
> +       idle_state->flags = CPUIDLE_FLAG_RCU_IDLE;
>         if (of_property_read_bool(state_node, "local-timer-stop"))
>                 idle_state->flags |= CPUIDLE_FLAG_TIMER_STOP;
>         /*
> --- a/include/linux/cpuidle.h
> +++ b/include/linux/cpuidle.h
> @@ -282,14 +282,18 @@ extern s64 cpuidle_governor_latency_req(
>         int __ret = 0;                                                  \
>                                                                         \
>         if (!idx) {                                                     \
> +               ct_idle_enter();                                        \

According to my comment above, we should then drop these calls to
ct_idle_enter and ct_idle_exit() here. Right?

>                 cpu_do_idle();                                          \
> +               ct_idle_exit();                                         \
>                 return idx;                                             \
>         }                                                               \
>                                                                         \
>         if (!is_retention)                                              \
>                 __ret =  cpu_pm_enter();                                \
>         if (!__ret) {                                                   \
> +               ct_idle_enter();                                        \
>                 __ret = low_level_idle_enter(state);                    \
> +               ct_idle_exit();                                         \
>                 if (!is_retention)                                      \
>                         cpu_pm_exit();                                  \
>         }                                                               \
>

Kind regards
Uffe
