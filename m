Return-Path: <linuxppc-dev+bounces-11125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C009B2C579
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 15:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5r2Q3vQZz3d7n;
	Tue, 19 Aug 2025 23:26:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755609982;
	cv=none; b=fDPpErCFPmn8UMYZU6sa2riUruQONbYw7hIBjPdq6LArJC2/hkSGzhHnu8bCekk2wXxPUzbssUCCOZPT7m4FwVJ4ua2Ggy1Hrb6/o2g7jzZuI6zZ0igrr15hZCaEgEkqmxpFzL5VW4vog8554ZNIpx4s5lCwz9cbBoKoj8YcZLwjzSjfhnc6fAlvB8kZA0QvDB+vaO1UtKpANdvL9p+beBSvEmqGLPeRytBJqA+mAI77I/FW05nleUtb8RPorZjr9s4RUCEbpfgOaMOA8E9S5OAerWlmqVOwYxou03yhnPjopITd9EOVLRoy2EZ7urLrO4sOMt4rAjzq7OI76FL13A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755609982; c=relaxed/relaxed;
	bh=klw7Ltvg5aqOzpSEMUDzBjVvTQFF0LKZDKp0NgO1QYk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BBZqM/r0J6B8maOCvvTn3QCYO7SaRyz6PPeo8pozi3nY5Mksmn9b6Dh6xXSBWsmjDbaJ9+FPU+azG+1YxDls5CMZAc4o3rH6pr4L6rY+iwtctBYzC7iOJNpeWK7Hk+LY99plVy2aSoCZ2nef1wwDpFo213cbST2xHaq1kLj0AmZfYhqJVy9f5Y2GFLlxHBAZIDVygDqylU0I09s+rjBGvqOR3okzWbs8xmAU3ZwkWNuS3am+Yo6lzqjUs85vUV8SkomdxYpipQmwq8iYCOee/i4DchfeZjAlZ3SP+D3hkKimrU6SfLMr2MOOZCWGsIPMwiVCL8MXA23GESQ5ktENqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5r2P6xxPz3d3M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 23:26:21 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CEF116A3;
	Tue, 19 Aug 2025 06:25:42 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 884583F738;
	Tue, 19 Aug 2025 06:25:46 -0700 (PDT)
Message-ID: <271daf71-3c57-49a5-a65f-c58ac670864f@arm.com>
Date: Tue, 19 Aug 2025 14:25:45 +0100
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
Subject: Re: [PATCH 19/19] perf: Garbage-collect event_init checks
From: Robin Murphy <robin.murphy@arm.com>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com
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
 <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13/08/2025 6:01 pm, Robin Murphy wrote:
[...]
> diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
> index 297ff5adb667..98ffab403bb4 100644
> --- a/arch/x86/events/intel/uncore.c
> +++ b/arch/x86/events/intel/uncore.c
> @@ -731,24 +731,11 @@ static int uncore_pmu_event_init(struct perf_event *event)
>   	struct hw_perf_event *hwc = &event->hw;
>   	int ret;
>   
> -	if (event->attr.type != event->pmu->type)
> -		return -ENOENT;
> -
>   	pmu = uncore_event_to_pmu(event);
>   	/* no device found for this pmu */
>   	if (!pmu->registered)
>   		return -ENOENT;
>   
> -	/* Sampling not supported yet */
> -	if (hwc->sample_period)
> -		return -EINVAL;
> -
> -	/*
> -	 * Place all uncore events for a particular physical package
> -	 * onto a single cpu
> -	 */
> -	if (event->cpu < 0)
> -		return -EINVAL;

Oopsie, I missed that this isn't just the usual boilerplate as the 
comment kind of implies, but is also necessary to prevent the 
uncore_pmu_to_box() lookup going wrong (since the core code won't reject 
a task-bound event until later). I'll put this back with an updated 
comment for v2 (and double-check everything else again...), thanks LKP!

Robin.


>   	box = uncore_pmu_to_box(pmu, event->cpu);
>   	if (!box || box->cpu < 0)
>   		return -EINVAL;

