Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 764252296AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 12:55:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBXRw6llhzDr37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 20:55:24 +1000 (AEST)
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
 header.s=20161025 header.b=mU7EvmGD; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBXLp5qLvzDr5j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 20:50:58 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id 5so1396859oty.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 03:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HPDKDuuyjQV+L83qxsRs2j2r4Bd7vA94jp4URGDWu4Y=;
 b=mU7EvmGD8NaC/WxKLxCBF9L5Wn32NNHaquGqwWvUQ2Ipwh3lZFTk/BOFjB2AEeC5no
 jJKzzLKroTcdmOzNKXpROsK7ykMscs5qPJBqqfhq2fFwcW0koFg7UCU49MWQeHz/dGIO
 WsA/sZ4IjbjU7lml4RkVO8K9jWPmUujgLyNyOdKPV0erTkiAUZvOFi0l1VO3ce7Yr4R5
 3iZ5LFk0VRmtWW6jk1/uxIiM5hkCtd+KDYwS3aEDHhj2Jeqexu0vpsf8gVLyp9sLvfLR
 VdPHdOIUoUcZGiLwt39EbZfDWx/72WkheWwTkux2Jj1rd5DSceLYeQ0xEM8FFqbw90oi
 /lVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HPDKDuuyjQV+L83qxsRs2j2r4Bd7vA94jp4URGDWu4Y=;
 b=s9W4Zv80VyTsy7y+CRNCaoIdb0qNVDxjbyH3wi6IgI07Wug/zOvGM95qFlJc509D8S
 36mn+JLGIkb/uaSSih5aL3j5TI0P/U2myL5r1kaibx38CUGMUm4QNbgjEpZB0hUPa259
 hqJHwm2lckQY9z19bDUB6Mo+xAEGIsmyCNLChBEdsLUzpi9hwjOVXGg00g18jhZEb1Fa
 +T/+fggEkzqfaTMW2ICLUb7bssbqZr8WBCfafNHjBBXRrUTMgbTtiPgi2s+mtecoBd/7
 Kg0Gez5YaviPRVSTe7LbDd1SmRlVCt9PPMdR08V8o9KOkf5awnTCRG76/rR3bHCuzA8o
 5YUw==
X-Gm-Message-State: AOAM53058zqBBy91oUMbYo3gzOMjMxjQJIp2SOvqjR8idBEY2euyG26E
 J5ESttvAR+7yUdfSBxZJVcRaKuWrXHvAXf6VQ5c=
X-Google-Smtp-Source: ABdhPJyrjEgChDABzeBhizt53D7WFa2C+14B6jlaOlTS/PyAebeN5XITrey22WkeFKRvK2pBbm1TaYTScMuKGwhqyKI=
X-Received: by 2002:a9d:2041:: with SMTP id n59mr29562720ota.28.1595415055176; 
 Wed, 22 Jul 2020 03:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-8-git-send-email-atrajeev@linux.vnet.ibm.com>
 <CACzsE9oBw1ZrJLqOAg1QqPrQgSoVbEdPh_ax7mU_kcWNyfyAcg@mail.gmail.com>
 <9A4E06A2-5686-4C85-B2F7-0904F195B58A@linux.vnet.ibm.com>
