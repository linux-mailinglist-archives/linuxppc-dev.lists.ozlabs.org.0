Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70AF906FCE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 14:23:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=hfCrzpDL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0M5H3NTRz3cXC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 22:23:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=hfCrzpDL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=zvo8=np=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0M4b2JdFz3cSS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 22:22:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37138CE2618;
	Thu, 13 Jun 2024 12:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46929C32786;
	Thu, 13 Jun 2024 12:22:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hfCrzpDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1718281367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zijv6FPIt5hCtiuqrLBHgYuKfY1FOvo07a77dKOwqRA=;
	b=hfCrzpDLzmbNtF/sSyUwD/q4E2PbjKj9Fna9CH4V+V4vPbeuYBlZyE1WHIwBmUUgtmwa4e
	hkAMHeSicVC3lwYY/+b0ttk/c79NH8Y9GniehbCUO4Tz+G6YoeBDfmgGgVjY7xbdbEJGet
	Tjg4BjizrxilahviyNABzJbhoTcy7oY=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 199f6b88 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 13 Jun 2024 12:22:46 +0000 (UTC)
Date: Thu, 13 Jun 2024 14:22:41 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <Zmrkkel0Fo4_g75a@zx2c4.com>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com>
 <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
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

On Wed, Jun 12, 2024 at 08:38:02PM -0700, Paul E. McKenney wrote:
> o	Make the current kmem_cache_destroy() asynchronously wait for
> 	all memory to be returned, then complete the destruction.
> 	(This gets rid of a valuable debugging technique because
> 	in normal use, it is a bug to attempt to destroy a kmem_cache
> 	that has objects still allocated.)
> 
> o	Make a kmem_cache_destroy_rcu() that asynchronously waits for
> 	all memory to be returned, then completes the destruction.
> 	(This raises the question of what to is it takes a "long time"
> 	for the objects to be freed.)

These seem like the best two options.

> o	Make a kmem_cache_free_barrier() that blocks until all
> 	objects in the specified kmem_cache have been freed.
> 
> o	Make a kmem_cache_destroy_wait() that waits for all memory to
> 	be returned, then does the destruction.  This is equivalent to:
> 
> 		kmem_cache_free_barrier(&mycache);
> 		kmem_cache_destroy(&mycache);

These also seem fine, but I'm less keen about blocking behavior.

Though, along the ideas of kmem_cache_destroy_rcu(), you might also
consider renaming this last one to kmem_cache_destroy_rcu_wait/barrier().
This way, it's RCU focused, and you can deal directly with the question
of, "how long is too long to block/to memleak?"

Specifically what I mean is that we can still claim a memory leak has
occurred if one batched kfree_rcu freeing grace period has elapsed since
the last call to kmem_cache_destroy_rcu_wait/barrier() or
kmem_cache_destroy_rcu(). In that case, you quit blocking, or you quit
asynchronously waiting, and then you splat about a memleak like we have
now.

But then, if that mechanism generally works, we don't really need a new
function and we can just go with the first option of making
kmem_cache_destroy() asynchronously wait. It'll wait, as you described,
but then we adjust the tail of every kfree_rcu batch freeing cycle to
check if there are _still_ any old outstanding kmem_cache_destroy()
requests. If so, then we can splat and keep the old debugging info we
currently have for finding memleaks.

Jason
