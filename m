Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FECB90B6C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 18:43:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f+8bDuS2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2wfz2Zqrz3gD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 02:43:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f+8bDuS2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2wfG32Fzz3dBk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 02:42:29 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52c7fbad011so5379555e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718642547; x=1719247347; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nVbXAXBamX9byggpH5pf9RLnfjUsWFyotRoWWJmUCyg=;
        b=f+8bDuS2oLx8JpYVK4o7pqqxYxyThNUtT6RLih/jorq0hwkuUohXX3oHeAaRabeu8c
         /0Ewm3Ao8ndHWh6Y5oY+abMGkDrRWin5eq7xnhFJKlGp3i3+0SkKxppra0b1qFN8J0nu
         wqiTepfToudsxMZ38az4PyOHPv3Zaj3YvxFBtHjejUQvdKgDkuIzE1lMSyBFMNLKky5e
         JJQMRXlXMFAhkJ3k2HnXHkWP8OnFt1j4oSewJMrG+pGyTucTXocphSpiZ9dGj5OvofAH
         /hK1Sz99XVrJ+DcSiNKZUPRUVLsz7gkOeAk6Gak8WtdJAqCqyWCBbmqBH6a48FZQXWeF
         inHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718642547; x=1719247347;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVbXAXBamX9byggpH5pf9RLnfjUsWFyotRoWWJmUCyg=;
        b=Y1Iwgadt6H7IQr/HP/VU2tuYNokliZsYF7HO65hGClKmxbUdvKv1iY79XbGew4sUuV
         +ZQZKB+G8p9Ta+sZQ7Rw4OhgRIoM25VoFX4hcYgRcOSpFpXu3ikQqcxSrxk80AO21uJg
         bzRD0FybPY19UeHpZPvC4layglol4EGsgi7E7na/YvNt9vc/+aeIYoo4/MDyvMJhpIx+
         2ffPX8LyohWV87ZHCVMWWNv9c4NvNylFv8Q7eQ2p4zYg4TH0SdHPxq1klxRKqzCoqMxf
         58r4Siw/i9ngjhfNdB31rN8OAr+fWTu1/gQZZ0ayBho5xEaqYEOWSL6qniqL+YHGyb3y
         ww4g==
X-Forwarded-Encrypted: i=1; AJvYcCXcFmTE1JCKZ8bhoghnniwEqe/4OgxZyrwwHh100KckfRTJ8wd7T1Z2sB5ehgTRsv1lWgHXA1ixeqmA+hyuv2GRUqF2lbIEhqza3N4M4Q==
X-Gm-Message-State: AOJu0Yxuj5ohDQ/RzLDv/aJtLIxXI9iQqyxb9X0glD0K0IizTHLVStKy
	Ru+BqO3h2PTLhXzAHDgHN9fYlx6jj7oj7f4LmedvWtRgWd/GpuQB
X-Google-Smtp-Source: AGHT+IEbAoHoo+cqq7GZF8p0qgsFLjS7D8dpwx0oAM5cf5weHrkVdSXGtAH7Cuol28FV9Mqr6MxQYg==
X-Received: by 2002:a19:2d48:0:b0:52c:8fba:e2a1 with SMTP id 2adb3069b0e04-52ca6e657c4mr6499193e87.18.1718642546982;
        Mon, 17 Jun 2024 09:42:26 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com. [90.233.216.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28722e2sm1265845e87.136.2024.06.17.09.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:42:26 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 17 Jun 2024 18:42:23 +0200
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnBnb1WkJFXs5L6z@pc636>
References: <Zmsuswo8OPIhY5KJ@pc636>
 <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan>
 <ZmybGZDbXkw7JTjc@zx2c4.com>
 <ZnA_QFvuyABnD3ZA@pc636>
 <ZnBOkZClsvAUa_5X@zx2c4.com>
 <ZnBkvYdbAWILs7qx@pc636>
 <CAHmME9r4q8erE3E-Xn61ZkSOdDDrgx6jhTAywx3ca4=G0z=wAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9r4q8erE3E-Xn61ZkSOdDDrgx6jhTAywx3ca4=G0z=wAA@mail.gmail.com>
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

On Mon, Jun 17, 2024 at 06:33:23PM +0200, Jason A. Donenfeld wrote:
> On Mon, Jun 17, 2024 at 6:30 PM Uladzislau Rezki <urezki@gmail.com> wrote:
> > Here if an "err" is less then "0" means there are still objects
> > whereas "is_destroyed" is set to "true" which is not correlated
> > with a comment:
> >
> > "Destruction happens when no objects"
> 
> The comment is just poorly written. But the logic of the code is right.
> 
OK.

> >
> > >  out_unlock:
> > >       mutex_unlock(&slab_mutex);
> > >       cpus_read_unlock();
> > > diff --git a/mm/slub.c b/mm/slub.c
> > > index 1373ac365a46..7db8fe90a323 100644
> > > --- a/mm/slub.c
> > > +++ b/mm/slub.c
> > > @@ -4510,6 +4510,8 @@ void kmem_cache_free(struct kmem_cache *s, void *x)
> > >               return;
> > >       trace_kmem_cache_free(_RET_IP_, x, s);
> > >       slab_free(s, virt_to_slab(x), x, _RET_IP_);
> > > +     if (s->is_destroyed)
> > > +             kmem_cache_destroy(s);
>
Here i am not follow you. How do you see that a cache has been fully
freed? Or is it just super draft code?

Thanks!

--
Uladzislau Rezki
