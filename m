Return-Path: <linuxppc-dev+bounces-11380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F899B38461
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 16:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBmVW62kdz30WF;
	Thu, 28 Aug 2025 00:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756303459;
	cv=none; b=hYaXjTzyRXkORFVtfNPS8HbMENhZBK18h8pB4FYuh7bjDDtpcWekeoM5zuRaf3o06MfVcSV2m7BSYg+5GnQqLOMOLUeHMyEtJouwAZ146kqM0jay8SYOHIkH84k8XHMnGOiCdTGiA9y682MxP03P+I/wIWaXfABM2akjYoYw1JW22auuEjBIHlmYMvRCnu21HwgJQp0l2BNjUf20QsdwNG1aq+YDvNMzd7MYDobgyu398+KzZlzNvEtS4gJt9E+chm8dqYX56p9ZiBGP7vvIGWnuDJ3WmQu5LoiAfBmX+e0CnGHhOZYLYxqi/dL/ROeRu/RxQyBw/u3emUHXXK1dlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756303459; c=relaxed/relaxed;
	bh=CIcwa4mEV8udWC3JTKtbSQDAkWb5VGGkx9vjUqFkP6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPEQDxkX0G32fhvXn8jUHLJW+6SWS0hnuidT4h5tzOQOzZbqssRHTag69M0PKbN14icHA/LtRy4NKZsm95ovas55n1luhLngXWBTMaqCX0BiDWy1iS6srCjViZX5upef5M93eLPD8Q72FyslTfCcMJLJV/v3SIoE+I+82wapEqioifyvqvKGJgo19LRdyxvEN9QujZCHq6e1Z+hRBLE+Xf3wfJn6Q2NMWOm/eWVqjhvC+62u0UvmGL/SCqfAc9boRrRx2lOoIoHYlB5Zfu7873GkX2kpg2dhkEaEav4TQYqOuEjKFzjywmsTB8yCuHTWzLde6wMRDgN6VVhxOwcLmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBmVV67CJz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 00:04:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 417AD2720;
	Wed, 27 Aug 2025 07:03:36 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 662DB3F738;
	Wed, 27 Aug 2025 07:03:37 -0700 (PDT)
Date: Wed, 27 Aug 2025 15:03:22 +0100
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
Message-ID: <aK8QKlGsjB4WWg2e@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <c7b877e66ba0d34d8558c5af8bbb620e8c0e47d9.1755096883.git.robin.murphy@arm.com>
 <aK2XS_GhLw1EQ2ml@J2N7QTR9R3>
 <ab80cb84-42b2-4ce8-aa6c-4ce6be7a12b7@arm.com>
 <aK3TS3s5_Pczx1nu@J2N7QTR9R3>
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
In-Reply-To: <aK3TS3s5_Pczx1nu@J2N7QTR9R3>
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 04:31:23PM +0100, Mark Rutland wrote:
> On Tue, Aug 26, 2025 at 03:35:48PM +0100, Robin Murphy wrote:
> > On 2025-08-26 12:15 pm, Mark Rutland wrote:
> > > On Wed, Aug 13, 2025 at 06:00:54PM +0100, Robin Murphy wrote:

> > > > diff --git a/drivers/perf/hisilicon/hisi_pcie_pmu.c b/drivers/perf/hisilicon/hisi_pcie_pmu.c
> > > > index c5394d007b61..3b0b2f7197d0 100644
> > > > --- a/drivers/perf/hisilicon/hisi_pcie_pmu.c
> > > > +++ b/drivers/perf/hisilicon/hisi_pcie_pmu.c
> > > > @@ -338,21 +338,16 @@ static bool hisi_pcie_pmu_validate_event_group(struct perf_event *event)
> > > >   	int counters = 1;
> > > >   	int num;
> > > > -	event_group[0] = leader;
> > > > -	if (!is_software_event(leader)) {
> > > > -		if (leader->pmu != event->pmu)
> > > > -			return false;
> > > > +	if (leader == event)
> > > > +		return true;
> > > > -		if (leader != event && !hisi_pcie_pmu_cmp_event(leader, event))
> > > > -			event_group[counters++] = event;
> > > > -	}
> > > > +	event_group[0] = event;
> > > > +	if (leader->pmu == event->pmu && !hisi_pcie_pmu_cmp_event(leader, event))
> > > > +		event_group[counters++] = leader;
> > > 
> > > Looking at this, the existing logic to share counters (which
> > > hisi_pcie_pmu_cmp_event() is trying to permit) looks to be bogus, given
> > > that the start/stop callbacks will reprogram the HW counters (and hence
> > > can fight with one another).

> > It does seem somewhat nonsensical to have multiple copies of the same event
> > in the same group, but I imagine it could happen with some sort of scripted
> > combination of metrics, and supporting it at this level saves needing
> > explicit deduplication further up. So even though my initial instinct was to
> > rip it out too, in the end I concluded that that doesn't seem justified.
> 
> As above, I think it's clearly bogus. I don't think we should have
> merged it as-is and it's not something I'd like to see others copy.
> Other PMUs don't do this sort of event deduplication, and in general it
> should be up to the user or userspace software to do that rather than
> doing that badly in the kernel.
> 
> Given it was implemented with no rationale I think we should rip it out.
> If that breaks someone's scripting, then we can consider implementing
> something that actually works.

Having dug some more, I see that this was intended to handle the way
the hardware shares a single config register between pairs of counter
and counter_ext registers, with the idea being that two related events
could be allocated into the same counter pair (but would only occupy a
single counter each).

I still think the code is wrong, but it is more complex than I made it
out to be, and you're right that we should leave it as-is for now. I can
follow up after we've got this series in.

Mark.

