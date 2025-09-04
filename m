Return-Path: <linuxppc-dev+bounces-11719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE49B43889
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 12:20:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHb926dtDz305P;
	Thu,  4 Sep 2025 20:20:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756981254;
	cv=none; b=GhpFzpiDGNYt46DmdWa3uAxeAws6kjJ/CaVs0mWz/E5Nbo+F/xhQi/m/q+iYeXLjIauUaGQI7qEYRgW47wX7M54mqcvCX1OGipbtXjvK+Fn5n29m6PJLJAL9EdefYGrCxNVr5OmdUbYkqEfl9Qwo5XpU0V/uxSzx/WlREvrHoMSBlWXOSOBPLGcgJ/XpSnPSW70Jdmgxm/Al5ZW1UN8m7UnjafmuAmuUr6ajRTlLuIls0pzvaay0Gr6MD9dG2FXRYrO4GioAWDywcpSxXKkoA8kTp4ac8NR2f6SZndJKGV+EiGNTKzIG+dAvqU1AHTnA4+opCnB2NaMyOjKf27tFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756981254; c=relaxed/relaxed;
	bh=BQmbhejF+e0qnjPryp1MsoQsUba5Yjtm1KKLYFklkQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FMJBR62aIZcufKS2M1Q8wrRxcwQcbVyq9svkjGAOnwPS44pvUg0zzpcnGPn2Xil2enfAtbMWs+RIAk5tQrWu/CKKQRaOwmmNft3LDGiomYCvxqnC+DueP/DQZMefph4jbj8GPVlfFG9QbU+mFTyinmVFoabSE5VmG3SFTeDbIhRyg0N2kSKPP/lJX2ScGpFDRuhpFzqXUlYIc04ruS9GolNzzimVX7P6VsIWs1uGb1BkYpRCQPiYiPrCfEWg9e0rOP/IcoFcMsht9ZFDtAGmnLmluzfIvjuGL9nnvNIe3C2AseZIlo7ovo37EPvoNuJ6qkoul+qvQDRPOpErjjnP6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHb921QM6z2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 20:20:54 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cHZqH2y4Jz9sVb;
	Thu,  4 Sep 2025 12:05:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAhIw7ZjnRgG; Thu,  4 Sep 2025 12:05:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cHZqH1tFVz9sVY;
	Thu,  4 Sep 2025 12:05:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AAB08B769;
	Thu,  4 Sep 2025 12:05:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1r3m4fedKK3e; Thu,  4 Sep 2025 12:05:31 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E565C8B765;
	Thu,  4 Sep 2025 12:05:30 +0200 (CEST)
Message-ID: <c62b68f9-134a-4950-bb90-c805da8eebd2@csgroup.eu>
Date: Thu, 4 Sep 2025 12:05:30 +0200
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
Subject: Re: Kernel v6.17-rc4 with STATIC_CALL_SELFTEST=y enabled fails to
 boot at early stage (PowerMac G4 DP)
To: Andrew Donnellan <ajd@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Erhard Furtner <erhard_f@mailbox.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
 <98dbafee-aad3-439b-9efb-76f80c6668fd@csgroup.eu>
 <ca440403-0108-4703-bf07-bc3ac7e3d108@linux.ibm.com>
 <e042d4ca-c66b-49ec-8572-442ab697c430@csgroup.eu>
 <21ad3bf6-4654-43a5-9dc3-ebcdc676d542@linux.ibm.com>
 <98b226684e39543a4706f3c4632d9b1856346660.camel@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <98b226684e39543a4706f3c4632d9b1856346660.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 04/09/2025 à 11:57, Andrew Donnellan a écrit :
> On Thu, 2025-09-04 at 14:33 +0530, Madhavan Srinivasan wrote:
>>>> I am using qemu with -M mac99 and it boots
>>>>
>>>> Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
>>>> printk: legacy bootconsole [udbg0] enabled
>>>> -----------------------------------------------------
>>>> phys_mem_size     = 0x8000000
>>>> dcache_bsize      = 0x20
>>>>
>>>> I am missing something here. Digging some more
>>>
>>>
>>> Did you use the .config provided by Erhard ?
>>>
>>
>> Oops. sorry for the noise
> 
> I noticed that I don't hit this using defconfigs (with JUMP_LABEL and
> STATIC_CALL_SELFTEST manually enabled), so I did some config bisection with
> Erhard's config.
> 
> It looks like you need CONFIG_KFENCE=y, and CONFIG_XMON=n.
> 
> Attached is a minimal config for current mainline, allnoconfig + CONFIG_PPC_PMAC
> (so I can get console output in qemu) + CONFIG_KFENCE + CONFIG_JUMP_LABEL +
> CONFIG_STATIC_CALL_SELFTEST.
> 
> Running with qemu-system-ppc -M mac99, we get the below.
> 
> Christophe: I'm not exactly sure what changes when you enable/disable KFENCE on
> book3s32, but it looks to me like it affects whether .init.text is mapped using
> BATs or not?

As I said in previous response, the problem seems to come from here:

arch/powerpc/include/asm/pgtable.h :

/*
  * Protection used for kernel text. We want the debuggers to be able to
  * set breakpoints anywhere, so don't write protect the kernel text
  * on platforms where such control is possible.
  */
#if defined(CONFIG_KGDB) || defined(CONFIG_XMON) || 
defined(CONFIG_BDI_SWITCH) || \
     defined(CONFIG_KPROBES) || defined(CONFIG_DYNAMIC_FTRACE)
#define PAGE_KERNEL_TEXT    PAGE_KERNEL_X
#else
#define PAGE_KERNEL_TEXT    PAGE_KERNEL_ROX
#endif

