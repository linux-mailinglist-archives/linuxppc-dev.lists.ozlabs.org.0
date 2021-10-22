Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A93B43707B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 05:34:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb92j3hVjz3cV0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 14:34:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IDfTqYx1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IDfTqYx1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb91r4Ksrz3c7Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 14:34:07 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19LNC7sQ019339; 
 Thu, 21 Oct 2021 23:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=A8qishCLp2XQVLZXv2EJy9qR/+oD0bIUWUAsfSR5OLA=;
 b=IDfTqYx1PdBIlbF9TEFC216YmREEZaoJZ5oVbWLLnm43FPFqvxz5kiTrFDvLEEPtcFTP
 19J0Mja8/oBceJ8zmwxG30V7Zqe4qcR28O4w8hG9Juk1i/Dxy7R5uIm3pmSY7JLcuguE
 svbcrGO6zHNyZxSe5SviOKh2qU9/c0zU2zS/2AXCVj/eTSurf+WjU8LiH11cb5Sj8e+F
 siTGVQ+QBngXtCpzzObPd3gbgE6ksCDUmvGP1D3W6DfH87DLWhxAqmyUFViiK23TCuBz
 6PIlJI1tXBAL/X0FwE6TesnTn1V6iQQxU0r1vcR5vAuVG/6RMB3HkFmNESlOEtEQAvxf DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3buep4f6dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 23:34:00 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19M3Y0YG016766;
 Thu, 21 Oct 2021 23:34:00 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3buep4f6d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 23:34:00 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19M3S6BW007362;
 Fri, 22 Oct 2021 03:33:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3bqpcc94pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 03:33:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19M3S0eI57803110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Oct 2021 03:28:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8FDC52057;
 Fri, 22 Oct 2021 03:33:54 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.43.55.190])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9076252050;
 Fri, 22 Oct 2021 03:33:52 +0000 (GMT)
Subject: Re: [PATCH V2] powerpc/perf: Enable PMU counters post partition
 migration if PMU is active
To: Nathan Lynch <nathanl@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1626006357-1611-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1634812863.5e9oss88pa.astroid@bobo.none> <87ilxqxoxy.fsf@linux.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <bbaa577d-b5ef-47f7-a119-7782008a9d8b@linux.ibm.com>
Date: Fri, 22 Oct 2021 09:03:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87ilxqxoxy.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eXN9a3yUs0IV4YBM4fJMpcuCbwaCrQWM
X-Proofpoint-ORIG-GUID: nOsGwRJv83_RvxRKJN8CQ2fBf_Sfsi_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_01,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110220019
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
Cc: kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/21/21 11:03 PM, Nathan Lynch wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Athira Rajeev's message of July 11, 2021 10:25 pm:
>>> During Live Partition Migration (LPM), it is observed that perf
>>> counter values reports zero post migration completion. However
>>> 'perf stat' with workload continues to show counts post migration
>>> since PMU gets disabled/enabled during sched switches. But incase
>>> of system/cpu wide monitoring, zero counts were reported with 'perf
>>> stat' after migration completion.
>>>
>>> Example:
>>>   ./perf stat -e r1001e -I 1000
>>>             time             counts unit events
>>>       1.001010437         22,137,414      r1001e
>>>       2.002495447         15,455,821      r1001e
>>> <<>> As seen in next below logs, the counter values shows zero
>>>          after migration is completed.
>>> <<>>
>>>      86.142535370    129,392,333,440      r1001e
>>>      87.144714617                  0      r1001e
>>>      88.146526636                  0      r1001e
>>>      89.148085029                  0      r1001e
>>>
>>> Here PMU is enabled during start of perf session and counter
>>> values are read at intervals. Counters are only disabled at the
>>> end of session. The powerpc mobility code presently does not handle
>>> disabling and enabling back of PMU counters during partition
>>> migration. Also since the PMU register values are not saved/restored
>>> during migration, PMU registers like Monitor Mode Control Register 0
>>> (MMCR0), Monitor Mode Control Register 1 (MMCR1) will not contain
>>> the value it was programmed with. Hence PMU counters will not be
>>> enabled correctly post migration.
>>>
>>> Fix this in mobility code by handling disabling and enabling of
>>> PMU in all cpu's before and after migration. Patch introduces two
>>> functions 'mobility_pmu_disable' and 'mobility_pmu_enable'.
>>> mobility_pmu_disable() is called before the processor threads goes
>>> to suspend state so as to disable the PMU counters. And disable is
>>> done only if there are any active events running on that cpu.
>>> mobility_pmu_enable() is called after the processor threads are
>>> back online to enable back the PMU counters.
>>>
>>> Since the performance Monitor counters ( PMCs) are not
>>> saved/restored during LPM, results in PMC value being zero and the
>>> 'event->hw.prev_count' being non-zero value. This causes problem
>> Interesting. Are they defined to not be migrated, or may not be
>> migrated?
> PAPR may be silent on this... at least I haven't found anything yet. But
> I'm not very familiar with perf counters.

IIUC, from the internal discussion with pHYP, migration of counters is 
OS thing.

> How much assurance do we have that hardware events we've programmed on
> the source can be reliably re-enabled on the destination, with the same
> semantics? Aren't there some model-specific counters that don't make
> sense to handle this way?

migration to same generation processor/model should be ok
but not to the different generation/model (but it is a case
to handle). That said, this patch is to fix the issue of large
value seen when migrating.

>
>
>>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>>> index 9dc97d2..cea72d7 100644
>>> --- a/arch/powerpc/include/asm/rtas.h
>>> +++ b/arch/powerpc/include/asm/rtas.h
>>> @@ -380,5 +380,13 @@ static inline void rtas_initialize(void) { }
>>>   static inline void read_24x7_sys_info(void) { }
>>>   #endif
>>>   
>>> +#ifdef CONFIG_PPC_PERF_CTRS
>>> +void mobility_pmu_disable(void);
>>> +void mobility_pmu_enable(void);
>>> +#else
>>> +static inline void mobility_pmu_disable(void) { }
>>> +static inline void mobility_pmu_enable(void) { }
>>> +#endif
>>> +
>>>   #endif /* __KERNEL__ */
>>>   #endif /* _POWERPC_RTAS_H */
>> It's not implemented in rtas, maybe consider putting this into a perf
>> header?
> +1
>
