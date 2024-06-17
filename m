Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB190B765
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 19:05:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=EB2EkGMp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2x8g3fg0z3g7p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 03:05:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=EB2EkGMp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=srhl=nt=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2x7z0HgTz3g6K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 03:04:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EB1760EB8;
	Mon, 17 Jun 2024 17:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552BDC2BD10;
	Mon, 17 Jun 2024 17:04:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="EB2EkGMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1718643881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARICZd145/mpU/6/C4ChaIGt7llEKLdE0hg6cGdHWdo=;
	b=EB2EkGMp1iSSR/ZoBjTvLsRipbJ/3GyF1pF67bPbTJpZpZViXHWNSdGe3Wp0tZUf6UwcS3
	PPQY3tLkcp6pOnHOdpKJJIurtRSa2uJJxmso4eaZw7W4rybzLkYu5iwhPsWnqpDdk5ApWJ
	+Lmz+dK5Qx+05M2/zNiFzoH33PNzOFM=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 81f95149 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 17 Jun 2024 17:04:41 +0000 (UTC)
Date: Mon, 17 Jun 2024 19:04:34 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnBsomxy_cCnnIBy@zx2c4.com>
References: <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan>
 <ZmybGZDbXkw7JTjc@zx2c4.com>
 <ZnA_QFvuyABnD3ZA@pc636>
 <ZnBOkZClsvAUa_5X@zx2c4.com>
 <ZnBkvYdbAWILs7qx@pc636>
 <CAHmME9r4q8erE3E-Xn61ZkSOdDDrgx6jhTAywx3ca4=G0z=wAA@mail.gmail.com>
 <b415b8e3-24cc-4747-a30d-706e1dcfdff7@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b415b8e3-24cc-4747-a30d-706e1dcfdff7@suse.cz>
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
Cc: kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Uladzislau Rezki <urezki@gmail.com>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2024 at 06:38:52PM +0200, Vlastimil Babka wrote:
> On 6/17/24 6:33 PM, Jason A. Donenfeld wrote:
> > On Mon, Jun 17, 2024 at 6:30 PM Uladzislau Rezki <urezki@gmail.com> wrote:
> >> Here if an "err" is less then "0" means there are still objects
> >> whereas "is_destroyed" is set to "true" which is not correlated
> >> with a comment:
> >>
> >> "Destruction happens when no objects"
> > 
> > The comment is just poorly written. But the logic of the code is right.
> > 
> >>
> >> >  out_unlock:
> >> >       mutex_unlock(&slab_mutex);
> >> >       cpus_read_unlock();
> >> > diff --git a/mm/slub.c b/mm/slub.c
> >> > index 1373ac365a46..7db8fe90a323 100644
> >> > --- a/mm/slub.c
> >> > +++ b/mm/slub.c
> >> > @@ -4510,6 +4510,8 @@ void kmem_cache_free(struct kmem_cache *s, void *x)
> >> >               return;
> >> >       trace_kmem_cache_free(_RET_IP_, x, s);
> >> >       slab_free(s, virt_to_slab(x), x, _RET_IP_);
> >> > +     if (s->is_destroyed)
> >> > +             kmem_cache_destroy(s);
> >> >  }
> >> >  EXPORT_SYMBOL(kmem_cache_free);
> >> >
> >> > @@ -5342,9 +5344,6 @@ static void free_partial(struct kmem_cache *s, struct kmem_cache_node *n)
> >> >               if (!slab->inuse) {
> >> >                       remove_partial(n, slab);
> >> >                       list_add(&slab->slab_list, &discard);
> >> > -             } else {
> >> > -                     list_slab_objects(s, slab,
> >> > -                       "Objects remaining in %s on __kmem_cache_shutdown()");
> >> >               }
> >> >       }
> >> >       spin_unlock_irq(&n->list_lock);
> >> >
> >> Anyway it looks like it was not welcome to do it in the kmem_cache_free()
> >> function due to performance reason.
> > 
> > "was not welcome" - Vlastimil mentioned *potential* performance
> > concerns before I posted this. I suspect he might have a different
> > view now, maybe?
> > 
> > Vlastimil, this is just checking a boolean (which could be
> > unlikely()'d), which should have pretty minimal overhead. Is that
> > alright with you?
> 
> Well I doubt we can just set and check it without any barriers? The
> completion of the last pending kfree_rcu() might race with
> kmem_cache_destroy() in a way that will leave the cache there forever, no?
> And once we add barriers it becomes a perf issue?

Hm, yea you might be right about barriers being required. But actually,
might this point toward a larger problem with no matter what approach,
polling or event, is chosen? If the current rule is that
kmem_cache_free() must never race with kmem_cache_destroy(), because
users have always made diligent use of call_rcu()/rcu_barrier() and
such, but now we're going to let those race with each other - either by
my thing above or by polling - so we're potentially going to get in trouble
and need some barriers anyway. 

I think?

Jason
