Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF4BC7D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 14:28:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d0p84XTDzDqTm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 22:28:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d0ks33tzzDqSw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 22:25:08 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CB02AF23;
 Tue, 24 Sep 2019 12:25:04 +0000 (UTC)
Date: Tue, 24 Sep 2019 14:25:00 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190924122500.GP23050@dhcp22.suse.cz>
References: <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <20190924074751.GB23050@dhcp22.suse.cz>
 <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924120943.GP2349@hirez.programming.kicks-ass.net>
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

On Tue 24-09-19 14:09:43, Peter Zijlstra wrote:
> On Tue, Sep 24, 2019 at 01:54:01PM +0200, Michal Hocko wrote:
> > On Tue 24-09-19 13:23:49, Peter Zijlstra wrote:
> > > On Tue, Sep 24, 2019 at 12:56:22PM +0200, Michal Hocko wrote:
> > [...]
> > > > To be honest I really fail to see why to object to a simple semantic
> > > > that NUMA_NO_NODE imply all usable cpus. Could you explain that please?
> > > 
> > > Because it feels wrong. The device needs to be _somewhere_. It simply
> > > cannot be node-less.
> > 
> > What if it doesn't have any numa preference for what ever reason? There
> > is no other way to express that than NUMA_NO_NODE.
> 
> Like I said; how does that physically work? The device needs to be
> somewhere. It _must_ have a preference.
> 
> > Anyway, I am not going to argue more about this because it seems more of
> > a discussion about "HW shouldn't be doing that although the specification
> > allows that" which cannot really have any outcome except of "feels
> > correct/wrong".
> 
> We can push back and say we don't respect the specification because it
> is batshit insane ;-)

Here is my fingers crossed.

[...]

> Now granted; there's a number of virtual devices that really don't have
> a node affinity, but then, those are not hurt by forcing them onto a
> random node, they really don't do anything. Like:

Do you really consider a random node a better fix than simply living
with a more robust NUMA_NO_NODE which tells the actual state? Page
allocator would effectivelly use the local node in that case. Any code
using the cpumask will know that any of the online cpus are usable.

Compare that to a wild guess that might be easily wrong and have subtle
side effects which are really hard to debug. You will only see a higher
utilization on a specific node. Good luck with a bug report like that.

Anyway, I really do  not feel strongly about that. If you really consider
it a bad idea then I can live with that. This just felt easier and
reasonably consistent to address. Implementing the guessing and fighting
vendors who really do not feel like providing a real affinity sounds
harder and more error prone.
-- 
Michal Hocko
SUSE Labs
