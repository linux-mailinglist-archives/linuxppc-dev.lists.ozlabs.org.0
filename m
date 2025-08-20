Return-Path: <linuxppc-dev+bounces-11161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D24C5B2D5AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Aug 2025 10:09:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6JyW1YGdz2yZ6;
	Wed, 20 Aug 2025 18:09:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755677379;
	cv=none; b=Zzf2bM3YrrLXX/B3ew3mcdWguy3oMeTwBAUCB8oQMM3kbUMSjZoQCIr6jbeMQ7+Bxv1eC5OC+mxid42RFdPqdKTsq72rZ425C/wPOUVl7q9xdwYPCyI+e5hTq+m+QbKRxbeR/XuZ9+9nqabkPGMeYa5mvVQfJKEgHVoTXjQrhPF1x02iETcsqMGOGEhSI8jRhR1BnB4M9R7v0iMS2o9iKvBjHFU2zxlvgpmdylZ8geLqFPf1SpHSjYajah7n5W0I5G4yrqmgoWBYzVrx53lQvVKQ1RJbssxX52dWeWcL/RbJ553pCHJ6hXfAfnMJMtfib83sLa+utsVEHySJvtjdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755677379; c=relaxed/relaxed;
	bh=XyEp7PB6Crc5O/n3hDpRBdclhiXWepi7f2DlP7ISOnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmzrK7e3VWcW0sV7LEIKRJQbkQ1EVvuuTpdXwHx6iiYcNwJzSB5RhMvSKRO0B/s/LgDM/5ZBYCz0og1qrd1xnhqoPgjoheywFCQHW6P4naLOhvbtelUVtURZg44fYw7SvbJox3Y+vwUpa8AIC4ryp0tQEHXBtxQCkBKQUKLga3r+92IA4z9QmXgepICCqMiUFiV6NQbuVVyShtK/ykogu4bLJ9tOBqWCv4g2BWyl+hBPuTRUSsVOMv37EN3rn/vttkTy/aSS/pDZItvS2A681yhOR3eruy9hMV0xdbRFJ0QI18PQmQBa03mQJODApc2RriPpIWbt/3loS2/3zpPluw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xixm2oi8; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tmricht@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xixm2oi8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tmricht@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6JyV1klfz2xQt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 18:09:37 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JNmmLo017631;
	Wed, 20 Aug 2025 08:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XyEp7P
	B6Crc5O/n3hDpRBdclhiXWepi7f2DlP7ISOnE=; b=Xixm2oi8D/e/+wAITPeDp3
	TALHrRG4EBVti1e3wM1Z6LnCfvINBVfhRGmgOPkipNfgbFhBD0MWSeZRRuGZ/NN+
	NKDq98HPciL4Zozeql4srzji2nvV3CzcZ3UlmCS5mUo4axD1CO9niYr/utY3r3nU
	R/k9YIllh44h9uoNOFLeppTj5ZpJGLc7EDb+zLBQQ5R2NO8ZqfzYF65N+NeIflzl
	gTcYt/B8t87ieiFU691ZjDHQqARPeaX+Fy6nA8Cm30nsgWe9R3Iis8b6CyGL5Xlw
	ovWuvSCaaobgeWwxqiRAGHpZnDDJ13JX7jkAK7240Uso3SZWpw/1sppbNb+XqHPQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48n38vhrww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 08:09:13 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57K89CuX005377;
	Wed, 20 Aug 2025 08:09:12 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48n38vhrwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 08:09:12 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57K4xm2t015619;
	Wed, 20 Aug 2025 08:09:11 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48my422cjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 08:09:11 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57K899B961342160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Aug 2025 08:09:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A734720043;
	Wed, 20 Aug 2025 08:09:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 407A620040;
	Wed, 20 Aug 2025 08:09:08 +0000 (GMT)
Received: from [9.111.5.117] (unknown [9.111.5.117])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 20 Aug 2025 08:09:08 +0000 (GMT)
Message-ID: <295ae4dd-4734-42a0-be63-2d322f00c799@linux.ibm.com>
Date: Wed, 20 Aug 2025 10:09:07 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] perf: Introduce positive capability for raw events
To: Robin Murphy <robin.murphy@arm.com>, peterz@infradead.org,
        mingo@redhat.com, will@kernel.org, mark.rutland@arm.com,
        acme@kernel.org, namhyung@kernel.org,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
        linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
        iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
        linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <cover.1755096883.git.robin.murphy@arm.com>
 <542787fd188ea15ef41c53d557989c962ed44771.1755096883.git.robin.murphy@arm.com>
 <67a0d778-6e2c-4955-a7ce-56a10043ae8d@arm.com>
