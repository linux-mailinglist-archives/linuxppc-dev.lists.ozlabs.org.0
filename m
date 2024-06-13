Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C900F9062BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 05:38:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D/Q38vJo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W07Rl5Wbgz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 13:38:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D/Q38vJo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=qrwz=np=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W07R22rDxz3bwL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 13:38:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEB7D61811;
	Thu, 13 Jun 2024 03:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7817BC2BBFC;
	Thu, 13 Jun 2024 03:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718249882;
	bh=MUF6QJIs92YjVFx9pLVup9B1X4v/FOHgXQ+Q1ulGSY8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=D/Q38vJoRXlXt5XW/4wGVxDR3Ve5LY0YeIOEeyXy3NbqhqX2dZ1j6M305bUwT45/t
	 UDuYraBOn5RJGcB5wbPp0mVvgGhhjTHGq9Z0Flg5xyFBTSbQm63u8OHLMVmMqygIG8
	 n9Bktxt8XPwCkrGEjHdwaonD6xgWh8Godtd+lRtFFTJN7g05LyY6qtQ9CoXmzs1IMm
	 s3wJnTMklP71T4XudKIUo3akJ/RvcV6b0A4eh6dGBbeQLpeU8YyAJJTIYJ6rHLoz8s
	 fp4CPkLTgzE6dVIPWUBEYXDVCE07lQXMRXq4lTfYFbtT2/hHBATfDcVAbYnccY1Jab
	 dAuGuN0IsVTKA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1975FCE0DEA; Wed, 12 Jun 2024 20:38:02 -0700 (PDT)
Date: Wed, 12 Jun 2024 20:38:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com>
 <Zmo9-YGraiCj5-MI@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zmo9-YGraiCj5-MI@zx2c4.com>
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

On Thu, Jun 13, 2024 at 02:31:53AM +0200, Jason A. Donenfeld wrote:
> On Thu, Jun 13, 2024 at 01:31:57AM +0200, Jason A. Donenfeld wrote:
> > On Wed, Jun 12, 2024 at 03:37:55PM -0700, Paul E. McKenney wrote:
> > > On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> > > > On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > > > > Since SLOB was removed, it is not necessary to use call_rcu
> > > > > when the callback only performs kmem_cache_free. Use
> > > > > kfree_rcu() directly.
> > > > > 
> > > > > The changes were done using the following Coccinelle semantic patch.
> > > > > This semantic patch is designed to ignore cases where the callback
> > > > > function is used in another way.
> > > > 
> > > > How does the discussion on:
> > > >   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
> > > >   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> > > > reflect on this series? IIUC we should hold off..
> > > 
> > > We do need to hold off for the ones in kernel modules (such as 07/14)
> > > where the kmem_cache is destroyed during module unload.
> > > 
> > > OK, I might as well go through them...
> > > 
> > > [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > > 	Needs to wait, see wg_allowedips_slab_uninit().
> > 
> > Right, this has exactly the same pattern as the batman-adv issue:
> > 
> >     void wg_allowedips_slab_uninit(void)
> >     {
> >             rcu_barrier();
> >             kmem_cache_destroy(node_cache);
> >     }
> > 
> > I'll hold off on sending that up until this matter is resolved.
> 
> BTW, I think this whole thing might be caused by:
> 
>     a35d16905efc ("rcu: Add basic support for kfree_rcu() batching")
> 
> The commit message there mentions:
> 
>     There is an implication with rcu_barrier() with this patch. Since the
>     kfree_rcu() calls can be batched, and may not be handed yet to the RCU
>     machinery in fact, the monitor may not have even run yet to do the
>     queue_rcu_work(), there seems no easy way of implementing rcu_barrier()
>     to wait for those kfree_rcu()s that are already made. So this means a
>     kfree_rcu() followed by an rcu_barrier() does not imply that memory will
>     be freed once rcu_barrier() returns.
> 
> Before that, a kfree_rcu() used to just add a normal call_rcu() into the
> list, but with the function offset < 4096 as a special marker. So the
> kfree_rcu() calls would be treated alongside the other call_rcu() ones
> and thus affected by rcu_barrier(). Looks like that behavior is no more
> since this commit.

You might well be right, and thank you for digging into this!

> Rather than getting rid of the batching, which seems good for
> efficiency, I wonder if the right fix to this would be adding a
> `should_destroy` boolean to kmem_cache, which kmem_cache_destroy() sets
> to true. And then right after it checks `if (number_of_allocations == 0)
> actually_destroy()`, and likewise on each kmem_cache_free(), it could
> check `if (should_destroy && number_of_allocations == 0)
> actually_destroy()`. This way, the work is delayed until it's safe to do
> so. This might also mitigate other lurking bugs of bad code that calls
> kmem_cache_destroy() before kmem_cache_free().

Here are the current options being considered, including those that
are completely brain-dead:

o	Document current state.  (Must use call_rcu() if module
	destroys slab of RCU-protected objects.)

	Need to review Julia's and Uladzislau's series of patches
	that change call_rcu() of slab objects to kfree_rcu().

o	Make rcu_barrier() wait for kfree_rcu() objects.  (This is
	surprisingly complex and will wait unnecessarily in some cases.
	However, it does preserve current code.)

o	Make a kfree_rcu_barrier() that waits for kfree_rcu() objects.
	(This avoids the unnecessary waits, but adds complexity to
	kfree_rcu().  This is harder than it looks, but could be done,
	for example by maintaining pairs of per-CPU counters and handling
	them in an SRCU-like fashion.  Need some way of communicating the
	index, though.)

	(There might be use cases where both rcu_barrier() and
	kfree_rcu_barrier() would need to be invoked.)

	A simpler way to implement this is to scan all of the in-flight
	objects, and queue each (either separately or in bulk) using
	call_rcu().  This still has problems with kfree_rcu_mightsleep()
	under low-memory conditions, in which case there are a bunch
	of synchronize_rcu() instances waiting.  These instances could
	use SRCU-like per-CPU arrays of counters.  Or just protect the
	calls to synchronize_rcu() and the later frees with an SRCU
	reader, then have the other end call synchronize_srcu().

o	Make the current kmem_cache_destroy() asynchronously wait for
	all memory to be returned, then complete the destruction.
	(This gets rid of a valuable debugging technique because
	in normal use, it is a bug to attempt to destroy a kmem_cache
	that has objects still allocated.)

o	Make a kmem_cache_destroy_rcu() that asynchronously waits for
	all memory to be returned, then completes the destruction.
	(This raises the question of what to is it takes a "long time"
	for the objects to be freed.)

o	Make a kmem_cache_free_barrier() that blocks until all
	objects in the specified kmem_cache have been freed.

o	Make a kmem_cache_destroy_wait() that waits for all memory to
	be returned, then does the destruction.  This is equivalent to:

		kmem_cache_free_barrier(&mycache);
		kmem_cache_destroy(&mycache);

Uladzislau has started discussions on the last few of these:
https://lore.kernel.org/all/ZmnL4jkhJLIW924W@pc636/

I have also added this information to a Google Document for
easier tracking:
https://docs.google.com/document/d/1v0rcZLvvjVGejT3523W0rDy_sLFu2LWc_NR3fQItZaA/edit?usp=sharing

Other thoughts?

							Thanx, Paul
