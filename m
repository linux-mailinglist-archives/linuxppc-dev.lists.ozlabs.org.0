Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F5B634BB6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 01:34:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NH2Fc2lS9z3dvQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 11:34:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Sxgb7Ndw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Sxgb7Ndw;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGpxn34fvz3cKj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 03:05:14 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id 140so14775483pfz.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 08:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mKqixJN/8zapPMiYOY0ZA2E36N6vIQg16uLiOxlikFI=;
        b=Sxgb7NdwQ/FjyYXzMQLr2Ufh8inWhewppyg2kEhKfSMa5+4xLhcDZFgBkLe+YVojYR
         b1j/8R8eepdhz2QNEoN59UWxI0C8HtPNMN2hfsnJ2VXdsyzTbL+tlNksQKPnsWg/NtBp
         chCgU4N95aPK2lbuS5RzKtW5ffOhO3rTLhquzizFSUU3p/ux1MbE2BMO0btBQyCrWeJK
         WXzMJ1H0fbnItfONfrC7qjjeZVQUnHu7QZDLXM8ZsS1OkeorqU4Yt3+bnHeBb63EIVUM
         ARM0B0wTMD/PlD/5zjrBQjmOnBQvgdxEwxF1FwYHEN8lHlbB5RkK/8WK1b4hFP6jFplD
         FuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKqixJN/8zapPMiYOY0ZA2E36N6vIQg16uLiOxlikFI=;
        b=dDsjCPnmaCsqppw2iycPodGX5o9FvBVqBe/6W0/gj8KpwolSKp2a0MWz+In+ntb4EU
         +8+8M7n8jCNEkBvfU55S8HNzfEv7j72XRjRmLxQB63YQIYsweOfMbp/fdDJIRYgOFDEm
         SJmefQfPNFEVucdExuC8CjknGciGB/SZMC5FjEpkWR4NMJgT+AjSfqjOrAhRTZMmScbc
         imwpX3wTeh4hIaKpBw5281U4ud9Cy4fnFDBHylIXxybj34m4NH2zRvt9SZPaOucDEaJy
         gLu+71IKwzRpsRAp9JTz40Qv32CuGfbZASlPOwfvYRBU2uh5SfpRTi8N/qp/DW22UkWn
         J9Nw==
X-Gm-Message-State: ANoB5pk1OahsLz7vuD7wpr6N3GNmv+Z+qw7Jj6qGI3aSeZLCV3ofs5N8
	vLq+cFeWWYZTPUH1TFgsBWZItIqzieFb/RWwXPzuGQ==
X-Google-Smtp-Source: AA0mqf6JSvaqlcRgOCqphXQ3MBWuxLvJ9cnb0DNFGeizoGOcIFvJAwjnOuz3SuqXXwFDZ3Z3O+rn4vXVPvsxTfgKOLE=
X-Received: by 2002:a63:501c:0:b0:477:650a:c29a with SMTP id
 e28-20020a63501c000000b00477650ac29amr3900068pgb.541.1669133109958; Tue, 22
 Nov 2022 08:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101521.139727471@infradead.org>
 <CAPDyKFqTWd4W5Ofk76CtC4X43dxBTNHtmY9YzN355-vpviLsPw@mail.gmail.com> <Y3UBwYNY15ETUKy9@hirez.programming.kicks-ass.net>
In-Reply-To: <Y3UBwYNY15ETUKy9@hirez.programming.kicks-ass.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Nov 2022 17:04:33 +0100
Message-ID: <CAPDyKFqzmJdVVrcuJ6Hmr5nNgtpd9Oke_exmUKuTGZEb=PjvjQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/44] cpuidle,dt: Push RCU-idle into driver
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 23 Nov 2022 11:33:58 +1100
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