In-Reply-To: <9A4E06A2-5686-4C85-B2F7-0904F195B58A@linux.vnet.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 22 Jul 2020 20:49:57 +1000
Message-ID: <CACzsE9p-mNGptKi_+RSOOhvmW5gfLcKEbtoS6ah_5ZmVCThfpQ@mail.gmail.com>
Subject: Re: [v3 07/15] powerpc/perf: Add power10_feat to dt_cpu_ftrs
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 22, 2020 at 5:55 PM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> On 22-Jul-2020, at 10:11 AM, Jordan Niethe <jniethe5@gmail.com> wrote:
>
> On Sat, Jul 18, 2020 at 1:13 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>
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
> arch/powerpc/include/asm/reg.h        |  3 +++
> arch/powerpc/kernel/cpu_setup_power.S |  8 ++++++++
> arch/powerpc/kernel/dt_cpu_ftrs.c     | 26 ++++++++++++++++++++++++++
> 3 files changed, 37 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index 21a1b2d..900ada1 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -1068,6 +1068,9 @@
> #define MMCR0_PMC2_LOADMISSTIME        0x5
> #endif
>
> +/* BHRB disable bit for PowerISA v3.10 */
> +#define MMCRA_BHRB_DISABLE     0x0000002000000000
>
> Shouldn't this go under SPRN_MMCRA with the other MMCRA_*.
>
>
>
> Hi Jordan
>
> Ok, the definition of MMCRA is under #ifdef for 64 bit .  if I move defin=
ition of MMCRA_BHRB_DISABLE along with other SPR's, I also
> need to define this for 32-bit to satisfy core-book3s to compile as below=
:
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index 900ada10762c..7e271657b412 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -888,6 +888,8 @@
>  #define   MMCRA_SLOT   0x07000000UL /* SLOT bits (37-39) */
>  #define   MMCRA_SLOT_SHIFT     24
>  #define   MMCRA_SAMPLE_ENABLE 0x00000001UL /* enable sampling */
> +/* BHRB disable bit for PowerISA v3.10 */
> +#define   MMCRA_BHRB_DISABLE  0x0000002000000000
>  #define   POWER6_MMCRA_SDSYNC 0x0000080000000000ULL    /* SDAR/SIAR sync=
ed */
>  #define   POWER6_MMCRA_SIHV   0x0000040000000000ULL
>  #define   POWER6_MMCRA_SIPR   0x0000020000000000ULL
> @@ -1068,9 +1070,6 @@
>  #define MMCR0_PMC2_LOADMISSTIME        0x5
>  #endif
>
>
>
> -/* BHRB disable bit for PowerISA v3.10 */
> -#define MMCRA_BHRB_DISABLE     0x0000002000000000
> -
>  /*
>   * SPRG usage:
>   *
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-boo=
k3s.c
> index 36baae666387..88068f20827c 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -94,6 +94,7 @@ static unsigned int freeze_events_kernel =3D MMCR0_FCS;
>  #define SPRN_SIER2             0
>  #define SPRN_SIER3             0
>  #define MMCRA_SAMPLE_ENABLE    0
> +#define MMCRA_BHRB_DISABLE     0
>
>
>
>  static inline unsigned long perf_ip_adjust(struct pt_regs *regs)
>  {
>
>
>
> +
> /*
>  * SPRG usage:
>  *
> diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/=
cpu_setup_power.S
> index efdcfa7..b8e0d1e 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.S
> +++ b/arch/powerpc/kernel/cpu_setup_power.S
> @@ -94,6 +94,7 @@ _GLOBAL(__restore_cpu_power8)
> _GLOBAL(__setup_cpu_power10)
>        mflr    r11
>        bl      __init_FSCR_power10
> +       bl      __init_PMU_ISA31
>
> So we set MMCRA here but then aren't we still going to call __init_PMU
> which will overwrite that?
> Would this setting MMCRA also need to be handled in __restore_cpu_power10=
?
>
>
> Thanks for this nice catch !  When I rebased code initial phase, we didn=
=E2=80=99t had power10 part filled in.
> It was a miss from my side in adding PMu init functions and thanks for po=
inting this out.
> Below patch will call __init_PMU functions in setup and restore. Please c=
heck if this looks good
>
> --
> diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/=
cpu_setup_power.S
> index efdcfa714106..e672a6c5fd7c 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.S
> +++ b/arch/powerpc/kernel/cpu_setup_power.S
> @@ -94,6 +94,9 @@ _GLOBAL(__restore_cpu_power8)
>  _GLOBAL(__setup_cpu_power10)
>   mflr r11
>   bl __init_FSCR_power10
> + bl __init_PMU
> + bl __init_PMU_ISA31
> + bl __init_PMU_HV
>   b 1f
>
>  _GLOBAL(__setup_cpu_power9)

Won't you also need to change where the label 1 is:
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -100,8 +100,8 @@ _GLOBAL(__setup_cpu_power10)
 _GLOBAL(__setup_cpu_power9)
        mflr    r11
        bl      __init_FSCR
-1:     bl      __init_PMU
-       bl      __init_hvmode_206
+       bl      __init_PMU
+1:     bl      __init_hvmode_206
        mtlr    r11
        beqlr
        li      r0,0

> @@ -124,6 +127,9 @@ _GLOBAL(__setup_cpu_power9)
>  _GLOBAL(__restore_cpu_power10)
>   mflr r11
>   bl __init_FSCR_power10
> + bl __init_PMU
> + bl __init_PMU_ISA31
> + bl __init_PMU_HV
>   b 1f
>
>  _GLOBAL(__restore_cpu_power9)
> @@ -233,3 +239,10 @@ __init_PMU_ISA207:
>   li r5,0
>   mtspr SPRN_MMCRS,r5
>   blr
> +
> +__init_PMU_ISA31:
> + li r5,0
> + mtspr SPRN_MMCR3,r5
> + LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
> + mtspr SPRN_MMCRA,r5
> + blr
>
> =E2=80=94
>
>        b       1f
>
> _GLOBAL(__setup_cpu_power9)
> @@ -233,3 +234,10 @@ __init_PMU_ISA207:
>        li      r5,0
>        mtspr   SPRN_MMCRS,r5
>        blr
> +
> +__init_PMU_ISA31:
> +       li      r5,0
> +       mtspr   SPRN_MMCR3,r5
> +       LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
> +       mtspr   SPRN_MMCRA,r5
> +       blr
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_c=
pu_ftrs.c
> index 3a40951..f482286 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -450,6 +450,31 @@ static int __init feat_enable_pmu_power9(struct dt_c=
pu_feature *f)
>        return 1;
> }
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
> +       init_pmu_registers =3D init_pmu_power10;
> +
> +       cur_cpu_spec->cpu_features |=3D CPU_FTR_MMCRA;
> +       cur_cpu_spec->cpu_user_features |=3D PPC_FEATURE_PSERIES_PERFMON_=
COMPAT;
> +
> +       cur_cpu_spec->num_pmcs          =3D 6;
> +       cur_cpu_spec->pmc_type          =3D PPC_PMC_IBM;
> +       cur_cpu_spec->oprofile_cpu_type =3D "ppc64/power10";
> +
> +       return 1;
> +}
> +
> static int __init feat_enable_tm(struct dt_cpu_feature *f)
> {
> #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> @@ -639,6 +664,7 @@ struct dt_cpu_feature_match {
>        {"pc-relative-addressing", feat_enable, 0},
>        {"machine-check-power9", feat_enable_mce_power9, 0},
>        {"performance-monitor-power9", feat_enable_pmu_power9, 0},
> +       {"performance-monitor-power10", feat_enable_pmu_power10, 0},
>        {"event-based-branch-v3", feat_enable, 0},
>        {"random-number-generator", feat_enable, 0},
>        {"system-call-vectored", feat_disable, 0},
> --
> 1.8.3.1
>
>
