Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB598C6E6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 00:08:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kFzzLnDJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfnRG622Dz3dW8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 08:08:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kFzzLnDJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfnQQ3GDvz30V3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 08:07:25 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41fef5dda72so344035e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 15:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715810833; x=1716415633; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OscmHwMONkjYXaXcy4YkhdqQvq8LZLvZAntCwp0ktck=;
        b=kFzzLnDJ/RlEJUyd11hf+5LfSLgvFVtpu5H+tj7aguiAMS276yZAplschIL7QCAiqs
         OxX2ySC3fW/LY8WC79mfbzrIh4BzqPtXaoLAAWLp2zQNnwNCmt9A2a/EDlijHnTvwLHI
         /CgPoAyTDFJLxzdZz7GeyWEIIN3lv6ZtlzSjr376L3CXgtP6Fccni0qT2C52OH6pNBTz
         nncMATGhJUgIccvIzt9PzyZimc2tkYJRtkvtDuu+UvbnRcwxmtnzwSz+ciGDn7kXyKWZ
         TyTywyS1NiX2V6hIbr9tZO4HLGOIC4n5UWLJGCLNzsb3jSAcL/rZmfTEkAR7L2vajjdL
         cd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715810833; x=1716415633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OscmHwMONkjYXaXcy4YkhdqQvq8LZLvZAntCwp0ktck=;
        b=U77WG1m6c9b4ZbIa+92+cWnsoXPa9UPwpM1WBkviI4JopnDrs51DWvumW1SNgP8uhP
         K+A84m3mZZJ5/pbiII6RUbF9N/uv59RwPjsgz2AMyShjBSIkhemU02mWQXonYRpPzWWH
         2UgEFgaxWojGTG4q4lpYzmrYX2yYcbA4r9oTkEvntPd2KSZBOUQa89p/3lkR5DeCIbmf
         U/3gQMk78CM+E+0S8s1zE27uWVmeP9YwD7mwzzxbza6/v9BwHSmM80kAIYH6YNHZMVJt
         hbDth1A9p95ZJzMvaVB0fLOq3Oulj87xNeZGMFPpGCEooSvEALVinfUccedDb5btQiZd
         OFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+ScZ0fPOc3q/Y3bcnvMwm1H+UNK0hYGbX3yReQcv7ZnpyjeR4Rl6EJ1ITT+JC7c2lqn7kQkpbP5x2EOiasuggBUmX5IBb83b0IDcG2A==
X-Gm-Message-State: AOJu0Yx5WKyFnLOQHa1Bc2Wy9v+GEcjne+AjBNmaR87wPfpRV7UyHzkL
	oYbwc3UKFlnOHWezJ+HARzATnhBzXtNcPhxfsyUopRP3JtEjjPkRIdH8lSaSjnXjLQs0NNt3iKF
	KssW+qVONOPzbD8BgEmIOTJnfgC81v3uNz9+n
X-Google-Smtp-Source: AGHT+IF7Hew74c1YSBbVSLgKFrCt8F4DORG+tQE7/A4IxOPrJJQuJjuG9iKeqPfUk+ZYNnYDjzcvOEqifHqGV6ME20I=
X-Received: by 2002:a05:600c:3d9a:b0:41f:a15d:2228 with SMTP id
 5b1f17b1804b1-4200ebea389mr10040285e9.0.1715810832956; Wed, 15 May 2024
 15:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
