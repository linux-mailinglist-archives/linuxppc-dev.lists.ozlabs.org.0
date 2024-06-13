Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18321907A30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 19:46:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qEbQkQ+U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0VGB6bhqz3d9V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 03:46:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qEbQkQ+U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=qrwz=np=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0VFT3lHSz3d8J
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 03:46:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 78C7CCE26DA;
	Thu, 13 Jun 2024 17:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80014C2BBFC;
	Thu, 13 Jun 2024 17:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718300759;
	bh=8wZftwNb/k7uIh9XSIxuBqvpXG6ZPovdvQIUEmPnupc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=qEbQkQ+UG3cqDCkPWEZuFpKomUQZ2djBRGbA7EzDh2d7JKykflV9684BKaUVP0poZ
	 hIEOKqV4RjAZCZqUFtq/Fzd33aTZIQbfH/JE50LEMZ8hGgtLdw/EB23V+3xw2VOuIZ
	 qrAuLp7I8tYjJ+AZnEs09c6345tne5dWCGQ0B1jge1o9wIjFoU4Bu/a0z60D/IBXXt
	 FW0yk+gUMaKr4/T8D989Jx8E9iDtm5SJrjQvu3TKBPP59LiSiEIwvrD8NCIgFF8WDp
	 OV4LtOCrBe6gjqoKjnWhQG17bVbuiIJF363t8yR29EgEH+KPBsHqEqQ/VAvl20tLVU
	 6zqe3onttfsfg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 290BCCE0760; Thu, 13 Jun 2024 10:45:59 -0700 (PDT)
Date: Thu, 13 Jun 2024 10:45:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Uladzislau Rezki <urezki@gmail.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <ZmrfA1p2zSVIaYam@zx2c4.com>
 <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
 <Zmru7hhz8kPDPsyz@pc636>
 <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
 <Zmsuswo8OPIhY5KJ@pc636>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zmsuswo8OPIhY5KJ@pc636>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2024 at 07:38:59PM +0200, Uladzislau Rezki wrote:
> On Thu, Jun 13, 2024 at 08:06:30AM -0700, Paul E. McKenney wrote:
> > On Thu, Jun 13, 2024 at 03:06:54PM +0200, Uladzislau Rezki wrote:
> > > On Thu, Jun 13, 2024 at 05:47:08AM -0700, Paul E. McKenney wrote:
> > > > On Thu, Jun 13, 2024 at 01:58:59PM +0200, Jason A. Donenfeld wrote:
> > > > > On Wed, Jun 12, 2024 at 03:37:55PM -0700, Paul E. McKenney wrote:
> > > > > > On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> > > > > > > On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > > > > > > > Since SLOB was removed, it is not necessary to use call_rcu
> > > > > > > > when the callback only performs kmem_cache_free. Use
> > > > > > > > kfree_rcu() directly.
> > > > > > > > 
> > > > > > > > The changes were done using the following Coccinelle semantic patch.
> > > > > > > > This semantic patch is designed to ignore cases where the callback
> > > > > > > > function is used in another way.
> > > > > > > 
> > > > > > > How does the discussion on:
> > > > > > >   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
> > > > > > >   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> > > > > > > reflect on this series? IIUC we should hold off..
> > > > > > 
> > > > > > We do need to hold off for the ones in kernel modules (such as 07/14)
> > > > > > where the kmem_cache is destroyed during module unload.
> > > > > > 
> > > > > > OK, I might as well go through them...
> > > > > > 
> > > > > > [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > > > > > 	Needs to wait, see wg_allowedips_slab_uninit().
> > > > > 
> > > > > Also, notably, this patch needs additionally:
> > > > > 
> > > > > diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> > > > > index e4e1638fce1b..c95f6937c3f1 100644
> > > > > --- a/drivers/net/wireguard/allowedips.c
> > > > > +++ b/drivers/net/wireguard/allowedips.c
> > > > > @@ -377,7 +377,6 @@ int __init wg_allowedips_slab_init(void)
> > > > > 
> > > > >  void wg_allowedips_slab_uninit(void)
> > > > >  {
> > > > > -	rcu_barrier();
> > > > >  	kmem_cache_destroy(node_cache);
> > > > >  }
> > > > > 
> > > > > Once kmem_cache_destroy has been fixed to be deferrable.
> > > > > 
> > > > > I assume the other patches are similar -- an rcu_barrier() can be
> > > > > removed. So some manual meddling of these might be in order.
> > > > 
> > > > Assuming that the deferrable kmem_cache_destroy() is the option chosen,
> > > > agreed.
> > > >
> > > <snip>
> > > void kmem_cache_destroy(struct kmem_cache *s)
> > > {
> > > 	int err = -EBUSY;
> > > 	bool rcu_set;
> > > 
> > > 	if (unlikely(!s) || !kasan_check_byte(s))
> > > 		return;
> > > 
> > > 	cpus_read_lock();
> > > 	mutex_lock(&slab_mutex);
> > > 
> > > 	rcu_set = s->flags & SLAB_TYPESAFE_BY_RCU;
> > > 
> > > 	s->refcount--;
> > > 	if (s->refcount)
> > > 		goto out_unlock;
> > > 
> > > 	err = shutdown_cache(s);
> > > 	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
> > > 	     __func__, s->name, (void *)_RET_IP_);
> > > ...
> > > 	cpus_read_unlock();
> > > 	if (!err && !rcu_set)
> > > 		kmem_cache_release(s);
> > > }
> > > <snip>
> > > 
> > > so we have SLAB_TYPESAFE_BY_RCU flag that defers freeing slab-pages
> > > and a cache by a grace period. Similar flag can be added, like
> > > SLAB_DESTROY_ONCE_FULLY_FREED, in this case a worker rearm itself
> > > if there are still objects which should be freed.
> > > 
> > > Any thoughts here?
> > 
> > Wouldn't we also need some additional code to later check for all objects
> > being freed to the slab, whether or not that code is  initiated from
> > kmem_cache_destroy()?
> >
> Same away as SLAB_TYPESAFE_BY_RCU is handled from the kmem_cache_destroy() function.
> It checks that flag and if it is true and extra worker is scheduled to perform a
> deferred(instead of right away) destroy after rcu_barrier() finishes.

Like this?

	SLAB_DESTROY_ONCE_FULLY_FREED

	Instead of adding a new kmem_cache_destroy_rcu()
	or kmem_cache_destroy_wait() API member, instead add a
	SLAB_DESTROY_ONCE_FULLY_FREED flag that can be passed to the
	existing kmem_cache_destroy() function.  Use of this flag would
	suppress any warnings that would otherwise be issued if there
	was still slab memory yet to be freed, and it would also spawn
	workqueues (or timers or whatever) to do any needed cleanup work.

							Thanx, Paul
