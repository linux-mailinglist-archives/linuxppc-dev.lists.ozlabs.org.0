Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA03DE56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 10:51:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sz0Q2P52zDqN2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 18:51:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="JjrYUH9o"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44syyk5ycyzDqLb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 18:49:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44syyX3h04z9v0xy;
 Mon, 29 Apr 2019 10:49:40 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=JjrYUH9o; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vK9ZOiG3qifc; Mon, 29 Apr 2019 10:49:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44syyX1WSpz9v0sl;
 Mon, 29 Apr 2019 10:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556527780; bh=FEmNM9UwAS5MmlEYfWGjpO+t8hYvdtfQe083/WW04vE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JjrYUH9oLUnhuIo8nN788wTAobjBinnij6nUUMrTAmP28iIYC/lWdnOgy+lmFhS7/
 L2wN70STFdjpqAa1eqWiw6XgOpMHcmg/wrFEeazIwUFObmXUselrxGr865BA3S0J9/
 Op9+X1NqcbynIltL3XK8WQ5qaRNffWqOWSroPRBQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D84058B8A6;
 Mon, 29 Apr 2019 10:49:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id H_YmLz-0AiuV; Mon, 29 Apr 2019 10:49:44 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8AD578B8A5;
 Mon, 29 Apr 2019 10:49:44 +0200 (CEST)
Subject: Re: BUG: crash in __tlb_remove_page_size with STRICT_KERNEL_RWX on
 BOOK3S_32
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>
References: <87pnp9mknl.fsf@depni.sinp.msu.ru>
 <db886597-8867-93e6-a507-6da4963ce0bd@c-s.fr>
 <878svwn85h.fsf@depni.sinp.msu.ru>
 <0cb9dc35-af5b-912f-53b6-d83558ecbbcb@c-s.fr>
 <87k1fd5ikm.fsf@depni.sinp.msu.ru>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2f5028a1-3c1d-1164-a46a-69a459c3853e@c-s.fr>
Date: Mon, 29 Apr 2019 10:49:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87k1fd5ikm.fsf@depni.sinp.msu.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/04/2019 à 10:20, Serge Belyshev a écrit :
> Hi!
> 
>> As pointed by Segher, those are not correct, bat 2 for instance should
>> be 0xc0c00000-0xc0ffffff
>>
>> Could you try the below changes ?
>>
>> commit 5953416b8ef52107e8f04559a08a90aa5368cfcd
>> Author: Christophe Leroy <christophe.leroy@c-s.fr>
>> Date:   Mon Apr 29 07:22:08 2019 +0000
>>
>>      powerpc/32s: fix BATs setting with CONFIG_STRICT_KERNEL_RWX
>>
> 
> The box did boot successfully, and survived disk read test, thanks!
> Here is the new debug information for the record:

Thanks for testing. I'll send a proper patch to Michael

> 
> 
>> /sys/kernel/debug/kernel_page_tables
> 
> ---[ Start of kernel VM ]---
> 0xe0000000-0xefffffff  0x20000000       256M        rw       present           dirty  accessed

The above looks a lot better.

It shows that 256M of RAM is not mapped with bats.

I'd recommend you to change CONFIG_DATA_SHIFT to 23 (you need 
CONFIG_ADVANCED_OPTIONS and CONFIG_DATA_SHIFT_BOOL to be able to wave 
the default value), that should free some bats used for small blocks and 
make it available for mapping that area.


> 
>> /sys/kernel/debug/powerpc/block_address_translation
> 
> ---[ Instruction Block Address Translation ]---
> 0: 0xc0000000-0xc07fffff 0x00000000 Kernel EXEC coherent
> 1: 0xc0800000-0xc087ffff 0x00800000 Kernel EXEC coherent
> 2:         -
> 3:         -
> 4:         -
> 5:         -
> 6:         -
> 7:         -
> 
> ---[ Data Block Address Translation ]---
> 0: 0xc0000000-0xc07fffff 0x00000000 Kernel RO coherent
> 1: 0xc0800000-0xc0bfffff 0x00800000 Kernel RO coherent
> 2: 0xc0c00000-0xc0ffffff 0x00c00000 Kernel RW coherent
> 3: 0xc1000000-0xc1ffffff 0x01000000 Kernel RW coherent
> 4: 0xc2000000-0xc3ffffff 0x02000000 Kernel RW coherent
> 5: 0xc4000000-0xc7ffffff 0x04000000 Kernel RW coherent
> 6: 0xc8000000-0xcfffffff 0x08000000 Kernel RW coherent
> 7: 0xd0000000-0xdfffffff 0x10000000 Kernel RW coherent

Looks as it should be. So you now have:

8M + 4M are Read Only
4M + 16M + 32M + 64M + 128M + 256M are Read Write
256M mapped by pages as there are only 8 bats.

With the change I suggested above, you should end up with:
16M be Read Only
16M + 32M + 64M + 128M + 256M + 256M be Read Write.

Christophe

