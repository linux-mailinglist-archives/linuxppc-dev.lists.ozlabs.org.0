Return-Path: <linuxppc-dev+bounces-11346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE3B37503
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 00:46:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBN7q0ZMsz2xcB;
	Wed, 27 Aug 2025 08:46:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756248407;
	cv=none; b=YXIKKSjMwJxDMC/FjUWKWsffRnr0e20NtltjV8gVxCAdf5c68q9pPDYBBOT1tou6YcymR+ok2K5rA8rjHk+0Pl/errPh5ZAVY1lzcWH7B+Z5gLL59NyBRwcqoNUJhxhDxI/C6epxsnEih69PE/qYVrnAt702vUYDfsr0uXQZG0Rm9ZyLWblIFEeBoghPfVAWP8ss26TI6q/PdOaG6WD31bZR9e44iRHeOStibyolGC4Da53aaPiiqIumRZmP1QAbIDwY6m0TMuU+dq1q4h6b5Ri+XwYPag5txTkAADCOS5xTbWu4vEoUm/PPdjE5LvJfhuIcHm05q3r//LoY7LLJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756248407; c=relaxed/relaxed;
	bh=2jdqzGDnAFH+SYnTG+1KhLFvS/73f5C5lTZcoDjZ9RU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bP263E7CCgisaPif3bL/PoeoYMDyzKWk4J++rt6t2HeeIlGnq1vAv9Rs/ThOhttt0aE2U3hjo1DNJv4KBEFqqN3srdbWfk3yfyXE8REevJmNSkQMFsXhrgXFcTFxll50T/b6REKPU/gT9AgNFELuGcNBrJ65zqyOnGN9f2EDWL6bWk/2m4yUS/MBi16bL0tjNfS1ChY/7kw821uETC7Psw4Fh0ukYJmzh4qTlI43pfk7593A1znsDC8vn8dq9omFpAKgIQ+uQAJv+x6IkG4xSZDKGmw3khpGYNdc3m+0ru6FlkOJvLGvyb9Yh3Isb2Y53plo1P6/pI8C2cUAdR22Ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBN7p07gCz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 08:46:44 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D91401A25;
	Tue, 26 Aug 2025 15:46:03 -0700 (PDT)
