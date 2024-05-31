Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B20DB8D5EC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 11:49:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vj6tXhzT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrJHJ4f2Mz3cYC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 19:49:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vj6tXhzT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrJGZ55lNz3cXQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 19:48:37 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44V9exJX018311;
	Fri, 31 May 2024 09:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=Mgn0kfZ3HgGPixjjOyVlDHlm2OtgehuBIoKdEnVLV38=;
 b=Vj6tXhzTN7ekQIVy6o/6ni0bQ100C1z4Im9Lp/KEniYu1jndNV21RubGOWeRXmSYqg/j
 UbavdD8gBFkAdJ7khmt9QvEIbek+nzw+1S0lkRqZ6y1PtrHqn7Xomp0+MJ1yF6RbwaZp
 e1PCnr0J2HKGulo/suzj9fzzGvLALIS7gW8LhxJn7LP4RIvjBwEOUKxuCX4ZSSiEhdm5
 JN0ySMVAQhYn4q2Uvy/CrY6fX3unlPnJA1SO0LMLSscJt2LZxqTgQ03eFQdYuowJ5kmU
 PL3fFInK0qSHD4fFGuAr3SB4UDRWfvlbfW6tbIvPRplpcpRoBtMG8Zc3PNVMdSbCIomN nA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfbq5g2vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:48:32 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44V9Ad6F002322;
	Fri, 31 May 2024 09:48:31 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ydpb0y6kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:48:31 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44V9mPNw36700462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 09:48:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A50B52004D;
	Fri, 31 May 2024 09:48:25 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8006120040;
	Fri, 31 May 2024 09:48:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.82.215])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 31 May 2024 09:48:24 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v3] powerpc/perf: Set cpumode flags using sample address
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240528040356.2722275-1-anjalik@linux.ibm.com>
Date: Fri, 31 May 2024 15:18:12 +0530
Message-Id: <5D129862-C6B5-4E39-820C-E987031F1451@linux.vnet.ibm.com>
References: <20240528040356.2722275-1-anjalik@linux.ibm.com>
To: Anjali K <anjalik@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -mXmGTXfteRqzujT84XWqXuzGAUVOHzv
X-Proofpoint-ORIG-GUID: -mXmGTXfteRqzujT84XWqXuzGAUVOHzv
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 impostorscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405310072
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
Cc: Kajol Jain <kjain@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 28 May 2024, at 9:33=E2=80=AFAM, Anjali K <anjalik@linux.ibm.com> wrot=
e:
>=20
> Currently in some cases, when the sampled instruction address register
> latches to a specific address during sampling, the privilege bits captured
> in the sampled event register are incorrect.
> For example, a snippet from the perf report on a power10 system is:
> Overhead  Address             Command       Shared Object      Symbol
> ........  ..................  ............  .................  ..........=
.............
>     2.41%  0x7fff9f94a02c      null_syscall  [unknown]          [k] 0x000=
07fff9f94a02c
>     2.20%  0x7fff9f94a02c      null_syscall  libc.so.6          [.] sysca=
ll
>=20
> perf_get_misc_flags() function looks at the privilege bits to return the
> corresponding flags to be used for the address symbol and these privilege
> bit details are read from the sampled event register. In the above snippe=
t,
> address "0x00007fff9f94a02c" is shown as "k" (kernel) due to the incorrect
> privilege bits captured in the sampled event register.
> To address this case check whether the sampled address is in the kernel
> area. Since this is specific to the latest platform, a new pmu flag is
> added called "PPMU_P10" and is used to contain the proposed fix.
> PPMU_P10_DD1 marked events are also included under PPMU_P10, hence
> remove the code specific to PPMU_P10_DD1 marked events.
>=20
> Signed-off-by: Anjali K <anjalik@linux.ibm.com>

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com <mailto:atrajeev@li=
nux.vnet.ibm.com>>

