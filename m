Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEF090B67D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 18:34:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lqmD0K57;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2wSp5DZSz3g5S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 02:34:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lqmD0K57;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=srhl=nt=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2wS42cR5z3fxv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 02:33:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BA8D61335
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6F4C3277B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:33:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lqmD0K57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1718642017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUjKSm9UM4O1aKGbEZjvZRgCeGJk15TE1+l7iyYY+0E=;
	b=lqmD0K57cnaPOftHh2pOum828X1k5uUv0Vyx2HD1+u8cZfhtcNcmaJO3Jde0keMY78Ap/O
	TP1hCGHPmLCeXxG7ZdUXs/CPJ7wNLwf1Rwwgjd5I+wJyed+uUTgzNPiCteakfasG+gGmeX
	AZiaHQP3EqVbkxlqL/iUR3o0NHjrlw4=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ae95dd15 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 17 Jun 2024 16:33:36 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-25528eb4078so2538903fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 09:33:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZLeUBWTUFkwq8lshfY4vlAaLlYUgrI380Rs6EOIyXk4pxcghZCla1JybUMEku4LpkW+TDp/zEDYDRiWDtNpcPGBDbHXykymNm6mIVRQ==
X-Gm-Message-State: AOJu0Yyibd09xqDZ/JL+tH7vHb1m35RWqKbMwogopr6xaGgrVMamTUsX
	pPABks38kWGEC/qhjc+8RdT/IDS0EAvSiHVQXAquzE4J41fO1sv1d92JUziiT1m8JPH92FqHMVl
	H+rjmu0XGREWpVjYboYHm1QKl9Z0=
X-Google-Smtp-Source: AGHT+IH73cxa8bEaSx0br+R63lisN9Zy21+jpj61L5jMj9rENcrv4EuyB2mn51tWhnn9axbMUQaQmVNUc4nOeGH0JmU=
X-Received: by 2002:a05:6870:9725:b0:254:9ba7:488b with SMTP id
 586e51a60fabf-25842ba524dmr11130088fac.40.1718642015158; Mon, 17 Jun 2024
 09:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <Zmru7hhz8kPDPsyz@pc636> <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
 <Zmsuswo8OPIhY5KJ@pc636> <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636> <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan> <ZmybGZDbXkw7JTjc@zx2c4.com> <ZnA_QFvuyABnD3ZA@pc636>
 <ZnBOkZClsvAUa_5X@zx2c4.com> <ZnBkvYdbAWILs7qx@pc636>
In-Reply-To: <ZnBkvYdbAWILs7qx@pc636>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 Jun 2024 18:33:23 +0200
X-Gmail-Original-Message-ID: <CAHmME9r4q8erE3E-Xn61ZkSOdDDrgx6jhTAywx3ca4=G0z=wAA@mail.gmail.com>
Message-ID: <CAHmME9r4q8erE3E-Xn61ZkSOdDDrgx6jhTAywx3ca4=G0z=wAA@mail.gmail.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
To: Uladzislau Rezki <urezki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jun 17, 2024 at 6:30=E2=80=AFPM Uladzislau Rezki <urezki@gmail.com>=
 wrote:
> Here if an "err" is less then "0" means there are still objects
> whereas "is_destroyed" is set to "true" which is not correlated
> with a comment:
>
> "Destruction happens when no objects"

The comment is just poorly written. But the logic of the code is right.

>
> >  out_unlock:
> >       mutex_unlock(&slab_mutex);
> >       cpus_read_unlock();
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 1373ac365a46..7db8fe90a323 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -4510,6 +4510,8 @@ void kmem_cache_free(struct kmem_cache *s, void *=
x)
> >               return;
> >       trace_kmem_cache_free(_RET_IP_, x, s);
> >       slab_free(s, virt_to_slab(x), x, _RET_IP_);
> > +     if (s->is_destroyed)
> > +             kmem_cache_destroy(s);
> >  }
> >  EXPORT_SYMBOL(kmem_cache_free);
> >
> > @@ -5342,9 +5344,6 @@ static void free_partial(struct kmem_cache *s, st=
ruct kmem_cache_node *n)
> >               if (!slab->inuse) {
> >                       remove_partial(n, slab);
> >                       list_add(&slab->slab_list, &discard);
> > -             } else {
> > -                     list_slab_objects(s, slab,
> > -                       "Objects remaining in %s on __kmem_cache_shutdo=
wn()");
> >               }
> >       }
> >       spin_unlock_irq(&n->list_lock);
> >
> Anyway it looks like it was not welcome to do it in the kmem_cache_free()
> function due to performance reason.

"was not welcome" - Vlastimil mentioned *potential* performance
concerns before I posted this. I suspect he might have a different
view now, maybe?

Vlastimil, this is just checking a boolean (which could be
unlikely()'d), which should have pretty minimal overhead. Is that
alright with you?

Jason
