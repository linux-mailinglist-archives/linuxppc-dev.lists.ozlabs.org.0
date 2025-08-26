Return-Path: <linuxppc-dev+bounces-11337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F0B3708C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 18:35:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBCvw4r5Mz3dTb;
	Wed, 27 Aug 2025 02:35:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756226156;
	cv=none; b=R450p0TotRCQbGJswMeWqYsJXjipOXR0lNZqlfd1+A4khlnJiXqMdgrHqPiakIs6KpsmkD6uUNQTR+InQWwaSzywKzdpALy7dD7OSHshYC/yh3yU/h9AN50T+/HFSsgcMuf1VATzC/oK+D4w2bydhoMrm1BrrZstn6le05wwuc+Vm4CofYlv3TpG8iUtKZ601LeUPnyW8mhoTjflDj/TTBvAWMCr5/EfmsyeGVKoW9h9KSFVBz0XooysZnx9rBKkBuekfJ5y1HlRN148ENK/LjATREDMBAW60ICa/Aeoql009KuVPydXKa99DbVe4Fsq0Am85Gxp1YETUArT+/2AHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756226156; c=relaxed/relaxed;
	bh=Cs3lA0xtwHyZRzw7X/rouKWvwTFpddTtyCuNGpxeQfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qg19gyIjXBKYA1oJSNWMF7BmLYQ7KgD1PtQ257YjnWKRxyzQJgo4u2TQ08O+6RW7WoRRYemA/sijlniyAdhwe92sObX1ggJT5kbZvi5PZ6el7U4DKI5isktcLbxbSbVeI1yqCUdPBWwXTJQ7kP8/CqXNhFHu3mqhzpGu+I648Tf78+ftrVOnRGl5JJY7UIFc362F2dkHb9H16rB0gq6re0qK0Ritlwg4h8rci4gYubGt07eMTD4dYRBl6SHwtqos0eBOIdFOLnBQPIoXR63ZYHROcfItK9yBb2nLrqC8c0y2nCZ7eunP6fxRnk9M6fINvzCLZFNWkkEzOPIqBpihWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBCvv5SgVz3dSr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 02:35:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E4571A25;
	Tue, 26 Aug 2025 09:35:15 -0700 (PDT)
Received: from [10.57.4.86] (unknown [10.57.4.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5A1B3F694;
	Tue, 26 Aug 2025 09:35:17 -0700 (PDT)
Message-ID: <8d6ac059-fc8f-4a5d-b49e-d02777c01cfb@arm.com>
Date: Tue, 26 Aug 2025 17:35:15 +0100
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
To: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, will@kernel.org, acme@kernel.org, namhyung@kernel.org,
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
 <20250826130806.GY4067720@noisy.programming.kicks-ass.net>
 <aK22izKE4r6wI_D9@J2N7QTR9R3>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aK22izKE4r6wI_D9@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-08-26 2:28 pm, Mark Rutland wrote:
> On Tue, Aug 26, 2025 at 03:08:06PM +0200, Peter Zijlstra wrote:
>> On Wed, Aug 13, 2025 at 06:01:08PM +0100, Robin Murphy wrote:
>>> Sampling is inherently a feature for CPU PMUs, given that the thing
>>> to be sampled is a CPU context. These days, we have many more
>>> uncore/system PMUs than CPU PMUs, so it no longer makes much sense to
>>> assume sampling support by default and force the ever-growing majority
>>> of drivers to opt out of it (or erroneously fail to). Instead, let's
>>> introduce a positive opt-in capability that's more obvious and easier to
>>> maintain.
>>
>>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>>> index 4d439c24c901..bf2cfbeabba2 100644
>>> --- a/include/linux/perf_event.h
>>> +++ b/include/linux/perf_event.h
>>> @@ -294,7 +294,7 @@ struct perf_event_pmu_context;
>>>   /**
>>>    * pmu::capabilities flags
>>>    */
>>> -#define PERF_PMU_CAP_NO_INTERRUPT	0x0001
>>> +#define PERF_PMU_CAP_SAMPLING		0x0001
>>>   #define PERF_PMU_CAP_NO_NMI		0x0002
>>>   #define PERF_PMU_CAP_AUX_NO_SG		0x0004
>>>   #define PERF_PMU_CAP_EXTENDED_REGS	0x0008
>>> @@ -305,6 +305,7 @@ struct perf_event_pmu_context;
>>>   #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
>>>   #define PERF_PMU_CAP_AUX_PAUSE		0x0200
>>>   #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
>>> +#define PERF_PMU_CAP_NO_INTERRUPT	0x0800
>>
>> So NO_INTERRUPT was supposed to be the negative of your new SAMPLING
>> (and I agree with your reasoning).
>>
>> What I'm confused/curious about is why we retain NO_INTERRUPT?
> 
> I see from your other reply that you spotted the next patch does that.
> 
> For the sake of other reviewers or anyone digging through the git
> history it's probably worth adding a line to this commit message to say:
> 
> | A subsequent patch will remove PERF_PMU_CAP_NO_INTERRUPT as this
> | requires some additional cleanup.

Yup, the main reason is the set of drivers getting the new cap is 
smaller than the set of drivers currently not rejecting sampling events, 
so I wanted it to be clearly visible in the patch. Indeed I shall 
clarify the relationship to NO_INTERRUPT in the commit message.

Thanks,
Robin.