Content-Language: en-US
From: Thomas Richter <tmricht@linux.ibm.com>
Organization: IBM
In-Reply-To: <67a0d778-6e2c-4955-a7ce-56a10043ae8d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rc1CmpHVUr4PjN6HeVNNaTAKVoWbVX32
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDIyMiBTYWx0ZWRfX4xTzLYCTQsxG
 AGD1we0J4ezItB0ejTfm7DJNuDAARyH4VivdukTDV+G2c134zt0WbxSJSEE76uDxTym3DRzLeZX
 mOf6bUkLRc8HI2z83HLeSrLnCDaUzt6ctsGigqq+Yny6dHl56O82/ysxGcmIZx9UyZO+hyMZvb/
 ecuWa/hbBYOZ6yeacF65qy/00k1eAjO++Mj45cxXjqV85T1khiwKHAStutPkN05LIcWmzIOI2N6
 JcZUW/XH3ZbwPgzY20enHnuM+rxpiC2AXWamVYRgBgnxytZoHYJTbh5BurqPVICmyND/IQHxcAh
 w3J7un0oPnbnMNdQ3B2TA6VUHKYY82ln4UWEvFzI/Jn0XaQRTQr//JuEseTSCgQIqbo5FGoTW85
 ypKOH5UDXA9ip20lItNjpe1wLNO1nQ==
