Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E277E22A49C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 03:31:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBvv91s8fzDr6x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 11:31:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BoO4p+rF; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBvsM2qCPzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 11:30:15 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id y22so3595039oie.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 18:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YhLOcjKpCgLt9oimmCJP4UVsxMUg1CDYf6yyYw8HbJ0=;
 b=BoO4p+rFFbuFiuHh5Pqlltm6349FRazyKgxJhgbyowZV+wRbNyCkRmw+0idYJkch4j
 z1xnBYXriUkVfpcQyAfJvHS3zqO+2Nb1qdA3W+Tobh/qpKos+RN25ibIKvo2K6GYexgV
 qLl7v2jh0jiahIHPPSbf4kdLzA6iawc5p8W7SDPvGX8Lcl7iS1colNmrjjIDr33J1rjP
 1G9MtEFrMX50cYcU4KaAE6JI2ungLdDGfy/WfHBpmRvDlIJ06KDEixpyeNS6A1w2MgY4
 l+GUHqtJ7H+q0Lz+ucwx2EzI8GBWp7GdAgPxFHUwbBbr7wb8VgCzXoPySA1zLm4ZypiO
 BKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhLOcjKpCgLt9oimmCJP4UVsxMUg1CDYf6yyYw8HbJ0=;
 b=N0SaLbKmpwMKSA72yHNoDqfTnbHR1/KfHuI7c5M9gSI8PFnvjmlremyKBJeutSW06X
 c50Y5VzcrVZ+G+5MyDVHx6Pj4ZLDPT4uCOYECLgOzfOA/k2Eg8pzTMlgMIusUtuDL25O
 MBlWX8cPzXfMH/pZmBf9YOIXA9gD6aOIi8R7XMCriCoKcVK3OtbzZ68/45iJrTrSlaih
 XM5QmYb+UmH1LdlPgvLT8nQPTvaukacTDHkHpkxQZ1U4470GkeV0FlS9EKLnI46G/T2D
 4DFndPa5A+Vmeg8CwI0SHU/5b3xMnxrMlckF2d/uBengkFBd8C/OXBbiQfFmqcA+cC68
 5Njw==
X-Gm-Message-State: AOAM530c8aQSMRrEr2s0O/Fe0scUxL1cPf5tnMs+HcaKj8XcZbVc/jRi
 mt0vaJVoOpnEnNPH870p7L6E0y7QHFjIe7/yuB0=
X-Google-Smtp-Source: ABdhPJyQcxAMRL3JGmj7nO+Tmk2DdxuUkrpSYbyfcTaP3o/PkZYxVRZb84LYpTu8w+cfiAdVLskOmzZaD+midLe430o=
X-Received: by 2002:a54:4418:: with SMTP id k24mr1987878oiw.126.1595467813141; 
 Wed, 22 Jul 2020 18:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-12-git-send-email-atrajeev@linux.vnet.ibm.com>
 <CACzsE9q-oOhABFWUWH5Jc3BuePpUSmtyrzaJt0x7iJSVpeXH0g@mail.gmail.com>
