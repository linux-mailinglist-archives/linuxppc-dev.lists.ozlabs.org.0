Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9280D90B7C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 19:20:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fQDA4cBs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2xVH0HDvz3gFb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 03:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fQDA4cBs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2xTY3jSdz3g6G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 03:20:00 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52c85a7f834so5914334e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718644797; x=1719249597; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZ8O3vkKnV5WMsPPzukATAgUwpYfoN3xcCe/8i65jUE=;
        b=fQDA4cBsNxII6P1cTHgzp6yteqBun6ktKn70VM6Vv2jkecWJY3VNAYxarpNC4b2grx
         xotYpACGCV0xUJDXWSC1yWQEdrcY8cRHR/clorlYm5CG6kS2DqYop+q/fOge5YnlyNxS
         AWsFMKo453jLIDoL6WdTf3Pi91dCKTFM4va1inEV/iAQsRHpiDn3ot+/E3GqiIt0eFqp
         Frq0Q66E5pozM9s85mKFAPiHJ+cI8H0hftYZ9LnXrvaE5yVkwia8eQZVjZiPanLykEqQ
         WA0dRB61+lKaBOTl/E5UZv8QQ02QScVjfZyDOexrMHFExYv8Er4L/EADciOOrlEGYVMm
         cP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718644797; x=1719249597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ8O3vkKnV5WMsPPzukATAgUwpYfoN3xcCe/8i65jUE=;
        b=ItEm0d+r60l6JklCGskOGpxDEoS34C7rVlmsT/PfKVwT77dIiPOw6H3C1BzKxfCiTJ
         //m53Tnki5Yj0gNVplNjiGOiq8OZ5mSVQBPC0Qn5r4a6g5jawFvR4f0tdAg0iL2rCxqa
         cCRc+q30slSiYst/ITngTjOJ9mYGcSFJCt46aP25TyJ4sC2q3guybywCunMRuCa4ouUC
         nQ1FFdzUtmLk3T7c2zpWuQvWHGOwldOVIVy44LIvyiQuGFi1O9oejPMcwKie/fSi3h6R
         /XnD5DBl4TH2kW9eQ64vO/Yp4enI40teTVH4m0kyFrKPGO7FK1vZVT5vKqCYa6BJ7Moi
         m48w==
X-Forwarded-Encrypted: i=1; AJvYcCUAKTRQOSQar23jgM4WRZ7XrcqsBMoRU0QwLif4modyJOuzEPvo+Eau4dsN6/jJ+X4FjPei6VRBI6WjQ4PCGAUymF6eTUotb4YG7SeXDQ==
X-Gm-Message-State: AOJu0YzVznObET6cHNW3GN1ZeOUKeYWVcowABySb1LK06YHh21xyF9C1
	iHZiGdAaCjmiVJfpDJP527V6RIqS7yEKzKidNJCXSagD4aLK0sjK
X-Google-Smtp-Source: AGHT+IF+kn6orlxXNu+KbBfK5TuJ9FRTaW/E7mKFLwWnfY9/g3N+9lA943ajPi6EK1Z9MmgGKAp4XQ==
X-Received: by 2002:a19:8c5a:0:b0:52c:88d6:891d with SMTP id 2adb3069b0e04-52ca6e5637emr6427245e87.9.1718644797253;
        Mon, 17 Jun 2024 10:19:57 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com. [90.233.216.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28722b0sm1286680e87.126.2024.06.17.10.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 10:19:56 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 17 Jun 2024 19:19:53 +0200
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnBwOf3faUJMbrfW@pc636>
References: <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan>
 <ZmybGZDbXkw7JTjc@zx2c4.com>
 <ZnA_QFvuyABnD3ZA@pc636>
 <ZnBOkZClsvAUa_5X@zx2c4.com>
 <ZnBkvYdbAWILs7qx@pc636>
 <CAHmME9r4q8erE3E-Xn61ZkSOdDDrgx6jhTAywx3ca4=G0z=wAA@mail.gmail.com>
 <ZnBnb1WkJFXs5L6z@pc636>
 <ZnBrCQy13jZV_hyZ@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnBrCQy13jZV_hyZ@zx2c4.com>
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

On Mon, Jun 17, 2024 at 06:57:45PM +0200, Jason A. Donenfeld wrote:
> On Mon, Jun 17, 2024 at 06:42:23PM +0200, Uladzislau Rezki wrote:
> > On Mon, Jun 17, 2024 at 06:33:23PM +0200, Jason A. Donenfeld wrote:
> > > On Mon, Jun 17, 2024 at 6:30 PM Uladzislau Rezki <urezki@gmail.com> wrote:
> > > > Here if an "err" is less then "0" means there are still objects
> > > > whereas "is_destroyed" is set to "true" which is not correlated
> > > > with a comment:
> > > >
> > > > "Destruction happens when no objects"
> > > 
> > > The comment is just poorly written. But the logic of the code is right.
> > > 
> > OK.
> > 
> > > >
> > > > >  out_unlock:
> > > > >       mutex_unlock(&slab_mutex);
> > > > >       cpus_read_unlock();
> > > > > diff --git a/mm/slub.c b/mm/slub.c
> > > > > index 1373ac365a46..7db8fe90a323 100644
> > > > > --- a/mm/slub.c
> > > > > +++ b/mm/slub.c
> > > > > @@ -4510,6 +4510,8 @@ void kmem_cache_free(struct kmem_cache *s, void *x)
> > > > >               return;
> > > > >       trace_kmem_cache_free(_RET_IP_, x, s);
> > > > >       slab_free(s, virt_to_slab(x), x, _RET_IP_);
> > > > > +     if (s->is_destroyed)
> > > > > +             kmem_cache_destroy(s);
> > >
> > Here i am not follow you. How do you see that a cache has been fully
> > freed? Or is it just super draft code?
> 
> kmem_cache_destroy() does this in shutdown_cache().
>
Right. In this scenario you invoke kmem_cache_destroy() over and over
until the last object gets freed. This potentially slowing the kmem_cache_free()
which is not OK, at least to me.

--
Uladzislau Rezki