On Wed, 16 Nov 2022 at 16:29, Peter Zijlstra <peterz@infradead.org> wrote:
>
>
> Sorry; things keep getting in the way of finishing this :/
>
> As such, I need a bit of time to get on-track again..
>
> On Tue, Oct 04, 2022 at 01:03:57PM +0200, Ulf Hansson wrote:
>
> > > --- a/drivers/acpi/processor_idle.c
> > > +++ b/drivers/acpi/processor_idle.c
> > > @@ -1200,6 +1200,8 @@ static int acpi_processor_setup_lpi_stat
> > >                 state->target_residency = lpi->min_residency;
> > >                 if (lpi->arch_flags)
> > >                         state->flags |= CPUIDLE_FLAG_TIMER_STOP;
> > > +               if (lpi->entry_method == ACPI_CSTATE_FFH)
> > > +                       state->flags |= CPUIDLE_FLAG_RCU_IDLE;
> >
> > I assume the state index here will never be 0?
> >
> > If not, it may lead to that acpi_processor_ffh_lpi_enter() may trigger
> > CPU_PM_CPU_IDLE_ENTER_PARAM() to call ct_cpuidle_enter|exit() for an
> > idle-state that doesn't have the CPUIDLE_FLAG_RCU_IDLE bit set.
>
> I'm not quite sure I see how. AFAICT this condition above implies
> acpi_processor_ffh_lpi_enter() gets called, no?
>
> Which in turn is an unconditional __CPU_PM_CPU_IDLE_ENTER() user, so
> even if idx==0, it ends up in ct_idle_{enter,exit}().

Seems like I was overlooking something here, you are right, this
shouldn't really be a problem.

