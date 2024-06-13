Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC59075C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 16:54:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JrpLVmcH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0QR73VD0z3cT8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:54:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JrpLVmcH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=qrwz=np=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0QQN6nzRz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 00:53:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08E4FCE26A8;
	Thu, 13 Jun 2024 14:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC65C2BBFC;
	Thu, 13 Jun 2024 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718290404;
	bh=mv116xzS15vzP9cCgyxl+fMi+NNgkWtSKInvv0qYaOs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=JrpLVmcHw+1vVdhz0hr4zlMOLXiUKHV49VrNryd9CK9X7dHErNGXoNPragvwwBCL6
	 SI+TwOrU0FMj0xU+2UtPCWQYN40GnerBvRUWBRAdFC6tFr6qz/km2rV7Chl1lUoJ9m
	 GkMihacipvdMQvdeIh6blgyiwV88h8rLs6V0Mnkla0nj4SuiDXJa+6y8vT55UDyDCg
	 17cVFuyxwkGgEp3TDCWzn0VlfqZ9umP1GCUkgnyIY+4CdHl8IwPus+2YunewlR6OZN
	 LcIgWzpaZOEsxjLA0loXbAyOPGV2Su96HAd1dBvN9u04caeK6yBd20pCVyC1ZFFfIw
	 qT4yEmqTp71dA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 556E8CE09E0; Thu, 13 Jun 2024 07:53:24 -0700 (PDT)
Date: Thu, 13 Jun 2024 07:53:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <62757652-8874-45d7-afec-734edeb03831@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com>
 <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <20240613071738.0655ff4f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613071738.0655ff4f@kernel.org>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2024 at 07:17:38AM -0700, Jakub Kicinski wrote:
> On Wed, 12 Jun 2024 20:38:02 -0700 Paul E. McKenney wrote:
> > o	Make rcu_barrier() wait for kfree_rcu() objects.  (This is
> > 	surprisingly complex and will wait unnecessarily in some cases.
> > 	However, it does preserve current code.)
> 
> Not sure how much mental capacity for API variations we expect from
> people using caches, but I feel like this would score the highest
> on Rusty's API scale. I'd even venture an opinion that it's less
> confusing to require cache users to have their own (trivial) callbacks
> than add API variants we can't error check even at runtime...

Fair point, though please see Jason's emails.

And the underlying within-RCU mechanism is the same either way, so that
API decision can be deferred for some time.

But the within-slab mechanism does have the advantage of also possibly
simplifying reference-counting and the potential upcoming hazard pointers.
On the other hand, I currently have no idea what level of violence this
change would make to the slab subsystem.

							Thanx, Paul
