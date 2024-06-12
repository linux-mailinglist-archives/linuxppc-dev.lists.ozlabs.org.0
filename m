Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9C2905DC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 23:33:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J4gew7GX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzzLc4PY2z3cLj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 07:33:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J4gew7GX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzzKw5KDWz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 07:33:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C593661740;
	Wed, 12 Jun 2024 21:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31DEC116B1;
	Wed, 12 Jun 2024 21:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718227987;
	bh=D7/e9lxK/rDnF5q2wBJbSwFKBep+OjF1zHYFBRsOwHY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J4gew7GXSUxZyxXl6G49+4erFfWm/fvqP8jJMq7QuXBUHyR17gKVbI8IJ3y71epYo
	 81Eq4piaIn37sHAKw45pOJJnpiTeuc2KSFxdSD1+2LioYDUAwYQQ8KGiGECKgXZ1Bt
	 BQIkYrv1Z3RNFkSAHVf81GTPLI5u7plWmLvmv2tSr8XWK2kuYVByujH0Xm2sSG3rLe
	 dcH3Q/OlBdRCiuZINoD5hS74CGC35ok/tQmpHn36JG4CCNQB6ctPj6kIhn5MA8jO7+
	 XDUBrtlraXPQiItIjFfHu36XD/1shI91JiWJHwx90qz33buNQ2dew6BWeH46IO/yU8
	 gdQU9P2cQi32g==
Date: Wed, 12 Jun 2024 14:33:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <20240612143305.451abf58@kernel.org>
In-Reply-To: <20240609082726.32742-1-Julia.Lawall@inria.fr>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
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
Cc: kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, Lai Jiangshan <jiangshanlai@gmail.com>, Olga Kornievskaia <kolga@netapp.com>, kernel-janitors@vger.kernel.org, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Tom Talpey <tom@talpey.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, linux-block@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> Since SLOB was removed, it is not necessary to use call_rcu
> when the callback only performs kmem_cache_free. Use
> kfree_rcu() directly.
> 
> The changes were done using the following Coccinelle semantic patch.
> This semantic patch is designed to ignore cases where the callback
> function is used in another way.

How does the discussion on:
  [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
  https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
reflect on this series? IIUC we should hold off..
