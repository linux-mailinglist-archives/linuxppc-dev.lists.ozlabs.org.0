Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDDB228EF2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:21:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBMjB1hz3zDqlK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:21:18 +1000 (AEST)
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
 header.s=20161025 header.b=AKV/iBIx; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMgJ6nLQzDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:19:39 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id n24so803330otr.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XlhUCeERcY43CFdwzOyS8GWl1Htb6TyU3Zj1mrWRxZo=;
 b=AKV/iBIx7XkcKa62jLm2dUeHX1fPKYyaSSQSJk6Lz5Ry5sKIoKN7fNBwrzD0iQ/sfW
 sUbQ3V/6UDyB12vWj7N+YjKfIR1dCFjKVk+hBmlDp4vq5UiVevq2qcMgHEjdOWrsvYH1
 Ib3CsQfsCOi/ynX/XNVGh449dHDKTq5yY3LNDfBuCS5l/pfwBhaBsWcvs57g4R9TnG9T
 9hOqe/aEjncTlEVdasx7NW+WieuGoo13ZYEj3OJOkbi99SckHcd0vtoemU/KgzCIWsAi
 S/pSxQiYPDf/F3P/7F2GvoWrc3YY1Tbxq83ZOteSKWaAFEIHXJioTjwbOIzq7TMOnZKz
 RvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XlhUCeERcY43CFdwzOyS8GWl1Htb6TyU3Zj1mrWRxZo=;
 b=WFpm+tOSMOYon9/KIIg2jg19mfwKunynU+gBfvCQP81+CQRIrhoSyLYQHMxRVJaG8x
 UQi/2kr7JUlsuixC8O3I9h5S3UjVABclwOf15dkS4QdH6TJYrZarHAYU2e5ED276P8Tm
 GawplZOhSywYezi/bpY0RzOMRTEnKmmeJU43qucFcqh9yxXDNxzBygEM+SXyvGhTNfWH
 /yZ5ID4ezC/ClHc6UQPMxjyFw7WaG3bfTMWfHPIZxotcBA3YC7HWsHG4LqWiLgd9rXdg
 awXAvnVjM/Q+8ObkK7oX9YNeMQwvcreLxBphXGO/00lGTEnticcYKo7cA6aIXgr+JUBq
 XifQ==
X-Gm-Message-State: AOAM530sAs7UN79RJfDfxpcGJHEWUoVpKw0dsHs426450nwKnXYVGwmL
 yQTaD/fMOk96U9NfWBgD3bJmCzqa4ZwSalh4b1A=
X-Google-Smtp-Source: ABdhPJwxqslI+vggm2DSOZa8p9JPovjeItnOkY7N7hhYB9Oy7PA7VgRpyUq8IR/oYo9Y3HZzn8XiHZ3qyNIKzyQ0FSg=
X-Received: by 2002:a9d:2041:: with SMTP id n59mr28606497ota.28.1595391576626; 
 Tue, 21 Jul 2020 21:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-5-git-send-email-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1594996707-3727-5-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 22 Jul 2020 14:18:51 +1000
Message-ID: <CACzsE9r9fy22hScRm7yz5OeZH9jXA+97hEfAOo-Nk_EPwW-_Dw@mail.gmail.com>
Subject: Re: [v3 04/15] powerpc/perf: Add support for ISA3.1 PMU SPRs
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

