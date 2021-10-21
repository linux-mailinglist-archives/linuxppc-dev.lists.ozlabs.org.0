Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA28443691C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 19:34:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZvk11SBRz3cN9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 04:34:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gQIaWRsR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gQIaWRsR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZvjG5NGPz305Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 04:33:53 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19LH8Oks002898; 
 Thu, 21 Oct 2021 13:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=uqOtx07YAq3etwbwfWQmgY5qHozEqbmjZoppx2DBxow=;
 b=gQIaWRsRxuW3OLPxZ3cCNLIunOUr9BPFqLmUMNHTXLL3Td8lO25geibJtiIOPqCgz/vF
 WDDyetHuc4uCzvlviLU1bnKgdjn7f0xh47g9j8RK3NIcW0MnP7970Nz9WX1IrLlRb8lH
 xA/bvAxhV1EkG2eAlP0FW5r1eSsvBEj21ko7QENBaj0qW5IZxZQvDYaTlvw7aHzlhZ5u
 bplANBYEnmIAVU/OXgWWhZLZMOxT2Mfjvs2E55CFBHg3eldn3HRdiMm0FfFf4FzBJF+V
 dtG5Lu65x4o8YUrYzGVjDqYywZoV0y5n11qNZJQXRlc8zjfeXjhktDCk1QsCUcWfPAnj ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bub81acff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 13:33:49 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19LH15um001154;
 Thu, 21 Oct 2021 13:33:48 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bub81acf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 13:33:48 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19LHI3hg024015;
 Thu, 21 Oct 2021 17:33:47 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3bqpccjq2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 17:33:47 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19LHXk2r28508632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 17:33:46 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0B6713605E;
 Thu, 21 Oct 2021 17:33:45 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0025136060;
 Thu, 21 Oct 2021 17:33:45 +0000 (GMT)
Received: from localhost (unknown [9.211.157.242])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 21 Oct 2021 17:33:45 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH V2] powerpc/perf: Enable PMU counters post partition
 migration if PMU is active
In-Reply-To: <1634812863.5e9oss88pa.astroid@bobo.none>
References: <1626006357-1611-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1634812863.5e9oss88pa.astroid@bobo.none>
Date: Thu, 21 Oct 2021 12:33:45 -0500
Message-ID: <87ilxqxoxy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Dfle4MH4S-Yzomkg22-Q4ATziAfcBIEY
X-Proofpoint-GUID: xnQGSSwvuvsMZOjAbShX9T_VmVHLhI3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_04,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=906
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110210087
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Athira Rajeev's message of July 11, 2021 10:25 pm:
>> During Live Partition Migration (LPM), it is observed that perf
>> counter values reports zero post migration completion. However
>> 'perf stat' with workload continues to show counts post migration
>> since PMU gets disabled/enabled during sched switches. But incase
>> of system/cpu wide monitoring, zero counts were reported with 'perf
>> stat' after migration completion.
>> 
>> Example:
>>  ./perf stat -e r1001e -I 1000
>>            time             counts unit events
>>      1.001010437         22,137,414      r1001e
>>      2.002495447         15,455,821      r1001e
>> <<>> As seen in next below logs, the counter values shows zero
>>         after migration is completed.
>> <<>>
>>     86.142535370    129,392,333,440      r1001e
>>     87.144714617                  0      r1001e
>>     88.146526636                  0      r1001e
>>     89.148085029                  0      r1001e
>> 
>> Here PMU is enabled during start of perf session and counter
>> values are read at intervals. Counters are only disabled at the
>> end of session. The powerpc mobility code presently does not handle
>> disabling and enabling back of PMU counters during partition
>> migration. Also since the PMU register values are not saved/restored
>> during migration, PMU registers like Monitor Mode Control Register 0
>> (MMCR0), Monitor Mode Control Register 1 (MMCR1) will not contain
>> the value it was programmed with. Hence PMU counters will not be
>> enabled correctly post migration.
>> 
>> Fix this in mobility code by handling disabling and enabling of
>> PMU in all cpu's before and after migration. Patch introduces two
>> functions 'mobility_pmu_disable' and 'mobility_pmu_enable'.
>> mobility_pmu_disable() is called before the processor threads goes
>> to suspend state so as to disable the PMU counters. And disable is
>> done only if there are any active events running on that cpu.
>> mobility_pmu_enable() is called after the processor threads are
>> back online to enable back the PMU counters.
>> 
>> Since the performance Monitor counters ( PMCs) are not
>> saved/restored during LPM, results in PMC value being zero and the
>> 'event->hw.prev_count' being non-zero value. This causes problem
>
> Interesting. Are they defined to not be migrated, or may not be 
> migrated?

PAPR may be silent on this... at least I haven't found anything yet. But
I'm not very familiar with perf counters.

How much assurance do we have that hardware events we've programmed on
the source can be reliably re-enabled on the destination, with the same
semantics? Aren't there some model-specific counters that don't make
sense to handle this way?


>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>> index 9dc97d2..cea72d7 100644
>> --- a/arch/powerpc/include/asm/rtas.h
>> +++ b/arch/powerpc/include/asm/rtas.h
>> @@ -380,5 +380,13 @@ static inline void rtas_initialize(void) { }
>>  static inline void read_24x7_sys_info(void) { }
>>  #endif
>>  
>> +#ifdef CONFIG_PPC_PERF_CTRS
>> +void mobility_pmu_disable(void);
>> +void mobility_pmu_enable(void);
>> +#else
>> +static inline void mobility_pmu_disable(void) { }
>> +static inline void mobility_pmu_enable(void) { }
>> +#endif
>> +
>>  #endif /* __KERNEL__ */
>>  #endif /* _POWERPC_RTAS_H */
>
> It's not implemented in rtas, maybe consider putting this into a perf 
> header?

+1

