Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 381FED21AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 09:34:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pjX26ZwNzDqxQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 18:34:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=mhocko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pjTp4JjnzDqZV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 18:32:28 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D59DAABE3;
 Thu, 10 Oct 2019 07:32:20 +0000 (UTC)
Date: Thu, 10 Oct 2019 09:32:12 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20191010073212.GB18412@dhcp22.suse.cz>
References: <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
 <20190925104108.GE4553@hirez.programming.kicks-ass.net>
 <47fa4cee-8528-7c23-c7de-7be1b65aa2ae@huawei.com>
 <bec80499-86d9-bf1f-df23-9044a8099992@arm.com>
 <a5f0fc80-8e88-b781-77ce-1213e5d62125@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5f0fc80-8e88-b781-77ce-1213e5d62125@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, cai@lca.pw, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, x86@kernel.org, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, mattst88@gmail.com,
 len.brown@intel.com, gor@linux.ibm.com, anshuman.khandual@arm.com,
 gregkh@linuxfoundation.org, bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, rafael@kernel.org,
 ink@jurassic.park.msu.ru, akpm@linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 10-10-19 14:07:21, Yunsheng Lin wrote:
> On 2019/10/9 20:25, Robin Murphy wrote:
> > On 2019-10-08 9:38 am, Yunsheng Lin wrote:
> >> On 2019/9/25 18:41, Peter Zijlstra wrote:
> >>> On Wed, Sep 25, 2019 at 05:14:20PM +0800, Yunsheng Lin wrote:
> >>>>  From the discussion above, It seems making the node_to_cpumask_map()
> >>>> NUMA_NO_NODE aware is the most feasible way to move forwad.
> >>>
> >>> That's still wrong.
> >>
> >> Hi, Peter
> >>
> >> It seems this has trapped in the dead circle.
> >>
> >>  From my understanding, NUMA_NO_NODE which means not node numa preference
> >> is the state to describe the node of virtual device or the physical device
> >> that has equal distance to all cpu.
> >>
> >> We can be stricter if the device does have a nearer node, but we can not
> >> deny that a device does not have a node numa preference or node affinity,
> >> which also means the control or data buffer can be allocated at the node where
> >> the process is running.
> >>
> >> As you has proposed, making it -2 and have dev_to_node() warn if the device does
> >> have a nearer node and not set by the fw is a way to be stricter.
> >>
> >> But I think maybe being stricter is not really relevant to NUMA_NO_NODE, because
> >> we does need a state to describe the device that have equal distance to all node,
> >> even if it is not physically scalable.
> >>
> >> Any better suggestion to move this forward?
> > 
> > FWIW (since this is in my inbox), it sounds like the fundamental issue is that NUMA_NO_NODE is conflated for at least two different purposes, so trying to sort that out would be a good first step. AFAICS we have genuine "don't care" cases like alloc_pages_node(), where if the producer says it doesn't matter then the consumer is free to make its own judgement on what to do, and fundamentally different "we expect this thing to have an affinity but it doesn't, so we can't say what's appropriate" cases which could really do with some separate indicator like "NUMA_INVALID_NODE".
> > 
> > The tricky part is then bestowed on the producers to decide whether they can downgrade "invalid" to "don't care". You can technically build 'a device' whose internal logic is distributed between nodes and thus appears to have equal affinity - interrupt controllers, for example, may have per-CPU or per-node interfaces that end up looking like that - so although it's unlikely it's not outright nonsensical. Similarly a 'device' that's actually emulated behind a firmware call interface may well effectively have no real affinity.
> 
> We may set node of the physical device to NUMA_INVALID_NODE when fw does not
> provide one.
> 
> But what do we do about NUMA_INVALID_NODE when alloc_pages_node() is called
> with nid being NUMA_INVALID_NODE?

There is nothing sensible the allocator can do. The only point of
NUMA_INVALID_NODE would be to catch potential misconfiguration and
report them to users so they can complain to their HW/FS suppliers.

Pushing it to other susbystem doesn't make much sense IMHO because there
is nothing really actionable. Refusing an allocation altogether sounds
like a bad plan to me.
 
> If we change the node to default one(like node 0) when node of device is
> NUMA_INVALID_NODE in device_add(), how do we know the default one(like node 0)
> is the right one to choose?

Exactly. We cannot really assume any node in that situation.
 
> >From the privous disccusion, the below seems not get to consensus yet:
> 1) Do we need a state like NUMA_NO_NODE to describe that the device does not
>    have any numa preference?

This is a traditional meaning MM subsystem is using.

> 2) What do we do if the fw does not provide a node for the device? Should
>    we guess and pick one for it and how do we do the guessing? Or leave it
>    as it is and handle it as NUMA_NO_NODE?

As already pointed several times, picking any node is rather error
prone. You can never assume topology. We used to assume that there
always be node 0 but that is not really the case (see 3e8589963773
("memcg: make it work on sparse non-0-node systems")). Nodes might also
come and go so this might just lead to all sorts of subtle problems.

On the other hand using NUMA_NO_NODE as no preference could only lead to
slightly sub optimal performance.

I do agree with Peter that reporting a lack of affinity might be useful
but we shouldn't really try to clever and make up the affinity nilly
willy.
-- 
Michal Hocko
SUSE Labs
