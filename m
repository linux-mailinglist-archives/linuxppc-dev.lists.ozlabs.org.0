Return-Path: <linuxppc-dev+bounces-11326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA07B361BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 15:12:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB7Ng24yHz3dTM;
	Tue, 26 Aug 2025 23:12:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756213923;
	cv=none; b=BW3/jreRX//PeRKVYl7qXBmxCFY4wKMOjMNzCC7kiGK0bbYpRwBk3fjGbG7IahGlQwbDXeNwqihLVbIBsAUY//eCPW/ObWMysnkxW/stsTQjs1YFe42A4WyBbdxM+wHk2JqOwcMjxW9C8gz83FFI7DAkKKlomUjIk715gG5Ilj2Ia6R5xOOZWo+f6BhywRt+Egm3B7vxQ5mYjQuyWz2s7xE2OHT/m8h/hYNu4HjqEktdVX2in/oO/t5qEO+HV0YDTiC7SkS1/ffHwgGGuzGg9c8+qvFq4TvBnekdhl7g161p3n61y0NYtJbqSLi/kIGAvy6k90vVs0gjZ+OufkEBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756213923; c=relaxed/relaxed;
	bh=qRMAhIvtwjCp1ECCw6f9h5i9YwLoIQo9z4NoCYc2WXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcVdn8jTAnRApn2OuofTb3J4uAKjEGMcYD7VHkxmCXK9XfaR0NTbDvAqZXvWjnj6rXEuTxA7pxMbutjhBMlDw+5hoemgzsHo4Ka7ACfTO91gnD6sIlwOOk5668LOBLwn5rpT0f9kVGXRQuG1t4gXOMhbojyK+64gIAByaGY5xa9odYe2BNreFYlMtDtgn/4QxbAxFhbJNiRc+TrlbvXl55gUmZGJTZCgdhrqV4zp4M+5R/V57aYPlCZUqZrjykZQjyvLGBRDZOkg9rm4YpTzcidHaRVUarDhzAM677EZuBZz4hT2QWDYag2loK8grlF5MX5jtF4nTGczdsuFF7/liQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=leo.yan@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=leo.yan@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB7Nf1J7Lz3dTH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 23:12:00 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D75BE1A25;
	Tue, 26 Aug 2025 06:11:18 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7A733F63F;
	Tue, 26 Aug 2025 06:11:26 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:11:24 +0100
From: Leo Yan <leo.yan@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
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
Subject: Re: [PATCH 16/19] perf: Introduce positive capability for sampling
Message-ID: <20250826131124.GB745921@e132581.arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
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
In-Reply-To: <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 13, 2025 at 06:01:08PM +0100, Robin Murphy wrote:
> Sampling is inherently a feature for CPU PMUs, given that the thing
> to be sampled is a CPU context. These days, we have many more
> uncore/system PMUs than CPU PMUs, so it no longer makes much sense to
> assume sampling support by default and force the ever-growing majority
> of drivers to opt out of it (or erroneously fail to). Instead, let's
> introduce a positive opt-in capability that's more obvious and easier to
> maintain.

[...]

> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 369e77ad5f13..dbd52851f5c6 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -955,7 +955,8 @@ static int arm_spe_pmu_perf_init(struct arm_spe_pmu *spe_pmu)
>  	spe_pmu->pmu = (struct pmu) {
>  		.module = THIS_MODULE,
>  		.parent		= &spe_pmu->pdev->dev,
> -		.capabilities	= PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
> +		.capabilities	= PERF_PMU_CAP_SAMPLING |
> +				  PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
>  		.attr_groups	= arm_spe_pmu_attr_groups,
>  		/*
>  		 * We hitch a ride on the software context here, so that

The change in Arm SPE driver looks good to me.

I noticed you did not set the flag for other AUX events, like Arm
CoreSight, Intel PT and bts. The drivers locate in:

  drivers/hwtracing/coresight/coresight-etm-perf.c
  arch/x86/events/intel/bts.c
  arch/x86/events/intel/pt.c

Genearlly, AUX events generate interrupts based on AUX ring buffer
watermark but not the period. Seems to me, it is correct to set the
PERF_PMU_CAP_SAMPLING flag for them.

A special case is Arm CoreSight legacy sinks (like ETR/ETB, etc)
don't has interrupt. We might need set or clear the flag on the fly
based on sink type:

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f1551c08ecb2..404edc94c198 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -433,6 +433,11 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
        if (!sink)
                goto err;
 
+       if (coresight_is_percpu_sink(sink))
+               event->pmu.capabilities = PERF_PMU_CAP_SAMPLING;
+       else
+               event->pmu.capabilities &= ~PERF_PMU_CAP_SAMPLING;
+

Thanks,
Leo

