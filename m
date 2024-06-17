Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 935FC90B667
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 18:31:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eL1SBMk1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2wPv2R0hz3g6G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 02:31:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eL1SBMk1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2wP818m2z3g4V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 02:31:07 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so54600251fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718641858; x=1719246658; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P18NXjBrMly2kaNOMkzQiyWW0KiEt9TV5gbmtLRhdnE=;
        b=eL1SBMk1765b8XX4mGkMzJPUv/N0ZpzZvqE1gVS6gg0r3Kb4FEbTInCawsH9btn8cp
         ED+dC0+df2J9NBRuQkW8rczzU/tY8k0r0ymDe0ng6c5D+P6kwV1IR1av3f1ElzexBRLd
         zaJnBKKAnMHs6WZKggJUWztHaAjSuus3Kd4B/Z2QsDUA0kEKroXlNHgJqMCG2JHEDvqx
         B2ZOF4xYNSgukW41gz9gbhFCBbnMdSnOFCz/CwL7JLWJntqBuSFqhGG0Czm8NCSfknZF
         IEZK065HlEF2fDmlyIRgn7oHDcCrNrOQ5MFcCY934v54BgUKDrrNJtOgZ9SLej0OiFyj
         FngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718641858; x=1719246658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P18NXjBrMly2kaNOMkzQiyWW0KiEt9TV5gbmtLRhdnE=;
        b=p+yk2iqXloUkdlFzVY/WoaK390Yl7TgYbqTLabJCPrPUG7HkvE0IelVB8ZQwu2dM4j
         ZvZLDngFg/6YsyT37FXEsp5EII6VKsqvx9mt6dhMKugdtQ5QXNju3Chni3eiPTSeZ2Rn
         RuINUZUcRaGJWfWFcU+TIxXSf4+XD33T45xFefZ6JdcrUmI6Ig+NvDlk5USz4sFd3QUk
         PqYBMz/Bg4zSTUm9EUzg3Usgn0R2ZN/8A+6P10q/6GMRuz6/b1LyuJeG8IlU/pYhGZ28
         NrIIMmIEbHt3bXoQ8x+Qk1M4YcwbNX9m4Nsw0x4iwMlQKhGsqcyg9k+qHbRct6zw1H+I
         f3ew==
X-Forwarded-Encrypted: i=1; AJvYcCX0vUzwLwDIIhnijZzk4++f9TBHMI7EHqPV/jhIjyPIUxmBCYDXBOXeOUPd66WunSx/zIt56Zs0sNnWyZxjPVO5Q15XPuczO5cxZ7dHuw==
X-Gm-Message-State: AOJu0YwWYXXHnX8ll60/w9irl2hZvoSwkQtmbSPmUwHnQCIZJfLd6dJb
	rGvpIK42w97pUKFBj7uzVBwfla1s0ZH7gHoJgnav4TULDhhztRu+
