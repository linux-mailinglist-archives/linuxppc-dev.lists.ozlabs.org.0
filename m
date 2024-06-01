Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5C38D6E3F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 08:03:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DSPY6Sup;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrqD80Jnhz30Wl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 16:03:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DSPY6Sup;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrqCM67jjz30Sr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 16:02:38 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41fef5dda72so22485e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 23:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717221748; x=1717826548; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03Wu35we0AtpCbYTPC6nQVPEe1FBNArJXj6MHkLG5QE=;
        b=DSPY6SupCyyBKVjRk4PzngQY/9MJ9KLft0YzB3fWZkOIP15TOZvL3Ketk4cXkOT034
         g7TDtmFyhfEonyfOLcCkekCdMMOQOnQu0RapDAAz8VLEBXuIRqgVyyBKlQkabNU9ZU0+
         0B2Pneqy5F/BMFWDhqQoU8swRF0752KaU9AaP+F7YfBeNhFQKtYwOCC74Ib5Iaq7db/Z
         0BIiqyA2iMrJPDiK2nu0u8l/Cke0wZ1TlTCQ1pemfFQgvxtRzcRFu158HgR/C3pm2R4f
         09AMuiE3SgLe2dXXHG9T5vH030BqDZj8AK4X5s+zuwwMGzkrScH5iK2jtPnt95q1YCO4
         5esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717221748; x=1717826548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03Wu35we0AtpCbYTPC6nQVPEe1FBNArJXj6MHkLG5QE=;
        b=WJv+5YA7YgKWbLnS2QOXDAwH8sN2xQqWsUNT115K6jElo3izhYBWKquHdIFoA8n5ju
         +GB3WzvjCu2IwX4+NaZUL65TV/bEgO2u4Ylsn4uvOFx6aNAEqooqWb3Hfzdq/jibWmDD
         axGPV9iYidIBHU+/ZtS3pK/WHD1QAsaM3T4w6VQMpe8JadPD3eNBma1AunlK0jTkOWa2
         p+6VWoo81P43e7Gl6hbTkD3+TQTI41GLMlGnQlKk5zn3e9YsoXtSX/k5EssZT7pyquaG
         xjD56Kt3EhonAe3quieHC6XJOvj97GeZBN3IprsI4ozCCZ6TM14o3BsSp+iR8PMjBO0+
         o8PA==
X-Forwarded-Encrypted: i=1; AJvYcCVavhzoA8zacsfOCsNAq4cHpoRuQVOgdBJeNjxDH7rrfq44HvtzN9D+9Kxv/Uxcjs2ldaWEsyFWBGXuTvXPryTzEy3eOlpL0Inqm11Ekw==
X-Gm-Message-State: AOJu0YzZocoMnGA5Ug6OkxA7grFkogDXhtTySF7yZWPXMXxBjxSGMKIz
	1ort+0SUDe3wsCJAK10zcSSr5m2K8t/YuLq7vRcYqoxZheFaZ9CVddqbkCLVpGCDux/tOi4iFnA
	jjvjiqCu0ES+rBjfbJDXrR0hWsSVrc1kYHMoW
X-Google-Smtp-Source: AGHT+IEVUzMdm8Lm7SZSaitHhHrP131BbDBUR9UqoctY0LV310H6evrUmHxPt9jXfff6VgaBsMCnfOFvtBHzsqfwy5Y=
X-Received: by 2002:a05:600c:3ca6:b0:41b:4c6a:de6d with SMTP id
 5b1f17b1804b1-421358c4114mr613585e9.5.1717221747058; Fri, 31 May 2024
 23:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea> <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
In-Reply-To: <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Sat, 1 Jun 2024 00:01:48 -0600
Message-ID: <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
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

