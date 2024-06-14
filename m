Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E42908BD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 14:36:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D1JHp3Xr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0zKh3kZGz3cfQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 22:36:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D1JHp3Xr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0zJz17Yyz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 22:35:45 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so281665566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718368536; x=1718973336; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6xncwEQhJ0KCZi1KCF0PNf8P6th4C6KO1kVmoV89D18=;
        b=D1JHp3XrfTxcaiythU1Hc0yBSIFEO7VH0BGe1JR5iBR46uuaoN8n6lHU6xvU1W4tny
         nH3WyWRcidMML6ZDjin/EcTDnEuykKp9rM1KFWz4UxJ7I5IxIuY1xOa9mHrcGoBGdFjG
         z3SKDGObwZyp5F//e4njgKrXmLAl6Ka3FZwqGeYObSW/oC2KTpkMq9jTS2QpKI0ajcVu
         cs1KCdZmJZoAFsCdenCruQiN4c3OWZutg8pP5mKugH6yFdgqFXlqPsH/4gocesW2kKCk
         OK/z7QduqkRtpnapZIjRsaYSHXWZPTnkAT2zRn3mi8OTbonAjSSyz1JdPrDYEtXL1xEd
         qZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718368536; x=1718973336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xncwEQhJ0KCZi1KCF0PNf8P6th4C6KO1kVmoV89D18=;
        b=Ecw95flM+XUcoZzLFYgiRNf8B+1/A3zFO6C9Y8JU4Tb5JO4ierRjN5wsa4h2pJ9ZK1
         AXY4VhZc74INH1UYcsDBmx4Ld2cxEL9kqc9oTfUsHPJOfbPnL5RU4Fjr10BPc1189+NK
         0WEJ5ucnr32U10Qe1LhGihsgN3ZVxGSzlmIwH6EDgajlL7bnNzz8gj6MI8FiiTwengjG
         d7StarvGEK23pTDKihWbkwyVosw8m2uvsKckxfN5/dmRtKUaHc8PwU5Fi2V6RQBq+B3J
         dYcowaXOiw+ym9g5qjJiBmPefZULrLaHQvSiSIEh0kMfaMmSpdNvWZE1tKSOJvyUUQHx
         wd8A==
X-Forwarded-Encrypted: i=1; AJvYcCV/QBoVuqvryoZtUDB+iqV93DbMMmeqpUQDLFtt1ocDCCOfb0hkDZAJfUI5NEAOSQYBTdTBgEpl8XAv0EUrcN5z3ayASkwwuzuRsetX2A==
X-Gm-Message-State: AOJu0Yw0xSHSoaFDlSDVnAC7emM7w9K3yH4W9dWPS62MwMpN4beYnU3E
	k82lwtMyUsS8Z/k03J4IKS2nEQkr1r8KHiYI/Nqo0QRHNPMwKBYH
X-Google-Smtp-Source: AGHT+IGBu/WE9qdX/TKJv/ShYFnVP75PTz1VUCjk53ecJ2dTHwdQ19tj6QlF3Vj2RL5PPKGAGP26YQ==
X-Received: by 2002:a17:906:f2ce:b0:a6f:1045:d5e2 with SMTP id a640c23a62f3a-a6f60cee9c6mr171508066b.4.1718368536193;
        Fri, 14 Jun 2024 05:35:36 -0700 (PDT)
