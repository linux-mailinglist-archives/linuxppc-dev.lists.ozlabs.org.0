Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E68FDE39
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 07:44:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NYAG7FZc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvtYx6Y0vz3cXV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 15:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NYAG7FZc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvtYC70dJz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 15:43:41 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-6ce533b6409so403053a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 22:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717652619; x=1718257419; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9evaiRpo0K0MKjvHd6Fu6tPQEBbm84cbZFPUlgH+U/c=;
        b=NYAG7FZcqoW6GbF0o6522fc58l9iFOhfQM6xuR5juNlsfPG6varS5ZYiUGU+8P1zt8
         RyGjIozwuV6j1En+SC8OGLRgEaGeGO2bPOQlnnZVBBwd2AgXBNfpUEJvyb7PMO8p3Ngj
         Ys3oVRG9qrRAgphOh2lZ+mh5cccDOsbsZfTVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717652619; x=1718257419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9evaiRpo0K0MKjvHd6Fu6tPQEBbm84cbZFPUlgH+U/c=;
        b=MKiaC9yLvrRnAC2UOkRqhb5LI8tbSWDEv0R7MQQ4MX8VEpwxpFgwcL/NLrBLHnsnAk
         QPoX0+yXUt/zH7gK0kFnzTcrnFgxzmfai8jAjAFZTSXCQvZnyvuPcg6trrM40yppgtZ5
         GBdWo60bBoZBpsYaggeSO8f7REtnYTnDnJo9k9lZfnUH/tneY6lfhn6UguK6Q/1sMfbd
         D9f4LtpbpJrwU29LWpi+eGGQV+I5ASvNoc/mUHuLVT79jnJXdpkrXoEx9AggBJYaU1/4
         +RF2NbvsPow3De19JB6uNGzSBlJocyc/qHh4TJx62VkutGEq25+2wkItLiQYm7sqXnbj
         qd1A==
X-Forwarded-Encrypted: i=1; AJvYcCWwTB0vr787903YbeFxJOft2fPWyYjlGMbNhkS3hiWsJkB88ijRDsDqBaS1TaTTfXs2NZc9VipI9ejQpKsDTvrxnuB8ViJVRbE20vPuug==
X-Gm-Message-State: AOJu0Ywtf/0RyCjKIPjuiX2+WkG/oSHDE6LNk8pGZXdKmdD6ypdGOyjS
	EJcJAo3aczri5YM+lRW01EsvxT1AOAlSwDqUDypRg8zmyYyYfPJGchhEKfMmMA==
X-Google-Smtp-Source: AGHT+IFy7hjyNVNxBD93ScL0gjQe1sK4zEeKhq1Mmbs2AmOIwNZ2Z1Ekq4heMJmewPkxaRSXKcuUxw==
X-Received: by 2002:a05:6a20:430f:b0:1af:dae8:5ea2 with SMTP id adf61e73a8af0-1b2b710b40fmr5480556637.48.1717652619298;
        Wed, 05 Jun 2024 22:43:39 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:22f8:8e4a:7027:de56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7f28adsm5220295ad.265.2024.06.05.22.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 22:43:38 -0700 (PDT)
Date: Thu, 6 Jun 2024 14:43:34 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Chengming Zhou <chengming.zhou@linux.dev>
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
Message-ID: <20240606054334.GD11718@google.com>
References: <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
 <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
 <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
 <20240604231019.18e2f373@yea>
 <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
 <20240606010431.2b33318c@yea>
 <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
 <e68bcc6a-25b1-42aa-83b3-5d457b254cbe@linux.dev>
 <20240606043156.GC11718@google.com>
 <6335c05d-9493-4b03-85a7-f2dd91db9451@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6335c05d-9493-4b03-85a7-f2dd91db9451@linux.dev>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Nhat Pham <nphamcs@gmail.com>, Yu Zhao <yuzhao@google.com>, linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (24/06/06 12:46), Chengming Zhou wrote:
> >> Agree, I think we should try to improve locking scalability of zsmalloc.
> >> I have some thoughts to share, no code or test data yet:
> >>
> >> 1. First, we can change the pool global lock to per-class lock, which
> >>    is more fine-grained.
> > 
> > Commit c0547d0b6a4b6 "zsmalloc: consolidate zs_pool's migrate_lock
> > and size_class's locks" [1] claimed no significant difference
> > between class->lock and pool->lock.
> 
> Ok, I haven't looked into the history much, that seems preparation of trying
> to introduce reclaim in the zsmalloc? Not sure. But now with the reclaim code
> in zsmalloc has gone, should we change back to the per-class lock? Which is

Well, the point that commit made was that Nhat (and Johannes?) were
unable to detect any impact of pool->lock on a variety of cases.  So
we went on with code simplification.

> obviously more fine-grained than the pool lock. Actually, I have just done it,
> will test to get some data later.

Thanks, we'll need data on this.  I'm happy to take the patch, but
jumping back and forth between class->lock and pool->lock merely
"for obvious reasons" is not what I'm extremely excited about.