On Wed, May 15, 2024 at 4:06=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
>
> On Wed, May 15, 2024 at 2:45=E2=80=AFPM Erhard Furtner <erhard_f@mailbox.=
org> wrote:
> >
> > On Wed, 8 May 2024 20:21:11 +0200
> > Erhard Furtner <erhard_f@mailbox.org> wrote:
> >
> > > Greetings!
> > >
> > > Got that on my dual CPU PowerMac G4 DP shortly after boot. This does =
not happen every time at bootup though:
> > >
> > > [...]
> > > kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC), no=
demask=3D(null),cpuset=3D/,mems_allowed=3D0
> > > CPU: 1 PID: 40 Comm: kswapd0 Not tainted 6.8.9-gentoo-PMacG4 #1
> > > Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> >
> > Very similar page allocation failure on the same machine on kernel 6.9.=
0 too. Seems it can easily be provoked by running a memory stressor, e.g. "=
stress-ng --vm 2 --vm-bytes 1930M --verify -v":
> >
> > [...]
> > kswapd0: page allocation failure: order:0, mode:0xcc0(GFP_KERNEL), node=
mask=3D(null),cpuset=3D/,mems_allowed=3D0
> > CPU: 0 PID: 41 Comm: kswapd0 Not tainted 6.9.0-gentoo-PMacG4 #1
> > Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> > Call Trace:
> > [c1c65940] [c07926d4] dump_stack_lvl+0x80/0xac (unreliable)
> > [c1c65960] [c01b6234] warn_alloc+0x100/0x178
> > [c1c659c0] [c01b661c] __alloc_pages+0x370/0x8d0
> > [c1c65a80] [c01c4854] __read_swap_cache_async+0xc0/0x1cc
> > [c1c65ad0] [c01cb580] zswap_writeback_entry+0x50/0x154
> > [c1c65be0] [c01cb6f4] shrink_memcg_cb+0x70/0xec
> > [c1c65c10] [c019518c] __list_lru_walk_one+0xa0/0x154
> > [c1c65c70] [c01952a4] list_lru_walk_one+0x64/0x7c
> > [c1c65ca0] [c01cad00] zswap_shrinker_scan+0xac/0xc4
> > [c1c65cd0] [c018052c] do_shrink_slab+0x18c/0x304
> > [c1c65d20] [c0180a40] shrink_slab+0x174/0x260
> > [c1c65da0] [c017cb0c] shrink_one+0xbc/0x134
> > [c1c65dd0] [c017e3e4] shrink_node+0x238/0x84c
> > [c1c65e50] [c017ed38] balance_pgdat+0x340/0x650
> > [c1c65f50] [c017f270] kswapd+0x228/0x25c
> > [c1c65fc0] [c006bbac] kthread+0xe4/0xe8
> > [c1c65ff0] [c0015304] start_kernel_thread+0x10/0x14
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 15, objs: 225, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 15, objs: 225, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 15, objs: 225, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 15, objs: 225, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 15, objs: 225, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, defau=
lt order: 3, min order: 1
> >   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO t=
o disable.
> >   node 0: slabs: 33, objs: 165, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 15, objs: 225, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, defau=
lt order: 3, min order: 1
> >   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO t=
o disable.
> >   node 0: slabs: 33, objs: 165, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 15, objs: 225, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, defau=
lt order: 3, min order: 1
> >   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO t=
o disable.
> >   node 0: slabs: 33, objs: 165, free: 0
> > Mem-Info:
> > active_anon:340071 inactive_anon:139179 isolated_anon:0
> >  active_file:8297 inactive_file:2506 isolated_file:0
> >  unevictable:4 dirty:1 writeback:18
> >  slab_reclaimable:1377 slab_unreclaimable:7426
> >  mapped:6804 shmem:112 pagetables:946
> >  sec_pagetables:0 bounce:0
> >  kernel_misc_reclaimable:0
> >  free:1141 free_pcp:7 free_cma:0
> > Node 0 active_anon:1360284kB inactive_anon:556716kB active_file:33188kB=
 inactive_file:10024kB unevictable:16kB isolated(anon):0kB isolated(file):0=
kB mapped:27216kB dirty:4kB writeback:72kB shmem:448kB writeback_tmp:0kB ke=
rnel_stack:1560kB pagetables:3784kB sec_pagetables:0kB all_unreclaimable? n=
o
> > DMA free:56kB boost:7756kB min:11208kB low:12068kB high:12928kB reserve=
d_highatomic:0KB active_anon:635128kB inactive_anon:58260kB active_file:268=
kB inactive_file:3000kB unevictable:0kB writepending:324kB present:786432kB=
 managed:746644kB mlocked:0kB bounce:0kB free_pcp:28kB local_pcp:28kB free_=