In-Reply-To: <20240515224524.1c8befbe@yea>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 15 May 2024 16:06:35 -0600
Message-ID: <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Erhard Furtner <erhard_f@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2024 at 2:45=E2=80=AFPM Erhard Furtner <erhard_f@mailbox.or=
g> wrote:
>
> On Wed, 8 May 2024 20:21:11 +0200
> Erhard Furtner <erhard_f@mailbox.org> wrote:
>
> > Greetings!
> >
> > Got that on my dual CPU PowerMac G4 DP shortly after boot. This does no=
t happen every time at bootup though:
> >
> > [...]
> > kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC), node=
mask=3D(null),cpuset=3D/,mems_allowed=3D0
> > CPU: 1 PID: 40 Comm: kswapd0 Not tainted 6.8.9-gentoo-PMacG4 #1
> > Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
>
> Very similar page allocation failure on the same machine on kernel 6.9.0 =
too. Seems it can easily be provoked by running a memory stressor, e.g. "st=
ress-ng --vm 2 --vm-bytes 1930M --verify -v":
>
> [...]
> kswapd0: page allocation failure: order:0, mode:0xcc0(GFP_KERNEL), nodema=
sk=3D(null),cpuset=3D/,mems_allowed=3D0
> CPU: 0 PID: 41 Comm: kswapd0 Not tainted 6.9.0-gentoo-PMacG4 #1
> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> Call Trace:
> [c1c65940] [c07926d4] dump_stack_lvl+0x80/0xac (unreliable)
> [c1c65960] [c01b6234] warn_alloc+0x100/0x178
> [c1c659c0] [c01b661c] __alloc_pages+0x370/0x8d0
> [c1c65a80] [c01c4854] __read_swap_cache_async+0xc0/0x1cc
> [c1c65ad0] [c01cb580] zswap_writeback_entry+0x50/0x154
> [c1c65be0] [c01cb6f4] shrink_memcg_cb+0x70/0xec
> [c1c65c10] [c019518c] __list_lru_walk_one+0xa0/0x154
> [c1c65c70] [c01952a4] list_lru_walk_one+0x64/0x7c
> [c1c65ca0] [c01cad00] zswap_shrinker_scan+0xac/0xc4
> [c1c65cd0] [c018052c] do_shrink_slab+0x18c/0x304
> [c1c65d20] [c0180a40] shrink_slab+0x174/0x260
> [c1c65da0] [c017cb0c] shrink_one+0xbc/0x134
> [c1c65dd0] [c017e3e4] shrink_node+0x238/0x84c
> [c1c65e50] [c017ed38] balance_pgdat+0x340/0x650
> [c1c65f50] [c017f270] kswapd+0x228/0x25c
> [c1c65fc0] [c006bbac] kthread+0xe4/0xe8
> [c1c65ff0] [c0015304] start_kernel_thread+0x10/0x14
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 15, objs: 225, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 15, objs: 225, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 15, objs: 225, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 15, objs: 225, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 15, objs: 225, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default=
 order: 3, min order: 1
>   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO to =
disable.
>   node 0: slabs: 33, objs: 165, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 15, objs: 225, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default=
 order: 3, min order: 1
>   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO to =
disable.
>   node 0: slabs: 33, objs: 165, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 15, objs: 225, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default=
 order: 3, min order: 1
>   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO to =
disable.
>   node 0: slabs: 33, objs: 165, free: 0
> Mem-Info:
> active_anon:340071 inactive_anon:139179 isolated_anon:0
>  active_file:8297 inactive_file:2506 isolated_file:0
>  unevictable:4 dirty:1 writeback:18
>  slab_reclaimable:1377 slab_unreclaimable:7426
>  mapped:6804 shmem:112 pagetables:946
>  sec_pagetables:0 bounce:0
>  kernel_misc_reclaimable:0
>  free:1141 free_pcp:7 free_cma:0
> Node 0 active_anon:1360284kB inactive_anon:556716kB active_file:33188kB i=
nactive_file:10024kB unevictable:16kB isolated(anon):0kB isolated(file):0kB=
 mapped:27216kB dirty:4kB writeback:72kB shmem:448kB writeback_tmp:0kB kern=
el_stack:1560kB pagetables:3784kB sec_pagetables:0kB all_unreclaimable? no
> DMA free:56kB boost:7756kB min:11208kB low:12068kB high:12928kB reserved_=
highatomic:0KB active_anon:635128kB inactive_anon:58260kB active_file:268kB=
 inactive_file:3000kB unevictable:0kB writepending:324kB present:786432kB m=