> 
> 
>> /sys/kernel/debug/powerpc/segment_registers
> 
> ---[ User Segments ]---
> 0x00000000-0x0fffffff Kern key 1 User key 1 VSID 0x5d84d0
> 0x10000000-0x1fffffff Kern key 1 User key 1 VSID 0x5d85e1
> 0x20000000-0x2fffffff Kern key 1 User key 1 VSID 0x5d86f2
> 0x30000000-0x3fffffff Kern key 1 User key 1 VSID 0x5d8803
> 0x40000000-0x4fffffff Kern key 1 User key 1 VSID 0x5d8914
> 0x50000000-0x5fffffff Kern key 1 User key 1 VSID 0x5d8a25
> 0x60000000-0x6fffffff Kern key 1 User key 1 VSID 0x5d8b36
> 0x70000000-0x7fffffff Kern key 1 User key 1 VSID 0x5d8c47
> 0x80000000-0x8fffffff Kern key 1 User key 1 VSID 0x5d8d58
> 0x90000000-0x9fffffff Kern key 1 User key 1 VSID 0x5d8e69
> 0xa0000000-0xafffffff Kern key 1 User key 1 VSID 0x5d8f7a
> 0xb0000000-0xbfffffff Kern key 1 User key 1 VSID 0x5d908b
> 
> ---[ Kernel Segments ]---
> 0xc0000000-0xcfffffff Kern key 0 User key 1 No Exec VSID 0x000ccc
> 0xd0000000-0xdfffffff Kern key 0 User key 1 No Exec VSID 0x000ddd
> 0xe0000000-0xefffffff Kern key 0 User key 1 No Exec VSID 0x000eee
> 0xf0000000-0xffffffff Kern key 0 User key 1 No Exec VSID 0x000fff
> 
> 
>> first lines of dmesg
> 
> [    0.000000] Total memory = 1024MB; using 2048kB for hash table (at (ptrval))
> [    0.000000] Linux version 5.1.0-rc7-dirty (ssb@spider) (gcc version 9.0.1 20190426 (prerelease) (GCC)) #1193 PREEMPT Mon Apr 29 10:59:53 MSK 2019
> [    0.000000] Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0xd2
> [    0.000000] Mapped at 0xff7c0000
> [    0.000000] Found a Intrepid mac-io controller, rev: 0, mapped at 0x(ptrval)
> [    0.000000] Processor NAP mode on idle enabled.
> [    0.000000] PowerMac motherboard: PowerBook G4 15"
> [    0.000000] Using PowerMac machine description
> [    0.000000] printk: bootconsole [udbg0] enabled
> [    0.000000] -----------------------------------------------------
> [    0.000000] Hash_size         = 0x200000
> [    0.000000] phys_mem_size     = 0x40000000
> [    0.000000] dcache_bsize      = 0x20
> [    0.000000] icache_bsize      = 0x20
> [    0.000000] cpu_features      = 0x000000002510600a
> [    0.000000]   possible        = 0x000000002f7ff14b
> [    0.000000]   always          = 0x0000000000000000
> [    0.000000] cpu_user_features = 0x9c000001 0x00000000
> [    0.000000] mmu_features      = 0x00010001
> [    0.000000] Hash              = 0x(ptrval)
> [    0.000000] Hash_mask         = 0x7fff
> [    0.000000] -----------------------------------------------------
> [    0.000000] Found UniNorth PCI host bridge at 0x00000000f0000000. Firmware bus number: 0->1
> [    0.000000] PCI host bridge /pci@f0000000  ranges:
> [    0.000000]  MEM 0x00000000f1000000..0x00000000f1ffffff -> 0x00000000f1000000
> [    0.000000]   IO 0x00000000f0000000..0x00000000f07fffff -> 0x0000000000000000
> [    0.000000]  MEM 0x00000000b0000000..0x00000000bfffffff -> 0x00000000b0000000
> [    0.000000] Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus number: 0->1
> [    0.000000] PCI host bridge /pci@f2000000 (primary) ranges:
> [    0.000000]  MEM 0x00000000f3000000..0x00000000f3ffffff -> 0x00000000f3000000
> [    0.000000]   IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
> [    0.000000]  MEM 0x0000000080000000..0x00000000afffffff -> 0x0000000080000000
> [    0.000000] Found UniNorth PCI host bridge at 0x00000000f4000000. Firmware bus number: 0->1
> [    0.000000] PCI host bridge /pci@f4000000  ranges:
> [    0.000000]  MEM 0x00000000f5000000..0x00000000f5ffffff -> 0x00000000f5000000
> [    0.000000]   IO 0x00000000f4000000..0x00000000f47fffff -> 0x0000000000000000
> [    0.000000] via-pmu: Server Mode is disabled
> [    0.000000] PMU driver v2 initialized for Core99, firmware: 0c
> [    0.000000] Top of RAM: 0x40000000, Total RAM: 0x40000000
> [    0.000000] Memory hole size: 0MB
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000000000000-0x000000002fffffff]
> [    0.000000]   HighMem  [mem 0x0000000030000000-0x000000003fffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x000000003fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000003fffffff]
> [    0.000000] On node 0 totalpages: 262144
> [    0.000000]   Normal zone: 1536 pages used for memmap
> [    0.000000]   Normal zone: 0 pages reserved
> [    0.000000]   Normal zone: 196608 pages, LIFO batch:63
> [    0.000000]   HighMem zone: 65536 pages, LIFO batch:15
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> [    0.000000] pcpu-alloc: [0] 0
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 260608
> [    0.000000] Kernel command line: root=/dev/hda3 ro console=ttyUSB0,115200 console=tty0 consoleblank=120
> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
> [    0.000000] Memory: 1023076K/1048576K available (8704K kernel code, 352K rwdata, 1344K rodata, 208K init, 1176K bss, 25500K reserved, 0K cma-reserved, 262144K highmem)
> [    0.000000] Kernel virtual memory layout:
> [    0.000000]   * 0xfffcf000..0xfffff000  : fixmap
> [    0.000000]   * 0xff800000..0xffc00000  : highmem PTEs
> [    0.000000]   * 0xfde2b000..0xff800000  : early ioremap
> [    0.000000]   * 0xf1000000..0xfde2b000  : vmalloc & ioremap
> [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> 
