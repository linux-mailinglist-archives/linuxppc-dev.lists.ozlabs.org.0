Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDABC7BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 14:15:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d0X63dFrzDqTP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 22:15:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="Er9FZK69"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d0PY6RmqzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 22:10:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Py99/bUhc96pJg4JneE/EcK3DluCeStWrFG1PdjjrUQ=; b=Er9FZK69DqPnnmZdOt8/DcwRo
 ALWJIRUL5g/PNUrF624BGuY8eUM12KssF79Ga1DDfsCUn6q4Q/noDQV3MDJzkMzDgjJ9K+Gsgx/qw
 z2jBYR36Lm9NISmBiwNgM1OVm93ble/u5hO8dnKM4Xjz6CBsyCWUGdblYT2QE6VUbNxVzuYf54LAD
 JCqYDtJVEUSCXS3/f3084ucmwUJUC3zu/8YHXTjtReGzSYU7Y0YKz05oE+4koDSooPl661Rq66knE
 eS4ZvXd6HuDlU5tg67hLR2FkTqQO1gGPVT9FjjlWTSU9bku1wTx3gPXroU8weR0USqNsZyzyqOcMH
 tK77ylYmQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCjda-0007nC-K2; Tue, 24 Sep 2019 12:09:46 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E7120305E54;
 Tue, 24 Sep 2019 14:08:57 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7FC4920C3E176; Tue, 24 Sep 2019 14:09:43 +0200 (CEST)
Date: Tue, 24 Sep 2019 14:09:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190924120943.GP2349@hirez.programming.kicks-ass.net>
References: <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <20190924074751.GB23050@dhcp22.suse.cz>
 <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924115401.GM23050@dhcp22.suse.cz>
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

On Tue, Sep 24, 2019 at 01:54:01PM +0200, Michal Hocko wrote:
> On Tue 24-09-19 13:23:49, Peter Zijlstra wrote:
> > On Tue, Sep 24, 2019 at 12:56:22PM +0200, Michal Hocko wrote:
> [...]
> > > To be honest I really fail to see why to object to a simple semantic
> > > that NUMA_NO_NODE imply all usable cpus. Could you explain that please?
> > 
> > Because it feels wrong. The device needs to be _somewhere_. It simply
> > cannot be node-less.
> 
> What if it doesn't have any numa preference for what ever reason? There
> is no other way to express that than NUMA_NO_NODE.

Like I said; how does that physically work? The device needs to be
somewhere. It _must_ have a preference.

> Anyway, I am not going to argue more about this because it seems more of
> a discussion about "HW shouldn't be doing that although the specification
> allows that" which cannot really have any outcome except of "feels
> correct/wrong".

We can push back and say we don't respect the specification because it
is batshit insane ;-)

> If you really feel strongly about this then we should think of a proper
> way to prevent this to happen because an out-of-bound access is
> certainly not something we really want, right?

I just genuinely don't understand it. And I refuse to duct tape it.

And as shown in that email here:

  https://lkml.kernel.org/r/5a188e2b-6c07-a9db-fbaa-561e9362d3ba@huawei.com

there is a ton of broken...

15.061682] node node0: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
...
15.285602] node node3: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.

15.360241] cpu cpu0: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
...
24.768305] cpu cpu127: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.

39.623339] clockevents clockevent0: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
...
48.769530] clockevents clockevent127: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.

That's all broken for no reason.. those things actually _have_ a trivial
node affinity.

By silently accepting we let this stuff fester.

Now granted; there's a number of virtual devices that really don't have
a node affinity, but then, those are not hurt by forcing them onto a
random node, they really don't do anything. Like:

48.913502] event_source armv8_pmuv3_0: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
48.985462] event_source breakpoint: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
49.057120] event_source uprobe: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
49.128431] event_source kprobe: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
49.199742] event_source tracepoint: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
49.271399] event_source software: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.

That's just fake devices to get a sysfs entry.
