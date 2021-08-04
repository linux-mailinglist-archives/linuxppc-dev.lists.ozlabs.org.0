Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 950D93DFF5C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 12:21:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gfnp53L52z3cZZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 20:21:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Gfnnb5hQdz2yWt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 20:20:49 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07A0113A1;
 Wed,  4 Aug 2021 03:20:46 -0700 (PDT)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24ECA3F66F;
 Wed,  4 Aug 2021 03:20:44 -0700 (PDT)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/2] sched/topology: Skip updating masks for non-online
 nodes
In-Reply-To: <20210804100155.GE4072958@linux.vnet.ibm.com>
References: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
 <20210701041552.112072-2-srikar@linux.vnet.ibm.com>
 <875yxu85wi.mognet@arm.com> <20210712124856.GA3836887@linux.vnet.ibm.com>
 <87zguqmay9.mognet@arm.com> <20210723143914.GI3836887@linux.vnet.ibm.com>
 <20210804100155.GE4072958@linux.vnet.ibm.com>
Date: Wed, 04 Aug 2021 11:20:41 +0100
Message-ID: <87r1f9a4ue.mognet@arm.com>
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
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/08/21 15:31, Srikar Dronamraju wrote:
> * Srikar Dronamraju <srikar@linux.vnet.ibm.com> [2021-07-23 20:09:14]:
>
>> * Valentin Schneider <valentin.schneider@arm.com> [2021-07-13 17:32:14]:
>>
>> > On 12/07/21 18:18, Srikar Dronamraju wrote:
>> > > Hi Valentin,
>> > >
>> > >> On 01/07/21 09:45, Srikar Dronamraju wrote:
>> > >> > @@ -1891,12 +1894,30 @@ void sched_init_numa(void)
>> > >> >  void sched_domains_numa_masks_set(unsigned int cpu)
>> > >> >  {
>> > >
>
> Hey Valentin / Peter
>
> Did you get a chance to look at this?
>

Barely, I wanted to set some time aside to stare at this and have been
failing miserably. Let me bump it up my todolist, I'll get to it before the
end of the week.

> --
> Thanks and Regards
> Srikar Dronamraju
