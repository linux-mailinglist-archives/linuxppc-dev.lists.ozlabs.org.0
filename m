Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5FBB8FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 18:03:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cTdB33y0zDqGp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 02:03:26 +1000 (AEST)
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
 header.b="NXlQx8He"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cTLj2xf5zDqJS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 01:50:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0RDd3iHkouZU1pRFRB48/lD4Y4fOddJfRH7mBxc6Vao=; b=NXlQx8HeAqeDb6yqEaTk/519B
 dPw5dQx+43R/Xql9eX//W6l/1vbSDqJBsSKbX0+GgxGyR/lMzRBIJJLwaiBlYUPovHMUeZ4WuI2U9
 pqR/T7IrCuH324g5O+5uhidav3oL5K11yioHiIVa88PxC9Lhl8Af25UBQiNsPQjgWAv5dhal7H8Pm
 kjjT0b4sbkwdVtooJ5V/S1z3/O080RdL39Z8BxDGhymwdoNXrZ7KMaQqR08JJFpuEuA5JxPauwCNC
 NwI5i96tju02O7rB8oB1RofYv2QQUL82ESd4By1d+WKKUSotGlAN05bG1WBwAaFYH+M7oRF/I/hUL
 8rRYpfeYg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCQa9-0006CY-8C; Mon, 23 Sep 2019 15:49:02 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CEBBA303DFD;
 Mon, 23 Sep 2019 17:48:07 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0AF5F20D80D41; Mon, 23 Sep 2019 17:48:53 +0200 (CEST)
Date: Mon, 23 Sep 2019 17:48:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190923154852.GG2369@hirez.programming.kicks-ass.net>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923152856.GB17206@dhcp22.suse.cz>
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

On Mon, Sep 23, 2019 at 05:28:56PM +0200, Michal Hocko wrote:
> On Mon 23-09-19 17:15:19, Peter Zijlstra wrote:

> > > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > > index 4123100e..9859acb 100644
> > > --- a/arch/x86/mm/numa.c
> > > +++ b/arch/x86/mm/numa.c
> > > @@ -861,6 +861,9 @@ void numa_remove_cpu(int cpu)
> > >   */
> > >  const struct cpumask *cpumask_of_node(int node)
> > >  {
> > > +	if (node == NUMA_NO_NODE)
> > > +		return cpu_online_mask;
> > 
> > This mandates the caller holds cpus_read_lock() or something, I'm pretty
> > sure that if I put:
> > 
> > 	lockdep_assert_cpus_held();
> 
> Is this documented somewhere?

No idea... common sense :-)

> Also how does that differ from a normal
> case when a proper node is used? The cpumask will always be dynamic in
> the cpu hotplug presence, right?

As per normal yes, and I'm fairly sure there's a ton of bugs. Any
'online' state is subject to change except when you're holding
sufficient locks to stop it.

Disabling preemption also stabilizes it, because cpu unplug relies on
stop-machine.

> > here, it comes apart real quick. Without holding the cpu hotplug lock,
> > the online mask is gibberish.
> 
> Can the returned cpu mask go away?

No, the cpu_online_mask itself has static storage, the contents OTOH can
change at will. Very little practical difference :-)


