Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6133EE0A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 02:02:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpWS12jhJz3cQq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 10:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GpWRW6rVkz303t
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 10:01:57 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 016031FB;
 Mon, 16 Aug 2021 17:01:54 -0700 (PDT)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBE6D3F66F;
 Mon, 16 Aug 2021 17:01:51 -0700 (PDT)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 1/2] sched/topology: Skip updating masks for non-online
 nodes
In-Reply-To: <20210816103347.GC21942@linux.vnet.ibm.com>
References: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
 <20210701041552.112072-2-srikar@linux.vnet.ibm.com>
 <875yxu85wi.mognet@arm.com> <20210712124856.GA3836887@linux.vnet.ibm.com>
 <87zguqmay9.mognet@arm.com> <20210723143914.GI3836887@linux.vnet.ibm.com>
 <87h7g09bgg.mognet@arm.com> <20210809065235.GH4072958@linux.vnet.ibm.com>
 <875yweaig9.mognet@arm.com> <20210810114727.GB21942@linux.vnet.ibm.com>
 <20210816103347.GC21942@linux.vnet.ibm.com>
Date: Tue, 17 Aug 2021 01:01:46 +0100
Message-ID: <87mtph6is5.mognet@arm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev@lists.ozlabs.org,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/08/21 16:03, Srikar Dronamraju wrote:
>>
>> Your version is much much better than mine.
>> And I have verified that it works as expected.
>>
>>
>
> Hey Peter/Valentin
>
> Are we waiting for any more feedback/testing for this?
>

I'm not overly fond of that last one, but AFAICT the only alternative is
doing a full-fledged NUMA topology rebuild on new-node onlining (i.e. make
calling sched_init_numa() more than once work). It's a lot more work for a
very particular usecase.

>
> --
> Thanks and Regards
> Srikar Dronamraju