On Sat, Jul 18, 2020 at 1:02 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>
> PowerISA v3.1 includes new performance monitoring unit(PMU)
> special purpose registers (SPRs). They are
>
> Monitor Mode Control Register 3 (MMCR3)
> Sampled Instruction Event Register 2 (SIER2)
> Sampled Instruction Event Register 3 (SIER3)
>
> MMCR3 is added for further sampling related configuration
> control. SIER2/SIER3 are added to provide additional
> information about the sampled instruction.
>
> Patch adds new PPMU flag called "PPMU_ARCH_310S" to support
> handling of these new SPRs, updates the struct thread_struct
> to include these new SPRs, include MMCR3 in struct mmcr_regs.
> This is needed to support programming of MMCR3 SPR during
> event_[enable/disable]. Patch also adds the sysfs support
> for the MMCR3 SPR along with SPRN_ macros for these new pmu sprs.
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/perf_event_server.h |  2 ++
>  arch/powerpc/include/asm/processor.h         |  4 ++++
>  arch/powerpc/include/asm/reg.h               |  6 ++++++
>  arch/powerpc/kernel/sysfs.c                  |  8 ++++++++
>  arch/powerpc/perf/core-book3s.c              | 29 ++++++++++++++++++++++++++++
>  5 files changed, 49 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
> index 14b8dc1..832450a 100644
> --- a/arch/powerpc/include/asm/perf_event_server.h
> +++ b/arch/powerpc/include/asm/perf_event_server.h
> @@ -22,6 +22,7 @@ struct mmcr_regs {
>         unsigned long mmcr1;
>         unsigned long mmcr2;
>         unsigned long mmcra;
> +       unsigned long mmcr3;
>  };
>  /*
>   * This struct provides the constants and functions needed to
> @@ -75,6 +76,7 @@ struct power_pmu {
>  #define PPMU_HAS_SIER          0x00000040 /* Has SIER */
>  #define PPMU_ARCH_207S         0x00000080 /* PMC is architecture v2.07S */
>  #define PPMU_NO_SIAR           0x00000100 /* Do not use SIAR */
> +#define PPMU_ARCH_310S         0x00000200 /* Has MMCR3, SIER2 and SIER3 */
We elsewhere have CPU_FTR_ARCH_31, so should this be PPMU_ARCH_31S to
be consistent.
>
>  /*
>   * Values for flags to get_alternatives()
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index 52a6783..a466e94 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -272,6 +272,10 @@ struct thread_struct {
>         unsigned        mmcr0;
>
>         unsigned        used_ebb;
> +       unsigned long   mmcr3;
> +       unsigned long   sier2;
> +       unsigned long   sier3;
> +
>  #endif
>  };
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 88e6c78..21a1b2d 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -876,7 +876,9 @@
>  #define   MMCR0_FCHV   0x00000001UL /* freeze conditions in hypervisor mode */
>  #define SPRN_MMCR1     798
>  #define SPRN_MMCR2     785
> +#define SPRN_MMCR3     754
>  #define SPRN_UMMCR2    769
> +#define SPRN_UMMCR3    738
>  #define SPRN_MMCRA     0x312
>  #define   MMCRA_SDSYNC 0x80000000UL /* SDAR synced with SIAR */
>  #define   MMCRA_SDAR_DCACHE_MISS 0x40000000UL
> @@ -918,6 +920,10 @@
>  #define   SIER_SIHV            0x1000000       /* Sampled MSR_HV */
>  #define   SIER_SIAR_VALID      0x0400000       /* SIAR contents valid */
>  #define   SIER_SDAR_VALID      0x0200000       /* SDAR contents valid */
> +#define SPRN_SIER2     752
> +#define SPRN_SIER3     753
> +#define SPRN_USIER2    736
> +#define SPRN_USIER3    737
>  #define SPRN_SIAR      796
>  #define SPRN_SDAR      797
>  #define SPRN_TACR      888
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 571b325..46b4ebc 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -622,8 +622,10 @@ void ppc_enable_pmcs(void)
>  SYSFS_PMCSETUP(pmc8, SPRN_PMC8);
>
>  SYSFS_PMCSETUP(mmcra, SPRN_MMCRA);
> +SYSFS_PMCSETUP(mmcr3, SPRN_MMCR3);
>
>  static DEVICE_ATTR(mmcra, 0600, show_mmcra, store_mmcra);
> +static DEVICE_ATTR(mmcr3, 0600, show_mmcr3, store_mmcr3);
>  #endif /* HAS_PPC_PMC56 */
>
>
> @@ -886,6 +888,9 @@ static int register_cpu_online(unsigned int cpu)
>  #ifdef CONFIG_PMU_SYSFS
>         if (cpu_has_feature(CPU_FTR_MMCRA))
>                 device_create_file(s, &dev_attr_mmcra);
> +
> +       if (cpu_has_feature(CPU_FTR_ARCH_31))
> +               device_create_file(s, &dev_attr_mmcr3);
>  #endif /* CONFIG_PMU_SYSFS */
>
>         if (cpu_has_feature(CPU_FTR_PURR)) {
> @@ -980,6 +985,9 @@ static int unregister_cpu_online(unsigned int cpu)
>  #ifdef CONFIG_PMU_SYSFS
>         if (cpu_has_feature(CPU_FTR_MMCRA))
>                 device_remove_file(s, &dev_attr_mmcra);
> +
> +       if (cpu_has_feature(CPU_FTR_ARCH_31))
> +               device_remove_file(s, &dev_attr_mmcr3);
>  #endif /* CONFIG_PMU_SYSFS */
>
>         if (cpu_has_feature(CPU_FTR_PURR)) {
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index f4d07b5..ca32fc0 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -72,6 +72,11 @@ struct cpu_hw_events {
>  /*
>   * 32-bit doesn't have MMCRA but does have an MMCR2,
>   * and a few other names are different.
> + * Also 32-bit doesn't have MMCR3, SIER2 and SIER3.
> + * Define them as zero knowing that any code path accessing
> + * these registers (via mtspr/mfspr) are done under ppmu flag
> + * check for PPMU_ARCH_310S and we will not enter that code path
> + * for 32-bit.
>   */
>  #ifdef CONFIG_PPC32
>
> @@ -85,6 +90,9 @@ struct cpu_hw_events {
>  #define MMCR0_PMCC_U6          0
>
>  #define SPRN_MMCRA             SPRN_MMCR2
> +#define SPRN_MMCR3             0
> +#define SPRN_SIER2             0
> +#define SPRN_SIER3             0
>  #define MMCRA_SAMPLE_ENABLE    0
>
>  static inline unsigned long perf_ip_adjust(struct pt_regs *regs)
> @@ -581,6 +589,11 @@ static void ebb_switch_out(unsigned long mmcr0)
>         current->thread.sdar  = mfspr(SPRN_SDAR);
>         current->thread.mmcr0 = mmcr0 & MMCR0_USER_MASK;
>         current->thread.mmcr2 = mfspr(SPRN_MMCR2) & MMCR2_USER_MASK;
> +       if (ppmu->flags & PPMU_ARCH_310S) {
> +               current->thread.mmcr3 = mfspr(SPRN_MMCR3);
Like MMCR0_USER_MASK and MMCR2_USER_MASK do we need a MMCR3_USER_MASK
here, or is there no need?
> +               current->thread.sier2 = mfspr(SPRN_SIER2);
> +               current->thread.sier3 = mfspr(SPRN_SIER3);
> +       }
>  }
>
>  static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)
> @@ -620,6 +633,12 @@ static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)
>          * instead manage the MMCR2 entirely by itself.
>          */
>         mtspr(SPRN_MMCR2, cpuhw->mmcr.mmcr2 | current->thread.mmcr2);
> +
> +       if (ppmu->flags & PPMU_ARCH_310S) {
> +               mtspr(SPRN_MMCR3, current->thread.mmcr3);
> +               mtspr(SPRN_SIER2, current->thread.sier2);
> +               mtspr(SPRN_SIER3, current->thread.sier3);
> +       }
>  out:
>         return mmcr0;
>  }
> @@ -840,6 +859,11 @@ void perf_event_print_debug(void)
>                 pr_info("EBBRR: %016lx BESCR: %016lx\n",
>                         mfspr(SPRN_EBBRR), mfspr(SPRN_BESCR));
>         }
> +
> +       if (ppmu->flags & PPMU_ARCH_310S) {
> +               pr_info("MMCR3: %016lx SIER2: %016lx SIER3: %016lx\n",
> +                       mfspr(SPRN_MMCR3), mfspr(SPRN_SIER2), mfspr(SPRN_SIER3));
> +       }
>  #endif
>         pr_info("SIAR:  %016lx SDAR:  %016lx SIER:  %016lx\n",
>                 mfspr(SPRN_SIAR), sdar, sier);
> @@ -1305,6 +1329,8 @@ static void power_pmu_enable(struct pmu *pmu)
>         if (!cpuhw->n_added) {
>                 mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
>                 mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
> +               if (ppmu->flags & PPMU_ARCH_310S)
> +                       mtspr(SPRN_MMCR3, cpuhw->mmcr.mmcr3);
>                 goto out_enable;
>         }
>
> @@ -1348,6 +1374,9 @@ static void power_pmu_enable(struct pmu *pmu)
>         if (ppmu->flags & PPMU_ARCH_207S)
>                 mtspr(SPRN_MMCR2, cpuhw->mmcr.mmcr2);
>
> +       if (ppmu->flags & PPMU_ARCH_310S)
> +               mtspr(SPRN_MMCR3, cpuhw->mmcr.mmcr3);
> +
>         /*
>          * Read off any pre-existing events that need to move
>          * to another PMC.
> --
> 1.8.3.1
>
