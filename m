Return-Path: <linuxppc-dev+bounces-11327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B87B36271
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 15:19:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB7Xj3KM6z3dTV;
	Tue, 26 Aug 2025 23:19:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756214341;
	cv=none; b=WctbXBlYG1V9nvut90RKJRKf9pWfhrFXgpKxUszwpKUaWOvV8gkJS3zOAyzG1NJ94k0YWZO1K4POfOXXa9fEaMu4sxL4ZDQ+Yx9wbZbUwIuQn85aFHg9swKpz29nS2Xs3ABlbmZXMzlGVY3yOGXj2XeHx4o6DxmORBUNybR1JXZLTTWF8BTtTvFcfiGhCto7HAvufsVNf1UFKq8sLCvb9hqNCiYHp9ZWnaRUeiniJUMbWJbTj5sGIRbE2PtXmb7gaTv8xDIU72qX+m0IVegcD13A2rTZbMnlY713ZO+vmeB9KESdpd3eBN1jn40oOp7Wje/1w5HIfjsXLv9QgUTEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756214341; c=relaxed/relaxed;
	bh=HMGS7IGSOXk5Q1/Q6qxTcm4ZlvzCxxVLFiwmv/SBWY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Khp+diZcTUx9VK5SPIUYQGJV4/Bk9xikqjb/p3N+aHNmrNA96iDpbCDEie8rKMCo6L54Tore3cBC5lMMOcP2t3QX8wSrBfM/kI7W8zTgnvaJGzoVkZDrIisurQp1Y+rq11IUqzio/tDcDdCaXmCCcKkPAneCYl9xnoszR1t3bWa2K4MlsalkCs3o0zOfQhn3cSUcHuFVSycz5eHRYYUVXEXU0BssBQJWdNlCWIBd3hneDDrQ9HVBQcjs4rH4dVr0Ea1XjZzXDRXwNxh4Z7PTEBQL8M8n8eWZ8N2tc9IzjB+pVAJCt6Hb7ptJP82BV/LbfU+/XmkyjUc/qXOO+dZroA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB7Xh40Jpz3dTS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 23:18:59 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0DEB1A25;
	Tue, 26 Aug 2025 06:18:20 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E10B23F63F;
	Tue, 26 Aug 2025 06:18:22 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:18:16 +0100
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
Message-ID: <aK20GP5g1iu9DGrQ@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <c7b877e66ba0d34d8558c5af8bbb620e8c0e47d9.1755096883.git.robin.murphy@arm.com>
 <aK2XS_GhLw1EQ2ml@J2N7QTR9R3>
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
In-Reply-To: <aK2XS_GhLw1EQ2ml@J2N7QTR9R3>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 12:15:23PM +0100, Mark Rutland wrote:
> On Wed, Aug 13, 2025 at 06:00:54PM +0100, Robin Murphy wrote:
> > The group validation logic shared by the HiSilicon HNS3/PCIe drivers is
> > a bit off, in that given a software group leader, it will consider that
> > event *in place of* the actual new event being opened. At worst this
> > could theoretically allow an unschedulable group if the software event
> > config happens to look like one of the hardware siblings.
> > 
> > The uncore framework avoids that particular issue,
> 
> What is "the uncore framework"? I'm not sure exactly what you're
> referring to, nor how that composes with the problem described above.
> 
> > but all 3 also share the common issue of not preventing racy access to
> > the sibling list,
> 
> Can you please elaborate on this racy access to the silbing list? I'm
> not sure exactly what you're referring to.

Ah, I think you're referring to the issue in:

  https://lore.kernel.org/linux-arm-kernel/Zg0l642PgQ7T3a8Z@FVFF77S0Q05N/

... where when creatign a new event which is its own group leader,
lockdep_assert_event_ctx(event) fires in for_each_sibling_event(),
because the new event's context isn't locked...

> > diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> > index a449651f79c9..3c531b36cf25 100644
> > --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
> > +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> > @@ -101,26 +101,17 @@ static bool hisi_validate_event_group(struct perf_event *event)
> >  	/* Include count for the event */
> >  	int counters = 1;
> >  
> > -	if (!is_software_event(leader)) {
> > -		/*
> > -		 * We must NOT create groups containing mixed PMUs, although
> > -		 * software events are acceptable
> > -		 */
> > -		if (leader->pmu != event->pmu)
> > -			return false;
> > +	if (leader == event)
> > +		return true;

... and hence bailing out here avoids that?

It's not strictly "racy access to the sibling list", becuase there's
nothing else accessing the list; it's just that this is the simplest way
to appease lockdep while avoiding false negatives.

It'd probably be better to say something like "the common issue of
calling for_each_sibling_event() when initialising a new group leader",
and maybe to spell that out a bit.

Mark.

