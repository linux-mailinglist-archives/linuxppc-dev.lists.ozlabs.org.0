Return-Path: <linuxppc-dev+bounces-6526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF3A4757C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 06:54:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3LBL4x1Fz3bkP;
	Thu, 27 Feb 2025 16:54:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740635642;
	cv=none; b=IHwooxN0qIkkPNg9Jg2gYATm6YjV4K/3fKKmXQpyAzedD2dmaKrSi0guNwYtrqJX7rF9VNHInS3O+56LDm+8yjxsiJBOw97KgT9M1zKIA+wbYNEZ+olFJo31QrprdMhYTV9KLtTbpbZQfEbQ3O75GDTaT8nbPywnqdOxow+aWdEZVPm8matKT9trXvgcJwnXqReAY+Iiob/su+7MKRHONipxXkAyvkrAQKtrxtOcwKcMfw4yhycyafL5Vg8K52vKaYqvkTCV93TTOyyZXmx3LGl8WMQWdvpSfxiJVnQQT4OECDZbwT4C5ehIPvfCvyx7C9kSzG/kppW5EeSAc6szXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740635642; c=relaxed/relaxed;
	bh=YrozK6muBnnSK/vqbZyb6UtsaWvVoC7UahMZm38fFc8=;
	h=From:To:Subject:In-Reply-To:Date:Message-ID:References; b=ACDPxqvttQtrCvGEsgIQR3MhEWUf7370CFm3usdWdAXn7X+pLAf9NIzw64eN4INNxAVQbrZKqVFJ7TwRq5QnikJnyBVEtxRzIcMwE9E+G2rwl4iixdTLf3YDyoXBv54+iQoGc6YcVTKS+l5avgx2iobGCC6xUo+T3wABFDbfTgRWJBvWDLxSvJfMxDbs0Ni/hCM2JughgWX3rLw2B/6Vtm+m8JZt+r7ZuEe8Ve+2pOQDPvuznHGrWTqh9rU3cbJuSKNv/meVsOOfvCBpW7xOG0KYI1/dY01st/ZB4mLHuZA79vqvqvNwq+oWdJedpTcmW1AGeHfp3tlOWpVMWAW+hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c3S5bAf7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c3S5bAf7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3LBK2MWmz308M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 16:54:00 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220e989edb6so13187035ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 21:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740635638; x=1741240438; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrozK6muBnnSK/vqbZyb6UtsaWvVoC7UahMZm38fFc8=;
        b=c3S5bAf7CYCO2l9t/LHPSyfQcuf6AWYdgD3NGVP4MKaGiTpYbgukegMmCr8hJwRVkP
         IKf3EGUlSrqlM/Kr2bMMA4ItIbVAWgevAg34eJfQDBtpVOZly0MPnkQwFrw0ft9LIIpc
         aYoAkIehmz31+XeNTZKH1cRbeq069GZWw04AP3KgNgEiHXh8Zg2LW9sdRkhX9hC/QHhW
         fcnhXelCq7DXQc2QIZAz03KNKPhNQ9ZxnwNv7NmAdvmXXIkRhgEb+Na4ogEhT/U/65zx
         9ff49++K9swWIGNrfx6VMSDU7PQQRbkiN90sxBzG0UgHCdNG9d5TDfbn6PpiXnnP6qKS
         42iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740635638; x=1741240438;
        h=references:message-id:date:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YrozK6muBnnSK/vqbZyb6UtsaWvVoC7UahMZm38fFc8=;
        b=xLvF4BAc5XCvFWuROFpiGqq9Zg97i2kGNtw24xkc6gCvgaEtUQRI/oqwdYM9X7Pqce
         Y8HcfGWGcb8CMk1rqLtO2AYYBwv4Pd2gNlePyaEHjXqttof8NtnF3pgypxhgCCB7Klf5
         tsb2UnzIJghfgTvg8erOcKOkz11H8QkQg2WzuUbPfpr6E0sbCVbvqTmqfOABBH6WxsSw
         x50zcHseHr0F5j/qHdBNUT64C3hnP5t/TZAXJxhzJSkzfGU79UfgPUyP6M1Bv4f1Mh1V
         /L2x/ChbsL3Gt5RPBoV/yaXlq9IRGKHycdXv9+opdhKkk7tRVYh1Sre/92R91m51cI9K
         r5wg==