X-Proofpoint-GUID: GZ2wu60A03msHy_JXXsuf0f5WSTi9QT-
X-Authority-Analysis: v=2.4 cv=KPwDzFFo c=1 sm=1 tr=0 ts=68a582a9 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=7CQSdrXTAAAA:8 a=gUTjnckvcJroK4elFEgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=DXsff8QfwkrTrK3sU8N1:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190222
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/19/25 15:15, Robin Murphy wrote:
> On 13/08/2025 6:01 pm, Robin Murphy wrote:
>> Only a handful of CPU PMUs accept PERF_TYPE_{RAW,HARDWARE,HW_CACHE}
>> events without registering themselves as PERF_TYPE_RAW in the first
>> place. Add an explicit opt-in for these special cases, so that we can
>> make life easier for every other driver (and probably also speed up the
>> slow-path search) by having perf_try_init_event() do the basic type
>> checking to cover the majority of cases.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>
>> A further possibility is to automatically add the cap to PERF_TYPE_RAW
>> PMUs in perf_pmu_register() to have a single point-of-use condition; I'm
>> undecided...
>> ---
>>   arch/s390/kernel/perf_cpum_cf.c    |  1 +
>>   arch/s390/kernel/perf_pai_crypto.c |  2 +-
>>   arch/s390/kernel/perf_pai_ext.c    |  2 +-
>>   arch/x86/events/core.c             |  2 +-
>>   drivers/perf/arm_pmu.c             |  1 +
>>   include/linux/perf_event.h         |  1 +
>>   kernel/events/core.c               | 15 +++++++++++++++
>>   7 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/s390/kernel/perf_cpum_cf.c b/arch/s390/kernel/perf_cpum_cf.c
>> index 1a94e0944bc5..782ab755ddd4 100644
>> --- a/arch/s390/kernel/perf_cpum_cf.c
>> +++ b/arch/s390/kernel/perf_cpum_cf.c
>> @@ -1054,6 +1054,7 @@ static void cpumf_pmu_del(struct perf_event *event, int flags)
>>   /* Performance monitoring unit for s390x */
>>   static struct pmu cpumf_pmu = {
>>       .task_ctx_nr  = perf_sw_context,
>> +    .capabilities = PERF_PMU_CAP_RAW_EVENTS,
>>       .pmu_enable   = cpumf_pmu_enable,
>>       .pmu_disable  = cpumf_pmu_disable,
>>       .event_init   = cpumf_pmu_event_init,
>> diff --git a/arch/s390/kernel/perf_pai_crypto.c b/arch/s390/kernel/perf_pai_crypto.c
>> index a64b6b056a21..b5b6d8b5d943 100644
>> --- a/arch/s390/kernel/perf_pai_crypto.c
>> +++ b/arch/s390/kernel/perf_pai_crypto.c
>> @@ -569,7 +569,7 @@ static const struct attribute_group *paicrypt_attr_groups[] = {
>>   /* Performance monitoring unit for mapped counters */
>>   static struct pmu paicrypt = {
>>       .task_ctx_nr  = perf_hw_context,
>> -    .capabilities = PERF_PMU_CAP_SAMPLING,
>> +    .capabilities = PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
>>       .event_init   = paicrypt_event_init,
>>       .add          = paicrypt_add,
>>       .del          = paicrypt_del,
>> diff --git a/arch/s390/kernel/perf_pai_ext.c b/arch/s390/kernel/perf_pai_ext.c
>> index 1261f80c6d52..bcd28c38da70 100644
>> --- a/arch/s390/kernel/perf_pai_ext.c
>> +++ b/arch/s390/kernel/perf_pai_ext.c
>> @@ -595,7 +595,7 @@ static const struct attribute_group *paiext_attr_groups[] = {
>>   /* Performance monitoring unit for mapped counters */
>>   static struct pmu paiext = {
>>       .task_ctx_nr  = perf_hw_context,
>> -    .capabilities = PERF_PMU_CAP_SAMPLING,
>> +    .capabilities = PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
>>       .event_init   = paiext_event_init,
>>       .add          = paiext_add,
>>       .del          = paiext_del,
>> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
>> index 789dfca2fa67..764728bb80ae 100644
>> --- a/arch/x86/events/core.c
>> +++ b/arch/x86/events/core.c
>> @@ -2697,7 +2697,7 @@ static bool x86_pmu_filter(struct pmu *pmu, int cpu)
>>   }
>>     static struct pmu pmu = {
>> -    .capabilities        = PERF_PMU_CAP_SAMPLING,
>> +    .capabilities        = PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
>>         .pmu_enable        = x86_pmu_enable,
>>       .pmu_disable        = x86_pmu_disable,
>> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
>> index 72d8f38d0aa5..bc772a3bf411 100644
>> --- a/drivers/perf/arm_pmu.c
>> +++ b/drivers/perf/arm_pmu.c
>> @@ -877,6 +877,7 @@ struct arm_pmu *armpmu_alloc(void)
>>            * specific PMU.
>>            */
>>           .capabilities    = PERF_PMU_CAP_SAMPLING |
>> +                  PERF_PMU_CAP_RAW_EVENTS |
>>                     PERF_PMU_CAP_EXTENDED_REGS |
>>                     PERF_PMU_CAP_EXTENDED_HW_TYPE,
>>       };
>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>> index 183b7c48b329..c6ad036c0037 100644
>> --- a/include/linux/perf_event.h
>> +++ b/include/linux/perf_event.h
>> @@ -305,6 +305,7 @@ struct perf_event_pmu_context;
>>   #define PERF_PMU_CAP_EXTENDED_HW_TYPE    0x0100
>>   #define PERF_PMU_CAP_AUX_PAUSE        0x0200
>>   #define PERF_PMU_CAP_AUX_PREFER_LARGE    0x0400
>> +#define PERF_PMU_CAP_RAW_EVENTS        0x0800
>>     /**
>>    * pmu::scope
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index 71b2a6730705..2ecee76d2ae2 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -12556,11 +12556,26 @@ static inline bool has_extended_regs(struct perf_event *event)
>>              (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK);
>>   }
>>   +static bool is_raw_pmu(const struct pmu *pmu)
>> +{
>> +    return pmu->type == PERF_TYPE_RAW ||
>> +           pmu->capabilities & PERF_PMU_CAP_RAW_EVENTS;
>> +}
>> +
>>   static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
>>   {
>>       struct perf_event_context *ctx = NULL;
>>       int ret;
>>   +    /*
>> +     * Before touching anything, we can safely skip:
>> +     * - any event for a specific PMU which is not this one
>> +     * - any common event if this PMU doesn't support them
>> +     */
>> +    if (event->attr.type != pmu->type &&
>> +        (event->attr.type >= PERF_TYPE_MAX || is_raw_pmu(pmu)))
> 
> Ah, that should be "!is_raw_pmu(pmu)" there (although it's not entirely the cause of the LKP report on the final patch.)
> 
> Thanks,
> Robin.
> 
>> +        return -ENOENT;
>> +
>>       if (!try_module_get(pmu->module))
>>           return -ENODEV;
>>   
> 
> 

Hi Robin,

what is the intention of that patch?
Can you explain that a bit more.

Thanks.

-- 
Thomas Richter, Dept 3303, IBM s390 Linux Development, Boeblingen, Germany
--
IBM Deutschland Research & Development GmbH

Vorsitzender des Aufsichtsrats: Wolfgang Wendt

Geschäftsführung: David Faller

Sitz der Gesellschaft: Böblingen / Registergericht: Amtsgericht Stuttgart, HRB 243294

