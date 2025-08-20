Return-Path: <linuxppc-dev+bounces-11162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D935B2DB49
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Aug 2025 13:40:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6PdW01Spz2yrT;
	Wed, 20 Aug 2025 21:40:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755690014;
	cv=none; b=SrEcaV/P4oADmd8YZNBXdhz05xwJbTLrTDwQOT+7YS2IjMvi2fY6Ousp8xV8K8I5gPe9cKt6FSbOj8qejTXfVoNedzCFah6Pjdiw6FSl1mJw6TAVQE9chLDniapJStD5kP3UBUBqKn3PqVClUBdpHD3AUvyeTeGzInAyHzsHilmADJJ5xO095McDniLwCCw7yj2ReW56ogrD6SSDGdsAKrXESY/nqNFt8hV5vS6zkHVW8u4ZjlesWFY6dzVR6oStlwef4wt+4RIzkZLQG1EbgjIJf8cSDzGG2cJZj9EaWaAVTCxxWtWr7BllMQC6nBym2HkAc5Pl0yewL3eJPeJgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755690014; c=relaxed/relaxed;
	bh=mXg2wlVP07nkY0m0faJrhm5x10kWJol+RAR7mEJwJQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ea0ztg5YTpJkjrWw3q+J3kK6x8mPkDRG4+BvaAII3wU4Ipk6FFnnrIHQOcyHrgSRNWIdrq7Ck/hiT15gcUVz5yrlHKpr7Yz5AChj1FqpY93TS6IP9GwmfRiEE3TZSkzFNMde+0qgZJvncwPg0ybIpfCEj8Z6YLnTfI2GIwxYBhcMcVj64jNBVsrbNqKWgSCnHdKXWvRKPbshJv0oP5j5g7wwlM0sDV/OtldBNeAYbPGqvz7kqrCcLybdJ6sZubozcd5jnW+xSQxU7+kpytta5mM3pJvLIzI/NLa/67Xm6Y/ihmKLZ5JmFq9WMtofkIy9Q/i/dVS1O0FSSK5sAm/YEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6PdT1YsHz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 21:40:11 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 582231D31;
	Wed, 20 Aug 2025 04:39:30 -0700 (PDT)
Received: from [10.57.3.97] (unknown [10.57.3.97])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B3B33F58B;
	Wed, 20 Aug 2025 04:39:32 -0700 (PDT)
Message-ID: <145e1021-d2c3-4ff3-aabb-fb7416848a97@arm.com>
Date: Wed, 20 Aug 2025 12:39:28 +0100
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
To: Thomas Richter <tmricht@linux.ibm.com>, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, mark.rutland@arm.com, acme@kernel.org,
 namhyung@kernel.org, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
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
 <295ae4dd-4734-42a0-be63-2d322f00c799@linux.ibm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <295ae4dd-4734-42a0-be63-2d322f00c799@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Thomas,

