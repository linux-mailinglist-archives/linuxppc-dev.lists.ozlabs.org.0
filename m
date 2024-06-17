Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EDC90B7E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 19:24:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=wP5MM9xH;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oxlcLBi4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=jLHfQO+b;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QkLgpuJi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2xZT4M31z3g6N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 03:24:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=wP5MM9xH;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oxlcLBi4;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=jLHfQO+b;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QkLgpuJi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2xYl3Qc2z3g8Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 03:23:39 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C494F1F7B0;
	Mon, 17 Jun 2024 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1718645017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ngyPU5qU7Xw4mfIB382fEUZqXXHMDeQs5ieSFvFPdnk=;
	b=wP5MM9xHtacwGcohraxB8SD5hrzkQNHp3WVnETtG4pel2o8fWN66BO8VFz+1VDri9pcARY
	XDiPADxcklwj5h9x8Ay2QdjJmJ4lDo4Y1cKxTxmp3EwfNoxizPv1K2aMCgVmvbWx/H9kyo
	22rtdJjpJMpXQTmpj1hDSRVVTB4aSGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1718645017;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ngyPU5qU7Xw4mfIB382fEUZqXXHMDeQs5ieSFvFPdnk=;
	b=oxlcLBi4Jt2TLTlK2lYU8J3k4FoDQLFdkIHffJCubuJvR37LM0ay/IGsK+kulzcnYw4DXp
	xIK3sS77anBX1jDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=jLHfQO+b;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=QkLgpuJi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1718645016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ngyPU5qU7Xw4mfIB382fEUZqXXHMDeQs5ieSFvFPdnk=;
	b=jLHfQO+bPfjfS3Wb5CieOLdjFeoOE/w8WiB9W+IZPQRtXRoFT1cLC0BhLE7YzdjhKd8wxj
	jdU2SEezkpx21QNDrKZRyVVZCJdpDLRUZ41kKscG6qzMBYZm0+sPPfviIrnhGm6wxM7wRH
	/DdrSSkB1hJHM95M8qpn/99l71xSaUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1718645016;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ngyPU5qU7Xw4mfIB382fEUZqXXHMDeQs5ieSFvFPdnk=;
	b=QkLgpuJiJamFdGpp8hWfmxuyLi35OWOnd+aXMI++MEqXxrDzwnXnb8TcuQVfI3SiN40opt
	inft1LjyELN6ikAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9034013AAA;
	Mon, 17 Jun 2024 17:23:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tStoIhhxcGbBDgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 17 Jun 2024 17:23:36 +0000
