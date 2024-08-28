Return-Path: <linuxppc-dev+bounces-683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87960962519
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:39:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv1Bj3S4sz2ygB;
	Wed, 28 Aug 2024 20:39:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724841597;
	cv=none; b=l+NhzH/L1Jtr61+mm40uJHv1PGhAx06jQElsHnDzGFMKo4qCbu5gLTqOd3+5mtHVNNFRLKmCUymC6DUswtQtcLMcmZSTibcldFMUL4fv2iyDP/i+GAGBlujD3woc9HoNHbEAjDp5DtXezuSwqkEYHECS4wwplC0dSOBRA4zjszXibo0ZX17T+4oEJlq0R4VBXaGyd5wPQzbI1JUd4Gcnq9TGo7OgcwqmUm7UAPrthDJPQEubkwBM6rdZQiHFAVkvTcxOgT3vIw6Fut7JcIuSn9CMyMKC7a881+eRuQUH0F7Ob8mPin05L+dWK9QYbd/0GMGv/goWxa9XwCvalfd7XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724841597; c=relaxed/relaxed;
	bh=Dqi/bjjpKWWI81s91WHaD7aZLkRMpDLLY8cSHktKSYM=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=MItd4lLOQmGOk2Ciwyp0P4sZDG/3ETu+cNzMbPkMZp2xhknsThfbXVy69bILkkQYv8jbx0MyIWkIIx9nqWxEHr8MaGUQrviYNsxooREx/jQKqNc/5hj8Tq0mUL47JS1H9Mvw21xluSbPRmhu61ursMLaTA8MYO+rux8uGgShEEViFx+s36Z6asnEBUp46Cwp3+HNuhPU0YJ7XgYkW7miOtjFv7F0mLDqFJHbv3dOHIg0GbeLw0kjjts3H3VhCf+UEDLwXuHI+O21XTcIqvrg+HmESA3G0Wz1+RaT7kcekxx299H69G6em3W0vzeeorpG5eHY7vggdXnp7ij8CgPUIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V1o5oMWR; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V1o5oMWR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv1Bj0QjJz2yZ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:39:56 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RM3gOi032469;
	Wed, 28 Aug 2024 10:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=D
	qi/bjjpKWWI81s91WHaD7aZLkRMpDLLY8cSHktKSYM=; b=V1o5oMWRr7qBMnt1y
	+Wl1fOWH4Snlyu+bK/wb3K1JK7B5QPTASYdt7OZkkjn8boGA/GM7sLhrmwzYuo1a
	OZZGgyXfz+O/fl8iJfUojSoYrOXKgMsSQy68l8PF5n/AD/BSEAJA0XJgkiOg0Fw+
	Ixe84HjX7yKva9haDv9PKRFyhiQBfJLZGzAGWHv/+XRPYSZ1V+zDbTjGBa1tBTBH
	VdzuMoIcRWf5D/Y5pWMCIKu+5KRMqfDHTyj+CNA1wD7sY2MnqZOGCjPQaOukWyNT
	5X/21bEdYZY36DDCwkuZemtqU/p3a3z+Ce/XV7se0i4eFGBYqZEnIx/JANwEER0r
	Kk8RA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8u29sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 10:39:44 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47SAcYSg023254;
	Wed, 28 Aug 2024 10:39:44 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8u29sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 10:39:44 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47S8N1Qg021752;
	Wed, 28 Aug 2024 10:39:43 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 417suufd3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 10:39:43 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47SAdeCE46268678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2024 10:39:40 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 408722004E;
	Wed, 28 Aug 2024 10:39:40 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CBAB20040;
	Wed, 28 Aug 2024 10:39:38 +0000 (GMT)
Received: from [9.171.52.187] (unknown [9.171.52.187])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Aug 2024 10:39:37 +0000 (GMT)
Message-ID: <0b84b538-e40c-4e93-9bb4-33e5a2f1e09c@linux.ibm.com>
Date: Wed, 28 Aug 2024 16:09:26 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] perf vendor events power10: Update JSON/events
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
        hbathini@linux.ibm.com, disgoel@linux.vnet.ibm.com
References: <20240827053206.538814-1-kjain@linux.ibm.com>
 <CAP-5=fWBjt3pypEwEsbKsuNTqX+ZA7v9WbNJCUgc09xxF=pt1A@mail.gmail.com>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <CAP-5=fWBjt3pypEwEsbKsuNTqX+ZA7v9WbNJCUgc09xxF=pt1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 78gOJYNIXuVW2o2rUE5A5ejV4_VXH6_8
X-Proofpoint-ORIG-GUID: J3ULAgdu2pbosU0P-8ecZO2-pFUV93Rr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280076



On 8/27/24 21:00, Ian Rogers wrote:
> On Mon, Aug 26, 2024 at 10:33 PM Kajol Jain <kjain@linux.ibm.com> wrote:
>>
>> Update JSON/events for power10 platform with additional events.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> For the series:
> Reviewed-by: Ian Rogers <irogers@google.com>

