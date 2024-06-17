Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F790B0A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 15:59:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=anNLahWR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2s2S63VNz3g2R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 23:59:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=anNLahWR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2s1m0kvhz3fq3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 23:59:06 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso45544965e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718632743; x=1719237543; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7cjNgaPzx0K8Q2oE0VGfsHosS8QVWGPVVkZ0XS7HEDg=;
        b=anNLahWRaUno/WJ7s5QgPts5q9rrteW28E9NsKMliH/CkVyptzNnmLkp7DUyMFwBUA
         fABjzaNhxrn5Uc/+OgW2Q19KICH3tBatwe/zkOMZhTY3UMkxPcUtYyR0AxFeSHnfcIm9
         IA+h/SVuEo3aIGj2a6+RwfdvcMpvyDv5+obBJODeM1MTN26n12Xl6vIGh/3v+9k3YVTt
         vFbBMOYszHrZvvPvKk9GxjfhVosqLk41lxbYHa/9S5q+COf70RGNZk+rPa+Obfu5eshl
         Zyaf+UzUj6GqOtI3CoabSLW5czX5FT4UZhfe/OB2rjOTY3AB+33SCQvkRP2n/OhcaNIE
         KM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632743; x=1719237543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cjNgaPzx0K8Q2oE0VGfsHosS8QVWGPVVkZ0XS7HEDg=;
        b=hBGfe02E2KdRvMEjcV2C476rsIN45LlGAWLHEAEBzCyiPvrYf/CW3nyiajiZb5O2iM
         SHPhG5oZHuxHv6Os2yBKFSSZucdOSP0P0ZEypz2j24KTyz5LtGIbsZBSFTmlVLaYQPqk
         2pWe09LEzywkF+TBVDqDbDZKHCaX5rhQT0PvYf46K+RHLFQ8WTo7AdmINCSekiJMUeOE
         x6SqEenWGcIrNdgWf1xTzWE/kIW4qF0/ahBOxqXIVLJ65CLCbSmnyZF4p13wzZ0dUly1
         yull0aB/jRRtAkGZetcmkC6tSpaQD4Mi0Hg7nXSBX273o1LTtlCyO8gjatHbricraHXi
         8jRA==
X-Forwarded-Encrypted: i=1; AJvYcCUo7xwGFg377F20m2I99hl+hIPNVRB0DgvPJzIxqyhbUuD6nwS5pO/m22JvdEyfhPB1nL43F5AtWi1zjLLl0WlZTsrlmQfKbDNvOGg+1A==
X-Gm-Message-State: AOJu0Yy0SUNy1rY84SR7FC/dx6bGJdpuRil3B/KbbWSk+o2z/BbjF3d7
	H0wNNNdon3uOcIKS5y4/7Gfn2essT6E3FLIfDoHg25Oy6EXCUFP+/o6lDU7d
X-Google-Smtp-Source: AGHT+IHJ0CsNfqdOT8NJ8/aEvcd12bZPn1WcmZOT2dLARsLKNTs8V+RbkzjWhHb4g1pZvloY+oCxkw==
X-Received: by 2002:a19:5e15:0:b0:51d:9f10:71b7 with SMTP id 2adb3069b0e04-52ca6e6812fmr7404820e87.28.1718632260306;
        Mon, 17 Jun 2024 06:51:00 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com. [90.233.216.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2887d56sm1239456e87.263.2024.06.17.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:59 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 17 Jun 2024 15:50:56 +0200
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnA_QFvuyABnD3ZA@pc636>
References: <ZmrfA1p2zSVIaYam@zx2c4.com>
 <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
 <Zmru7hhz8kPDPsyz@pc636>
 <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
 <Zmsuswo8OPIhY5KJ@pc636>
 <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan>
 <ZmybGZDbXkw7JTjc@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmybGZDbXkw7JTjc@zx2c4.com>
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

On Fri, Jun 14, 2024 at 09:33:45PM +0200, Jason A. Donenfeld wrote:
> On Fri, Jun 14, 2024 at 02:35:33PM +0200, Uladzislau Rezki wrote:
> > +	/* Should a destroy process be deferred? */
> > +	if (s->flags & SLAB_DEFER_DESTROY) {
> > +		list_move_tail(&s->list, &slab_caches_defer_destroy);
> > +		schedule_delayed_work(&slab_caches_defer_destroy_work, HZ);
> > +		goto out_unlock;
> > +	}
> 
> Wouldn't it be smoother to have the actual kmem_cache_free() function
> check to see if it's been marked for destruction and the refcount is
> zero, rather than polling every one second? I mentioned this approach
> in: https://lore.kernel.org/all/Zmo9-YGraiCj5-MI@zx2c4.com/ -
> 
>     I wonder if the right fix to this would be adding a `should_destroy`
>     boolean to kmem_cache, which kmem_cache_destroy() sets to true. And
>     then right after it checks `if (number_of_allocations == 0)
>     actually_destroy()`, and likewise on each kmem_cache_free(), it
>     could check `if (should_destroy && number_of_allocations == 0)
>     actually_destroy()`. 
> 
I do not find pooling as bad way we can go with. But your proposal
sounds reasonable to me also. We can combine both "prototypes" to
one and offer.

Can you post a prototype here?

Thanks!

--
Uladzislau Rezki
