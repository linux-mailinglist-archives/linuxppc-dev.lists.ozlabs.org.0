Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC8190B5F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 18:13:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tGMxqYUW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2w0R4F0pz3g6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 02:13:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tGMxqYUW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=fwn3=nt=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2vzh5M8Pz3fsX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 02:12:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A32676135B;
	Mon, 17 Jun 2024 16:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45957C3277B;
	Mon, 17 Jun 2024 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718640749;
	bh=+gtWCVLAIwVN9QYLGAITeupOhR87qFGefwq+Ci8vsv0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=tGMxqYUWUZidJOkTYRC4FVvYBSBOWSgclx4qkkf2YhB76G0qNpmpl3h3ZG/PV3BOy
	 xlZXdbbOvZ6jW6KZZoE8jW1tSsMXb9BTJYiUY+4BFP1x4DLKJ88c59xgouIGwbGnfH
	 pzOLAUlBJvqVtt/nGes5ftIvMNsA0KW74j39YxI7CsKwDMIstY8QCTis+Vm1d09ssf
	 Brg/opMBq5bCqKivChkp0axZbqIBv6L47ipGD98z9wwNolXOn9myeZNXKM1TRS3DUb
	 bJJ9eMBF03SfToJMq6gfQl4IveoZO6GqEFk38XBSPXCG+yBO8oun6MjojXjI6saj96
	 ETfYabYghHfAQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C3424CE09F5; Mon, 17 Jun 2024 09:12:28 -0700 (PDT)
Date: Mon, 17 Jun 2024 09:12:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com>
 <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com>
 <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, "Uladzislau Rezki \(Sony\)" <urezki@gmail.com>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2024 at 05:10:50PM +0200, Vlastimil Babka wrote:
> On 6/13/24 2:22 PM, Jason A. Donenfeld wrote:
> > On Wed, Jun 12, 2024 at 08:38:02PM -0700, Paul E. McKenney wrote:
> >> o	Make the current kmem_cache_destroy() asynchronously wait for
> >> 	all memory to be returned, then complete the destruction.
> >> 	(This gets rid of a valuable debugging technique because
> >> 	in normal use, it is a bug to attempt to destroy a kmem_cache
> >> 	that has objects still allocated.)
> 
> This seems like the best option to me. As Jason already said, the debugging
> technique is not affected significantly, if the warning just occurs
> asynchronously later. The module can be already unloaded at that point, as
> the leak is never checked programatically anyway to control further
> execution, it's just a splat in dmesg.

Works for me!

> > Specifically what I mean is that we can still claim a memory leak has
> > occurred if one batched kfree_rcu freeing grace period has elapsed since
> > the last call to kmem_cache_destroy_rcu_wait/barrier() or
> > kmem_cache_destroy_rcu(). In that case, you quit blocking, or you quit
> > asynchronously waiting, and then you splat about a memleak like we have
> > now.
> 
> Yes so we'd need the kmem_cache_free_barrier() for a slab kunit test (or the
> pessimistic variant waiting for the 21 seconds), and a polling variant of
> the same thing for the asynchronous destruction. Or we don't need a polling
> variant if it's ok to invoke such a barrier in a schedule_work() workfn.
> 
> We should not need any new kmem_cache flag nor kmem_cache_destroy() flag to
> burden the users of kfree_rcu() with. We have __kmem_cache_shutdown() that
> will try to flush everything immediately and if it doesn't succeed, we can
> assume kfree_rcu() might be in flight and try to wait for it asynchronously,
> without any flags.

That does sound like a very attractive approach.

> SLAB_TYPESAFE_BY_RCU is still handled specially because it has special
> semantics as well.
> 
> As for users of call_rcu() with arbitrary callbacks that might be functions
> from the module that is about to unload, these should not return from
> kmem_cache_destroy() with objects in flight. But those should be using
> rcu_barrier() before calling kmem_cache_destroy() already, and probably we
> should not try to handle this automagically? Maybe one potential change with
> the described approach is that today they would get the "cache not empty"
> warning immediately. But that wouldn't stop the module unload so later the
> callbacks would try to execute unmapped code anyway. With the new approach
> the asynchronous handling might delay the "cache not empty" warnings (or
> not, if kmem_cache_free_barrier() would finish before a rcu_barrier() would)
> so the unmapped code execution would come first. I don't think that would be
> a regression.

Agreed.

There are some use cases where a call_rcu() from a module without an
rcu_barrier() would be OK, for example, if the callback function was
defined in the core kernel and either: (1) The memory was from kmalloc()
or (2) The memory was from kmem_cache_alloc() and your suggested
changes above have been applied.  My current belief is that these are
too special of cases to be worth optimizing for, so that the rule should
remain "If you use call_rcu() in a module, you must call rcu_barrier()
within the module-unload code."

There have been discussions of having module-unload automatically invoke
rcu_barrier() if needed, but thus far we have not come up with a good
way to do this.  Challenges include things like static inline functions
from the core kernel invoking call_rcu(), in which case how to figure
out that the rcu_barrier() is not needed?

							Thanx, Paul
