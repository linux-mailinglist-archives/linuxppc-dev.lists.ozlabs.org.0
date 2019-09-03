Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF6A6255
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 09:14:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Myqd6vMGzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 17:14:05 +1000 (AEST)
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
 header.b="mcKB7buJ"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MynW2S1czDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 17:12:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zwxp+c+L0XcXiND/Up9AgQ7t+fEuUmdVocZXo3Qqe04=; b=mcKB7buJT5zHiUPtSCwf6iBTV
 sYZoZUXwyH9dxpMxayzv/rQ36g5XchMKy7nNXoihi8g5EaKfANU0B61vKlk9LuYIf6C2UX1uvAl/Y
 P6grJncNoAjvBnYNcGu0YsWl/wZMyKa3FFt06lbU3k5jwwXMPWd+2APOwAx3X9DgjJB2d7KGvfRzl
 kiGulsFYXW8JPueD7pHuzSkqrsY2EDw+wCaFtLTuVNKEq49GNsFsXBT4YeXny3iEV0RlAtYTuaydW
 5KodkX1NWMPgJac3SaB6mjuWvLc5/Dv07meiDh/q/KcmP46uBpHMEnJAoaspcpAZGhi52t7mZ5utL
 AtRn2Z8zQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i52yC-0000Ay-5C; Tue, 03 Sep 2019 07:11:17 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 33F863011DF;
 Tue,  3 Sep 2019 09:10:35 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4468E2022F84F; Tue,  3 Sep 2019 09:11:11 +0200 (CEST)
Date: Tue, 3 Sep 2019 09:11:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Message-ID: <20190903071111.GU2369@hirez.programming.kicks-ass.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
 <5fa2aa99-89fa-cd41-b090-36a23cfdeb73@huawei.com>
 <20190902125644.GQ2369@hirez.programming.kicks-ass.net>
 <1f48081c-c9d6-8f3e-9559-8b0bec98f125@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f48081c-c9d6-8f3e-9559-8b0bec98f125@huawei.com>
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
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com, linuxarm@huawei.com,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, bp@alien8.de, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, x86@kernel.org, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, nfont@linux.vnet.ibm.com,
 mattst88@gmail.com, len.brown@intel.com, gor@linux.ibm.com,
 anshuman.khandual@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 ink@jurassic.park.msu.ru, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, tbogendoerfer@suse.de, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, cai@lca.pw, akpm@linux-foundation.org,
 robin.murphy@arm.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 03, 2019 at 02:19:04PM +0800, Yunsheng Lin wrote:
> On 2019/9/2 20:56, Peter Zijlstra wrote:
> > On Mon, Sep 02, 2019 at 08:25:24PM +0800, Yunsheng Lin wrote:
> >> On 2019/9/2 15:25, Peter Zijlstra wrote:
> >>> On Mon, Sep 02, 2019 at 01:46:51PM +0800, Yunsheng Lin wrote:
> >>>> On 2019/9/1 0:12, Peter Zijlstra wrote:
> >>>
> >>>>> 1) because even it is not set, the device really does belong to a node.
> >>>>> It is impossible a device will have magic uniform access to memory when
> >>>>> CPUs cannot.
> >>>>
> >>>> So it means dev_to_node() will return either NUMA_NO_NODE or a
> >>>> valid node id?
> >>>
> >>> NUMA_NO_NODE := -1, which is not a valid node number. It is also, like I
> >>> said, not a valid device location on a NUMA system.
> >>>
> >>> Just because ACPI/BIOS is shit, doesn't mean the device doesn't have a
> >>> node association. It just means we don't know and might have to guess.
> >>
> >> How do we guess the device's location when ACPI/BIOS does not set it?
> > 
> > See device_add(), it looks to the device's parent and on NO_NODE, puts
> > it there.
> > 
> > Lacking any hints, just stick it to node0 and print a FW_BUG or
> > something.
> > 
> >> It seems dev_to_node() does not do anything about that and leave the
> >> job to the caller or whatever function that get called with its return
> >> value, such as cpumask_of_node().
> > 
> > Well, dev_to_node() doesn't do anything; nor should it. It are the
> > callers of set_dev_node() that should be taking care.
> > 
> > Also note how device_add() sets the device node to the parent device's
> > node on NUMA_NO_NODE. Arguably we should change it to complain when it
> > finds NUMA_NO_NODE and !parent.
> 
> Is it possible that the node id set by device_add() become invalid
> if the node is offlined, then dev_to_node() may return a invalid
> node id.

In that case I would expect the device to go away too. Once the memory
controller goes away, the PCI bus connected to it cannot continue to
function.

> From the comment in select_fallback_rq(), it seems that a node can
> be offlined, not sure if node offline process has taken cared of that?
> 
> 	/*
>          * If the node that the CPU is on has been offlined, cpu_to_node()
>          * will return -1. There is no CPU on the node, and we should
>          * select the CPU on the other node.
>          */

Ugh, so I disagree with that notion. cpu_to_node() mapping should be
fixed, you simply cannot change it after boot, too much stuff relies on
it.

Setting cpu_to_node to -1 on node offline is just wrong. But alas, it
seems this is already so.

> With the above assumption that a device is always on a valid node,
> the node id returned from dev_to_node() can be safely passed to
> cpumask_of_node() without any checking?


