Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0839122BD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 13:39:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cd4n6KgRzDqHL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 23:39:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="lN7ggJsd"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ccyz1zk4zDqW7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 23:34:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8mJuCyKjbY4p5hrL3FaFjHlnxABVvtHNpVH8k6QqFE0=; b=lN7ggJsd/PhLseMxdiALXg3R/
 4uvOheP59jmS2XidPb6H3ByQ2nZalq8GMhm2utOOQjYpdwsI58MstKlwnjNkiHKEnZ8uLhMASfJ7c
 E5/W85KbHse6owyrhCS0DfMhnYcSSNdnoKv/eEbX+6I3O5XujZmeUma7YV+9Jc5XzuuBhDUeOZgCA
 iUL2xvkoULaw5Vmp5lYrEO7nQPLLiXvcvf3pGP7onL4btwDxfiwQ5OBJ92zvsCJ1OmxSHWoes/FR7
 KHbQI3aBIAoOVK+uZSBTLzvQyhhTJp1hpN7Ox1wcgJK4hSVTftFYIEAX25EdeeiUP4RLFQEgEqyV0
 rpSU1zp/g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihC3Q-0006oK-7G; Tue, 17 Dec 2019 12:34:20 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5D3B830658B;
 Tue, 17 Dec 2019 13:32:54 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A7FAB2B2CF993; Tue, 17 Dec 2019 13:34:16 +0100 (CET)
Date: Tue, 17 Dec 2019 13:34:16 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 2/2] mm/mmu_gather: Avoid multiple page walk cache
 flush
Message-ID: <20191217123416.GH2827@hirez.programming.kicks-ass.net>
References: <20191217071713.93399-1-aneesh.kumar@linux.ibm.com>
 <20191217071713.93399-2-aneesh.kumar@linux.ibm.com>
 <20191217085854.GW2844@hirez.programming.kicks-ass.net>
 <32404765-ad4f-6612-d1a9-43f9acdc8a62@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32404765-ad4f-6612-d1a9-43f9acdc8a62@linux.ibm.com>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-mm@kvack.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 17, 2019 at 03:45:36PM +0530, Aneesh Kumar K.V wrote:
> On 12/17/19 2:28 PM, Peter Zijlstra wrote:
> > On Tue, Dec 17, 2019 at 12:47:13PM +0530, Aneesh Kumar K.V wrote:
> > > On tlb_finish_mmu() kernel does a tlb flush before  mmu gather table invalidate.
> > > The mmu gather table invalidate depending on kernel config also does another
> > > TLBI. Avoid the later on tlb_finish_mmu().
> > 
> > That is already avoided, if you look at tlb_flush_mmu_tlbonly() it does
> > __tlb_range_reset(), which results in ->end = 0, which then triggers the
> > early exit on the next invocation:
> > 
> > 	if (!tlb->end)
> > 		return;
> > 
> 
> Is that true for tlb->fulmm flush?

Hmm, no, but I'm thinking you patch is broken, even for that case. We
must issue the TLBI before call_rcu().

Perhaps if we replace !tlb->end with something like:

  !tlb->freed_tables && !tlb->cleared_p*

(which GCC should be able to do with a single load and mask)

I've not really thought too hard about it yet, I need to run some
errands, but I'll look at it more closely when I get back.
