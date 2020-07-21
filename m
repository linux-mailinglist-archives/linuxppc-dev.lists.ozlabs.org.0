Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4E22772B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 05:44:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9kxG0ZjszDqTK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 13:44:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e+9Irk3x; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9kv2685NzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 13:42:37 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id 5so13973637oty.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 20:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hbyJCzv+MBbrbHM7IHEbJFub115CPz83CLRYOcNvuWU=;
 b=e+9Irk3xslzS1Xe65vBHshx1JxTPcO9mGNnk7Mmf3ZDO0ol5vlkmv1T12UEi4UN7wV
 HsjU5jSotdFjno6yW5nMI08xvHChZvLRiSU9WKpTU4eN+FE01lb8a9rwfazHQ5gA4ug5
 qAqkRuU+lZjJWN9ApBTidLQSm7nyicd3ydHyrxHESQ3ZDOt/vcmrbSzhlA3GiExRw9rq
 3wxzO48wnDkLicF9ripUDg0SFASPVS1Nckn/EBBab3Ci15LCeZn7TqSiWxYnVvM+MGmh
 /zop1Umv85livzM9tGcobmNw4/XdIk9NIpdR0wgSZdVoLHV18lUhswUUHfZVmLDOMb2d
 9KNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hbyJCzv+MBbrbHM7IHEbJFub115CPz83CLRYOcNvuWU=;
 b=CxFRKnzzKtirKIkgVS6jPgK8qHmegMlpjAokYHACGzk/NeTNYV/pvAhCmzRVBe1v0J
 owTfbBuNTvm6+VsNeEyH74en1XVCILe8/112QROgPAAdcnix1tklw2FUXepbtJ8lG4ip
 zEKlKRky8HMrAJR8Iv5dEGsL1xh0J+PF0Jfw0J7zTjB2L5pWKh8A47cr64kFOuFWcpfK
 mZBdjUiVV1a3Av+NIxeTfIXCLlkyfMs8BbUhkw86XHpa4mZhZjuBYc5t3LoSFM7TDC1K
 VRTxcU9qiFBTadaGAwvv4vWm/1p2X5Pgbh0uweF7tKnVkcBDC/abdwORo1De8eYjCRfH
 IbEQ==
X-Gm-Message-State: AOAM532sjMnvSbfXnvMngK6NBLgIqMQwHpGEFyZaB0h1TLluEoklnUO2
 vPrqq5klbS4yTwRMK2jIEQgs8mH40j+cnc9vjA4=
X-Google-Smtp-Source: ABdhPJwyDGLQblOirP/K/HCy4ai7cJl/fxI2CdXZZf7T5hfW29rsnEeLe0gbH4nIPiTnmtik0NCnQrrEJ8oso2Er8xQ=
X-Received: by 2002:a9d:6a12:: with SMTP id g18mr24369820otn.155.1595302953747; 
 Mon, 20 Jul 2020 20:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-2-git-send-email-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1594996707-3727-2-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 21 Jul 2020 13:42:19 +1000
Message-ID: <CACzsE9rnE_z-uEw2tyvdFDVzkOeBKJoZiTHD9fSRm9d8fVBr5w@mail.gmail.com>
Subject: Re: [v3 01/15] powerpc/perf: Update cpu_hw_event to use `struct` for
 storing MMCR registers
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, mikey@neuling.org,
 maddy@linux.vnet.ibm.com, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 svaidyan@in.ibm.com, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 18, 2020 at 12:48 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> core-book3s currently uses array to store the MMCR registers as part