anaged:746644kB mlocked:0kB bounce:0kB free_pcp:28kB local_pcp:28kB free_cm=
a:0kB
> lowmem_reserve[]: 0 0 1280 1280
> DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*=
2048kB 0*4096kB =3D 0kB
> 63943 total pagecache pages
> 53024 pages in swap cache
> Free swap  =3D 8057248kB
> Total swap =3D 8388604kB
> 524288 pages RAM
> 327680 pages HighMem/MovableOnly
> 9947 pages reserved
> warn_alloc: 396 callbacks suppressed
> kswapd0: page allocation failure: order:0, mode:0xcc0(GFP_KERNEL), nodema=
sk=3D(null),cpuset=3D/,mems_allowed=3D0
> CPU: 1 PID: 41 Comm: kswapd0 Not tainted 6.9.0-gentoo-PMacG4 #1
> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> Call Trace:
> [c1c65940] [c07926d4] dump_stack_lvl+0x80/0xac (unreliable)
> [c1c65960] [c01b6234] warn_alloc+0x100/0x178
> [c1c659c0] [c01b661c] __alloc_pages+0x370/0x8d0
> [c1c65a80] [c01c4854] __read_swap_cache_async+0xc0/0x1cc
> [c1c65ad0] [c01cb580] zswap_writeback_entry+0x50/0x154
> [c1c65be0] [c01cb6f4] shrink_memcg_cb+0x70/0xec
> [c1c65c10] [c019518c] __list_lru_walk_one+0xa0/0x154
> [c1c65c70] [c01952a4] list_lru_walk_one+0x64/0x7c
> [c1c65ca0] [c01cad00] zswap_shrinker_scan+0xac/0xc4
> [c1c65cd0] [c018052c] do_shrink_slab+0x18c/0x304
> [c1c65d20] [c0180a40] shrink_slab+0x174/0x260
> [c1c65da0] [c017cb0c] shrink_one+0xbc/0x134
> [c1c65dd0] [c017e3e4] shrink_node+0x238/0x84c
> [c1c65e50] [c017ed38] balance_pgdat+0x340/0x650
> [c1c65f50] [c017f270] kswapd+0x228/0x25c
> slab_out_of_memory: 53 callbacks suppressed
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default=
 order: 3, min order: 1
>   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO to =
disable.
>   node 0: slabs: 33, objs: 165, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default=
 order: 3, min order: 1
>   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO to =
disable.
>   node 0: slabs: 33, objs: 165, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default=
 order: 3, min order: 1
>   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO to =
disable.
>   node 0: slabs: 33, objs: 165, free: 0
> [c1c65fc0] [c006bbac] kthread+0xe4/0xe8
> [c1c65ff0] [c0015304] start_kernel_thread+0x10/0x14
> Mem-Info:
> active_anon:351976 inactive_anon:123514 isolated_anon:0
>  active_file:4648 inactive_file:2081 isolated_file:0
>  unevictable:4 dirty:1 writeback:39
>  slab_reclaimable:918 slab_unreclaimable:7222
>  mapped:5359 shmem:21 pagetables:940
>  sec_pagetables:0 bounce:0
>  kernel_misc_reclaimable:0
>  free:2563 free_pcp:142 free_cma:0
> Node 0 active_anon:1407904kB inactive_anon:494056kB active_file:18592kB i=
nactive_file:8324kB unevictable:16kB isolated(anon):0kB isolated(file):0kB =
mapped:21436kB dirty:4kB writeback:156kB shmem:84kB writeback_tmp:0kB kerne=
l_stack:1552kB pagetables:3760kB sec_pagetables:0kB all_unreclaimable? no
> DMA free:0kB boost:7756kB min:11208kB low:12068kB high:12928kB reserved_h=
ighatomic:0KB active_anon:199336kB inactive_anon:491432kB active_file:4612k=
B inactive_file:5980kB unevictable:0kB writepending:660kB present:786432kB =
managed:746644kB mlocked:0kB bounce:0kB free_pcp:568kB local_pcp:20kB free_=
cma:0kB
> lowmem_reserve[]: 0 0 1280 1280
> DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*=
2048kB 0*4096kB =3D 0kB
> 45961 total pagecache pages
> 39207 pages in swap cache
> Free swap  =3D 8093096kB
> Total swap =3D 8388604kB
> 524288 pages RAM
> 327680 pages HighMem/MovableOnly
> 9947 pages reserved
> warn_alloc: 343 callbacks suppressed
> kswapd0: page allocation failure: order:0, mode:0xcc0(GFP_KERNEL), nodema=
sk=3D(null),cpuset=3D/,mems_allowed=3D0
> CPU: 0 PID: 41 Comm: kswapd0 Not tainted 6.9.0-gentoo-PMacG4 #1
> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> Call Trace:
> [c1c65940] [c07926d4] dump_stack_lvl+0x80/0xac (unreliable)
> [c1c65960] [c01b6234] warn_alloc+0x100/0x178
> [c1c659c0] [c01b661c] __alloc_pages+0x370/0x8d0
> [c1c65a80] [c01c4854] __read_swap_cache_async+0xc0/0x1cc
> [c1c65ad0] [c01cb580] zswap_writeback_entry+0x50/0x154
> [c1c65be0] [c01cb6f4] shrink_memcg_cb+0x70/0xec
> [c1c65c10] [c019518c] __list_lru_walk_one+0xa0/0x154
> slab_out_of_memory: 59 callbacks suppressed
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default=
 order: 3, min order: 1
