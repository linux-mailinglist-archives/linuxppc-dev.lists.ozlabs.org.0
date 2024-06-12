Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7BE905E9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 00:38:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gP+b8oI2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W00nX2kXrz3cSX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 08:38:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gP+b8oI2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=q+oh=no=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W00mk0XWdz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 08:37:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81A9F616DE;
	Wed, 12 Jun 2024 22:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29078C116B1;
	Wed, 12 Jun 2024 22:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718231876;
	bh=oIsohZ+9uDXt1/szfbZNu9uZ6WH4ExPZbv0MeSABAuw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=gP+b8oI23RaN2auavn9kdJs6IaFxGfpTRers71TYsRO81EBkAJS1TEEGF9PeM+7wx
	 JfjAorGHi0StC2tbEFL0bYR8ahwDNRtKXd/jEciawD5flFj7OxObqgTN+5TakbhJo9
	 MYUohzqZDX+JJBX7UwG3NUQCOUrxFlzf999/p9+XDhMFm6el3kPv2V63iZvZ5wUcv5
	 lQ5MrBltINH+5KZS/28WiZf4A+9rRX+iNrE09oOnoadekn/S8rZO8cAVOXqThDgSq8
	 GX1/wlDqJccdnaongSnTXVexdmEnFHpo7BzVqTOxZtg9rbL/bdSMDg4px5jWTRJf+V
	 LGtEBztw5cOtQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BC95ACE0DEA; Wed, 12 Jun 2024 15:37:55 -0700 (PDT)
Date: Wed, 12 Jun 2024 15:37:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612143305.451abf58@kernel.org>
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
Cc: kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, Lai Jiangshan <jiangshanlai@gmail.com>, Olga Kornievskaia <kolga@netapp.com>, kernel-janitors@vger.kernel.org, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > Since SLOB was removed, it is not necessary to use call_rcu
> > when the callback only performs kmem_cache_free. Use
> > kfree_rcu() directly.
> > 
> > The changes were done using the following Coccinelle semantic patch.
> > This semantic patch is designed to ignore cases where the callback
> > function is used in another way.
> 
> How does the discussion on:
>   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
>   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> reflect on this series? IIUC we should hold off..

We do need to hold off for the ones in kernel modules (such as 07/14)
where the kmem_cache is destroyed during module unload.

OK, I might as well go through them...

[PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	Needs to wait, see wg_allowedips_slab_uninit().

[PATCH 02/14] net: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	I don't immediately see the rcu_barrier(), but if there isn't
	one in there somewhere there probably should be.  Caution
	suggests a need to wait.

[PATCH 03/14] KVM: PPC: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	I don't immediately see the rcu_barrier(), but if there isn't
	one in there somewhere there probably should be.  Caution
	suggests a need to wait.

[PATCH 04/14] xfrm6_tunnel: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	Needs to wait, see xfrm6_tunnel_fini().

[PATCH 05/14] tracefs: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	This one is fine because the tracefs_inode_cachep kmem_cache
	is created at boot and never destroyed.

[PATCH 06/14] eCryptfs: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	I don't see a kmem_cache_destroy(), but then again, I also don't
	see the kmem_cache_create().  Unless someone can see what I am
	not seeing, let's wait.

[PATCH 07/14] net: bridge: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	Needs to wait, see br_fdb_fini() and br_deinit().

[PATCH 08/14] nfsd: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	I don't immediately see the rcu_barrier(), but if there isn't
	one in there somewhere there probably should be.  Caution
	suggests a need to wait.

[PATCH 09/14] block: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	I don't see a kmem_cache_destroy(), but then again, I also don't
	see the kmem_cache_create().  Unless someone can see what I am
	not seeing, let's wait.

[PATCH 10/14] can: gw: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	Needs to wait, see cgw_module_exit().

[PATCH 11/14] posix-timers: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	This one is fine because the posix_timers_cache kmem_cache is
	created at boot and never destroyed.

[PATCH 12/14] workqueue: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	This one is fine because the pwq_cache kmem_cache is created at
	boot and never destroyed.

[PATCH 13/14] kcm: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	I don't immediately see the rcu_barrier(), but if there isn't
	one in there somewhere there probably should be.  Caution
	suggests a need to wait.

[PATCH 14/14] netfilter: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
	Needs to wait, see hashlimit_mt_exit().

So 05/14, 11/14 and 12/14 are OK and can go ahead.  The rest need some
help.

Apologies for my having gotten overly enthusiastic about this change!

							Thanx, Paul
