Return-Path: <linuxppc-dev+bounces-14118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA85C515EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 10:34:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5ysV4sHFz2yqP;
	Wed, 12 Nov 2025 20:34:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762940062;
	cv=none; b=bD3rz10cq+47/9INbgEdbWYQFSrCoJkqdZpb/UOx4CEY1lTUpa69RkDEkfeO95UvQYZHUFWKQhFblUn5hlFgFIT2GpQWtVa0Gw91Qq7P4opTIiVFgemouGRjYjBz6roq00Zc2dKDgVuRdaTXfj502jgr8VCek7tzsL6y1OR+dytRb75xrj+e64qKuC5mQ0fkUfozL2zY1ZZFHNwoYc5mqWs8Ps+vqOAt3j4THfL6QaaQcB49kvN292Q/j2xjcIXjODMoup/St340H7ZJuXYEHrK2Q31I9lw6S/rl77LzqxaJMxc2b4V9eFxXy/6NNVr3fKGQT6HOhOGEPfyjyPBUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762940062; c=relaxed/relaxed;
	bh=Y+ph3n81MNofPspKtp5iN2RLnNXwZpO7ZQr4gG1y+Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJnqNP4JYYMqa4U/aBB3XcEvqBf6n3TbrwiC7U2kEW7RsXcEPpMM7mI8jDYc6aIHmpWZrcO1wbwccvbRyQBjxFaWhxYbQySUAWTnB61LxVw0mknSJ9lEC6oMl7r0ThaR9qqM45VI4dcaxHwyWiU7ivQpDWWcZRCbywYvuFMFGweb8Mi8SV1Rv8mo/baDNx/usfvAR2AB6GB6acHgz2jVhNj/cJrspPdv8qWKESaOtpqDcLdfDrhqx6EsFJJtqk2HzEtHJPckxSKXUNI5b04xQgMgJcC0pGCERC5UGW6bIP9PJo9LWTSOdz2UK7LIobNUgwcpyZuEZgl/JbJe415vaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nFlgUQhJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=fuchsfl@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nFlgUQhJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=fuchsfl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5ysS64jjz2yFT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 20:34:19 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so853314a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 01:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762940051; x=1763544851; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+ph3n81MNofPspKtp5iN2RLnNXwZpO7ZQr4gG1y+Xg=;
        b=nFlgUQhJGSL077gKE2Z2xF9ImN6h9bB5KkrzxqjUX3yZIvxIUp9J5LhC5SgZEtt3zr
         AIgSsPRMxh3jw2+BwE62Rf8Lbih/vRsNIBEFv/+9furHNbFgq7lj+Gcs9ubZQ6NrOShz
         DUIeFvvSkxauhK1SdIS28d30CL+CVaJEYEcdcjyEH2rXNX2Kb7iWz56CG9yfWOJEshsC
         0m3AS6FcBw31Qa4tZw/l7uPG92R971Rl0UP7xKX8Cm0h/0NVnO8lwyq8zxku8/UP2tfW
         ERNlN5OUpT7PX9oFqUgHpDEoiYmoaAG8EoIGwFv2OCMrzdC1/rLEMPXOXoG/LEuxcYDp
         qccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762940051; x=1763544851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+ph3n81MNofPspKtp5iN2RLnNXwZpO7ZQr4gG1y+Xg=;
        b=CWZMzErujJ2kK5C6jImG3AsFQEugLHRcJapdGWABEO5gb5AROwgqQWo/ZHG80X1DJV
         NuM4KqzZmGBsbiLY7vQ4TNAs3582f3xXMC2b7BDHs+paHWYweSbLWPqULl8p3mI+xAP3
         u3tSH4ZwP1XRnVKExp3BXJKT1P2hpe1GfoUDu6eZpA3dIMjY708A3kHVxaQ2p9brMqwD
         0zZ+JxxYuT8xR2MGfUQeTfka2c+wAWje75rbUEBDK62pPaXmqTf8cHEfr6GTCgU+s8cF
         XtoZaOozfj1OLCsMwOyLMy4lf23Yo1lerXTsMVNO2C8/l/S6O6up4LuccQwATYhZj2Bj
         lxnA==
X-Forwarded-Encrypted: i=1; AJvYcCViHQiJB7rartxQJdcp12tYwx+slK7tgR4my1vWRNh0xtEqLi1fQ4DOfpHwiwNu4cg1i3ZJZOHWe4I2+uI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDOhlKnonZWAFPCmMk9iT6/VJM7W4Qz2gC+mq8V3tzgj6JCWPW
	LcMrvLWdiQ2QtcUiVFn6jP8SGTIyKGLoXOCfFXAbjNCTFUsW0io9d4A=
