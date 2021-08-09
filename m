Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 848293E3E15
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 05:04:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gjgsr36Qyz30Qk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 13:04:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X+6uFVtl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X+6uFVtl; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GjgsJ1MfGz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Aug 2021 13:04:03 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17932mZU193763; Sun, 8 Aug 2021 23:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=GgaEkEd291gq2VzFR+oI0NNzDP7x3NB5ZaFbGx0gwyM=;
 b=X+6uFVtlZm1bmG5Q9uQyCQo0Joagn1BsMaXIklTfeJ2rbCsblcKEs2YATGGE279idUhZ
 gJkxmO0AOPLauLvv3xmcpr1TP0Bj7ohU2uQCvgxrKK9/PuNzQGuYHt5PfXamHtAUO6b0
 BzF31C/GML/jlGaE1p7FBKO4AAMKb+dXs/1nZu5frOymr0WjtfWwUcxkAHhGCIWiZW8b
 R0WtV2Co15qErOVyREaAf6CL/h3KqDCcchw2zkPIE2mM6u0k2dLIIeo5dVz+mZgx6itX
 JtUtBpPKiKTe+CfwHVzHDUsRSbn4QPoU/AWRZ8F28n5CGsZXfOx3kecvcJf1yJl/Gc3a +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa7fbj8ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Aug 2021 23:03:59 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17933w6Q196377;
 Sun, 8 Aug 2021 23:03:58 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa7fbj8dm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Aug 2021 23:03:58 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17933vqe029194;
 Mon, 9 Aug 2021 03:03:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3a9hehb4ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 03:03:56 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17930jbd51839418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 03:00:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6428211C04C;
 Mon,  9 Aug 2021 03:03:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBA1B11C05B;
 Mon,  9 Aug 2021 03:03:52 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.186.133])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  9 Aug 2021 03:03:52 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v1 17/55] KVM: PPC: Book3S HV P9: Implement PMU
 save/restore in C
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210726035036.739609-18-npiggin@gmail.com>
Date: Mon, 9 Aug 2021 08:33:50 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <1A47BBEF-FC8C-4C4D-8393-9DE66B7FF96C@linux.vnet.ibm.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-18-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SAWq3tfUP8aGrSHmSt8BRdrt8Gka5O8R
X-Proofpoint-GUID: e0DE7FmcgNQXRUNfhe0YlOSQTwec3GO0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_01:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090023
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 26-Jul-2021, at 9:19 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Implement the P9 path PMU save/restore code in C, and remove the
> POWER9/10 code from the P7/8 path assembly.
>=20
> -449 cycles (8533) POWER9 virt-mode NULL hcall
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> arch/powerpc/include/asm/asm-prototypes.h |   5 -
> arch/powerpc/kvm/book3s_hv.c              | 205 ++++++++++++++++++++--
> arch/powerpc/kvm/book3s_hv_interrupts.S   |  13 +-
> arch/powerpc/kvm/book3s_hv_rmhandlers.S   |  43 +----
> 4 files changed, 200 insertions(+), 66 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h =
b/arch/powerpc/include/asm/asm-prototypes.h
> index 222823861a67..41b8a1e1144a 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -141,11 +141,6 @@ static inline void kvmppc_restore_tm_hv(struct =
kvm_vcpu *vcpu, u64 msr,
> 					bool preserve_nv) { }
> #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
>=20
> -void kvmhv_save_host_pmu(void);
> -void kvmhv_load_host_pmu(void);
> -void kvmhv_save_guest_pmu(struct kvm_vcpu *vcpu, bool pmu_in_use);
> -void kvmhv_load_guest_pmu(struct kvm_vcpu *vcpu);
> -
> void kvmppc_p9_enter_guest(struct kvm_vcpu *vcpu);
>=20
> long kvmppc_h_set_dabr(struct kvm_vcpu *vcpu, unsigned long dabr);
> diff --git a/arch/powerpc/kvm/book3s_hv.c =
b/arch/powerpc/kvm/book3s_hv.c
> index 2eef708c4354..d20b579ddcdf 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3735,6 +3735,188 @@ static noinline void kvmppc_run_core(struct =
kvmppc_vcore *vc)
> 	trace_kvmppc_run_core(vc, 1);
> }
>=20
> +/*
> + * Privileged (non-hypervisor) host registers to save.
> + */
> +struct p9_host_os_sprs {
> +	unsigned long dscr;
> +	unsigned long tidr;
> +	unsigned long iamr;
> +	unsigned long amr;
> +	unsigned long fscr;
> +
> +	unsigned int pmc1;
> +	unsigned int pmc2;
> +	unsigned int pmc3;
> +	unsigned int pmc4;
> +	unsigned int pmc5;
> +	unsigned int pmc6;
> +	unsigned long mmcr0;
> +	unsigned long mmcr1;
> +	unsigned long mmcr2;
> +	unsigned long mmcr3;
> +	unsigned long mmcra;
> +	unsigned long siar;
> +	unsigned long sier1;
> +	unsigned long sier2;
> +	unsigned long sier3;
> +	unsigned long sdar;
> +};
> +
> +static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
> +{
> +	if (!(mmcr0 & MMCR0_FC))
> +		goto do_freeze;
> +	if (mmcra & MMCRA_SAMPLE_ENABLE)
> +		goto do_freeze;
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +		if (!(mmcr0 & MMCR0_PMCCEXT))
> +			goto do_freeze;
> +		if (!(mmcra & MMCRA_BHRB_DISABLE))
> +			goto do_freeze;
> +	}
> +	return;
> +
> +do_freeze:
> +	mmcr0 =3D MMCR0_FC;
> +	mmcra =3D 0;
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +		mmcr0 |=3D MMCR0_PMCCEXT;
> +		mmcra =3D MMCRA_BHRB_DISABLE;
> +	}
> +
> +	mtspr(SPRN_MMCR0, mmcr0);
> +	mtspr(SPRN_MMCRA, mmcra);
> +	isync();
> +}
> +
Hi Nick,

