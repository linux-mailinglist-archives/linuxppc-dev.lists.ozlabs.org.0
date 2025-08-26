Return-Path: <linuxppc-dev+bounces-11334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A34A1B36DE0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 17:32:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBBW447Bkz3dVW;
	Wed, 27 Aug 2025 01:32:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756222368;
	cv=none; b=P4yDfhzW/bTywKms9D28BRMruWfdAGchImPL85/s8FoLCFP8pIfw3OsIkRevb/5KXiVTBGHBUTJH7X1UkvFl13ymzT+222Sz6f6NceqmuS0L6gLUc8qVZ0Itiqx9OPYA+W4GX/laXcl6d0zXgPaqILYT25U0ETnTxyze2c+s/IP2G0jMuIf2pAOsqjWg2dJcx0J2Tx+oMNiMwMaxnjrkr+kvLvNuZX4d18Zey88q1zinHvE/emgFkIZ7YEVxhbvquEGg4NYItsaDbJ70luTx9xFoMgHRpTzjDZmFniFQnZFX4vYBt4T+gC5UfQdqinDJS08lzoxpoD6vViMHQINoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756222368; c=relaxed/relaxed;
	bh=FcndkzIKdhQTHHJTPG9dU2kV/c8wF3eTUqiMjqK+Ok4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANvh0CZgMZS+uKqOuWUeO09FxSDj0zP8a78kAyDFAyigR2iloxWLJz0k6smwufB+xtJeICLCfe5mpu9aB6oe3yCWXoy/ZZJc/Ot3Nb9uNdMHCGiGHSUeunBJ7XFlze7uvf6fOKvjLd/dHuGVbp4uIwnmeGwwnA58rRFmb1RSBRUiM5nyCkfSYk78qKlhYQXDa3CyJe+RIjV7A55Hgeq81rpzAUTvZdTfR+WdNpTsokRQicKnhxvq5HgFVx5RUIFiYyDlLccyGbXSSHQVm47rjqRjxCVIpaIXe8Jhfl+ZD9cB77KHWwJniMAPV2Jau/h9DP7tQGGrOkKGVz/7cJypIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBBW35l3tz3dVJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 01:32:47 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E872169E;
	Tue, 26 Aug 2025 08:32:08 -0700 (PDT)
Received: from [10.57.4.86] (unknown [10.57.4.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 893E73F63F;
	Tue, 26 Aug 2025 08:32:09 -0700 (PDT)
Message-ID: <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
Date: Tue, 26 Aug 2025 16:32:07 +0100
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
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, will@kernel.org, mark.rutland@arm.com, acme@kernel.org,
 namhyung@kernel.org, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
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
 <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
>> It may have been different long ago, but today it seems wrong for these
>> drivers to skip counting disabled sibling events in group validation,
>> given that perf_event_enable() could make them schedulable again, and
>> thus increase the effective size of the group later. Conversely, if a
>> sibling event is truly dead then it stands to reason that the whole
>> group is dead, so it's not worth going to any special effort to try to
>> squeeze in a new event that's never going to run anyway. Thus, we can
>> simply remove all these checks.
> 
> So currently you can do sort of a manual event rotation inside an
> over-sized group and have it work.
> 
> I'm not sure if anybody actually does this, but its possible.
> 
> Eg. on a PMU that supports only 4 counters, create a group of 5 and
> periodically cycle which of the 5 events is off.
> 
> So I'm not against changing this, but changing stuff like this always
> makes me a little fearful -- it wouldn't be the first time that when it
> finally trickles down to some 'enterprise' user in 5 years someone comes
> and finally says, oh hey, you broke my shit :-(

Eww, I see what you mean... and I guess that's probably lower-overhead 
than actually deleting and recreating the sibling event(s) each time, 
and potentially less bother then wrangling multiple groups for different 
combinations of subsets when one simply must still approximate a complex 
metric that requires more counters than the hardware offers.

I'm also not keen to break anything that wasn't already somewhat broken, 
especially since this patch is only intended as cleanup, so either we 
could just drop it altogether, or perhaps I can wrap the existing 
behaviour in a helper that can at least document this assumption and 
discourage new drivers from copying it. Am I right that only 
PERF_EVENT_STATE_{OFF,ERROR} would matter for this, though, and my 
reasoning for state <= PERF_EVENT_STATE_EXIT should still stand? As for 
the fiddly discrepancy with enable_on_exec between arm_pmu and others 
I'm not really sure what to think...

Thanks,
Robin.

