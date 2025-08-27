Return-Path: <linuxppc-dev+bounces-11371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AC8B37D76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 10:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBcrV2GRdz3bV6;
	Wed, 27 Aug 2025 18:19:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756282762;
	cv=none; b=ifBEjnFxJWWpn6vp1svVxNj7H6LaMhVZ9/WtVEMDI5hNKpBV3NAvsRiEIEbMaERcw4eU9WqaMgTJPf8C8DQ8iyWwZUdWVJzBfeMJ2c+H7b3+LeA4tafjW8AphVvxrr06FIRWJeMsk7gxmoi7S+HqGraufmGB10rSpu99r3lgp73myy18S7uziS1iA2ACUH3TQfJscJ+7wAFd6FwA+IFVzKaGnqYRdqBVdGyTypegoZyDeJCICsJ8z4KfuiNaw4r7DDl+kGQ6XPa+GqRjGqH5t1/B+ijU2Rco9miFqLMgXpz5IUz9C0+aKBIP6V9R/B1BSeUd6AXjKpnMtLoO1Ffdaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756282762; c=relaxed/relaxed;
	bh=H/ZKN4AXnznjjxz4sALCwXVcm7RdFnLfhCOTExWdSXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cd5g773mi1O9YLCnjBIgbiC1XFzJGzfVbNLHKFrDPy1ICOqK/4zijFrfBEJtVXgIh2PmcyaZdI3G8nTA1hrVbGt15AARMQnQmGcHqXtMeb1jCYL5TORdv7ycHzV7wOFgCzkLxLmqoiyiSVN4XtNEdoa9oSYYKk4RP3PAMhy+qxL9gFr+ptwRgVctf27ZELXCCl2HJ+TQAE6OrChMAl8RHwowagGrf9EcK3DQRMaknCCXrgqgkX3q34F9FT63Tz3uWwd/jCOP9qfuaOC08IQcFMgAkRryCDHvWYN/nHRRtVkZ8ZTep9Q2cqqkR0eBm/VbD8Ntvowcn+DtDXtPnkGH+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBcrT2x0wz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 18:19:20 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 875DD1515;
	Wed, 27 Aug 2025 01:18:41 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8D1A3F694;
	Wed, 27 Aug 2025 01:18:41 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:18:38 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ian Rogers <irogers@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
	will@kernel.org, acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
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
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
Message-ID: <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
 <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
 <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 11:48:48AM -0700, Ian Rogers wrote:
> On Tue, Aug 26, 2025 at 8:32 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> > > On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> > >> It may have been different long ago, but today it seems wrong for these
> > >> drivers to skip counting disabled sibling events in group validation,
> > >> given that perf_event_enable() could make them schedulable again, and
> > >> thus increase the effective size of the group later. Conversely, if a
> > >> sibling event is truly dead then it stands to reason that the whole
> > >> group is dead, so it's not worth going to any special effort to try to
> > >> squeeze in a new event that's never going to run anyway. Thus, we can
> > >> simply remove all these checks.
> > >
> > > So currently you can do sort of a manual event rotation inside an
> > > over-sized group and have it work.
> > >
> > > I'm not sure if anybody actually does this, but its possible.
> > >
> > > Eg. on a PMU that supports only 4 counters, create a group of 5 and
> > > periodically cycle which of the 5 events is off.
> 
> I'm not sure this is true, I thought this would fail in the
> perf_event_open when adding the 5th event and there being insufficient
> counters for the group.

We're talking specifically about cases where the logic in a pmu's
pmu::event_init() callback doesn't count events in specific states, and
hence the 5th even doesn't get rejected when it is initialised.

For example, in arch/x86/events/core.c, validate_group() uses
collect_events(), which has:

	for_each_sibling_event(event, leader) {
		if (!is_x86_event(event) || event->state <= PERF_EVENT_STATE_OFF)
			continue;

		if (collect_event(cpuc, event, max_count, n))
			return -EINVAL;

		n++;
	}

... and so where an event's state is <= PERF_EVENT_STATE_OFF at init
time, that event is not counted to see if it fits into HW counters.

Mark.

