Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3073690B308
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:57:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=clhRAdt9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2tJl6sJkz3g59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 00:57:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=clhRAdt9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=srhl=nt=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2tJ15YR8z3g1j
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 00:56:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBF18611A6;
	Mon, 17 Jun 2024 14:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F573C2BD10;
	Mon, 17 Jun 2024 14:56:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="clhRAdt9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1718636183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6bcwrvbIl7+eEjyyGJoXxh1mehCsgFRYWHRM/zwpUAQ=;
	b=clhRAdt9QmHzMaEEzVai+8NS5mBwqdWC/f0sKn8iKNRjAYqBW9N3E2L8sbjmiy2SQkZGk0
	hK8NYQAMg8k+eCY6yhiOMg3Eok18XjHMRfrN68QDTwANHVK37YKOUoOk4GYwZc7KCjnUD+
	5Jm/fDnndt2OgFIS0O5m9q1UI47PGCA=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 071c720a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 17 Jun 2024 14:56:22 +0000 (UTC)
Date: Mon, 17 Jun 2024 16:56:17 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Uladzislau Rezki <urezki@gmail.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnBOkZClsvAUa_5X@zx2c4.com>
References: <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
 <Zmru7hhz8kPDPsyz@pc636>
 <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
 <Zmsuswo8OPIhY5KJ@pc636>
 <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan>
 <ZmybGZDbXkw7JTjc@zx2c4.com>
 <ZnA_QFvuyABnD3ZA@pc636>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZnA_QFvuyABnD3ZA@pc636>
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
Cc: kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2024 at 03:50:56PM +0200, Uladzislau Rezki wrote:
> On Fri, Jun 14, 2024 at 09:33:45PM +0200, Jason A. Donenfeld wrote:
> > On Fri, Jun 14, 2024 at 02:35:33PM +0200, Uladzislau Rezki wrote:
> > > +	/* Should a destroy process be deferred? */
> > > +	if (s->flags & SLAB_DEFER_DESTROY) {
> > > +		list_move_tail(&s->list, &slab_caches_defer_destroy);
> > > +		schedule_delayed_work(&slab_caches_defer_destroy_work, HZ);
> > > +		goto out_unlock;
> > > +	}
> > 
> > Wouldn't it be smoother to have the actual kmem_cache_free() function
> > check to see if it's been marked for destruction and the refcount is
> > zero, rather than polling every one second? I mentioned this approach
> > in: https://lore.kernel.org/all/Zmo9-YGraiCj5-MI@zx2c4.com/ -
> > 
> >     I wonder if the right fix to this would be adding a `should_destroy`
> >     boolean to kmem_cache, which kmem_cache_destroy() sets to true. And
> >     then right after it checks `if (number_of_allocations == 0)
> >     actually_destroy()`, and likewise on each kmem_cache_free(), it
> >     could check `if (should_destroy && number_of_allocations == 0)
> >     actually_destroy()`. 
> > 
> I do not find pooling as bad way we can go with. But your proposal
> sounds reasonable to me also. We can combine both "prototypes" to
> one and offer.
> 
> Can you post a prototype here?

This is untested, but the simplest, shortest possible version would be:

diff --git a/mm/slab.h b/mm/slab.h
index 5f8f47c5bee0..907c0ea56c01 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -275,6 +275,7 @@ struct kmem_cache {
 	unsigned int inuse;		/* Offset to metadata */
 	unsigned int align;		/* Alignment */
 	unsigned int red_left_pad;	/* Left redzone padding size */
+	bool is_destroyed;		/* Destruction happens when no objects */
 	const char *name;		/* Name (only for display!) */
 	struct list_head list;		/* List of slab caches */
 #ifdef CONFIG_SYSFS
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 1560a1546bb1..f700bed066d9 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -494,8 +494,8 @@ void kmem_cache_destroy(struct kmem_cache *s)
 		goto out_unlock;

 	err = shutdown_cache(s);
-	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
-	     __func__, s->name, (void *)_RET_IP_);
+	if (err)
+		s->is_destroyed = true;
 out_unlock:
 	mutex_unlock(&slab_mutex);
 	cpus_read_unlock();
diff --git a/mm/slub.c b/mm/slub.c
index 1373ac365a46..7db8fe90a323 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4510,6 +4510,8 @@ void kmem_cache_free(struct kmem_cache *s, void *x)
 		return;
 	trace_kmem_cache_free(_RET_IP_, x, s);
 	slab_free(s, virt_to_slab(x), x, _RET_IP_);
+	if (s->is_destroyed)
+		kmem_cache_destroy(s);
 }
 EXPORT_SYMBOL(kmem_cache_free);

@@ -5342,9 +5344,6 @@ static void free_partial(struct kmem_cache *s, struct kmem_cache_node *n)
 		if (!slab->inuse) {
 			remove_partial(n, slab);
 			list_add(&slab->slab_list, &discard);
-		} else {
-			list_slab_objects(s, slab,
-			  "Objects remaining in %s on __kmem_cache_shutdown()");
 		}
 	}
 	spin_unlock_irq(&n->list_lock);

