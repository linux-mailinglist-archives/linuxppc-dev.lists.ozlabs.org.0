Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C146A23B932
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 13:05:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLX300DT3zDqQh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 21:05:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BLX0s41SNzDqQ4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 21:03:07 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81C8430E;
 Tue,  4 Aug 2020 04:03:04 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5FBC3F6CF;
 Tue,  4 Aug 2020 04:03:02 -0700 (PDT)
References: <20200804033307.76111-1-srikar@linux.vnet.ibm.com>
 <20200804033307.76111-2-srikar@linux.vnet.ibm.com>
 <20200804104642.GC2657@hirez.programming.kicks-ass.net>
User-agent: mu4e 0.9.17; emacs 26.3
From: Valentin Schneider <valentin.schneider@arm.com>
To: peterz@infradead.org
Subject: Re: [PATCH 2/2] powerpc/topology: Override cpu_smt_mask
In-reply-to: <20200804104642.GC2657@hirez.programming.kicks-ass.net>
Date: Tue, 04 Aug 2020 12:02:49 +0100
Message-ID: <jhjeeomish2.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 04/08/20 11:46, peterz@infradead.org wrote:
> On Tue, Aug 04, 2020 at 09:03:07AM +0530, Srikar Dronamraju wrote:
>> On Power9 a pair of cores can be presented by the firmware as a big-core
>> for backward compatibility reasons, with 4 threads per (small) core and 8
>> threads per big-core. cpu_smt_mask() should generally point to the cpu mask
>> of the (small)core.
>>
>> In order to maintain userspace backward compatibility (with Power8 chips in
>> case of Power9) in enterprise Linux systems, the topology_sibling_cpumask
>> has to be set to big-core. Hence override the default cpu_smt_mask() to be
>> powerpc specific allowing for better scheduling behaviour on Power.
>
> Why does Linux userspace care about this?

Ditto; from [1], a core contains CPUs that all share the same L1 (and capacity,
as per SD_SHARE_CPUCAPACITY). So IMO it makes perfect sense to have a first
domain spanning L1, and its parent spanning L2 - that means
topology_sibling_cpumask *itself* should span a single core rather than a
pair.

[1]: https://lkml.kernel.org/r/jhjr1sviswg.mognet@arm.com