Message-ID: <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
Date: Mon, 17 Jun 2024 19:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Content-Language: en-US
To: paulmck@kernel.org
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com> <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com> <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
 <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[zx2c4.com,gmail.com,kernel.org,inria.fr,vger.kernel.org,lists.linux.dev,efficios.com,lists.ozlabs.org,linux.ibm.com,csgroup.eu,lists.zx2c4.com,suse.de,netapp.com,oracle.com,talpey.com,netfilter.org,googlegroups.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	R_RATELIMIT(0.00)[to_ip_from(RLujeud1qp5x6qhm7ow61zc6bu)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C494F1F7B0
X-Spam-Flag: NO
X-Spam-Score: -4.50
X-Spam-Level: 
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, kasan-dev <kasan-dev@googlegroups.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, "Uladzislau Rezki \(Sony\)" <urezki@gmail.com>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/17/24 6:12 PM, Paul E. McKenney wrote:
> On Mon, Jun 17, 2024 at 05:10:50PM +0200, Vlastimil Babka wrote:
>> On 6/13/24 2:22 PM, Jason A. Donenfeld wrote:
>> > On Wed, Jun 12, 2024 at 08:38:02PM -0700, Paul E. McKenney wrote:
>> >> o	Make the current kmem_cache_destroy() asynchronously wait for
>> >> 	all memory to be returned, then complete the destruction.
>> >> 	(This gets rid of a valuable debugging technique because
>> >> 	in normal use, it is a bug to attempt to destroy a kmem_cache
>> >> 	that has objects still allocated.)
>> 
>> This seems like the best option to me. As Jason already said, the debugging
>> technique is not affected significantly, if the warning just occurs
>> asynchronously later. The module can be already unloaded at that point, as
>> the leak is never checked programatically anyway to control further
>> execution, it's just a splat in dmesg.
> 
> Works for me!

Great. So this is how a prototype could look like, hopefully? The kunit test
does generate the splat for me, which should be because the rcu_barrier() in
the implementation (marked to be replaced with the real thing) is really
insufficient. Note the test itself passes as this kind of error isn't wired
up properly.

Another thing to resolve is the marked comment about kasan_shutdown() with
potential kfree_rcu()'s in flight.

Also you need CONFIG_SLUB_DEBUG enabled otherwise node_nr_slabs() is a no-op
and it might fail to notice the pending slabs. This will need to change.

----8<----
diff --git a/lib/slub_kunit.c b/lib/slub_kunit.c
index e6667a28c014..e3e4d0ca40b7 100644
--- a/lib/slub_kunit.c
+++ b/lib/slub_kunit.c
@@ -5,6 +5,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/rcupdate.h>
 #include "../mm/slab.h"
 
 static struct kunit_resource resource;
@@ -157,6 +158,26 @@ static void test_kmalloc_redzone_access(struct kunit *test)
 	kmem_cache_destroy(s);
 }
 
+struct test_kfree_rcu_struct {
+	struct rcu_head rcu;
+};
+
+static void test_kfree_rcu(struct kunit *test)
+{
+	struct kmem_cache *s = test_kmem_cache_create("TestSlub_kfree_rcu",
+				sizeof(struct test_kfree_rcu_struct),
+				SLAB_NO_MERGE);
+	struct test_kfree_rcu_struct *p = kmem_cache_alloc(s, GFP_KERNEL);
+
+	kasan_disable_current();
+
+	KUNIT_EXPECT_EQ(test, 0, slab_errors);
+
+	kasan_enable_current();
+	kfree_rcu(p, rcu);
+	kmem_cache_destroy(s);
+}
+
 static int test_init(struct kunit *test)
 {
 	slab_errors = 0;
@@ -177,6 +198,7 @@ static struct kunit_case test_cases[] = {
 
 	KUNIT_CASE(test_clobber_redzone_free),
 	KUNIT_CASE(test_kmalloc_redzone_access),
+	KUNIT_CASE(test_kfree_rcu),
 	{}
 };
 
diff --git a/mm/slab.h b/mm/slab.h
index b16e63191578..a0295600af92 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -277,6 +277,8 @@ struct kmem_cache {
 	unsigned int red_left_pad;	/* Left redzone padding size */
 	const char *name;		/* Name (only for display!) */
 	struct list_head list;		/* List of slab caches */
+	struct work_struct async_destroy_work;
+
 #ifdef CONFIG_SYSFS
 	struct kobject kobj;		/* For sysfs */
 #endif
@@ -474,7 +476,7 @@ static inline bool is_kmalloc_cache(struct kmem_cache *s)
 			      SLAB_NO_USER_FLAGS)
 
 bool __kmem_cache_empty(struct kmem_cache *);
-int __kmem_cache_shutdown(struct kmem_cache *);
+int __kmem_cache_shutdown(struct kmem_cache *, bool);
 void __kmem_cache_release(struct kmem_cache *);
 int __kmem_cache_shrink(struct kmem_cache *);
 void slab_kmem_cache_release(struct kmem_cache *);
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 5b1f996bed06..c5c356d0235d 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -44,6 +44,8 @@ static LIST_HEAD(slab_caches_to_rcu_destroy);
 static void slab_caches_to_rcu_destroy_workfn(struct work_struct *work);
 static DECLARE_WORK(slab_caches_to_rcu_destroy_work,
 		    slab_caches_to_rcu_destroy_workfn);
+static void kmem_cache_kfree_rcu_destroy_workfn(struct work_struct *work);
+
 
 /*
  * Set of flags that will prevent slab merging
@@ -234,6 +236,7 @@ static struct kmem_cache *create_cache(const char *name,
 
 	s->refcount = 1;
 	list_add(&s->list, &slab_caches);
+	INIT_WORK(&s->async_destroy_work, kmem_cache_kfree_rcu_destroy_workfn);
 	return s;
 
 out_free_cache:
@@ -449,12 +452,16 @@ static void slab_caches_to_rcu_destroy_workfn(struct work_struct *work)
 	}
 }
 
-static int shutdown_cache(struct kmem_cache *s)
+static int shutdown_cache(struct kmem_cache *s, bool warn_inuse)
 {
 	/* free asan quarantined objects */
+	/*
+	 * XXX: is it ok to call this multiple times? and what happens with a
+	 * kfree_rcu() in flight that finishes after or in parallel with this?
+	 */
 	kasan_cache_shutdown(s);
 
-	if (__kmem_cache_shutdown(s) != 0)
+	if (__kmem_cache_shutdown(s, warn_inuse) != 0)
 		return -EBUSY;
 
 	list_del(&s->list);
@@ -477,6 +484,32 @@ void slab_kmem_cache_release(struct kmem_cache *s)
 	kmem_cache_free(kmem_cache, s);
 }
 
+static void kmem_cache_kfree_rcu_destroy_workfn(struct work_struct *work)
+{
+	struct kmem_cache *s;
+	int err = -EBUSY;
+	bool rcu_set;
+
+	s = container_of(work, struct kmem_cache, async_destroy_work);
+
+	// XXX use the real kmem_cache_free_barrier() or similar thing here
+	rcu_barrier();
+
+	cpus_read_lock();
+	mutex_lock(&slab_mutex);
+
+	rcu_set = s->flags & SLAB_TYPESAFE_BY_RCU;
+
+	err = shutdown_cache(s, true);
+	WARN(err, "kmem_cache_destroy %s: Slab cache still has objects",
+	     s->name);
+
+	mutex_unlock(&slab_mutex);
+	cpus_read_unlock();
+	if (!err && !rcu_set)
+		kmem_cache_release(s);
+}
+
 void kmem_cache_destroy(struct kmem_cache *s)
 {
 	int err = -EBUSY;
@@ -494,9 +527,9 @@ void kmem_cache_destroy(struct kmem_cache *s)
 	if (s->refcount)
 		goto out_unlock;
 
-	err = shutdown_cache(s);
-	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
-	     __func__, s->name, (void *)_RET_IP_);
+	err = shutdown_cache(s, false);
+	if (err)
+		schedule_work(&s->async_destroy_work);
 out_unlock:
 	mutex_unlock(&slab_mutex);
 	cpus_read_unlock();
diff --git a/mm/slub.c b/mm/slub.c
index 1617d8014ecd..4d435b3d2b5f 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5342,7 +5342,8 @@ static void list_slab_objects(struct kmem_cache *s, struct slab *slab,
  * This is called from __kmem_cache_shutdown(). We must take list_lock
  * because sysfs file might still access partial list after the shutdowning.
  */
-static void free_partial(struct kmem_cache *s, struct kmem_cache_node *n)
+static void free_partial(struct kmem_cache *s, struct kmem_cache_node *n,
+			 bool warn_inuse)
 {
 	LIST_HEAD(discard);
 	struct slab *slab, *h;
@@ -5353,7 +5354,7 @@ static void free_partial(struct kmem_cache *s, struct kmem_cache_node *n)
 		if (!slab->inuse) {
 			remove_partial(n, slab);
 			list_add(&slab->slab_list, &discard);
-		} else {
+		} else if (warn_inuse) {
 			list_slab_objects(s, slab,
 			  "Objects remaining in %s on __kmem_cache_shutdown()");
 		}
@@ -5378,7 +5379,7 @@ bool __kmem_cache_empty(struct kmem_cache *s)
 /*
  * Release all resources used by a slab cache.
  */
-int __kmem_cache_shutdown(struct kmem_cache *s)
+int __kmem_cache_shutdown(struct kmem_cache *s, bool warn_inuse)
 {
 	int node;
 	struct kmem_cache_node *n;
@@ -5386,7 +5387,7 @@ int __kmem_cache_shutdown(struct kmem_cache *s)
 	flush_all_cpus_locked(s);
 	/* Attempt to free all objects */
 	for_each_kmem_cache_node(s, node, n) {
-		free_partial(s, n);
+		free_partial(s, n, warn_inuse);
 		if (n->nr_partial || node_nr_slabs(n))
 			return 1;
 	}

