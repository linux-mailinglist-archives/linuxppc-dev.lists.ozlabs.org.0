Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1103BF51A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 07:33:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GL4gv1Pywz3bl8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 15:32:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DTFVQZjE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DTFVQZjE; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GL4gK4Bqxz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 15:32:29 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16852n8X019428; Thu, 8 Jul 2021 01:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=lJF63fnrYznQN45+XY156x2hPv3VI5FP2mw62FhgqTE=;
 b=DTFVQZjEZY972Na7YDZQ2VsEhOtGF+4Y1gB4SBInz+HQOzlUgt/hbOSl9D0DwYz9l08K
 v3p94NRJwq0otaGDH6d4Gkevay58jkLV8EiDGkWW/1T4A8beR+B0pkAIEC/daqxB48Eq
 22HXmmkgR9G3z6B6xqIfyQ75V6JdXYQmGFMAEwgyARNIMIBKH/eEdyRLMzLrJMiF9KNg
 HhoHOKZDJiYuc5u8YmN+Q7aytxaHPqU2Tv5xWpDHQVzDbQsueQaG3ZWOesM8lTta7EEF
 wbA/ZpcVL3Ol67ifhP/LDiqxCbntMETwDs9fCxVu24AJlStDJXMrWyfvNCPeiLGEKV5s xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mn8gbvu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 01:32:26 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16853V2N021607;
 Thu, 8 Jul 2021 01:32:26 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mn8gbvtp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 01:32:26 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1685NUsb006215;
 Thu, 8 Jul 2021 05:32:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 39jfh8t1ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 05:32:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1685USXj23200218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 05:30:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD03DA405F;
 Thu,  8 Jul 2021 05:32:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A236A4060;
 Thu,  8 Jul 2021 05:32:20 +0000 (GMT)
Received: from [9.79.181.201] (unknown [9.79.181.201])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  8 Jul 2021 05:32:20 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Subject: Re: [RFC PATCH 27/43] KVM: PPC: Book3S HV P9: Move host OS
 save/restore functions to built-in
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210622105736.633352-28-npiggin@gmail.com>
Date: Thu, 8 Jul 2021 11:02:17 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <983C1FE6-79CB-4DBD-BD00-8CFDA3685FEB@linux.vnet.ibm.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-28-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bHEPA96qsibRYVmP71CsTWvh46Z4kq0Y
X-Proofpoint-GUID: kA6j3k1SptgpBCL0sqK1SvVnhTJ6gs-K
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_01:2021-07-06,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080025
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