X-Gm-Gg: ASbGncsHjl5/gzBKxO/IO5ifrd7fbMXYXnikAcNIjz5+SpNgwgDNNI6Hc3qTHECDtDa
	BLBzry3Agq8Od58WhSXRdXQmz8WZoyjwAF1RNWgmBGbwenFExxGob09gtBB7ePFD+izmyZVhvAy
	4LS7YhEOTDgDD5MuIT1TNXp2j7j5cD8qwPTr++raJvkonAoxLVk/oTNLjR4RvmagGG+3LO9sgHU
	A7VrKSOfyXhvcUmWoyrsFn0m0HnR3ciATSVCxdq7OHukfP9QZWlnVTsAzPnp2yPw522P8/k+16i
	6jpiQ5p1yN81Gr4zvyjkJ3aT8xEturx8i8dhCmdWjdpFLLq8Y8byYLmGSzoop96Yjy4Q6C5ZARp
	pgv+BobdGYVuX1UfrY7h0z+1nWtZz9iJGO61R8d3Vra9qGttBsaTw7hzGiAD+sccCGtXGnoPGro
	5/RWbanXXTvGcVE5hWDBmvGB7DYSSgtku/K62jFhEeMkQO94d8XW1a
X-Google-Smtp-Source: AGHT+IEbaOVdolpRZRtQY4C4p55uxdFbLWKLEJUaTQ2W0vBS9wly5TtrzUUAVAA7VNF0NNYTPywc0g==
X-Received: by 2002:a05:6402:3046:10b0:640:b814:bb81 with SMTP id 4fb4d7f45d1cf-6431a55e501mr1856940a12.32.1762940051127;
        Wed, 12 Nov 2025 01:34:11 -0800 (PST)
Received: from lithos ([2a02:810d:4a94:b300:ec52:7cf5:e31:cdb7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64165b2aa03sm9869160a12.6.2025.11.12.01.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 01:34:10 -0800 (PST)
Date: Wed, 12 Nov 2025 10:34:01 +0100
From: Florian Fuchs <fuchsfl@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ps3_gelic_net: handle skb allocation failures
Message-ID: <aRRUiYIrOcpSiakH@lithos>
References: <20251110114523.3099559-1-fuchsfl@gmail.com>
 <20251111180451.0ef1dc9c@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111180451.0ef1dc9c@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jakub,

On 11 Nov 18:04, Jakub Kicinski wrote:
> On Mon, 10 Nov 2025 12:45:23 +0100 Florian Fuchs wrote:
> > Steps to reproduce the issue:
> > 	1. Start a continuous network traffic, like scp of a 20GB file
> > 	2. Inject failslab errors using the kernel fault injection:
> > 	    echo -1 > /sys/kernel/debug/failslab/times
> > 	    echo 30 > /sys/kernel/debug/failslab/interval
> > 	    echo 100 > /sys/kernel/debug/failslab/probability
> > 	3. After some time, traces start to appear, kernel Oopses
> > 	   and the system stops
> > 
> > Step 2 is not always necessary, as it is usually already triggered by
> > the transfer of a big enough file.
> 
> Have you actually tested this on a real device?
> Please describe the testing you have done rather that "how to test".

Yes, of course, I intensively tested the patch on a Sony PS3 (CECHL04
PAL). I ran the final fix for many hours, with continuous system load
and high network transfer load. I am happy to get feedback on better or
acceptable testing.

My testing consisted of:
1. Produce Oops: Test the kernel without any gelic patches, scp a big
   file to usb stick and create high cpu/memory load (like compiling
   some software) or extract verbose, tar xv, a big file via ssh
2. Safely re-produce the Oops using failslab injection, so I dont need
   to wait for it
3. Develop against that failslab injection, high load and network
   transfer
4. First solution was to just always refill the chain, which resulted in
   RX stall after some time, as the dmac seemed to be stopped, when buffer
   was full and NOT_IN_USE head found and needed rmmod/modprobe to work
   again
5. Run the final fix for many hours while injecting failslabs, high load,
   and high network load with continuous scp and netcat
6. Further massive improvement is to convert the driver to use
   napi_gro_receive and napi_skb_alloc, but this would be a separate
   patch

> > --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> > +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> > @@ -259,6 +259,7 @@ void gelic_card_down(struct gelic_card *card)
> >  	mutex_lock(&card->updown_lock);
> >  	if (atomic_dec_if_positive(&card->users) == 0) {
> >  		pr_debug("%s: real do\n", __func__);
> > +		timer_delete_sync(&card->rx_oom_timer);
> >  		napi_disable(&card->napi);
> 
> I think the ordering here should be inverted

I thought, that there might be a race condition in the inverted order
like that napi gets re-enabled by the timer in between of the down:

1. napi_disable
2. rx_oom_timer runs and calls napi_schedule again
3. timer_delete_sync

So the timer is deleted first, to prevent any possibility to run.

> TBH handling the OOM inside the Rx function seems a little fragile.
> What if there is a packet to Rx as we enter. I don't see any loop here
> it just replaces the used buffer..

I am not sure, the handling needs to happen, when the skb allocation
fails, and that happens in the rx function, right? I am open to better
fitting fix position.

Thank you for your feedback!
Florian