Received: from pc638.lan (host-185-121-47-193.sydskane.nu. [185.121.47.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db5bbcsm179792066b.82.2024.06.14.05.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 05:35:35 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Fri, 14 Jun 2024 14:35:33 +0200
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <Zmw5FTX752g0vtlD@pc638.lan>
References: <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <ZmrfA1p2zSVIaYam@zx2c4.com>
 <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
 <Zmru7hhz8kPDPsyz@pc636>
 <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
 <Zmsuswo8OPIhY5KJ@pc636>
 <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
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

On Thu, Jun 13, 2024 at 11:13:52AM -0700, Paul E. McKenney wrote:
> On Thu, Jun 13, 2024 at 07:58:17PM +0200, Uladzislau Rezki wrote:
> > On Thu, Jun 13, 2024 at 10:45:59AM -0700, Paul E. McKenney wrote:
> > > On Thu, Jun 13, 2024 at 07:38:59PM +0200, Uladzislau Rezki wrote:
> > > > On Thu, Jun 13, 2024 at 08:06:30AM -0700, Paul E. McKenney wrote:
> > > > > On Thu, Jun 13, 2024 at 03:06:54PM +0200, Uladzislau Rezki wrote:
> > > > > > On Thu, Jun 13, 2024 at 05:47:08AM -0700, Paul E. McKenney wrote:
> > > > > > > On Thu, Jun 13, 2024 at 01:58:59PM +0200, Jason A. Donenfeld wrote:
> > > > > > > > On Wed, Jun 12, 2024 at 03:37:55PM -0700, Paul E. McKenney wrote:
> > > > > > > > > On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> > > > > > > > > > On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > > > > > > > > > > Since SLOB was removed, it is not necessary to use call_rcu
> > > > > > > > > > > when the callback only performs kmem_cache_free. Use
> > > > > > > > > > > kfree_rcu() directly.
> > > > > > > > > > > 
> > > > > > > > > > > The changes were done using the following Coccinelle semantic patch.
> > > > > > > > > > > This semantic patch is designed to ignore cases where the callback
> > > > > > > > > > > function is used in another way.
> > > > > > > > > > 
> > > > > > > > > > How does the discussion on:
> > > > > > > > > >   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
> > > > > > > > > >   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> > > > > > > > > > reflect on this series? IIUC we should hold off..
> > > > > > > > > 
> > > > > > > > > We do need to hold off for the ones in kernel modules (such as 07/14)
> > > > > > > > > where the kmem_cache is destroyed during module unload.
> > > > > > > > > 
> > > > > > > > > OK, I might as well go through them...
> > > > > > > > > 
> > > > > > > > > [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > > > > > > > > 	Needs to wait, see wg_allowedips_slab_uninit().
> > > > > > > > 
> > > > > > > > Also, notably, this patch needs additionally:
> > > > > > > > 
> > > > > > > > diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> > > > > > > > index e4e1638fce1b..c95f6937c3f1 100644
> > > > > > > > --- a/drivers/net/wireguard/allowedips.c
> > > > > > > > +++ b/drivers/net/wireguard/allowedips.c
> > > > > > > > @@ -377,7 +377,6 @@ int __init wg_allowedips_slab_init(void)
> > > > > > > > 
> > > > > > > >  void wg_allowedips_slab_uninit(void)
> > > > > > > >  {
> > > > > > > > -	rcu_barrier();
> > > > > > > >  	kmem_cache_destroy(node_cache);
> > > > > > > >  }
> > > > > > > > 
> > > > > > > > Once kmem_cache_destroy has been fixed to be deferrable.
> > > > > > > > 
> > > > > > > > I assume the other patches are similar -- an rcu_barrier() can be
> > > > > > > > removed. So some manual meddling of these might be in order.
> > > > > > > 
> > > > > > > Assuming that the deferrable kmem_cache_destroy() is the option chosen,
> > > > > > > agreed.
> > > > > > >
> > > > > > <snip>
> > > > > > void kmem_cache_destroy(struct kmem_cache *s)
> > > > > > {
> > > > > > 	int err = -EBUSY;
> > > > > > 	bool rcu_set;
> > > > > > 
> > > > > > 	if (unlikely(!s) || !kasan_check_byte(s))
> > > > > > 		return;
> > > > > > 
> > > > > > 	cpus_read_lock();
> > > > > > 	mutex_lock(&slab_mutex);
> > > > > > 
> > > > > > 	rcu_set = s->flags & SLAB_TYPESAFE_BY_RCU;
> > > > > > 
> > > > > > 	s->refcount--;
> > > > > > 	if (s->refcount)
> > > > > > 		goto out_unlock;
> > > > > > 
> > > > > > 	err = shutdown_cache(s);
> > > > > > 	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
> > > > > > 	     __func__, s->name, (void *)_RET_IP_);
> > > > > > ...
> > > > > > 	cpus_read_unlock();
> > > > > > 	if (!err && !rcu_set)
> > > > > > 		kmem_cache_release(s);
> > > > > > }
> > > > > > <snip>
> > > > > > 
> > > > > > so we have SLAB_TYPESAFE_BY_RCU flag that defers freeing slab-pages
> > > > > > and a cache by a grace period. Similar flag can be added, like
> > > > > > SLAB_DESTROY_ONCE_FULLY_FREED, in this case a worker rearm itself
> > > > > > if there are still objects which should be freed.
> > > > > > 
> > > > > > Any thoughts here?
> > > > > 
> > > > > Wouldn't we also need some additional code to later check for all objects
> > > > > being freed to the slab, whether or not that code is  initiated from
> > > > > kmem_cache_destroy()?
> > > > >
> > > > Same away as SLAB_TYPESAFE_BY_RCU is handled from the kmem_cache_destroy() function.
> > > > It checks that flag and if it is true and extra worker is scheduled to perform a
> > > > deferred(instead of right away) destroy after rcu_barrier() finishes.
> > > 
> > > Like this?
> > > 
> > > 	SLAB_DESTROY_ONCE_FULLY_FREED
> > > 
> > > 	Instead of adding a new kmem_cache_destroy_rcu()
> > > 	or kmem_cache_destroy_wait() API member, instead add a
> > > 	SLAB_DESTROY_ONCE_FULLY_FREED flag that can be passed to the
> > > 	existing kmem_cache_destroy() function.  Use of this flag would
> > > 	suppress any warnings that would otherwise be issued if there
> > > 	was still slab memory yet to be freed, and it would also spawn
> > > 	workqueues (or timers or whatever) to do any needed cleanup work.
> > > 
> > >
> > The flag is passed as all others during creating a cache:
> > 
> >   slab = kmem_cache_create(name, size, ..., SLAB_DESTROY_ONCE_FULLY_FREED | OTHER_FLAGS, NULL);
> > 
> > the rest description is correct to me.
> 
> Good catch, fixed, thank you!
> 
And here we go with prototype(untested):

<snip>
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 7247e217e21b..700b8a909f8a 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -59,6 +59,7 @@ enum _slab_flag_bits {
 #ifdef CONFIG_SLAB_OBJ_EXT
 	_SLAB_NO_OBJ_EXT,
 #endif
+	_SLAB_DEFER_DESTROY,
 	_SLAB_FLAGS_LAST_BIT
 };
 
@@ -139,6 +140,7 @@ enum _slab_flag_bits {
  */
 /* Defer freeing slabs to RCU */
 #define SLAB_TYPESAFE_BY_RCU	__SLAB_FLAG_BIT(_SLAB_TYPESAFE_BY_RCU)
+#define SLAB_DEFER_DESTROY __SLAB_FLAG_BIT(_SLAB_DEFER_DESTROY)
 /* Trace allocations and frees */
 #define SLAB_TRACE		__SLAB_FLAG_BIT(_SLAB_TRACE)
 
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 1560a1546bb1..99458a0197b5 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -45,6 +45,11 @@ static void slab_caches_to_rcu_destroy_workfn(struct work_struct *work);
 static DECLARE_WORK(slab_caches_to_rcu_destroy_work,
 		    slab_caches_to_rcu_destroy_workfn);
 
+static LIST_HEAD(slab_caches_defer_destroy);
+static void slab_caches_defer_destroy_workfn(struct work_struct *work);
+static DECLARE_DELAYED_WORK(slab_caches_defer_destroy_work,
+	slab_caches_defer_destroy_workfn);
+
 /*
  * Set of flags that will prevent slab merging
  */
@@ -448,6 +453,31 @@ static void slab_caches_to_rcu_destroy_workfn(struct work_struct *work)
 	}
 }
 
+static void
+slab_caches_defer_destroy_workfn(struct work_struct *work)
+{
+	struct kmem_cache *s, *s2;
+
+	mutex_lock(&slab_mutex);
+	list_for_each_entry_safe(s, s2, &slab_caches_defer_destroy, list) {
+		if (__kmem_cache_empty(s)) {
+			/* free asan quarantined objects */
+			kasan_cache_shutdown(s);
+			(void) __kmem_cache_shutdown(s);
+
+			list_del(&s->list);
+
+			debugfs_slab_release(s);
+			kfence_shutdown_cache(s);
+			kmem_cache_release(s);
+		}
+	}
+	mutex_unlock(&slab_mutex);
+
+	if (!list_empty(&slab_caches_defer_destroy))
+		schedule_delayed_work(&slab_caches_defer_destroy_work, HZ);
+}
+
 static int shutdown_cache(struct kmem_cache *s)
 {
 	/* free asan quarantined objects */
@@ -493,6 +523,13 @@ void kmem_cache_destroy(struct kmem_cache *s)
 	if (s->refcount)
 		goto out_unlock;
 
+	/* Should a destroy process be deferred? */
+	if (s->flags & SLAB_DEFER_DESTROY) {
+		list_move_tail(&s->list, &slab_caches_defer_destroy);
+		schedule_delayed_work(&slab_caches_defer_destroy_work, HZ);
+		goto out_unlock;
+	}
+
 	err = shutdown_cache(s);
 	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
 	     __func__, s->name, (void *)_RET_IP_);
<snip>

Thanks!

--
Uladzislau Rezki
