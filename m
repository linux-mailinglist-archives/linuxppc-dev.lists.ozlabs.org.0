Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778A290BA34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 20:55:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=htDly1vi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2zbV1ZBtz3gBg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 04:55:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=htDly1vi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=fwn3=nt=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2zZn3822z3g9c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 04:54:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3602661257;
	Mon, 17 Jun 2024 18:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D7BC2BD10;
	Mon, 17 Jun 2024 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718650479;
	bh=cmmYnDR5G/CPH+g8BcpN1MFkYmgodk2x412Uh4pRCDw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=htDly1viSXXYYDN2fKeKx2wmcWA279kRnzVgaC5yXX9rrUYI8hRNqQiZfGupG+pr8
	 fyvcrTaan+ehboyUpbKcuvFKbNCjyCKyP/e4RExGTWrX4Ajy4h4DpwAHm8KwpKdG8f
	 26DRExUZipco75yWMjxicdv9Nl2afaU5pTmkMQ49C4dWem15hPJGRkh37jNjcciSwu
	 KdhAzh1W3DjA1v4yvoUAm8deglvz0XhATfntWZgp4lETgOpWqILAB065yj7IdLIRh4
	 3ROzkDdsgzhVhI7mza08G5DAiCBpqSpMnSH5w5EUT/ZVIl1eNBKgWzLLeWzVvnHOI2
	 s5ULjvLFAuy0g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 80EC9CE09DB; Mon, 17 Jun 2024 11:54:39 -0700 (PDT)
Date: Mon, 17 Jun 2024 11:54:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <1755282b-e3f5-4d18-9eab-fc6a29ca5886@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com>
 <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com>
 <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
 <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
 <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, kasan-dev <kasan-dev@googlegroups.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, "Uladzislau Rezki \(Sony\)" <urezki@gmail.com>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2024 at 07:23:36PM +0200, Vlastimil Babka wrote:
> On 6/17/24 6:12 PM, Paul E. McKenney wrote:
> > On Mon, Jun 17, 2024 at 05:10:50PM +0200, Vlastimil Babka wrote:
> >> On 6/13/24 2:22 PM, Jason A. Donenfeld wrote:
> >> > On Wed, Jun 12, 2024 at 08:38:02PM -0700, Paul E. McKenney wrote:
> >> >> o	Make the current kmem_cache_destroy() asynchronously wait for
> >> >> 	all memory to be returned, then complete the destruction.
> >> >> 	(This gets rid of a valuable debugging technique because
> >> >> 	in normal use, it is a bug to attempt to destroy a kmem_cache
> >> >> 	that has objects still allocated.)
> >> 
> >> This seems like the best option to me. As Jason already said, the debugging
> >> technique is not affected significantly, if the warning just occurs
> >> asynchronously later. The module can be already unloaded at that point, as
> >> the leak is never checked programatically anyway to control further
> >> execution, it's just a splat in dmesg.
> > 
> > Works for me!
> 
> Great. So this is how a prototype could look like, hopefully? The kunit test
> does generate the splat for me, which should be because the rcu_barrier() in
> the implementation (marked to be replaced with the real thing) is really
> insufficient. Note the test itself passes as this kind of error isn't wired
> up properly.

;-) ;-) ;-)

Some might want confirmation that their cleanup efforts succeeded,
but if so, I will let them make that known.

> Another thing to resolve is the marked comment about kasan_shutdown() with
> potential kfree_rcu()'s in flight.

Could that simply move to the worker function?  (Hey, had to ask!)

> Also you need CONFIG_SLUB_DEBUG enabled otherwise node_nr_slabs() is a no-op
> and it might fail to notice the pending slabs. This will need to change.

Agreed.

Looks generally good.  A few questions below, to be taken with a
grain of salt.

							Thanx, Paul

