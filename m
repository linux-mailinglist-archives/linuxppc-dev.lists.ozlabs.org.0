Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E287908DDC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 16:51:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RA48yqyL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W12Kh6LT1z3clx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 00:51:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RA48yqyL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W12Jx4ZQZz30Vs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 00:50:55 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52c8c0d73d3so2514996e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718376649; x=1718981449; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A1vDM+/434Vy7O2My5RlGhyPzc53w2jNpv2mu0lM6fk=;
        b=RA48yqyLNwGV9bWRYpObOt+jJjqVFuQ6MyKUZHsSIBHjeVhvzapql7z6uasNhqGXjX
         G7i5ozuMrW0/gsJsIFXZObpp/2MIqmlJLxB+DnK4W8NB92/0TH7pmLCaRZ4na6mcZrMJ
         Ox5tezvWdl+36LAFc6TCmP/QeY7tPPyxzkO5KYCfPwgmrMJ5OYXSnCaSZ48G6F665hzn
         8TRyffzsmoWT/MSXGFuzNO/D0IwJGixDrH6bwnFd99N7nsa+FA+J+HzhjMViQG98xV+G
         L4TbJfiYoyJDpW5w6BYzaptXFFJj5GiWTZ7soglmRDgAWQjBAyWcYkCu2R63UgF0DvtV
         /0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718376649; x=1718981449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1vDM+/434Vy7O2My5RlGhyPzc53w2jNpv2mu0lM6fk=;
        b=ApkKr4ydlwrvo+NUF+i+UJjsWBrjwhTpF9mC5Slq3f8VMFv0zaCiza1AhugEpHi9dG
         nUazyFw/FWoNzMTFjgfjPuubqjsx/9rZGoFDH+P23cM0QQXrAimvMpfkjtZxCktBzfRr
         6sdWr1ocRNibL2nRO8yEgNd8IRx6Crbrh08L7WlUh/NHEIdwr4aL+eYYml/XAbWWphgC
         wrW2knE3sy1vc4SvUePGHEh/bEmK6nAo/EGuFIaPjMFr+X35c58X9LHM2o7LdbVwI8C2
         qIjMKr4UB5OWXgAS5loZmlkcW3HanNNGxCJ2zpREY1ujDdLJSX8KWTqXK3DyPXw8y/Bm
         1OuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGRMw3MdRi9SHSTkcNuPCfynEZT7Sh0mQ1XvBcXWvI3mOxmDyfde8qAc9qeHlIZmxme0m9qL4gB4eHVc1RV92INmDuJA+5LjYC8/gwVw==
X-Gm-Message-State: AOJu0YyVlto0mZD2hNMdPySD3x+Nn5LGKGj8xTH/xzAzzrsMXs5ZjBXu
	FpVjwGdo3OCbinYhkPa1Ei9JL8DAEtcgd/DsTtMOvWICRDRWwY0x
X-Google-Smtp-Source: AGHT+IFwcocbKCVljpVcKX91E2mKCvIpm5pfUWDi+eXb482Grpw2w/2u1FYYW0LUN48bweJbaljbrg==
X-Received: by 2002:ac2:4181:0:b0:52c:a5e6:989e with SMTP id 2adb3069b0e04-52ca6e656d3mr1989889e87.16.1718376648691;
        Fri, 14 Jun 2024 07:50:48 -0700 (PDT)
