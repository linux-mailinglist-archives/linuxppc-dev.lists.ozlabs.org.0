Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E16A6907259
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 14:46:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bY9xcLBc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0McD5sHQz3cXC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 22:46:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bY9xcLBc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=qrwz=np=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0MbT6nyLz30Vd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 22:46:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7A2561883;
	Thu, 13 Jun 2024 12:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D00C4AF1A;
	Thu, 13 Jun 2024 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718282772;
	bh=cfCIMolIL0z/9BdLp7c28KYqsd1e4cvIRocOkfmcZ08=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=bY9xcLBchaDvzrtdUTNy9zOZJ0e7QkpI7+m9/3gM8hLADzknFSH4D6fBgxcOpcDpx
	 GiqSZqbcWOYscQq8dCZT4gbD5MMWgwcwV9Bx19Z1oPyEFagYMVtQYkQeajrc0mKZvV
	 Q1ma+nLS/ijqlrxMeuTvflAULxXhYBaNjFm625ScaqWChSiM0NXDBMfUl5vQC8XaHy
	 zM85sb0bS2Td6Ytkyyh0gVc9idAM4KX3AjzI3NwRf1RoZh0MdxoDDUXVCz7wiSBnZQ
	 xdXURGSPlYposntJNenfVKaabrc3cAGeKJVVoVKPfNndUFxHLpHuwR8u91TOcKAzmz
	 I43fU844GD08A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0237CCE3F3B; Thu, 13 Jun 2024 05:46:11 -0700 (PDT)
Date: Thu, 13 Jun 2024 05:46:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <e06440e2-9121-4c92-8bf2-945977987052@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com>
 <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zmrkkel0Fo4_g75a@zx2c4.com>
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

On Thu, Jun 13, 2024 at 02:22:41PM +0200, Jason A. Donenfeld wrote:
> On Wed, Jun 12, 2024 at 08:38:02PM -0700, Paul E. McKenney wrote:
> > o	Make the current kmem_cache_destroy() asynchronously wait for
> > 	all memory to be returned, then complete the destruction.
> > 	(This gets rid of a valuable debugging technique because
> > 	in normal use, it is a bug to attempt to destroy a kmem_cache
> > 	that has objects still allocated.)
> > 
> > o	Make a kmem_cache_destroy_rcu() that asynchronously waits for
> > 	all memory to be returned, then completes the destruction.
> > 	(This raises the question of what to is it takes a "long time"
> > 	for the objects to be freed.)
> 
> These seem like the best two options.

I like them myself, but much depends on how much violence they do to
the slab subsystem and to debuggability.

> > o	Make a kmem_cache_free_barrier() that blocks until all
> > 	objects in the specified kmem_cache have been freed.
> > 
> > o	Make a kmem_cache_destroy_wait() that waits for all memory to
> > 	be returned, then does the destruction.  This is equivalent to:
> > 
> > 		kmem_cache_free_barrier(&mycache);
> > 		kmem_cache_destroy(&mycache);
> 
> These also seem fine, but I'm less keen about blocking behavior.

One advantage of the blocking behavior is that it pinpoints memory
leaks from that slab.  On the other hand, one can argue that you want
this to block during testing but to be asynchronous in production.
Borrowing someone else's hand, there are probably lots of other arguments
one can make.

> Though, along the ideas of kmem_cache_destroy_rcu(), you might also
> consider renaming this last one to kmem_cache_destroy_rcu_wait/barrier().
> This way, it's RCU focused, and you can deal directly with the question
> of, "how long is too long to block/to memleak?"

Good point!

> Specifically what I mean is that we can still claim a memory leak has
> occurred if one batched kfree_rcu freeing grace period has elapsed since
> the last call to kmem_cache_destroy_rcu_wait/barrier() or
> kmem_cache_destroy_rcu(). In that case, you quit blocking, or you quit
> asynchronously waiting, and then you splat about a memleak like we have
> now.

How about a kmem_cache_destroy_rcu() that marks that specified cache
for destruction, and then a kmem_cache_destroy_barrier() that waits?

I took the liberty of adding your name to the Google document [1] and
adding this section:

	kmem_cache_destroy_rcu/_barrier()

	The idea here is to provide a asynchronous 
	kmem_cache_destroy_rcu() as described above along with a
	kmem_cache_destroy_barrier() that waits for the destruction
	of all prior kmem_cache instances previously passed
	to kmem_cache_destroy_rcu().  Alternatively,  could
	return a cookie that could be passed into a later call to
	kmem_cache_destroy_barrier().  This alternative has the
	advantage of isolating which kmem_cache instance is suffering
	the memory leak.

Please let me know if either liberty is in any way problematic.

> But then, if that mechanism generally works, we don't really need a new
> function and we can just go with the first option of making
> kmem_cache_destroy() asynchronously wait. It'll wait, as you described,
> but then we adjust the tail of every kfree_rcu batch freeing cycle to
> check if there are _still_ any old outstanding kmem_cache_destroy()
> requests. If so, then we can splat and keep the old debugging info we
> currently have for finding memleaks.

The mechanism can always be sabotaged by memory-leak bugs on the part
of the user of the kmem_cache structure in play, right?

OK, but I see your point.  I added this to the existing
"kmem_cache_destroy() Lingers for kfree_rcu()" section:

	One way of preserving this debugging information is to splat if
	all of the slab’s memory has not been freed within a reasonable
	timeframe, perhaps the same 21 seconds that causes an RCU CPU
	stall warning.

Does that capture it?

							Thanx, Paul

[1] https://docs.google.com/document/d/1v0rcZLvvjVGejT3523W0rDy_sLFu2LWc_NR3fQItZaA/edit?usp=sharing
