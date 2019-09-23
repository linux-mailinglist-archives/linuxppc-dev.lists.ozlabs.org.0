Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2DCBBA05
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 18:54:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cVmM6kZLzDqL2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 02:54:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cVkC5FY3zDqJ8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 02:52:50 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05249B618;
 Mon, 23 Sep 2019 16:52:44 +0000 (UTC)
Date: Mon, 23 Sep 2019 18:52:35 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190923165235.GD17206@dhcp22.suse.cz>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923154852.GG2369@hirez.programming.kicks-ass.net>
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, cai@lca.pw, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, x86@kernel.org,
 Yunsheng Lin <linyunsheng@huawei.com>, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, mattst88@gmail.com,
 len.brown@intel.com, gor@linux.ibm.com, anshuman.khandual@arm.com,
 gregkh@linuxfoundation.org, bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, rafael@kernel.org,
 ink@jurassic.park.msu.ru, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 23-09-19 17:48:52, Peter Zijlstra wrote:
> On Mon, Sep 23, 2019 at 05:28:56PM +0200, Michal Hocko wrote:
> > On Mon 23-09-19 17:15:19, Peter Zijlstra wrote:
> 
> > > > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > > > index 4123100e..9859acb 100644
> > > > --- a/arch/x86/mm/numa.c
> > > > +++ b/arch/x86/mm/numa.c
> > > > @@ -861,6 +861,9 @@ void numa_remove_cpu(int cpu)
> > > >   */
> > > >  const struct cpumask *cpumask_of_node(int node)
> > > >  {
> > > > +	if (node == NUMA_NO_NODE)
> > > > +		return cpu_online_mask;
> > > 
> > > This mandates the caller holds cpus_read_lock() or something, I'm pretty
> > > sure that if I put:
> > > 
> > > 	lockdep_assert_cpus_held();
> > 
> > Is this documented somewhere?
> 
> No idea... common sense :-)

I thought that and cpuhotplug were forbiden to be used in the same
sentence :p

> > Also how does that differ from a normal
> > case when a proper node is used? The cpumask will always be dynamic in
> > the cpu hotplug presence, right?
> 
> As per normal yes, and I'm fairly sure there's a ton of bugs. Any
> 'online' state is subject to change except when you're holding
> sufficient locks to stop it.
> 
> Disabling preemption also stabilizes it, because cpu unplug relies on
> stop-machine.

OK, I guess it is fair to document that callers should be careful when
using this if they absolutely need any stability. But I strongly suspect
they simply do not care all that much. They mostly do care to have
something that gives them an idea which CPUs are close to the device and
that can tolerate some race.

In other words this is more of an optimization than a correctness issue.
 
> > > here, it comes apart real quick. Without holding the cpu hotplug lock,
> > > the online mask is gibberish.
> > 
> > Can the returned cpu mask go away?
> 
> No, the cpu_online_mask itself has static storage, the contents OTOH can
> change at will. Very little practical difference :-)
 
OK, thanks for the confirmation. I was worried that I've overlooked
something.

To the NUMA_NO_NODE itself. Your earlier email noted:
: > +
: >  	if ((unsigned)node >= nr_node_ids) {
: >  		printk(KERN_WARNING
: >  			"cpumask_of_node(%d): (unsigned)node >= nr_node_ids(%u)\n",
: 
: I still think this makes absolutely no sense what so ever.

Did you mean the NUMA_NO_NODE handling or the specific node >= nr_node_ids
check?

Because as to NUMA_NO_NODE I believe this makes sense because this is
the only way that a device is not bound to any numa node. I even the
ACPI standard is considering this optional. Yunsheng Lin has referred to
the specific part of the standard in one of the earlier discussions.
Trying to guess the node affinity is worse than providing all CPUs IMHO.
-- 
Michal Hocko
SUSE Labs