Thanks
Athira Rajeev
> ---
> Changelog:
> v2->v3:
> Addressed review comments from Michael Ellerman to change the commit=20
> message and update the values of PPMU_P10 and PPMU_HAS_ATTR_CONFIG1 flags
> to move the PPMU_P10 flag near the PPMU_P10_DD1 flag
> Rebased on linux 6.10-rc1
> v2 patch link:
> https://lore.kernel.org/linuxppc-dev/20240517094607.422166-1-anjalik@linu=
x.ibm.com/
>=20
> v1->v2:
> Fixed the build warning reported by the kernel test bot=20
> Added a new flag PPMU_P10 and used it instead of PPMU_ARCH_31 to restrict
> the changes to the current platform (Power10)
> v1 patch link:
> https://lore.kernel.org/linuxppc-dev/20240511075344.1393631-1-anjalik@lin=
ux.ibm.com/
>=20
> arch/powerpc/include/asm/perf_event_server.h |  3 +-
> arch/powerpc/perf/core-book3s.c              | 45 +++++++++-----------
> arch/powerpc/perf/power10-pmu.c              |  3 +-
> 3 files changed, 23 insertions(+), 28 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/=
include/asm/perf_event_server.h
> index e2221d29fdf9..5995614e9062 100644
> --- a/arch/powerpc/include/asm/perf_event_server.h
> +++ b/arch/powerpc/include/asm/perf_event_server.h
> @@ -89,7 +89,8 @@ struct power_pmu {
> #define PPMU_NO_SIAR 0x00000100 /* Do not use SIAR */
> #define PPMU_ARCH_31 0x00000200 /* Has MMCR3, SIER2 and SIER3 */
> #define PPMU_P10_DD1 0x00000400 /* Is power10 DD1 processor version */
> -#define PPMU_HAS_ATTR_CONFIG1 0x00000800 /* Using config1 attribute */
> +#define PPMU_P10 0x00000800 /* For power10 pmu */
> +#define PPMU_HAS_ATTR_CONFIG1 0x00001000 /* Using config1 attribute */
>=20
> /*
>  * Values for flags to get_alternatives()
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-boo=
k3s.c
> index 6b5f8a94e7d8..42867469752d 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -266,31 +266,12 @@ static inline u32 perf_flags_from_msr(struct pt_reg=
s *regs)
> static inline u32 perf_get_misc_flags(struct pt_regs *regs)
> {
> bool use_siar =3D regs_use_siar(regs);
> - unsigned long mmcra =3D regs->dsisr;
> - int marked =3D mmcra & MMCRA_SAMPLE_ENABLE;
> + unsigned long siar;
> + unsigned long addr;
>=20
> if (!use_siar)
> return perf_flags_from_msr(regs);
>=20
> - /*
> - * Check the address in SIAR to identify the
> - * privilege levels since the SIER[MSR_HV, MSR_PR]
> - * bits are not set for marked events in power10
> - * DD1.
> - */
> - if (marked && (ppmu->flags & PPMU_P10_DD1)) {
> - unsigned long siar =3D mfspr(SPRN_SIAR);
> - if (siar) {
> - if (is_kernel_addr(siar))
> - return PERF_RECORD_MISC_KERNEL;
> - return PERF_RECORD_MISC_USER;
> - } else {
> - if (is_kernel_addr(regs->nip))
> - return PERF_RECORD_MISC_KERNEL;
> - return PERF_RECORD_MISC_USER;
> - }
> - }
> -
> /*
> * If we don't have flags in MMCRA, rather than using
> * the MSR, we intuit the flags from the address in
> @@ -298,19 +279,31 @@ static inline u32 perf_get_misc_flags(struct pt_reg=
s *regs)
> * results
> */
> if (ppmu->flags & PPMU_NO_SIPR) {
> - unsigned long siar =3D mfspr(SPRN_SIAR);
> + siar =3D mfspr(SPRN_SIAR);
> if (is_kernel_addr(siar))
> return PERF_RECORD_MISC_KERNEL;
> return PERF_RECORD_MISC_USER;
> }
>=20
> /* PR has priority over HV, so order below is important */
> - if (regs_sipr(regs))
> - return PERF_RECORD_MISC_USER;
> -
> - if (regs_sihv(regs) && (freeze_events_kernel !=3D MMCR0_FCHV))
> + if (regs_sipr(regs)) {
> + if (!(ppmu->flags & PPMU_P10))
> + return PERF_RECORD_MISC_USER;
> + } else if (regs_sihv(regs) && (freeze_events_kernel !=3D MMCR0_FCHV))
> return PERF_RECORD_MISC_HYPERVISOR;
>=20
> + /*
> + * Check the address in SIAR to identify the
> + * privilege levels since the SIER[MSR_HV, MSR_PR]
> + * bits are not set correctly in power10 sometimes
> + */
> + if (ppmu->flags & PPMU_P10) {
> + siar =3D mfspr(SPRN_SIAR);
> + addr =3D siar ? siar : regs->nip;
> + if (!is_kernel_addr(addr))
> + return PERF_RECORD_MISC_USER;
> + }
> +
> return PERF_RECORD_MISC_KERNEL;
> }
>=20
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-=
pmu.c
> index 62a68b6b2d4b..bb57b7cfe640 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -593,7 +593,8 @@ static struct power_pmu power10_pmu =3D {
> .get_mem_weight =3D isa207_get_mem_weight,
> .disable_pmc =3D isa207_disable_pmc,
> .flags =3D PPMU_HAS_SIER | PPMU_ARCH_207S |
> -  PPMU_ARCH_31 | PPMU_HAS_ATTR_CONFIG1,
> +  PPMU_ARCH_31 | PPMU_HAS_ATTR_CONFIG1 |
> +  PPMU_P10,
> .n_generic =3D ARRAY_SIZE(power10_generic_events),
> .generic_events =3D power10_generic_events,
> .cache_events =3D &power10_cache_events,
>=20
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> --=20
> 2.39.3
>=20

