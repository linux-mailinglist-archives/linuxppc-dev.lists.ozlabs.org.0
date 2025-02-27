Return-Path: <linuxppc-dev+bounces-6529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6D4A47796
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 09:20:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3PQy4g6cz30NF;
	Thu, 27 Feb 2025 19:20:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740644410;
	cv=none; b=f8iC2I/bvvk8Ym/8bRK4NKiWAOI0mGqnQLNtlp5Ajg7zJQWq25EvZ5Hqn1qm9HDa5Qa5L36rMjimBKvvHVDd6mZyr8EzClJjy7RrfzsasW3857oq+wHW4FOVponFdAa2lPsHhmzJw0FD+Vd4d2wENE5dQw1fp+cck9AM9zXZ30ttM7Z1825EQr0j+M/c0I62XRTf6nlzWzWBrmKAaJFrBho5OQxeTCYPEupWuFd38cP2kAbyko48pVrOXhQSbo2rqH2lCFo4iB6h2jgukDGpSz/E8VS+b3o9cxLnT+4T5YwWPWrvUdE5zJTpnevu1Ib3J3esJrVQw+edqbfe9G3nHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740644410; c=relaxed/relaxed;
	bh=kP+zzA9I3tH8nNrpEvOSFr8/c4hax9JIHRSkhXMU/nI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N6/NXFkVmeosbCe1STdY0afGWl5XfHtVeApoh2LBlZmWSkRSkkByhhI+e6zU+P8JuAu7sQ9SadsVhkxUIF1SS+/amQDePP0px8T3iiB/p9IdMwp82e66zCyPXTllWKzsCKiyNYFue0W6QRdAdXk0mBUZzWFRm5tIzRQy5Him4MgYC74i7I7df/8AlErp1apm4QARBDvgyQsMG1i02aJE5DxYfaX78c0in4WmaceKck2Y9csUeBwBkgbkeJlefY7ILma8k2brqPsFTdQuLpIPMg3NNEo2dByOC1skvseYFx+I65NrOubc+meC4kBB7pHNUXztoXAQNqX3AKQBPROoHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3PQx5qccz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 19:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z3Nph0GSJz9sRs;
	Thu, 27 Feb 2025 08:52:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cS9zada0ldJO; Thu, 27 Feb 2025 08:52:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z3Npg6JNjz9sRk;
	Thu, 27 Feb 2025 08:52:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C7FC98B78B;
	Thu, 27 Feb 2025 08:52:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id pqG3Fs99_G7u; Thu, 27 Feb 2025 08:52:11 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 751D78B77C;
	Thu, 27 Feb 2025 08:52:11 +0100 (CET)
