Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3EC228F7C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:00:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBNZw1fBKzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 15:00:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VtZzRr7+; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBN9f4GnTzDqs1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:42:30 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id t18so863176otq.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GtofqkQ3XIJWTX5BE6tfZb4lMA7KmqIQCzAlx3ABX0M=;
 b=VtZzRr7+vBbhCeoJXyvXwOAsKy4ygVaSH1QnWwOVYpGmgP/DCQOrHkXiKVoYGY5lrI
 9sNOgw/3D/hgGKZSuyk4RuK6rG/YRe40dmLuz4huuLscaULAkFYKJeyIxzYy2hwxm6BB
 bVkxz7KtKGw/xfXa5Ztq39jXWsJHBjF4GbZFmjbJsSSSJJfYujDKaUHi7dl8hGAnBnr5
 tCD05I743cua1VaCW/k6v38ODJupmAWPbnLL7sux60ZIdgXp5Suy0zAyr6NZJOll8Xy+
 oHE2+4addVJD8Ijrf03ErqRCJyuy/D0R1FShQ5JLqqPr6kxEZIisG/r+c+2Dgkt5hCCn
 10aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GtofqkQ3XIJWTX5BE6tfZb4lMA7KmqIQCzAlx3ABX0M=;
 b=Lds2kHIxiTSTWGaL4FHZyrAAlmJ/OqjYv1R/cZUi2GL0j6tZo/FQmyNK9iB0UQZvIm
 UCNjz/3UVtYvSCCAiaB2cXzMRGM5QJ3t9o7/I6Maisan8G1cXKzA5V6uZt0BEbqMmzxP
 R/dQQT9Fgp6Elbwf5YKIxIG5y+UoYSIRxWgfO44ldzYmZGVmm054KXquP5843sIsvFhP
 t3gzbbLzXCRmuFKTU14z6LuWsrUD6yVQrZHueUFNPdA3d5bf/RQM4qtcPc2evequ/dFw
 kAMClMJ5F1a38Pwj147wRGYzpcN+/jDxKqyAXpzX3XXGQN8c1MsMivZFtdRZNtklSkFO
 rKkQ==
X-Gm-Message-State: AOAM5322y7sMgFa5c2zGF/mu2llDHml1IqHRQ/inAM7NDvQsDI6iXCJe
 YCuLosgCPJNvcKjnmivmRpuVN/XvrfSGD7yDYeE=
X-Google-Smtp-Source: ABdhPJyVDBS9hB7vq2K7civKPaRsjw0GL+OvOR5dsO1HwV67oYdMaz75KRUqg6pMAFC5rOCQrnG0Yj39sxLkMsJqxyU=
X-Received: by 2002:a9d:7f06:: with SMTP id j6mr5928964otq.51.1595392945793;
 Tue, 21 Jul 2020 21:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-8-git-send-email-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1594996707-3727-8-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 22 Jul 2020 14:41:40 +1000
Message-ID: <CACzsE9oBw1ZrJLqOAg1QqPrQgSoVbEdPh_ax7mU_kcWNyfyAcg@mail.gmail.com>
Subject: Re: [v3 07/15] powerpc/perf: Add power10_feat to dt_cpu_ftrs
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

On Sat, Jul 18, 2020 at 1:13 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>
> Add power10 feature function to dt_cpu_ftrs.c along
> with a power10 specific init() to initialize pmu sprs,
> sets the oprofile_cpu_type and cpu_features. This will
> enable performance monitoring unit(PMU) for Power10
> in CPU features with "performance-monitor-power10".
>
> For PowerISA v3.1, BHRB disable is controlled via Monitor Mode
> Control Register A (MMCRA) bit, namely "BHRB Recording Disable
> (BHRBRD)". This patch initializes MMCRA BHRBRD to disable BHRB
> feature at boot for power10.
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/reg.h        |  3 +++
>  arch/powerpc/kernel/cpu_setup_power.S |  8 ++++++++
>  arch/powerpc/kernel/dt_cpu_ftrs.c     | 26 ++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 21a1b2d..900ada1 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -1068,6 +1068,9 @@
>  #define MMCR0_PMC2_LOADMISSTIME        0x5
>  #endif
>
> +/* BHRB disable bit for PowerISA v3.10 */
> +#define MMCRA_BHRB_DISABLE     0x0000002000000000
Shouldn't this go under SPRN_MMCRA with the other MMCRA_*.
> +
>  /*
>   * SPRG usage:
>   *
> diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
> index efdcfa7..b8e0d1e 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.S
> +++ b/arch/powerpc/kernel/cpu_setup_power.S
> @@ -94,6 +94,7 @@ _GLOBAL(__restore_cpu_power8)
>  _GLOBAL(__setup_cpu_power10)
>         mflr    r11
>         bl      __init_FSCR_power10
> +       bl      __init_PMU_ISA31
So we set MMCRA here but then aren't we still going to call __init_PMU
which will overwrite that?
Would this setting MMCRA also need to be handled in __restore_cpu_power10?
>         b       1f
>
>  _GLOBAL(__setup_cpu_power9)
> @@ -233,3 +234,10 @@ __init_PMU_ISA207:
>         li      r5,0
>         mtspr   SPRN_MMCRS,r5
>         blr
> +
> +__init_PMU_ISA31:
> +       li      r5,0
> +       mtspr   SPRN_MMCR3,r5
> +       LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
> +       mtspr   SPRN_MMCRA,r5
> +       blr
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 3a40951..f482286 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -450,6 +450,31 @@ static int __init feat_enable_pmu_power9(struct dt_cpu_feature *f)
>         return 1;
>  }
>
> +static void init_pmu_power10(void)
> +{
> +       init_pmu_power9();
> +
> +       mtspr(SPRN_MMCR3, 0);
> +       mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
> +}
> +
> +static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
> +{
> +       hfscr_pmu_enable();
> +
> +       init_pmu_power10();
> +       init_pmu_registers = init_pmu_power10;
> +
> +       cur_cpu_spec->cpu_features |= CPU_FTR_MMCRA;
> +       cur_cpu_spec->cpu_user_features |= PPC_FEATURE_PSERIES_PERFMON_COMPAT;
> +
> +       cur_cpu_spec->num_pmcs          = 6;
> +       cur_cpu_spec->pmc_type          = PPC_PMC_IBM;
> +       cur_cpu_spec->oprofile_cpu_type = "ppc64/power10";
> +
> +       return 1;
> +}
> +
>  static int __init feat_enable_tm(struct dt_cpu_feature *f)
>  {
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> @@ -639,6 +664,7 @@ struct dt_cpu_feature_match {
>         {"pc-relative-addressing", feat_enable, 0},
>         {"machine-check-power9", feat_enable_mce_power9, 0},
>         {"performance-monitor-power9", feat_enable_pmu_power9, 0},
> +       {"performance-monitor-power10", feat_enable_pmu_power10, 0},
>         {"event-based-branch-v3", feat_enable, 0},
>         {"random-number-generator", feat_enable, 0},
>         {"system-call-vectored", feat_disable, 0},
> --
> 1.8.3.1
>
