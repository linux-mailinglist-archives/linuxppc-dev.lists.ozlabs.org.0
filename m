Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BC338FEF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 12:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq996175kz30CZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 20:21:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Fq98m6w0vz2yX9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 20:21:10 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECC79D6E;
 Tue, 25 May 2021 03:21:06 -0700 (PDT)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 148883F719;
 Tue, 25 May 2021 03:21:04 -0700 (PDT)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] sched/topology: Allow archs to populate distance map
In-Reply-To: <20210524161829.GL2633526@linux.vnet.ibm.com>
References: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
 <20210520154427.1041031-2-srikar@linux.vnet.ibm.com>
 <YKaw33d71FpHjGnR@hirez.programming.kicks-ass.net>
 <20210521023802.GE2633526@linux.vnet.ibm.com>
 <YKdr0g6+eIHncqej@hirez.programming.kicks-ass.net>
 <20210521092830.GF2633526@linux.vnet.ibm.com> <87k0no6wuu.mognet@arm.com>
 <20210524161829.GL2633526@linux.vnet.ibm.com>
Date: Tue, 25 May 2021 11:21:02 +0100
Message-ID: <87h7irglm9.mognet@arm.com>
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
 Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/05/21 21:48, Srikar Dronamraju wrote:
> * Valentin Schneider <valentin.schneider@arm.com> [2021-05-24 15:16:09]:
>> Ok so from your arch you can figure out the *size* of the set of unique
>> distances, but not the individual node_distance(a, b)... That's quite
>> unfortunate.
>
> Yes, thats true.
>
>>
>> I suppose one way to avoid the hook would be to write some "fake" distance
>> values into your distance_lookup_table[] for offline nodes using your
>> distance_ref_point_depth thing, i.e. ensure an iteration of
>> node_distance(a, b) covers all distance values [1]. You can then keep patch
>> 3 around, and that should roughly be it.
>>
>
> Yes, this would suffice but to me its not very clean.
> static int found[distance_ref_point_depth];
>
> for_each_node(node){
>       int i, nd, distance = LOCAL_DISTANCE;
>               goto out;
>
>       nd = node_distance(node, first_online_node)
>       for (i=0; i < distance_ref_point_depth; i++, distance *= 2) {
>               if (node_online) {
>                       if (distance != nd)
>                               continue;
>                       found[i] ++;
>                       break;
>               }
>               if (found[i])
>                       continue;
>               distance_lookup_table[node][i] = distance_lookup_table[first_online_node][i];
>               found[i] ++;
>               break;
>       }
> }
>
> But do note: We are setting a precedent for node distance between two nodes
> to change.
>

Indeed. AFAICT it's that or the unique-distance-values hook :/
