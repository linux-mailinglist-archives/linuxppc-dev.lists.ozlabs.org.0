Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F86217CF6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 04:15:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1jZM1QYtzDqbW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 12:15:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1jXR4NyWzDq94
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 12:13:43 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06821kZh127785; Tue, 7 Jul 2020 22:13:39 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325498h6fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 22:13:39 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0682DbZf015954;
 Wed, 8 Jul 2020 02:13:37 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3251dw02jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 02:13:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0682DYsY58917050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 02:13:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9201AA405C;
 Wed,  8 Jul 2020 02:13:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3461BA4054;
 Wed,  8 Jul 2020 02:13:33 +0000 (GMT)
Received: from [9.77.206.84] (unknown [9.77.206.84])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  8 Jul 2020 02:13:32 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 04/10] powerpc/perf: Add power10_feat to dt_cpu_ftrs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <fbc244b88f9291e83b2eabedd73ec9672b1fa12d.camel@neuling.org>
Date: Wed, 8 Jul 2020 07:43:30 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <834C0090-CC20-4E20-8E9B-29362325B61A@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-5-git-send-email-atrajeev@linux.vnet.ibm.com>
 <fbc244b88f9291e83b2eabedd73ec9672b1fa12d.camel@neuling.org>
To: Michael Neuling <mikey@neuling.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_15:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 cotscore=-2147483648 clxscore=1015 phishscore=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007080007
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



> On 07-Jul-2020, at 11:52 AM, Michael Neuling <mikey@neuling.org> =
wrote:
>=20
> On Wed, 2020-07-01 at 05:20 -0400, Athira Rajeev wrote:
>> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>>=20
>> Add power10 feature function to dt_cpu_ftrs.c along
>> with a power10 specific init() to initialize pmu sprs.
>=20
> Can you say why you're doing this?
>=20
> Can you add some text about what you're doing to the BHRB in this =
patch?

Sure, I will include these information for commit message in the next =
version

Thanks
Athira=20

>=20
> Mikey
>=20
>>=20
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> arch/powerpc/include/asm/reg.h        |  3 +++
>> arch/powerpc/kernel/cpu_setup_power.S |  7 +++++++
>> arch/powerpc/kernel/dt_cpu_ftrs.c     | 26 ++++++++++++++++++++++++++
>> 3 files changed, 36 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/reg.h =
b/arch/powerpc/include/asm/reg.h
>> index 21a1b2d..900ada1 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -1068,6 +1068,9 @@
>> #define MMCR0_PMC2_LOADMISSTIME	0x5
>> #endif
>>=20
>> +/* BHRB disable bit for PowerISA v3.10 */
>> +#define MMCRA_BHRB_DISABLE	0x0000002000000000
>> +
>> /*
>>  * SPRG usage:
>>  *
>> diff --git a/arch/powerpc/kernel/cpu_setup_power.S
>> b/arch/powerpc/kernel/cpu_setup_power.S
>> index efdcfa7..e8b3370c 100644
>> --- a/arch/powerpc/kernel/cpu_setup_power.S
>> +++ b/arch/powerpc/kernel/cpu_setup_power.S
>> @@ -233,3 +233,10 @@ __init_PMU_ISA207:
>> 	li	r5,0
>> 	mtspr	SPRN_MMCRS,r5
>> 	blr
>> +
>> +__init_PMU_ISA31:
>> +	li	r5,0
>> +	mtspr	SPRN_MMCR3,r5
>> +	LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
>> +	mtspr	SPRN_MMCRA,r5
>> +	blr
>> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c
>> b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> index a0edeb3..14a513f 100644
>> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> @@ -449,6 +449,31 @@ static int __init feat_enable_pmu_power9(struct
>> dt_cpu_feature *f)
>> 	return 1;
>> }
>>=20
>> +static void init_pmu_power10(void)
>> +{
>> +	init_pmu_power9();
>> +
>> +	mtspr(SPRN_MMCR3, 0);
>> +	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
>> +}
>> +
>> +static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
>> +{
>> +	hfscr_pmu_enable();
>> +
>> +	init_pmu_power10();
>> +	init_pmu_registers =3D init_pmu_power10;
>> +
>> +	cur_cpu_spec->cpu_features |=3D CPU_FTR_MMCRA;
>> +	cur_cpu_spec->cpu_user_features |=3D =
PPC_FEATURE_PSERIES_PERFMON_COMPAT;
>> +
>> +	cur_cpu_spec->num_pmcs          =3D 6;
>> +	cur_cpu_spec->pmc_type          =3D PPC_PMC_IBM;
>> +	cur_cpu_spec->oprofile_cpu_type =3D "ppc64/power10";
>> +
>> +	return 1;
>> +}
>> +
>> static int __init feat_enable_tm(struct dt_cpu_feature *f)
>> {
>> #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> @@ -638,6 +663,7 @@ struct dt_cpu_feature_match {
>> 	{"pc-relative-addressing", feat_enable, 0},
>> 	{"machine-check-power9", feat_enable_mce_power9, 0},
>> 	{"performance-monitor-power9", feat_enable_pmu_power9, 0},
>> +	{"performance-monitor-power10", feat_enable_pmu_power10, 0},
>> 	{"event-based-branch-v3", feat_enable, 0},
>> 	{"random-number-generator", feat_enable, 0},
>> 	{"system-call-vectored", feat_disable, 0},
>=20

