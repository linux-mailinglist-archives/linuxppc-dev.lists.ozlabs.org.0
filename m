Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F23533F039B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 14:15:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqRg76z5Rz3cHn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 22:15:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BX0V/vtO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BX0V/vtO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqRfQ4j6mz3bNq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 22:14:38 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17ICEUZ0028106
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 08:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=OjdQHE6phg636zW0qefrkpiR6vbsZHS8/iDVHxe9rkc=;
 b=BX0V/vtOAtvvtRwUzzPDxtmzWxSBaL2HnCwteAnshrkp5zHhIIDYZPct30xjVjC7AuCe
 6Xft1Ar9eU1TtEWfFUqwzgtRzfXSxdzeKNJQSdZycL1RB6psZ8OwS0Kus0lqhG6RMF+I
 FNDUe3Cx41SMelC00vmmKPy+PKHK/MUzyZ2vsK/nGWJPkVXRdOOwHmySs0nV/PFNvqc3
 5dxdF31y35l3BX7zXmh06eHkT2ldn6DDyVS/KPTmZiDbG2/oOkvmDaGXrBk6YNUKz+XD
 rmwZIb8lwBqWyZeSZUWR5If2rOV9qzhkeLaGnOT5f7HnKVUwpRIsNE2EfNAvH04pXTzZ LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agcwwumm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 08:14:35 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17ICEYvC028660
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 08:14:34 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agcwwumkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 08:14:34 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17ICCo2s007764;
 Wed, 18 Aug 2021 12:14:33 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3agh2xh3ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 12:14:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17ICETCo52035906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 12:14:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 935564203F;
 Wed, 18 Aug 2021 12:14:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC7E242045;
 Wed, 18 Aug 2021 12:14:28 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.32.7])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Aug 2021 12:14:28 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v1 2/4] powerpc/64s/perf: add power_pmu_running to query
 whether perf is being used
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1629286381.q658eskbmg.astroid@bobo.none>
Date: Wed, 18 Aug 2021 17:44:26 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <E77714B8-FA08-40D7-96DF-EE86F241DE0B@linux.vnet.ibm.com>
References: <20210816072953.1165964-1-npiggin@gmail.com>
 <20210816072953.1165964-3-npiggin@gmail.com>
 <2e3108d7-8d11-d204-c605-fe51cd361586@linux.ibm.com>
 <1629286381.q658eskbmg.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BVj48sQvJSH-IUVArkqK4c00OJEoZ8fe
X-Proofpoint-ORIG-GUID: j-YUhWYlzEoJPWWYygQ8qlpdjJGSJYsY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_04:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108180076
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-Aug-2021, at 5:11 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Excerpts from Madhavan Srinivasan's message of August 17, 2021 11:06 =
pm:
>>=20
>> On 8/16/21 12:59 PM, Nicholas Piggin wrote:
>>> Interrupt handling code would like to know whether perf is enabled, =
to
>>> know whether it should enable MSR[EE] to improve PMI coverage.
>>>=20
>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>  arch/powerpc/include/asm/hw_irq.h |  2 ++
>>>  arch/powerpc/perf/core-book3s.c   | 13 +++++++++++++
>>>  2 files changed, 15 insertions(+)
>>>=20
>>> diff --git a/arch/powerpc/include/asm/hw_irq.h =
b/arch/powerpc/include/asm/hw_irq.h
>>> index 21cc571ea9c2..2d5c0d3ccbb6 100644
>>> --- a/arch/powerpc/include/asm/hw_irq.h
>>> +++ b/arch/powerpc/include/asm/hw_irq.h
>>> @@ -306,6 +306,8 @@ static inline bool =
lazy_irq_pending_nocheck(void)
>>>  	return __lazy_irq_pending(local_paca->irq_happened);
>>>  }
>>>=20
>>> +bool power_pmu_running(void);
>>> +
>>>  /*
>>>   * This is called by asynchronous interrupts to conditionally
>>>   * re-enable hard interrupts after having cleared the source
>>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>>> index bb0ee716de91..76114a9afb2b 100644
>>> --- a/arch/powerpc/perf/core-book3s.c
>>> +++ b/arch/powerpc/perf/core-book3s.c
>>> @@ -2380,6 +2380,19 @@ static void perf_event_interrupt(struct =
pt_regs *regs)
>>>  	perf_sample_event_took(sched_clock() - start_clock);
>>>  }
>>>=20
>>> +bool power_pmu_running(void)
>>> +{
>>> +	struct cpu_hw_events *cpuhw;
>>> +
>>> +	/* Could this simply test local_paca->pmcregs_in_use? */
>>> +
>>> +	if (!ppmu)
>>> +		return false;
>>=20
>>=20
>> This covers only when perf platform driver is not registered,
>> but we should also check for MMCR0[32], since pmu sprs can be
>> accessed via sysfs.
>=20
> In that case do they actually do anything with the PMI? I don't think =
it=20
> should matter hopefully.
>=20
> But I do think a lot of this stuff could be cleaned up. We have=20
> pmcs_enabled and ppc_enable_pmcs() in sysfs.c, ppc_set_pmu_inuse(),=20
> ppc_md.enable_pmcs(), reserve_pmc_hardware(), etc and different users=20=

> call different things. We don't consistently disable either, e.g., we=20=

> never disable the H_PERFMON facility after we stop using perf even=20
> though it says that slows down partition switch.

Hi Nick,

I have started looking at understanding the code path and working on it =
to get the code cleaned up.
I will work on posting the patch set for clean up.

Thanks
Athira Rajeev
>=20
> I started to have a look at sorting it out but it looks like a big
> job so would take a bit of time if we want to do it.
>=20
> Thanks,
> Nick

