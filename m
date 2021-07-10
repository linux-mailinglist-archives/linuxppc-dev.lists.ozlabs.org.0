Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275FE3C3202
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 04:51:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GMF0h0QMsz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 12:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ESkWNBMn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ESkWNBMn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GMF09636vz3bhZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jul 2021 12:51:05 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16A2XoPh116577; Fri, 9 Jul 2021 22:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=A62f9LFYFNkcFG8XEGYH5zfzqtx8Y6q/wsLnyq2iL5c=;
 b=ESkWNBMnOZVA5G5qu1Ae8qTMFhq6XOQYDKXfqgKacoJvd2KEeN4YWP2aXMLvrG1be4t5
 bs1rEO0o8oowXy2poo/GqBJX/dbVVN3VN08TYJACszWQgTvU0KosIbQeSJm9e75Lsl17
 dXfRLsQmHwpLzl95OYTaQGJr2plFw0Po1QImceJZIvh7gtNSPFYSuhannXfP8RNr9bE7
 AazWnWytQa1eW+Jxfyf2gQBK/d8rNt9QOzInYagMnLSDj7HJo04IVAUQpCOzy8LZkBvx
 RDAhh+2piZ80JeC4apC1sBH78P1+HerCthS43AJf6/FZweCbzselewJHFM3EcoBq7lhe Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nhccnx2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 22:51:03 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16A2p2cA014977;
 Fri, 9 Jul 2021 22:51:02 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nhccnx21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 22:51:02 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16A2lxuH027102;
 Sat, 10 Jul 2021 02:51:00 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 39q2th8030-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Jul 2021 02:51:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16A2ow1R28311862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 10 Jul 2021 02:50:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18883AE051;
 Sat, 10 Jul 2021 02:50:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AED2AE04D;
 Sat, 10 Jul 2021 02:50:57 +0000 (GMT)
Received: from [9.79.176.228] (unknown [9.79.176.228])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat, 10 Jul 2021 02:50:56 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Subject: Re: [RFC PATCH 10/43] powerpc/64s: Always set PMU control registers
 to frozen/disabled when not in use
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210622105736.633352-11-npiggin@gmail.com>
Date: Sat, 10 Jul 2021 08:20:54 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <C58A063A-3B5D-4188-80E2-4C19802785BF@linux.vnet.ibm.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-11-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: o6RgV5VuVuOgehlUJdVPrBdu-XXRmFFs
X-Proofpoint-GUID: FK4G-T8U__xOyiHE9quDJutl50Fu6q4K
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-10_02:2021-07-09,
 2021-07-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107100013
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
> KVM PMU management code looks for particular frozen/disabled bits in
> the PMU registers so it knows whether it must clear them when coming
> out of a guest or not. Setting this up helps KVM make these =
optimisations
> without getting confused. Longer term the better approach might be to
> move guest/host PMU switching to the perf subsystem.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> arch/powerpc/kernel/cpu_setup_power.c | 4 ++--
> arch/powerpc/kernel/dt_cpu_ftrs.c     | 6 +++---
> arch/powerpc/kvm/book3s_hv.c          | 5 +++++
> arch/powerpc/perf/core-book3s.c       | 7 +++++++
> 4 files changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/cpu_setup_power.c =
b/arch/powerpc/kernel/cpu_setup_power.c
> index a29dc8326622..3dc61e203f37 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.c
> +++ b/arch/powerpc/kernel/cpu_setup_power.c
> @@ -109,7 +109,7 @@ static void init_PMU_HV_ISA207(void)
> static void init_PMU(void)
> {
> 	mtspr(SPRN_MMCRA, 0);
> -	mtspr(SPRN_MMCR0, 0);
> +	mtspr(SPRN_MMCR0, MMCR0_FC);
> 	mtspr(SPRN_MMCR1, 0);
> 	mtspr(SPRN_MMCR2, 0);
> }
> @@ -123,7 +123,7 @@ static void init_PMU_ISA31(void)
> {
> 	mtspr(SPRN_MMCR3, 0);
> 	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
> -	mtspr(SPRN_MMCR0, MMCR0_PMCCEXT);
> +	mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
> }
>=20
> /*
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c =
b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 0a6b36b4bda8..06a089fbeaa7 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -353,7 +353,7 @@ static void init_pmu_power8(void)
> 	}
>=20
> 	mtspr(SPRN_MMCRA, 0);
> -	mtspr(SPRN_MMCR0, 0);
> +	mtspr(SPRN_MMCR0, MMCR0_FC);
> 	mtspr(SPRN_MMCR1, 0);
> 	mtspr(SPRN_MMCR2, 0);
> 	mtspr(SPRN_MMCRS, 0);
> @@ -392,7 +392,7 @@ static void init_pmu_power9(void)
> 		mtspr(SPRN_MMCRC, 0);
>=20
> 	mtspr(SPRN_MMCRA, 0);
> -	mtspr(SPRN_MMCR0, 0);
> +	mtspr(SPRN_MMCR0, MMCR0_FC);
> 	mtspr(SPRN_MMCR1, 0);
> 	mtspr(SPRN_MMCR2, 0);
> }
> @@ -428,7 +428,7 @@ static void init_pmu_power10(void)
>=20
> 	mtspr(SPRN_MMCR3, 0);
> 	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
> -	mtspr(SPRN_MMCR0, MMCR0_PMCCEXT);
> +	mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
> }
>=20
> static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
> diff --git a/arch/powerpc/kvm/book3s_hv.c =
b/arch/powerpc/kvm/book3s_hv.c
> index 1f30f98b09d1..f7349d150828 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2593,6 +2593,11 @@ static int kvmppc_core_vcpu_create_hv(struct =
kvm_vcpu *vcpu)
> #endif
> #endif
> 	vcpu->arch.mmcr[0] =3D MMCR0_FC;
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +		vcpu->arch.mmcr[0] |=3D MMCR0_PMCCEXT;
> +		vcpu->arch.mmcra =3D MMCRA_BHRB_DISABLE;
> +	}
> +
> 	vcpu->arch.ctrl =3D CTRL_RUNLATCH;
> 	/* default to host PVR, since we can't spoof it */
> 	kvmppc_set_pvr_hv(vcpu, mfspr(SPRN_PVR));
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index 51622411a7cc..e33b29ec1a65 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1361,6 +1361,13 @@ static void power_pmu_enable(struct pmu *pmu)
> 		goto out;
>=20
> 	if (cpuhw->n_events =3D=3D 0) {
> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +			mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
> +			mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
> +		} else {
> +			mtspr(SPRN_MMCRA, 0);
> +			mtspr(SPRN_MMCR0, MMCR0_FC);
> +		}


Hi Nick,

We are setting these bits in =E2=80=9Cpower_pmu_disable=E2=80=9D =
function. And disable will be called before any event gets =
deleted/stopped. Can you please help to understand why this is needed in =
power_pmu_enable path also ?

Thanks
Athira

> 		ppc_set_pmu_inuse(0);
> 		goto out;
> 	}
> --=20
> 2.23.0
>=20