Message-ID: <a5a36d4c-ab5a-49a3-80f7-4c7f07e217d1@csgroup.eu>
Date: Thu, 27 Feb 2025 08:52:09 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: vmalloc_node_range for size 4198400 failed: Address range
 restricted to 0xf1000000 - 0xf5110000 (kernel 6.14-rc4, ppc32)
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
References: <20250227013431.11d1adb7@yea> <87y0xsotrn.fsf@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87y0xsotrn.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 27/02/2025 à 06:12, Ritesh Harjani a écrit :
> Erhard Furtner <erhard_f@mailbox.org> writes:
> 
>> Greetings!
>>
>> At boot with a KASAN-enabled v6.14-rc4 kernel on my PowerMac G4 DP I get:
>>
>> [...]
>> vmalloc_node_range for size 4198400 failed: Address range restricted to 0xf1000000 - 0xf5110000
>> swapon: vmalloc error: size 4194304, vm_struct allocation failed, mode:0xdc0(GFP_KERNEL|__GFP_ZERO), nodemask=(null),cpuset=openrc.swap,mems_allowed=0
> 
> Did we exhaust the vmalloc area completely?
> 
> 
>> CPU: 0 UID: 0 PID: 870 Comm: swapon Tainted: G        W          6.14.0-rc4-PMacG4 #6
>> Tainted: [W]=WARN
>> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
>> Call Trace:
>> [f2ffb9d0] [c14cfd88] dump_stack_lvl+0x70/0x8c (unreliable)
>> [f2ffb9f0] [c04fb9b8] warn_alloc+0x154/0x2b8
>> [f2ffbab0] [c04de94c] __vmalloc_node_range_noprof+0x154/0x958
>> [f2ffbb80] [c04df23c] __vmalloc_node_noprof+0xec/0xf4
>> [f2ffbbc0] [c0558524] swap_cgroup_swapon+0x70/0x198
>> [f2ffbbf0] [c051e8d8] sys_swapon+0x1838/0x3624
>> [f2ffbce0] [c001e574] system_call_exception+0x2dc/0x420
> 
> Since only the swapon failed, I think you might still have the console
> up right? So this is mostly a vmalloc allocation failure report?
> 
> 
>> [f2ffbf30] [c00291ac] ret_from_syscall+0x0/0x2c
>> --- interrupt: c00 at 0x2612ec
>> NIP:  002612ec LR: 00534108 CTR: 001e8310
>> REGS: f2ffbf40 TRAP: 0c00   Tainted: G        W           (6.14.0-rc4-PMacG4)
>> MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24002444  XER: 00000000
>>
>> GPR00: 00000057 afe3ef20 a7a95540 01b2bdd0 00000000 24002444 fe5ff7e1 00247c24
>> GPR08: 0000d032 0000fa89 01b2d568 001e8310 24002448 0054fe14 02921154 00000000
>> GPR16: 00000000 00534b50 afe3f0ac afe3f0b0 00000000 00000000 0055001c afe3f0d0
>> GPR24: afe3f0b0 00000003 00000000 00001000 01b2bdd0 00000002 005579ec 01b2d570
>> NIP [002612ec] 0x2612ec
>> LR [00534108] 0x534108
>> --- interrupt: c00
>> Mem-Info:
>> active_anon:1989 inactive_anon:0 isolated_anon:0
>>   active_file:6407 inactive_file:5879 isolated_file:0
>>   unevictable:0 dirty:0 writeback:0
>>   slab_reclaimable:1538 slab_unreclaimable:22927
>>   mapped:2753 shmem:107 pagetables:182
>>   sec_pagetables:0 bounce:0
>>   kernel_misc_reclaimable:0
>>   free:433110 free_pcp:472 free_cma:0
>> Node 0 active_anon:7972kB inactive_anon:0kB active_file:25652kB inactive_file:23496kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:10908kB dirty:0kB writeback:0kB shmem:464kB writeback_tmp:0kB kernel_stack:1568kB pagetables:724kB sec_pagetables:0kB all_unreclaimable? no
>> DMA free:591772kB boost:0kB min:3380kB low:4224kB high:5068kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:4kB inactive_file:11056kB unevictable:0kB writepending:0kB present:786432kB managed:716492kB mlocked:0kB bounce:0kB free_pcp:1680kB local_pcp:1180kB free_cma:0kB
>> lowmem_reserve[]: 0 0 1184 0
>> DMA: 127*4kB (UE) 66*8kB (UME) 37*16kB (UE) 78*32kB (UME) 10*64kB (UE) 4*128kB (UME) 3*256kB (UM) 6*512kB (UM) 5*1024kB (ME) 4*2048kB (M) 139*4096kB (M) = 591772kB
>> 12404 total pagecache pages
>> 0 pages in swap cache
>> Free swap  = 0kB
>> Total swap = 0kB
>> 524288 pages RAM
>> 327680 pages HighMem/MovableOnly
>> 42061 pages reserved
> 
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
>   #include <linux/mmzone.h>
>   #include <linux/swap.h>
>   #include <linux/vmstat.h>
> +#include <linux/vmalloc.h>
> 
>   #include "internal.h"
>   #include "swap.h"
> @@ -416,6 +417,8 @@ void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
>          printk("%lu pages RAM\n", total);
>          printk("%lu pages HighMem/MovableOnly\n", highmem);
>          printk("%lu pages reserved\n", reserved);
> +       printk("%lu pages Vmalloc Total\n", (unsigned long)VMALLOC_TOTAL >> PAGE_SHIFT);
> +       printk("%lu pages Vmalloc Used\n", vmalloc_nr_pages());
>   #ifdef CONFIG_CMA
>          printk("%lu pages cma reserved\n", totalcma_pages);
>   #endif
> 
> 
> But meanwhile below data can give more details about the vmalloc area.
> 
> 1. cat /proc/vmallocinfo
> 2. cat /proc/meminfo
> 

Make sure you start your kernel with "no_hash_pointers" otherwise the 
information in /proc/vmallocinfo is less interesting.

By the way KASAN takes a lot of upper address space and you may not have 
enough remaining space. Allthough it should be the same with outline 
KASAN and inline KASAN unless you are maybe just at the limit.

Would be interesting to get /proc/vmallocinfo for both the inline and 
outline KASAN.

Christophe

