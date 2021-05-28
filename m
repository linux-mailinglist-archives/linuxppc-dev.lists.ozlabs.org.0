Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE66393EEE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 10:44:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fryt429NPz30D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 18:44:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=qcScMB+S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=qcScMB+S; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrysV2cwWz2xfr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 18:44:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Qocte5ZDDxyg+nBx07Z66plFtADe+KJYZN5F/bbZXMg=; b=qcScMB+S66DxYRxXKRflJuDWII
 /scoQsPaBPBYUP9hX5FVw2+QIfUSWKNFVXsQ0ctUzmluMv30a+VWPZe6TUv9ibOvqcO49yz/Xj2t9
 2LRlM2WxFAGvyIaXtDhRk0ehH2Ma93w+EqrjmtO+rj+QXPm14ftbVVVduZPcRptzFrAPxib3+bTvy
 CVrIW+7m4OiLUB0Vb6+P0BJubDOZZN2R7v0x84d0yWLXvht0lCKodxL0XVGI57mfcLp/h1CNlBWX4
 AoacQoh/lgDm2UxXpiJezQE25KJZFhhtpTP95JI6VgfYXW6Pj+DJzvjrlsUc2AAa/LPjdagbDVD/u
 059JRtmQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lmY5b-006OiA-4d; Fri, 28 May 2021 08:43:38 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8A580300221;
 Fri, 28 May 2021 10:43:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 50B76201DEF05; Fri, 28 May 2021 10:43:23 +0200 (CEST)
Date: Fri, 28 May 2021 10:43:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] sched/topology: Allow archs to populate distance map
Message-ID: <YLCtKziUgPTvPh1j@hirez.programming.kicks-ass.net>
References: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
 <20210520154427.1041031-2-srikar@linux.vnet.ibm.com>
 <YKaw33d71FpHjGnR@hirez.programming.kicks-ass.net>
 <20210521023802.GE2633526@linux.vnet.ibm.com>
 <YKdr0g6+eIHncqej@hirez.programming.kicks-ass.net>
 <20210521092830.GF2633526@linux.vnet.ibm.com>
 <87k0no6wuu.mognet@arm.com>
 <20210524161829.GL2633526@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524161829.GL2633526@linux.vnet.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev@lists.ozlabs.org, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 24, 2021 at 09:48:29PM +0530, Srikar Dronamraju wrote:
> * Valentin Schneider <valentin.schneider@arm.com> [2021-05-24 15:16:09]:

> > I suppose one way to avoid the hook would be to write some "fake" distance
> > values into your distance_lookup_table[] for offline nodes using your
> > distance_ref_point_depth thing, i.e. ensure an iteration of
> > node_distance(a, b) covers all distance values [1]. You can then keep patch
> > 3 around, and that should roughly be it.
> > 
> 
> Yes, this would suffice but to me its not very clean.
> static int found[distance_ref_point_depth];
> 
> for_each_node(node){
> 	int i, nd, distance = LOCAL_DISTANCE;
> 		goto out;
> 
> 	nd = node_distance(node, first_online_node)
> 	for (i=0; i < distance_ref_point_depth; i++, distance *= 2) {
> 		if (node_online) {
> 			if (distance != nd)
> 				continue;
> 			found[i] ++;
> 			break;
> 		}
> 		if (found[i])
> 			continue;
> 		distance_lookup_table[node][i] = distance_lookup_table[first_online_node][i];
> 		found[i] ++;
> 		break;
> 	}
> }
> 
> But do note: We are setting a precedent for node distance between two nodes
> to change.

Not really; or rather not more than already is the case AFAICT. Because
currently your distance table will have *something* in it
(LOCAL_DISTANCE afaict) for nodes that have never been online, which is
what triggered the whole problem to begin with.

Only after the node has come online for the first time, will it contain
the right value.

So both before and after this proposal the actual distance value changes
after the first time a node goes online.

Yes that's unfortunate, but I don't see a problem with pre-filling it
with something useful in order to avoid aditional arch hooks.


