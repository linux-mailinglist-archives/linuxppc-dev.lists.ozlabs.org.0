Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7490726C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 14:47:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BuhuVSpb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0MdG4WfXz3cWy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 22:47:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BuhuVSpb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=qrwz=np=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0McZ65LQz30Vd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 22:47:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BBA461B24;
	Thu, 13 Jun 2024 12:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E35C4AF1D;
	Thu, 13 Jun 2024 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718282829;
	bh=Vzv0i5AjIrgsjm2KrIFQ5g0zkd8OKZuFz8J9hczkvVU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=BuhuVSpbcTx/eXjea/TKS5UUyJyZDKgBNGNojdYjNvJlbKf8f0REK48qN1G00QK7t
	 ZvvD3sCDrXWlChEjzvItORVcr37gzulSj0d0CfSPbA83U6r5VftQqojy80MOvG23a1
	 hY4PfyCfuqcnSaALxQyZ/vHNn0szv9zgi06Lvy5Ymsf4b+QclQogfP1kyeQbjXsHNE
	 KeoVUHKhGcgsG1cxPpec1vzYgQIEkfZMDItRc5n3MrVKB0vQ1/D9qXOZfEF84mWmDk
	 L9JoHz+GitlIQlt2tEf+5mTalIBsiIhFOB/1V6xe9T/Fc0cNhX3rsh7C2TcMNBTHJf
	 6oTzHy6k9vjnw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B3435CE3F3B; Thu, 13 Jun 2024 05:47:08 -0700 (PDT)
Date: Thu, 13 Jun 2024 05:47:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <ZmrfA1p2zSVIaYam@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmrfA1p2zSVIaYam@zx2c4.com>
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

On Thu, Jun 13, 2024 at 01:58:59PM +0200, Jason A. Donenfeld wrote:
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
> Also, notably, this patch needs additionally:
> 
> diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> index e4e1638fce1b..c95f6937c3f1 100644
> --- a/drivers/net/wireguard/allowedips.c
> +++ b/drivers/net/wireguard/allowedips.c
> @@ -377,7 +377,6 @@ int __init wg_allowedips_slab_init(void)
> 
>  void wg_allowedips_slab_uninit(void)
>  {
> -	rcu_barrier();
>  	kmem_cache_destroy(node_cache);
>  }
> 
> Once kmem_cache_destroy has been fixed to be deferrable.
> 
> I assume the other patches are similar -- an rcu_barrier() can be
> removed. So some manual meddling of these might be in order.

Assuming that the deferrable kmem_cache_destroy() is the option chosen,
agreed.

							Thanx, Paul
