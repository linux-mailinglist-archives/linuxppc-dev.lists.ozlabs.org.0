Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDBC905FBD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 02:32:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eF1VsvRJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W03KF0ZXqz3cW4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 10:32:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eF1VsvRJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=zvo8=np=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W03JS2HN9z30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 10:32:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6FE6ACE2314;
	Thu, 13 Jun 2024 00:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E47C116B1;
	Thu, 13 Jun 2024 00:32:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eF1VsvRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1718238717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GLUb85oLbjyoG+FcfWhggv8KT8bN6SBWkCY+yvZAHV8=;
	b=eF1VsvRJdSDlt+jjhJiKZ5eDDi+CCrqpbP2qILiWHB7HfEnI5D10gtd4TmY1udoArULYFC
	3p47U2iNEXteOz8cl56PqFBBedrFExfiroU7FcnCZmp/raJumk5hGsmXBZe7KI+jDx3FRz
	mt6afVKn9JVqLJRPjTB0wjVVNYzZzWI=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0c052d48 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 13 Jun 2024 00:31:57 +0000 (UTC)
Date: Thu, 13 Jun 2024 02:31:53 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <Zmo9-YGraiCj5-MI@zx2c4.com>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zmov7ZaL-54T9GiM@zx2c4.com>
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
Cc: kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2024 at 01:31:57AM +0200, Jason A. Donenfeld wrote:
> On Wed, Jun 12, 2024 at 03:37:55PM -0700, Paul E. McKenney wrote:
> > On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> > > On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > > > Since SLOB was removed, it is not necessary to use call_rcu
> > > > when the callback only performs kmem_cache_free. Use
> > > > kfree_rcu() directly.
> > > > 
> > > > The changes were done using the following Coccinelle semantic patch.
> > > > This semantic patch is designed to ignore cases where the callback
> > > > function is used in another way.
> > > 
> > > How does the discussion on:
> > >   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
> > >   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> > > reflect on this series? IIUC we should hold off..
> > 
> > We do need to hold off for the ones in kernel modules (such as 07/14)
> > where the kmem_cache is destroyed during module unload.
> > 
> > OK, I might as well go through them...
> > 
> > [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > 	Needs to wait, see wg_allowedips_slab_uninit().
> 
> Right, this has exactly the same pattern as the batman-adv issue:
> 
>     void wg_allowedips_slab_uninit(void)
>     {
>             rcu_barrier();
>             kmem_cache_destroy(node_cache);
>     }
> 
> I'll hold off on sending that up until this matter is resolved.

BTW, I think this whole thing might be caused by:

    a35d16905efc ("rcu: Add basic support for kfree_rcu() batching")

The commit message there mentions:

    There is an implication with rcu_barrier() with this patch. Since the
    kfree_rcu() calls can be batched, and may not be handed yet to the RCU
    machinery in fact, the monitor may not have even run yet to do the
    queue_rcu_work(), there seems no easy way of implementing rcu_barrier()
    to wait for those kfree_rcu()s that are already made. So this means a
    kfree_rcu() followed by an rcu_barrier() does not imply that memory will
    be freed once rcu_barrier() returns.

Before that, a kfree_rcu() used to just add a normal call_rcu() into the
list, but with the function offset < 4096 as a special marker. So the
kfree_rcu() calls would be treated alongside the other call_rcu() ones
and thus affected by rcu_barrier(). Looks like that behavior is no more
since this commit.

Rather than getting rid of the batching, which seems good for
efficiency, I wonder if the right fix to this would be adding a
`should_destroy` boolean to kmem_cache, which kmem_cache_destroy() sets
to true. And then right after it checks `if (number_of_allocations == 0)
actually_destroy()`, and likewise on each kmem_cache_free(), it could
check `if (should_destroy && number_of_allocations == 0)
actually_destroy()`. This way, the work is delayed until it's safe to do
so. This might also mitigate other lurking bugs of bad code that calls
kmem_cache_destroy() before kmem_cache_free().

Jason
