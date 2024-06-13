Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C039074FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 16:18:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q809wP6K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0Pdn2ZyBz3cX2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:18:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q809wP6K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0Pd36GVvz3cSS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 00:17:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB4D2CE235F;
	Thu, 13 Jun 2024 14:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DC4C2BBFC;
	Thu, 13 Jun 2024 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718288260;
	bh=cY+0iwxjfi/10UJxN+zolp0hxf4e2REnIO+nP7ilZd8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q809wP6KZ6dZ2KKSNToRWIFGS+TU6NU5CCFFg8KWmjJdi9aaszmfpaIVjMuKfhLBq
	 UJN5SEQEE8k67Ilrcup/14dWJNiWzw0Gq+kTmnOl3cxHd/hbJzGBv+df0UJzjBy5rb
	 ZUDfjc8O2vhrMLxae6+zOsoY3P2BzyKzw8yVcyNwWMpzV3fPJ6TSsnQvWxZdGFCxDT
	 3B33zlCsYWklU7myIP2EJ3nyLUoXLsT69r0HpVC2VQfvEe7SoXPLmc6THf+m1HnZiR
	 lCoP/WG4vm/wiMYunXqBSRWXb9Hw5BHuRVJlFTqnizqyGgcBHJWG9D5e2NvdeRzYGl
	 RfuQc0M2cv//A==
Date: Thu, 13 Jun 2024 07:17:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <20240613071738.0655ff4f@kernel.org>
In-Reply-To: <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
	<20240612143305.451abf58@kernel.org>
	<baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
	<Zmov7ZaL-54T9GiM@zx2c4.com>
	<Zmo9-YGraiCj5-MI@zx2c4.com>
	<08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 12 Jun 2024 20:38:02 -0700 Paul E. McKenney wrote:
> o	Make rcu_barrier() wait for kfree_rcu() objects.  (This is
> 	surprisingly complex and will wait unnecessarily in some cases.
> 	However, it does preserve current code.)

Not sure how much mental capacity for API variations we expect from
people using caches, but I feel like this would score the highest
on Rusty's API scale. I'd even venture an opinion that it's less
confusing to require cache users to have their own (trivial) callbacks
than add API variants we can't error check even at runtime...