X-Forwarded-Encrypted: i=1; AJvYcCX9oY4RyMOXHUvhDqcYRUsRZsSM204wnzNEaKLQKdl4XkT+5ucWgGZdBAxVa8uST+OnRu0Uis6EZ17c3Iw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzdM6wX0OWSMayCEVv1GYwAhhpmATdRwibJvkCWuqMd0Qw/+w3Z
	vi1Zh5KrOjfVa0WMB2GXSo9KHdnXR/sVaZmTw8Kn8omoTqyS7QiQ
X-Gm-Gg: ASbGncs5wYisuQXA+lUUAkaMKd9/WCjXExLIaAtp9K3GvkNOm9+KPFCsPoPwRpf/qsq
	HRtlKefWbyrVQSz0qhfoNCjG51YYs4vZsh+Enmg/INwM7xh1+CGMieTexY1KDuY8j1awmbbpwh2
	a6KvMpKMRlTYu8jVqyrpeDBGbnzWo5eyOR+m5Y6VuVBcKppsziMK623n2RIqYOJoQZj1ANSND52
	c6W6ZaM+8WmPB6zeL1JHcgkJqzs78Zv1t1mX09zvQvSh7a0thp/bJ+lBDpJ6CKISNSZ7PU/h949
	8NWZFmnTVE7Z4/thGw==
X-Google-Smtp-Source: AGHT+IGDIphXOr6QSC8xBH3+yMUFnOxlZcey8Pon7vJa/cyU0xoygzvMJRrOLIgdCCQhffZiJsb+1Q==
X-Received: by 2002:a05:6a21:10e:b0:1ee:d860:61eb with SMTP id adf61e73a8af0-1f0fc89a19dmr17422776637.39.1740635637550;
        Wed, 26 Feb 2025 21:53:57 -0800 (PST)
Received: from dw-tp ([171.76.86.27])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dec414esm530652a12.62.2025.02.26.21.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 21:53:56 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Subject: Re: vmalloc_node_range for size 4198400 failed: Address range restricted to 0xf1000000 - 0xf5110000 (kernel 6.14-rc4, ppc32)
In-Reply-To: <20250227013431.11d1adb7@yea>
Date: Thu, 27 Feb 2025 10:42:44 +0530
Message-ID: <87y0xsotrn.fsf@gmail.com>
References: <20250227013431.11d1adb7@yea>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Erhard Furtner <erhard_f@mailbox.org> writes:

> Greetings!
>
> At boot with a KASAN-enabled v6.14-rc4 kernel on my PowerMac G4 DP I get:
>
> [...]
> vmalloc_node_range for size 4198400 failed: Address range restricted to 0xf1000000 - 0xf5110000
> swapon: vmalloc error: size 4194304, vm_struct allocation failed, mode:0xdc0(GFP_KERNEL|__GFP_ZERO), nodemask=(null),cpuset=openrc.swap,mems_allowed=0

Did we exhaust the vmalloc area completely?


> CPU: 0 UID: 0 PID: 870 Comm: swapon Tainted: G        W          6.14.0-rc4-PMacG4 #6
> Tainted: [W]=WARN
> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> Call Trace:
> [f2ffb9d0] [c14cfd88] dump_stack_lvl+0x70/0x8c (unreliable)
> [f2ffb9f0] [c04fb9b8] warn_alloc+0x154/0x2b8
> [f2ffbab0] [c04de94c] __vmalloc_node_range_noprof+0x154/0x958
> [f2ffbb80] [c04df23c] __vmalloc_node_noprof+0xec/0xf4
> [f2ffbbc0] [c0558524] swap_cgroup_swapon+0x70/0x198
> [f2ffbbf0] [c051e8d8] sys_swapon+0x1838/0x3624
> [f2ffbce0] [c001e574] system_call_exception+0x2dc/0x420

Since only the swapon failed, I think you might still have the console
up right? So this is mostly a vmalloc allocation failure report?