Received: from [10.57.4.86] (unknown [10.57.4.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCF5D3F738;
	Tue, 26 Aug 2025 15:46:05 -0700 (PDT)
Message-ID: <015974a4-f129-4ae5-adf9-c94b29f0576a@arm.com>
Date: Tue, 26 Aug 2025 23:46:02 +0100
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
To: Mark Rutland <mark.rutland@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org, acme@kernel.org,
 namhyung@kernel.org, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
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
 <aK259PrpyxguQzdN@J2N7QTR9R3>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aK259PrpyxguQzdN@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-08-26 2:43 pm, Mark Rutland wrote:
> On Wed, Aug 13, 2025 at 06:01:10PM +0100, Robin Murphy wrote:
>> Only a handful of CPU PMUs accept PERF_TYPE_{RAW,HARDWARE,HW_CACHE}
>> events without registering themselves as PERF_TYPE_RAW in the first
>> place. Add an explicit opt-in for these special cases, so that we can
>> make life easier for every other driver (and probably also speed up the
>> slow-path search) by having perf_try_init_event() do the basic type
>> checking to cover the majority of cases.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> 
> To bikeshed a little here, I'm not keen on the PERF_PMU_CAP_RAW_EVENTS
> name, because it's not clear what "RAW" really means, and people will
> definitely read that to mean something else.
> 
> Could we go with something like PERF_PMU_CAP_COMMON_CPU_EVENTS, to make
> it clear that this is about opting into CPU-PMU specific event types (of
> which PERF_TYPE_RAW is one of)?

Indeed I started with that very intention after our previous discussion, 
but soon realised that in fact nowhere in the code is there any 
definition or even established notion of what "common" means in this 
context, so it's hardly immune to misinterpretation either. Furthermore 
the semantics of the cap as it ended up are specifically that the PMU 
wants the same behaviour as if it had registered as PERF_TYPE_RAW, so 
having "raw" in the name started to look like the more intuitive option 
after all (plus being nice and short helps.)

If anything, it's "events" that carries the implication that's proving 
hard to capture precisely and concisely here, so maybe the answer to 
avoid ambiguity is to lean further away from a "what it represents" to a 
"what it actually does" naming - PERF_PMU_CAP_TYPE_RAW, anyone?

> Likewise, s/is_raw_pmu()/pmu_supports_common_cpu_events()/.

Case in point: is it any more logical and expected that supporting 
common CPU events implies a PMU should be offered software or breakpoint 
events as well? Because that's what such a mere rename would currently 
mean :/

>> ---
>>
>> A further possibility is to automatically add the cap to PERF_TYPE_RAW
>> PMUs in perf_pmu_register() to have a single point-of-use condition; I'm
>> undecided...
> 
> I reckon we don't need to automagically do that, but I reckon that
> is_raw_pmu()/pmu_supports_common_cpu_events() should only check the cap,
> and we don't read anything special into any of
> PERF_TYPE_{RAW,HARDWARE,HW_CACHE}.

OK, but that would then necessitate having to explicitly add the cap to 
all 15-odd other drivers which register as PERF_TYPE_RAW as well, at 
which point it starts to look like a more general "I am a CPU PMU in 
terms of most typical assumptions you might want to make about that" flag...

To clarify (and perhaps something for a v2 commit message), we currently 
have 3 categories of PMU driver:

1: (Older/simpler CPUs) Registers as PERF_TYPE_RAW, wants 
PERF_TYPE_RAW/HARDWARE/HW_CACHE events
2: (Heterogeneous CPUs) Registers as dynamic type, wants 
PERF_TYPE_RAW/HARDWARE/HW_CACHE events plus events of its own type
3: (Mostly uncore) Registers as dynamic type, only wants events of its 
own type

My vested interest is in making category 3 the default behaviour, given 
that the growing majority of new drivers are uncore (and I keep having 
to write them...) However unclear the type overlaps in category 1 might 
be, it's been like that for 15 years, so I didn't feel compelled to 
churn fossils like Alpha more than reasonably necessary. Category 2 is 
only these 5 drivers, so a relatively small tweak to distinguish them 
from category 3 and let them retain the effective category 1 behaviour 
(which remains the current one of potentially still being offered 
software etc. events too) seemed like the neatest way to make progress.

I'm not saying I'm necessarily against a general overhaul of CPU PMUs 
being attempted too, just that it seems more like a whole other 
side-quest, and I'd really like to slay the uncore-boilerplate dragon first.

>> ---
>>   arch/s390/kernel/perf_cpum_cf.c    |  1 +
>>   arch/s390/kernel/perf_pai_crypto.c |  2 +-
>>   arch/s390/kernel/perf_pai_ext.c    |  2 +-
>>   arch/x86/events/core.c             |  2 +-
>>   drivers/perf/arm_pmu.c             |  1 +
>>   include/linux/perf_event.h         |  1 +
>>   kernel/events/core.c               | 15 +++++++++++++++
>>   7 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/s390/kernel/perf_cpum_cf.c b/arch/s390/kernel/perf_cpum_cf.c
>> index 1a94e0944bc5..782ab755ddd4 100644
>> --- a/arch/s390/kernel/perf_cpum_cf.c
>> +++ b/arch/s390/kernel/perf_cpum_cf.c
>> @@ -1054,6 +1054,7 @@ static void cpumf_pmu_del(struct perf_event *event, int flags)
>>   /* Performance monitoring unit for s390x */
>>   static struct pmu cpumf_pmu = {
>>   	.task_ctx_nr  = perf_sw_context,
>> +	.capabilities = PERF_PMU_CAP_RAW_EVENTS,
>>   	.pmu_enable   = cpumf_pmu_enable,
>>   	.pmu_disable  = cpumf_pmu_disable,
>>   	.event_init   = cpumf_pmu_event_init,
> 
> Tangential, but use of perf_sw_context here looks bogus.

Indeed, according to the history it was intentional, but perhaps that no 
longer applies since the big context redesign? FWIW there seem to be a 
fair few instances of this, including Arm SPE.

Thanks,
Robin.

>> diff --git a/arch/s390/kernel/perf_pai_crypto.c b/arch/s390/kernel/perf_pai_crypto.c
>> index a64b6b056a21..b5b6d8b5d943 100644
>> --- a/arch/s390/kernel/perf_pai_crypto.c
>> +++ b/arch/s390/kernel/perf_pai_crypto.c
>> @@ -569,7 +569,7 @@ static const struct attribute_group *paicrypt_attr_groups[] = {
>>   /* Performance monitoring unit for mapped counters */
>>   static struct pmu paicrypt = {
>>   	.task_ctx_nr  = perf_hw_context,
>> -	.capabilities = PERF_PMU_CAP_SAMPLING,
>> +	.capabilities = PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
>>   	.event_init   = paicrypt_event_init,
>>   	.add	      = paicrypt_add,
>>   	.del	      = paicrypt_del,
>> diff --git a/arch/s390/kernel/perf_pai_ext.c b/arch/s390/kernel/perf_pai_ext.c
>> index 1261f80c6d52..bcd28c38da70 100644
>> --- a/arch/s390/kernel/perf_pai_ext.c
>> +++ b/arch/s390/kernel/perf_pai_ext.c
>> @@ -595,7 +595,7 @@ static const struct attribute_group *paiext_attr_groups[] = {
>>   /* Performance monitoring unit for mapped counters */
>>   static struct pmu paiext = {
>>   	.task_ctx_nr  = perf_hw_context,
>> -	.capabilities = PERF_PMU_CAP_SAMPLING,
>> +	.capabilities = PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
>>   	.event_init   = paiext_event_init,
>>   	.add	      = paiext_add,
>>   	.del	      = paiext_del,
>> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
>> index 789dfca2fa67..764728bb80ae 100644
>> --- a/arch/x86/events/core.c
>> +++ b/arch/x86/events/core.c
>> @@ -2697,7 +2697,7 @@ static bool x86_pmu_filter(struct pmu *pmu, int cpu)
>>   }
>>   
>>   static struct pmu pmu = {
>> -	.capabilities		= PERF_PMU_CAP_SAMPLING,
>> +	.capabilities		= PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_RAW_EVENTS,
>>   
>>   	.pmu_enable		= x86_pmu_enable,
>>   	.pmu_disable		= x86_pmu_disable,
>> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
>> index 72d8f38d0aa5..bc772a3bf411 100644
>> --- a/drivers/perf/arm_pmu.c
>> +++ b/drivers/perf/arm_pmu.c
>> @@ -877,6 +877,7 @@ struct arm_pmu *armpmu_alloc(void)
>>   		 * specific PMU.
>>   		 */
>>   		.capabilities	= PERF_PMU_CAP_SAMPLING |
>> +				  PERF_PMU_CAP_RAW_EVENTS |
>>   				  PERF_PMU_CAP_EXTENDED_REGS |
>>   				  PERF_PMU_CAP_EXTENDED_HW_TYPE,
>>   	};
>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>> index 183b7c48b329..c6ad036c0037 100644
>> --- a/include/linux/perf_event.h
>> +++ b/include/linux/perf_event.h
>> @@ -305,6 +305,7 @@ struct perf_event_pmu_context;
>>   #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
>>   #define PERF_PMU_CAP_AUX_PAUSE		0x0200
>>   #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
>> +#define PERF_PMU_CAP_RAW_EVENTS		0x0800
>>   
>>   /**
>>    * pmu::scope
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index 71b2a6730705..2ecee76d2ae2 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -12556,11 +12556,26 @@ static inline bool has_extended_regs(struct perf_event *event)
>>   	       (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK);
>>   }
>>   
>> +static bool is_raw_pmu(const struct pmu *pmu)
>> +{
>> +	return pmu->type == PERF_TYPE_RAW ||
>> +	       pmu->capabilities & PERF_PMU_CAP_RAW_EVENTS;
>> +}
> 
> As above, I reckon we should make this:
> 
> static bool pmu_supports_common_cpu_events(const struct pmu *pmu)
> {
> 	return pmu->capabilities & PERF_PMU_CAP_RAW_EVENTS;
> }
> 
> Other than the above, this looks good to me.
> 
> Mark.
> 
>> +
>>   static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
>>   {
>>   	struct perf_event_context *ctx = NULL;
>>   	int ret;
>>   
>> +	/*
>> +	 * Before touching anything, we can safely skip:
>> +	 * - any event for a specific PMU which is not this one
>> +	 * - any common event if this PMU doesn't support them
>> +	 */
>> +	if (event->attr.type != pmu->type &&
>> +	    (event->attr.type >= PERF_TYPE_MAX || is_raw_pmu(pmu)))
>> +		return -ENOENT;
>> +
>>   	if (!try_module_get(pmu->module))
>>   		return -ENODEV;
>>   
>> -- 
>> 2.39.2.101.g768bb238c484.dirty
>>