On 2025-08-20 9:09 am, Thomas Richter wrote:
> On 8/19/25 15:15, Robin Murphy wrote:
>> On 13/08/2025 6:01 pm, Robin Murphy wrote:
>>> Only a handful of CPU PMUs accept PERF_TYPE_{RAW,HARDWARE,HW_CACHE}
>>> events without registering themselves as PERF_TYPE_RAW in the first
>>> place. Add an explicit opt-in for these special cases, so that we can
>>> make life easier for every other driver (and probably also speed up the
>>> slow-path search) by having perf_try_init_event() do the basic type
>>> checking to cover the majority of cases.
>>>
>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>> ---
>>>
>>> A further possibility is to automatically add the cap to PERF_TYPE_RAW
>>> PMUs in perf_pmu_register() to have a single point-of-use condition; I'm
>>> undecided...
>>> ---
>>>    arch/s390/kernel/perf_cpum_cf.c    |  1 +
>>>    arch/s390/kernel/perf_pai_crypto.c |  2 +-
>>>    arch/s390/kernel/perf_pai_ext.c    |  2 +-
>>>    arch/x86/events/core.c             |  2 +-
>>>    drivers/perf/arm_pmu.c             |  1 +
>>>    include/linux/perf_event.h         |  1 +
>>>    kernel/events/core.c               | 15 +++++++++++++++
>>>    7 files changed, 21 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/s390/kernel/perf_cpum_cf.c b/arch/s390/kernel/perf_cpum_cf.c
>>> index 1a94e0944bc5..782ab755ddd4 100644
>>> --- a/arch/s390/kernel/perf_cpum_cf.c
>>> +++ b/arch/s390/kernel/perf_cpum_cf.c
>>> @@ -1054,6 +1054,7 @@ static void cpumf_pmu_del(struct perf_event *event, int flags)
>>>    /* Performance monitoring unit for s390x */
>>>    static struct pmu cpumf_pmu = {
>>>        .task_ctx_nr  = perf_sw_context,
>>> +    .capabilities = PERF_PMU_CAP_RAW_EVENTS,
>>>        .pmu_enable   = cpumf_pmu_enable,
>>>        .pmu_disable  = cpumf_pmu_disable,
>>>        .event_init   = cpumf_pmu_event_init,
>>> diff --git a/arch/s390/kernel/perf_pai_crypto.c b/arch/s390/kernel/perf_pai_crypto.c
>>> index a64b6b056a21..b5b6d8b5d943 100644
>>> --- a/arch/s390/kernel/perf_pai_crypto.c
>>> +++ b/arch/s390/kernel/perf_pai_crypto.c
>>> @@ -569,7 +569,7 @@ static const struct attribute_group *paicrypt_attr_groups[] = {
>>>    /* Performance monitoring unit for mapped counters */
>>>    static struct pmu paicrypt = {
>>>        .task_ctx_nr  = perf_hw_context,
>>> -    .capabilities = PERF_PMU_CAP_SAMPLING,
>>> +    .capabilities = PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
>>>        .event_init   = paicrypt_event_init,
>>>        .add          = paicrypt_add,
>>>        .del          = paicrypt_del,
>>> diff --git a/arch/s390/kernel/perf_pai_ext.c b/arch/s390/kernel/perf_pai_ext.c
>>> index 1261f80c6d52..bcd28c38da70 100644
>>> --- a/arch/s390/kernel/perf_pai_ext.c
>>> +++ b/arch/s390/kernel/perf_pai_ext.c
>>> @@ -595,7 +595,7 @@ static const struct attribute_group *paiext_attr_groups[] = {
>>>    /* Performance monitoring unit for mapped counters */
>>>    static struct pmu paiext = {
>>>        .task_ctx_nr  = perf_hw_context,
>>> -    .capabilities = PERF_PMU_CAP_SAMPLING,
>>> +    .capabilities = PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
>>>        .event_init   = paiext_event_init,
>>>        .add          = paiext_add,
>>>        .del          = paiext_del,
>>> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
>>> index 789dfca2fa67..764728bb80ae 100644
>>> --- a/arch/x86/events/core.c
>>> +++ b/arch/x86/events/core.c
>>> @@ -2697,7 +2697,7 @@ static bool x86_pmu_filter(struct pmu *pmu, int cpu)
>>>    }
>>>      static struct pmu pmu = {
>>> -    .capabilities        = PERF_PMU_CAP_SAMPLING,
>>> +    .capabilities        = PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
>>>          .pmu_enable        = x86_pmu_enable,
>>>        .pmu_disable        = x86_pmu_disable,
>>> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
>>> index 72d8f38d0aa5..bc772a3bf411 100644
>>> --- a/drivers/perf/arm_pmu.c
>>> +++ b/drivers/perf/arm_pmu.c
>>> @@ -877,6 +877,7 @@ struct arm_pmu *armpmu_alloc(void)
>>>             * specific PMU.
>>>             */
>>>            .capabilities    = PERF_PMU_CAP_SAMPLING |
>>> +                  PERF_PMU_CAP_RAW_EVENTS |
>>>                      PERF_PMU_CAP_EXTENDED_REGS |
>>>                      PERF_PMU_CAP_EXTENDED_HW_TYPE,
>>>        };
>>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>>> index 183b7c48b329..c6ad036c0037 100644
>>> --- a/include/linux/perf_event.h
>>> +++ b/include/linux/perf_event.h
>>> @@ -305,6 +305,7 @@ struct perf_event_pmu_context;
>>>    #define PERF_PMU_CAP_EXTENDED_HW_TYPE    0x0100
>>>    #define PERF_PMU_CAP_AUX_PAUSE        0x0200
>>>    #define PERF_PMU_CAP_AUX_PREFER_LARGE    0x0400
>>> +#define PERF_PMU_CAP_RAW_EVENTS        0x0800
>>>      /**
>>>     * pmu::scope
>>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>>> index 71b2a6730705..2ecee76d2ae2 100644
>>> --- a/kernel/events/core.c
>>> +++ b/kernel/events/core.c
>>> @@ -12556,11 +12556,26 @@ static inline bool has_extended_regs(struct perf_event *event)
>>>               (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK);
>>>    }
>>>    +static bool is_raw_pmu(const struct pmu *pmu)
>>> +{
>>> +    return pmu->type == PERF_TYPE_RAW ||
>>> +           pmu->capabilities & PERF_PMU_CAP_RAW_EVENTS;
>>> +}
>>> +
>>>    static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
>>>    {
>>>        struct perf_event_context *ctx = NULL;
>>>        int ret;
>>>    +    /*
>>> +     * Before touching anything, we can safely skip:
>>> +     * - any event for a specific PMU which is not this one
>>> +     * - any common event if this PMU doesn't support them
>>> +     */
>>> +    if (event->attr.type != pmu->type &&
>>> +        (event->attr.type >= PERF_TYPE_MAX || is_raw_pmu(pmu)))
>>
>> Ah, that should be "!is_raw_pmu(pmu)" there (although it's not entirely the cause of the LKP report on the final patch.)
>>
>> Thanks,
>> Robin.
>>
>>> +        return -ENOENT;
>>> +
>>>        if (!try_module_get(pmu->module))
>>>            return -ENODEV;
>>>    
>>
>>
> 
> Hi Robin,
> 
> what is the intention of that patch?
> Can you explain that a bit more.

The background here is that, in this context, we essentially have 3 
distinct categories of PMU driver:

- Older/simpler CPU PMUs which register as PERF_TYPE_RAW and accept 
raw/hardware events
- Newer/heterogeneous CPU PMUs which register as a dynamic type, and 
accept both raw/hardware events and events of their own type
- Other (mostly uncore) PMUs which only accept events of their own type

These days that third one is by far the majority, so it seems 
increasingly unreasonable and inefficient to always offer every kind of 
event to every driver, and so force nearly all of them to have the same 
boilerplate code to refuse events they don't want. The core code is 
already in a position to be able to assume that a PERF_TYPE_RAW PMU 
wants "raw" events and a typed PMU wants its own events, so the only 
actual new thing we need is a way to discern the 5 drivers in the middle 
category - where s390 dominates :) - from the rest in the third.

The way the check itself ends up structured is that the only time we'll 
now offer an event to a driver of a different type is if it's a "raw" 
event and the driver has asked to be offered them (either by registering 
as PERF_TYPE_RAW or with the new cap). Otherwise we can safely assume 
that this PMU won't want this event, and so skip straight to trying the 
next one. We can get away with the single PERF_TYPE_MAX check for all 
"raw" events, since the drivers which do handle them already have to 
consider the exact type to discern between RAW/HARDWARE/HW_CACHE, and 
thus must reject SOFTWARE/TRACEPOINT/BREAKPOINT events anyway, but I 
could of course make that more specific if people prefer. Conversely, 
since the actual software/tracepoint/breakpoint PMUs won't pass the 
is_raw_pmu() check either, and thus will only be given their own events, 
I could remove the type checking from their event_init routines as well, 
but I thought that might be perhaps a little too subtle as-is.

BTW if the s390 drivers are intended to coexist then I'm not sure they 
actually handle sharing PERF_TYPE_RAW events very well - what happens to 
any particular event seems ultimately largely dependent on the order in 
which the drivers happen to register - but that's a pre-existing issue 
and this series shouldn't change anything in that respect. (As it 
similarly shouldn't affect the trick of the first matching driver 
rewriting the event type to "forward" it to another driver later in the 
list.)

Thanks,
Robin.

