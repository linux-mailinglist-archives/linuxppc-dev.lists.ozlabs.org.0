Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 131E1216731
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 09:19:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1DMj1sffzDqlp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 17:19:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1DKv6Nb3zDqMX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 17:17:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=ATtpGAI3; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4B1DKv4lJpz9sRR;
 Tue,  7 Jul 2020 17:17:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1594106275;
 bh=ppPmp461quiSBWdVBeXemRdc09NxP6V73YTS+1D9dBU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ATtpGAI3/RM4NFHvdl9n6Oxe+1Fho9xBFuRwEGZlpRH/a4RVRZitC69Zt3AaLqGOo
 Wu2o/53UwQ3GTB0r546ZW/IZwa459SmqVkAXDzjnYe+ihCIoiPlyfyL+XyvJW7/fk4
 rXhCkkEGKPt2aLAovWBHhX4Hpehd9zb06dSewJbvmQ9Z19T64csjG61YXD9aBFkwlZ
 CiebXLGdRDxSlip+gvBAcuwtgb2gha/cCzkS0Dz8MyVf7T87xfIhxM+2C7j3XgemlS
 5DKCbBsBzRZzbx1aNA5cUfOlEZgW3WD2ICHSwwpyyE3GXaMqXsvd9uEQeximDxh64g
 P9GJcXeNHzAHg==
Received: by neuling.org (Postfix, from userid 1000)
 id 85B8D2C0672; Tue,  7 Jul 2020 17:17:55 +1000 (AEST)
Message-ID: <0cf26e42a3b190d5ea69d1ba61ae71bcaeee1973.camel@neuling.org>
Subject: Re: [PATCH v2 07/10] powerpc/perf: support BHRB disable bit and new
 filtering modes
From: Michael Neuling <mikey@neuling.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
Date: Tue, 07 Jul 2020 17:17:55 +1000
In-Reply-To: <1593595262-1433-8-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-8-git-send-email-atrajeev@linux.vnet.ibm.com>
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
Cc: Vaidyanathan Srinivasan <svaidyan@in.ibm.com>, ego <ego@linux.vnet.ibm.com>,
 maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-07-01 at 05:20 -0400, Athira Rajeev wrote:
> PowerISA v3.1 has few updates for the Branch History Rolling Buffer(BHRB)=
.
> First is the addition of BHRB disable bit and second new filtering
> modes for BHRB.
>=20
> BHRB disable is controlled via Monitor Mode Control Register A (MMCRA)
> bit 26, namely "BHRB Recording Disable (BHRBRD)". This field controls
> whether BHRB entries are written when BHRB recording is enabled by other
> bits. Patch implements support for this BHRB disable bit.

Probably good to note here that this is backwards compatible. So if you hav=
e a
kernel that doesn't know about this bit, it'll clear it and hence you still=
 get
BHRB.=20

You should also note why you'd want to do disable this (ie. the core will r=
un
faster).

> Secondly PowerISA v3.1 introduce filtering support for
> PERF_SAMPLE_BRANCH_IND_CALL/COND. The patch adds BHRB filter support
> for "ind_call" and "cond" in power10_bhrb_filter_map().
>=20
> 'commit bb19af816025 ("powerpc/perf: Prevent kernel address leak to users=
pace
> via BHRB buffer")'
> added a check in bhrb_read() to filter the kernel address from BHRB buffe=
r.
> Patch here modified
> it to avoid that check for PowerISA v3.1 based processors, since PowerISA=
 v3.1
> allows
> only MSR[PR]=3D1 address to be written to BHRB buffer.
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  arch/powerpc/perf/core-book3s.c       | 27 +++++++++++++++++++++------
>  arch/powerpc/perf/isa207-common.c     | 13 +++++++++++++
>  arch/powerpc/perf/power10-pmu.c       | 13 +++++++++++--
>  arch/powerpc/platforms/powernv/idle.c | 14 ++++++++++++++

