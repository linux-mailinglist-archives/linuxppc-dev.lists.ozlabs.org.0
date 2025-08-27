Return-Path: <linuxppc-dev+bounces-11370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE98B37CE9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 10:07:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBcZJ0zLlz3bb2;
	Wed, 27 Aug 2025 18:07:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756282024;
	cv=none; b=KcuVrhEUA3XuC2AewaZqu6DmMnEwdziLXpTxIdS6v5fwem1l99Tthe/tqG3MUZviAAztpQu48n6jMtlIG5uwHxk8B2JTS8RT+qCSpWbPl/CVKs0fn4rbLnO7KZV3XEMfMyyseNHS2z1OkR3XwoV7T3WLhQ50gkCklJHihWDkWtgLfhjI+Jm1BJljCyQ829I0TAZ/DSzpfB4ZYo5pXkjMdjabzjuhzhMbVT2IW2siPr7eSTbLqkxVDj7uzllvN0Am9+E5dNTh5i7Z+FSYF5qcv0V38CpGlXfyZGFZK2Brq8Mprmbq1sjgE+cas8E4pnj8xUm6lKU+B3cjkI9bnURCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756282024; c=relaxed/relaxed;
	bh=yB/U1vduxZJMUc4C3XcbfsTNrbRms+v/21L2Hk9RIPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1z4W4JN2r+plRdX3TcKwTBPYudlRAAvD5WQc3v8rQGm3hDhf4klci5JDkUqlJGX3expic3x6yadaVNnKDtwnZ/SuZy24MHF7oYSrO1qVmapi2XTIVZPCtOYZ6SvFYN77HqJOa3CLDzRyjU3ctKuD8rzVw45B8KktqgTwzpwz4hHpN6chk8fvrzEZGt7q56HDv6GFYi3ucqudjZi/jpg0ZZi3orka2P6dcT7w4LMyRZ3C4YbcWK2fLIj0xWeuCvZH7ZcAjNwJS+t9w7EP1CJmsb1QLZL4nNZp//yij5Y+jfc9ouIoLNmYvSNym89kuoO+IUQEAwSSIVF9BH3Vwzx3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=leo.yan@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=leo.yan@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBcZH4TPbz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 18:07:03 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35FE122FC;
	Wed, 27 Aug 2025 01:06:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B8693F694;
	Wed, 27 Aug 2025 01:06:32 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:06:30 +0100
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
Message-ID: <20250827080630.GC745921@e132581.arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
 <20250826131124.GB745921@e132581.arm.com>
 <983df32a-ba74-421d-bc20-06e778b4d2c9@arm.com>
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
In-Reply-To: <983df32a-ba74-421d-bc20-06e778b4d2c9@arm.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 04:53:51PM +0100, Robin Murphy wrote:

[...]

> > Genearlly, AUX events generate interrupts based on AUX ring buffer
> > watermark but not the period. Seems to me, it is correct to set the
> > PERF_PMU_CAP_SAMPLING flag for them.
> 
> This cap is given to drivers which handle event->attr.sample_period and call
> perf_event_overflow() - or in a few rare cases, perf_output_sample()
> directly - to do something meaningful with it, since the intent is to convey
> "I properly handle events for which is_sampling_event() is true". My
> understanding is that aux events are something else entirely, but I'm happy
> to be corrected.

If the discussion is based only on this patch, my understanding is
that the PERF_PMU_CAP_SAMPLING flag replaces the
PERF_PMU_CAP_NO_INTERRUPT flag for checking whether a PMU event needs
to be re-enabled in perf_adjust_freq_unthr_context().

AUX events can trigger a large number of interrupts under certain
conditions (e.g., if we set a very small watermark). This is why I
conclude that we need to set the PERF_PMU_CAP_SAMPLING flag to ensure
that AUX events are re-enabled properly after throttling (see
perf_adjust_freq_unthr_events()).

> Otherwise, perhaps this suggests it deserves to be named a little more
> specifically for clarity, maybe PERF_CAP_SAMPLING_EVENTS?

Seems to me, the naming is not critical. If without setting the
PERF_PMU_CAP_SAMPLING flag, AUX events might lose chance to be
re-enabled after throttling.

Thanks,
Leo

