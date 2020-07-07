Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ABA216652
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 08:23:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1C7S22xDzDqlh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:23:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1C5l361QzDqXb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 16:22:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=CgCzSAlq; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4B1C5l1bbCz9sRN;
 Tue,  7 Jul 2020 16:22:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1594102939;
 bh=Xx92tvALMyBxH70o/7GRbPXu/YZ2lUJ9v7ICl13VZ5k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=CgCzSAlq5U+LqmI9YqcktiaGG+nNY4z/iKXtCjAxUIIyZA27SxbtlmeZ7tdS8zrno
 vlJIBq965dP2EuJvJapoR+eJO40NI82Kfl+OB/sGcLP8xT7ab96lJ+pfchPOdoSEtg
 7fpcxgiF0zsonpqiuVEvYOSmq4pKYFtTmmtOzbj0tFyhzOuAXiPNvXnUhfaeE8TRTG
 u04mFv0cGTleyJ4mfh6FtwDcclOe8Fu+SQvQs3OEYcK0nlvdcHE9pieLHDmljZEpCr
 37Q97NVaO0wgV2CTiNvNfCEU0kDgpy6279/4bEV490VB4uBsPQnTiyiCwy2/s5n6Up
 NGE5UaLwnISdA==
Received: by neuling.org (Postfix, from userid 1000)
 id 166EA2C0672; Tue,  7 Jul 2020 16:22:19 +1000 (AEST)
Message-ID: <fbc244b88f9291e83b2eabedd73ec9672b1fa12d.camel@neuling.org>
Subject: Re: [PATCH v2 04/10] powerpc/perf: Add power10_feat to dt_cpu_ftrs
From: Michael Neuling <mikey@neuling.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
Date: Tue, 07 Jul 2020 16:22:18 +1000
In-Reply-To: <1593595262-1433-5-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-5-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-07-01 at 05:20 -0400, Athira Rajeev wrote:
> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>=20
> Add power10 feature function to dt_cpu_ftrs.c along
> with a power10 specific init() to initialize pmu sprs.

Can you say why you're doing this?

Can you add some text about what you're doing to the BHRB in this patch?

Mikey

>=20
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/reg.h        |  3 +++
>  arch/powerpc/kernel/cpu_setup_power.S |  7 +++++++
>  arch/powerpc/kernel/dt_cpu_ftrs.c     | 26 ++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index 21a1b2d..900ada1 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -1068,6 +1068,9 @@
>  #define MMCR0_PMC2_LOADMISSTIME	0x5
>  #endif
> =20
> +/* BHRB disable bit for PowerISA v3.10 */
> +#define MMCRA_BHRB_DISABLE	0x0000002000000000
> +
>  /*
>   * SPRG usage:
>   *
> diff --git a/arch/powerpc/kernel/cpu_setup_power.S
> b/arch/powerpc/kernel/cpu_setup_power.S
> index efdcfa7..e8b3370c 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.S
> +++ b/arch/powerpc/kernel/cpu_setup_power.S
> @@ -233,3 +233,10 @@ __init_PMU_ISA207:
>  	li	r5,0
>  	mtspr	SPRN_MMCRS,r5
>  	blr
> +
> +__init_PMU_ISA31:
> +	li	r5,0
> +	mtspr	SPRN_MMCR3,r5
> +	LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
> +	mtspr	SPRN_MMCRA,r5
> +	blr
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c
> b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index a0edeb3..14a513f 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -449,6 +449,31 @@ static int __init feat_enable_pmu_power9(struct
> dt_cpu_feature *f)
>  	return 1;
>  }
> =20
> +static void init_pmu_power10(void)
> +{
> +	init_pmu_power9();
> +
> +	mtspr(SPRN_MMCR3, 0);
> +	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
> +}
> +
> +static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
> +{
> +	hfscr_pmu_enable();
> +
> +	init_pmu_power10();
> +	init_pmu_registers =3D init_pmu_power10;
> +
> +	cur_cpu_spec->cpu_features |=3D CPU_FTR_MMCRA;
> +	cur_cpu_spec->cpu_user_features |=3D PPC_FEATURE_PSERIES_PERFMON_COMPAT=
;
> +
> +	cur_cpu_spec->num_pmcs          =3D 6;
> +	cur_cpu_spec->pmc_type          =3D PPC_PMC_IBM;
> +	cur_cpu_spec->oprofile_cpu_type =3D "ppc64/power10";
> +
> +	return 1;
> +}
> +
>  static int __init feat_enable_tm(struct dt_cpu_feature *f)
>  {
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> @@ -638,6 +663,7 @@ struct dt_cpu_feature_match {
>  	{"pc-relative-addressing", feat_enable, 0},
>  	{"machine-check-power9", feat_enable_mce_power9, 0},
>  	{"performance-monitor-power9", feat_enable_pmu_power9, 0},
> +	{"performance-monitor-power10", feat_enable_pmu_power10, 0},
>  	{"event-based-branch-v3", feat_enable, 0},
>  	{"random-number-generator", feat_enable, 0},
>  	{"system-call-vectored", feat_disable, 0},