cma:0kB
> > lowmem_reserve[]: 0 0 1280 1280
> > DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB =
0*2048kB 0*4096kB =3D 0kB
> > 63943 total pagecache pages
> > 53024 pages in swap cache
> > Free swap  =3D 8057248kB
> > Total swap =3D 8388604kB
> > 524288 pages RAM
> > 327680 pages HighMem/MovableOnly
> > 9947 pages reserved
> > warn_alloc: 396 callbacks suppressed
> > kswapd0: page allocation failure: order:0, mode:0xcc0(GFP_KERNEL), node=
mask=3D(null),cpuset=3D/,mems_allowed=3D0
> > CPU: 1 PID: 41 Comm: kswapd0 Not tainted 6.9.0-gentoo-PMacG4 #1
> > Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> > Call Trace:
> > [c1c65940] [c07926d4] dump_stack_lvl+0x80/0xac (unreliable)
> > [c1c65960] [c01b6234] warn_alloc+0x100/0x178
> > [c1c659c0] [c01b661c] __alloc_pages+0x370/0x8d0
> > [c1c65a80] [c01c4854] __read_swap_cache_async+0xc0/0x1cc
> > [c1c65ad0] [c01cb580] zswap_writeback_entry+0x50/0x154
> > [c1c65be0] [c01cb6f4] shrink_memcg_cb+0x70/0xec
> > [c1c65c10] [c019518c] __list_lru_walk_one+0xa0/0x154
> > [c1c65c70] [c01952a4] list_lru_walk_one+0x64/0x7c
> > [c1c65ca0] [c01cad00] zswap_shrinker_scan+0xac/0xc4
> > [c1c65cd0] [c018052c] do_shrink_slab+0x18c/0x304
> > [c1c65d20] [c0180a40] shrink_slab+0x174/0x260
> > [c1c65da0] [c017cb0c] shrink_one+0xbc/0x134
> > [c1c65dd0] [c017e3e4] shrink_node+0x238/0x84c
> > [c1c65e50] [c017ed38] balance_pgdat+0x340/0x650
> > [c1c65f50] [c017f270] kswapd+0x228/0x25c
> > slab_out_of_memory: 53 callbacks suppressed
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, defau=
lt order: 3, min order: 1
> >   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO t=
o disable.
> >   node 0: slabs: 33, objs: 165, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, defau=
lt order: 3, min order: 1
> >   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO t=
o disable.
> >   node 0: slabs: 33, objs: 165, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, defau=
lt order: 3, min order: 1
> >   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO t=
o disable.
> >   node 0: slabs: 33, objs: 165, free: 0
> > [c1c65fc0] [c006bbac] kthread+0xe4/0xe8
> > [c1c65ff0] [c0015304] start_kernel_thread+0x10/0x14
> > Mem-Info:
> > active_anon:351976 inactive_anon:123514 isolated_anon:0
> >  active_file:4648 inactive_file:2081 isolated_file:0
> >  unevictable:4 dirty:1 writeback:39
> >  slab_reclaimable:918 slab_unreclaimable:7222
> >  mapped:5359 shmem:21 pagetables:940
> >  sec_pagetables:0 bounce:0
> >  kernel_misc_reclaimable:0
> >  free:2563 free_pcp:142 free_cma:0
> > Node 0 active_anon:1407904kB inactive_anon:494056kB active_file:18592kB=
 inactive_file:8324kB unevictable:16kB isolated(anon):0kB isolated(file):0k=
B mapped:21436kB dirty:4kB writeback:156kB shmem:84kB writeback_tmp:0kB ker=
nel_stack:1552kB pagetables:3760kB sec_pagetables:0kB all_unreclaimable? no
> > DMA free:0kB boost:7756kB min:11208kB low:12068kB high:12928kB reserved=
_highatomic:0KB active_anon:199336kB inactive_anon:491432kB active_file:461=
2kB inactive_file:5980kB unevictable:0kB writepending:660kB present:786432k=
B managed:746644kB mlocked:0kB bounce:0kB free_pcp:568kB local_pcp:20kB fre=
e_cma:0kB
> > lowmem_reserve[]: 0 0 1280 1280
> > DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB =
0*2048kB 0*4096kB =3D 0kB
> > 45961 total pagecache pages
> > 39207 pages in swap cache
> > Free swap  =3D 8093096kB
> > Total swap =3D 8388604kB
> > 524288 pages RAM
> > 327680 pages HighMem/MovableOnly
> > 9947 pages reserved
> > warn_alloc: 343 callbacks suppressed
> > kswapd0: page allocation failure: order:0, mode:0xcc0(GFP_KERNEL), node=
mask=3D(null),cpuset=3D/,mems_allowed=3D0
> > CPU: 0 PID: 41 Comm: kswapd0 Not tainted 6.9.0-gentoo-PMacG4 #1
> > Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> > Call Trace:
> > [c1c65940] [c07926d4] dump_stack_lvl+0x80/0xac (unreliable)
> > [c1c65960] [c01b6234] warn_alloc+0x100/0x178
> > [c1c659c0] [c01b661c] __alloc_pages+0x370/0x8d0
> > [c1c65a80] [c01c4854] __read_swap_cache_async+0xc0/0x1cc
> > [c1c65ad0] [c01cb580] zswap_writeback_entry+0x50/0x154
> > [c1c65be0] [c01cb6f4] shrink_memcg_cb+0x70/0xec
> > [c1c65c10] [c019518c] __list_lru_walk_one+0xa0/0x154
> > slab_out_of_memory: 59 callbacks suppressed
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, defau=
lt order: 3, min order: 1
> >   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO t=
o disable.
> >   node 0: slabs: 33, objs: 165, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, defau=
lt order: 3, min order: 1
> >   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO t=
o disable.
> >   node 0: slabs: 33, objs: 165, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: skbuff_small_head, object size: 480, buffer size: 544, default=
 order: 1, min order: 0
