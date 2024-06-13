Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB4906D47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 13:59:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MeI8MH8G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0LZ23ptkz3cWN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 21:59:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MeI8MH8G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=zvo8=np=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0LYH2tWJz30St
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 21:59:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC00661A4D;
	Thu, 13 Jun 2024 11:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEAAC4AF4D;
	Thu, 13 Jun 2024 11:59:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="MeI8MH8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1718279946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2oQoeraeqQaQpCY62eMS55dJmmDU2cLnySqsO1DV0bg=;
	b=MeI8MH8G9GaVwTubn3zbemt8iMGjhWu2xlRT5g6xh1L4MS9g8vj3/b4L5Io4CIm+PbC/28
	K4kTBBhke2rM7bNZ2dv8VC/fK7/9r4oKXzXHf3Yt4ENzPLvg7XFBUp90WP45io3c2/cs6Q
	JMbCSdFZKlgC96+RmMCLxV7PaJ3gRO0=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ebdb63be (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 13 Jun 2024 11:59:05 +0000 (UTC)
Date: Thu, 13 Jun 2024 13:58:59 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZmrfA1p2zSVIaYam@zx2c4.com>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
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

On Wed, Jun 12, 2024 at 03:37:55PM -0700, Paul E. McKenney wrote:
> On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> > On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > > Since SLOB was removed, it is not necessary to use call_rcu
> > > when the callback only performs kmem_cache_free. Use
> > > kfree_rcu() directly.
> > > 
> > > The changes were done using the following Coccinelle semantic patch.
> > > This semantic patch is designed to ignore cases where the callback
> > > function is used in another way.
> > 
> > How does the discussion on:
> >   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
> >   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> > reflect on this series? IIUC we should hold off..
> 
> We do need to hold off for the ones in kernel modules (such as 07/14)
> where the kmem_cache is destroyed during module unload.
> 
> OK, I might as well go through them...
> 
> [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> 	Needs to wait, see wg_allowedips_slab_uninit().

Also, notably, this patch needs additionally:

diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
index e4e1638fce1b..c95f6937c3f1 100644
--- a/drivers/net/wireguard/allowedips.c
+++ b/drivers/net/wireguard/allowedips.c
@@ -377,7 +377,6 @@ int __init wg_allowedips_slab_init(void)

 void wg_allowedips_slab_uninit(void)
 {
-	rcu_barrier();
 	kmem_cache_destroy(node_cache);
 }

Once kmem_cache_destroy has been fixed to be deferrable.

I assume the other patches are similar -- an rcu_barrier() can be
removed. So some manual meddling of these might be in order.

Jason
