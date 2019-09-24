Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E669CBC4AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 11:19:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cwd467GlzDqSy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 19:19:52 +1000 (AEST)
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
 header.b="EU4LTSeT"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cwZv0FTQzDqS3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 19:17:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YSjhyC1lKRB8fubVQEKHM7jmo9vsi65UYntnwYqseFQ=; b=EU4LTSeTtqxV9VDJrpZZt3ruH
 RnUeZYjlATkQ+o+C5+ROiZN27BBCfJWvlJpGuODkYxVTtV62XtX5u+/TfEtKgPtYuC1803wzuLpmo
 2NRs9TVIz3ep1Zn+JQmSdFozMjFEhHRxbvq6pJ8YgKJQi1fnRNB5AVgendjVY4EWEXJowjIdPUNCR
 WZaGzFSLI4kXTXE7qfdf1cSuSQDZmjTppV6oJ3/si42aaiLKltB1HLzzHaiUrFMFRHaV79PqFrXdK
 IIp4fjZa25loT69yYYRij/2g28K/hwTv9jO6JUBcBR5pKvlor6U9wf3iG2lizQwQog4BTjN5YHPBa
 CXn6Y9B3w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCgwi-0007gZ-I9; Tue, 24 Sep 2019 09:17:20 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 61313305E35;
 Tue, 24 Sep 2019 11:16:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E73F720D80D41; Tue, 24 Sep 2019 11:17:14 +0200 (CEST)
Date: Tue, 24 Sep 2019 11:17:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <20190924074751.GB23050@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924074751.GB23050@dhcp22.suse.cz>
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

On Tue, Sep 24, 2019 at 09:47:51AM +0200, Michal Hocko wrote:
> On Mon 23-09-19 22:34:10, Peter Zijlstra wrote:
> > On Mon, Sep 23, 2019 at 06:52:35PM +0200, Michal Hocko wrote:
> [...]
> > > I even the
> > > ACPI standard is considering this optional. Yunsheng Lin has referred to
> > > the specific part of the standard in one of the earlier discussions.
> > > Trying to guess the node affinity is worse than providing all CPUs IMHO.
> > 
> > I'm saying the ACPI standard is wrong.
> 
> Even if you were right on this the reality is that a HW is likely to
> follow that standard and we cannot rule out NUMA_NO_NODE being
> specified. As of now we would access beyond the defined array and that
> is clearly a bug.

Right, because the device node is wrong, so we fix _that_!

> Let's assume that this is really a bug for a moment. What are you going
> to do about that? BUG_ON? I do not really see any solution besides to either
> provide something sensible or BUG_ON. If you are worried about a
> conditional then this should be pretty easy to solve by starting the
> array at -1 index and associate it with the online cpu mask.

The same thing I proposed earlier; force the device node to 0 (or any
other convenient random valid value) and issue a FW_BUG message to the
console.

