Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D022BBD18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:38:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cbks0sntzDqMN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:38:45 +1000 (AEST)
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
 header.b="Rp7KwCGB"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cbfF3DYBzDq6N
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:34:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jeUp5+lKmcF/04ueHLJZUYIvt6Ip7WoukEyBumn2fVY=; b=Rp7KwCGBA1u0fTRuTtn353Iqg
 U1m+WAQt9nn2fAGVujebKUGETSc3lGylxo6ybOFrC6OjqOh6jQ3v/DS5f3WAkIPyz8mslZ534nPPF
 w/unipekNmfUEpWS+8sKsDNny4hh/TUmdhJAPIZWH2ZRICzTYlxFR1ynoVzBW1pYsSzPlTXy9kFo8
 Isg6dRFXpBOi7a6PiA7uGzWX65FTAfllSiv/KpO5JJ5OOAofnU1CPXj0xiiTFQerXgpuCzvcT/6/Q
 SuqnTR2lR5rXkZN2iOh+yxAo8ns7Qujb+vZw/+amd8qwDo2R1+BLFhPLMDyxnUTx5OlVv5h2LyDch
 CDhZ19tzw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCV2F-0002BC-Is; Mon, 23 Sep 2019 20:34:15 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C0BAA301A7A;
 Mon, 23 Sep 2019 22:33:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0BAD120D80D4E; Mon, 23 Sep 2019 22:34:11 +0200 (CEST)
Date: Mon, 23 Sep 2019 22:34:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190923203410.GI2369@hirez.programming.kicks-ass.net>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923165235.GD17206@dhcp22.suse.cz>
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

On Mon, Sep 23, 2019 at 06:52:35PM +0200, Michal Hocko wrote:
> On Mon 23-09-19 17:48:52, Peter Zijlstra wrote:

> To the NUMA_NO_NODE itself. Your earlier email noted:
> : > +
> : >  	if ((unsigned)node >= nr_node_ids) {
> : >  		printk(KERN_WARNING
> : >  			"cpumask_of_node(%d): (unsigned)node >= nr_node_ids(%u)\n",
> : 
> : I still think this makes absolutely no sense what so ever.
> 
> Did you mean the NUMA_NO_NODE handling or the specific node >= nr_node_ids
> check?

The NUMA_NO_NODE thing. It's is physical impossibility. And if the
device description doesn't give us a node, then the description is
incomplete and wrong and we should bloody well complain about it.

> Because as to NUMA_NO_NODE I believe this makes sense because this is
> the only way that a device is not bound to any numa node.

Which is a physical impossibility.

> I even the
> ACPI standard is considering this optional. Yunsheng Lin has referred to
> the specific part of the standard in one of the earlier discussions.
> Trying to guess the node affinity is worse than providing all CPUs IMHO.

I'm saying the ACPI standard is wrong. Explain to me how it is
physically possible to have a device without NUMA affinity in a NUMA
system?

 1) The fundamental interconnect is not uniform.
 2) The device needs to actually be somewhere.

From these it seems to follow that access to the device is subject to
NUMA.