> >   node 0: slabs: 18, objs: 270, free: 0
> > SLUB: Unable to allocate memory on node -1, gfp=3D0x820(GFP_ATOMIC)
> >   cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, defau=
lt order: 3, min order: 1
> >   kmalloc-rnd-15-2k debugging increased min order, use slab_debug=3DO t=
o disable.
> >   node 0: slabs: 33, objs: 165, free: 0
> > [c1c65c70] [c01952a4] list_lru_walk_one+0x64/0x7c
> > [c1c65ca0] [c01cad00] zswap_shrinker_scan+0xac/0xc4
> > [c1c65cd0] [c018052c] do_shrink_slab+0x18c/0x304
> > [c1c65d20] [c0180a40] shrink_slab+0x174/0x260
> > [c1c65da0] [c017cb0c] shrink_one+0xbc/0x134
> > [c1c65dd0] [c017e3e4] shrink_node+0x238/0x84c
> > [c1c65e50] [c017ed38] balance_pgdat+0x340/0x650
> > [c1c65f50] [c017f270] kswapd+0x228/0x25c
> > [c1c65fc0] [c006bbac] kthread+0xe4/0xe8
> > [c1c65ff0] [c0015304] start_kernel_thread+0x10/0x14
> > Mem-Info:
> > active_anon:235002 inactive_anon:240975 isolated_anon:0
> >  active_file:4356 inactive_file:2551 isolated_file:0
> >  unevictable:4 dirty:7 writeback:19
> >  slab_reclaimable:1008 slab_unreclaimable:7218
> >  mapped:5601 shmem:21 pagetables:939
> >  sec_pagetables:0 bounce:0
> >  kernel_misc_reclaimable:0
> >  free:1340 free_pcp:23 free_cma:0
> > Node 0 active_anon:940008kB inactive_anon:963900kB active_file:17424kB =
inactive_file:10204kB unevictable:16kB isolated(anon):0kB isolated(file):0k=
B mapped:22404kB dirty:28kB writeback:76kB shmem:84kB writeback_tmp:0kB ker=
nel_stack:1552kB pagetables:3756kB sec_pagetables:0kB all_unreclaimable? no
> > DMA free:0kB boost:7756kB min:11208kB low:12068kB high:12928kB reserved=
_highatomic:0KB active_anon:644060kB inactive_anon:36332kB active_file:5276=
kB inactive_file:5516kB unevictable:0kB writepending:348kB present:786432kB=
 managed:746644kB mlocked:0kB bounce:0kB free_pcp:92kB local_pcp:92kB free_=
cma:0kB
> > lowmem_reserve[]: 0 0 1280 1280
> > DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB =
0*2048kB 0*4096kB =3D 0kB
> > 116345 total pagecache pages
> > 109413 pages in swap cache
> > Free swap  =3D 7819300kB
> > Total swap =3D 8388604kB
> > 524288 pages RAM
> > 327680 pages HighMem/MovableOnly
> > 9947 pages reserved
> >
> >
> > I switched from zstd to lzo as zswap default compressor so zstd does no=
t show up on the dmesg. But the rest looks pretty similar.
> >
> > Full dmesg and kernel .config attached.
> >
> > Regards,
> > Erhard
>
> Hi Erhard,
>
> Thanks for the reports. I'll take a look at them and get back to you
> in a few days.

Hi Erhard,

The OOM kills on both kernel versions seem to be reasonable to me.

Your system has 2GB memory and it uses zswap with zsmalloc (which is
good since it can allocate from the highmem zone) and zstd/lzo (which
doesn't matter much). Somehow -- I couldn't figure out why -- it
splits the 2GB into a 0.25GB DMA zone and a 1.75GB highmem zone:

[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000]   Normal   empty
[    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]

The kernel can't allocate from the highmem zone -- only userspace and
zsmalloc can. OOM kills were due to the low memory conditions in the
DMA zone where the kernel itself failed to allocate from.

Do you know a kernel version that doesn't have OOM kills while running
the same workload? If so, could you send that .config to me? If not,
could you try disabling CONFIG_HIGHMEM? (It might not help but I'm out
of ideas at the moment.)

Thanks!
