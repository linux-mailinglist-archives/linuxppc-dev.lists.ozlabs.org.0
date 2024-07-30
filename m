Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 058519413B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 15:56:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PuNNcjoB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYGwq4nt6z3clL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 23:56:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PuNNcjoB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYGw83QFcz3cgW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 23:55:52 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UDtoLC019150;
	Tue, 30 Jul 2024 13:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=U
	LFk8p7FkSFdEWYMyXZ5vqOGoRelcgD0E09oAx8SIME=; b=PuNNcjoBtJG5R3W/U
	oyuKIiVeSxyam/H8GxZSPmJyRKXesorOvrvS19hmYnbIbNiGPisSbkjDz9zHQk/r
	asJlsCf++5ygGslMNmb2oFWvKqKGE/UboE32bM3C4X1+Yjxqdo2cg4MMvxSHo+DK
	h9laMXq1u3/e8ab3nTlABDcOANxeCXq6Gae0Crq/S4Oj5s6hkTT0qCjjlndY8mqK
	ScBJrfpp/aOUnmSC4Y42aW882AL6fpI5uDWSQA77o97gbyPWgV8f0bB0N/RnHTBk
	kubfsPub1U+wAJ0cWs7Mqp9mV+V5Lz0owxtIlgIFofkznVzPc36q1cbEeEalyN2/
	FVz4w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40q074r6cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 13:55:49 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UCpBai009218
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 13:53:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 40ndx2vker-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 13:53:29 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46UDrQTV47251804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 13:53:28 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62FAE2004E
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 13:53:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D22EE20043
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 13:53:25 +0000 (GMT)
Received: from [9.179.1.74] (unknown [9.179.1.74])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 13:53:25 +0000 (GMT)
Message-ID: <140a9a46-7f19-4251-b0f2-add95d168037@linux.ibm.com>
Date: Tue, 30 Jul 2024 19:23:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events power10: Update JSON/events
To: linuxppc-dev@lists.ozlabs.org
References: <20240723052154.96202-1-kjain@linux.ibm.com>
 <CAP-5=fWsQbA-h=_Y_q7z1E7GjCkHE3w-9h-OXu4jLBM3Fag6ag@mail.gmail.com>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <CAP-5=fWsQbA-h=_Y_q7z1E7GjCkHE3w-9h-OXu4jLBM3Fag6ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NNIfuIL5n8wGmkACoI5eU-Tv9fOWvgVp
X-Proofpoint-GUID: NNIfuIL5n8wGmkACoI5eU-Tv9fOWvgVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407300095
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/23/24 21:32, Ian Rogers wrote:
> On Mon, Jul 22, 2024 at 10:27 PM Kajol Jain <kjain@linux.ibm.com> wrote:
>>
>> Update JSON/events for power10 platform with additional events.
>> Also move PM_VECTOR_LD_CMPL event from others.json to
>> frontend.json file.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> Reviewed-by: Ian Rogers <irogers@google.com>

Hi Ian,
  Thanks for reviewing the patch and for all the suggestions. These json
files generated as per internal format defined, I will send a follow-up
patch, if we can move these events.

Thanks,
Kajol Jain

