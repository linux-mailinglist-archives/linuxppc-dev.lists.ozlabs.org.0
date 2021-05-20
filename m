Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64D238B663
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 20:58:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmJsX45TZz3bv2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 04:58:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GY/JpBAj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=GY/JpBAj; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmJry4Pzlz2xfm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 04:57:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oevWNmxtffSxCjqta1H1kLzsbSTqSvnsERPDgpPJItE=; b=GY/JpBAjM7iZe8iwKocexyMAZC
 defx/KniNfx0csWhLUTEoVP6wVCZep8aBJzCLdINxmEgm69yhsLqLoEdjEq8ovk2j1aj8IgbPGda2
 UOMfW8ienzcGjumjtCwfOFLzlPPT0QWkZaACzXZOtA/ISiTfIL3WfmP4Dp0OE/nAHEv4ghIgo6JOs
 IBdA+k57DZTTbc9b0T7V8koOCQP7lD6petklv1kznPIgkws+4YJm/CGL9kUOf/5qP+ctb4OcG/oI2
 /C67w2X0JHS5CV8W2w8q91jGrn5jbPCMm0/4QVWrSi/Iv3KrRY+ytcBh+FzW4CC5v1bDqKX9geKcL
 CrTxstzA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljnqW-00GJDe-2H; Thu, 20 May 2021 18:56:49 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7B5AB30022A;
 Thu, 20 May 2021 20:56:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5740A30A5840F; Thu, 20 May 2021 20:56:31 +0200 (CEST)
Date: Thu, 20 May 2021 20:56:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] sched/topology: Allow archs to populate distance map
Message-ID: <YKaw33d71FpHjGnR@hirez.programming.kicks-ass.net>
References: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
 <20210520154427.1041031-2-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520154427.1041031-2-srikar@linux.vnet.ibm.com>
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

On Thu, May 20, 2021 at 09:14:25PM +0530, Srikar Dronamraju wrote:
> Currently scheduler populates the distance map by looking at distance
> of each node from all other nodes. This should work for most
> architectures and platforms.
> 
> However there are some architectures like POWER that may not expose
> the distance of nodes that are not yet onlined because those resources
> are not yet allocated to the OS instance. Such architectures have
> other means to provide valid distance data for the current platform.
> 
> For example distance info from numactl from a fully populated 8 node
> system at boot may look like this.
> 
> node distances:
> node   0   1   2   3   4   5   6   7
>   0:  10  20  40  40  40  40  40  40
>   1:  20  10  40  40  40  40  40  40
>   2:  40  40  10  20  40  40  40  40
>   3:  40  40  20  10  40  40  40  40
>   4:  40  40  40  40  10  20  40  40
>   5:  40  40  40  40  20  10  40  40
>   6:  40  40  40  40  40  40  10  20
>   7:  40  40  40  40  40  40  20  10
> 
> However the same system when only two nodes are online at boot, then the
> numa topology will look like
> node distances:
> node   0   1
>   0:  10  20
>   1:  20  10
> 
> It may be implementation dependent on what node_distance(0,3) where
> node 0 is online and node 3 is offline. In POWER case, it returns
> LOCAL_DISTANCE(10). Here at boot the scheduler would assume that the max
> distance between nodes is 20. However that would not be true.
> 
> When Nodes are onlined and CPUs from those nodes are hotplugged,
> the max node distance would be 40.
> 
> To handle such scenarios, let scheduler allow architectures to populate
> the distance map. Architectures that like to populate the distance map
> can overload arch_populate_distance_map().

Why? Why can't your node_distance() DTRT? The arch interface is
nr_node_ids and node_distance(), I don't see why we need something new
and then replace one special use of it.

By virtue of you being able to actually implement this new hook, you
supposedly can actually do node_distance() right too.