This touches the idle code so we should get those guys on CC (adding Vaidy =
and
Ego).

>  4 files changed, 59 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-boo=
k3s.c
> index fad5159..9709606 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -466,9 +466,13 @@ static void power_pmu_bhrb_read(struct perf_event *e=
vent,
> struct cpu_hw_events *
>  			 * addresses at this point. Check the privileges before
>  			 * exporting it to userspace (avoid exposure of regions
>  			 * where we could have speculative execution)
> +			 * Incase of ISA 310, BHRB will capture only user-space
> +			 * address,hence include a check before filtering code
>  			 */
> -			if (is_kernel_addr(addr) && perf_allow_kernel(&event-
> >attr) !=3D 0)
> -				continue;
> +			if (!(ppmu->flags & PPMU_ARCH_310S))
> +				if (is_kernel_addr(addr) &&
> +				perf_allow_kernel(&event->attr) !=3D 0)
> +					continue;
> =20
>  			/* Branches are read most recent first (ie. mfbhrb 0 is
>  			 * the most recent branch).
> @@ -1212,7 +1216,7 @@ static void write_mmcr0(struct cpu_hw_events *cpuhw=
,
> unsigned long mmcr0)
>  static void power_pmu_disable(struct pmu *pmu)
>  {
>  	struct cpu_hw_events *cpuhw;
> -	unsigned long flags, mmcr0, val;
> +	unsigned long flags, mmcr0, val, mmcra =3D 0;
> =20
>  	if (!ppmu)
>  		return;
> @@ -1245,12 +1249,23 @@ static void power_pmu_disable(struct pmu *pmu)
>  		mb();
>  		isync();
> =20
> +		val =3D mmcra =3D cpuhw->mmcr[2];
> +
>  		/*
>  		 * Disable instruction sampling if it was enabled
>  		 */
> -		if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE) {
> -			mtspr(SPRN_MMCRA,
> -			      cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
> +		if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE)
> +			mmcra =3D cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE;
> +
> +		/* Disable BHRB via mmcra [:26] for p10 if needed */
> +		if (!(cpuhw->mmcr[2] & MMCRA_BHRB_DISABLE))
> +			mmcra |=3D MMCRA_BHRB_DISABLE;
> +
> +		/* Write SPRN_MMCRA if mmcra has either disabled
> +		 * instruction sampling or BHRB
> +		 */
> +		if (val !=3D mmcra) {
> +			mtspr(SPRN_MMCRA, mmcra);
>  			mb();
>  			isync();
>  		}
> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207=
-
> common.c
> index 7d4839e..463d925 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -404,6 +404,12 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
> =20
>  	mmcra =3D mmcr1 =3D mmcr2 =3D mmcr3 =3D 0;
> =20
> +	/* Disable bhrb unless explicitly requested
> +	 * by setting MMCRA [:26] bit.
> +	 */
> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
> +		mmcra |=3D MMCRA_BHRB_DISABLE;
> +
>  	/* Second pass: assign PMCs, set all MMCR1 fields */
>  	for (i =3D 0; i < n_ev; ++i) {
>  		pmc     =3D (event[i] >> EVENT_PMC_SHIFT) & EVENT_PMC_MASK;
> @@ -475,10 +481,17 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
>  		}
> =20
>  		if (event[i] & EVENT_WANTS_BHRB) {
> +			/* set MMCRA[:26] to 0 for Power10 to enable BHRB */
> +			if (cpu_has_feature(CPU_FTR_ARCH_31))
> +				mmcra &=3D ~MMCRA_BHRB_DISABLE;
>  			val =3D (event[i] >> EVENT_IFM_SHIFT) & EVENT_IFM_MASK;
>  			mmcra |=3D val << MMCRA_IFM_SHIFT;
>  		}
> =20
> +		/* set MMCRA[:26] to 0 if there is user request for BHRB */
> +		if (cpu_has_feature(CPU_FTR_ARCH_31) &&
> has_branch_stack(pevents[i]))
> +			mmcra &=3D ~MMCRA_BHRB_DISABLE;
> +
>  		if (pevents[i]->attr.exclude_user)
>  			mmcr2 |=3D MMCR2_FCP(pmc);
> =20
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-=
pmu.c
> index d64d69d..07fb919 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -82,6 +82,8 @@
> =20
>  /* MMCRA IFM bits - POWER10 */
>  #define POWER10_MMCRA_IFM1		0x0000000040000000UL
> +#define POWER10_MMCRA_IFM2		0x0000000080000000UL
> +#define POWER10_MMCRA_IFM3		0x00000000C0000000UL
>  #define POWER10_MMCRA_BHRB_MASK		0x00000000C0000000UL
> =20
>  /* Table of alternatives, sorted by column 0 */
> @@ -233,8 +235,15 @@ static u64 power10_bhrb_filter_map(u64
> branch_sample_type)
>  	if (branch_sample_type & PERF_SAMPLE_BRANCH_ANY_RETURN)
>  		return -1;
> =20
> -	if (branch_sample_type & PERF_SAMPLE_BRANCH_IND_CALL)
> -		return -1;
> +	if (branch_sample_type & PERF_SAMPLE_BRANCH_IND_CALL) {
> +		pmu_bhrb_filter |=3D POWER10_MMCRA_IFM2;
> +		return pmu_bhrb_filter;
> +	}
> +
> +	if (branch_sample_type & PERF_SAMPLE_BRANCH_COND) {
> +		pmu_bhrb_filter |=3D POWER10_MMCRA_IFM3;
> +		return pmu_bhrb_filter;
> +	}
> =20
>  	if (branch_sample_type & PERF_SAMPLE_BRANCH_CALL)
>  		return -1;
> diff --git a/arch/powerpc/platforms/powernv/idle.c
> b/arch/powerpc/platforms/powernv/idle.c
> index 2dd4673..7db99c7 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -611,6 +611,7 @@ static unsigned long power9_idle_stop(unsigned long p=
sscr,
> bool mmu_on)
>  	unsigned long srr1;
>  	unsigned long pls;
>  	unsigned long mmcr0 =3D 0;
> +	unsigned long mmcra_bhrb =3D 0;
>  	struct p9_sprs sprs =3D {}; /* avoid false used-uninitialised */
>  	bool sprs_saved =3D false;
> =20
> @@ -657,6 +658,15 @@ static unsigned long power9_idle_stop(unsigned long
> psscr, bool mmu_on)
>  		  */
>  		mmcr0		=3D mfspr(SPRN_MMCR0);
>  	}
> +
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +		/* POWER10 uses MMCRA[:26] as BHRB disable bit
> +		 * to disable BHRB logic when not used. Hence Save and
> +		 * restore MMCRA after a state-loss idle.
> +		 */
> +		mmcra_bhrb		=3D mfspr(SPRN_MMCRA);


Why is the bhrb bit of mmcra special here?

> +	}
> +
>  	if ((psscr & PSSCR_RL_MASK) >=3D pnv_first_spr_loss_level) {
>  		sprs.lpcr	=3D mfspr(SPRN_LPCR);
>  		sprs.hfscr	=3D mfspr(SPRN_HFSCR);
> @@ -721,6 +731,10 @@ static unsigned long power9_idle_stop(unsigned long
> psscr, bool mmu_on)
>  			mtspr(SPRN_MMCR0, mmcr0);
>  		}
> =20
> +		/* Reload MMCRA to restore BHRB disable bit for POWER10 */
> +		if (cpu_has_feature(CPU_FTR_ARCH_31))
> +			mtspr(SPRN_MMCRA, mmcra_bhrb);
> +
>  		/*
>  		 * DD2.2 and earlier need to set then clear bit 60 in MMCRA
>  		 * to ensure the PMU starts running.

