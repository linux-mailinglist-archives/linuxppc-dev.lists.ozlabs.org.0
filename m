Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 174AA8FDDC0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 06:32:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cMZfIrsc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvrzM1mDGz3cVx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 14:32:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cMZfIrsc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvryd13Plz3cF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 14:32:07 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2c1aa8d302fso1213064a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 21:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717648323; x=1718253123; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e5O/KPBawU1WK3EGBuiDZMDOrb6/M6TI7wnGL7CoNe4=;
        b=cMZfIrsczQ//bZ4DHFSjV7TM7KcgAaj6yz/AKiKIKpLdDUHWn6VcYKMdn5qDOoMr0U
         xPV22VGD57mJ+zlAir4HmVBwyMCSS/6h/fTInLX/hFOXdGWclzNEFzQlSQQquiUjhCla
         fbigk5nVvblIdJoi3REap8nIy6sqAnvJjIqX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717648323; x=1718253123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5O/KPBawU1WK3EGBuiDZMDOrb6/M6TI7wnGL7CoNe4=;
        b=mZMwIIFEJB4eCLCHCdNMjWM2JwtQ7TxPIJmpTDTQxPZb0o1XV91wvbkB4l5T56p6+E
         zmaOjxbw76q0rXFRU7qSRjdyE/bXwNIeS+/Pfv++o3zo7CCIkpCfAiNGpG+1FHUVUQlf
         YvZ6DkUk5ijoH7JDChKhIbm7Rxs90ZZKHRhf7Ngxz0SL8Ep+rAeKysIqshPR71DiZBl4
         lKqIbVr8M6NT8afXvqHHaNy4LyQsfbF7mlYonrJMG7Ou+hUOhoF2l4RJqAau6kX8272q
         5yruI87NwPZrOeuD64gNBKI9FoxowcQiZwpuoAGOsePWqAOCDIT9K7WhZHf+bPz+DfGS
         u1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhT9LcSW4qhfb6bZgVPVz3mPAYw3lcLCsG4EmHJykxbhyuoB7O5xc+1bdDTWRSvSKv1vp3VQ9K3hNno7OvY/YvtMTvjK9+rYkzYgLShw==
X-Gm-Message-State: AOJu0Yx44/TgIY5Cnj4tVD6mmTrTXuLshKcDM2m83nNHur3pys2moyq4
	ZhSHjAQoyLputWevSI3VO1bqwHkHIig7rS0JhN8DD8l+fEhKESgusqCYGw3ROA==
X-Google-Smtp-Source: AGHT+IGeGRNGy0Xw3Akts/lPFVIgXije/S+Ayuxc+gSupT7N6SirKbQGyrs2QN0KZ/uVluqHP+feAg==
X-Received: by 2002:a17:90a:ea8f:b0:2b4:329e:eabd with SMTP id 98e67ed59e1d1-2c29997370cmr2096719a91.2.1717648322998;
        Wed, 05 Jun 2024 21:32:02 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:22f8:8e4a:7027:de56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28063a7fcsm2418151a91.7.2024.06.05.21.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 21:32:02 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:31:56 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Chengming Zhou <chengming.zhou@linux.dev>
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
Message-ID: <20240606043156.GC11718@google.com>
References: <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
 <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
 <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
 <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
 <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
 <20240604231019.18e2f373@yea>
 <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
 <20240606010431.2b33318c@yea>
 <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
 <e68bcc6a-25b1-42aa-83b3-5d457b254cbe@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e68bcc6a-25b1-42aa-83b3-5d457b254cbe@linux.dev>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Nhat Pham <nphamcs@gmail.com>, Yu Zhao <yuzhao@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (24/06/06 10:49), Chengming Zhou wrote:
> > Thanks for trying this out. This is interesting, so even two zpools is
> > too much fragmentation for your use case.
> > 
> > I think there are multiple ways to go forward here:
> > (a) Make the number of zpools a config option, leave the default as
> > 32, but allow special use cases to set it to 1 or similar. This is
> > probably not preferable because it is not clear to users how to set
> > it, but the idea is that no one will have to set it except special use
> > cases such as Erhard's (who will want to set it to 1 in this case).
> > 
> > (b) Make the number of zpools scale linearly with the number of CPUs.
> > Maybe something like nr_cpus/4 or nr_cpus/8. The problem with this
> > approach is that with a large number of CPUs, too many zpools will
> > start having diminishing returns. Fragmentation will keep increasing,
> > while the scalability/concurrency gains will diminish.
> > 
> > (c) Make the number of zpools scale logarithmically with the number of
> > CPUs. Maybe something like 4log2(nr_cpus). This will keep the number
> > of zpools from increasing too much and close to the status quo. The
> > problem is that at a small number of CPUs (e.g. 2), 4log2(nr_cpus)
> > will actually give a nr_zpools > nr_cpus. So we will need to come up
> > with a more fancy magic equation (e.g. 4log2(nr_cpus/4)).
> > 
> > (d) Make the number of zpools scale linearly with memory. This makes
> > more sense than scaling with CPUs because increasing the number of
> > zpools increases fragmentation, so it makes sense to limit it by the
> > available memory. This is also more consistent with other magic
> > numbers we have (e.g. SWAP_ADDRESS_SPACE_SHIFT).
> > 
> > The problem is that unlike zswap trees, the zswap pool is not
> > connected to the swapfile size, so we don't have an indication for how
> > much memory will be in the zswap pool. We can scale the number of
> > zpools with the entire memory on the machine during boot, but this
> > seems like it would be difficult to figure out, and will not take into
> > consideration memory hotplugging and the zswap global limit changing.
> > 
> > (e) A creative mix of the above.
> > 
> > (f) Something else (probably simpler).
> > 
> > I am personally leaning toward (c), but I want to hear the opinions of
> > other people here. Yu, Vlastimil, Johannes, Nhat? Anyone else?
> > 
> > In the long-term, I think we may want to address the lock contention
> > in zsmalloc itself instead of zswap spawning multiple zpools.

Sorry, I'm sure I'm not following this discussion closely enough,
has the lock contention been demonstrated/proved somehow? lock-stats?

> Agree, I think we should try to improve locking scalability of zsmalloc.
> I have some thoughts to share, no code or test data yet:
> 
> 1. First, we can change the pool global lock to per-class lock, which
>    is more fine-grained.

Commit c0547d0b6a4b6 "zsmalloc: consolidate zs_pool's migrate_lock
and size_class's locks" [1] claimed no significant difference
between class->lock and pool->lock.

[1] https://lkml.kernel.org/r/20221128191616.1261026-4-nphamcs@gmail.com