> of per-cpu `cpu_hw_events`. This patch does a clean up to use `struct`
> to store mmcr regs instead of array. This will make code easier to read
> and reduces chance of any subtle bug that may come in the future, say
> when new registers are added. Patch updates all relevant code that was
> using MMCR array ( cpuhw->mmcr[x]) to use newly introduced `struct`.
> This includes the PMU driver code for supported platforms (power5
> to power9) and ISA macros for counter support functions.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/perf_event_server.h | 10 ++++--
>  arch/powerpc/perf/core-book3s.c              | 53 +++++++++++++---------------
>  arch/powerpc/perf/isa207-common.c            | 20 +++++------
>  arch/powerpc/perf/isa207-common.h            |  4 +--
>  arch/powerpc/perf/mpc7450-pmu.c              | 21 +++++++----
>  arch/powerpc/perf/power5+-pmu.c              | 17 ++++-----
>  arch/powerpc/perf/power5-pmu.c               | 17 ++++-----
>  arch/powerpc/perf/power6-pmu.c               | 16 ++++-----
>  arch/powerpc/perf/power7-pmu.c               | 17 ++++-----
>  arch/powerpc/perf/ppc970-pmu.c               | 24 ++++++-------
>  10 files changed, 105 insertions(+), 94 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
> index 3e9703f..f9a3668 100644
> --- a/arch/powerpc/include/asm/perf_event_server.h
> +++ b/arch/powerpc/include/asm/perf_event_server.h
> @@ -17,6 +17,12 @@
>
>  struct perf_event;
>
> +struct mmcr_regs {
> +       unsigned long mmcr0;
> +       unsigned long mmcr1;
> +       unsigned long mmcr2;
> +       unsigned long mmcra;
> +};
>  /*
>   * This struct provides the constants and functions needed to
>   * describe the PMU on a particular POWER-family CPU.
> @@ -28,7 +34,7 @@ struct power_pmu {
>         unsigned long   add_fields;
>         unsigned long   test_adder;
>         int             (*compute_mmcr)(u64 events[], int n_ev,
> -                               unsigned int hwc[], unsigned long mmcr[],
> +                               unsigned int hwc[], struct mmcr_regs *mmcr,
>                                 struct perf_event *pevents[]);
>         int             (*get_constraint)(u64 event_id, unsigned long *mskp,
>                                 unsigned long *valp);
> @@ -41,7 +47,7 @@ struct power_pmu {
>         unsigned long   group_constraint_val;
>         u64             (*bhrb_filter_map)(u64 branch_sample_type);
>         void            (*config_bhrb)(u64 pmu_bhrb_filter);
> -       void            (*disable_pmc)(unsigned int pmc, unsigned long mmcr[]);
> +       void            (*disable_pmc)(unsigned int pmc, struct mmcr_regs *mmcr);
>         int             (*limited_pmc_event)(u64 event_id);
>         u32             flags;
>         const struct attribute_group    **attr_groups;
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index cd6a742..18b1b6a 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -37,12 +37,7 @@ struct cpu_hw_events {
>         struct perf_event *event[MAX_HWEVENTS];
>         u64 events[MAX_HWEVENTS];
>         unsigned int flags[MAX_HWEVENTS];
> -       /*
> -        * The order of the MMCR array is:
> -        *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2
> -        *  - 32-bit, MMCR0, MMCR1, MMCR2
> -        */
> -       unsigned long mmcr[4];
> +       struct mmcr_regs mmcr;
>         struct perf_event *limited_counter[MAX_LIMITED_HWCOUNTERS];
>         u8  limited_hwidx[MAX_LIMITED_HWCOUNTERS];
>         u64 alternatives[MAX_HWEVENTS][MAX_EVENT_ALTERNATIVES];
> @@ -121,7 +116,7 @@ static void ebb_event_add(struct perf_event *event) { }
>  static void ebb_switch_out(unsigned long mmcr0) { }
>  static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)
>  {
> -       return cpuhw->mmcr[0];
> +       return cpuhw->mmcr.mmcr0;
>  }
>
>  static inline void power_pmu_bhrb_enable(struct perf_event *event) {}
> @@ -590,7 +585,7 @@ static void ebb_switch_out(unsigned long mmcr0)
>
>  static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)
>  {
> -       unsigned long mmcr0 = cpuhw->mmcr[0];
> +       unsigned long mmcr0 = cpuhw->mmcr.mmcr0;
>
>         if (!ebb)
>                 goto out;
> @@ -624,7 +619,7 @@ static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)
>          * unfreeze counters, it should not set exclude_xxx in its events and
>          * instead manage the MMCR2 entirely by itself.
>          */
> -       mtspr(SPRN_MMCR2, cpuhw->mmcr[3] | current->thread.mmcr2);
> +       mtspr(SPRN_MMCR2, cpuhw->mmcr.mmcr2 | current->thread.mmcr2);
>  out:
>         return mmcr0;
>  }
> @@ -1232,9 +1227,9 @@ static void power_pmu_disable(struct pmu *pmu)
>                 /*
>                  * Disable instruction sampling if it was enabled
>                  */
> -               if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE) {
> +               if (cpuhw->mmcr.mmcra & MMCRA_SAMPLE_ENABLE) {
>                         mtspr(SPRN_MMCRA,
> -                             cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
> +                             cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
>                         mb();
>                         isync();
>                 }
> @@ -1308,18 +1303,18 @@ static void power_pmu_enable(struct pmu *pmu)
>          * (possibly updated for removal of events).
>          */
>         if (!cpuhw->n_added) {
> -               mtspr(SPRN_MMCRA, cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
> -               mtspr(SPRN_MMCR1, cpuhw->mmcr[1]);
> +               mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
> +               mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
>                 goto out_enable;
>         }
>
>         /*
>          * Clear all MMCR settings and recompute them for the new set of events.
>          */
> -       memset(cpuhw->mmcr, 0, sizeof(cpuhw->mmcr));
> +       memset(&cpuhw->mmcr, 0, sizeof(cpuhw->mmcr));
>
>         if (ppmu->compute_mmcr(cpuhw->events, cpuhw->n_events, hwc_index,
> -                              cpuhw->mmcr, cpuhw->event)) {
> +                              &cpuhw->mmcr, cpuhw->event)) {
>                 /* shouldn't ever get here */
>                 printk(KERN_ERR "oops compute_mmcr failed\n");
>                 goto out;
> @@ -1333,11 +1328,11 @@ static void power_pmu_enable(struct pmu *pmu)
>                  */
>                 event = cpuhw->event[0];
>                 if (event->attr.exclude_user)
> -                       cpuhw->mmcr[0] |= MMCR0_FCP;
> +                       cpuhw->mmcr.mmcr0 |= MMCR0_FCP;
>                 if (event->attr.exclude_kernel)
> -                       cpuhw->mmcr[0] |= freeze_events_kernel;
> +                       cpuhw->mmcr.mmcr0 |= freeze_events_kernel;
>                 if (event->attr.exclude_hv)
> -                       cpuhw->mmcr[0] |= MMCR0_FCHV;
> +                       cpuhw->mmcr.mmcr0 |= MMCR0_FCHV;
>         }
>
>         /*
> @@ -1346,12 +1341,12 @@ static void power_pmu_enable(struct pmu *pmu)
>          * Then unfreeze the events.
>          */
>         ppc_set_pmu_inuse(1);
> -       mtspr(SPRN_MMCRA, cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
> -       mtspr(SPRN_MMCR1, cpuhw->mmcr[1]);
> -       mtspr(SPRN_MMCR0, (cpuhw->mmcr[0] & ~(MMCR0_PMC1CE | MMCR0_PMCjCE))
> +       mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
> +       mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
> +       mtspr(SPRN_MMCR0, (cpuhw->mmcr.mmcr0 & ~(MMCR0_PMC1CE | MMCR0_PMCjCE))
>                                 | MMCR0_FC);
>         if (ppmu->flags & PPMU_ARCH_207S)
> -               mtspr(SPRN_MMCR2, cpuhw->mmcr[3]);
> +               mtspr(SPRN_MMCR2, cpuhw->mmcr.mmcr2);
>
>         /*
>          * Read off any pre-existing events that need to move
> @@ -1402,7 +1397,7 @@ static void power_pmu_enable(struct pmu *pmu)
>                 perf_event_update_userpage(event);
>         }
>         cpuhw->n_limited = n_lim;
> -       cpuhw->mmcr[0] |= MMCR0_PMXE | MMCR0_FCECE;
> +       cpuhw->mmcr.mmcr0 |= MMCR0_PMXE | MMCR0_FCECE;
>
>   out_enable:
>         pmao_restore_workaround(ebb);
> @@ -1418,9 +1413,9 @@ static void power_pmu_enable(struct pmu *pmu)
>         /*
>          * Enable instruction sampling if necessary
>          */
> -       if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE) {
> +       if (cpuhw->mmcr.mmcra & MMCRA_SAMPLE_ENABLE) {
>                 mb();
> -               mtspr(SPRN_MMCRA, cpuhw->mmcr[2]);
> +               mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra);
>         }
>
>   out:
> @@ -1550,7 +1545,7 @@ static void power_pmu_del(struct perf_event *event, int ef_flags)
>                                 cpuhw->flags[i-1] = cpuhw->flags[i];
>                         }
>                         --cpuhw->n_events;
> -                       ppmu->disable_pmc(event->hw.idx - 1, cpuhw->mmcr);
> +                       ppmu->disable_pmc(event->hw.idx - 1, &cpuhw->mmcr);
>                         if (event->hw.idx) {
>                                 write_pmc(event->hw.idx, 0);
>                                 event->hw.idx = 0;
> @@ -1571,7 +1566,7 @@ static void power_pmu_del(struct perf_event *event, int ef_flags)
>         }
>         if (cpuhw->n_events == 0) {
>                 /* disable exceptions if no events are running */
> -               cpuhw->mmcr[0] &= ~(MMCR0_PMXE | MMCR0_FCECE);
> +               cpuhw->mmcr.mmcr0 &= ~(MMCR0_PMXE | MMCR0_FCECE);
>         }
>
>         if (has_branch_stack(event))
> @@ -2240,7 +2235,7 @@ static void __perf_event_interrupt(struct pt_regs *regs)
>          * XXX might want to use MSR.PM to keep the events frozen until
>          * we get back out of this interrupt.
>          */
> -       write_mmcr0(cpuhw, cpuhw->mmcr[0]);
> +       write_mmcr0(cpuhw, cpuhw->mmcr.mmcr0);
>
>         if (nmi)
>                 nmi_exit();
> @@ -2262,7 +2257,7 @@ static int power_pmu_prepare_cpu(unsigned int cpu)
>
>         if (ppmu) {
>                 memset(cpuhw, 0, sizeof(*cpuhw));
> -               cpuhw->mmcr[0] = MMCR0_FC;
> +               cpuhw->mmcr.mmcr0 = MMCR0_FC;
>         }
>         return 0;
>  }
> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
> index 4c86da5..2fe63f2 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -363,7 +363,7 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
>  }
>
>  int isa207_compute_mmcr(u64 event[], int n_ev,
> -                              unsigned int hwc[], unsigned long mmcr[],
> +                              unsigned int hwc[], struct mmcr_regs *mmcr,
>                                struct perf_event *pevents[])
>  {
>         unsigned long mmcra, mmcr1, mmcr2, unit, combine, psel, cache, val;
> @@ -464,30 +464,30 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
>         }
>
>         /* Return MMCRx values */
> -       mmcr[0] = 0;
> +       mmcr->mmcr0 = 0;
>
>         /* pmc_inuse is 1-based */
>         if (pmc_inuse & 2)
> -               mmcr[0] = MMCR0_PMC1CE;
> +               mmcr->mmcr0 = MMCR0_PMC1CE;
>
>         if (pmc_inuse & 0x7c)
> -               mmcr[0] |= MMCR0_PMCjCE;
> +               mmcr->mmcr0 |= MMCR0_PMCjCE;
>
>         /* If we're not using PMC 5 or 6, freeze them */
>         if (!(pmc_inuse & 0x60))
> -               mmcr[0] |= MMCR0_FC56;
> +               mmcr->mmcr0 |= MMCR0_FC56;
>
> -       mmcr[1] = mmcr1;
> -       mmcr[2] = mmcra;
> -       mmcr[3] = mmcr2;
> +       mmcr->mmcr1 = mmcr1;
> +       mmcr->mmcra = mmcra;
> +       mmcr->mmcr2 = mmcr2;
>
>         return 0;
>  }
>
> -void isa207_disable_pmc(unsigned int pmc, unsigned long mmcr[])
> +void isa207_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr)
>  {
>         if (pmc <= 3)
> -               mmcr[1] &= ~(0xffUL << MMCR1_PMCSEL_SHIFT(pmc + 1));
> +               mmcr->mmcr1 &= ~(0xffUL << MMCR1_PMCSEL_SHIFT(pmc + 1));
>  }
>
>  static int find_alternative(u64 event, const unsigned int ev_alt[][MAX_ALT], int size)
> diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
> index 63fd4f3..df968fd 100644
> --- a/arch/powerpc/perf/isa207-common.h
> +++ b/arch/powerpc/perf/isa207-common.h
> @@ -217,9 +217,9 @@
>
>  int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp);
>  int isa207_compute_mmcr(u64 event[], int n_ev,
> -                               unsigned int hwc[], unsigned long mmcr[],
> +                               unsigned int hwc[], struct mmcr_regs *mmcr,
>                                 struct perf_event *pevents[]);
> -void isa207_disable_pmc(unsigned int pmc, unsigned long mmcr[]);
> +void isa207_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr);
>  int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int flags,
>                                         const unsigned int ev_alt[][MAX_ALT]);
>  void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
> diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
> index 4d5ef92..826de25 100644
> --- a/arch/powerpc/perf/mpc7450-pmu.c
> +++ b/arch/powerpc/perf/mpc7450-pmu.c
> @@ -257,7 +257,7 @@ static int mpc7450_get_alternatives(u64 event, unsigned int flags, u64 alt[])
>   * Compute MMCR0/1/2 values for a set of events.
>   */
>  static int mpc7450_compute_mmcr(u64 event[], int n_ev, unsigned int hwc[],
> -                               unsigned long mmcr[],
> +                               struct mmcr_regs *mmcr,
>                                 struct perf_event *pevents[])
>  {
>         u8 event_index[N_CLASSES][N_COUNTER];
> @@ -321,9 +321,16 @@ static int mpc7450_compute_mmcr(u64 event[], int n_ev, unsigned int hwc[],
>                 mmcr0 |= MMCR0_PMCnCE;
>
>         /* Return MMCRx values */
> -       mmcr[0] = mmcr0;
> -       mmcr[1] = mmcr1;
> -       mmcr[2] = mmcr2;
> +       mmcr->mmcr0 = mmcr0;
> +       mmcr->mmcr1 = mmcr1;
> +       mmcr->mmcr2 = mmcr2;
Will this mmcr->mmcr2 be used anywere, or will it always use mmcr->mmcra?
> +       /*
> +        * 32-bit doesn't have an MMCRA and uses SPRN_MMCR2 to define
> +        * SPRN_MMCRA. So assign mmcra of cpu_hw_events with `mmcr2`
> +        * value to ensure that any write to this SPRN_MMCRA will
> +        * use mmcr2 value.
> +        */
Something like this comment would probably be useful to near the struct mmcr.
> +       mmcr->mmcra = mmcr2;
>         return 0;
>  }
>
> @@ -331,12 +338,12 @@ static int mpc7450_compute_mmcr(u64 event[], int n_ev, unsigned int hwc[],
>   * Disable counting by a PMC.
>   * Note that the pmc argument is 0-based here, not 1-based.
>   */
> -static void mpc7450_disable_pmc(unsigned int pmc, unsigned long mmcr[])
> +static void mpc7450_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr)
>  {
>         if (pmc <= 1)
> -               mmcr[0] &= ~(pmcsel_mask[pmc] << pmcsel_shift[pmc]);
> +               mmcr->mmcr0 &= ~(pmcsel_mask[pmc] << pmcsel_shift[pmc]);
>         else
> -               mmcr[1] &= ~(pmcsel_mask[pmc] << pmcsel_shift[pmc]);
> +               mmcr->mmcr1 &= ~(pmcsel_mask[pmc] << pmcsel_shift[pmc]);
>  }
>
>  static int mpc7450_generic_events[] = {
> diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
> index f857454..5f0821e 100644
> --- a/arch/powerpc/perf/power5+-pmu.c
> +++ b/arch/powerpc/perf/power5+-pmu.c
> @@ -448,7 +448,8 @@ static int power5p_marked_instr_event(u64 event)
>  }
>
>  static int power5p_compute_mmcr(u64 event[], int n_ev,
> -                               unsigned int hwc[], unsigned long mmcr[], struct perf_event *pevents[])
> +                               unsigned int hwc[], struct mmcr_regs *mmcr,
> +                               struct perf_event *pevents[])
>  {
>         unsigned long mmcr1 = 0;
>         unsigned long mmcra = 0;
> @@ -586,20 +587,20 @@ static int power5p_compute_mmcr(u64 event[], int n_ev,
>         }
>
>         /* Return MMCRx values */
> -       mmcr[0] = 0;
> +       mmcr->mmcr0 = 0;
>         if (pmc_inuse & 1)
> -               mmcr[0] = MMCR0_PMC1CE;
> +               mmcr->mmcr0 = MMCR0_PMC1CE;
>         if (pmc_inuse & 0x3e)
> -               mmcr[0] |= MMCR0_PMCjCE;
> -       mmcr[1] = mmcr1;
> -       mmcr[2] = mmcra;
> +               mmcr->mmcr0 |= MMCR0_PMCjCE;
> +       mmcr->mmcr1 = mmcr1;
> +       mmcr->mmcra = mmcra;
>         return 0;
>  }
>
> -static void power5p_disable_pmc(unsigned int pmc, unsigned long mmcr[])
> +static void power5p_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr)
>  {
>         if (pmc <= 3)
> -               mmcr[1] &= ~(0x7fUL << MMCR1_PMCSEL_SH(pmc));
> +               mmcr->mmcr1 &= ~(0x7fUL << MMCR1_PMCSEL_SH(pmc));
>  }
>
>  static int power5p_generic_events[] = {
> diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
> index da52eca..426021d 100644
> --- a/arch/powerpc/perf/power5-pmu.c
> +++ b/arch/powerpc/perf/power5-pmu.c
> @@ -379,7 +379,8 @@ static int power5_marked_instr_event(u64 event)
>  }
>
>  static int power5_compute_mmcr(u64 event[], int n_ev,
> -                              unsigned int hwc[], unsigned long mmcr[], struct perf_event *pevents[])
> +                              unsigned int hwc[], struct mmcr_regs *mmcr,
> +                              struct perf_event *pevents[])
>  {
>         unsigned long mmcr1 = 0;
>         unsigned long mmcra = MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;
> @@ -528,20 +529,20 @@ static int power5_compute_mmcr(u64 event[], int n_ev,
>         }
>
>         /* Return MMCRx values */
> -       mmcr[0] = 0;
> +       mmcr->mmcr0 = 0;
>         if (pmc_inuse & 1)
> -               mmcr[0] = MMCR0_PMC1CE;
> +               mmcr->mmcr0 = MMCR0_PMC1CE;
>         if (pmc_inuse & 0x3e)
> -               mmcr[0] |= MMCR0_PMCjCE;
> -       mmcr[1] = mmcr1;
> -       mmcr[2] = mmcra;
> +               mmcr->mmcr0 |= MMCR0_PMCjCE;
> +       mmcr->mmcr1 = mmcr1;
> +       mmcr->mmcra = mmcra;
>         return 0;
>  }
>
> -static void power5_disable_pmc(unsigned int pmc, unsigned long mmcr[])
> +static void power5_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr)
>  {
>         if (pmc <= 3)
> -               mmcr[1] &= ~(0x7fUL << MMCR1_PMCSEL_SH(pmc));
> +               mmcr->mmcr1 &= ~(0x7fUL << MMCR1_PMCSEL_SH(pmc));
>  }
>
>  static int power5_generic_events[] = {
> diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
> index 3929cac..e343a51 100644
> --- a/arch/powerpc/perf/power6-pmu.c
> +++ b/arch/powerpc/perf/power6-pmu.c
> @@ -171,7 +171,7 @@ static int power6_marked_instr_event(u64 event)
>   * Assign PMC numbers and compute MMCR1 value for a set of events
>   */
>  static int p6_compute_mmcr(u64 event[], int n_ev,
> -                          unsigned int hwc[], unsigned long mmcr[], struct perf_event *pevents[])
> +                          unsigned int hwc[], struct mmcr_regs *mmcr, struct perf_event *pevents[])
>  {
>         unsigned long mmcr1 = 0;
>         unsigned long mmcra = MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;
> @@ -243,13 +243,13 @@ static int p6_compute_mmcr(u64 event[], int n_ev,
>                 if (pmc < 4)
>                         mmcr1 |= (unsigned long)psel << MMCR1_PMCSEL_SH(pmc);
>         }
> -       mmcr[0] = 0;
> +       mmcr->mmcr0 = 0;
>         if (pmc_inuse & 1)
> -               mmcr[0] = MMCR0_PMC1CE;
> +               mmcr->mmcr0 = MMCR0_PMC1CE;
>         if (pmc_inuse & 0xe)
> -               mmcr[0] |= MMCR0_PMCjCE;
> -       mmcr[1] = mmcr1;
> -       mmcr[2] = mmcra;
> +               mmcr->mmcr0 |= MMCR0_PMCjCE;
> +       mmcr->mmcr1 = mmcr1;
> +       mmcr->mmcra = mmcra;
>         return 0;
>  }
>
> @@ -457,11 +457,11 @@ static int p6_get_alternatives(u64 event, unsigned int flags, u64 alt[])
>         return nalt;
>  }
>
> -static void p6_disable_pmc(unsigned int pmc, unsigned long mmcr[])
> +static void p6_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr)
>  {
>         /* Set PMCxSEL to 0 to disable PMCx */
>         if (pmc <= 3)
> -               mmcr[1] &= ~(0xffUL << MMCR1_PMCSEL_SH(pmc));
> +               mmcr->mmcr1 &= ~(0xffUL << MMCR1_PMCSEL_SH(pmc));
>  }
>
>  static int power6_generic_events[] = {
> diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
> index a137813..3152336 100644
> --- a/arch/powerpc/perf/power7-pmu.c
> +++ b/arch/powerpc/perf/power7-pmu.c
> @@ -242,7 +242,8 @@ static int power7_marked_instr_event(u64 event)
>  }
>
>  static int power7_compute_mmcr(u64 event[], int n_ev,
> -                              unsigned int hwc[], unsigned long mmcr[], struct perf_event *pevents[])
> +                              unsigned int hwc[], struct mmcr_regs *mmcr,
> +                              struct perf_event *pevents[])
>  {
>         unsigned long mmcr1 = 0;
>         unsigned long mmcra = MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;
> @@ -298,20 +299,20 @@ static int power7_compute_mmcr(u64 event[], int n_ev,
>         }
>
>         /* Return MMCRx values */
> -       mmcr[0] = 0;
> +       mmcr->mmcr0 = 0;
>         if (pmc_inuse & 1)
> -               mmcr[0] = MMCR0_PMC1CE;
> +               mmcr->mmcr0 = MMCR0_PMC1CE;
>         if (pmc_inuse & 0x3e)
> -               mmcr[0] |= MMCR0_PMCjCE;
> -       mmcr[1] = mmcr1;
> -       mmcr[2] = mmcra;
> +               mmcr->mmcr0 |= MMCR0_PMCjCE;
> +       mmcr->mmcr1 = mmcr1;
> +       mmcr->mmcra = mmcra;
>         return 0;
>  }
>
> -static void power7_disable_pmc(unsigned int pmc, unsigned long mmcr[])
> +static void power7_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr)
>  {
>         if (pmc <= 3)
> -               mmcr[1] &= ~(0xffUL << MMCR1_PMCSEL_SH(pmc));
> +               mmcr->mmcr1 &= ~(0xffUL << MMCR1_PMCSEL_SH(pmc));
>  }
>
>  static int power7_generic_events[] = {
> diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
> index 4035d93..89a90ab 100644
> --- a/arch/powerpc/perf/ppc970-pmu.c
> +++ b/arch/powerpc/perf/ppc970-pmu.c
> @@ -253,7 +253,8 @@ static int p970_get_alternatives(u64 event, unsigned int flags, u64 alt[])
>  }
>
>  static int p970_compute_mmcr(u64 event[], int n_ev,
> -                            unsigned int hwc[], unsigned long mmcr[], struct perf_event *pevents[])
> +                            unsigned int hwc[], struct mmcr_regs *mmcr,
> +                            struct perf_event *pevents[])
>  {
>         unsigned long mmcr0 = 0, mmcr1 = 0, mmcra = 0;
>         unsigned int pmc, unit, byte, psel;
> @@ -393,27 +394,26 @@ static int p970_compute_mmcr(u64 event[], int n_ev,
>         mmcra |= 0x2000;        /* mark only one IOP per PPC instruction */
>
>         /* Return MMCRx values */
> -       mmcr[0] = mmcr0;
> -       mmcr[1] = mmcr1;
> -       mmcr[2] = mmcra;
> +       mmcr->mmcr0 = mmcr0;
> +       mmcr->mmcr1 = mmcr1;
> +       mmcr->mmcra = mmcra;
>         return 0;
>  }
>
> -static void p970_disable_pmc(unsigned int pmc, unsigned long mmcr[])
> +static void p970_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr)
>  {
> -       int shift, i;
> +       int shift;
>
> +       /*
> +        * Setting the PMCxSEL field to 0x08 disables PMC x.
> +        */
>         if (pmc <= 1) {
>                 shift = MMCR0_PMC1SEL_SH - 7 * pmc;
> -               i = 0;
> +               mmcr->mmcr0 = (mmcr->mmcr0 & ~(0x1fUL << shift)) | (0x08UL << shift);
>         } else {
>                 shift = MMCR1_PMC3SEL_SH - 5 * (pmc - 2);
> -               i = 1;
> +               mmcr->mmcr1 = (mmcr->mmcr1 & ~(0x1fUL << shift)) | (0x08UL << shift);
>         }
> -       /*
> -        * Setting the PMCxSEL field to 0x08 disables PMC x.
> -        */
> -       mmcr[i] = (mmcr[i] & ~(0x1fUL << shift)) | (0x08UL << shift);
>  }
>
>  static int ppc970_generic_events[] = {
> --
> 1.8.3.1
>
