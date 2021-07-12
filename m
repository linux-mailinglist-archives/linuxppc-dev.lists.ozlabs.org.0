Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D87A43C4644
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 11:32:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNdpJ35Cwz3bWT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 19:32:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QjM+F+uP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QjM+F+uP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNdnn1fVmz2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 19:31:56 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16C93fnE150006; Mon, 12 Jul 2021 05:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=7Y4lSi3iVoNmmVWXLDvCW5ogDWGnWx7AIBswekCJLIg=;
 b=QjM+F+uPrfhLCw3SpU/tXs/5KKOXkdqVhZa09Z5aR3bomY2NtNvMND7f0VhTtrPIoalJ
 +NBQYib+grqXWyTF4zsWt+q8oObDvfJWbZTRAj7rNQkxw3KdtUyx5GXu/diKPqCSjDJX
 U6p8WSSqnZIYbjKRbQlxHHIODBlNWU/9BKsV5dXA4JDELivbtO/lpT6zO0PsxhzoagQX
 cqAAA5musRcAwqdezPioneoN+4GsVxHKphKP9ENVnx7nh191rqz824d7PwVartvYcPSA
 55PhtzbjqSbByyPKeQKaKCmkexo74jmlg9iIJJVJCXPbEpFt6T5Kn3yWpNVct+VysO2k ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrkvkwf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 05:31:50 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16C94BT2153025;
 Mon, 12 Jul 2021 05:31:50 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrkvkwea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 05:31:50 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16C9CvRA015306;
 Mon, 12 Jul 2021 09:31:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 39q3688by4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 09:31:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16C9VjOH26476922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 09:31:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6023D11C050;
 Mon, 12 Jul 2021 09:31:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20A8111C05E;
 Mon, 12 Jul 2021 09:31:44 +0000 (GMT)
Received: from [9.195.47.54] (unknown [9.195.47.54])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Jul 2021 09:31:43 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Subject: Re: [PATCH] powerpc/perf: Fix cycles/instructions as
 PM_CYC/PM_INST_CMPL in power10
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1625748771.problnjoqz.astroid@bobo.none>
Date: Mon, 12 Jul 2021 15:01:41 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <3CC0167E-7BC0-4B15-8AB3-72E5831A405C@linux.vnet.ibm.com>
References: <1625639981-1424-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1625748771.problnjoqz.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5LL3claaavtbsJpBGT26UHv4HQ8uXuzA
X-Proofpoint-ORIG-GUID: c2Ds30uprpjOzUzItUGVyFPqGDyDP-ly
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_05:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120072
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 08-Jul-2021, at 6:26 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Excerpts from Athira Rajeev's message of July 7, 2021 4:39 pm:
>> From: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>
>>=20
>> Power10 performance monitoring unit (PMU) driver uses performance
>> monitor counter 5 (PMC5) and performance monitor counter 6 (PMC6)
>> for counting instructions and cycles. Event used for cycles is
>> PM_RUN_CYC and instructions is PM_RUN_INST_CMPL. But counting of =
these
>> events in wait state is controlled by the CC56RUN bit setting in
>> Monitor Mode Control Register0 (MMCR0). If the CC56RUN bit is not
>> set, PMC5/6 will not count when CTRL[RUN] is zero.
>=20
> What's the acutal bug here, can you explain a bit more? I thought
> PM_RUN_CYC is supposed to be gated by the runlatch.
>=20
> POWER9 code looks similar, it doesn't have the same problem?
>=20
> Thanks,
> Nick

Hi Nick,

Thanks for the review.

In power9 and before, the default event used for counting "cycles" - =
PM_CYC (0x0001e) and for counting instruction - PM_INST_CMPL (0x00002) .=20=

These events, uses two programmable PMC to count cycles and instructions =
(this causes multiplexing for basic set of events supported by perf =
stat).=20
And PM_CYC/PM_INST_CMPL both by default count irrespective of the run =
latch state.

So in power10, we decided to use PMC5 and PMC6 for counting instructions =
and cycles respectively. But PMC5 and PMC6 by default counts only when =
runlatch is enabled, this can cause issues in case of system wide =
profiling. So in order to make PMC5/6 behave as PM_CYC and PM_INST_CMPL, =
we are enabling MMCR0[CC56RUN]] bit.

