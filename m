Return-Path: <linuxppc-dev+bounces-12980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CD5BE7466
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 10:50:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnz6Q5DYvz3069;
	Fri, 17 Oct 2025 19:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760691006;
	cv=none; b=Qef7+/T3piLFwFuSzAqbtCbNK3DLQW9ohVOT9UxICM0dqCl8h8K/EoZcQ+0pjKriMVYpK5ZPXMclHwVDQmGAo71HxYWJhkdTZtZzdEJXPXD+cfnha9FnjW96B/i+eTWZ5BkbB2JjQzq47NKWaM4+/cZWicZuBxsU1iVMBCBetoMklo+wstkS38690ASndLFy/unjo/Tp91l0LMCu5aIx8UZJWH1XhSC9uib0EVLITAj0Pz0h2H74DhzYuu7jzhtNu5Z/icAlCN1lEjPk/230trijFcTvOrpcrQkRD0zpvZt4jSEpHhqrkcSuMrM9vYfr+C8ELYpbrfuXwcNE0+tb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760691006; c=relaxed/relaxed;
	bh=XRlA8wxYmT4T3lHIjrOHkanll5zbsjvfV/g54mtoCXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mS3CLM5lO2KgPW/VrdmVrC2bZb63KYtAXpzG36x7iIPKiOryWUUEMdaHGkadCHuRFfNgYpph10Ru7hiUqoIxaksLKskRFFMCMymkCs5WlBFag6caLDBgQoC5uy9J7VwN+kM3dylbPs5+udCfpzUsiLWjQA3hLbi/J1TlKq65PIBb/ZkFItrSrbDtyPEajDDifFUR/VvF/EAI3u1imh0O9JMu8jJa0qhRyW7LAiH1eU6Qehj4yC1LXlTxW1UAo1hT+4tQxlRY8cuIDvKuEqJtTov46mK79EEisuXDi9Q4Ay7qFpIs/Z/rq8NnHH+21Qt3NoJE10inFSbZI6TOJ8m96Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnz6Q07sTz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 19:50:04 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cnwvM5bNlz9sSC;
	Fri, 17 Oct 2025 09:10:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROX6mZqwBn-5; Fri, 17 Oct 2025 09:10:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cnwvM4hkJz9sRy;
	Fri, 17 Oct 2025 09:10:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 930D88B773;
	Fri, 17 Oct 2025 09:10:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1cz_CSRRBRVp; Fri, 17 Oct 2025 09:10:23 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 51AC08B763;
	Fri, 17 Oct 2025 09:10:23 +0200 (CEST)
Message-ID: <b41c65b7-db67-48e6-a7ac-609bbc653494@csgroup.eu>
Date: Fri, 17 Oct 2025 09:10:23 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PPC] t1024rdb: CONFIG_KERNEL_START=0x0 equivalent for ppc64
 (Kernel 3.16.85)
To: Alex Fetzner <alex@fetzner.me>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <yEcgGewmm_K00goV2VDaiSwPgzZCWcRkHeVowwzmBOkeZHAFjGt6BSjU7ZwRTfKd1cFF6GKshrfTDzQ4LZj65Wkc2S4aPBKKIW6FxvAZ46U=@fetzner.me>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <yEcgGewmm_K00goV2VDaiSwPgzZCWcRkHeVowwzmBOkeZHAFjGt6BSjU7ZwRTfKd1cFF6GKshrfTDzQ4LZj65Wkc2S4aPBKKIW6FxvAZ46U=@fetzner.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Alex,

