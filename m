Return-Path: <linuxppc-dev+bounces-2215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C912B99CA16
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 14:29:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRxP852Q3z3bqQ;
	Mon, 14 Oct 2024 23:29:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:780:45:1d:225:90ff:fe52:c662"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728906288;
	cv=none; b=jPIcf4a8z1ZNN9vKtk4zj60lUgZSqE3Gjm7VT1r7w0uV0RYe59Bo97yjaLPvEjhEFImS2rcw7HBcP/JFPO4KifBq5U9dUUJ8o568pVKuKNdaxiLzUld7oGbPQR9PEzDaEldlv/2EWUdFkDck+Jw5L4uk8Q+VSvXsV99mhBXn+UH05DD3sHKjws2SMa/8S1woNKIrS2gC2hy1BadiyDNtXcvlbJajnF4mbprymHLjd3N0QWvU8SVs4OEsAwly5hCZyprLkj5GgfnBakCqVwPqnyc9OU773mW1YmxQUcxPksnO9YFrl6GNIxq5CsNUWXCmviKdbpFIfyVZpzwgcTuL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728906288; c=relaxed/relaxed;
	bh=KE+1RV7m2FOGPLNhNSEGqdDGgzbjlAE85XtRMREqhd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+VD5Lb5Lmvn8atToWkd/I6EoUazLaXJiDXFCGSGYIEYlEAKi3hhQ7pw+kOMBQRxDX/sTMz1G0hzA1yBIOVch8dMgLK2U3S3FNrSUoercwxhMyz90g0a/S4KCge4C0gwmtiMeinTHN6IMKLIZbsU6T+4z7MvgQFRbQgoDLiRpCv/IUbZRPGs1bTSvFfkQ7s2uzcRzym/eoE0MgiWjCRd0EHa9YwX2UCd5dTy4F4AFMG577QV3ZuhJFwqhApMHPFI3Ip4sPcyUwMIrGFO1vCru9fgct2N0l9MKPTDNxcjLFxo2UtC+msg99xJcfEZx9Vk9p4BFzVMG2RBe1lGfS7c/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass (client-ip=2001:780:45:1d:225:90ff:fe52:c662; helo=ganesha.gnumonks.org; envelope-from=pablo@gnumonks.org; receiver=lists.ozlabs.org) smtp.mailfrom=gnumonks.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gnumonks.org (client-ip=2001:780:45:1d:225:90ff:fe52:c662; helo=ganesha.gnumonks.org; envelope-from=pablo@gnumonks.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 1111 seconds by postgrey-1.37 at boromir; Mon, 14 Oct 2024 22:44:46 AEDT
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRwPp72lyz3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 22:44:46 +1100 (AEDT)
Received: from [78.30.37.63] (port=43780 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1t0JD8-006HZk-B0; Mon, 14 Oct 2024 13:26:04 +0200
Date: Mon, 14 Oct 2024 13:26:01 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org,
	vbabka@suse.cz, paulmck@kernel.org, Tom Talpey <tom@talpey.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Olga Kornievskaia <okorniev@redhat.com>, Neil Brown <neilb@suse.de>,
	linux-can@vger.kernel.org, bridge@lists.linux.dev,
	b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org,
	wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
	ecryptfs@vger.kernel.org, linux-block@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Subject: Re: [PATCH 00/17] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <Zwz_yU8PnqU9Ngg5@calendula>
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241013201704.49576-1-Julia.Lawall@inria.fr>
X-Spam-Score: -1.9 (-)
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 13, 2024 at 10:16:47PM +0200, Julia Lawall wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.

Applied and squashed into single patch for netfilter these patches:

[17/17] netfilter: xt_hashlimit: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
[16/17] netfilter: expect: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
[15/17] netfilter: nf_conncount: replace call_rcu by kfree_rcu for simple kmem_cache_free callback

this update is now flying to net-next.

Thanks