> On 22-Jun-2021, at 4:27 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Move the P9 guest/host register switching functions to the built-in
> P9 entry code, and export it for nested to use as well.
>=20
> This allows more flexibility in scheduling these supervisor privileged
> SPR accesses with the HV privileged and PR SPR accesses in the low =
level
> entry code.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> arch/powerpc/kvm/book3s_hv.c          | 351 +-------------------------
> arch/powerpc/kvm/book3s_hv.h          |  39 +++
> arch/powerpc/kvm/book3s_hv_p9_entry.c | 332 ++++++++++++++++++++++++
> 3 files changed, 372 insertions(+), 350 deletions(-)
> create mode 100644 arch/powerpc/kvm/book3s_hv.h
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c =
b/arch/powerpc/kvm/book3s_hv.c
> index 35749b0b663f..a7660af22161 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -79,6 +79,7 @@
> #include <asm/dtl.h>
>=20
> #include "book3s.h"
> +#include "book3s_hv.h"
>=20
> #define CREATE_TRACE_POINTS
> #include "trace_hv.h"
> @@ -3675,356 +3676,6 @@ static noinline void kvmppc_run_core(struct =
kvmppc_vcore *vc)
> 	trace_kvmppc_run_core(vc, 1);
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
> -
> -	unsigned int pmc1;
> -	unsigned int pmc2;
> -	unsigned int pmc3;
> -	unsigned int pmc4;
> -	unsigned int pmc5;
> -	unsigned int pmc6;
> -	unsigned long mmcr0;
> -	unsigned long mmcr1;
> -	unsigned long mmcr2;
> -	unsigned long mmcr3;
> -	unsigned long mmcra;
> -	unsigned long siar;
> -	unsigned long sier1;
> -	unsigned long sier2;
> -	unsigned long sier3;
> -	unsigned long sdar;
> -};
> -
> -static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
> -{
> -	if (!(mmcr0 & MMCR0_FC))
> -		goto do_freeze;
> -	if (mmcra & MMCRA_SAMPLE_ENABLE)
> -		goto do_freeze;
> -	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> -		if (!(mmcr0 & MMCR0_PMCCEXT))
> -			goto do_freeze;
> -		if (!(mmcra & MMCRA_BHRB_DISABLE))
> -			goto do_freeze;
> -	}
> -	return;
> -
> -do_freeze:
> -	mmcr0 =3D MMCR0_FC;
> -	mmcra =3D 0;
> -	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> -		mmcr0 |=3D MMCR0_PMCCEXT;
> -		mmcra =3D MMCRA_BHRB_DISABLE;
> -	}
> -
> -	mtspr(SPRN_MMCR0, mmcr0);
> -	mtspr(SPRN_MMCRA, mmcra);
> -	isync();
> -}
> -
> -static void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
> -				struct p9_host_os_sprs *host_os_sprs)
> -{
> -	struct lppaca *lp;
> -	int load_pmu =3D 1;
> -
> -	lp =3D vcpu->arch.vpa.pinned_addr;
> -	if (lp)
> -		load_pmu =3D lp->pmcregs_in_use;
> -
> -	if (load_pmu)
> -	      vcpu->arch.hfscr |=3D HFSCR_PM;
> -
> -	/* Save host */
> -	if (ppc_get_pmu_inuse()) {
> -		/*
> -		 * It might be better to put PMU handling (at least for =
the
> -		 * host) in the perf subsystem because it knows more =
about what
> -		 * is being used.
> -		 */
> -
> -		/* POWER9, POWER10 do not implement HPMC or SPMC */
> -
> -		host_os_sprs->mmcr0 =3D mfspr(SPRN_MMCR0);
> -		host_os_sprs->mmcra =3D mfspr(SPRN_MMCRA);
> -
> -		freeze_pmu(host_os_sprs->mmcr0, host_os_sprs->mmcra);
> -
> -		host_os_sprs->pmc1 =3D mfspr(SPRN_PMC1);
> -		host_os_sprs->pmc2 =3D mfspr(SPRN_PMC2);
> -		host_os_sprs->pmc3 =3D mfspr(SPRN_PMC3);
> -		host_os_sprs->pmc4 =3D mfspr(SPRN_PMC4);
> -		host_os_sprs->pmc5 =3D mfspr(SPRN_PMC5);
> -		host_os_sprs->pmc6 =3D mfspr(SPRN_PMC6);
> -		host_os_sprs->mmcr1 =3D mfspr(SPRN_MMCR1);
> -		host_os_sprs->mmcr2 =3D mfspr(SPRN_MMCR2);
> -		host_os_sprs->sdar =3D mfspr(SPRN_SDAR);
> -		host_os_sprs->siar =3D mfspr(SPRN_SIAR);
> -		host_os_sprs->sier1 =3D mfspr(SPRN_SIER);
> -
> -		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> -			host_os_sprs->mmcr3 =3D mfspr(SPRN_MMCR3);
> -			host_os_sprs->sier2 =3D mfspr(SPRN_SIER2);
> -			host_os_sprs->sier3 =3D mfspr(SPRN_SIER3);
> -		}
> -	}
> -
> -#ifdef CONFIG_PPC_PSERIES
> -	if (kvmhv_on_pseries()) {
> -		if (vcpu->arch.vpa.pinned_addr) {
> -			struct lppaca *lp =3D =
vcpu->arch.vpa.pinned_addr;
> -			get_lppaca()->pmcregs_in_use =3D =
lp->pmcregs_in_use;
> -		} else {
> -			get_lppaca()->pmcregs_in_use =3D 1;
> -		}
> -	}
> -#endif
> -
> -	/* Load guest */
> -	if (vcpu->arch.hfscr & HFSCR_PM) {
> -		mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
> -		mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
> -		mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
> -		mtspr(SPRN_PMC4, vcpu->arch.pmc[3]);
> -		mtspr(SPRN_PMC5, vcpu->arch.pmc[4]);
> -		mtspr(SPRN_PMC6, vcpu->arch.pmc[5]);
> -		mtspr(SPRN_MMCR1, vcpu->arch.mmcr[1]);
> -		mtspr(SPRN_MMCR2, vcpu->arch.mmcr[2]);
> -		mtspr(SPRN_SDAR, vcpu->arch.sdar);
> -		mtspr(SPRN_SIAR, vcpu->arch.siar);
> -		mtspr(SPRN_SIER, vcpu->arch.sier[0]);
> -
> -		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> -			mtspr(SPRN_MMCR3, vcpu->arch.mmcr[4]);


Hi Nick,

Have a doubt here..
For MMCR3, it is  vcpu->arch.mmcr[3) ?

Thanks
Athira
> -			mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
> -			mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
> -		}
> -
> -		/* Set MMCRA then MMCR0 last */
> -		mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
> -		mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
> -		/* No isync necessary because we're starting counters */
> -	}
> -}
> -
> -static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
> -				struct p9_host_os_sprs *host_os_sprs)
> -{
> -	struct lppaca *lp;
> -	int save_pmu =3D 1;
> -
> -	lp =3D vcpu->arch.vpa.pinned_addr;
> -	if (lp)
> -		save_pmu =3D lp->pmcregs_in_use;
> -
> -	if (save_pmu) {
> -		vcpu->arch.mmcr[0] =3D mfspr(SPRN_MMCR0);
> -		vcpu->arch.mmcra =3D mfspr(SPRN_MMCRA);
> -
> -		freeze_pmu(vcpu->arch.mmcr[0], vcpu->arch.mmcra);
> -
> -		vcpu->arch.pmc[0] =3D mfspr(SPRN_PMC1);
> -		vcpu->arch.pmc[1] =3D mfspr(SPRN_PMC2);
> -		vcpu->arch.pmc[2] =3D mfspr(SPRN_PMC3);
> -		vcpu->arch.pmc[3] =3D mfspr(SPRN_PMC4);
> -		vcpu->arch.pmc[4] =3D mfspr(SPRN_PMC5);
> -		vcpu->arch.pmc[5] =3D mfspr(SPRN_PMC6);
> -		vcpu->arch.mmcr[1] =3D mfspr(SPRN_MMCR1);
> -		vcpu->arch.mmcr[2] =3D mfspr(SPRN_MMCR2);
> -		vcpu->arch.sdar =3D mfspr(SPRN_SDAR);
> -		vcpu->arch.siar =3D mfspr(SPRN_SIAR);
> -		vcpu->arch.sier[0] =3D mfspr(SPRN_SIER);
> -
> -		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> -			vcpu->arch.mmcr[3] =3D mfspr(SPRN_MMCR3);
> -			vcpu->arch.sier[1] =3D mfspr(SPRN_SIER2);
> -			vcpu->arch.sier[2] =3D mfspr(SPRN_SIER3);
> -		}
> -
> -	} else if (vcpu->arch.hfscr & HFSCR_PM) {
> -		/*
> -		 * The guest accessed PMC SPRs without specifying they =
should
> -		 * be preserved. Stop them from counting if the guest =
had
> -		 * started anything.
> -		 */
> -		freeze_pmu(mfspr(SPRN_MMCR0), mfspr(SPRN_MMCRA));
> -
> -		/*
> -		 * Demand-fault PMU register access in the guest.
> -		 *
> -		 * This is used to grab the guest's VPA pmcregs_in_use =
value
> -		 * and reflect it into the host's VPA in the case of a =
nested
> -		 * hypervisor.
> -		 *
> -		 * It also avoids having to zero-out SPRs after each =
guest
> -		 * exit to avoid side-channels when.
> -		 *
> -		 * This is cleared here when we exit the guest, so later =
HFSCR
> -		 * interrupt handling can add it back to run the guest =
with
> -		 * PM enabled next time.
> -		 */
> -		vcpu->arch.hfscr &=3D ~HFSCR_PM;
> -	} /* otherwise the PMU should still be frozen from guest entry =
*/
> -
> -#ifdef CONFIG_PPC_PSERIES
> -	if (kvmhv_on_pseries())
> -		get_lppaca()->pmcregs_in_use =3D ppc_get_pmu_inuse();
> -#endif
> -
> -	if (ppc_get_pmu_inuse()) {
> -		mtspr(SPRN_PMC1, host_os_sprs->pmc1);
> -		mtspr(SPRN_PMC2, host_os_sprs->pmc2);
> -		mtspr(SPRN_PMC3, host_os_sprs->pmc3);
> -		mtspr(SPRN_PMC4, host_os_sprs->pmc4);
> -		mtspr(SPRN_PMC5, host_os_sprs->pmc5);
> -		mtspr(SPRN_PMC6, host_os_sprs->pmc6);
> -		mtspr(SPRN_MMCR1, host_os_sprs->mmcr1);
> -		mtspr(SPRN_MMCR2, host_os_sprs->mmcr2);
> -		mtspr(SPRN_SDAR, host_os_sprs->sdar);
> -		mtspr(SPRN_SIAR, host_os_sprs->siar);
> -		mtspr(SPRN_SIER, host_os_sprs->sier1);
> -
> -		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> -			mtspr(SPRN_MMCR3, host_os_sprs->mmcr3);
> -			mtspr(SPRN_SIER2, host_os_sprs->sier2);
> -			mtspr(SPRN_SIER3, host_os_sprs->sier3);
> -		}
> -
> -		/* Set MMCRA then MMCR0 last */
> -		mtspr(SPRN_MMCRA, host_os_sprs->mmcra);
> -		mtspr(SPRN_MMCR0, host_os_sprs->mmcr0);
> -		isync();
> -	}
> -}
> -
> -static void load_spr_state(struct kvm_vcpu *vcpu,
> -				struct p9_host_os_sprs *host_os_sprs)
> -{
> -	mtspr(SPRN_TAR, vcpu->arch.tar);
> -	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
> -	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
> -	mtspr(SPRN_BESCR, vcpu->arch.bescr);
> -
> -	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> -		mtspr(SPRN_TIDR, vcpu->arch.tid);
> -	if (host_os_sprs->iamr !=3D vcpu->arch.iamr)
> -		mtspr(SPRN_IAMR, vcpu->arch.iamr);
> -	if (host_os_sprs->amr !=3D vcpu->arch.amr)
> -		mtspr(SPRN_AMR, vcpu->arch.amr);
> -	if (vcpu->arch.uamor !=3D 0)
> -		mtspr(SPRN_UAMOR, vcpu->arch.uamor);
> -	if (host_os_sprs->fscr !=3D vcpu->arch.fscr)
> -		mtspr(SPRN_FSCR, vcpu->arch.fscr);
> -	if (host_os_sprs->dscr !=3D vcpu->arch.dscr)
> -		mtspr(SPRN_DSCR, vcpu->arch.dscr);
> -	if (vcpu->arch.pspb !=3D 0)
> -		mtspr(SPRN_PSPB, vcpu->arch.pspb);
> -
> -	/*
> -	 * DAR, DSISR, and for nested HV, SPRGs must be set with MSR[RI]
> -	 * clear (or hstate set appropriately to catch those registers
> -	 * being clobbered if we take a MCE or SRESET), so those are =
done
> -	 * later.
> -	 */
> -
> -	if (!(vcpu->arch.ctrl & 1))
> -		mtspr(SPRN_CTRLT, 0);
> -}
> -
> -static void store_spr_state(struct kvm_vcpu *vcpu)
> -{
> -	vcpu->arch.tar =3D mfspr(SPRN_TAR);
> -	vcpu->arch.ebbhr =3D mfspr(SPRN_EBBHR);
> -	vcpu->arch.ebbrr =3D mfspr(SPRN_EBBRR);
> -	vcpu->arch.bescr =3D mfspr(SPRN_BESCR);
> -
> -	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> -		vcpu->arch.tid =3D mfspr(SPRN_TIDR);
> -	vcpu->arch.iamr =3D mfspr(SPRN_IAMR);
> -	vcpu->arch.amr =3D mfspr(SPRN_AMR);
> -	vcpu->arch.uamor =3D mfspr(SPRN_UAMOR);
> -	vcpu->arch.fscr =3D mfspr(SPRN_FSCR);
> -	vcpu->arch.dscr =3D mfspr(SPRN_DSCR);
> -	vcpu->arch.pspb =3D mfspr(SPRN_PSPB);
> -
> -	vcpu->arch.ctrl =3D mfspr(SPRN_CTRLF);
> -}
> -
> -static void load_vcpu_state(struct kvm_vcpu *vcpu,
> -			   struct p9_host_os_sprs *host_os_sprs)
> -{
> -	if (cpu_has_feature(CPU_FTR_TM) ||
> -	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> -		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
> -
> -	load_spr_state(vcpu, host_os_sprs);
> -
> -	load_fp_state(&vcpu->arch.fp);
> -#ifdef CONFIG_ALTIVEC
> -	load_vr_state(&vcpu->arch.vr);
> -#endif
> -	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
> -}
> -
> -static void store_vcpu_state(struct kvm_vcpu *vcpu)
> -{
> -	store_spr_state(vcpu);
> -
> -	store_fp_state(&vcpu->arch.fp);
> -#ifdef CONFIG_ALTIVEC
> -	store_vr_state(&vcpu->arch.vr);
> -#endif
> -	vcpu->arch.vrsave =3D mfspr(SPRN_VRSAVE);
> -
> -	if (cpu_has_feature(CPU_FTR_TM) ||
> -	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> -		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
> -}
> -
> -static void save_p9_host_os_sprs(struct p9_host_os_sprs =
*host_os_sprs)
> -{
> -	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> -		host_os_sprs->tidr =3D mfspr(SPRN_TIDR);
> -	host_os_sprs->iamr =3D mfspr(SPRN_IAMR);
> -	host_os_sprs->amr =3D mfspr(SPRN_AMR);
> -	host_os_sprs->fscr =3D mfspr(SPRN_FSCR);
> -	host_os_sprs->dscr =3D mfspr(SPRN_DSCR);
> -}
> -
> -/* vcpu guest regs must already be saved */
> -static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
> -				    struct p9_host_os_sprs =
*host_os_sprs)
> -{
> -	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
> -
> -	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> -		mtspr(SPRN_TIDR, host_os_sprs->tidr);
> -	if (host_os_sprs->iamr !=3D vcpu->arch.iamr)
> -		mtspr(SPRN_IAMR, host_os_sprs->iamr);
> -	if (vcpu->arch.uamor !=3D 0)
> -		mtspr(SPRN_UAMOR, 0);
> -	if (host_os_sprs->amr !=3D vcpu->arch.amr)
> -		mtspr(SPRN_AMR, host_os_sprs->amr);
> -	if (host_os_sprs->fscr !=3D vcpu->arch.fscr)
> -		mtspr(SPRN_FSCR, host_os_sprs->fscr);
> -	if (host_os_sprs->dscr !=3D vcpu->arch.dscr)
> -		mtspr(SPRN_DSCR, host_os_sprs->dscr);
> -	if (vcpu->arch.pspb !=3D 0)
> -		mtspr(SPRN_PSPB, 0);
> -
> -	/* Save guest CTRL register, set runlatch to 1 */
> -	if (!(vcpu->arch.ctrl & 1))
> -		mtspr(SPRN_CTRLT, 1);
> -}
> -
> static inline bool hcall_is_xics(unsigned long req)
> {
> 	return req =3D=3D H_EOI || req =3D=3D H_CPPR || req =3D=3D H_IPI =
||
> diff --git a/arch/powerpc/kvm/book3s_hv.h =
b/arch/powerpc/kvm/book3s_hv.h
> new file mode 100644
> index 000000000000..72e3a8f4c2cf
> --- /dev/null
> +++ b/arch/powerpc/kvm/book3s_hv.h
> @@ -0,0 +1,39 @@
> +
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
> +void load_vcpu_state(struct kvm_vcpu *vcpu,
> +			   struct p9_host_os_sprs *host_os_sprs);
> +void store_vcpu_state(struct kvm_vcpu *vcpu);
> +void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs);
> +void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
> +				    struct p9_host_os_sprs =
*host_os_sprs);
> +void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
> +			    struct p9_host_os_sprs *host_os_sprs);
> +void switch_pmu_to_host(struct kvm_vcpu *vcpu,
> +			    struct p9_host_os_sprs *host_os_sprs);
> diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c =
b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> index afdd7dfa1c08..cc74cd314fcf 100644
> --- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
> +++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> @@ -4,8 +4,340 @@
> #include <asm/asm-prototypes.h>
> #include <asm/dbell.h>
> #include <asm/kvm_ppc.h>
> +#include <asm/pmc.h>
> #include <asm/ppc-opcode.h>
>=20
> +#include "book3s_hv.h"
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
> +void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
> +				struct p9_host_os_sprs *host_os_sprs)
> +{
> +	struct lppaca *lp;
> +	int load_pmu =3D 1;
> +
> +	lp =3D vcpu->arch.vpa.pinned_addr;
> +	if (lp)
> +		load_pmu =3D lp->pmcregs_in_use;
> +
> +	if (load_pmu)
> +	      vcpu->arch.hfscr |=3D HFSCR_PM;
> +
> +	/* Save host */
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
> +
> +#ifdef CONFIG_PPC_PSERIES
> +	if (kvmhv_on_pseries()) {
> +		if (vcpu->arch.vpa.pinned_addr) {
> +			struct lppaca *lp =3D =
vcpu->arch.vpa.pinned_addr;
> +			get_lppaca()->pmcregs_in_use =3D =
lp->pmcregs_in_use;
> +		} else {
> +			get_lppaca()->pmcregs_in_use =3D 1;
> +		}
> +	}
> +#endif
> +
> +	/* Load guest */
> +	if (vcpu->arch.hfscr & HFSCR_PM) {
> +		mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
> +		mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
> +		mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
> +		mtspr(SPRN_PMC4, vcpu->arch.pmc[3]);
> +		mtspr(SPRN_PMC5, vcpu->arch.pmc[4]);
> +		mtspr(SPRN_PMC6, vcpu->arch.pmc[5]);
> +		mtspr(SPRN_MMCR1, vcpu->arch.mmcr[1]);
> +		mtspr(SPRN_MMCR2, vcpu->arch.mmcr[2]);
> +		mtspr(SPRN_SDAR, vcpu->arch.sdar);
> +		mtspr(SPRN_SIAR, vcpu->arch.siar);
> +		mtspr(SPRN_SIER, vcpu->arch.sier[0]);
> +
> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +			mtspr(SPRN_MMCR3, vcpu->arch.mmcr[4]);
> +			mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
> +			mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
> +		}
> +
> +		/* Set MMCRA then MMCR0 last */
> +		mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
> +		mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
> +		/* No isync necessary because we're starting counters */
> +	}
> +}
> +EXPORT_SYMBOL_GPL(switch_pmu_to_guest);
> +
> +void switch_pmu_to_host(struct kvm_vcpu *vcpu,
> +				struct p9_host_os_sprs *host_os_sprs)
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
> +
> +	} else if (vcpu->arch.hfscr & HFSCR_PM) {
> +		/*
> +		 * The guest accessed PMC SPRs without specifying they =
should
> +		 * be preserved. Stop them from counting if the guest =
had
> +		 * started anything.
> +		 */
> +		freeze_pmu(mfspr(SPRN_MMCR0), mfspr(SPRN_MMCRA));
> +
> +		/*
> +		 * Demand-fault PMU register access in the guest.
> +		 *
> +		 * This is used to grab the guest's VPA pmcregs_in_use =
value
> +		 * and reflect it into the host's VPA in the case of a =
nested
> +		 * hypervisor.
> +		 *
> +		 * It also avoids having to zero-out SPRs after each =
guest
> +		 * exit to avoid side-channels when.
> +		 *
> +		 * This is cleared here when we exit the guest, so later =
HFSCR
> +		 * interrupt handling can add it back to run the guest =
with
> +		 * PM enabled next time.
> +		 */
> +		vcpu->arch.hfscr &=3D ~HFSCR_PM;
> +	} /* otherwise the PMU should still be frozen from guest entry =
*/
> +
> +
> +#ifdef CONFIG_PPC_PSERIES
> +	if (kvmhv_on_pseries())
> +		get_lppaca()->pmcregs_in_use =3D ppc_get_pmu_inuse();
> +#endif
> +
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
> +EXPORT_SYMBOL_GPL(switch_pmu_to_host);
> +
> +static void load_spr_state(struct kvm_vcpu *vcpu,
> +				struct p9_host_os_sprs *host_os_sprs)
> +{
> +	mtspr(SPRN_TAR, vcpu->arch.tar);
> +	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
> +	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
> +	mtspr(SPRN_BESCR, vcpu->arch.bescr);
> +
> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +		mtspr(SPRN_TIDR, vcpu->arch.tid);
> +	if (host_os_sprs->iamr !=3D vcpu->arch.iamr)
> +		mtspr(SPRN_IAMR, vcpu->arch.iamr);
> +	if (host_os_sprs->amr !=3D vcpu->arch.amr)
> +		mtspr(SPRN_AMR, vcpu->arch.amr);
> +	if (vcpu->arch.uamor !=3D 0)
> +		mtspr(SPRN_UAMOR, vcpu->arch.uamor);
> +	if (host_os_sprs->fscr !=3D vcpu->arch.fscr)
> +		mtspr(SPRN_FSCR, vcpu->arch.fscr);
> +	if (host_os_sprs->dscr !=3D vcpu->arch.dscr)
> +		mtspr(SPRN_DSCR, vcpu->arch.dscr);
> +	if (vcpu->arch.pspb !=3D 0)
> +		mtspr(SPRN_PSPB, vcpu->arch.pspb);
> +
> +	/*
> +	 * DAR, DSISR, and for nested HV, SPRGs must be set with MSR[RI]
> +	 * clear (or hstate set appropriately to catch those registers
> +	 * being clobbered if we take a MCE or SRESET), so those are =
done
> +	 * later.
> +	 */
> +
> +	if (!(vcpu->arch.ctrl & 1))
> +		mtspr(SPRN_CTRLT, 0);
> +}
> +
> +static void store_spr_state(struct kvm_vcpu *vcpu)
> +{
> +	vcpu->arch.tar =3D mfspr(SPRN_TAR);
> +	vcpu->arch.ebbhr =3D mfspr(SPRN_EBBHR);
> +	vcpu->arch.ebbrr =3D mfspr(SPRN_EBBRR);
> +	vcpu->arch.bescr =3D mfspr(SPRN_BESCR);
> +
> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +		vcpu->arch.tid =3D mfspr(SPRN_TIDR);
> +	vcpu->arch.iamr =3D mfspr(SPRN_IAMR);
> +	vcpu->arch.amr =3D mfspr(SPRN_AMR);
> +	vcpu->arch.uamor =3D mfspr(SPRN_UAMOR);
> +	vcpu->arch.fscr =3D mfspr(SPRN_FSCR);
> +	vcpu->arch.dscr =3D mfspr(SPRN_DSCR);
> +	vcpu->arch.pspb =3D mfspr(SPRN_PSPB);
> +
> +	vcpu->arch.ctrl =3D mfspr(SPRN_CTRLF);
> +}
> +
> +void load_vcpu_state(struct kvm_vcpu *vcpu,
> +			   struct p9_host_os_sprs *host_os_sprs)
> +{
> +	if (cpu_has_feature(CPU_FTR_TM) ||
> +	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> +		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
> +
> +	load_spr_state(vcpu, host_os_sprs);
> +
> +	load_fp_state(&vcpu->arch.fp);
> +#ifdef CONFIG_ALTIVEC
> +	load_vr_state(&vcpu->arch.vr);
> +#endif
> +	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
> +}
> +EXPORT_SYMBOL_GPL(load_vcpu_state);
> +
> +void store_vcpu_state(struct kvm_vcpu *vcpu)
> +{
> +	store_spr_state(vcpu);
> +
> +	store_fp_state(&vcpu->arch.fp);
> +#ifdef CONFIG_ALTIVEC
> +	store_vr_state(&vcpu->arch.vr);
> +#endif
> +	vcpu->arch.vrsave =3D mfspr(SPRN_VRSAVE);
> +
> +	if (cpu_has_feature(CPU_FTR_TM) ||
> +	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> +		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
> +}
> +EXPORT_SYMBOL_GPL(store_vcpu_state);
> +
> +void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
> +{
> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +		host_os_sprs->tidr =3D mfspr(SPRN_TIDR);
> +	host_os_sprs->iamr =3D mfspr(SPRN_IAMR);
> +	host_os_sprs->amr =3D mfspr(SPRN_AMR);
> +	host_os_sprs->fscr =3D mfspr(SPRN_FSCR);
> +	host_os_sprs->dscr =3D mfspr(SPRN_DSCR);
> +}
> +EXPORT_SYMBOL_GPL(save_p9_host_os_sprs);
> +
> +/* vcpu guest regs must already be saved */
> +void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
> +				    struct p9_host_os_sprs =
*host_os_sprs)
> +{
> +	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
> +
> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +		mtspr(SPRN_TIDR, host_os_sprs->tidr);
> +	if (host_os_sprs->iamr !=3D vcpu->arch.iamr)
> +		mtspr(SPRN_IAMR, host_os_sprs->iamr);
> +	if (vcpu->arch.uamor !=3D 0)
> +		mtspr(SPRN_UAMOR, 0);
> +	if (host_os_sprs->amr !=3D vcpu->arch.amr)
> +		mtspr(SPRN_AMR, host_os_sprs->amr);
> +	if (host_os_sprs->fscr !=3D vcpu->arch.fscr)
> +		mtspr(SPRN_FSCR, host_os_sprs->fscr);
> +	if (host_os_sprs->dscr !=3D vcpu->arch.dscr)
> +		mtspr(SPRN_DSCR, host_os_sprs->dscr);
> +	if (vcpu->arch.pspb !=3D 0)
> +		mtspr(SPRN_PSPB, 0);
> +
> +	/* Save guest CTRL register, set runlatch to 1 */
> +	if (!(vcpu->arch.ctrl & 1))
> +		mtspr(SPRN_CTRLT, 1);
> +}
> +EXPORT_SYMBOL_GPL(restore_p9_host_os_sprs);
> +
> #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
> static void __start_timing(struct kvm_vcpu *vcpu, struct =
kvmhv_tb_accumulator *next)
> {
> --=20
> 2.23.0
>=20

