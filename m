Return-Path: <linuxppc-dev+bounces-11323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3BBB360C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 15:03:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB7C55k95z3dT4;
	Tue, 26 Aug 2025 23:03:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756213425;
	cv=none; b=J+TIACz1ZrMcsVRcD4/V7Daf1WQjMsPlXvJ5l+/5YremmSjHx4pN5L92wDsO5cSZle1B2Pd+5/ri8BdLod09K7gOGNKexc1ya7uDwVyF+lSQ/I1hXPIa8AjM0qnJIa1bgOxoRNrawBcoxG2lcXii37SS9pg2erONcCvUih4xyaE1t+tS9GhNytaxHKQ+YmXIzp7E2U3Sg1+eZyoXGUgEmaB1SDtASwU3emkk+CKZBpAZLJp+7HVZH0ZYKuk2htfhdS6ITGKV4n8Z9p9UPuBXPC6VPL9XLiYfkYGyEH1Iy0cs+JyHXYRXBSnH5Lxvb4w9quICrcV7rL/eVhTOFYeXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756213425; c=relaxed/relaxed;
	bh=pe5SE8cLTPPyLKyF6S5l44TjxJSycuwoPwH53Hc4MBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jskxjagMXZU+mdvm4NY7oZiyjZBcT9UvHgnhe+3lk5XirP7lty0M81QVqGqgeb8Ex9XIYhzjudPHH1C4R5KJlBPU6c8NpQ239qscEC2kVRX1vpYDGfgUuOqkS1PV8kA2lIHWdDOzTTp8W20Hp0fjiG+XaOXd9aoVlrbu8xv7cdojGs52RopsazfD4qqyZnLqhF2FpGW+vNjqNSnRofZePpE5vpJksCqHEczmNLAVa9xnyrGCVVIqoiu+SYIXZhTF/lnFTLNbONXqChrYRUPIOxPHyPqoeL//yqPnxb1twNOKpA151eH0em8dQUsFmI1uso2MIVue9cw6nwj0KC00fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=s5T3h8Qu; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=s5T3h8Qu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB7C14tq9z3dSv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 23:03:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pe5SE8cLTPPyLKyF6S5l44TjxJSycuwoPwH53Hc4MBc=; b=s5T3h8QunORHMVi1lJq+TueBjc
	cEFljtvjN5QJ03jRIuUbqZT2dzYWLCkq7EIgZ1HjiZepKSvKZUS4jhIftbJpUomzAxLkXpo4MhYIl
	ZCvpLQBdWeqllwk2L5LEakNCj50aVxzY1I5n8BnO+qCbmyfysUZaBrevf4ZwX/NHQuj2PrtwGK3Is
	jhSt6FlQLnGrrRwVWOG3VEhB1mGDJu+1EhbkwSGhAG25rhQM5DyWklhsvsXQh2tW5FYLoYbc8dttl
	tsa9sX+EEmcEbn/jBCdJY0wOlh7GZntWiVjKPlxT8hw9CmspDWHiAZfhSZSTIR8f/mKGoVnI/OKYV
	DfymEZ2w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtKk-00000002CWx-1CxP;
	Tue, 26 Aug 2025 13:03:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E7FAC3002C5; Tue, 26 Aug 2025 15:03:29 +0200 (CEST)
Date: Tue, 26 Aug 2025 15:03:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mingo@redhat.com, will@kernel.org, mark.rutland@arm.com,
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
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
Message-ID: <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
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
In-Reply-To: <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> It may have been different long ago, but today it seems wrong for these
> drivers to skip counting disabled sibling events in group validation,
> given that perf_event_enable() could make them schedulable again, and
> thus increase the effective size of the group later. Conversely, if a
> sibling event is truly dead then it stands to reason that the whole
> group is dead, so it's not worth going to any special effort to try to
> squeeze in a new event that's never going to run anyway. Thus, we can
> simply remove all these checks.

So currently you can do sort of a manual event rotation inside an
over-sized group and have it work.

I'm not sure if anybody actually does this, but its possible.

Eg. on a PMU that supports only 4 counters, create a group of 5 and
periodically cycle which of the 5 events is off.

So I'm not against changing this, but changing stuff like this always
makes me a little fearful -- it wouldn't be the first time that when it
finally trickles down to some 'enterprise' user in 5 years someone comes
and finally says, oh hey, you broke my shit :-(


