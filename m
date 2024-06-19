Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D4E90E941
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 13:23:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YhimLnzK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W41Sl2KYzz3dJX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 21:23:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YhimLnzK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W41S24QsCz3cXt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 21:22:24 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso68488531fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718796136; x=1719400936; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1We8+J1M8/iGwbEuKq9QLdgleuBIYYNVC3Jie6+7WKQ=;
        b=YhimLnzKFV2uYu+r7rS/wYC01M4RZOGPQ/hSrYci85uuqeJNAbhRgtIQnEhQ/rgf3R
         /lVMolKxlSvicvrxY3JHILuryzK7PoodjAZVhA7Izt0cwtNnv89T/OOASAKasCrG2gc8
         1QVRPAJVnHYXEHumxOmAaNY1T/NMGSGMGMr7O8Qr6DMKFtWN2FSbF+4XNbYDiaRm5cWS
         wGHGkBXFl2W2+jBk0h7kbRuccjtaxZwLRJKubLr8OZcmtq8ArcQkZ4kspdF0NyCEiECE
         CRfAWihZ1X5cCiOr+7vzxjzslf/UZSs4Ab7EoqNuSIxDLWP2qmOg9noXx2WBcWFteP3P
         TTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796136; x=1719400936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1We8+J1M8/iGwbEuKq9QLdgleuBIYYNVC3Jie6+7WKQ=;
        b=HbHJOfkP1/T0smA0N/BrSGhohYYTHh4/sX5r2f9X10GqCJ6crPYbVCmOLyrHl2ZPPW
         TUudmW7h5RFfpjXL01+nWWF4mhmQqv2+SeK4mCr/hkaz0w8BK8roazI8Peb3MZvKQetQ
         rZtiMC6ACNz6EK7NKr0XR6/sMRhATQemiesarPPYK5JPX1iufKHUs3146VmAUSPQocSm
         xVqvuWFlPW5u1IjsjM654CUwvfHrdEHrzAL9MxeVg8VG7vw4iE3cG04rBCgOpioz2JfI
         P5+RR/dUGxCzXe5WZEMY5M/J1NeMMhOMNho13qrYZpS+y6TLzQXGzA8iPJzDrrNTFIDS
         1HhA==
X-Forwarded-Encrypted: i=1; AJvYcCXkIgPEvQVME7r3D3OPpSCvuEKS1BLJ38wbo/jW3z4Wa9nsunqAR58pXtbuT0VvBM2RLedvOzu30fRn1fcP3X5gHWlWI6PnfCUIZa0Y8A==
X-Gm-Message-State: AOJu0YwC6O7oA1Y9eqFE5XhAVIMkvq5fQrtF42UHqkRoUTLLlsCv5TL5
	hqj4Dyc5i0ZUA9OMsexIpELboR/ahcw2TuYwgd4M5Pc+uvz14kfc
X-Google-Smtp-Source: AGHT+IHY6I+1wjnfCL5bVO3aTBj0asX2DB6+TLCQy1IxnGK2EyJpAdTHcDYhDhl1lF4pI5isZiqATw==
X-Received: by 2002:a2e:7818:0:b0:2ec:3bc4:3e36 with SMTP id 38308e7fff4ca-2ec3ceb6a56mr15076241fa.14.1718796136224;
        Wed, 19 Jun 2024 04:22:16 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com. [90.233.216.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c78126sm19577951fa.81.2024.06.19.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:22:15 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 19 Jun 2024 13:22:12 +0200
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnK_ZLlFM6MrdEah@pc636>
References: <Zmrkkel0Fo4_g75a@zx2c4.com>
 <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
 <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
 <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
 <ZnCDgdg1EH6V7w5d@pc636>
 <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
 <ZnFT1Czb8oRb0SE7@pc636>
 <5c8b2883-962f-431f-b2d3-3632755de3b0@paulmck-laptop>
 <ZnKqPqlPD3Rl04DZ@pc636>
 <c208e95d-9aa9-476f-9dee-0242a2d6a24f@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c208e95d-9aa9-476f-9dee-0242a2d6a24f@suse.cz>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, kasan-dev <kasan-dev@googlegroups.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Uladzislau Rezki <urezki@gmail.com>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 19, 2024 at 11:56:44AM +0200, Vlastimil Babka wrote:
> On 6/19/24 11:51 AM, Uladzislau Rezki wrote:
> > On Tue, Jun 18, 2024 at 09:48:49AM -0700, Paul E. McKenney wrote:
> >> On Tue, Jun 18, 2024 at 11:31:00AM +0200, Uladzislau Rezki wrote:
> >> > > On 6/17/24 8:42 PM, Uladzislau Rezki wrote:
> >> > > >> +
> >> > > >> +	s = container_of(work, struct kmem_cache, async_destroy_work);
> >> > > >> +
> >> > > >> +	// XXX use the real kmem_cache_free_barrier() or similar thing here
> >> > > > It implies that we need to introduce kfree_rcu_barrier(), a new API, which i
> >> > > > wanted to avoid initially.
> >> > > 
> >> > > I wanted to avoid new API or flags for kfree_rcu() users and this would
> >> > > be achieved. The barrier is used internally so I don't consider that an
> >> > > API to avoid. How difficult is the implementation is another question,
> >> > > depending on how the current batching works. Once (if) we have sheaves
> >> > > proven to work and move kfree_rcu() fully into SLUB, the barrier might
> >> > > also look different and hopefully easier. So maybe it's not worth to
> >> > > invest too much into that barrier and just go for the potentially
> >> > > longer, but easier to implement?
> >> > > 
> >> > Right. I agree here. If the cache is not empty, OK, we just defer the
> >> > work, even we can use a big 21 seconds delay, after that we just "warn"
> >> > if it is still not empty and leave it as it is, i.e. emit a warning and
> >> > we are done.
> >> > 
> >> > Destroying the cache is not something that must happen right away. 
> >> 
> >> OK, I have to ask...
> >> 
> >> Suppose that the cache is created and destroyed by a module and
> >> init/cleanup time, respectively.  Suppose that this module is rmmod'ed
> >> then very quickly insmod'ed.
> >> 
> >> Do we need to fail the insmod if the kmem_cache has not yet been fully
> >> cleaned up?  If not, do we have two versions of the same kmem_cache in
> >> /proc during the overlap time?
> >> 
> > No fail :) If same cache is created several times, its s->refcount gets
> > increased, so, it does not create two entries in the "slabinfo". But i
> > agree that your point is good! We need to be carefully with removing and
> > simultaneous creating.
> 
> Note that this merging may be disabled or not happen due to various flags on
> the cache being incompatible with it. And I want to actually make sure it
> never happens for caches being already destroyed as that would lead to
> use-after-free (the workfn doesn't recheck the refcount in case a merge
> would happen during the grace period)
> 
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -150,9 +150,10 @@ int slab_unmergeable(struct kmem_cache *s)
>  #endif
> 
>         /*
> -        * We may have set a slab to be unmergeable during bootstrap.
> +        * We may have set a cache to be unmergeable during bootstrap.
> +        * 0 is for cache being destroyed asynchronously
>          */
> -       if (s->refcount < 0)
> +       if (s->refcount <= 0)
>                 return 1;
> 
>         return 0;
> 
OK, i see such flags, SLAB_NO_MERGE. Then i was wrong, it can create two
different slabs.

Thanks!

--
Uladzislau Rezki
