Return-Path: <linuxppc-dev+bounces-11335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F91B36EE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 17:54:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBC0F3f4Wz3dVZ;
	Wed, 27 Aug 2025 01:54:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756223677;
	cv=none; b=V7259gvqSHQB2XrOVVcrXXFZV2D9GsFQ2klki7LtwowxTQNI3/M85IfotuS9QsSCFeNDePO6G4dhgPTVdImK3MF1vr0hwJkmQVGBpscosxw6A0YqW7FgLbqEGe6BvmzibUcQCuyeXNtpwIwWNcd1Rhhg6tLymPXkc39hwbvewaHDul4o3CKhFVpc6wnmb308FCShtB0NO2n5TuCSZt7BQlO7RCZVFbS39CqrJqXHxAPL4n6KWMdacJfaMte6rEhzO7hIukjZkyQO7T/CkYapNmIMSM/C6daCeXQrrnBr+7hokcdpK5n+JhT67OxBp1BKIFoeS42tsKsRE5MKhstSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756223677; c=relaxed/relaxed;
	bh=oWs3lajoANFG2rC/+GafuPrLOnPSD5jWhWk8n9ijiXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2YUFnhrixmJfNrnl1mCNO+O0qcaRi+HicDcno2ZG6iB8GJsN/Zs905zrg6Lyu/0HMBVrFr10w5+PUHheasAs/qDaUJWMmdUwAtdPlP0EsebglPIAljCFzhumjVo/maszJm0r0E0FTHCMaZTMD5fXHr/JTDxCCfcT/C6v1vPiZtGQioswpSgfhj+VZ0qe577N/PX6oERHChXTFFiWhujnekYJy69N0CsrOYfMfIBqkFW/ldhqSlMW+/v346LDC6+qZHp0BbjqTOtrFI0SCY3ZeBwpfEVmpOMynGjPuaUBzQ1GDNqhFy9yiP1OaeVsLpcctrPTpYjEt+6JOhwWZmwAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBC0D3StTz3dVJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 01:54:35 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39F0B1A25;
	Tue, 26 Aug 2025 08:53:54 -0700 (PDT)
Received: from [10.57.4.86] (unknown [10.57.4.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8041A3F694;
	Tue, 26 Aug 2025 08:53:54 -0700 (PDT)
Message-ID: <983df32a-ba74-421d-bc20-06e778b4d2c9@arm.com>
Date: Tue, 26 Aug 2025 16:53:51 +0100
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
Subject: Re: [PATCH 16/19] perf: Introduce positive capability for sampling
To: Leo Yan <leo.yan@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
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
 <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
 <20250826131124.GB745921@e132581.arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250826131124.GB745921@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-08-26 2:11 pm, Leo Yan wrote:
> On Wed, Aug 13, 2025 at 06:01:08PM +0100, Robin Murphy wrote:
>> Sampling is inherently a feature for CPU PMUs, given that the thing
>> to be sampled is a CPU context. These days, we have many more
>> uncore/system PMUs than CPU PMUs, so it no longer makes much sense to
>> assume sampling support by default and force the ever-growing majority
>> of drivers to opt out of it (or erroneously fail to). Instead, let's
>> introduce a positive opt-in capability that's more obvious and easier to
>> maintain.
> 
> [...]
> 
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index 369e77ad5f13..dbd52851f5c6 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -955,7 +955,8 @@ static int arm_spe_pmu_perf_init(struct arm_spe_pmu *spe_pmu)
>>   	spe_pmu->pmu = (struct pmu) {
>>   		.module = THIS_MODULE,
>>   		.parent		= &spe_pmu->pdev->dev,
>> -		.capabilities	= PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
>> +		.capabilities	= PERF_PMU_CAP_SAMPLING |
>> +				  PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
>>   		.attr_groups	= arm_spe_pmu_attr_groups,
>>   		/*
>>   		 * We hitch a ride on the software context here, so that
> 
> The change in Arm SPE driver looks good to me.
> 
> I noticed you did not set the flag for other AUX events, like Arm
> CoreSight, Intel PT and bts. The drivers locate in:
> 
>    drivers/hwtracing/coresight/coresight-etm-perf.c
>    arch/x86/events/intel/bts.c
>    arch/x86/events/intel/pt.c
> 
> Genearlly, AUX events generate interrupts based on AUX ring buffer
> watermark but not the period. Seems to me, it is correct to set the
> PERF_PMU_CAP_SAMPLING flag for them.

This cap is given to drivers which handle event->attr.sample_period and 
call perf_event_overflow() - or in a few rare cases, 
perf_output_sample() directly - to do something meaningful with it, 
since the intent is to convey "I properly handle events for which 
is_sampling_event() is true". My understanding is that aux events are 
something else entirely, but I'm happy to be corrected.

Otherwise, perhaps this suggests it deserves to be named a little more 
specifically for clarity, maybe PERF_CAP_SAMPLING_EVENTS?

Thanks,
Robin.

> A special case is Arm CoreSight legacy sinks (like ETR/ETB, etc)
> don't has interrupt. We might need set or clear the flag on the fly
> based on sink type:
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f1551c08ecb2..404edc94c198 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -433,6 +433,11 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>          if (!sink)
>                  goto err;
>   
> +       if (coresight_is_percpu_sink(sink))
> +               event->pmu.capabilities = PERF_PMU_CAP_SAMPLING;
> +       else
> +               event->pmu.capabilities &= ~PERF_PMU_CAP_SAMPLING;
> +
> 
> Thanks,
> Leo