> [f2ffbf30] [c00291ac] ret_from_syscall+0x0/0x2c
> --- interrupt: c00 at 0x2612ec
> NIP:  002612ec LR: 00534108 CTR: 001e8310
> REGS: f2ffbf40 TRAP: 0c00   Tainted: G        W           (6.14.0-rc4-PMacG4)
> MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24002444  XER: 00000000
>
> GPR00: 00000057 afe3ef20 a7a95540 01b2bdd0 00000000 24002444 fe5ff7e1 00247c24 
> GPR08: 0000d032 0000fa89 01b2d568 001e8310 24002448 0054fe14 02921154 00000000 
> GPR16: 00000000 00534b50 afe3f0ac afe3f0b0 00000000 00000000 0055001c afe3f0d0 
> GPR24: afe3f0b0 00000003 00000000 00001000 01b2bdd0 00000002 005579ec 01b2d570 
> NIP [002612ec] 0x2612ec
> LR [00534108] 0x534108
> --- interrupt: c00
> Mem-Info:
> active_anon:1989 inactive_anon:0 isolated_anon:0
>  active_file:6407 inactive_file:5879 isolated_file:0
>  unevictable:0 dirty:0 writeback:0
>  slab_reclaimable:1538 slab_unreclaimable:22927
>  mapped:2753 shmem:107 pagetables:182
>  sec_pagetables:0 bounce:0
>  kernel_misc_reclaimable:0
>  free:433110 free_pcp:472 free_cma:0
> Node 0 active_anon:7972kB inactive_anon:0kB active_file:25652kB inactive_file:23496kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:10908kB dirty:0kB writeback:0kB shmem:464kB writeback_tmp:0kB kernel_stack:1568kB pagetables:724kB sec_pagetables:0kB all_unreclaimable? no
> DMA free:591772kB boost:0kB min:3380kB low:4224kB high:5068kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:4kB inactive_file:11056kB unevictable:0kB writepending:0kB present:786432kB managed:716492kB mlocked:0kB bounce:0kB free_pcp:1680kB local_pcp:1180kB free_cma:0kB
> lowmem_reserve[]: 0 0 1184 0
> DMA: 127*4kB (UE) 66*8kB (UME) 37*16kB (UE) 78*32kB (UME) 10*64kB (UE) 4*128kB (UME) 3*256kB (UM) 6*512kB (UM) 5*1024kB (ME) 4*2048kB (M) 139*4096kB (M) = 591772kB
> 12404 total pagecache pages
> 0 pages in swap cache
> Free swap  = 0kB
> Total swap = 0kB
> 524288 pages RAM
> 327680 pages HighMem/MovableOnly
> 42061 pages reserved

Though above are mainly the physical mem info printed, but vmalloc can
also fail sometimes (e.g. this report), it is nice if we can print how
much of vmalloc space is free out of vmalloc total in show_mem() here.

Maybe linux-mm can tell if we should add this diff change for future?

diff --git a/mm/show_mem.c b/mm/show_mem.c
index 43afb56abbd3..b3af59fced02 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -14,6 +14,7 @@
 #include <linux/mmzone.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/vmalloc.h>

 #include "internal.h"
 #include "swap.h"
@@ -416,6 +417,8 @@ void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
        printk("%lu pages RAM\n", total);
        printk("%lu pages HighMem/MovableOnly\n", highmem);
        printk("%lu pages reserved\n", reserved);
+       printk("%lu pages Vmalloc Total\n", (unsigned long)VMALLOC_TOTAL >> PAGE_SHIFT);
+       printk("%lu pages Vmalloc Used\n", vmalloc_nr_pages());
 #ifdef CONFIG_CMA
        printk("%lu pages cma reserved\n", totalcma_pages);
 #endif


But meanwhile below data can give more details about the vmalloc area.

1. cat /proc/vmallocinfo   
2. cat /proc/meminfo       


-ritesh

> Memory allocations:
>     85.3 MiB     6104 mm/slub.c:2423 func:alloc_slab_page
>     38.5 MiB     9862 mm/readahead.c:187 func:ractl_alloc_folio
>     9.47 MiB     2425 mm/filemap.c:1970 func:__filemap_get_folio
>     7.96 MiB     2037 mm/kasan/shadow.c:304 func:kasan_populate_vmalloc_pte
>     7.87 MiB     2125 mm/execmem.c:44 func:execmem_vmalloc
>     5.01 MiB     1283 mm/memory.c:1063 func:folio_prealloc
>     4.00 MiB        1 fs/btrfs/zstd.c:366 [btrfs] func:zstd_alloc_workspace
>     3.86 MiB      247 lib/stackdepot.c:627 func:stack_depot_save_flags
>     3.62 MiB      412 mm/slub.c:2425 func:alloc_slab_page
>     3.09 MiB    18430 fs/kernfs/dir.c:624 func:__kernfs_new_node
> couldn't allocate enough memory for swap_cgroup
> swap_cgroup can be disabled by swapaccount=0 boot option
> [...]
>

> Does only happen with CONFIG_KASAN_INLINE=y but not with CONFIG_KASAN_OUTLINE=y.
>
> Kernel .config attached.
>
> Regards,
> Erhard