Le 12/10/2025 à 00:18, Alex Fetzner a écrit :
> [Vous ne recevez pas souvent de courriers de alex@fetzner.me. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hello all,
> 
> I have a legacy product using linux 3.12.19 that I am updating to use linux 4 and eventually 5.
> The product use an NXT (Freescale) t1024rdb (e5500 processor).
> I am right now trying to compile a 3.16.85 kernel that works as a stand-in replacement for the existing kernel. The product uses a u-boot load address 0x1000000 (1MB) and flattened device tree address 0x2000000 (2MB). The deployment of this kernel is such that I cannot alter these address.
> The original uImage header has load address and entry point 0x0.
> The original vmlinux ELF from the uImage has entry point address 0x0.
> 
> How do I appropriately alter a ppc64 kernel to have entry point 0x0?
> I can create a uImage header with load and entry point 0x0, but the kernel uses a virtual address 0xc000000000000000 as entry point.
> I see that 32 bit kernels have the configurable option CONFIG_KERNEL_START, but this is not available for 64 bit.

Even with the CONFIG_KERNEL_START you can't expect any kernel to have a 
virtual start address of 0, because the KERNEL needs to be above user space.

But you shouldn't need that. It is the role of the loader to set the MMU 
so that the kernel is running with the correct virtual address.

I don't understand why you need the virtual starting address of vmlinux 
to be 0x0.

Here is what I get with ppc64e_defconfig with v6.18-rc1:

CPU:   Unknown, Version: 0.0, (0x00000000)
Core:  e5500, Version: 2.0, (0x80240020)
Clock Configuration:
        CPU0:400  MHz,
        CCB:400  MHz,
        DDR:200  MHz (400 MT/s data rate), LBC: unknown (LCRR[CLKDIV] = 
0x00)
L1:    D-cache 32 KiB enabled
        I-cache 32 KiB enabled
DRAM:  1 GiB
L2:    disabled

PCI: base address e0008000
   00:01.0     - 1af4:1000 - Network controller
PCI1: Bus 00 - 00

In:    serial
Out:   serial
Err:   serial
Net:   No ethernet found.
Hit any key to stop autoboot:  0
WARNING: adjusting available memory to 30000000
## Booting kernel from Legacy Image at 02000000 ...
    Image Name:   Linux-6.18.0-rc1-00010-g179dbcda
    Image Type:   PowerPC Linux Kernel Image (gzip compressed)
    Data Size:    7217834 Bytes = 6.9 MiB
    Load Address: 00000000
    Entry Point:  00000000
    Verifying Checksum ... OK
## Flattened Device Tree blob at e8000000
    Booting using the fdt blob at 0xe8000000
    Uncompressing Kernel Image ... OK
    Loading Device Tree to 03efc000, end 03ffefff ... OK
random: crng init done
Activating Kernel Userspace Access Protection
Activating Kernel Userspace Execution Prevention
MMU: Supported page sizes
          4 KB as direct
       4096 KB as direct
      16384 KB as direct
      65536 KB as direct
     262144 KB as direct
    1048576 KB as direct
MMU: Book3E HW tablewalk not supported
Linux version 6.18.0-rc1-00010-g179dbcda9eb3 
(chleroy@PO20335.IDSI0.si.c-s.fr) (powerpc64-linux-gcc (GCC) 15.1.0, GNU 
ld (GNU Binutils) 2.44) #1697 SMP Wed Oct 15 13:47:20 CEST 2025
OF: reserved mem: Reserved memory: No reserved-memory node in the DT
Found initrd at 0xc000000004000000:0xc0000000041d1a3b
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
printk: legacy bootconsole [udbg0] enabled
CPU maps initialized for 1 thread per core
-----------------------------------------------------
phys_mem_size     = 0x40000000
dcache_bsize      = 0x40
icache_bsize      = 0x40
cpu_features      = 0x0000000300800194
   possible        = 0x0000000300900394
   always          = 0x0000000300800394
cpu_user_features = 0xcc008000 0x08000000
mmu_features      = 0x000a0010
firmware_features = 0x0000000000000000
-----------------------------------------------------
qemu_e500_setup_arch()
barrier-nospec: using isync; sync as speculation barrier
Zone ranges:
   DMA      [mem 0x0000000000000000-0x000000003fffffff]
   Normal   empty
Movable zone start for each node
Early memory node ranges
   node   0: [mem 0x0000000000000000-0x000000003fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000003fffffff]
MMU: Allocated 2112 bytes of context maps for 255 contexts
percpu: Embedded 27 pages/cpu s70232 r0 d40360 u1048576
Kernel command line: noreboot
Unknown kernel command line parameters "noreboot", will be passed to 
user space.
printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 262144
mem auto-init: stack:all(zero), heap alloc:off, heap free:off
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
rcu: Hierarchical RCU implementation.
rcu: 	RCU event tracing is enabled.
rcu: 	RCU restricting CPUs from NR_CPUS=32 to nr_cpu_ids=1.
	Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb_adjust=1 
rcu_task_cpu_ids=1.
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 1 CPUs
mpic: ISU size: 256, shift: 8, mask: ff
mpic: Initializing for 256 sources
...

Christophe

