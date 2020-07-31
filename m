Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B90233CBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 03:06:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHpyj4ghQzDqYB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 11:06:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BHpww1Zv9zDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 11:05:18 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A35E21FB;
 Thu, 30 Jul 2020 18:05:15 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D95F83F718;
 Thu, 30 Jul 2020 18:05:13 -0700 (PDT)
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
 <20200727053230.19753-10-srikar@linux.vnet.ibm.com>
 <jhjr1sviswg.mognet@arm.com> <20200729061355.GA14603@linux.vnet.ibm.com>
User-agent: mu4e 0.9.17; emacs 26.3
From: Valentin Schneider <valentin.schneider@arm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 09/10] Powerpc/smp: Create coregroup domain
In-reply-to: <20200729061355.GA14603@linux.vnet.ibm.com>
Date: Fri, 31 Jul 2020 02:05:11 +0100
Message-ID: <jhjlfj0ijeg.mognet@arm.com>
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


(+Cc Morten)

On 29/07/20 07:13, Srikar Dronamraju wrote:
> * Valentin Schneider <valentin.schneider@arm.com> [2020-07-28 16:03:11]:
>
> Hi Valentin,
>
> Thanks for looking into the patches.
>
>> On 27/07/20 06:32, Srikar Dronamraju wrote:
>> > Add percpu coregroup maps and masks to create coregroup domain.
>> > If a coregroup doesn't exist, the coregroup domain will be degenerated
>> > in favour of SMT/CACHE domain.
>> >
>>
>> So there's at least one arm64 platform out there with the same "pairs of
>> cores share L2" thing (Ampere eMAG), and that lives quite happily with the
>> default scheduler topology (SMT/MC/DIE). Each pair of core gets its MC
>> domain, and the whole system is covered by DIE.
>>
>> Now arguably it's not a perfect representation; DIE doesn't have
>> SD_SHARE_PKG_RESOURCES so the highest level sd_llc can point to is MC. That
>> will impact all callsites using cpus_share_cache(): in the eMAG case, only
>> pairs of cores will be seen as sharing cache, even though *all* cores share
>> the same L3.
>>
>
> Okay, Its good to know that we have a chip which is similar to P9 in
> topology.
>
>> I'm trying to paint a picture of what the P9 topology looks like (the one
>> you showcase in your cover letter) to see if there are any similarities;
>> from what I gather in [1], wikichips and your cover letter, with P9 you can
>> have something like this in a single DIE (somewhat unsure about L3 setup;
>> it looks to be distributed?)
>>
>>      +---------------------------------------------------------------------+
>>      |                                  L3                                 |
>>      +---------------+-+---------------+-+---------------+-+---------------+
>>      |       L2      | |       L2      | |       L2      | |       L2      |
>>      +------+-+------+ +------+-+------+ +------+-+------+ +------+-+------+
>>      |  L1  | |  L1  | |  L1  | |  L1  | |  L1  | |  L1  | |  L1  | |  L1  |
>>      +------+ +------+ +------+ +------+ +------+ +------+ +------+ +------+
>>      |4 CPUs| |4 CPUs| |4 CPUs| |4 CPUs| |4 CPUs| |4 CPUs| |4 CPUs| |4 CPUs|
>>      +------+ +------+ +------+ +------+ +------+ +------+ +------+ +------+
>>
>> Which would lead to (ignoring the whole SMT CPU numbering shenanigans)
>>
>> NUMA     [                                                   ...
>> DIE      [                                             ]
>> MC       [         ] [         ] [         ] [         ]
>> BIGCORE  [         ] [         ] [         ] [         ]
>> SMT      [   ] [   ] [   ] [   ] [   ] [   ] [   ] [   ]
>>          00-03 04-07 08-11 12-15 16-19 20-23 24-27 28-31  <other node here>
>>
>
> What you have summed up is perfectly what a P9 topology looks like. I dont
> think I could have explained it better than this.
>

Yay!

>> This however has MC == BIGCORE; what makes it you can have different spans
>> for these two domains? If it's not too much to ask, I'd love to have a P9
>> topology diagram.
>>
>> [1]: 20200722081822.GG9290@linux.vnet.ibm.com
>
> At this time the current topology would be good enough i.e BIGCORE would
> always be equal to a MC. However in future we could have chips that can have
> lesser/larger number of CPUs in llc than in a BIGCORE or we could have
> granular or split L3 caches within a DIE. In such a case BIGCORE != MC.
>

Right, that one's fair enough.

> Also in the current P9 itself, two neighbouring core-pairs form a quad.
> Cache latency within a quad is better than a latency to a distant core-pair.
> Cache latency within a core pair is way better than latency within a quad.
> So if we have only 4 threads running on a DIE all of them accessing the same
> cache-lines, then we could probably benefit if all the tasks were to run
> within the quad aka MC/Coregroup.
>

Did you test this? WRT load balance we do try to balance "load" over the
different domain spans, so if you represent quads as their own MC domain,
you would AFAICT end up spreading tasks over the quads (rather than packing
them) when balancing at e.g. DIE level. The desired behaviour might be
hackable with some more ASYM_PACKING, but I'm not sure I should be
suggesting that :-)

> I have found some benchmarks which are latency sensitive to benefit by
> having a grouping a quad level (using kernel hacks and not backed by
> firmware changes). Gautham also found similar results in his experiments
> but he only used binding within the stock kernel.
>

IIUC you reflect this "fabric quirk" (i.e. coregroups) using this DT
binding thing.

That's also where things get interesting (for me) because I experienced
something similar on another arm64 platform (ThunderX1). This was more
about cache bandwidth than cache latency, but IMO it's in the same bag of
fabric quirks. I blabbered a bit about this at last LPC [1], but kind of
gave up on it given the TX1 was the only (arm64) platform where I could get
both significant and reproducible results.

Now, if you folks are seeing this on completely different hardware and have
"real" workloads that truly benefit from this kind of domain partitioning,
this might be another incentive to try and sort of generalize this. That's
outside the scope of your series, but your findings give me some hope!

I think what I had in mind back then was that if enough folks cared about
it, we might get some bits added to the ACPI spec; something along the
lines of proximity domains for the caches described in PPTT, IOW a cache
distance matrix. I don't really know what it'll take to get there, but I
figured I'd dump this in case someone's listening :-)

> I am not setting SD_SHARE_PKG_RESOURCES in MC/Coregroup sd_flags as in MC
> domain need not be LLC domain for Power.

From what I understood your MC domain does seem to map to LLC; but in any
case, shouldn't you set that flag at least for BIGCORE (i.e. L2)? AIUI with
your changes your sd_llc is gonna be SMT, and that's not going to be a very
big mask. IMO you do want to correctly reflect your LLC situation via this
flag to make cpus_share_cache() work properly.

[1]: https://linuxplumbersconf.org/event/4/contributions/484/