If you have neither CONFIG_KGDB nor CONFIG_XMON nor CONFIG_BDI_SWITCH 
nor CONFIG_KPROBES or CONFIG_DYNAMIC_FTRACE, kernel text is mapped 
Read-Only.

Using BATs or not shouldn't make any difference because:

With BATs we do:
arch/powerpc/mm/book3s32/mmu.c:         setibat(i++, PAGE_OFFSET + base, 
base, size, PAGE_KERNEL_TEXT);
arch/powerpc/mm/book3s32/mmu.c:         setibat(i++, PAGE_OFFSET + base, 
base, size, PAGE_KERNEL_TEXT);

Without BATs we do:
arch/powerpc/mm/pgtable_32.c:           map_kernel_page(v, p, ktext ? 
PAGE_KERNEL_TEXT : PAGE_KERNEL);



> 
> Andrew
> 
> ---------------------------------
> 
>>> =============================================================
>>> OpenBIOS 1.1 [Feb 12 2025 13:02]
>>> Configuration device id QEMU version 1 machine id 1
>>> CPUs: 1
>>> Memory: 128M
>>> UUID: 00000000-0000-0000-0000-000000000000
>>> CPU type PowerPC,G4
> milliseconds isn't unique.
> Welcome to OpenBIOS v1.1 built on Feb 12 2025 13:02
>>> [ppc] Kernel already loaded (0x01000000 + 0x004fcb28) (initrd 0x00000000 +
> 0x00000000)
>>> [ppc] Kernel command line: console=serial
>>> switching to new context:
> OF stdout device is: /pci@f2000000/mac-io@c/escc@13000/ch-a@13020
> Preparing to boot Linux version 6.17.0-rc4+ (ajd@jarvis.ozlabs.ibm.com)
> (powerpc64-linux-gnu-gcc (GCC) 15.2.1 20250808 (Red Hat Cross 15.2.1-1), GNU ld
> version 2.44-1.fc42) #2 Thu Sep  4 16:21:41 AEST 2025
> Detected machine type: 00000400
> command line:
> memory layout at init:
>    memory_limit : 00000000 (16 MB aligned)
>    alloc_bottom : 01501000
>    alloc_top    : 08000000
>    alloc_top_hi : 08000000
>    rmo_top      : 08000000
>    ram_top      : 08000000
> found display   : /pci@f2000000/QEMU,VGA@e, opening... done
> copying OF device tree...
> Building dt strings...
> Building dt structure...
> Device tree strings 0x01502000 -> 0x015010a4
> Device tree struct  0x01503000 -> 0x07de7eb0
> Quiescing Open Firmware ...
> Booting Linux via __start() @ 0x01000000 ...
> Hello World !
> Total memory = 128MB; using 256kB for hash table
> Linux version 6.17.0-rc4+ (ajd@jarvis.ozlabs.ibm.com) (powerpc64-linux-gnu-gcc
> (GCC) 15.2.1 20250808 (Red Hat Cross 15.2.1-1), GNU ld version 2.44-1.fc42) #2
> Thu Sep  4 16:21:41 AEST 2025
> OF: reserved mem: Reserved memory: No reserved-memory node in the DT
> ioremap() called early from pmac_feature_init+0xe0/0xb00. Use early_ioremap()
> instead
> Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0x07
> Mapped at 0xffb9e000
> ioremap() called early from probe_one_macio+0x134/0x24c. Use early_ioremap()
> instead
> Found a Keylargo mac-io controller, rev: 0, mapped at 0x(ptrval)
> PowerMac motherboard: PowerMac G4 AGP Graphics
> ioremap() called early from udbg_scc_init+0x190/0x398. Use early_ioremap()
> instead
> Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
> printk: legacy bootconsole [udbg0] enabled
> -----------------------------------------------------
> phys_mem_size     = 0x8000000
> dcache_bsize      = 0x20
> icache_bsize      = 0x20
> cpu_features      = 0x000000000401a008
>    possible        = 0x00000000277de008
>    always          = 0x0000000000000000
> cpu_user_features = 0x8c000001 0x00000000
> mmu_features      = 0x00000001
> Hash_size         = 0x40000
> Hash_mask         = 0xfff
> -----------------------------------------------------
> ioremap() called early from pmac_setup_arch+0x110/0x224. Use early_ioremap()
> instead
> WARNING ! Your machine is CUDA-based but your kernel
>            wasn't compiled with CONFIG_ADB_CUDA option !
> Zone ranges:
>    DMA      [mem 0x0000000000000000-0x0000000007ffffff]
>    Normal   empty
> Movable zone start for each node
> Early memory node ranges
>    node   0: [mem 0x0000000000000000-0x0000000007ffffff]
> Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
> Kernel panic - not syncing: arch_static_call_transform: patching failed
> func_a+0x0/0x8 at 0x0
> CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.17.0-rc4+ #2 NONE
> Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
> Call Trace:
> [c04b9eb0] [c0292e00] dump_stack_lvl+0x50/0x78 (unreliable)
> [c04b9ed0] [c002d19c] vpanic+0xfc/0x2b4
> [c04b9f00] [c002d3b0] cpu_mitigations_off+0x0/0x14
> [c04b9f40] [c00127ac] fixup_cpc710_pci64+0x0/0x20
> [c04b9f70] [c035082c] static_call_init+0x108/0x140
> [c04b9fa0] [c0342ed0] start_kernel+0x78/0x4a8
> [c04b9ff0] [00003500] 0x3500
> Rebooting in 180 seconds..


