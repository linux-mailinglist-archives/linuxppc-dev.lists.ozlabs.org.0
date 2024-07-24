Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A898093B214
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 15:54:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WAP2//Vl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTb944SX0z3clf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 23:54:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WAP2//Vl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=mrac=oy=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTb8N17DYz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 23:53:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A68B060AC7;
	Wed, 24 Jul 2024 13:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0F7C32781;
	Wed, 24 Jul 2024 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721829215;
	bh=07Vzl6re9ZHoHnUQaqXa2n0Sm3JNDNE/aQbliYyNUPE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=WAP2//VlWUSM9jrjWrTnlUR5U9gfJcKWxfEehwSsgCifqJ1HhI5rmor2MgAYiE7Hj
	 k3H3D8gUK01HrebDYiJ8EV56b+RO+InO4F1HL2zNXYqpPk0VVAstDY9HBgwUy8+jTo
	 8Kp+cbZnfcsDTxUnkpS1wiQgO6T2KXSlCCZwyOB4EAFefvi0zRPKDPVqPNBGFqV5Kn
	 m54HgAjJfy8we9Y9tl7LY7L4gaHz6KkuEz0NmtF8JUJfXUWPMHmL6c8XZgfCklah1Y
	 U/SwoGTJa9N4jZ4SGcPsHczOthJTxHkGyBSbyg3+L/BrGVV8TCmbKAOKTgYYxrZSSF
	 Ywifo4pkBnatw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A535FCE0A6E; Wed, 24 Jul 2024 06:53:34 -0700 (PDT)
Date: Wed, 24 Jul 2024 06:53:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <b3d9710a-805e-4e37-8295-b5ec1133d15c@paulmck-laptop>
References: <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
 <ZnCDgdg1EH6V7w5d@pc636>
 <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
 <ZnFT1Czb8oRb0SE7@pc636>
 <5c8b2883-962f-431f-b2d3-3632755de3b0@paulmck-laptop>
 <9967fdfa-e649-456d-a0cb-b4c4bf7f9d68@suse.cz>
 <6dad6e9f-e0ca-4446-be9c-1be25b2536dd@paulmck-laptop>
 <4cba4a48-902b-4fb6-895c-c8e6b64e0d5f@suse.cz>
 <ZnVInAV8BXhgAjP_@pc636>
 <df0716ac-c995-498c-83ee-b8c25302f9ed@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df0716ac-c995-498c-83ee-b8c25302f9ed@suse.cz>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, kasan-dev <kasan-dev@googlegroups.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Uladzislau Rezki <urezki@gmail.com>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2024 at 10:39:38PM +0200, Vlastimil Babka wrote:
> On 6/21/24 11:32 AM, Uladzislau Rezki wrote:
> > On Wed, Jun 19, 2024 at 11:28:13AM +0200, Vlastimil Babka wrote:
> > One question. Maybe it is already late but it is better to ask rather than not.
> > 
> > What do you think if we have a small discussion about it on the LPC 2024 as a
> > topic? It might be it is already late or a schedule is set by now. Or we fix
> > it by a conference time.
> > 
> > Just a thought.
> 
> Sorry for the late reply. The MM MC turned out to be so packed I didn't even
> propose a slab topic. We could discuss in hallway track or a BOF, but
> hopefully if the current direction taken by my RFC brings no unexpected
> surprise, and the necessary RCU barrier side is also feasible, this will be
> settled by time of plumbers.

That would be even better!

							Thanx, Paul