Received: from pc636 (host-90-233-218-141.mobileonline.telia.com. [90.233.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2888119sm534327e87.266.2024.06.14.07.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:50:48 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 14 Jun 2024 16:50:45 +0200
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZmxYxYSLulV_2vhN@pc636>
References: <ZmrfA1p2zSVIaYam@zx2c4.com>
 <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
 <Zmru7hhz8kPDPsyz@pc636>
 <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
 <Zmsuswo8OPIhY5KJ@pc636>
 <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan>
 <addbec8f-a67c-4191-8a3c-1181488947cb@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <addbec8f-a67c-4191-8a3c-1181488947cb@paulmck-laptop>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Uladzislau Rezki <urezki@gmail.com>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2024 at 07:17:29AM -0700, Paul E. McKenney wrote:
> On Fri, Jun 14, 2024 at 02:35:33PM +0200, Uladzislau Rezki wrote:
> > On Thu, Jun 13, 2024 at 11:13:52AM -0700, Paul E. McKenney wrote:
> > > On Thu, Jun 13, 2024 at 07:58:17PM +0200, Uladzislau Rezki wrote:
> > > > On Thu, Jun 13, 2024 at 10:45:59AM -0700, Paul E. McKenney wrote:
> > > > > On Thu, Jun 13, 2024 at 07:38:59PM +0200, Uladzislau Rezki wrote:
> > > > > > On Thu, Jun 13, 2024 at 08:06:30AM -0700, Paul E. McKenney wrote:
> > > > > > > On Thu, Jun 13, 2024 at 03:06:54PM +0200, Uladzislau Rezki wrote:
> > > > > > > > On Thu, Jun 13, 2024 at 05:47:08AM -0700, Paul E. McKenney wrote:
> > > > > > > > > On Thu, Jun 13, 2024 at 01:58:59PM +0200, Jason A. Donenfeld wrote:
> > > > > > > > > > On Wed, Jun 12, 2024 at 03:37:55PM -0700, Paul E. McKenney wrote:
> > > > > > > > > > > On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> > > > > > > > > > > > On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > > > > > > > > > > > > Since SLOB was removed, it is not necessary to use call_rcu
> > > > > > > > > > > > > when the callback only performs kmem_cache_free. Use
> > > > > > > > > > > > > kfree_rcu() directly.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > The changes were done using the following Coccinelle semantic patch.
> > > > > > > > > > > > > This semantic patch is designed to ignore cases where the callback
> > > > > > > > > > > > > function is used in another way.
> > > > > > > > > > > > 
> > > > > > > > > > > > How does the discussion on:
> > > > > > > > > > > >   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
> > > > > > > > > > > >   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> > > > > > > > > > > > reflect on this series? IIUC we should hold off..
> > > > > > > > > > > 
> > > > > > > > > > > We do need to hold off for the ones in kernel modules (such as 07/14)
> > > > > > > > > > > where the kmem_cache is destroyed during module unload.
> > > > > > > > > > > 
> > > > > > > > > > > OK, I might as well go through them...
> > > > > > > > > > > 
> > > > > > > > > > > [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > > > > > > > > > > 	Needs to wait, see wg_allowedips_slab_uninit().
> > > > > > > > > > 
> > > > > > > > > > Also, notably, this patch needs additionally:
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> > > > > > > > > > index e4e1638fce1b..c95f6937c3f1 100644
> > > > > > > > > > --- a/drivers/net/wireguard/allowedips.c
> > > > > > > > > > +++ b/drivers/net/wireguard/allowedips.c
> > > > > > > > > > @@ -377,7 +377,6 @@ int __init wg_allowedips_slab_init(void)
> > > > > > > > > > 
> > > > > > > > > >  void wg_allowedips_slab_uninit(void)
> > > > > > > > > >  {
> > > > > > > > > > -	rcu_barrier();
> > > > > > > > > >  	kmem_cache_destroy(node_cache);
> > > > > > > > > >  }
> > > > > > > > > > 
> > > > > > > > > > Once kmem_cache_destroy has been fixed to be deferrable.
> > > > > > > > > > 
> > > > > > > > > > I assume the other patches are similar -- an rcu_barrier() can be
> > > > > > > > > > removed. So some manual meddling of these might be in order.
> > > > > > > > > 
> > > > > > > > > Assuming that the deferrable kmem_cache_destroy() is the option chosen,
> > > > > > > > > agreed.
> > > > > > > > >
> > > > > > > > <snip>
> > > > > > > > void kmem_cache_destroy(struct kmem_cache *s)
> > > > > > > > {
> > > > > > > > 	int err = -EBUSY;
> > > > > > > > 	bool rcu_set;
> > > > > > > > 
> > > > > > > > 	if (unlikely(!s) || !kasan_check_byte(s))
> > > > > > > > 		return;
> > > > > > > > 
> > > > > > > > 	cpus_read_lock();
> > > > > > > > 	mutex_lock(&slab_mutex);
> > > > > > > > 
> > > > > > > > 	rcu_set = s->flags & SLAB_TYPESAFE_BY_RCU;
> > > > > > > > 
> > > > > > > > 	s->refcount--;
> > > > > > > > 	if (s->refcount)
> > > > > > > > 		goto out_unlock;
> > > > > > > > 
> > > > > > > > 	err = shutdown_cache(s);
> > > > > > > > 	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
> > > > > > > > 	     __func__, s->name, (void *)_RET_IP_);
> > > > > > > > ...
> > > > > > > > 	cpus_read_unlock();
> > > > > > > > 	if (!err && !rcu_set)
> > > > > > > > 		kmem_cache_release(s);
> > > > > > > > }
> > > > > > > > <snip>
> > > > > > > > 
> > > > > > > > so we have SLAB_TYPESAFE_BY_RCU flag that defers freeing slab-pages
> > > > > > > > and a cache by a grace period. Similar flag can be added, like
> > > > > > > > SLAB_DESTROY_ONCE_FULLY_FREED, in this case a worker rearm itself
> > > > > > > > if there are still objects which should be freed.
> > > > > > > > 
> > > > > > > > Any thoughts here?
> > > > > > > 
> > > > > > > Wouldn't we also need some additional code to later check for all objects
> > > > > > > being freed to the slab, whether or not that code is  initiated from
> > > > > > > kmem_cache_destroy()?
> > > > > > >
> > > > > > Same away as SLAB_TYPESAFE_BY_RCU is handled from the kmem_cache_destroy() function.
> > > > > > It checks that flag and if it is true and extra worker is scheduled to perform a
> > > > > > deferred(instead of right away) destroy after rcu_barrier() finishes.
> > > > > 
> > > > > Like this?
> > > > > 
> > > > > 	SLAB_DESTROY_ONCE_FULLY_FREED
> > > > > 
> > > > > 	Instead of adding a new kmem_cache_destroy_rcu()
> > > > > 	or kmem_cache_destroy_wait() API member, instead add a
> > > > > 	SLAB_DESTROY_ONCE_FULLY_FREED flag that can be passed to the
> > > > > 	existing kmem_cache_destroy() function.  Use of this flag would
> > > > > 	suppress any warnings that would otherwise be issued if there
> > > > > 	was still slab memory yet to be freed, and it would also spawn
> > > > > 	workqueues (or timers or whatever) to do any needed cleanup work.
> > > > > 
> > > > >
> > > > The flag is passed as all others during creating a cache:
> > > > 
> > > >   slab = kmem_cache_create(name, size, ..., SLAB_DESTROY_ONCE_FULLY_FREED | OTHER_FLAGS, NULL);
> > > > 
> > > > the rest description is correct to me.
> > > 
> > > Good catch, fixed, thank you!
> > > 
> > And here we go with prototype(untested):
> 
> Thank you for putting this together!  It looks way simpler than I would
> have guessed, and quite a bit simpler than I would expect it would be
> to extend rcu_barrier() to cover kfree_rcu().
> 
Yep, it should be pretty pretty straightforward. The slab mechanism does
not have a functionality when it comes to defer of destroying, i.e. it
is not allowed to destroy non-fully-freed-slab:

<snip>
void kmem_cache_destroy(struct kmem_cache *s)
{
...
	err = shutdown_cache(s);
	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
	     __func__, s->name, (void *)_RET_IP_);
...
<snip>

So, this patch extends it.

> >  
> > +static void
> > +slab_caches_defer_destroy_workfn(struct work_struct *work)
> > +{
> > +	struct kmem_cache *s, *s2;
> > +
> > +	mutex_lock(&slab_mutex);
> > +	list_for_each_entry_safe(s, s2, &slab_caches_defer_destroy, list) {
> > +		if (__kmem_cache_empty(s)) {
> > +			/* free asan quarantined objects */
> > +			kasan_cache_shutdown(s);
> > +			(void) __kmem_cache_shutdown(s);
> > +
> > +			list_del(&s->list);
> > +
> > +			debugfs_slab_release(s);
> > +			kfence_shutdown_cache(s);
> > +			kmem_cache_release(s);
> > +		}
> 
> My guess is that there would want to be a splat if the slab stuck around
> for too long, but maybe that should instead be handled elsewhere or in
> some other way?  I must defer to you guys on that one.
> 
Probably yes.

--
Uladzislau Rezki
