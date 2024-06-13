Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A939074C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 16:12:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=L2OdeEdD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0PWM65HYz3cVl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:12:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=L2OdeEdD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=zvo8=np=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0PVd2Wppz3cSS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 00:12:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 49BAFCE2601;
	Thu, 13 Jun 2024 14:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414C2C2BBFC;
	Thu, 13 Jun 2024 14:12:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="L2OdeEdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1718287920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fjz4ZCmXLkYKy1WwR1BKUB9SOdktn0OQ80YKkl5C07A=;
	b=L2OdeEdDbAYwCCQIo0q3Y5svBHl6HUoVii7Ipx/YqW9msnW5nLiQCcmVhvT3d2aYbXekmX
	6vGp/7RezmQfWwaVJxWqE0MwVUi9dk5ylrevWbLPzxAvc9yHIJFCNMr0XP5ij6Ppv2K3la
	u18h46ekO5C4iutUHhucdp/z23ziWUY=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9cf22b43 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 13 Jun 2024 14:11:58 +0000 (UTC)
Date: Thu, 13 Jun 2024 16:11:52 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <Zmr-KPG9F6w-uzys@zx2c4.com>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com>
 <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com>
 <e06440e2-9121-4c92-8bf2-945977987052@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e06440e2-9121-4c92-8bf2-945977987052@paulmck-laptop>
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

On Thu, Jun 13, 2024 at 05:46:11AM -0700, Paul E. McKenney wrote:
> How about a kmem_cache_destroy_rcu() that marks that specified cache
> for destruction, and then a kmem_cache_destroy_barrier() that waits?
> 
> I took the liberty of adding your name to the Google document [1] and
> adding this section:

Cool, though no need to make me yellow!

> > But then, if that mechanism generally works, we don't really need a new
> > function and we can just go with the first option of making
> > kmem_cache_destroy() asynchronously wait. It'll wait, as you described,
> > but then we adjust the tail of every kfree_rcu batch freeing cycle to
> > check if there are _still_ any old outstanding kmem_cache_destroy()
> > requests. If so, then we can splat and keep the old debugging info we
> > currently have for finding memleaks.
> 
> The mechanism can always be sabotaged by memory-leak bugs on the part
> of the user of the kmem_cache structure in play, right?
> 
> OK, but I see your point.  I added this to the existing
> "kmem_cache_destroy() Lingers for kfree_rcu()" section:
> 
> 	One way of preserving this debugging information is to splat if
> 	all of the slab’s memory has not been freed within a reasonable
> 	timeframe, perhaps the same 21 seconds that causes an RCU CPU
> 	stall warning.
> 
> Does that capture it?

Not quite what I was thinking. Your 21 seconds as a time-based thing I
guess could be fine. But I was mostly thinking:

1) kmem_cache_destroy() is called, but there are outstanding objects, so
   it defers.

2) Sometime later, a kfree_rcu_work batch freeing operation runs.

3) At the end of this batch freeing, the kernel notices that the
   kmem_cache whose destruction was previously deferred still has
   outstanding objects and has not been destroyed. It can conclude that
   there's thus been a memory leak.

In other words, instead of having to do this based on timers, you can
just have the batch freeing code ask, "did those pending kmem_cache
destructions get completed as a result of this last operation?"