X-Google-Smtp-Source: AGHT+IEPhqe0DMj4rMlaXsMOCbhrl4lbGG1gPjCGb7ivFIirSumn2PP7mfmxsW/9BAzDd49k/bprGA==
X-Received: by 2002:a2e:9cd6:0:b0:2eb:fdd3:8fa2 with SMTP id 38308e7fff4ca-2ec0e5c5816mr68620871fa.13.1718641857513;
        Mon, 17 Jun 2024 09:30:57 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com. [90.233.216.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c78400sm14106751fa.84.2024.06.17.09.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:30:57 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 17 Jun 2024 18:30:53 +0200
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnBkvYdbAWILs7qx@pc636>
References: <Zmru7hhz8kPDPsyz@pc636>
 <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
 <Zmsuswo8OPIhY5KJ@pc636>
 <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan>
 <ZmybGZDbXkw7JTjc@zx2c4.com>
 <ZnA_QFvuyABnD3ZA@pc636>
 <ZnBOkZClsvAUa_5X@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnBOkZClsvAUa_5X@zx2c4.com>
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
Cc: kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Uladzislau Rezki <urezki@gmail.com>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2024 at 04:56:17PM +0200, Jason A. Donenfeld wrote:
> On Mon, Jun 17, 2024 at 03:50:56PM +0200, Uladzislau Rezki wrote:
> > On Fri, Jun 14, 2024 at 09:33:45PM +0200, Jason A. Donenfeld wrote:
> > > On Fri, Jun 14, 2024 at 02:35:33PM +0200, Uladzislau Rezki wrote:
> > > > +	/* Should a destroy process be deferred? */
> > > > +	if (s->flags & SLAB_DEFER_DESTROY) {
> > > > +		list_move_tail(&s->list, &slab_caches_defer_destroy);
> > > > +		schedule_delayed_work(&slab_caches_defer_destroy_work, HZ);
> > > > +		goto out_unlock;
> > > > +	}
> > > 
> > > Wouldn't it be smoother to have the actual kmem_cache_free() function
> > > check to see if it's been marked for destruction and the refcount is
> > > zero, rather than polling every one second? I mentioned this approach
> > > in: https://lore.kernel.org/all/Zmo9-YGraiCj5-MI@zx2c4.com/ -
> > > 
> > >     I wonder if the right fix to this would be adding a `should_destroy`
> > >     boolean to kmem_cache, which kmem_cache_destroy() sets to true. And
> > >     then right after it checks `if (number_of_allocations == 0)
> > >     actually_destroy()`, and likewise on each kmem_cache_free(), it
> > >     could check `if (should_destroy && number_of_allocations == 0)
> > >     actually_destroy()`. 
> > > 
> > I do not find pooling as bad way we can go with. But your proposal
> > sounds reasonable to me also. We can combine both "prototypes" to
> > one and offer.
> > 
> > Can you post a prototype here?
> 
> This is untested, but the simplest, shortest possible version would be:
> 
> diff --git a/mm/slab.h b/mm/slab.h
> index 5f8f47c5bee0..907c0ea56c01 100644
> --- a/mm/slab.h
> +++ b/mm/slab.h
> @@ -275,6 +275,7 @@ struct kmem_cache {
>  	unsigned int inuse;		/* Offset to metadata */
>  	unsigned int align;		/* Alignment */
>  	unsigned int red_left_pad;	/* Left redzone padding size */
> +	bool is_destroyed;		/* Destruction happens when no objects */
>  	const char *name;		/* Name (only for display!) */
>  	struct list_head list;		/* List of slab caches */
>  #ifdef CONFIG_SYSFS
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 1560a1546bb1..f700bed066d9 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -494,8 +494,8 @@ void kmem_cache_destroy(struct kmem_cache *s)
>  		goto out_unlock;
> 
>  	err = shutdown_cache(s);
> -	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
> -	     __func__, s->name, (void *)_RET_IP_);
> +	if (err)
> +		s->is_destroyed = true;
>
Here if an "err" is less then "0" means there are still objects
whereas "is_destroyed" is set to "true" which is not correlated
with a comment:

"Destruction happens when no objects"

>  out_unlock:
>  	mutex_unlock(&slab_mutex);
>  	cpus_read_unlock();
> diff --git a/mm/slub.c b/mm/slub.c
> index 1373ac365a46..7db8fe90a323 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -4510,6 +4510,8 @@ void kmem_cache_free(struct kmem_cache *s, void *x)
>  		return;
>  	trace_kmem_cache_free(_RET_IP_, x, s);
>  	slab_free(s, virt_to_slab(x), x, _RET_IP_);
> +	if (s->is_destroyed)
> +		kmem_cache_destroy(s);
>  }
>  EXPORT_SYMBOL(kmem_cache_free);
> 
> @@ -5342,9 +5344,6 @@ static void free_partial(struct kmem_cache *s, struct kmem_cache_node *n)
>  		if (!slab->inuse) {
>  			remove_partial(n, slab);
>  			list_add(&slab->slab_list, &discard);
> -		} else {
> -			list_slab_objects(s, slab,
> -			  "Objects remaining in %s on __kmem_cache_shutdown()");
>  		}
>  	}
>  	spin_unlock_irq(&n->list_lock);
> 
Anyway it looks like it was not welcome to do it in the kmem_cache_free()
function due to performance reason.

--
Uladzislau Rezki