In-Reply-To: <CACzsE9q-oOhABFWUWH5Jc3BuePpUSmtyrzaJt0x7iJSVpeXH0g@mail.gmail.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 23 Jul 2020 11:28:46 +1000
Message-ID: <CACzsE9qyLvSQs2KFirQoTDRZZeVkirDXQumhXycYQ8Kojc8BLQ@mail.gmail.com>
Subject: Re: [v3 11/15] powerpc/perf: BHRB control to disable BHRB logic when
 not used
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 11:26 AM Jordan Niethe <jniethe5@gmail.com> wrote:
>
> On Sat, Jul 18, 2020 at 1:26 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
> >
> > PowerISA v3.1 has few updates for the Branch History Rolling Buffer(BHRB).
> >
> > BHRB disable is controlled via Monitor Mode Control Register A (MMCRA)
> > bit, namely "BHRB Recording Disable (BHRBRD)". This field controls
> > whether BHRB entries are written when BHRB recording is enabled by other
> > bits. This patch implements support for this BHRB disable bit.
> >
> > By setting 0b1 to this bit will disable the BHRB and by setting 0b0
> > to this bit will have BHRB enabled. This addresses backward
> > compatibility (for older OS), since this bit will be cleared and
> > hardware will be writing to BHRB by default.
> >
> > This patch addresses changes to set MMCRA (BHRBRD) at boot for power10
> > ( there by the core will run faster) and enable this feature only on
> > runtime ie, on explicit need from user. Also save/restore MMCRA in the
> > restore path of state-loss idle state to make sure we keep BHRB disabled
> > if it was not enabled on request at runtime.
> >
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/perf/core-book3s.c       | 20 ++++++++++++++++----
> >  arch/powerpc/perf/isa207-common.c     | 12 ++++++++++++
> >  arch/powerpc/platforms/powernv/idle.c | 22 ++++++++++++++++++++--
> >  3 files changed, 48 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> > index bd125fe..31c0535 100644
> > --- a/arch/powerpc/perf/core-book3s.c
> > +++ b/arch/powerpc/perf/core-book3s.c
> > @@ -1218,7 +1218,7 @@ static void write_mmcr0(struct cpu_hw_events *cpuhw, unsigned long mmcr0)
> >  static void power_pmu_disable(struct pmu *pmu)
> >  {
> >         struct cpu_hw_events *cpuhw;
> > -       unsigned long flags, mmcr0, val;
> > +       unsigned long flags, mmcr0, val, mmcra;
> >
> >         if (!ppmu)
> >                 return;
> > @@ -1251,12 +1251,24 @@ static void power_pmu_disable(struct pmu *pmu)
> >                 mb();
> >                 isync();
> >
> > +               val = mmcra = cpuhw->mmcr.mmcra;
> > +
> >                 /*
> >                  * Disable instruction sampling if it was enabled
> >                  */
> > -               if (cpuhw->mmcr.mmcra & MMCRA_SAMPLE_ENABLE) {
> > -                       mtspr(SPRN_MMCRA,
> > -                             cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
> > +               if (cpuhw->mmcr.mmcra & MMCRA_SAMPLE_ENABLE)
> > +                       val &= ~MMCRA_SAMPLE_ENABLE;
> > +
> > +               /* Disable BHRB via mmcra (BHRBRD) for p10 */
> > +               if (ppmu->flags & PPMU_ARCH_310S)
> > +                       val |= MMCRA_BHRB_DISABLE;
> > +
> > +               /*
> > +                * Write SPRN_MMCRA if mmcra has either disabled
> > +                * instruction sampling or BHRB.
> > +                */
> > +               if (val != mmcra) {
> > +                       mtspr(SPRN_MMCRA, mmcra);
> >                         mb();
> >                         isync();
> >                 }
> > diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
> > index 77643f3..964437a 100644
> > --- a/arch/powerpc/perf/isa207-common.c
> > +++ b/arch/powerpc/perf/isa207-common.c
> > @@ -404,6 +404,13 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
> >
> >         mmcra = mmcr1 = mmcr2 = mmcr3 = 0;
> >
> > +       /*
> > +        * Disable bhrb unless explicitly requested
> > +        * by setting MMCRA (BHRBRD) bit.
> > +        */
> > +       if (cpu_has_feature(CPU_FTR_ARCH_31))
> > +               mmcra |= MMCRA_BHRB_DISABLE;
> > +
> >         /* Second pass: assign PMCs, set all MMCR1 fields */
> >         for (i = 0; i < n_ev; ++i) {
> >                 pmc     = (event[i] >> EVENT_PMC_SHIFT) & EVENT_PMC_MASK;
> > @@ -479,6 +486,11 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
> >                         mmcra |= val << MMCRA_IFM_SHIFT;
> >                 }
> >
> > +               /* set MMCRA (BHRBRD) to 0 if there is user request for BHRB */
> > +               if (cpu_has_feature(CPU_FTR_ARCH_31) &&
> > +                               (has_branch_stack(pevents[i]) || (event[i] & EVENT_WANTS_BHRB)))
> > +                       mmcra &= ~MMCRA_BHRB_DISABLE;
> > +
> >                 if (pevents[i]->attr.exclude_user)
> >                         mmcr2 |= MMCR2_FCP(pmc);
> >
> > diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> > index 2dd4673..1c9d0a9 100644
> > --- a/arch/powerpc/platforms/powernv/idle.c
> > +++ b/arch/powerpc/platforms/powernv/idle.c
> > @@ -611,6 +611,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
> >         unsigned long srr1;
> >         unsigned long pls;
> >         unsigned long mmcr0 = 0;
> > +       unsigned long mmcra = 0;
> >         struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
> >         bool sprs_saved = false;
> >
> > @@ -657,6 +658,21 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
> >                   */
> >                 mmcr0           = mfspr(SPRN_MMCR0);
> >         }
> > +
> > +       if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> > +               /*
> > +                * POWER10 uses MMCRA (BHRBRD) as BHRB disable bit.
> > +                * If the user hasn't asked for the BHRB to be
> > +                * written, the value of MMCRA[BHRBRD] is 1.
> > +                * On wakeup from stop, MMCRA[BHRBD] will be 0,
> > +                * since it is previleged resource and will be lost.
> > +                * Thus, if we do not save and restore the MMCRA[BHRBD],
> > +                * hardware will be needlessly writing to the BHRB
> > +                * in problem mode.
> > +                */
> > +               mmcra           = mfspr(SPRN_MMCRA);
> If the only thing that needs to happen is set MMCRA[BHRBRD], why save the MMCRA?
> > +       }
> > +
> >         if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
> >                 sprs.lpcr       = mfspr(SPRN_LPCR);
> >                 sprs.hfscr      = mfspr(SPRN_HFSCR);
> > @@ -700,8 +716,6 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
> >         WARN_ON_ONCE(mfmsr() & (MSR_IR|MSR_DR));
> >
> >         if ((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS) {
> > -               unsigned long mmcra;
> > -
> >                 /*
> >                  * We don't need an isync after the mtsprs here because the
> >                  * upcoming mtmsrd is execution synchronizing.
> > @@ -721,6 +735,10 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
> >                         mtspr(SPRN_MMCR0, mmcr0);
> >                 }
> >
> > +               /* Reload MMCRA to restore BHRB disable bit for POWER10 */
> > +               if (cpu_has_feature(CPU_FTR_ARCH_31))
> > +                       mtspr(SPRN_MMCRA, mmcra);
> > +
> >                 /*
> >                  * DD2.2 and earlier need to set then clear bit 60 in MMCRA
> >                  * to ensure the PMU starts running.
> Just below here we have:
>         mmcra = mfspr(SPRN_MMCRA);
>         mmcra |= PPC_BIT(60);
>         mtspr(SPRN_MMCRA, mmcra);
>         mmcra &= ~PPC_BIT(60);
>         mtspr(SPRN_MMCRA, mmcra);
> It seems MMCRA[BHRBRD] could just be OR'd in someway similar to this
> for ISA v3.1?
Oh wait the user could have cleared it, just ignore me.
> > --
> > 1.8.3.1
> >