> ----8<----
> diff --git a/lib/slub_kunit.c b/lib/slub_kunit.c
> index e6667a28c014..e3e4d0ca40b7 100644
> --- a/lib/slub_kunit.c
> +++ b/lib/slub_kunit.c
> @@ -5,6 +5,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> +#include <linux/rcupdate.h>
>  #include "../mm/slab.h"
>  
>  static struct kunit_resource resource;
> @@ -157,6 +158,26 @@ static void test_kmalloc_redzone_access(struct kunit *test)
>  	kmem_cache_destroy(s);
>  }
>  
> +struct test_kfree_rcu_struct {
> +	struct rcu_head rcu;
> +};
> +
> +static void test_kfree_rcu(struct kunit *test)
> +{
> +	struct kmem_cache *s = test_kmem_cache_create("TestSlub_kfree_rcu",
> +				sizeof(struct test_kfree_rcu_struct),
> +				SLAB_NO_MERGE);
> +	struct test_kfree_rcu_struct *p = kmem_cache_alloc(s, GFP_KERNEL);
> +
> +	kasan_disable_current();
> +
> +	KUNIT_EXPECT_EQ(test, 0, slab_errors);
> +
> +	kasan_enable_current();
> +	kfree_rcu(p, rcu);
> +	kmem_cache_destroy(s);

Looks like the type of test for this!

> +}
> +
>  static int test_init(struct kunit *test)
>  {
>  	slab_errors = 0;
> @@ -177,6 +198,7 @@ static struct kunit_case test_cases[] = {
>  
>  	KUNIT_CASE(test_clobber_redzone_free),
>  	KUNIT_CASE(test_kmalloc_redzone_access),
> +	KUNIT_CASE(test_kfree_rcu),
>  	{}
>  };
>  
> diff --git a/mm/slab.h b/mm/slab.h
> index b16e63191578..a0295600af92 100644
> --- a/mm/slab.h
> +++ b/mm/slab.h
> @@ -277,6 +277,8 @@ struct kmem_cache {
>  	unsigned int red_left_pad;	/* Left redzone padding size */
>  	const char *name;		/* Name (only for display!) */
>  	struct list_head list;		/* List of slab caches */
> +	struct work_struct async_destroy_work;
> +
>  #ifdef CONFIG_SYSFS
>  	struct kobject kobj;		/* For sysfs */
>  #endif
> @@ -474,7 +476,7 @@ static inline bool is_kmalloc_cache(struct kmem_cache *s)
>  			      SLAB_NO_USER_FLAGS)
>  
>  bool __kmem_cache_empty(struct kmem_cache *);
> -int __kmem_cache_shutdown(struct kmem_cache *);
> +int __kmem_cache_shutdown(struct kmem_cache *, bool);
>  void __kmem_cache_release(struct kmem_cache *);
>  int __kmem_cache_shrink(struct kmem_cache *);
>  void slab_kmem_cache_release(struct kmem_cache *);
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 5b1f996bed06..c5c356d0235d 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -44,6 +44,8 @@ static LIST_HEAD(slab_caches_to_rcu_destroy);
>  static void slab_caches_to_rcu_destroy_workfn(struct work_struct *work);
>  static DECLARE_WORK(slab_caches_to_rcu_destroy_work,
>  		    slab_caches_to_rcu_destroy_workfn);
> +static void kmem_cache_kfree_rcu_destroy_workfn(struct work_struct *work);
> +
>  
>  /*
>   * Set of flags that will prevent slab merging
> @@ -234,6 +236,7 @@ static struct kmem_cache *create_cache(const char *name,
>  
>  	s->refcount = 1;
>  	list_add(&s->list, &slab_caches);
> +	INIT_WORK(&s->async_destroy_work, kmem_cache_kfree_rcu_destroy_workfn);
>  	return s;
>  
>  out_free_cache:
> @@ -449,12 +452,16 @@ static void slab_caches_to_rcu_destroy_workfn(struct work_struct *work)
>  	}
>  }
>  
> -static int shutdown_cache(struct kmem_cache *s)
> +static int shutdown_cache(struct kmem_cache *s, bool warn_inuse)
>  {
>  	/* free asan quarantined objects */
> +	/*
> +	 * XXX: is it ok to call this multiple times? and what happens with a
> +	 * kfree_rcu() in flight that finishes after or in parallel with this?
> +	 */
>  	kasan_cache_shutdown(s);
>  
> -	if (__kmem_cache_shutdown(s) != 0)
> +	if (__kmem_cache_shutdown(s, warn_inuse) != 0)
>  		return -EBUSY;
>  
>  	list_del(&s->list);
> @@ -477,6 +484,32 @@ void slab_kmem_cache_release(struct kmem_cache *s)
>  	kmem_cache_free(kmem_cache, s);
>  }
>  
> +static void kmem_cache_kfree_rcu_destroy_workfn(struct work_struct *work)
> +{
> +	struct kmem_cache *s;
> +	int err = -EBUSY;
> +	bool rcu_set;
> +
> +	s = container_of(work, struct kmem_cache, async_destroy_work);
> +
> +	// XXX use the real kmem_cache_free_barrier() or similar thing here
> +	rcu_barrier();
> +
> +	cpus_read_lock();
> +	mutex_lock(&slab_mutex);
> +
> +	rcu_set = s->flags & SLAB_TYPESAFE_BY_RCU;
> +
> +	err = shutdown_cache(s, true);

This is currently the only call to shutdown_cache()?  So there is to be
a way for the caller to have some influence over the value of that bool?

> +	WARN(err, "kmem_cache_destroy %s: Slab cache still has objects",
> +	     s->name);

Don't we want to have some sort of delay here?  Or is this the
21-second delay and/or kfree_rcu_barrier() mentioned before?

> +	mutex_unlock(&slab_mutex);
> +	cpus_read_unlock();
> +	if (!err && !rcu_set)
> +		kmem_cache_release(s);
> +}
> +
>  void kmem_cache_destroy(struct kmem_cache *s)
>  {
>  	int err = -EBUSY;
> @@ -494,9 +527,9 @@ void kmem_cache_destroy(struct kmem_cache *s)
>  	if (s->refcount)
>  		goto out_unlock;
>  
> -	err = shutdown_cache(s);
> -	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
> -	     __func__, s->name, (void *)_RET_IP_);
> +	err = shutdown_cache(s, false);
> +	if (err)
> +		schedule_work(&s->async_destroy_work);
>  out_unlock:
>  	mutex_unlock(&slab_mutex);
>  	cpus_read_unlock();
> diff --git a/mm/slub.c b/mm/slub.c
> index 1617d8014ecd..4d435b3d2b5f 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -5342,7 +5342,8 @@ static void list_slab_objects(struct kmem_cache *s, struct slab *slab,
>   * This is called from __kmem_cache_shutdown(). We must take list_lock
>   * because sysfs file might still access partial list after the shutdowning.
>   */
> -static void free_partial(struct kmem_cache *s, struct kmem_cache_node *n)
> +static void free_partial(struct kmem_cache *s, struct kmem_cache_node *n,
> +			 bool warn_inuse)
>  {
>  	LIST_HEAD(discard);
>  	struct slab *slab, *h;
> @@ -5353,7 +5354,7 @@ static void free_partial(struct kmem_cache *s, struct kmem_cache_node *n)
>  		if (!slab->inuse) {
>  			remove_partial(n, slab);
>  			list_add(&slab->slab_list, &discard);
> -		} else {
> +		} else if (warn_inuse) {
>  			list_slab_objects(s, slab,
>  			  "Objects remaining in %s on __kmem_cache_shutdown()");
>  		}
> @@ -5378,7 +5379,7 @@ bool __kmem_cache_empty(struct kmem_cache *s)
>  /*
>   * Release all resources used by a slab cache.
>   */
> -int __kmem_cache_shutdown(struct kmem_cache *s)
> +int __kmem_cache_shutdown(struct kmem_cache *s, bool warn_inuse)
>  {
>  	int node;
>  	struct kmem_cache_node *n;
> @@ -5386,7 +5387,7 @@ int __kmem_cache_shutdown(struct kmem_cache *s)
>  	flush_all_cpus_locked(s);
>  	/* Attempt to free all objects */
>  	for_each_kmem_cache_node(s, node, n) {
> -		free_partial(s, n);
> +		free_partial(s, n, warn_inuse);
>  		if (n->nr_partial || node_nr_slabs(n))
>  			return 1;
>  	}
> 
