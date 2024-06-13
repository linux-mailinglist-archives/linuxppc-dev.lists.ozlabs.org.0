Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F3890763C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 17:12:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PLFhTImn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0QrX3JKZz3cY7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 01:12:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PLFhTImn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=qrwz=np=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0Qqr3wjGz3cTp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 01:12:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6341761740;
	Thu, 13 Jun 2024 15:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4A1C2BBFC;
	Thu, 13 Jun 2024 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718291526;
	bh=Js8RVIcQWrK8SBzBs0EgFN3NPMVLrfZVEqHlgM+8ujY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=PLFhTImnGBfruVfem7uoDdRQY9dt85NU9uz9NI1nWR1Tl8ZwZA2Rn8Oo+pStfyXsV
	 EcyX+RV9PlAq8NGbBuCq1xDrwXHGIZbMJoy9lp/uxPIyy3x1VXFO0lRdU9guvTXWpK
	 fWfovpAiSyeT2cI38X08BEvOMCHEP5MPP0MmNOwv9CguIjdgxn95t02Yg8rhsTjHrv
	 JMsJdorpaWlfhjWGwd4su7F+sxA8gjgfARcKbZKcoULYJLtjoN0Cnd2hb1zWGCyIw6
	 EdYmQujOfzjZ7hZCGpSCTtFxQu7IFk8SsutSm4TeEzC3kDQYyJTjRTvS5rNl7PGpcJ
	 CzwVznRaVDJlg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A66DDCE09E0; Thu, 13 Jun 2024 08:12:05 -0700 (PDT)
Date: Thu, 13 Jun 2024 08:12:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <6595ff2a-690e-4d6c-9be5-eb83f2df23fa@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com>
 <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com>
 <e06440e2-9121-4c92-8bf2-945977987052@paulmck-laptop>
 <Zmr-KPG9F6w-uzys@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zmr-KPG9F6w-uzys@zx2c4.com>
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
Reply-To: paulmck@kernel.org
Cc: kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2024 at 04:11:52PM +0200, Jason A. Donenfeld wrote:
> On Thu, Jun 13, 2024 at 05:46:11AM -0700, Paul E. McKenney wrote:
> > How about a kmem_cache_destroy_rcu() that marks that specified cache
> > for destruction, and then a kmem_cache_destroy_barrier() that waits?
> > 
> > I took the liberty of adding your name to the Google document [1] and
> > adding this section:
> 
> Cool, though no need to make me yellow!

No worries, Jakub is also colored yellow.  People added tomorrow
will be cyan if I follow my usual change-color ordering.  ;-)

> > > But then, if that mechanism generally works, we don't really need a new
> > > function and we can just go with the first option of making
> > > kmem_cache_destroy() asynchronously wait. It'll wait, as you described,
> > > but then we adjust the tail of every kfree_rcu batch freeing cycle to
> > > check if there are _still_ any old outstanding kmem_cache_destroy()
> > > requests. If so, then we can splat and keep the old debugging info we
> > > currently have for finding memleaks.
> > 
> > The mechanism can always be sabotaged by memory-leak bugs on the part
> > of the user of the kmem_cache structure in play, right?
> > 
> > OK, but I see your point.  I added this to the existing
> > "kmem_cache_destroy() Lingers for kfree_rcu()" section:
> > 
> > 	One way of preserving this debugging information is to splat if
> > 	all of the slab’s memory has not been freed within a reasonable
> > 	timeframe, perhaps the same 21 seconds that causes an RCU CPU
> > 	stall warning.
> > 
> > Does that capture it?
> 
> Not quite what I was thinking. Your 21 seconds as a time-based thing I
> guess could be fine. But I was mostly thinking:
> 
> 1) kmem_cache_destroy() is called, but there are outstanding objects, so
>    it defers.
> 
> 2) Sometime later, a kfree_rcu_work batch freeing operation runs.

Or not, if there has been a leak and there happens to be no outstanding
kfree_rcu() memory.

> 3) At the end of this batch freeing, the kernel notices that the
>    kmem_cache whose destruction was previously deferred still has
>    outstanding objects and has not been destroyed. It can conclude that
>    there's thus been a memory leak.

And the batch freeing can be replicated across CPUs, so it would be
necessary to determine which was last to do this effective.  Don't get
me wrong, this can be done, but the performance/latency tradeoffs can
be interesting.

> In other words, instead of having to do this based on timers, you can
> just have the batch freeing code ask, "did those pending kmem_cache
> destructions get completed as a result of this last operation?"

I agree that kfree_rcu_work-batch time is a good time to evaluate slab
(and I have added this to the document), but I do not believe that it
can completely replace timeouts.

							Thanx, Paul