> 
>> ---
>>  .../arch/powerpc/power10/frontend.json        |   5 +
>>  .../arch/powerpc/power10/others.json          | 100 +++++++++++++++++-
>>  2 files changed, 100 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
>> index 5977f5e64212..53660c279286 100644
>> --- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
>> @@ -74,6 +74,11 @@
>>      "EventName": "PM_ISSUE_KILL",
>>      "BriefDescription": "Cycles in which an instruction or group of instructions were cancelled after being issued. This event increments once per occurrence, regardless of how many instructions are included in the issue group."
>>    },
>> +  {
>> +    "EventCode": "0x44054",
>> +    "EventName": "PM_VECTOR_LD_CMPL",
>> +    "BriefDescription": "Vector load instruction completed."
>> +  },
>>    {
>>      "EventCode": "0x44056",
>>      "EventName": "PM_VECTOR_ST_CMPL",
>> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
>> index fcf8a8ebe7bd..53ca610152fa 100644
>> --- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
> 
> The "topic" of an event is taken from the filename, here the topic
> will be "others".
> 
>> @@ -94,11 +94,6 @@
>>      "EventName": "PM_L1_ICACHE_RELOADED_ALL",
>>      "BriefDescription": "Counts all instruction cache reloads includes demand, prefetch, prefetch turned into demand and demand turned into prefetch."
>>    },
>> -  {
>> -    "EventCode": "0x44054",
>> -    "EventName": "PM_VECTOR_LD_CMPL",
>> -    "BriefDescription": "Vector load instruction completed."
>> -  },
>>    {
>>      "EventCode": "0x4D05E",
>>      "EventName": "PM_BR_CMPL",
>> @@ -108,5 +103,100 @@
>>      "EventCode": "0x400F0",
>>      "EventName": "PM_LD_DEMAND_MISS_L1_FIN",
>>      "BriefDescription": "Load missed L1, counted at finish time."
>> +  },
>> +  {
>> +    "EventCode": "0x00000038BC",
>> +    "EventName": "PM_ISYNC_CMPL",
>> +    "BriefDescription": "Isync completion count per thread."
>> +  },
>> +  {
>> +    "EventCode": "0x000000C088",
>> +    "EventName": "PM_LD0_32B_FIN",
>> +    "BriefDescription": "256-bit load finished in the LD0 load execution unit."
>> +  },
>> +  {
>> +    "EventCode": "0x000000C888",
>> +    "EventName": "PM_LD1_32B_FIN",
>> +    "BriefDescription": "256-bit load finished in the LD1 load execution unit."
>> +  },
>> +  {
>> +    "EventCode": "0x000000C090",
>> +    "EventName": "PM_LD0_UNALIGNED_FIN",
>> +    "BriefDescription": "Load instructions in LD0 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline using the load gather buffer. This typically adds about 10 cycles to the latency of the instruction. This includes loads that cross the 128 byte boundary, octword loads that are not aligned, and a special forward progress case of a load that does not hit in the L1 and crosses the 32 byte boundary and is launched NTC. Counted at finish time."
>> +  },
>> +  {
>> +    "EventCode": "0x000000C890",
>> +    "EventName": "PM_LD1_UNALIGNED_FIN",
>> +    "BriefDescription": "Load instructions in LD1 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline using the load gather buffer. This typically adds about 10 cycles to the latency of the instruction. This includes loads that cross the 128 byte boundary, octword loads that are not aligned, and a special forward progress case of a load that does not hit in the L1 and crosses the 32 byte boundary and is launched NTC. Counted at finish time."
>> +  },
>> +  {
>> +    "EventCode": "0x000000C0A4",
>> +    "EventName": "PM_ST0_UNALIGNED_FIN",
>> +    "BriefDescription": "Store instructions in ST0 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline. This typically adds about 10 cycles to the latency of the instruction. This only includes stores that cross the 128 byte boundary. Counted at finish time."
>> +  },
>> +  {
>> +    "EventCode": "0x000000C8A4",
>> +    "EventName": "PM_ST1_UNALIGNED_FIN",
>> +    "BriefDescription": "Store instructions in ST1 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline. This typically adds about 10 cycles to the latency of the instruction. This only includes stores that cross the 128 byte boundary. Counted at finish time."
>> +  },
>> +  {
>> +    "EventCode": "0x000000C8B8",
>> +    "EventName": "PM_STCX_SUCCESS_CMPL",
>> +    "BriefDescription": "STCX instructions that completed successfully. Specifically, counts only when a pass status is returned from the nest."
>> +  },
>> +  {
>> +    "EventCode": "0x000000D0B4",
>> +    "EventName": "PM_DC_PREF_STRIDED_CONF",
>> +    "BriefDescription": "A demand load referenced a line in an active strided prefetch stream. The stream could have been allocated through the hardware prefetch mechanism or through software."
>> +  },
>> +  {
>> +    "EventCode": "0x000000F880",
>> +    "EventName": "PM_SNOOP_TLBIE_CYC",
>> +    "BriefDescription": "Cycles in which TLBIE snoops are executed in the LSU."
>> +  },
> 
> Perhaps the topics here should be memory or translation?
> 
>> +  {
>> +    "EventCode": "0x000000F084",
>> +    "EventName": "PM_SNOOP_TLBIE_CACHE_WALK_CYC",
>> +    "BriefDescription": "TLBIE snoop cycles in which the data cache is being walked."
>> +  },
>> +  {
>> +    "EventCode": "0x000000F884",
>> +    "EventName": "PM_SNOOP_TLBIE_WAIT_ST_CYC",
>> +    "BriefDescription": "TLBIE snoop cycles in which older stores are still draining."
>> +  },
>> +  {
>> +    "EventCode": "0x000000F088",
>> +    "EventName": "PM_SNOOP_TLBIE_WAIT_LD_CYC",
>> +    "BriefDescription": "TLBIE snoop cycles in which older loads are still draining."
>> +  },
>> +  {
>> +    "EventCode": "0x000000F08C",
>> +    "EventName": "PM_SNOOP_TLBIE_WAIT_MMU_CYC",
>> +    "BriefDescription": "TLBIE snoop cycles in which the Load-Store unit is waiting for the MMU to finish invalidation."
>> +  },
>> +  {
>> +    "EventCode": "0x0000004884",
>> +    "EventName": "PM_NO_FETCH_IBUF_FULL_CYC",
>> +    "BriefDescription": "Cycles in which no instructions are fetched because there is no room in the instruction buffers."
>> +  },
>> +  {
>> +    "EventCode": "0x00000048B4",
>> +    "EventName": "PM_BR_TKN_UNCOND_FIN",
>> +    "BriefDescription": "An unconditional branch finished. All unconditional branches are taken."
> 
> I see PM_BR_TAKEN_CMPL in
> tools/perf/pmu-events/arch/powerpc/power10/frontend.json, so maybe it
> makes sense to put this event in that topic?
> 
> Thanks,
> Ian
> 
>> +  },
>> +  {
>> +    "EventCode": "0x0B0000016080",
>> +    "EventName": "PM_L2_TLBIE_SLBIE_START",
>> +    "BriefDescription": "NCU Master received a TLBIE/SLBIEG/SLBIAG operation from the core. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
>> +  },
>> +  {
>> +    "EventCode": "0x0B0000016880",
>> +    "EventName": "PM_L2_TLBIE_SLBIE_DELAY",
>> +    "BriefDescription": "Cycles when a TLBIE/SLBIEG/SLBIAG command was held in a hottemp condition by the NCU Master. Multiply this count by 1000 to obtain the total number of cycles. This can be divided by PM_L2_TLBIE_SLBIE_SENT to obtain the average time a TLBIE/SLBIEG/SLBIAG command was held. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
>> +  },
>> +  {
>> +    "EventCode": "0x0B0000026880",
>> +    "EventName": "PM_L2_SNP_TLBIE_SLBIE_DELAY",
>> +    "BriefDescription": "Cycles when a TLBIE/SLBIEG/SLBIAG that targets this thread's LPAR was in flight while in a hottemp condition. Multiply this count by 1000 to obtain the total number of cycles. This can be divided by PM_L2_SNP_TLBIE_SLBIE_START to obtain the overall efficiency. Note: ’inflight’ means SnpTLB has been sent to core(ie doesn’t include when SnpTLB is in NCU waiting to be launched serially behind different SnpTLB). The NCU Snooper gets in a ’hottemp’ delay window when it detects it is above its TLBIE/SLBIE threshold for process SnpTLBIE/SLBIE with this core. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
>>    }
>>  ]
>> --
>> 2.43.0
>>
