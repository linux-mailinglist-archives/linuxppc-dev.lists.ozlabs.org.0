Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED8990760C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 17:07:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BsvcVPrx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0Qk42p1zz3cXg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 01:07:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BsvcVPrx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=qrwz=np=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0QjN4q7Bz3cVZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 01:06:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E91D3CE2694;
	Thu, 13 Jun 2024 15:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE25BC2BBFC;
	Thu, 13 Jun 2024 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718291190;
	bh=wgsmED+LXJqE3La/bOLyHDsAdYsz1Isrd2OZaovkeiA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=BsvcVPrxieuyVR6+qllHztbJhLvGWba7+HmN+SIlEElKHi1Zd9/dzBPedwRMCli8S
	 FKpRyagelBFngmKn9sPg3P02A8uzaYcHLSm4ZCiJ23ukBHqE6QmQhU0xzrnx/01bBh
	 4tqDsCvxFzIiuHlyJwzZGNFrhx54EIpgDvaMQ8HYCqaDWvzmMTunrp+TKCyPqaNDLa
	 /GbEdfXKY54P/m5SCsGf4TMotsXHaXBrs3REfjdxZBx/wm+QlwVSdjc5u2RbCBB4ta
	 WRq65TWMuPnHdq4aaao+h9OYo4/mhtegaJrK22Z05AWdgoiz0bQKHsta3wVVF+fskZ
	 CT+12OJKFo+6g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7A44DCE09E0; Thu, 13 Jun 2024 08:06:30 -0700 (PDT)
Date: Thu, 13 Jun 2024 08:06:30 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Uladzislau Rezki <urezki@gmail.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <ZmrfA1p2zSVIaYam@zx2c4.com>
 <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
 <Zmru7hhz8kPDPsyz@pc636>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zmru7hhz8kPDPsyz@pc636>
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

On Thu, Jun 13, 2024 at 03:06:54PM +0200, Uladzislau Rezki wrote:
> On Thu, Jun 13, 2024 at 05:47:08AM -0700, Paul E. McKenney wrote:
> > On Thu, Jun 13, 2024 at 01:58:59PM +0200, Jason A. Donenfeld wrote:
> > > On Wed, Jun 12, 2024 at 03:37:55PM -0700, Paul E. McKenney wrote:
> > > > On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> > > > > On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > > > > > Since SLOB was removed, it is not necessary to use call_rcu
> > > > > > when the callback only performs kmem_cache_free. Use
> > > > > > kfree_rcu() directly.
> > > > > > 
> > > > > > The changes were done using the following Coccinelle semantic patch.
> > > > > > This semantic patch is designed to ignore cases where the callback
> > > > > > function is used in another way.
> > > > > 
> > > > > How does the discussion on:
> > > > >   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
> > > > >   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> > > > > reflect on this series? IIUC we should hold off..
> > > > 
> > > > We do need to hold off for the ones in kernel modules (such as 07/14)
> > > > where the kmem_cache is destroyed during module unload.
> > > > 
> > > > OK, I might as well go through them...
> > > > 
> > > > [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > > > 	Needs to wait, see wg_allowedips_slab_uninit().
> > > 
> > > Also, notably, this patch needs additionally:
> > > 
> > > diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> > > index e4e1638fce1b..c95f6937c3f1 100644
> > > --- a/drivers/net/wireguard/allowedips.c
> > > +++ b/drivers/net/wireguard/allowedips.c
> > > @@ -377,7 +377,6 @@ int __init wg_allowedips_slab_init(void)
> > > 
> > >  void wg_allowedips_slab_uninit(void)
> > >  {
> > > -	rcu_barrier();
> > >  	kmem_cache_destroy(node_cache);
> > >  }
> > > 
> > > Once kmem_cache_destroy has been fixed to be deferrable.
> > > 
> > > I assume the other patches are similar -- an rcu_barrier() can be
> > > removed. So some manual meddling of these might be in order.
> > 
> > Assuming that the deferrable kmem_cache_destroy() is the option chosen,
> > agreed.
> >
> <snip>
> void kmem_cache_destroy(struct kmem_cache *s)
> {
> 	int err = -EBUSY;
> 	bool rcu_set;
> 
> 	if (unlikely(!s) || !kasan_check_byte(s))
> 		return;
> 
> 	cpus_read_lock();
> 	mutex_lock(&slab_mutex);
> 
> 	rcu_set = s->flags & SLAB_TYPESAFE_BY_RCU;
> 
> 	s->refcount--;
> 	if (s->refcount)
> 		goto out_unlock;
> 
> 	err = shutdown_cache(s);
> 	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
> 	     __func__, s->name, (void *)_RET_IP_);
> ...
> 	cpus_read_unlock();
> 	if (!err && !rcu_set)
> 		kmem_cache_release(s);
> }
> <snip>
> 
> so we have SLAB_TYPESAFE_BY_RCU flag that defers freeing slab-pages
> and a cache by a grace period. Similar flag can be added, like
> SLAB_DESTROY_ONCE_FULLY_FREED, in this case a worker rearm itself
> if there are still objects which should be freed.
> 
> Any thoughts here?

Wouldn't we also need some additional code to later check for all objects
being freed to the slab, whether or not that code is  initiated from
kmem_cache_destroy()?

Either way, I am adding the SLAB_DESTROY_ONCE_FULLY_FREED possibility,
thank you! [1]

							Thanx, Paul

[1] https://docs.google.com/document/d/1v0rcZLvvjVGejT3523W0rDy_sLFu2LWc_NR3fQItZaA/edit?usp=sharing
