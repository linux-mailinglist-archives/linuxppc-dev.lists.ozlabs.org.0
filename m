Return-Path: <linuxppc-dev+bounces-6537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92A0A48205
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 15:51:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3Z6B46N7z3bqC;
	Fri, 28 Feb 2025 01:51:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740667874;
	cv=none; b=O+1hrEeEkVZTxLNyilYdkSDjCJzTsqXj1lg2LspiIywv6mY+5Q4MIImbhBR+ysf0Ir/LgJTcYn3AmHEhu6oDCWed93YQSGAu56wu1UNWWNjLP+V4TrkFLFo0Q+KQrpuTEqxzKfBE6hczhuO/b8Q4xlVgrpEqEdHhLUFcBlgoLdnGbC0PDeve9ubREqFfJzw2paQVcqMGvo5Ns4LurIUKDoja/8YMOMNakEnyWxrzH1H+wzNANB7ejTAN9lb9iWcTnzFOOVo4+uiTPm0rD5NGVKrDh2eHCOonG9Omt/BeyA70uOz0JmyAnZHiPfEcHnp1JaOIg5lKvV1TabPNsyqdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740667874; c=relaxed/relaxed;
	bh=cqrFRuxKE9DA3a28/LGJSvqEPKEhVddEhMk+P53EotI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E04fOZI72wGyZ2SNIUwbGOUIOt3ZX1YH5anoddXlVE9qfVTFJSVX6wrqV6YW17wYHyBB931LmpEhAXZcOD0tEFb1U8aOEec9kRIv0SHkjSbI/Y/LS+7fnwFOVmKkxYjS6pfMlk/Pab5tYDrSVb5DIYSP+QA58Ysq+alF7AZI5B2L/UxY4ZRuUNvDVOxV0kyBTGSFYYZdQdoIgaJ0FPCRwC5VSGKXM+W07vSwhz/+OVwYioczia5bLh9Lqsv8zRu0oMndLxXRQ/CGt7yVepoXsZFq9QIIyJBJpYGksRPhCz40D5Apf8i8ulnhwMtPgm3+u5zp6y5VY5QsX7qH4U6eng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Wz+jw6WO; dkim-atps=neutral; spf=pass (client-ip=80.241.56.161; helo=mout-p-103.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Wz+jw6WO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.161; helo=mout-p-103.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3Z672tjTz3bpJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 01:51:09 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Z3Z5v6Nhmz9sSf;
	Thu, 27 Feb 2025 15:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1740667859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cqrFRuxKE9DA3a28/LGJSvqEPKEhVddEhMk+P53EotI=;
	b=Wz+jw6WOjbdQYH1jPsQz88sPtyeseAgGoJ2e56JIJzMgB3zOaoJhQ/ITvYlJpAftlBj619
	oocMSF+P5ipS+9JId5YB16MbYOtF2TVk5BThQ57TO6K8wXY+aPVdCS/GOEElMzItliHkhh
	4cHbIkWz1nlGEEhgRAwWflPCdW1m3CjeaFoSdPzPIDSwzQYhtAjwFEYA0Pge9JLxh46cLA
	QiEf4HEDUW3i++mk4MNilgBDbr+Dh3qgK15AlTzVIbD2fvT7EdUZtx+gSTmteVD34b8126
	r03cjQh9ZvEwr1gozZi6u26Xa8tIeElvVNrWS0haNNvY2wAjN28S3+vaJpUZCg==
Date: Thu, 27 Feb 2025 15:50:56 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 christophe.leroy@csgroup.eu
Subject: Re: vmalloc_node_range for size 4198400 failed: Address range
 restricted to 0xf1000000 - 0xf5110000 (kernel 6.14-rc4, ppc32)
Message-ID: <20250227155056.417e29ae@yea>
In-Reply-To: <87y0xsotrn.fsf@gmail.com>
References: <20250227013431.11d1adb7@yea>
	<87y0xsotrn.fsf@gmail.com>
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/FFGDrwnqxdIzAwmjoZW2jTs"
X-MBO-RS-META: 6bndj7b8r7mq33g68n38aq1fjnruiigc
X-MBO-RS-ID: c65082caada1a60f497
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--MP_/FFGDrwnqxdIzAwmjoZW2jTs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, 27 Feb 2025 10:42:44 +0530
Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:

> Since only the swapon failed, I think you might still have the console
> up right? So this is mostly a vmalloc allocation failure report?

Correct. The machine stays usable via VNC in my case, even after the vmalloc allocation failure.

> Though above are mainly the physical mem info printed, but vmalloc can
> also fail sometimes (e.g. this report), it is nice if we can print how
> much of vmalloc space is free out of vmalloc total in show_mem() here.
> 
> Maybe linux-mm can tell if we should add this diff change for future?
> 
> diff --git a/mm/show_mem.c b/mm/show_mem.c
> index 43afb56abbd3..b3af59fced02 100644
> --- a/mm/show_mem.c
> +++ b/mm/show_mem.c
> @@ -14,6 +14,7 @@
>  #include <linux/mmzone.h>
>  #include <linux/swap.h>
>  #include <linux/vmstat.h>
> +#include <linux/vmalloc.h>
> 
>  #include "internal.h"
>  #include "swap.h"
> @@ -416,6 +417,8 @@ void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
>         printk("%lu pages RAM\n", total);
>         printk("%lu pages HighMem/MovableOnly\n", highmem);
>         printk("%lu pages reserved\n", reserved);
> +       printk("%lu pages Vmalloc Total\n", (unsigned long)VMALLOC_TOTAL >> PAGE_SHIFT);
> +       printk("%lu pages Vmalloc Used\n", vmalloc_nr_pages());
>  #ifdef CONFIG_CMA
>         printk("%lu pages cma reserved\n", totalcma_pages);
>  #endif

I applied your patch and now get this output:

[...]
vmalloc_node_range for size 1196032 failed: Address range restricted to 0xf1000000 - 0xf5110000
modprobe: vmalloc error: size 1189956, vm_struct allocation failed, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
CPU: 1 UID: 0 PID: 1853 Comm: modprobe Tainted: G        W          6.14.0-rc4-PMacG4-dirty #9
Tainted: [W]=WARN
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[f427b850] [c14cfe28] dump_stack_lvl+0x70/0x8c (unreliable)
[f427b870] [c04fba74] warn_alloc+0x154/0x2b8
[f427b930] [c04dea08] __vmalloc_node_range_noprof+0x154/0x958
[f427ba00] [c04df2f8] __vmalloc_node_noprof+0xec/0xf4
[f427ba40] [c062da4c] kernel_read_file+0x514/0x7a0
[f427baf0] [c01ee5d4] init_module_from_file+0xb0/0x108
[f427bbd0] [c01eed04] sys_finit_module+0x390/0x7a4
[f427bca0] [c001e574] system_call_exception+0x2dc/0x420
[f427bf30] [c00291ac] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0x321334
NIP:  00321334 LR: 005c9340 CTR: 002ad944
REGS: f427bf40 TRAP: 0c00   Tainted: G        W           (6.14.0-rc4-PMacG4-dirty)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 2822242c  XER: 20000000

GPR00: 00000161 afb2c9e0 a7a03540 00000001 005d6a48 00000000 afb2c9b5 0000007f 
GPR08: 00000000 af3da4b8 00000000 00000008 00000003 005efe10 2422242c 00000000 
GPR16: 00040000 00000000 00000000 00000000 00750610 00000000 00751a30 00000000 
GPR24: 00750610 00000000 005d6a48 00751330 00040000 00000000 005f7aac 00750610 
NIP [00321334] 0x321334
LR [005c9340] 0x5c9340
--- interrupt: c00
Mem-Info:
active_anon:16715 inactive_anon:0 isolated_anon:0
 active_file:25985 inactive_file:12645 isolated_file:0
 unevictable:0 dirty:23 writeback:0
 slab_reclaimable:2378 slab_unreclaimable:22874
 mapped:14774 shmem:155 pagetables:355
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:388018 free_pcp:426 free_cma:0
Node 0 active_anon:66860kB inactive_anon:0kB active_file:103940kB inactive_file:50580kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:59096kB dirty:92kB writeback:0kB shmem:620kB writeback_tmp:0kB kernel_stack:3008kB pagetables:1420kB sec_pagetables:0kB all_unreclaimable? no
DMA free:566884kB boost:0kB min:3380kB low:4224kB high:5068kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:4kB inactive_file:28264kB unevictable:0kB writepending:80kB present:786432kB managed:716496kB mlocked:0kB bounce:0kB free_pcp:1704kB local_pcp:1304kB free_cma:0kB
lowmem_reserve[]: 0 0 1184 0
DMA: 43*4kB (U) 29*8kB (UM) 21*16kB (UE) 41*32kB (UME) 9*64kB (UME) 6*128kB (UE) 3*256kB (UE) 3*512kB (UM) 6*1024kB (UME) 5*2048kB (UM) 133*4096kB (M) = 566852kB
38772 total pagecache pages
0 pages in swap cache
Free swap  = 8388604kB
Total swap = 8388604kB
524288 pages RAM
327680 pages HighMem/MovableOnly
42060 pages reserved
16656 pages Vmalloc Total
6771 pages Vmalloc Used
Memory allocations:
     124 MiB    31813 mm/readahead.c:187 func:ractl_alloc_folio
    88.6 MiB     7937 mm/slub.c:2423 func:alloc_slab_page
    50.3 MiB    12883 ./include/linux/highmem.h:229 func:vma_alloc_zeroed_movable_folio
    26.5 MiB     6781 mm/filemap.c:1970 func:__filemap_get_folio
    14.5 MiB     3714 mm/memory.c:1063 func:folio_prealloc
    12.3 MiB     3280 mm/execmem.c:44 func:execmem_vmalloc
    9.22 MiB     2360 mm/kasan/shadow.c:304 func:kasan_populate_vmalloc_pte
    5.44 MiB      348 lib/stackdepot.c:627 func:stack_depot_save_flags
    4.40 MiB      531 mm/slub.c:2425 func:alloc_slab_page
    4.01 MiB     1025 mm/swap_cgroup.c:140 func:swap_cgroup_swapon
vmalloc_node_range for size 1196032 failed: Address range restricted to 0xf1000000 - 0xf5110000
vmalloc_node_range for size 1196032 failed: Address range restricted to 0xf1000000 - 0xf5110000
[...]

Looks like there would be still Vmalloc pages free though? 6771 used vs. 16656 total.

Also it seems more clear I get this vmalloc error at the module loading stage during bootup. For my original report the rather big btrfs module got pulled in at boot so I got the vmalloc failure instantly.

Now the machine boots up ok, but as soon as some module gets loaded, e.g. nfs via mounting a remote directory I get the failure. This is the case for both INLINE_KASAN and OUTLINE_KASAN. Maybe for my original report the btrfs module was not loaded for my OUTLINE_KASAN boot so I got no hit early. Doesn't seem to be 100% deterministic what modules get loaded in what order.

> But meanwhile below data can give more details about the vmalloc area.
> 
> 1. cat /proc/vmallocinfo   
> 2. cat /proc/meminfo

Did that, with "no_hash_pointers" used and for both INLINE and OUTLINE KASAN as suggested by Christophe. Both after I get the vmalloc failure after mounting a remote NFS directory. See attached files.

For completeness also the OUTLINE_KASAN vmalloc failure:
[...]
vmalloc_node_range for size 839680 failed: Address range restricted to 0xf1000000 - 0xf5110000
modprobe: vmalloc error: size 832096, vm_struct allocation failed, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
CPU: 0 UID: 0 PID: 1857 Comm: modprobe Tainted: G        W          6.14.0-rc4-PMacG4-dirty #10
Tainted: [W]=WARN
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[f34db980] [c09e7f34] dump_stack_lvl+0x70/0x8c (unreliable)
[f34db9a0] [c02887a4] warn_alloc+0x154/0x208
[f34dba60] [c027a308] __vmalloc_node_range_noprof+0x144/0x530
[f34dbb10] [c027a770] __vmalloc_node_noprof+0x7c/0x84
[f34dbb50] [c032a0d4] kernel_read_file+0x314/0x440
[f34dbbf0] [c0102918] init_module_from_file+0xb0/0x108
[f34dbcd0] [c0102d7c] sys_finit_module+0x1d0/0x37c
[f34dbda0] [c00138b8] system_call_exception+0x154/0x1b8
[f34dbf30] [c001a1ac] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0x491334
NIP:  00491334 LR: 00739340 CTR: 0041d944
REGS: f34dbf40 TRAP: 0c00   Tainted: G        W           (6.14.0-rc4-PMacG4-dirty)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 2822242c  XER: 20000000

GPR00: 00000161 af942800 a7fae540 00000001 00746a48 00000000 af9427d5 0000007f 
GPR08: 00000000 aea582d8 00000000 00000008 00000003 0075fe10 2422242c 00000000 
GPR16: 00040000 00000000 00000000 00000000 00ee8610 00000000 00ee9a30 00000000 
GPR24: 00ee8610 00000000 00746a48 00ee9330 00040000 00000000 00767aac 00ee8610 
NIP [00491334] 0x491334
LR [00739340] 0x739340
--- interrupt: c00
Mem-Info:
active_anon:16937 inactive_anon:0 isolated_anon:0
 active_file:25969 inactive_file:11637 isolated_file:0
 unevictable:0 dirty:21 writeback:0
 slab_reclaimable:2396 slab_unreclaimable:23326
 mapped:14784 shmem:155 pagetables:353
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:392772 free_pcp:777 free_cma:0
Node 0 active_anon:67748kB inactive_anon:0kB active_file:103876kB inactive_file:46548kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:59136kB dirty:84kB writeback:0kB shmem:620kB writeback_tmp:0kB kernel_stack:3216kB pagetables:1412kB sec_pagetables:0kB all_unreclaimable? no
DMA free:576744kB boost:0kB min:3412kB low:4264kB high:5116kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:4kB inactive_file:28408kB unevictable:0kB writepending:80kB present:786432kB managed:729040kB mlocked:0kB bounce:0kB free_pcp:3108kB local_pcp:1788kB free_cma:0kB
lowmem_reserve[]: 0 0 1184 0
DMA: 0*4kB 2*8kB (UM) 5*16kB (UM) 36*32kB (UM) 15*64kB (UME) 2*128kB (ME) 3*256kB (UM) 2*512kB (UM) 3*1024kB (ME) 4*2048kB (UM) 137*4096kB (M) = 576672kB
37789 total pagecache pages
0 pages in swap cache
Free swap  = 8388604kB
Total swap = 8388604kB
524288 pages RAM
327680 pages HighMem/MovableOnly
38924 pages reserved
16656 pages Vmalloc Total
5814 pages Vmalloc Used
Memory allocations:
     120 MiB    30794 mm/readahead.c:187 func:ractl_alloc_folio
    90.4 MiB     8145 mm/slub.c:2423 func:alloc_slab_page
    50.6 MiB    12941 ./include/linux/highmem.h:229 func:vma_alloc_zeroed_movable_folio
    26.6 MiB     6819 mm/filemap.c:1970 func:__filemap_get_folio
    15.0 MiB     3837 mm/memory.c:1063 func:folio_prealloc
    8.71 MiB     2230 mm/kasan/shadow.c:304 func:kasan_populate_vmalloc_pte
    8.34 MiB     2276 mm/execmem.c:44 func:execmem_vmalloc
    5.14 MiB      329 lib/stackdepot.c:627 func:stack_depot_save_flags
    4.42 MiB      531 mm/slub.c:2425 func:alloc_slab_page
    4.01 MiB     1025 mm/swap_cgroup.c:140 func:swap_cgroup_swapon
vmalloc_node_range for size 839680 failed: Address range restricted to 0xf1000000 - 0xf5110000
vmalloc_node_range for size 839680 failed: Address range restricted to 0xf1000000 - 0xf5110000
[...]

Regards,
Erhard

--MP_/FFGDrwnqxdIzAwmjoZW2jTs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=vmallocinfo-outline_kasan.txt

0xbea20000-0xbea22000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xbea22000-0xbea24000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xbea24000-0xbea40000  114688 load_module+0x12ac/0x2318 pages=27 vmalloc
0xbea40000-0xbea43000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xbea43000-0xbea5b000   98304 load_module+0x12ac/0x2318 pages=23 vmalloc
0xbea5b000-0xbea5d000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xbea5d000-0xbea60000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xbea60000-0xbea6e000   57344 load_module+0x12ac/0x2318 pages=13 vmalloc
0xbea6e000-0xbea71000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xbea71000-0xbea74000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xbea74000-0xbea77000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xbea77000-0xbea7a000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xbea7a000-0xbea7c000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xbea7c000-0xbea8c000   65536 load_module+0x12ac/0x2318 pages=15 vmalloc
0xbea8c000-0xbea93000   28672 load_module+0x12ac/0x2318 pages=6 vmalloc
0xbea93000-0xbeaa9000   90112 load_module+0x12ac/0x2318 pages=21 vmalloc
0xbeaa9000-0xbeaab000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xbeaab000-0xbeab1000   24576 load_module+0x12ac/0x2318 pages=5 vmalloc
0xbeab3000-0xbebbc000 1085440 load_module+0x12ac/0x2318 pages=264 vmalloc
0xbebbc000-0xbebc1000   20480 load_module+0x12ac/0x2318 pages=4 vmalloc
0xbebc1000-0xbebc8000   28672 load_module+0x12ac/0x2318 pages=6 vmalloc
0xbebc8000-0xbebca000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xbebca000-0xbebce000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xbebce000-0xbecf4000 1204224 load_module+0x12ac/0x2318 pages=293 vmalloc
0xbecf4000-0xbecf6000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xbecf6000-0xbed06000   65536 load_module+0x12ac/0x2318 pages=15 vmalloc
0xbed06000-0xbed0f000   36864 load_module+0x12ac/0x2318 pages=8 vmalloc
0xbed0f000-0xbed11000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xbed11000-0xbed13000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xbed13000-0xbed17000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xbed17000-0xbed1a000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xbed1a000-0xbed1d000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xbed1d000-0xbef1e000 2101248 bpf_prog_pack_alloc+0x148/0x284 pages=512 vmalloc
0xbef1e000-0xbef22000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xbef22000-0xbef78000  352256 load_module+0x12ac/0x2318 pages=85 vmalloc
0xbef78000-0xbef85000   53248 load_module+0x12ac/0x2318 pages=12 vmalloc
0xbef85000-0xbefc2000  249856 load_module+0x12ac/0x2318 pages=60 vmalloc
0xbefc2000-0xbefc4000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xbefc6000-0xbefd6000   65536 load_module+0x12ac/0x2318 pages=15 vmalloc
0xbefd6000-0xbf003000  184320 load_module+0x12ac/0x2318 pages=44 vmalloc
0xbf003000-0xbf006000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf1000000-0xf1002000    8192 text_area_cpu_up+0x20/0x190
0xf1002000-0xf1004000    8192 __ioremap_caller+0x124/0x198 phys=0x80041000 ioremap
0xf1004000-0xf1008000   16384 __ioremap_caller+0x124/0x198 phys=0x80041000 ioremap
0xf1008000-0xf100d000   20480 init_IRQ+0x74/0x1ac pages=4 vmalloc
0xf100d000-0xf100f000    8192 __ioremap_caller+0x124/0x198 phys=0x80060000 ioremap
0xf1010000-0xf1015000   20480 init_IRQ+0xa0/0x1ac pages=4 vmalloc
0xf1015000-0xf1017000    8192 __ioremap_caller+0x124/0x198 phys=0x80061000 ioremap
0xf1018000-0xf101d000   20480 init_IRQ+0x74/0x1ac pages=4 vmalloc
0xf101d000-0xf101f000    8192 __ioremap_caller+0x124/0x198 phys=0x80050000 ioremap
0xf1020000-0xf1025000   20480 init_IRQ+0xa0/0x1ac pages=4 vmalloc
0xf1025000-0xf1027000    8192 __ioremap_caller+0x124/0x198 phys=0x80018000 ioremap
0xf1028000-0xf102d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf102d000-0xf102f000    8192 text_area_cpu_up+0x20/0x190
0xf1030000-0xf1035000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1035000-0xf1037000    8192 __ioremap_caller+0x124/0x198 phys=0xf0800000 ioremap
0xf1038000-0xf103c000   16384 __ioremap_caller+0x124/0x198 phys=0xf8001000 ioremap
0xf103c000-0xf103e000    8192 __ioremap_caller+0x124/0x198 phys=0xf0c00000 ioremap
0xf103e000-0xf1040000    8192 __ioremap_caller+0x124/0x198 phys=0xf2800000 ioremap
0xf1040000-0xf1045000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1045000-0xf1047000    8192 __ioremap_caller+0x124/0x198 phys=0xf2c00000 ioremap
0xf1048000-0xf104d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf104d000-0xf104f000    8192 __ioremap_caller+0x124/0x198 phys=0xf4800000 ioremap
0xf1050000-0xf1055000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1055000-0xf1057000    8192 __ioremap_caller+0x124/0x198 phys=0xf4c00000 ioremap
0xf1058000-0xf105d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf105d000-0xf105f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1060000-0xf1065000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1065000-0xf1068000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf106d000-0xf106f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1070000-0xf1075000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1075000-0xf1077000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1078000-0xf107d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf107d000-0xf1080000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf1080000-0xf1085000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1085000-0xf1087000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1088000-0xf108d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf108d000-0xf108f000    8192 __ioremap_caller+0x124/0x198 phys=0xa07ff000 ioremap
0xf1090000-0xf1095000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1095000-0xf1097000    8192 __ioremap_caller+0x124/0x198 phys=0x80082000 ioremap
0xf1098000-0xf109d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf109d000-0xf109f000    8192 __ioremap_caller+0x124/0x198 phys=0xf5006000 ioremap
0xf10a0000-0xf10a5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10a5000-0xf10a7000    8192 __ioremap_caller+0x124/0x198 phys=0xf5005000 ioremap
0xf10a8000-0xf10ad000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10ad000-0xf10af000    8192 __ioremap_caller+0x124/0x198 phys=0xf5004000 ioremap
0xf10b0000-0xf10b5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10b5000-0xf10b7000    8192 __ioremap_caller+0x124/0x198 phys=0x8001f000 ioremap
0xf10b8000-0xf10bd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10bd000-0xf10bf000    8192 __ioremap_caller+0x124/0x198 phys=0x80020000 ioremap
0xf10c0000-0xf10c5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10c5000-0xf10c7000    8192 __ioremap_caller+0x124/0x198 phys=0x80081000 ioremap
0xf10c8000-0xf10cd000   20480 fork_idle+0xcc/0x1bc pages=4 vmalloc
0xf10cd000-0xf10cf000    8192 __ioremap_caller+0x124/0x198 phys=0x80080000 ioremap
0xf10d0000-0xf10d5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10d5000-0xf10d8000   12288 pcpu_mem_zalloc+0x120/0x150 pages=2 vmalloc
0xf10d8000-0xf10dd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10dd000-0xf10e0000   12288 pcpu_mem_zalloc+0x120/0x150 pages=2 vmalloc
0xf10e0000-0xf10e5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10e5000-0xf10e8000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf10e8000-0xf10ed000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10ed000-0xf10ef000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf10f0000-0xf10f5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10f5000-0xf10f7000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf10f8000-0xf10fd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf10fd000-0xf10ff000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1105000-0xf1107000    8192 __ioremap_caller+0x124/0x198 phys=0x8008c000 ioremap
0xf1108000-0xf110d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf110d000-0xf110f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1110000-0xf1115000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1115000-0xf1117000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1118000-0xf111d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf111d000-0xf111f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1120000-0xf1125000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1125000-0xf1127000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1128000-0xf112d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf112d000-0xf112f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1130000-0xf1135000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1135000-0xf1138000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf1138000-0xf113d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf113d000-0xf113f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1140000-0xf1145000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1145000-0xf1147000    8192 __ioremap_caller+0x124/0x198 phys=0x8008b000 ioremap
0xf1148000-0xf114d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf114d000-0xf114f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1150000-0xf1155000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1155000-0xf1158000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf1158000-0xf115d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf115d000-0xf115f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1160000-0xf1165000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1165000-0xf1167000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1168000-0xf116d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf116d000-0xf1170000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf1170000-0xf1175000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1175000-0xf1177000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1178000-0xf117d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf117d000-0xf117f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1180000-0xf1981000 8392704 __ioremap_caller+0x124/0x198 phys=0xf0000000 ioremap
0xf1981000-0xf198d000   49152 zisofs_init+0x64/0x100 pages=11 vmalloc
0xf198d000-0xf1990000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf1990000-0xf1995000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf1995000-0xf1997000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf1998000-0xf199d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf199d000-0xf199f000    8192 bpf_prog_alloc_no_stats+0x64/0x398 pages=1 vmalloc
0xf199f000-0xf19a1000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf19a1000-0xf19a8000   28672 load_module+0x12ac/0x2318 pages=6 vmalloc
0xf19a8000-0xf19ac000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xf19ad000-0xf19af000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf19b5000-0xf19b7000    8192 __ioremap_caller+0x124/0x198 phys=0x80084000 ioremap
0xf19b7000-0xf19ba000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf19ba000-0xf19bc000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf19bd000-0xf19c7000   40960 load_module+0x12ac/0x2318 pages=9 vmalloc
0xf19c8000-0xf19cd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf19cd000-0xf19d0000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf19d0000-0xf19d5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf19d5000-0xf19d7000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf19d8000-0xf19dd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf19dd000-0xf19df000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf19e0000-0xf19e5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf19e5000-0xf19e8000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf19e8000-0xf19ed000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf19ed000-0xf19ef000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf19f0000-0xf19f5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf19f6000-0xf19f9000   12288 __ioremap_caller+0x124/0x198 phys=0x80008000 ioremap
0xf19fa000-0xf19fd000   12288 __ioremap_caller+0x124/0x198 phys=0x80008000 ioremap
0xf19fd000-0xf1a00000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf1a00000-0xf2201000 8392704 __ioremap_caller+0x124/0x198 phys=0xf2000000 ioremap
0xf2201000-0xf2206000   20480 load_module+0x12ac/0x2318 pages=4 vmalloc
0xf2206000-0xf2208000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2208000-0xf220d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf220d000-0xf220f000    8192 __ioremap_caller+0x124/0x198 phys=0x80010000 ioremap
0xf2210000-0xf2215000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2215000-0xf2217000    8192 __ioremap_caller+0x124/0x198 phys=0x80008000 ioremap
0xf221d000-0xf2222000   20480 load_module+0x12ac/0x2318 pages=4 vmalloc
0xf2222000-0xf2227000   20480 load_module+0x12ac/0x2318 pages=4 vmalloc
0xf2228000-0xf222d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf222d000-0xf222f000    8192 __ioremap_caller+0x124/0x198 phys=0x80083000 ioremap
0xf222f000-0xf2233000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xf2233000-0xf2235000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2235000-0xf2237000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2238000-0xf223d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf223d000-0xf2240000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2240000-0xf2245000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2245000-0xf224d000   32768 load_module+0x12ac/0x2318 pages=7 vmalloc
0xf224d000-0xf2250000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2250000-0xf2255000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2255000-0xf2257000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2258000-0xf225d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf225d000-0xf225f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2260000-0xf2265000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2265000-0xf2267000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2268000-0xf226d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf226d000-0xf2270000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2270000-0xf2275000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2275000-0xf2277000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2278000-0xf227d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf227d000-0xf227f000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2280000-0xf2a81000 8392704 __ioremap_caller+0x124/0x198 phys=0xf4000000 ioremap
0xf2a81000-0xf2d90000 3207168 alloc_tag_init+0xdc/0x3fc pages=6 vmalloc
0xf2d90000-0xf2ddb000  307200 pcpu_mem_zalloc+0x120/0x150 pages=74 vmalloc
0xf2ddb000-0xf2ddf000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xf2de0000-0xf2de5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2de5000-0xf2de7000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2de7000-0xf2de9000    8192 fw_decompress_zstd+0x1e8/0x2d8 pages=1 vmalloc
0xf2de9000-0xf2deb000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2deb000-0xf2ded000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2ded000-0xf2dfb000   57344 load_module+0x12ac/0x2318 pages=13 vmalloc
0xf2dfb000-0xf2dff000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xf2e00000-0xf2e11000   69632 __ioremap_caller+0x124/0x198 phys=0x90000000 ioremap
0xf2e11000-0xf2e14000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2e14000-0xf2e16000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2e16000-0xf2e18000    8192 __ioremap_caller+0x124/0x198 phys=0xf5000000 ioremap
0xf2e18000-0xf2e1b000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2e1b000-0xf2e1d000    8192 bpf_prog_alloc_no_stats+0x64/0x398 pages=1 vmalloc
0xf2e1d000-0xf2e24000   28672 load_module+0x12ac/0x2318 pages=6 vmalloc
0xf2e24000-0xf2e29000   20480 load_module+0x12ac/0x2318 pages=4 vmalloc
0xf2e29000-0xf2e2e000   20480 load_module+0x12ac/0x2318 pages=4 vmalloc
0xf2e2e000-0xf2e33000   20480 load_module+0x12ac/0x2318 pages=4 vmalloc
0xf2e33000-0xf2e36000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2e36000-0xf2e38000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2e38000-0xf2e3d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2e3d000-0xf2e7a000  249856 load_module+0x12ac/0x2318 pages=60 vmalloc
0xf2e7a000-0xf2eb0000  221184 load_module+0x12ac/0x2318 pages=53 vmalloc
0xf2eb0000-0xf2eb5000   20480 load_module+0x12ac/0x2318 pages=4 vmalloc
0xf2eb5000-0xf2eb7000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2eb7000-0xf2eba000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2eba000-0xf2ebc000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2ebc000-0xf2ebf000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2ec0000-0xf2ec5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2ec5000-0xf2ec8000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2ec8000-0xf2ecd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2ecd000-0xf2ecf000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2ecf000-0xf2ed1000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2ed1000-0xf2ed3000    8192 bpf_prog_alloc_no_stats+0x64/0x398 pages=1 vmalloc
0xf2ed3000-0xf2ed5000    8192 bpf_prog_alloc_no_stats+0x64/0x398 pages=1 vmalloc
0xf2ed5000-0xf2ed8000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2ed8000-0xf2eda000    8192 bpf_prog_alloc_no_stats+0x64/0x398 pages=1 vmalloc
0xf2eda000-0xf2edc000    8192 bpf_prog_alloc_no_stats+0x64/0x398 pages=1 vmalloc
0xf2edc000-0xf2ee0000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf2ee1000-0xf2ee3000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2ee4000-0xf2eef000   45056 ar_context_init+0x194/0x2a4 [firewire_ohci] vmap
0xf2eef000-0xf2efa000   45056 ar_context_init+0x194/0x2a4 [firewire_ohci] vmap
0xf2efa000-0xf2efe000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xf2efe000-0xf2f00000    8192 bpf_prog_alloc_no_stats+0x64/0x398 pages=1 vmalloc
0xf2f00000-0xf2f05000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2f05000-0xf2f07000    8192 bpf_prog_alloc_no_stats+0x64/0x398 pages=1 vmalloc
0xf2f07000-0xf2f09000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2f09000-0xf2f0b000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2f0b000-0xf2f0f000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf2f10000-0xf2f15000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2f15000-0xf2f17000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2f18000-0xf2f1d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2f1d000-0xf2f9e000  528384 radeon_gart_init+0xe4/0x274 [radeon] pages=128 vmalloc
0xf2f9e000-0xf2fa0000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2fa0000-0xf2fa5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2fa5000-0xf2fa8000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2fa8000-0xf2fad000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2fad000-0xf2fb5000   32768 load_module+0x12ac/0x2318 pages=7 vmalloc
0xf2fb5000-0xf2fb8000   12288 load_module+0x12ac/0x2318 pages=2 vmalloc
0xf2fb8000-0xf2fbd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2fbd000-0xf2fc1000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf2fc1000-0xf2fc3000    8192 load_module+0x12ac/0x2318 pages=1 vmalloc
0xf2fc8000-0xf2fcd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf2fcd000-0xf2fde000   69632 load_module+0x12ac/0x2318 pages=16 vmalloc
0xf2fe5000-0xf2fe9000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xf2fe9000-0xf2ff8000   61440 load_module+0x12ac/0x2318 pages=14 vmalloc
0xf2ff8000-0xf2ffd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3000000-0xf3005000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3005000-0xf300e000   36864 load_module+0x12ac/0x2318 pages=8 vmalloc
0xf3010000-0xf3015000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf301d000-0xf3021000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf3021000-0xf3025000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf3025000-0xf3029000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xf302d000-0xf3033000   24576 load_module+0x12ac/0x2318 pages=5 vmalloc
0xf3033000-0xf3037000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xf303d000-0xf3041000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf3046000-0xf3049000   12288 __ioremap_caller+0x124/0x198 phys=0x80008000 ioremap
0xf3049000-0xf304d000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf304d000-0xf3055000   32768 load_module+0x12ac/0x2318 pages=7 vmalloc
0xf3055000-0xf305d000   32768 load_module+0x12ac/0x2318 pages=7 vmalloc
0xf3060000-0xf3065000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3070000-0xf3075000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3080000-0xf3281000 2101248 __ioremap_caller+0x124/0x198 phys=0xf5200000 ioremap
0xf3281000-0xf3382000 1052672 radeon_gart_init+0x1b4/0x274 [radeon] pages=256 vmalloc
0xf3382000-0xf3483000 1052672 ttm_bo_kmap+0x28c/0x35c [ttm]
0xf3483000-0xf3487000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf3487000-0xf3496000   61440 load_module+0x12ac/0x2318 pages=14 vmalloc
0xf349d000-0xf34a1000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf34a1000-0xf34a5000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf34a5000-0xf34b5000   65536 load_module+0x12ac/0x2318 pages=15 vmalloc
0xf34c8000-0xf34cd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf34ed000-0xf34f1000   16384 n_tty_open+0x3c/0x13c pages=3 vmalloc
0xf34f8000-0xf34fd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3520000-0xf3525000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3528000-0xf352d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf353d000-0xf357e000  266240 load_module+0x12ac/0x2318 pages=64 vmalloc
0xf357e000-0xf35f6000  491520 load_module+0x12ac/0x2318 pages=119 vmalloc
0xf3618000-0xf361d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3620000-0xf3625000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3630000-0xf3635000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3638000-0xf363d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3640000-0xf3645000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3648000-0xf364d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3650000-0xf3655000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3658000-0xf365d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3660000-0xf3665000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3668000-0xf366d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf366d000-0xf3683000   90112 load_module+0x12ac/0x2318 pages=21 vmalloc
0xf3688000-0xf368d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3690000-0xf3695000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3698000-0xf369d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf36a0000-0xf36a5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf36a8000-0xf36ad000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf36b8000-0xf36bd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf36c8000-0xf36cd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf36cd000-0xf37ce000 1052672 ttm_bo_kmap+0x28c/0x35c [ttm]
0xf3802000-0xf3823000  135168 crypto_scomp_init_tfm+0x78/0x20c pages=32 vmalloc
0xf3823000-0xf3844000  135168 crypto_scomp_init_tfm+0x104/0x20c pages=32 vmalloc
0xf3844000-0xf3865000  135168 crypto_scomp_init_tfm+0x78/0x20c pages=32 vmalloc
0xf3865000-0xf3886000  135168 crypto_scomp_init_tfm+0x104/0x20c pages=32 vmalloc
0xf3886000-0xf39c5000 1306624 __zstd_init+0xbc/0x298 pages=318 vmalloc
0xf39c5000-0xf39de000  102400 __zstd_init+0x1c0/0x298 pages=24 vmalloc
0xf39de000-0xf3b1d000 1306624 __zstd_init+0xbc/0x298 pages=318 vmalloc
0xf3b1d000-0xf3b36000  102400 __zstd_init+0x1c0/0x298 pages=24 vmalloc
0xf3b38000-0xf3b3d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3c08000-0xf3c0d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3c28000-0xf3c2d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3c38000-0xf3c3d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3c48000-0xf3c4d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3c50000-0xf3c55000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3c58000-0xf3c5d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3c60000-0xf3c65000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3c68000-0xf3c6d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3c70000-0xf3c75000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3c80000-0xf3c85000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3cb0000-0xf3cb5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3cb8000-0xf3cbd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3cc0000-0xf3cc5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3cd0000-0xf3cd5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf3cd5000-0xf3ed6000 2101248 sys_swapon+0x9a4/0x1770 pages=512 vmalloc
0xf3ed6000-0xf42d7000 4198400 swap_cgroup_swapon+0x50/0x100 pages=1024 vmalloc
0xf42d8000-0xf42dd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf42f8000-0xf42fd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4308000-0xf430d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4320000-0xf4325000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4330000-0xf4335000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4338000-0xf433d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4340000-0xf4345000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4348000-0xf434d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4350000-0xf4355000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4358000-0xf435d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4360000-0xf4365000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4380000-0xf4385000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4388000-0xf438d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf43c0000-0xf43c5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf43c8000-0xf43cd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf43e8000-0xf43ed000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf43f0000-0xf43f5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf43f8000-0xf43fd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4400000-0xf4405000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4410000-0xf4415000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4418000-0xf441d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4420000-0xf4425000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4428000-0xf442d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4430000-0xf4435000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4440000-0xf4445000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4448000-0xf444d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4450000-0xf4455000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4458000-0xf445d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4460000-0xf4465000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4468000-0xf446d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4478000-0xf447d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4488000-0xf448d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4496000-0xf449f000   36864 load_module+0x12ac/0x2318 pages=8 vmalloc
0xf449f000-0xf44a9000   40960 load_module+0x12ac/0x2318 pages=9 vmalloc
0xf44b0000-0xf44b5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf44c0000-0xf44c5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf44c8000-0xf44cc000   16384 load_module+0x12ac/0x2318 pages=3 vmalloc
0xf44d0000-0xf44d5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf44d8000-0xf44dd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf44e0000-0xf44e5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf44e8000-0xf44ed000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf44f0000-0xf44f5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf44f8000-0xf44fd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4500000-0xf4cea000 8298496 __ioremap_caller+0x124/0x198 phys=0xa0040000 ioremap
0xf4cf0000-0xf4cf5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4cf8000-0xf4cfd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d00000-0xf4d05000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d08000-0xf4d0d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d10000-0xf4d15000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d18000-0xf4d1d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d20000-0xf4d25000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d28000-0xf4d2d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d30000-0xf4d35000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d38000-0xf4d3d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d40000-0xf4d45000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d48000-0xf4d4d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d58000-0xf4d5d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d60000-0xf4d65000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4d88000-0xf4d8d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4db0000-0xf4db5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4df0000-0xf4df5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4df8000-0xf4dfd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e00000-0xf4e05000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e08000-0xf4e0d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e10000-0xf4e15000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e40000-0xf4e45000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e48000-0xf4e4d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e50000-0xf4e55000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e58000-0xf4e5d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e60000-0xf4e65000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e68000-0xf4e6d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e70000-0xf4e75000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e78000-0xf4e7d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e80000-0xf4e85000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e88000-0xf4e8d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e90000-0xf4e95000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4e98000-0xf4e9d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4ea8000-0xf4ead000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4eb0000-0xf4eb5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4ee0000-0xf4ee5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4ef8000-0xf4efd000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4f9c000-0xf4fb2000   90112 load_module+0x12ac/0x2318 pages=21 vmalloc
0xf4fb2000-0xf4fc4000   73728 load_module+0x12ac/0x2318 pages=17 vmalloc
0xf4fe0000-0xf4fe5000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf4fe8000-0xf4fed000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf5078000-0xf507d000   20480 kernel_clone+0xbc/0x2e4 pages=4 vmalloc
0xf50c6000-0xf5110000  303104 pcpu_get_vm_areas+0x0/0x182c vmalloc
0xf1068000-0xf106d000   20480 unpurged vm_area
0xf1100000-0xf1105000   20480 unpurged vm_area
0xf19b0000-0xf19b5000   20480 unpurged vm_area
0xf2218000-0xf221d000   20480 unpurged vm_area
0xf2fe0000-0xf2fe5000   20480 unpurged vm_area
0xf3068000-0xf306d000   20480 unpurged vm_area
0xf3498000-0xf349d000   20480 unpurged vm_area
0xf34b8000-0xf34bd000   20480 unpurged vm_area
0xf34d0000-0xf34d5000   20480 unpurged vm_area
0xf34d8000-0xf34dd000   20480 unpurged vm_area
0xf34e0000-0xf34e5000   20480 unpurged vm_area
0xf3500000-0xf3505000   20480 unpurged vm_area
0xf3508000-0xf350d000   20480 unpurged vm_area
0xf3510000-0xf3515000   20480 unpurged vm_area
0xf3530000-0xf3535000   20480 unpurged vm_area
0xf3538000-0xf353d000   20480 unpurged vm_area
0xf35f8000-0xf35fd000   20480 unpurged vm_area
0xf3600000-0xf3605000   20480 unpurged vm_area
0xf3608000-0xf360d000   20480 unpurged vm_area
0xf36c0000-0xf36c5000   20480 unpurged vm_area
0xf4d50000-0xf4d55000   20480 unpurged vm_area
0xf4ea0000-0xf4ea5000   20480 unpurged vm_area
0xf4ee8000-0xf4eed000   20480 unpurged vm_area
0xf4ef0000-0xf4ef5000   20480 unpurged vm_area

--MP_/FFGDrwnqxdIzAwmjoZW2jTs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=vmallocinfo-inline_kasan.txt

0xbf541000-0xbf543000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xbf543000-0xbf545000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xbf545000-0xbf587000  270336 load_module+0x2f78/0x5850 pages=65 vmalloc
0xbf587000-0xbf58b000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xbf58b000-0xbf5bd000  204800 load_module+0x2f78/0x5850 pages=49 vmalloc
0xbf5bd000-0xbf5bf000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xbf5bf000-0xbf5c2000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xbf5c2000-0xbf5c7000   20480 load_module+0x2f78/0x5850 pages=4 vmalloc
0xbf5c7000-0xbf5e1000  106496 load_module+0x2f78/0x5850 pages=25 vmalloc
0xbf5e1000-0xbf5e5000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xbf5e5000-0xbf5e9000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xbf5e9000-0xbf5ed000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xbf5ed000-0xbf5f2000   20480 load_module+0x2f78/0x5850 pages=4 vmalloc
0xbf5f2000-0xbf610000  122880 load_module+0x2f78/0x5850 pages=29 vmalloc
0xbf610000-0xbf61e000   57344 load_module+0x2f78/0x5850 pages=13 vmalloc
0xbf61e000-0xbf64e000  196608 load_module+0x2f78/0x5850 pages=47 vmalloc
0xbf64e000-0xbf650000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xbf650000-0xbf65b000   45056 load_module+0x2f78/0x5850 pages=10 vmalloc
0xbf65b000-0xbf65d000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xbf65d000-0xbf8a4000 2387968 load_module+0x2f78/0x5850 pages=582 vmalloc
0xbf8a6000-0xbf8af000   36864 load_module+0x2f78/0x5850 pages=8 vmalloc
0xbf8af000-0xbf8b2000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xbf8b2000-0xbf8c2000   65536 load_module+0x2f78/0x5850 pages=15 vmalloc
0xbf8c2000-0xbf8c6000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xbf8c6000-0xbf8d0000   40960 load_module+0x2f78/0x5850 pages=9 vmalloc
0xbf8d0000-0xbfae3000 2174976 load_module+0x2f78/0x5850 pages=530 vmalloc
0xbfae3000-0xbfb02000  126976 load_module+0x2f78/0x5850 pages=30 vmalloc
0xbfb02000-0xbfb13000   69632 load_module+0x2f78/0x5850 pages=16 vmalloc
0xbfb13000-0xbfb16000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xbfb16000-0xbfb1c000   24576 load_module+0x2f78/0x5850 pages=5 vmalloc
0xbfb1c000-0xbfb22000   24576 load_module+0x2f78/0x5850 pages=5 vmalloc
0xbfb22000-0xbfb28000   24576 load_module+0x2f78/0x5850 pages=5 vmalloc
0xbfb28000-0xbfd29000 2101248 bpf_prog_pack_alloc+0x1ac/0x494 pages=512 vmalloc
0xbfd29000-0xbfd2f000   24576 load_module+0x2f78/0x5850 pages=5 vmalloc
0xbfd2f000-0xbfdf5000  811008 load_module+0x2f78/0x5850 pages=197 vmalloc
0xbfdf5000-0xbfe0f000  106496 load_module+0x2f78/0x5850 pages=25 vmalloc
0xbfe0f000-0xbfe8d000  516096 load_module+0x2f78/0x5850 pages=125 vmalloc
0xbfe8d000-0xbfe8f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xbfe8f000-0xbfeb1000  139264 load_module+0x2f78/0x5850 pages=33 vmalloc
0xbfeb1000-0xbff13000  401408 load_module+0x2f78/0x5850 pages=97 vmalloc
0xbff13000-0xbff16000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf1000000-0xf1002000    8192 text_area_cpu_up+0x20/0x190
0xf1002000-0xf1004000    8192 __ioremap_caller+0x194/0x278 phys=0x80041000 ioremap
0xf1004000-0xf1008000   16384 __ioremap_caller+0x194/0x278 phys=0x80041000 ioremap
0xf1008000-0xf100d000   20480 init_IRQ+0xc8/0x318 pages=4 vmalloc
0xf100d000-0xf100f000    8192 __ioremap_caller+0x194/0x278 phys=0x80060000 ioremap
0xf1010000-0xf1015000   20480 init_IRQ+0x12c/0x318 pages=4 vmalloc
0xf1015000-0xf1017000    8192 __ioremap_caller+0x194/0x278 phys=0x80061000 ioremap
0xf1018000-0xf101d000   20480 init_IRQ+0xc8/0x318 pages=4 vmalloc
0xf101d000-0xf101f000    8192 __ioremap_caller+0x194/0x278 phys=0x80050000 ioremap
0xf1020000-0xf1025000   20480 init_IRQ+0x12c/0x318 pages=4 vmalloc
0xf1025000-0xf1027000    8192 __ioremap_caller+0x194/0x278 phys=0x80018000 ioremap
0xf1028000-0xf102d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf102d000-0xf102f000    8192 text_area_cpu_up+0x20/0x190
0xf1030000-0xf1035000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1035000-0xf1037000    8192 __ioremap_caller+0x194/0x278 phys=0xf0800000 ioremap
0xf1038000-0xf103c000   16384 __ioremap_caller+0x194/0x278 phys=0xf8001000 ioremap
0xf103c000-0xf103e000    8192 __ioremap_caller+0x194/0x278 phys=0xf0c00000 ioremap
0xf103e000-0xf1040000    8192 __ioremap_caller+0x194/0x278 phys=0xf2800000 ioremap
0xf1040000-0xf1045000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1045000-0xf1047000    8192 __ioremap_caller+0x194/0x278 phys=0xf2c00000 ioremap
0xf1048000-0xf104d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf104d000-0xf104f000    8192 __ioremap_caller+0x194/0x278 phys=0xf4800000 ioremap
0xf1050000-0xf1055000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1055000-0xf1057000    8192 __ioremap_caller+0x194/0x278 phys=0xf4c00000 ioremap
0xf1058000-0xf105d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf105d000-0xf105f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1060000-0xf1065000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1065000-0xf1067000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf106d000-0xf106f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1070000-0xf1075000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1075000-0xf1078000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf1078000-0xf107d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf107d000-0xf107f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1080000-0xf1085000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1085000-0xf1087000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1088000-0xf108d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf108d000-0xf108f000    8192 __ioremap_caller+0x194/0x278 phys=0xa07ff000 ioremap
0xf1090000-0xf1095000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1095000-0xf1097000    8192 __ioremap_caller+0x194/0x278 phys=0x80082000 ioremap
0xf1098000-0xf109d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf109d000-0xf109f000    8192 __ioremap_caller+0x194/0x278 phys=0xf5006000 ioremap
0xf10a0000-0xf10a5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf10a5000-0xf10a7000    8192 __ioremap_caller+0x194/0x278 phys=0xf5005000 ioremap
0xf10a8000-0xf10ad000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf10ad000-0xf10af000    8192 __ioremap_caller+0x194/0x278 phys=0xf5004000 ioremap
0xf10b0000-0xf10b5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf10b5000-0xf10b7000    8192 __ioremap_caller+0x194/0x278 phys=0x8001f000 ioremap
0xf10b8000-0xf10bd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf10bd000-0xf10bf000    8192 __ioremap_caller+0x194/0x278 phys=0x80020000 ioremap
0xf10c0000-0xf10c5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf10c5000-0xf10c7000    8192 __ioremap_caller+0x194/0x278 phys=0x80081000 ioremap
0xf10c8000-0xf10cd000   20480 fork_idle+0xcc/0x2d8 pages=4 vmalloc
0xf10cd000-0xf10cf000    8192 __ioremap_caller+0x194/0x278 phys=0x80080000 ioremap
0xf10d0000-0xf10d5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf10d5000-0xf10d8000   12288 pcpu_mem_zalloc+0x1a0/0x24c pages=2 vmalloc
0xf10d8000-0xf10dd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf10dd000-0xf10e0000   12288 pcpu_mem_zalloc+0x1a0/0x24c pages=2 vmalloc
0xf10e0000-0xf10e5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf10e5000-0xf10e8000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf10e8000-0xf10ed000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf10ed000-0xf10ef000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf10f5000-0xf10f7000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf10fd000-0xf10ff000    8192 __ioremap_caller+0x194/0x278 phys=0x80010000 ioremap
0xf1100000-0xf1105000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1105000-0xf1107000    8192 __ioremap_caller+0x194/0x278 phys=0x8008c000 ioremap
0xf1108000-0xf110d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf110d000-0xf110f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1110000-0xf1115000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1115000-0xf1118000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf1118000-0xf111d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf111d000-0xf111f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1120000-0xf1125000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1125000-0xf1127000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1128000-0xf112d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf112d000-0xf112f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1130000-0xf1135000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1135000-0xf1138000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf1138000-0xf113d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf113d000-0xf113f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1140000-0xf1145000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1145000-0xf1147000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1148000-0xf114d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf114d000-0xf114f000    8192 __ioremap_caller+0x194/0x278 phys=0x8008b000 ioremap
0xf1150000-0xf1155000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1155000-0xf1158000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf1158000-0xf115d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf115d000-0xf115f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1165000-0xf1168000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf1168000-0xf116d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf116d000-0xf116f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1170000-0xf1175000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1175000-0xf1177000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1178000-0xf117d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf117d000-0xf117f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1180000-0xf1981000 8392704 __ioremap_caller+0x194/0x278 phys=0xf0000000 ioremap
0xf1981000-0xf198d000   49152 zisofs_init+0x90/0x188 pages=11 vmalloc
0xf198d000-0xf198f000    8192 __ioremap_caller+0x194/0x278 phys=0x80084000 ioremap
0xf1990000-0xf1995000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf1995000-0xf199f000   40960 load_module+0x2f78/0x5850 pages=9 vmalloc
0xf199f000-0xf19a3000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xf19a3000-0xf19a8000   20480 load_module+0x2f78/0x5850 pages=4 vmalloc
0xf19a8000-0xf19ad000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf19ad000-0xf19bb000   57344 load_module+0x2f78/0x5850 pages=13 vmalloc
0xf19bb000-0xf19c0000   20480 load_module+0x2f78/0x5850 pages=4 vmalloc
0xf19c0000-0xf19c5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf19c5000-0xf19c8000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf19c8000-0xf19cd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf19cd000-0xf19cf000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf19d0000-0xf19d5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf19d5000-0xf19d7000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf19d8000-0xf19dd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf19dd000-0xf19e0000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf19e0000-0xf19e5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf19e5000-0xf19e7000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf19e8000-0xf19ed000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf19ed000-0xf19ef000    8192 __ioremap_caller+0x194/0x278 phys=0x80083000 ioremap
0xf19f0000-0xf19f5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf19f6000-0xf19f9000   12288 __ioremap_caller+0x194/0x278 phys=0x80008000 ioremap
0xf19fa000-0xf19fd000   12288 __ioremap_caller+0x194/0x278 phys=0x80008000 ioremap
0xf19fd000-0xf19ff000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf1a00000-0xf2201000 8392704 __ioremap_caller+0x194/0x278 phys=0xf2000000 ioremap
0xf2201000-0xf2208000   28672 load_module+0x2f78/0x5850 pages=6 vmalloc
0xf2208000-0xf220d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf220d000-0xf2210000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2215000-0xf2217000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2217000-0xf2219000    8192 bpf_prog_alloc_no_stats+0x84/0x744 pages=1 vmalloc
0xf2219000-0xf221b000    8192 bpf_prog_alloc_no_stats+0x84/0x744 pages=1 vmalloc
0xf221b000-0xf221d000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf221d000-0xf2222000   20480 load_module+0x2f78/0x5850 pages=4 vmalloc
0xf2222000-0xf2228000   24576 load_module+0x2f78/0x5850 pages=5 vmalloc
0xf2228000-0xf222d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf222d000-0xf2230000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2230000-0xf2235000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2235000-0xf223d000   32768 load_module+0x2f78/0x5850 pages=7 vmalloc
0xf223d000-0xf223f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2240000-0xf2245000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2245000-0xf2247000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2248000-0xf224d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf224d000-0xf224f000    8192 __ioremap_caller+0x194/0x278 phys=0x80008000 ioremap
0xf2255000-0xf2257000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2258000-0xf225d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf225d000-0xf2260000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2260000-0xf2265000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2265000-0xf2268000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2268000-0xf226d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf226d000-0xf226f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2270000-0xf2275000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2275000-0xf2277000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2278000-0xf227d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf227d000-0xf2280000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2280000-0xf2a81000 8392704 __ioremap_caller+0x194/0x278 phys=0xf4000000 ioremap
0xf2a81000-0xf2d90000 3207168 alloc_tag_init+0xdc/0x6f4 pages=6 vmalloc
0xf2d90000-0xf2ddb000  307200 pcpu_mem_zalloc+0x1a0/0x24c pages=74 vmalloc
0xf2ddb000-0xf2ddf000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xf2ddf000-0xf2de3000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xf2de3000-0xf2de5000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2de5000-0xf2de9000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xf2de9000-0xf2deb000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2deb000-0xf2ded000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2dee000-0xf2df0000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2df0000-0xf2df3000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2df3000-0xf2df5000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2df5000-0xf2df8000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2df8000-0xf2dfd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2dfd000-0xf2dff000    8192 fw_decompress_zstd+0x30c/0x4dc pages=1 vmalloc
0xf2e00000-0xf2e05000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2e05000-0xf2e07000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2e07000-0xf2e0c000   20480 load_module+0x2f78/0x5850 pages=4 vmalloc
0xf2e0d000-0xf2e4a000  249856 load_module+0x2f78/0x5850 pages=60 vmalloc
0xf2e4a000-0xf2e80000  221184 load_module+0x2f78/0x5850 pages=53 vmalloc
0xf2e80000-0xf2e84000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xf2e85000-0xf2e87000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2e87000-0xf2e8b000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xf2e8b000-0xf2e8d000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2e8d000-0xf2e92000   20480 load_module+0x2f78/0x5850 pages=4 vmalloc
0xf2e92000-0xf2e97000   20480 load_module+0x2f78/0x5850 pages=4 vmalloc
0xf2e98000-0xf2e9d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2e9d000-0xf2e9f000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2ea0000-0xf2ea5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2ea5000-0xf2eac000   28672 load_module+0x2f78/0x5850 pages=6 vmalloc
0xf2eac000-0xf2eaf000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2eb0000-0xf2eb5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2eb5000-0xf2eb7000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2eb8000-0xf2ebd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2ebd000-0xf2f3e000  528384 radeon_gart_init+0x1b0/0x514 [radeon] pages=128 vmalloc
0xf2f3e000-0xf2f43000   20480 load_module+0x2f78/0x5850 pages=4 vmalloc
0xf2f44000-0xf2f46000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2f46000-0xf2f48000    8192 __ioremap_caller+0x194/0x278 phys=0xf5000000 ioremap
0xf2f48000-0xf2f4b000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2f4b000-0xf2f4d000    8192 bpf_prog_alloc_no_stats+0x84/0x744 pages=1 vmalloc
0xf2f4d000-0xf2f50000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2f50000-0xf2f55000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2f55000-0xf2f57000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2f58000-0xf2f5d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2f5d000-0xf2f60000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2f60000-0xf2f62000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2f62000-0xf2f64000    8192 bpf_prog_alloc_no_stats+0x84/0x744 pages=1 vmalloc
0xf2f65000-0xf2f67000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2f67000-0xf2f69000    8192 bpf_prog_alloc_no_stats+0x84/0x744 pages=1 vmalloc
0xf2f69000-0xf2f6b000    8192 bpf_prog_alloc_no_stats+0x84/0x744 pages=1 vmalloc
0xf2f6b000-0xf2f6d000    8192 bpf_prog_alloc_no_stats+0x84/0x744 pages=1 vmalloc
0xf2f6d000-0xf2f70000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2f75000-0xf2f78000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2f78000-0xf2f7c000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf2f7c000-0xf2f7e000    8192 bpf_prog_alloc_no_stats+0x84/0x744 pages=1 vmalloc
0xf2f7e000-0xf2f80000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2f81000-0xf2f83000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2f84000-0xf2f8f000   45056 ar_context_init+0x394/0x6c0 [firewire_ohci] vmap
0xf2f90000-0xf2f95000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2f95000-0xf2f99000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xf2f99000-0xf2f9b000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2f9b000-0xf2f9d000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2f9d000-0xf2fa8000   45056 ar_context_init+0x394/0x6c0 [firewire_ohci] vmap
0xf2fa8000-0xf2fab000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2fab000-0xf2fad000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2fad000-0xf2fb0000   12288 load_module+0x2f78/0x5850 pages=2 vmalloc
0xf2fb0000-0xf2fb5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2fb5000-0xf2fc6000   69632 load_module+0x2f78/0x5850 pages=16 vmalloc
0xf2fc6000-0xf2fca000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf2fce000-0xf2fd0000    8192 load_module+0x2f78/0x5850 pages=1 vmalloc
0xf2fd5000-0xf2fe4000   61440 load_module+0x2f78/0x5850 pages=14 vmalloc
0xf2fe4000-0xf2fe8000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf2fe8000-0xf2ff0000   32768 load_module+0x2f78/0x5850 pages=7 vmalloc
0xf2ff0000-0xf2ff5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf2ff9000-0xf2ffd000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf3000000-0xf3005000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3005000-0xf300e000   36864 load_module+0x2f78/0x5850 pages=8 vmalloc
0xf3010000-0xf3015000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3020000-0xf3025000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3025000-0xf3029000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xf3030000-0xf3035000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3038000-0xf303d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3045000-0xf304d000   32768 load_module+0x2f78/0x5850 pages=7 vmalloc
0xf304d000-0xf3055000   32768 load_module+0x2f78/0x5850 pages=7 vmalloc
0xf3055000-0xf3064000   61440 load_module+0x2f78/0x5850 pages=14 vmalloc
0xf3065000-0xf3069000   16384 load_module+0x2f78/0x5850 pages=3 vmalloc
0xf3076000-0xf3079000   12288 __ioremap_caller+0x194/0x278 phys=0x80008000 ioremap
0xf3079000-0xf307d000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf3080000-0xf3281000 2101248 __ioremap_caller+0x194/0x278 phys=0xf5200000 ioremap
0xf3281000-0xf3285000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf3290000-0xf32a1000   69632 __ioremap_caller+0x194/0x278 phys=0x90000000 ioremap
0xf32a1000-0xf32b1000   65536 load_module+0x2f78/0x5850 pages=15 vmalloc
0xf32dd000-0xf32e1000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf32e8000-0xf32ed000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3348000-0xf334d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3358000-0xf335d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf335d000-0xf3361000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf3368000-0xf336d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf337d000-0xf3381000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf3381000-0xf3482000 1052672 radeon_gart_init+0x348/0x514 [radeon] pages=256 vmalloc
0xf3482000-0xf3583000 1052672 ttm_bo_kmap+0x72c/0x98c [ttm]
0xf3583000-0xf3587000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf358d000-0xf3591000   16384 n_tty_open+0x5c/0x260 pages=3 vmalloc
0xf3598000-0xf359d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35a8000-0xf35ad000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35b0000-0xf35b5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35b8000-0xf35bd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35c0000-0xf35c5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35c8000-0xf35cd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35d0000-0xf35d5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35d8000-0xf35dd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35e0000-0xf35e5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35e8000-0xf35ed000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35f0000-0xf35f5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf35f8000-0xf35fd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3600000-0xf3605000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3608000-0xf360d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3610000-0xf3615000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3618000-0xf361d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3658000-0xf365d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf365d000-0xf369e000  266240 load_module+0x2f78/0x5850 pages=64 vmalloc
0xf369e000-0xf3716000  491520 load_module+0x2f78/0x5850 pages=119 vmalloc
0xf3730000-0xf3735000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3740000-0xf3745000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf377a000-0xf3790000   90112 load_module+0x2f78/0x5850 pages=21 vmalloc
0xf37e0000-0xf37e5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf37e9000-0xf380a000  135168 crypto_scomp_init_tfm+0x98/0x3b0 pages=32 vmalloc
0xf380a000-0xf382b000  135168 crypto_scomp_init_tfm+0x1bc/0x3b0 pages=32 vmalloc
0xf382b000-0xf384c000  135168 crypto_scomp_init_tfm+0x98/0x3b0 pages=32 vmalloc
0xf384c000-0xf386d000  135168 crypto_scomp_init_tfm+0x1bc/0x3b0 pages=32 vmalloc
0xf386d000-0xf39ac000 1306624 __zstd_init+0xdc/0x52c pages=318 vmalloc
0xf39ac000-0xf39c5000  102400 __zstd_init+0x2e0/0x52c pages=24 vmalloc
0xf39c5000-0xf3b04000 1306624 __zstd_init+0xdc/0x52c pages=318 vmalloc
0xf3b04000-0xf3b1d000  102400 __zstd_init+0x2e0/0x52c pages=24 vmalloc
0xf3b1d000-0xf3c1e000 1052672 ttm_bo_kmap+0x72c/0x98c [ttm]
0xf3c20000-0xf3c25000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3c40000-0xf3c45000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3c50000-0xf3c55000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3c68000-0xf3c6d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3c70000-0xf3c75000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3c80000-0xf3c85000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3c90000-0xf3c95000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3c95000-0xf3e96000 2101248 sys_swapon+0x1758/0x3624 pages=512 vmalloc
0xf3e98000-0xf3e9d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3eb0000-0xf3eb5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3eb8000-0xf3ebd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3ed8000-0xf3edd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3ee8000-0xf3eed000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3ef0000-0xf3ef5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3ef8000-0xf3efd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3f38000-0xf3f3d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3f40000-0xf3f45000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3f48000-0xf3f4d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3f60000-0xf3f65000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3f68000-0xf3f6d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3f70000-0xf3f75000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3f78000-0xf3f7d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3f80000-0xf3f85000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3f88000-0xf3f8d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3f90000-0xf3f95000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3fa0000-0xf3fa5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3fa8000-0xf3fad000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3fd0000-0xf3fd5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3fd8000-0xf3fdd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3fe0000-0xf3fe5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3fe8000-0xf3fed000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3ff0000-0xf3ff5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf3ff8000-0xf3ffd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4000000-0xf4005000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4008000-0xf400d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4010000-0xf4015000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4018000-0xf401d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4020000-0xf4025000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4028000-0xf402d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4030000-0xf4035000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4040000-0xf4045000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4048000-0xf404d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4070000-0xf4075000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4080000-0xf4085000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4088000-0xf408d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4098000-0xf409d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40a0000-0xf40a5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40a8000-0xf40ad000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40b0000-0xf40b5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40b8000-0xf40bd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40c0000-0xf40c5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40c8000-0xf40cd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40d0000-0xf40d5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40d8000-0xf40dd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40e0000-0xf40e5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40e8000-0xf40ed000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40f0000-0xf40f5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf40f8000-0xf40fd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4100000-0xf4105000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4108000-0xf410d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4110000-0xf4115000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4118000-0xf411d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4120000-0xf4125000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4128000-0xf412d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4130000-0xf4135000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4138000-0xf413d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4140000-0xf4145000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4148000-0xf414d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4150000-0xf4155000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4180000-0xf4185000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf41d8000-0xf41dd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf41e8000-0xf41ed000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf41f0000-0xf41f5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf41f8000-0xf41fd000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4200000-0xf4205000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4208000-0xf420d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4228000-0xf422d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4230000-0xf4235000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4238000-0xf423d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4240000-0xf4245000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4258000-0xf425d000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf4270000-0xf4275000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf435e000-0xf4374000   90112 load_module+0x2f78/0x5850 pages=21 vmalloc
0xf4374000-0xf4386000   73728 load_module+0x2f78/0x5850 pages=17 vmalloc
0xf43a0000-0xf43a5000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf43a8000-0xf43ad000   20480 kernel_clone+0xd4/0x4e0 pages=4 vmalloc
0xf43c7000-0xf43d0000   36864 load_module+0x2f78/0x5850 pages=8 vmalloc
0xf43d0000-0xf43da000   40960 load_module+0x2f78/0x5850 pages=9 vmalloc
0xf4400000-0xf4bea000 8298496 __ioremap_caller+0x194/0x278 phys=0xa0040000 ioremap
0xf4bea000-0xf4feb000 4198400 swap_cgroup_swapon+0x70/0x198 pages=1024 vmalloc
0xf50c6000-0xf5110000  303104 pcpu_get_vm_areas+0x0/0x3fa8 vmalloc
0xf1068000-0xf106d000   20480 unpurged vm_area
0xf10f0000-0xf10f5000   20480 unpurged vm_area
0xf10f8000-0xf10fd000   20480 unpurged vm_area
0xf1160000-0xf1165000   20480 unpurged vm_area
0xf2210000-0xf2215000   20480 unpurged vm_area
0xf2250000-0xf2255000   20480 unpurged vm_area
0xf2f70000-0xf2f75000   20480 unpurged vm_area
0xf3040000-0xf3045000   20480 unpurged vm_area
0xf4260000-0xf4265000   20480 unpurged vm_area
0xf4278000-0xf427d000   20480 unpurged vm_area
0xf43b0000-0xf43b5000   20480 unpurged vm_area

--MP_/FFGDrwnqxdIzAwmjoZW2jTs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=meminfo-outline_kasan.txt

MemTotal:        1941456 kB
MemFree:         1573408 kB
MemAvailable:    1709916 kB
Buffers:           25732 kB
Cached:           126004 kB
SwapCached:            0 kB
Active:           170396 kB
Inactive:          46816 kB
Active(anon):      66104 kB
Inactive(anon):        0 kB
Active(file):     104292 kB
Inactive(file):    46816 kB
Unevictable:           0 kB
Mlocked:               0 kB
HighTotal:       1212416 kB
HighFree:         996208 kB
LowTotal:         729040 kB
LowFree:          577200 kB
SwapTotal:       8388604 kB
SwapFree:        8388604 kB
Zswap:                 0 kB
Zswapped:              0 kB
Dirty:                12 kB
Writeback:             0 kB
AnonPages:         65492 kB
Mapped:            58332 kB
Shmem:               620 kB
KReclaimable:       9852 kB
Slab:             103700 kB
SReclaimable:       9852 kB
SUnreclaim:        93848 kB
KernelStack:        3024 kB
PageTables:         1292 kB
SecPageTables:         0 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     9359332 kB
Committed_AS:     331588 kB
VmallocTotal:      66624 kB
VmallocUsed:       23052 kB
VmallocChunk:          0 kB
Percpu:              392 kB

--MP_/FFGDrwnqxdIzAwmjoZW2jTs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=meminfo-inline_kasan.txt

MemTotal:        1928912 kB
MemFree:         1554276 kB
MemAvailable:    1694976 kB
Buffers:           25616 kB
Cached:           130260 kB
SwapCached:            0 kB
Active:           170788 kB
Inactive:          50828 kB
Active(anon):      66360 kB
Inactive(anon):        0 kB
Active(file):     104428 kB
Inactive(file):    50828 kB
Unevictable:           0 kB
Mlocked:               0 kB
HighTotal:       1212416 kB
HighFree:         988696 kB
LowTotal:         716496 kB
LowFree:          565580 kB
SwapTotal:       8388604 kB
SwapFree:        8388604 kB
Zswap:                 0 kB
Zswapped:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:         65780 kB
Mapped:            58352 kB
Shmem:               620 kB
KReclaimable:       9840 kB
Slab:             103028 kB
SReclaimable:       9840 kB
SUnreclaim:        93188 kB
KernelStack:        2880 kB
PageTables:         1248 kB
SecPageTables:         0 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     9353060 kB
Committed_AS:     323328 kB
VmallocTotal:      66624 kB
VmallocUsed:       26944 kB
VmallocChunk:          0 kB
Percpu:              392 kB

--MP_/FFGDrwnqxdIzAwmjoZW2jTs--

