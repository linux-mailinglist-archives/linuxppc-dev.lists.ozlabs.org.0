Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D546A90C559
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 11:31:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fy0nqvoG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3M2t4gQpz3cYJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 19:31:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fy0nqvoG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3M296W87z2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 19:31:12 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso5211852e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 02:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718703065; x=1719307865; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gd0sb+wrja9GmMiLQT0DMWUWixEF5baH+EtRGLOjO0I=;
        b=Fy0nqvoGGpMFniuMnWAa2I8YrqD7pIOnIUqCRJbM4X0GO7m6H8mTqG81Cs2kcuOJkl
         bNmymClY7m8LTjb9mXSRkIBiRVWzTcs4nfK6my3h6IGrw2hmCqDqiFaR9EYZsKdE2OW3
         ZyyM1SJ5WBaqWIXZ13M34Rwjy4jg96NctfUjB8066rJENI8W2aerj54yiipA/v61TRKu
         OhGl3B8SZypdreM5fSriOijRlNhE/H+dNU86F4bqcZTYLHA0UGQC4rR9Ar/K+8il2FYB
         Bwko1a8AHoQ7tysLGpl7VX5JckHBUBKojLqHrEjDntMbY34+qu6u2VKk/fKIsFWvX1VX
         MDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718703065; x=1719307865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gd0sb+wrja9GmMiLQT0DMWUWixEF5baH+EtRGLOjO0I=;
        b=jfN0SYsMaaWZtZFzHSI/bfcBr3U/0ODcpw0JRKtWcNYQzsCp7E54TET6hVNEOsOBTP
         7eDbNwgvCF7E9O5Rk+Kegu2zEUPpbwK2bn+nTuvDR2mxCBHGjy6AAm51hACz4vLQXr+Y
         z03U2FlBdyEuY44F5UutSOCTtWbLXu3lqfaOOe1k/ZGSzpcS6ZwKTQ0YoQgtwwF8m2lV
         c/OvC+qoHJP+82Vy448dtE+ZP5m7EQcYnuJwEQuB1w7yJS3yRDjh0HgUnk14VvNaP/B6
         6sLSM3m5F/LokHzVwt+0OJZCGOM2NnDDj++6Ly3hTw0SJkknADgx4EUJ77ZS15IT4Wkw
         XzYg==
X-Forwarded-Encrypted: i=1; AJvYcCUVRXsznZrBQLIzI9vM24YCIc7ws2hOXVlz70KLV51VC1XZftvieGo/H0ITV2jjdzkqjzRieDO9w8eVzsfAKcRZQYZ/WFCbxbftcxpRvQ==
X-Gm-Message-State: AOJu0YzFagvcWGiSMwW8AFwQF/itNMexSUgKyQnPw6GWVw0JivM0xDVk
	s4Zv7j7dC5PX4XnNPFLLRY9HpD5DeyHX8vIjVtN8wLAewr/OnJXR
X-Google-Smtp-Source: AGHT+IEirA7ZfcWMvk+A5QKOFGiN5irQ5RBB6sZAAJ03RtbeHM09p7vDGOoZf2DqBzAK5fdSSuz/pQ==
X-Received: by 2002:a19:9141:0:b0:52c:81d5:cf96 with SMTP id 2adb3069b0e04-52ca6e659demr6468892e87.28.1718703065080;
        Tue, 18 Jun 2024 02:31:05 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com. [90.233.216.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825b38sm1445362e87.24.2024.06.18.02.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 02:31:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 18 Jun 2024 11:31:00 +0200
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnFT1Czb8oRb0SE7@pc636>
References: <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com>
 <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com>
 <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
 <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
 <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
 <ZnCDgdg1EH6V7w5d@pc636>
 <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, kasan-dev <kasan-dev@googlegroups.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, paulmck@kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Uladzislau Rezki <urezki@gmail.com>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 6/17/24 8:42 PM, Uladzislau Rezki wrote:
> >> +
> >> +	s = container_of(work, struct kmem_cache, async_destroy_work);
> >> +
> >> +	// XXX use the real kmem_cache_free_barrier() or similar thing here
> > It implies that we need to introduce kfree_rcu_barrier(), a new API, which i
> > wanted to avoid initially.
> 
> I wanted to avoid new API or flags for kfree_rcu() users and this would
> be achieved. The barrier is used internally so I don't consider that an
> API to avoid. How difficult is the implementation is another question,
> depending on how the current batching works. Once (if) we have sheaves
> proven to work and move kfree_rcu() fully into SLUB, the barrier might
> also look different and hopefully easier. So maybe it's not worth to
> invest too much into that barrier and just go for the potentially
> longer, but easier to implement?
> 
Right. I agree here. If the cache is not empty, OK, we just defer the
work, even we can use a big 21 seconds delay, after that we just "warn"
if it is still not empty and leave it as it is, i.e. emit a warning and
we are done.

Destroying the cache is not something that must happen right away. 

> > Since you do it asynchronous can we just repeat
> > and wait until it a cache is furry freed?
> 
> The problem is we want to detect the cases when it's not fully freed
> because there was an actual read. So at some point we'd need to stop the
> repeats because we know there can no longer be any kfree_rcu()'s in
> flight since the kmem_cache_destroy() was called.
> 
Agree. As noted above, we can go with 21 seconds(as an example) interval
and just perform destroy(without repeating).

--
Uladzislau Rezki