After feezing pmu, do we need to clear =E2=80=9Cpmcregs_in_use=E2=80=9D =
as well?
Also can=E2=80=99t we unconditionally do the MMCR0/MMCRA/ freeze =
settings in here ? do we need the if conditions for FC/PMCCEXT/BHRB ?

Thanks
Athira
> +static void save_p9_host_pmu(struct p9_host_os_sprs *host_os_sprs)
> +{
> +	if (ppc_get_pmu_inuse()) {
> +		/*
> +		 * It might be better to put PMU handling (at least for =
the
> +		 * host) in the perf subsystem because it knows more =
about what
> +		 * is being used.
> +		 */
> +
> +		/* POWER9, POWER10 do not implement HPMC or SPMC */
> +
> +		host_os_sprs->mmcr0 =3D mfspr(SPRN_MMCR0);
> +		host_os_sprs->mmcra =3D mfspr(SPRN_MMCRA);
> +
> +		freeze_pmu(host_os_sprs->mmcr0, host_os_sprs->mmcra);
> +
> +		host_os_sprs->pmc1 =3D mfspr(SPRN_PMC1);
> +		host_os_sprs->pmc2 =3D mfspr(SPRN_PMC2);
> +		host_os_sprs->pmc3 =3D mfspr(SPRN_PMC3);
> +		host_os_sprs->pmc4 =3D mfspr(SPRN_PMC4);
> +		host_os_sprs->pmc5 =3D mfspr(SPRN_PMC5);
> +		host_os_sprs->pmc6 =3D mfspr(SPRN_PMC6);
> +		host_os_sprs->mmcr1 =3D mfspr(SPRN_MMCR1);
> +		host_os_sprs->mmcr2 =3D mfspr(SPRN_MMCR2);
> +		host_os_sprs->sdar =3D mfspr(SPRN_SDAR);
> +		host_os_sprs->siar =3D mfspr(SPRN_SIAR);
> +		host_os_sprs->sier1 =3D mfspr(SPRN_SIER);
> +
> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +			host_os_sprs->mmcr3 =3D mfspr(SPRN_MMCR3);
> +			host_os_sprs->sier2 =3D mfspr(SPRN_SIER2);
> +			host_os_sprs->sier3 =3D mfspr(SPRN_SIER3);
> +		}
> +	}
> +}
> +
> +static void load_p9_guest_pmu(struct kvm_vcpu *vcpu)
> +{
> +	mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
> +	mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
> +	mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
> +	mtspr(SPRN_PMC4, vcpu->arch.pmc[3]);
> +	mtspr(SPRN_PMC5, vcpu->arch.pmc[4]);
> +	mtspr(SPRN_PMC6, vcpu->arch.pmc[5]);
> +	mtspr(SPRN_MMCR1, vcpu->arch.mmcr[1]);
> +	mtspr(SPRN_MMCR2, vcpu->arch.mmcr[2]);
> +	mtspr(SPRN_SDAR, vcpu->arch.sdar);
> +	mtspr(SPRN_SIAR, vcpu->arch.siar);
> +	mtspr(SPRN_SIER, vcpu->arch.sier[0]);
> +
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +		mtspr(SPRN_MMCR3, vcpu->arch.mmcr[3]);
> +		mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
> +		mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
> +	}
> +
> +	/* Set MMCRA then MMCR0 last */
> +	mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
> +	mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
> +	/* No isync necessary because we're starting counters */
> +}
> +
> +static void save_p9_guest_pmu(struct kvm_vcpu *vcpu)
> +{
> +	struct lppaca *lp;
> +	int save_pmu =3D 1;
> +
> +	lp =3D vcpu->arch.vpa.pinned_addr;
> +	if (lp)
> +		save_pmu =3D lp->pmcregs_in_use;
> +
> +	if (save_pmu) {
> +		vcpu->arch.mmcr[0] =3D mfspr(SPRN_MMCR0);
> +		vcpu->arch.mmcra =3D mfspr(SPRN_MMCRA);
> +
> +		freeze_pmu(vcpu->arch.mmcr[0], vcpu->arch.mmcra);
> +
> +		vcpu->arch.pmc[0] =3D mfspr(SPRN_PMC1);
> +		vcpu->arch.pmc[1] =3D mfspr(SPRN_PMC2);
> +		vcpu->arch.pmc[2] =3D mfspr(SPRN_PMC3);
> +		vcpu->arch.pmc[3] =3D mfspr(SPRN_PMC4);
> +		vcpu->arch.pmc[4] =3D mfspr(SPRN_PMC5);
> +		vcpu->arch.pmc[5] =3D mfspr(SPRN_PMC6);
> +		vcpu->arch.mmcr[1] =3D mfspr(SPRN_MMCR1);
> +		vcpu->arch.mmcr[2] =3D mfspr(SPRN_MMCR2);
> +		vcpu->arch.sdar =3D mfspr(SPRN_SDAR);
> +		vcpu->arch.siar =3D mfspr(SPRN_SIAR);
> +		vcpu->arch.sier[0] =3D mfspr(SPRN_SIER);
> +
> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +			vcpu->arch.mmcr[3] =3D mfspr(SPRN_MMCR3);
> +			vcpu->arch.sier[1] =3D mfspr(SPRN_SIER2);
> +			vcpu->arch.sier[2] =3D mfspr(SPRN_SIER3);
> +		}
> +	} else {
> +		freeze_pmu(mfspr(SPRN_MMCR0), mfspr(SPRN_MMCRA));
> +	}
> +}
> +
> +static void load_p9_host_pmu(struct p9_host_os_sprs *host_os_sprs)
> +{
> +	if (ppc_get_pmu_inuse()) {
> +		mtspr(SPRN_PMC1, host_os_sprs->pmc1);
> +		mtspr(SPRN_PMC2, host_os_sprs->pmc2);
> +		mtspr(SPRN_PMC3, host_os_sprs->pmc3);
> +		mtspr(SPRN_PMC4, host_os_sprs->pmc4);
> +		mtspr(SPRN_PMC5, host_os_sprs->pmc5);
> +		mtspr(SPRN_PMC6, host_os_sprs->pmc6);
> +		mtspr(SPRN_MMCR1, host_os_sprs->mmcr1);
> +		mtspr(SPRN_MMCR2, host_os_sprs->mmcr2);
> +		mtspr(SPRN_SDAR, host_os_sprs->sdar);
> +		mtspr(SPRN_SIAR, host_os_sprs->siar);
> +		mtspr(SPRN_SIER, host_os_sprs->sier1);
> +
> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +			mtspr(SPRN_MMCR3, host_os_sprs->mmcr3);
> +			mtspr(SPRN_SIER2, host_os_sprs->sier2);
> +			mtspr(SPRN_SIER3, host_os_sprs->sier3);
> +		}
> +
> +		/* Set MMCRA then MMCR0 last */
> +		mtspr(SPRN_MMCRA, host_os_sprs->mmcra);
> +		mtspr(SPRN_MMCR0, host_os_sprs->mmcr0);
> +		isync();
> +	}
> +}
> +
> static void load_spr_state(struct kvm_vcpu *vcpu)
> {
> 	mtspr(SPRN_DSCR, vcpu->arch.dscr);
> @@ -3777,17 +3959,6 @@ static void store_spr_state(struct kvm_vcpu =
*vcpu)
> 	vcpu->arch.dscr =3D mfspr(SPRN_DSCR);
> }
>=20
> -/*
> - * Privileged (non-hypervisor) host registers to save.
> - */
> -struct p9_host_os_sprs {
> -	unsigned long dscr;
> -	unsigned long tidr;
> -	unsigned long iamr;
> -	unsigned long amr;
> -	unsigned long fscr;
> -};
> -
> static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
> {
> 	host_os_sprs->dscr =3D mfspr(SPRN_DSCR);
> @@ -3835,7 +4006,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu =
*vcpu, u64 time_limit,
> 	struct p9_host_os_sprs host_os_sprs;
> 	s64 dec;
> 	u64 tb, next_timer;
> -	int trap, save_pmu;
> +	int trap;
>=20
> 	WARN_ON_ONCE(vcpu->arch.ceded);
>=20
> @@ -3848,7 +4019,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu =
*vcpu, u64 time_limit,
>=20
> 	save_p9_host_os_sprs(&host_os_sprs);
>=20
> -	kvmhv_save_host_pmu();		/* saves it to PACA kvm_hstate =
*/
> +	save_p9_host_pmu(&host_os_sprs);
>=20
> 	kvmppc_subcore_enter_guest();
>=20
> @@ -3878,7 +4049,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu =
*vcpu, u64 time_limit,
> 		barrier();
> 	}
> #endif
> -	kvmhv_load_guest_pmu(vcpu);
> +	load_p9_guest_pmu(vcpu);
>=20
> 	msr_check_and_set(MSR_FP | MSR_VEC | MSR_VSX);
> 	load_fp_state(&vcpu->arch.fp);
> @@ -4000,16 +4171,14 @@ static int kvmhv_p9_guest_entry(struct =
kvm_vcpu *vcpu, u64 time_limit,
> 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> 		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
>=20
> -	save_pmu =3D 1;
> 	if (vcpu->arch.vpa.pinned_addr) {
> 		struct lppaca *lp =3D vcpu->arch.vpa.pinned_addr;
> 		u32 yield_count =3D be32_to_cpu(lp->yield_count) + 1;
> 		lp->yield_count =3D cpu_to_be32(yield_count);
> 		vcpu->arch.vpa.dirty =3D 1;
> -		save_pmu =3D lp->pmcregs_in_use;
> 	}
>=20
> -	kvmhv_save_guest_pmu(vcpu, save_pmu);
> +	save_p9_guest_pmu(vcpu);
> #ifdef CONFIG_PPC_PSERIES
> 	if (kvmhv_on_pseries()) {
> 		barrier();
> @@ -4025,7 +4194,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu =
*vcpu, u64 time_limit,
>=20
> 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
>=20
> -	kvmhv_load_host_pmu();
> +	load_p9_host_pmu(&host_os_sprs);
>=20
> 	kvmppc_subcore_exit_guest();
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv_interrupts.S =
b/arch/powerpc/kvm/book3s_hv_interrupts.S
> index 4444f83cb133..59d89e4b154a 100644
> --- a/arch/powerpc/kvm/book3s_hv_interrupts.S
> +++ b/arch/powerpc/kvm/book3s_hv_interrupts.S
> @@ -104,7 +104,10 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
> 	mtlr	r0
> 	blr
>=20
> -_GLOBAL(kvmhv_save_host_pmu)
> +/*
> + * void kvmhv_save_host_pmu(void)
> + */
> +kvmhv_save_host_pmu:
> BEGIN_FTR_SECTION
> 	/* Work around P8 PMAE bug */
> 	li	r3, -1
> @@ -138,14 +141,6 @@ BEGIN_FTR_SECTION
> 	std	r8, HSTATE_MMCR2(r13)
> 	std	r9, HSTATE_SIER(r13)
> END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> -BEGIN_FTR_SECTION
> -	mfspr	r5, SPRN_MMCR3
> -	mfspr	r6, SPRN_SIER2
> -	mfspr	r7, SPRN_SIER3
> -	std	r5, HSTATE_MMCR3(r13)
> -	std	r6, HSTATE_SIER2(r13)
> -	std	r7, HSTATE_SIER3(r13)
> -END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
> 	mfspr	r3, SPRN_PMC1
> 	mfspr	r5, SPRN_PMC2
> 	mfspr	r6, SPRN_PMC3
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S =
b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index 9021052f1579..551ce223b40c 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -2738,10 +2738,11 @@ kvmppc_msr_interrupt:
> 	blr
>=20
> /*
> + * void kvmhv_load_guest_pmu(struct kvm_vcpu *vcpu)
> + *
>  * Load up guest PMU state.  R3 points to the vcpu struct.
>  */
> -_GLOBAL(kvmhv_load_guest_pmu)
> -EXPORT_SYMBOL_GPL(kvmhv_load_guest_pmu)
> +kvmhv_load_guest_pmu:
> 	mr	r4, r3
> 	mflr	r0
> 	li	r3, 1
> @@ -2775,27 +2776,17 @@ END_FTR_SECTION_IFSET(CPU_FTR_PMAO_BUG)
> 	mtspr	SPRN_MMCRA, r6
> 	mtspr	SPRN_SIAR, r7
> 	mtspr	SPRN_SDAR, r8
> -BEGIN_FTR_SECTION
> -	ld      r5, VCPU_MMCR + 24(r4)
> -	ld      r6, VCPU_SIER + 8(r4)
> -	ld      r7, VCPU_SIER + 16(r4)
> -	mtspr   SPRN_MMCR3, r5
> -	mtspr   SPRN_SIER2, r6
> -	mtspr   SPRN_SIER3, r7
> -END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
> BEGIN_FTR_SECTION
> 	ld	r5, VCPU_MMCR + 16(r4)
> 	ld	r6, VCPU_SIER(r4)
> 	mtspr	SPRN_MMCR2, r5
> 	mtspr	SPRN_SIER, r6
> -BEGIN_FTR_SECTION_NESTED(96)
> 	lwz	r7, VCPU_PMC + 24(r4)
> 	lwz	r8, VCPU_PMC + 28(r4)
> 	ld	r9, VCPU_MMCRS(r4)
> 	mtspr	SPRN_SPMC1, r7
> 	mtspr	SPRN_SPMC2, r8
> 	mtspr	SPRN_MMCRS, r9
> -END_FTR_SECTION_NESTED(CPU_FTR_ARCH_300, 0, 96)
> END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> 	mtspr	SPRN_MMCR0, r3
> 	isync
> @@ -2803,10 +2794,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> 	blr
>=20
> /*
> + * void kvmhv_load_host_pmu(void)
> + *
>  * Reload host PMU state saved in the PACA by kvmhv_save_host_pmu.
>  */
> -_GLOBAL(kvmhv_load_host_pmu)
> -EXPORT_SYMBOL_GPL(kvmhv_load_host_pmu)
> +kvmhv_load_host_pmu:
> 	mflr	r0
> 	lbz	r4, PACA_PMCINUSE(r13) /* is the host using the PMU? */
> 	cmpwi	r4, 0
> @@ -2844,25 +2836,18 @@ BEGIN_FTR_SECTION
> 	mtspr	SPRN_MMCR2, r8
> 	mtspr	SPRN_SIER, r9
> END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> -BEGIN_FTR_SECTION
> -	ld      r5, HSTATE_MMCR3(r13)
> -	ld      r6, HSTATE_SIER2(r13)
> -	ld      r7, HSTATE_SIER3(r13)
> -	mtspr   SPRN_MMCR3, r5
> -	mtspr   SPRN_SIER2, r6
> -	mtspr   SPRN_SIER3, r7
> -END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
> 	mtspr	SPRN_MMCR0, r3
> 	isync
> 	mtlr	r0
> 23:	blr
>=20
> /*
> + * void kvmhv_save_guest_pmu(struct kvm_vcpu *vcpu, bool pmu_in_use)
> + *
>  * Save guest PMU state into the vcpu struct.
>  * r3 =3D vcpu, r4 =3D full save flag (PMU in use flag set in VPA)
>  */
> -_GLOBAL(kvmhv_save_guest_pmu)
> -EXPORT_SYMBOL_GPL(kvmhv_save_guest_pmu)
> +kvmhv_save_guest_pmu:
> 	mr	r9, r3
> 	mr	r8, r4
> BEGIN_FTR_SECTION
> @@ -2911,14 +2896,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> BEGIN_FTR_SECTION
> 	std	r10, VCPU_MMCR + 16(r9)
> END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> -BEGIN_FTR_SECTION
> -	mfspr   r5, SPRN_MMCR3
> -	mfspr   r6, SPRN_SIER2
> -	mfspr   r7, SPRN_SIER3
> -	std     r5, VCPU_MMCR + 24(r9)
> -	std     r6, VCPU_SIER + 8(r9)
> -	std     r7, VCPU_SIER + 16(r9)
> -END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
> 	std	r7, VCPU_SIAR(r9)
> 	std	r8, VCPU_SDAR(r9)
> 	mfspr	r3, SPRN_PMC1
> @@ -2936,7 +2913,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
> BEGIN_FTR_SECTION
> 	mfspr	r5, SPRN_SIER
> 	std	r5, VCPU_SIER(r9)
> -BEGIN_FTR_SECTION_NESTED(96)
> 	mfspr	r6, SPRN_SPMC1
> 	mfspr	r7, SPRN_SPMC2
> 	mfspr	r8, SPRN_MMCRS
> @@ -2945,7 +2921,6 @@ BEGIN_FTR_SECTION_NESTED(96)
> 	std	r8, VCPU_MMCRS(r9)
> 	lis	r4, 0x8000
> 	mtspr	SPRN_MMCRS, r4
> -END_FTR_SECTION_NESTED(CPU_FTR_ARCH_300, 0, 96)
> END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> 22:	blr
>=20
> --=20
> 2.23.0
>=20