Hi Ian,
Thanks for reviewing the patchset.

> 
> Just to note, the moving of events in patches 2 and 3 is necessary as
> the filename sets the "topic" in perf list. I'm not sure the whole
> "topic" thing makes total sense and we may want to revisit it at some
> date. For example, AMD generally put the topic into the event name,
> the PMU gives a strong hint of "topic", etc.

In my opinion, having topic helps in understanding the area to which
given event belongs. And since we have multiple event categories in case
of core PMU, Just having PMU name may not not sufficient.
I will check further on adding topic to event name(which AMD is using),
my concern is it will increase the event name size. As we already have
bigger event names.

But may be rather then picking topic from file name, we can add one
separate field to define the topic in json and use that instead?

Thanks,
Kajol Jain

> 
> Thanks,
> Ian
> 
>> ---
>>  .../arch/powerpc/power10/datasource.json      | 25 +++++++++++++++++++
>>  .../arch/powerpc/power10/frontend.json        | 10 ++++++++
>>  .../pmu-events/arch/powerpc/power10/pmc.json  |  5 ++++
>>  3 files changed, 40 insertions(+)
>>
>> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
>> index 0eeaaf1a95b8..283284745d9c 100644
>> --- a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
>> @@ -14,6 +14,31 @@
>>      "EventName": "PM_DATA_FROM_MEMORY",
>>      "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss."
>>    },
>> +  {
>> +    "EventCode": "0x0000004080",
>> +    "EventName": "PM_INST_FROM_L1",
>> +    "BriefDescription": "An instruction fetch hit in the L1. Each fetch group contains 8 instructions. The same line can hit 4 times if 32 sequential instructions are fetched."
>> +  },
>> +  {
>> +    "EventCode": "0x000000026080",
>> +    "EventName": "PM_L2_LD_MISS",
>> +    "BriefDescription": "All successful D-Side Load dispatches for this thread that missed in the L2. Since the event happens in a 2:1 clock domain and is time-sliced across all 4 threads, the event count should be multiplied by 2."
>> +  },
>> +  {
>> +    "EventCode": "0x000000026880",
>> +    "EventName": "PM_L2_ST_MISS",
>> +    "BriefDescription": "All successful D-Side Store dispatches for this thread that missed in the L2. Since the event happens in a 2:1 clock domain and is time-sliced across all 4 threads, the event count should be multiplied by 2."
>> +  },
>> +  {
>> +    "EventCode": "0x010000046880",
>> +    "EventName": "PM_L2_ST_HIT",
>> +    "BriefDescription": "All successful D-side store dispatches for this thread that were L2 hits. Since the event happens in a 2:1 clock domain and is time-sliced across all 4 threads, the event count should be multiplied by 2."
>> +  },
>> +  {
>> +    "EventCode": "0x000000036880",
>> +    "EventName": "PM_L2_INST_MISS",
>> +    "BriefDescription": "All successful instruction (demand and prefetch) dispatches for this thread that missed in the L2. Since the event happens in a 2:1 clock domain and is time-sliced across all 4 threads, the event count should be multiplied by 2."
>> +  },
>>    {
>>      "EventCode": "0x000300000000C040",
>>      "EventName": "PM_INST_FROM_L2",
>> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
>> index 53660c279286..456971f60814 100644
>> --- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
>> @@ -93,5 +93,15 @@
>>      "EventCode": "0x400FC",
>>      "EventName": "PM_ITLB_MISS",
>>      "BriefDescription": "Instruction TLB reload (after a miss), all page sizes. Includes only demand misses."
>> +  },
>> +  {
>> +    "EventCode": "0x00000040B8",
>> +    "EventName": "PM_PRED_BR_TKN_COND_DIR",
>> +    "BriefDescription": "A conditional branch finished with correctly predicted direction. Resolved taken."
>> +  },
>> +  {
>> +    "EventCode": "0x00000048B8",
>> +    "EventName": "PM_PRED_BR_NTKN_COND_DIR",
>> +    "BriefDescription": "A conditional branch finished with correctly predicted direction. Resolved not taken."
>>    }
>>  ]
>> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
>> index 0e0253d0e757..04732698d9b2 100644
>> --- a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
>> @@ -104,6 +104,11 @@
>>      "EventName": "PM_RUN_CYC",
>>      "BriefDescription": "Processor cycles gated by the run latch."
>>    },
>> +  {
>> +    "EventCode": "0x200F8",
>> +    "EventName": "PM_EXT_INT",
>> +    "BriefDescription": "Cycles an external interrupt was active."
>> +  },
>>    {
>>      "EventCode": "0x30010",
>>      "EventName": "PM_PMC2_OVERFLOW",
>> --
>> 2.43.5
>>