Thanks
Athira
>=20
>>=20
>> Patch sets the CC56RUN bit in MMCR0 for power10 which makes PMC5 and
>> PMC6 count instructions and cycles regardless of the run bit. With =
this
>> change, these events are also now renamed to PM_CYC and PM_INST_CMPL
>> rather than PM_RUN_CYC and PM_RUN_INST_CMPL.
>>=20
>> Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring =
support")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>
>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> Notes on testing done for this change:
>> Tested this patch change with a kernel module that
>> turns off and turns on the runlatch. kernel module also
>> reads the counter values for PMC5 and PMC6 during the
>> period when runlatch is off.
>> - Started PMU counters via "perf stat" and loaded the
>>   test module.
>> - Checked the counter values captured from module during
>>   the runlatch off period.
>> - Verified that counters were frozen without the patch and
>>   with the patch, observed counters were incrementing.
>>=20
>> arch/powerpc/perf/power10-events-list.h |  8 +++---
>> arch/powerpc/perf/power10-pmu.c         | 44 =
+++++++++++++++++++++++----------
>> 2 files changed, 35 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/arch/powerpc/perf/power10-events-list.h =
b/arch/powerpc/perf/power10-events-list.h
>> index 93be719..564f1409 100644
>> --- a/arch/powerpc/perf/power10-events-list.h
>> +++ b/arch/powerpc/perf/power10-events-list.h
>> @@ -9,10 +9,10 @@
>> /*
>>  * Power10 event codes.
>>  */
>> -EVENT(PM_RUN_CYC,				0x600f4);
>> +EVENT(PM_CYC,				0x600f4);
>> EVENT(PM_DISP_STALL_CYC,			0x100f8);
>> EVENT(PM_EXEC_STALL,				0x30008);
>> -EVENT(PM_RUN_INST_CMPL,				0x500fa);
>> +EVENT(PM_INST_CMPL,				0x500fa);
>> EVENT(PM_BR_CMPL,                               0x4d05e);
>> EVENT(PM_BR_MPRED_CMPL,                         0x400f6);
>> EVENT(PM_BR_FIN,				0x2f04a);
>> @@ -50,8 +50,8 @@
>> /* ITLB Reloaded */
>> EVENT(PM_ITLB_MISS,				0x400fc);
>>=20
>> -EVENT(PM_RUN_CYC_ALT,				0x0001e);
>> -EVENT(PM_RUN_INST_CMPL_ALT,			0x00002);
>> +EVENT(PM_CYC_ALT,				0x0001e);
>> +EVENT(PM_INST_CMPL_ALT,				0x00002);
>>=20
>> /*
>>  * Memory Access Events
>> diff --git a/arch/powerpc/perf/power10-pmu.c =
b/arch/powerpc/perf/power10-pmu.c
>> index f9d64c6..9dd75f3 100644
>> --- a/arch/powerpc/perf/power10-pmu.c
>> +++ b/arch/powerpc/perf/power10-pmu.c
>> @@ -91,8 +91,8 @@
>>=20
>> /* Table of alternatives, sorted by column 0 */
>> static const unsigned int power10_event_alternatives[][MAX_ALT] =3D {
>> -	{ PM_RUN_CYC_ALT,		PM_RUN_CYC },
>> -	{ PM_RUN_INST_CMPL_ALT,		PM_RUN_INST_CMPL },
>> +	{ PM_CYC_ALT,			PM_CYC },
>> +	{ PM_INST_CMPL_ALT,		PM_INST_CMPL },
>> };
>>=20
>> static int power10_get_alternatives(u64 event, unsigned int flags, =
u64 alt[])
>> @@ -118,8 +118,8 @@ static int power10_check_attr_config(struct =
perf_event *ev)
>> 	return 0;
>> }
>>=20
>> -GENERIC_EVENT_ATTR(cpu-cycles,			PM_RUN_CYC);
>> -GENERIC_EVENT_ATTR(instructions,		PM_RUN_INST_CMPL);
>> +GENERIC_EVENT_ATTR(cpu-cycles,			PM_CYC);
>> +GENERIC_EVENT_ATTR(instructions,		PM_INST_CMPL);
>> GENERIC_EVENT_ATTR(branch-instructions,		PM_BR_CMPL);
>> GENERIC_EVENT_ATTR(branch-misses,		PM_BR_MPRED_CMPL);
>> GENERIC_EVENT_ATTR(cache-references,		PM_LD_REF_L1);
>> @@ -148,8 +148,8 @@ static int power10_check_attr_config(struct =
perf_event *ev)
>> CACHE_EVENT_ATTR(iTLB-load-misses,		PM_ITLB_MISS);
>>=20
>> static struct attribute *power10_events_attr_dd1[] =3D {
>> -	GENERIC_EVENT_PTR(PM_RUN_CYC),
>> -	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
>> +	GENERIC_EVENT_PTR(PM_CYC),
>> +	GENERIC_EVENT_PTR(PM_INST_CMPL),
>> 	GENERIC_EVENT_PTR(PM_BR_CMPL),
>> 	GENERIC_EVENT_PTR(PM_BR_MPRED_CMPL),
>> 	GENERIC_EVENT_PTR(PM_LD_REF_L1),
>> @@ -173,8 +173,8 @@ static int power10_check_attr_config(struct =
perf_event *ev)
>> };
>>=20
>> static struct attribute *power10_events_attr[] =3D {
>> -	GENERIC_EVENT_PTR(PM_RUN_CYC),
>> -	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
>> +	GENERIC_EVENT_PTR(PM_CYC),
>> +	GENERIC_EVENT_PTR(PM_INST_CMPL),
>> 	GENERIC_EVENT_PTR(PM_BR_FIN),
>> 	GENERIC_EVENT_PTR(PM_MPRED_BR_FIN),
>> 	GENERIC_EVENT_PTR(PM_LD_REF_L1),
>> @@ -271,8 +271,8 @@ static int power10_check_attr_config(struct =
perf_event *ev)
>> };
>>=20
>> static int power10_generic_events_dd1[] =3D {
>> -	[PERF_COUNT_HW_CPU_CYCLES] =3D			PM_RUN_CYC,
>> -	[PERF_COUNT_HW_INSTRUCTIONS] =3D			=
PM_RUN_INST_CMPL,
>> +	[PERF_COUNT_HW_CPU_CYCLES] =3D			PM_CYC,
>> +	[PERF_COUNT_HW_INSTRUCTIONS] =3D			=
PM_INST_CMPL,
>> 	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =3D		PM_BR_CMPL,
>> 	[PERF_COUNT_HW_BRANCH_MISSES] =3D			=
PM_BR_MPRED_CMPL,
>> 	[PERF_COUNT_HW_CACHE_REFERENCES] =3D		PM_LD_REF_L1,
>> @@ -280,8 +280,8 @@ static int power10_check_attr_config(struct =
perf_event *ev)
>> };
>>=20
>> static int power10_generic_events[] =3D {
>> -	[PERF_COUNT_HW_CPU_CYCLES] =3D			PM_RUN_CYC,
>> -	[PERF_COUNT_HW_INSTRUCTIONS] =3D			=
PM_RUN_INST_CMPL,
>> +	[PERF_COUNT_HW_CPU_CYCLES] =3D			PM_CYC,
>> +	[PERF_COUNT_HW_INSTRUCTIONS] =3D			=
PM_INST_CMPL,
>> 	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =3D		PM_BR_FIN,
>> 	[PERF_COUNT_HW_BRANCH_MISSES] =3D			=
PM_MPRED_BR_FIN,
>> 	[PERF_COUNT_HW_CACHE_REFERENCES] =3D		PM_LD_REF_L1,
>> @@ -548,6 +548,24 @@ static void power10_config_bhrb(u64 =
pmu_bhrb_filter)
>>=20
>> #undef C
>>=20
>> +/*
>> + * Set the MMCR0[CC56RUN] bit to enable counting for
>> + * PMC5 and PMC6 regardless of the state of CTRL[RUN],
>> + * so that we can use counters 5 and 6 as PM_INST_CMPL and
>> + * PM_CYC.
>> + */
>> +static int power10_compute_mmcr(u64 event[], int n_ev,
>> +				unsigned int hwc[], struct mmcr_regs =
*mmcr,
>> +				struct perf_event *pevents[], u32 flags)
>> +{
>> +	int ret;
>> +
>> +	ret =3D isa207_compute_mmcr(event, n_ev, hwc, mmcr, pevents, =
flags);
>> +	if (!ret)
>> +		mmcr->mmcr0 |=3D MMCR0_C56RUN;
>> +	return ret;
>> +}
>> +
>> static struct power_pmu power10_pmu =3D {
>> 	.name			=3D "POWER10",
>> 	.n_counter		=3D MAX_PMU_COUNTERS,
>> @@ -555,7 +573,7 @@ static void power10_config_bhrb(u64 =
pmu_bhrb_filter)
>> 	.test_adder		=3D ISA207_TEST_ADDER,
>> 	.group_constraint_mask	=3D CNST_CACHE_PMC4_MASK,
>> 	.group_constraint_val	=3D CNST_CACHE_PMC4_VAL,
>> -	.compute_mmcr		=3D isa207_compute_mmcr,
>> +	.compute_mmcr		=3D power10_compute_mmcr,
>> 	.config_bhrb		=3D power10_config_bhrb,
>> 	.bhrb_filter_map	=3D power10_bhrb_filter_map,
>> 	.get_constraint		=3D isa207_get_constraint,
>> --=20
>> 1.8.3.1
>>=20
>>=20

