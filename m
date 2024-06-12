Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34317905EEC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 01:05:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ajo5INMF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W01Mz0yj2z3cXD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 09:05:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ajo5INMF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=q+oh=no=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W01MB3BVFz3cG6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 09:04:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83765CE235E;
	Wed, 12 Jun 2024 23:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77F8C116B1;
	Wed, 12 Jun 2024 23:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718233459;
	bh=r4XcvG9Zjydzkd1AmkZAP2xPiok2w/W0tDdIGWsKLlE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ajo5INMFOIdUK8bTKJSOMTORqSBUVoTQMoTueScDlw6P7fEKN6L6KudGm8A/f9DV2
	 vac6aDF6zFHvqVhLnecDeXpTWqKjsgyaGlyYA4jn+sYSI8iPlTZA780P5FZZ2QLokd
	 TW2/efoa0ILfQDom5zYPZYttH0Zay//A6W3sEm47ScK9OEZvoBo/K4BvF3RIs/Le4w
	 ckCQrAXr3PM4+Pd067rXKPEm+1PxdYqAXhlaQm4dv5OxvWFhB3hvQnXvNmk7dvAr7L
	 /vanj8BKtPfnTrKefLFEyaIqF22+2EqJuMoTh97FTwq7ijzvQEu32ydoZbQcPLyXRl
	 tC6o2QGNB+peQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6C26FCE0DEA; Wed, 12 Jun 2024 16:04:19 -0700 (PDT)
Date: Wed, 12 Jun 2024 16:04:19 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <fc3fb837-6f3c-4955-899d-1be002d17d70@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <7e58e73d-4173-49fe-8f05-38a3699bc2c1@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e58e73d-4173-49fe-8f05-38a3699bc2c1@kernel.dk>
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

On Wed, Jun 12, 2024 at 04:52:57PM -0600, Jens Axboe wrote:
> On 6/12/24 4:37 PM, Paul E. McKenney wrote:
> > [PATCH 09/14] block: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > 	I don't see a kmem_cache_destroy(), but then again, I also don't
> > 	see the kmem_cache_create().  Unless someone can see what I am
> > 	not seeing, let's wait.
> 
> It's in that same file:
> 
> blk_ioc_init()
> 
> the cache itself never goes away, as the ioc code is not unloadable. So
> I think the change there should be fine.

Thank you, Jens!  (And to Jakub for motivating me to go look.)

So to update the scorecared, 05/14, 09/14, 11/14 and 12/14 are OK and
can go ahead.

							Thanx, Paul
