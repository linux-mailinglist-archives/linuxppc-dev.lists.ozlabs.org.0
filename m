Return-Path: <linuxppc-dev+bounces-11319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6052EB35AF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 13:16:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB4q05nlHz3dRm;
	Tue, 26 Aug 2025 21:16:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756206972;
	cv=none; b=T8eTenLCO90smCF4I8hTaWobdlaFwrEieomZi/Luwyi2472Dux+4ZCkAgvjQ2xlSj7EFKAjxZVsGVS7+i+3GZPMVCIZt9PSQaY1MRnmGxVI3ws/6QeBmfl52Q3ixAZHwQvIETNlch3sNuM9jDFxQFQET1sqR82sHUDrBT9YU279IGjDz2eZJMG4pkSMT0UJOgDvkyKOzYcSamfv/xbM86eKlP8jJqfRFPsj/cafND9afcRjo5MgsXDn4ptoGeG92EyV6O3vx3zhoRUi4x9F7CHvS8656U+NqAyKlVqst+r/x8jQWdPbxxuKrwct7Mt5+gcIxkbBOM2O40gCwoEi71g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756206972; c=relaxed/relaxed;
	bh=WdcZGco1brKkCvqK3OI1tB4ut3wEQd56prbkyXuFUMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isL+p4IvbzPWjXBFyb+DGBlHt2+A4LZtEJgSqwf/kp2tYVA7rY0uS5fqBTR4bUq0auXSxNp4VkPNp/0xStXcx+n4oZtBLLQbPJD4n0YvhP2lnQKg3zMixJn6WB5zWAYzUEO/O/m+MxbkqEap3fE7+kp36TMM3bt07tnpDltdsZrOEAfYoDjUzGSl598+HNJSc6FfFpqVziwqV0RajAncbkaJX7Q+GG1cLMAp9gRhpP98prrI0IV+h3ZiMaOQSjSz5SZKcR8Y/Qy5+N7dnr2S+45UVRi/uyGpaJqIkrFCYVbKoimoIBSHZyTPw4h5J5i+IVcc4eNZPtMTwf93G2H9NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB4q00WQNz3dJs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 21:16:11 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E7AF1A00;
	Tue, 26 Aug 2025 04:15:32 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 663C13F63F;
	Tue, 26 Aug 2025 04:15:28 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:15:23 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
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
Subject: Re: [PATCH 02/19] perf/hisilicon: Fix group validation
Message-ID: <aK2XS_GhLw1EQ2ml@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <c7b877e66ba0d34d8558c5af8bbb620e8c0e47d9.1755096883.git.robin.murphy@arm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7b877e66ba0d34d8558c5af8bbb620e8c0e47d9.1755096883.git.robin.murphy@arm.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 13, 2025 at 06:00:54PM +0100, Robin Murphy wrote:
> The group validation logic shared by the HiSilicon HNS3/PCIe drivers is
> a bit off, in that given a software group leader, it will consider that
> event *in place of* the actual new event being opened. At worst this
> could theoretically allow an unschedulable group if the software event
> config happens to look like one of the hardware siblings.
> 
> The uncore framework avoids that particular issue,

What is "the uncore framework"? I'm not sure exactly what you're
referring to, nor how that composes with the problem described above.

> but all 3 also share the common issue of not preventing racy access to
> the sibling list,

Can you please elaborate on this racy access to the silbing list? I'm
not sure exactly what you're referring to.

