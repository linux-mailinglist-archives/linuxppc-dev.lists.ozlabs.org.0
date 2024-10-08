Return-Path: <linuxppc-dev+bounces-1854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0991E995806
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 22:02:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNRks5BDcz2ypV;
	Wed,  9 Oct 2024 07:02:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728417749;
	cv=none; b=TS8b/ml/9d9IZXVKAR+FLLFcKIuqTwigdjFAGiYjHf+wOrM9x5pXf5EvI2ew5faHKDyqVq1vDcuAjmTrQ3j8sXdo962e2oWEO3g0Ro3akzh779zH6Fux9tdALGjQuCuOfOa5bByqX13x8KGjd06KRk8ltc6of9PkSPd9fSjBRqwxrhDLhVvno8n0fQD+q9fUnFHevifOpT1RPKkyiRgnwMZI7+ofSEu3pjCyOn045w4nK1/itUaut3pVIPccaJv4HWReWK3W7McE2WYICoM8OgTlS09ClRafBva3TUBMEgwEEBV8eS2LOijfSHcHES6mCHD4mWg9M4cLPqTXoLxHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728417749; c=relaxed/relaxed;
	bh=V3xi2THeIJKWo6j4/LIB/KekZWWEmvsUBSIjXsdVk7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuXMHLV6eczZht9/pXhF7KHZgtrCJQij5H7fXkTzE+Ck2fGUJVjhYryhm6UsQRZ53RSSmympVR08CYyW9i7Z1vQJcHS/L1S5eUA5VjVG10CE9XSWB9EFyB5iGehv2D4k75IRoMTJQ+Aq2P+bWUieoavle/vrNZ0tTrIwrme5IIcZtsEBWdRNKHU4Qje51ybj75PJ3xN35B57V3YjZrAexkn7SePczT+7b+sE2WwDSJiewcoM/BleF9VeES1y3TYS8HDjNBleoXo5yM51Z0veabpcsijGWkXgatgWEKqZfdNzTeqkSo1nrvfzWiHX4M/OFy9IhadDNip40DAx+RC11w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rN+E6v8u; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=+lp8=re=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rN+E6v8u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=+lp8=re=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNRkr2ZPXz2yY9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 07:02:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CAC925C5B89;
	Tue,  8 Oct 2024 20:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF43C4CEC7;
	Tue,  8 Oct 2024 20:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728417745;
	bh=mwnu9JDu0/QJ39vaeqgzPRoqn/uQOdBvX8cshH9rI2M=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=rN+E6v8uF4ioUNKLIm91KJY7WajT816xax0xLKmMg82r/VdNKxRi2SuPyaYp5mvMp
	 3iEUmIoUxBqAzw3S+3xHFwxDjNUXJ1ms4vvTgy40qSQdbS1e5YsXgihqx/FlfH41CR
	 B5yXHM1xV2RQDH8pdQ+oYSffGAkWue72wxmp8FzHSdYe8F0+gQDgEtxtt3iMaFayap
	 QQgLNNDuCW4krxkjKxBJa5Jy1wKnBCXJ8lwHOvYQ4u/HYgc6yow8XGPEF6rU7+hsiS
	 Kkfhf7h/1UX7Uoiu1m8M2TLxAcmXcKHBMcjwCNjgHqioPraMS1As8rwzYnC/B4K15R
	 l1T7CHnBap8VA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 56F9BCE0DD1; Tue,  8 Oct 2024 13:02:25 -0700 (PDT)
Date: Tue, 8 Oct 2024 13:02:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Julia Lawall <Julia.Lawall@inria.fr>, linux-block@vger.kernel.org,
	kernel-janitors@vger.kernel.org, bridge@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org,
	wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
	ecryptfs@vger.kernel.org, Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
	linux-can@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	kasan-dev <kasan-dev@googlegroups.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <acf7a96b-facb-469b-8079-edbec7770780@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
 <ZnFT1Czb8oRb0SE7@pc636>
 <5c8b2883-962f-431f-b2d3-3632755de3b0@paulmck-laptop>
 <9967fdfa-e649-456d-a0cb-b4c4bf7f9d68@suse.cz>
 <6dad6e9f-e0ca-4446-be9c-1be25b2536dd@paulmck-laptop>
 <4cba4a48-902b-4fb6-895c-c8e6b64e0d5f@suse.cz>
 <ZnVInAV8BXhgAjP_@pc636>
 <df0716ac-c995-498c-83ee-b8c25302f9ed@suse.cz>
 <b3d9710a-805e-4e37-8295-b5ec1133d15c@paulmck-laptop>
 <37807ec7-d521-4f01-bcfc-a32650d5de25@suse.cz>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37807ec7-d521-4f01-bcfc-a32650d5de25@suse.cz>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 08, 2024 at 06:41:12PM +0200, Vlastimil Babka wrote:
> On 7/24/24 15:53, Paul E. McKenney wrote:
> > On Mon, Jul 15, 2024 at 10:39:38PM +0200, Vlastimil Babka wrote:
> >> On 6/21/24 11:32 AM, Uladzislau Rezki wrote:
> >> > On Wed, Jun 19, 2024 at 11:28:13AM +0200, Vlastimil Babka wrote:
> >> > One question. Maybe it is already late but it is better to ask rather than not.
> >> > 
> >> > What do you think if we have a small discussion about it on the LPC 2024 as a
> >> > topic? It might be it is already late or a schedule is set by now. Or we fix
> >> > it by a conference time.
> >> > 
> >> > Just a thought.
> >> 
> >> Sorry for the late reply. The MM MC turned out to be so packed I didn't even
> >> propose a slab topic. We could discuss in hallway track or a BOF, but
> >> hopefully if the current direction taken by my RFC brings no unexpected
> >> surprise, and the necessary RCU barrier side is also feasible, this will be
> >> settled by time of plumbers.
> > 
> > That would be even better!
> > 
> > 							Thanx, Paul
> 
> Hah, so it was close but my hope was fulfilled in the end!

Nice, and thank you!!!

							Thanx, Paul

> commit bdf56c7580d267a123cc71ca0f2459c797b76fde
> Merge: efdfcd40ad5e ecc4d6af979b
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Wed Sep 18 08:53:53 2024 +0200
> 
>     Merge tag 'slab-for-6.12' of
> git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab
> 
> So that was at 8:53 Vienna time, and Plumbers started at 10:00...