>   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO to =
disable.
>   node 0: slabs: 33, objs: 165, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default=
 order: 3, min order: 1
>   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO to =
disable.
>   node 0: slabs: 33, objs: 165, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: skbuff_small_head, object size: 480, buffer size: 544, default o=
rder: 1, min order: 0
>   node 0: slabs: 18, objs: 270, free: 0
> SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
>   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default=
 order: 3, min order: 1
>   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO to =
disable.
>   node 0: slabs: 33, objs: 165, free: 0
> [c1c65c70] [c01952a4] list_lru_walk_one+0x64/0x7c
> [c1c65ca0] [c01cad00] zswap_shrinker_scan+0xac/0xc4
> [c1c65cd0] [c018052c] do_shrink_slab+0x18c/0x304
> [c1c65d20] [c0180a40] shrink_slab+0x174/0x260
> [c1c65da0] [c017cb0c] shrink_one+0xbc/0x134
> [c1c65dd0] [c017e3e4] shrink_node+0x238/0x84c
> [c1c65e50] [c017ed38] balance_pgdat+0x340/0x650
> [c1c65f50] [c017f270] kswapd+0x228/0x25c
> [c1c65fc0] [c006bbac] kthread+0xe4/0xe8
> [c1c65ff0] [c0015304] start_kernel_thread+0x10/0x14
> Mem-Info:
> active_anon:235002 inactive_anon:240975 isolated_anon:0
>  active_file:4356 inactive_file:2551 isolated_file:0
>  unevictable:4 dirty:7 writeback:19
>  slab_reclaimable:1008 slab_unreclaimable:7218
>  mapped:5601 shmem:21 pagetables:939
>  sec_pagetables:0 bounce:0
>  kernel_misc_reclaimable:0
>  free:1340 free_pcp:23 free_cma:0
> Node 0 active_anon:940008kB inactive_anon:963900kB active_file:17424kB in=
active_file:10204kB unevictable:16kB isolated(anon):0kB isolated(file):0kB =
mapped:22404kB dirty:28kB writeback:76kB shmem:84kB writeback_tmp:0kB kerne=
l_stack:1552kB pagetables:3756kB sec_pagetables:0kB all_unreclaimable? no
> DMA free:0kB boost:7756kB min:11208kB low:12068kB high:12928kB reserved_h=
ighatomic:0KB active_anon:644060kB inactive_anon:36332kB active_file:5276kB=
 inactive_file:5516kB unevictable:0kB writepending:348kB present:786432kB m=
anaged:746644kB mlocked:0kB bounce:0kB free_pcp:92kB local_pcp:92kB free_cm=
a:0kB
> lowmem_reserve[]: 0 0 1280 1280
> DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*=
2048kB 0*4096kB =3D 0kB
> 116345 total pagecache pages
> 109413 pages in swap cache
> Free swap  =3D 7819300kB
> Total swap =3D 8388604kB
> 524288 pages RAM
> 327680 pages HighMem/MovableOnly
> 9947 pages reserved
>
>
> I switched from zstd to lzo as zswap default compressor so zstd does not =
show up on the dmesg. But the rest looks pretty similar.
>
> Full dmesg and kernel .config attached.
>
> Regards,
> Erhard

Hi Erhard,

Thanks for the reports. I'll take a look at them and get back to you
in a few days.