>
> >
> > >                 state->enter = acpi_idle_lpi_enter;
> > >                 drv->safe_state_index = i;
> > >         }
> > > --- a/drivers/cpuidle/cpuidle-arm.c
> > > +++ b/drivers/cpuidle/cpuidle-arm.c
> > > @@ -53,6 +53,7 @@ static struct cpuidle_driver arm_idle_dr
> > >          * handler for idle state index 0.
> > >          */
> > >         .states[0] = {
> > > +               .flags                  = CPUIDLE_FLAG_RCU_IDLE,
> >
> > Comparing arm64 and arm32 idle-states/idle-drivers, the $subject
> > series ends up setting the CPUIDLE_FLAG_RCU_IDLE for the ARM WFI idle
> > state (state zero), but only for the arm64 and psci cases (mostly
> > arm64). For arm32 we would need to update the ARM_CPUIDLE_WFI_STATE
> > too, as that is what most arm32 idle-drivers are using. My point is,
> > the code becomes a bit inconsistent.
>
> True.
>
> > Perhaps it's easier to avoid setting the CPUIDLE_FLAG_RCU_IDLE bit for
> > all of the ARM WFI idle states, for both arm64 and arm32?
>
> As per the below?
>
> >
> > >                 .enter                  = arm_enter_idle_state,
> > >                 .exit_latency           = 1,
> > >                 .target_residency       = 1,
>
> > > --- a/include/linux/cpuidle.h
> > > +++ b/include/linux/cpuidle.h
> > > @@ -282,14 +282,18 @@ extern s64 cpuidle_governor_latency_req(
> > >         int __ret = 0;                                                  \
> > >                                                                         \
> > >         if (!idx) {                                                     \
> > > +               ct_idle_enter();                                        \
> >
> > According to my comment above, we should then drop these calls to
> > ct_idle_enter and ct_idle_exit() here. Right?
>
> Yes, if we ensure idx==0 never has RCU_IDLE set then these must be
> removed.
>
> > >                 cpu_do_idle();                                          \
> > > +               ct_idle_exit();                                         \
> > >                 return idx;                                             \
> > >         }                                                               \
> > >                                                                         \
> > >         if (!is_retention)                                              \
> > >                 __ret =  cpu_pm_enter();                                \
> > >         if (!__ret) {                                                   \
> > > +               ct_idle_enter();                                        \
> > >                 __ret = low_level_idle_enter(state);                    \
> > > +               ct_idle_exit();                                         \
> > >                 if (!is_retention)                                      \
> > >                         cpu_pm_exit();                                  \
> > >         }                                                               \
> > >
>
> So the basic premise is that everything that needs RCU inside the idle
> callback must set CPUIDLE_FLAG_RCU_IDLE and by doing that promise to
> call ct_idle_{enter,exit}() themselves.
>
> Setting RCU_IDLE is required when there is RCU usage, however even if
> there is no RCU usage, setting RCU_IDLE is fine, as long as
> ct_idle_{enter,exit}() then get called.

Right, I was thinking that it could make sense to shrink the window
for users getting this wrong. In other words, we shouldn't set the
CPUIDLE_FLAG_RCU_IDLE unless we really need to.

And as I said, consistent behaviour is also nice to have.

>
>
> So does the below (delta) look better to you?

Yes, it does!

Although, one minor comment below.

>
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -1218,7 +1218,7 @@ static int acpi_processor_setup_lpi_stat
>                 state->target_residency = lpi->min_residency;
>                 if (lpi->arch_flags)
>                         state->flags |= CPUIDLE_FLAG_TIMER_STOP;
> -               if (lpi->entry_method == ACPI_CSTATE_FFH)
> +               if (i != 0 && lpi->entry_method == ACPI_CSTATE_FFH)
>                         state->flags |= CPUIDLE_FLAG_RCU_IDLE;
>                 state->enter = acpi_idle_lpi_enter;
>                 drv->safe_state_index = i;
> --- a/drivers/cpuidle/cpuidle-arm.c
> +++ b/drivers/cpuidle/cpuidle-arm.c
> @@ -53,7 +53,7 @@ static struct cpuidle_driver arm_idle_dr
>          * handler for idle state index 0.
>          */
>         .states[0] = {
> -               .flags                  = CPUIDLE_FLAG_RCU_IDLE,
> +               .flags                  = 0,

Nitpick: I don't think we need to explicitly clear the flag, as it
should already be zeroed by the compiler from its static declaration.
Right?

>                 .enter                  = arm_enter_idle_state,
>                 .exit_latency           = 1,
>                 .target_residency       = 1,
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -357,7 +357,7 @@ static int psci_idle_init_cpu(struct dev
>          * PSCI idle states relies on architectural WFI to be represented as
>          * state index 0.
>          */
> -       drv->states[0].flags = CPUIDLE_FLAG_RCU_IDLE;
> +       drv->states[0].flags = 0;
>         drv->states[0].enter = psci_enter_idle_state;
>         drv->states[0].exit_latency = 1;
>         drv->states[0].target_residency = 1;
> --- a/drivers/cpuidle/cpuidle-qcom-spm.c
> +++ b/drivers/cpuidle/cpuidle-qcom-spm.c
> @@ -72,7 +72,7 @@ static struct cpuidle_driver qcom_spm_id
>         .owner = THIS_MODULE,
>         .states[0] = {
>                 .enter                  = spm_enter_idle_state,
> -               .flags                  = CPUIDLE_FLAG_RCU_IDLE,
> +               .flags                  = 0,
>                 .exit_latency           = 1,
>                 .target_residency       = 1,
>                 .power_usage            = UINT_MAX,
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -337,7 +337,7 @@ static int sbi_cpuidle_init_cpu(struct d
>         drv->cpumask = (struct cpumask *)cpumask_of(cpu);
>
>         /* RISC-V architectural WFI to be represented as state index 0. */
> -       drv->states[0].flags = CPUIDLE_FLAG_RCU_IDLE;
> +       drv->states[0].flags = 0;
>         drv->states[0].enter = sbi_cpuidle_enter_state;
>         drv->states[0].exit_latency = 1;
>         drv->states[0].target_residency = 1;
> --- a/include/linux/cpuidle.h
> +++ b/include/linux/cpuidle.h
> @@ -282,9 +282,7 @@ extern s64 cpuidle_governor_latency_req(
>         int __ret = 0;                                                  \
>                                                                         \
>         if (!idx) {                                                     \
> -               ct_idle_enter();                                        \
>                 cpu_do_idle();                                          \
> -               ct_idle_exit();                                         \
>                 return idx;                                             \
>         }                                                               \
>                                                                         \

Kind regards
Uffe