> and some redundant checks which can be cleaned up.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/perf/hisilicon/hisi_pcie_pmu.c   | 17 ++++++-----------
>  drivers/perf/hisilicon/hisi_uncore_pmu.c | 23 +++++++----------------
>  drivers/perf/hisilicon/hns3_pmu.c        | 17 ++++++-----------
>  3 files changed, 19 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_pcie_pmu.c b/drivers/perf/hisilicon/hisi_pcie_pmu.c
> index c5394d007b61..3b0b2f7197d0 100644
> --- a/drivers/perf/hisilicon/hisi_pcie_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_pcie_pmu.c
> @@ -338,21 +338,16 @@ static bool hisi_pcie_pmu_validate_event_group(struct perf_event *event)
>  	int counters = 1;
>  	int num;
>  
> -	event_group[0] = leader;
> -	if (!is_software_event(leader)) {
> -		if (leader->pmu != event->pmu)
> -			return false;
> +	if (leader == event)
> +		return true;
>  
> -		if (leader != event && !hisi_pcie_pmu_cmp_event(leader, event))
> -			event_group[counters++] = event;
> -	}
> +	event_group[0] = event;
> +	if (leader->pmu == event->pmu && !hisi_pcie_pmu_cmp_event(leader, event))
> +		event_group[counters++] = leader;

Looking at this, the existing logic to share counters (which
hisi_pcie_pmu_cmp_event() is trying to permit) looks to be bogus, given
that the start/stop callbacks will reprogram the HW counters (and hence
can fight with one another).

I suspect that can be removed *entirely*, and this can be simplified
down to allocating N counters, without a quadratic event comparison.  We
don't try to share counters in other PMU drivers, and there was no
rationale for trying to do this when this wa introduced in commit:

  8404b0fbc7fbd42e ("drivers/perf: hisi: Add driver for HiSilicon PCIe PMU")

The 'link' tag in that comment goes to v13, which doesn't link to prior
postings, so I'm not going to dig further.

Mark.

>  
>  	for_each_sibling_event(sibling, event->group_leader) {
> -		if (is_software_event(sibling))
> -			continue;
> -
>  		if (sibling->pmu != event->pmu)
> -			return false;
> +			continue;
>  
>  		for (num = 0; num < counters; num++) {
>  			/*
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> index a449651f79c9..3c531b36cf25 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> @@ -101,26 +101,17 @@ static bool hisi_validate_event_group(struct perf_event *event)
>  	/* Include count for the event */
>  	int counters = 1;
>  
> -	if (!is_software_event(leader)) {
> -		/*
> -		 * We must NOT create groups containing mixed PMUs, although
> -		 * software events are acceptable
> -		 */
> -		if (leader->pmu != event->pmu)
> -			return false;
> +	if (leader == event)
> +		return true;
>  
> -		/* Increment counter for the leader */
> -		if (leader != event)
> -			counters++;
> -	}
> +	/* Increment counter for the leader */
> +	if (leader->pmu == event->pmu)
> +		counters++;
>  
>  	for_each_sibling_event(sibling, event->group_leader) {
> -		if (is_software_event(sibling))
> -			continue;
> -		if (sibling->pmu != event->pmu)
> -			return false;
>  		/* Increment counter for each sibling */
> -		counters++;
> +		if (sibling->pmu == event->pmu)
> +			counters++;
>  	}
>  
>  	/* The group can not count events more than the counters in the HW */
> diff --git a/drivers/perf/hisilicon/hns3_pmu.c b/drivers/perf/hisilicon/hns3_pmu.c
> index c157f3572cae..382e469257f9 100644
> --- a/drivers/perf/hisilicon/hns3_pmu.c
> +++ b/drivers/perf/hisilicon/hns3_pmu.c
> @@ -1058,21 +1058,16 @@ static bool hns3_pmu_validate_event_group(struct perf_event *event)
>  	int counters = 1;
>  	int num;
>  
> -	event_group[0] = leader;
> -	if (!is_software_event(leader)) {
> -		if (leader->pmu != event->pmu)
> -			return false;
> +	if (leader == event)
> +		return true;
>  
> -		if (leader != event && !hns3_pmu_cmp_event(leader, event))
> -			event_group[counters++] = event;
> -	}
> +	event_group[0] = event;
> +	if (leader->pmu == event->pmu && !hns3_pmu_cmp_event(leader, event))
> +		event_group[counters++] = leader;
>  
>  	for_each_sibling_event(sibling, event->group_leader) {
> -		if (is_software_event(sibling))
> -			continue;
> -
>  		if (sibling->pmu != event->pmu)
> -			return false;
> +			continue;
>  
>  		for (num = 0; num < counters; num++) {
>  			/*
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 

