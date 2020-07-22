Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1602293FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 10:51:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBThT5W7HzDr2N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 18:51:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=bAA051jA; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBTfH521LzDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 18:49:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0MdZWsXfOSzrpphaq5yn3/uApZ2HJH5s2c6LnYTQWjI=; b=bAA051jAuLR40JWxrp848gcYzM
 ZB6Vh98+ib5oHuDcldB6ngF2/JX5hS7H5GQ43X+C3NxI3dqO4r/uxkXI2BxwHX3XKYwu65Ez9aY3g
 xVblQT1hnpuOZNZSXDxLrWfs9jx1XfGeqqFQ+wwliWLZsB44Cy/bCc4hiDjeM3kJ4gg3Wg+EpVVP+
 7OLxrneq6vb5gxiFOXhm5k4/R34pxD6pLKeT0NDOt6F3fxT3IJEmXXpUj5RTVH6jVtoXzwGDnTqc9
 bBJu6EBN/TSxP9EuUfKwFNrELuBFPQzsa8RC2aQleD6LFrjDroQpvVw+Bt22AG2b1H0Iy91pPsKOO
 Tc3ioxTA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyAQp-0004OW-1K; Wed, 22 Jul 2020 08:48:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7DD403006D0;
 Wed, 22 Jul 2020 10:48:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 45D6320140AC8; Wed, 22 Jul 2020 10:48:54 +0200 (CEST)
Date: Wed, 22 Jul 2020 10:48:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 06/10] powerpc/smp: Generalize 2nd sched domain
Message-ID: <20200722084854.GL10769@hirez.programming.kicks-ass.net>
References: <20200721113814.32284-1-srikar@linux.vnet.ibm.com>
 <20200721113814.32284-7-srikar@linux.vnet.ibm.com>
 <20200722074624.GP119549@hirez.programming.kicks-ass.net>
 <20200722081822.GG9290@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722081822.GG9290@linux.vnet.ibm.com>
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
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Anton Blanchard <anton@au1.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 22, 2020 at 01:48:22PM +0530, Srikar Dronamraju wrote:
> * peterz@infradead.org <peterz@infradead.org> [2020-07-22 09:46:24]:
> 
> > On Tue, Jul 21, 2020 at 05:08:10PM +0530, Srikar Dronamraju wrote:
> > > Currently "CACHE" domain happens to be the 2nd sched domain as per
> > > powerpc_topology. This domain will collapse if cpumask of l2-cache is
> > > same as SMT domain. However we could generalize this domain such that it
> > > could mean either be a "CACHE" domain or a "BIGCORE" domain.
> > 
> > What's the whole smallcore vs bigcore thing?
> > 
> > Would it make sense to have an actual overview of the various topology
> > layers somewhere? Because I'm getting lost and can't really make sense
> > of the code due to that.
> 
> To quote with an example: using (Power 9)
> 
> Power 9 is an SMT 8 core by design. However this 8 thread core can run as 2
> independent core with threads 0,2,4 and 6 acting like a core, while threads
> 1,3,5,7 acting as another core.  
> 
> The firmware can decide to showcase them as 2 independent small cores or as
> one big core. However the LLC (i.e last level of cache) is shared between
> all the threads of the SMT 8 core. Future power chips, LLC might change, it
> may be expanded to share with another SMT 8 core or it could be made
> specific to SMT 4 core.
> 
> The smt 8 core is also known as fused core/ Big core.
> The smaller smt 4 core is known as small core.
> 
> So on a Power9 Baremetal, the firmware would show up as SMT4 core.
> and we have a CACHE level at SMT 8. CACHE level would be very very similar
> to MC domain in X86.
> 
> Hope this is clear.

Ooh, that thing. I thought P9 was in actual fact an SMT4 hardware part,
but to be compatible with P8 it has this fused option where two cores
act like a single SMT8 part.

The interleaving enumeration is done due to P7 asymmetric cores,
resuting in schedulers having the preference to use the lower threads.

Combined that results in a P9-fused configuration using two independent
full cores when there's only 2 runnable threads.

Which is a subtly different story from yours.

But reading your explanation, it looks like the Linux topology setup
could actually unravel the fused-faux-SMT8 into two independent SMT4
parts, negating that firmware option.

Anyway, a few comments just around there might be helpfull.


Thanks!
