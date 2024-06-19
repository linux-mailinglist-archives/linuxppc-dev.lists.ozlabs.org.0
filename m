Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1CB90E75F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 11:52:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WSwI3FCw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3zSd0NPRz3cgM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 19:52:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WSwI3FCw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3zRt3HXmz3cVf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 19:52:08 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so72314801fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 02:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718790723; x=1719395523; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TY+TzI4NVOZe+bVmXFpZLf0ZfiG9DoMpTrEztVoxeCc=;
        b=WSwI3FCwNrg0urTcLGp9TsVuOBc+F0mbOcJE3e6iQUHj+A0N4vd6rBaNUxPrPUzFcG
         hxUADDl7DUZzMjqwUEK/nsf2mfFXDm+TBQvWapnS2y4PfMBK5UZO/mlcs1Q2LUOphfBN
         Ocn1FwfsgvwcmEISVq8Io4L4ZTsjvDsi+LLdWoKUSuIbNZUZ0+4kWrUAmYwguS/m1QGR
         NtCHfMF/+FsnYblL+8a0x6t/byIWJYS+fUJIqhkPCtHkLHFulfR273KMksgqLRgwS1XB
         JfXw8JAvpdOdNDKwBbuVVIbAaJYeOUD/QpRE/+Jnoz2k51OyA2/7fRXYSi4yEGXj2YIO
         FVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718790723; x=1719395523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY+TzI4NVOZe+bVmXFpZLf0ZfiG9DoMpTrEztVoxeCc=;
        b=rS29ZsUJ8eGkWvxTNgR2kbS42OA2JqHkLvO3m5Qm0LAmzgAHm+lIAI6ZQcVNBOUi+i
         s9TJs/SMjpFcgwqTfVW6BGCnAEffu2kakJB7luQ64mpX8c2R+zlJ+afTmrOfjHSHGx0k
         AXj+gZeS6HyNv0hjwEsSQcWaxHnQs8MpfN95Cq1L4PpkNzkX6lo7hZxV2KgYMBOS+T3U
         yBtJrLSBeCbDbDBuI9ylq56KGCrDCYnxCe3ylq9lQVJ4Bb+MYWx6vSLolTWH+Z71B/fU
         y1Ts3wBCd2lasxnHhecRO3mXVZG3trYjVlzm+pI9Isx7zOOR7XNSpwdvCpHDC+qrP0yd
         AZcg==
X-Forwarded-Encrypted: i=1; AJvYcCVi6JVXAQBw+mLFZhy5rXI+4sgarjdng0iGVB9LFG/PfEkaNc2ZvGESATazZQUtwGZhd8xXefNhyZTBveD7Jt+L0G+Lvn5T730MD8KONw==
X-Gm-Message-State: AOJu0YzEZ6cky6Pp0RQHwxQM6fiQf5qep5Ne3JF5xZMV8OCuXjCLBRms
	UZ2GFZlM8OOg6ZGzDFPPuRRvTetl/8JvgOErHj4o6hxR8kcykr1r
X-Google-Smtp-Source: AGHT+IH2q3ZanpQKJz2uH0N6Dyx/XhlIdcK364i+Te6PyIoIECi/nqcQmDGItl1tQkSP50785isBNw==
X-Received: by 2002:a2e:9cc6:0:b0:2eb:e365:f191 with SMTP id 38308e7fff4ca-2ec3ce93f99mr14054151fa.15.1718790722749;
        Wed, 19 Jun 2024 02:52:02 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com. [90.233.216.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c06068sm19506721fa.35.2024.06.19.02.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:52:02 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 19 Jun 2024 11:51:58 +0200
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnKqPqlPD3Rl04DZ@pc636>
References: <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com>
 <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
 <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
 <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
 <ZnCDgdg1EH6V7w5d@pc636>
 <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
 <ZnFT1Czb8oRb0SE7@pc636>
 <5c8b2883-962f-431f-b2d3-3632755de3b0@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c8b2883-962f-431f-b2d3-3632755de3b0@paulmck-laptop>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, kasan-dev <kasan-dev@googlegroups.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Uladzislau Rezki <urezki@gmail.com>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 18, 2024 at 09:48:49AM -0700, Paul E. McKenney wrote:
> On Tue, Jun 18, 2024 at 11:31:00AM +0200, Uladzislau Rezki wrote:
> > > On 6/17/24 8:42 PM, Uladzislau Rezki wrote:
> > > >> +
> > > >> +	s = container_of(work, struct kmem_cache, async_destroy_work);
> > > >> +
> > > >> +	// XXX use the real kmem_cache_free_barrier() or similar thing here
> > > > It implies that we need to introduce kfree_rcu_barrier(), a new API, which i
> > > > wanted to avoid initially.
> > > 
> > > I wanted to avoid new API or flags for kfree_rcu() users and this would
> > > be achieved. The barrier is used internally so I don't consider that an
> > > API to avoid. How difficult is the implementation is another question,
> > > depending on how the current batching works. Once (if) we have sheaves
> > > proven to work and move kfree_rcu() fully into SLUB, the barrier might
> > > also look different and hopefully easier. So maybe it's not worth to
> > > invest too much into that barrier and just go for the potentially
> > > longer, but easier to implement?
> > > 
> > Right. I agree here. If the cache is not empty, OK, we just defer the
> > work, even we can use a big 21 seconds delay, after that we just "warn"
> > if it is still not empty and leave it as it is, i.e. emit a warning and
> > we are done.
> > 
> > Destroying the cache is not something that must happen right away. 
> 
> OK, I have to ask...
> 
> Suppose that the cache is created and destroyed by a module and
> init/cleanup time, respectively.  Suppose that this module is rmmod'ed
> then very quickly insmod'ed.
> 
> Do we need to fail the insmod if the kmem_cache has not yet been fully
> cleaned up?  If not, do we have two versions of the same kmem_cache in
> /proc during the overlap time?
> 
No fail :) If same cache is created several times, its s->refcount gets
increased, so, it does not create two entries in the "slabinfo". But i
agree that your point is good! We need to be carefully with removing and
simultaneous creating.

From the first glance, there is a refcounter and a global "slab_mutex"
which is used to protect a critical section. Destroying is almost fully
protected(as noted above, by a global mutex) with one exception, it is:

static void kmem_cache_release(struct kmem_cache *s)
{
	if (slab_state >= FULL) {
		sysfs_slab_unlink(s);
		sysfs_slab_release(s);
	} else {
		slab_kmem_cache_release(s);
	}
}

this one can race, IMO.

--
Uladzislau Rezki
