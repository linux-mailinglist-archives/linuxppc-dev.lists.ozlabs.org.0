Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D622118F6B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 15:23:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mGnx6yDCzDr9S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 01:23:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mGMm3zCSzDqsL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 01:04:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=NGCTEGkO; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48mGMl4NFyz8tFV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 01:04:19 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48mGMl31Lgz9sQt; Tue, 24 Mar 2020 01:04:19 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=NGCTEGkO; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48mGMj45v5z9sPF
 for <linuxppc-dev@ozlabs.org>; Tue, 24 Mar 2020 01:04:16 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48mGMR3PSfz9v147;
 Mon, 23 Mar 2020 15:04:03 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NGCTEGkO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lxjyQ4Pazgeu; Mon, 23 Mar 2020 15:04:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48mGMR2HC8z9v146;
 Mon, 23 Mar 2020 15:04:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584972243; bh=4aJMvm00Ll3iGc9Y/CVdKxMKRjJxyyTr+8TfNkQsnzg=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=NGCTEGkOfkJI+kVCKkZKmS6TsabqRaio12F6qhPzW/c8syJ9KzAcHqdFo+8HUQPRZ
 palSqHajn6OgibQb0qE61RQCDfHyVPr10xiQICgcN29b43ypO/pCMjBzQsxZA6C/Ez
 TiUlS08UUvpecKNpjB2ihKbKGPim80dFq2qpQq1Q=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E92E8B76E;
 Mon, 23 Mar 2020 15:04:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qOE7OWvBU4k1; Mon, 23 Mar 2020 15:04:08 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6FA558B752;
 Mon, 23 Mar 2020 15:04:07 +0100 (CET)
Subject: Re: [RFC PATCH 0/3] Use per-CPU temporary mappings for patching
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <173d34a7-a178-ed52-df92-eac8e47d347c@c-s.fr>
Message-ID: <3bfcb682-a33a-b41c-74c6-4bae0d277ddf@c-s.fr>
Date: Mon, 23 Mar 2020 14:04:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <173d34a7-a178-ed52-df92-eac8e47d347c@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/23/2020 11:30 AM, Christophe Leroy wrote:
> 
> 
> On 03/23/2020 04:52 AM, Christopher M. Riedl wrote:
>> When compiled with CONFIG_STRICT_KERNEL_RWX, the kernel must create
>> temporary mappings when patching itself. These mappings temporarily
>> override the strict RWX text protections to permit a write. Currently,
>> powerpc allocates a per-CPU VM area for patching. Patching occurs as
>> follows:
>>
>>     1. Map page of text to be patched to per-CPU VM area w/
>>        PAGE_KERNEL protection
>>     2. Patch text
>>     3. Remove the temporary mapping
>>
>> While the VM area is per-CPU, the mapping is actually inserted into the
>> kernel page tables. Presumably, this could allow another CPU to access
>> the normally write-protected text - either malicously or accidentally -
>> via this same mapping if the address of the VM area is known. Ideally,
>> the mapping should be kept local to the CPU doing the patching (or any
>> other sensitive operations requiring temporarily overriding memory
>> protections) [0].
>>
>> x86 introduced "temporary mm" structs which allow the creation of
>> mappings local to a particular CPU [1]. This series intends to bring the
>> notion of a temporary mm to powerpc and harden powerpc by using such a
>> mapping for patching a kernel with strict RWX permissions.
>>
>> The first patch introduces the temporary mm struct and API for powerpc
>> along with a new function to retrieve a current hw breakpoint.
>>
>> The second patch uses the `poking_init` init hook added by the x86
>> patches to initialize a temporary mm and patching address. The patching
>> address is randomized between 0 and DEFAULT_MAP_WINDOW-PAGE_SIZE. The
>> upper limit is necessary due to how the hash MMU operates - by default
>> the space above DEFAULT_MAP_WINDOW is not available. For now, both hash
>> and radix randomize inside this range. The number of possible random
>> addresses is dependent on PAGE_SIZE and limited by DEFAULT_MAP_WINDOW.
>>
>> Bits of entropy with 64K page size on BOOK3S_64:
>>
>>     bits-o-entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)
>>
>>     PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
>>     bits-o-entropy = log2(128TB / 64K)
>>     bits-o-entropy = 31
>>
>> Currently, randomization occurs only once during initialization at boot.
>>
>> The third patch replaces the VM area with the temporary mm in the
>> patching code. The page for patching has to be mapped PAGE_SHARED with
>> the hash MMU since hash prevents the kernel from accessing userspace
>> pages with PAGE_PRIVILEGED bit set. There is on-going work on my side to
>> explore if this is actually necessary in the hash codepath.
>>
>> Testing so far is limited to booting on QEMU (power8 and power9 targets)
>> and a POWER8 VM along with setting some simple xmon breakpoints (which
>> makes use of code-patching). A POC lkdtm test is in-progress to actually
>> exploit the existing vulnerability (ie. the mapping during patching is
>> exposed in kernel page tables and accessible by other CPUS) - this will
>> accompany a future v1 of this series.
> 
> Got following failures on an 8xx. Note that "fault blocked by AP 
> register !" means an unauthorised access from Kernel to Userspace.
> 

Still a problem even without CONFIG_PPC_KUAP:

[    5.901899] ------------[ cut here ]------------
[    5.906329] WARNING: CPU: 0 PID: 1 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[    5.915658] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[    5.925610] NIP:  c0012468 LR: c0012460 CTR: 00000000
[    5.930614] REGS: c9023db0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[    5.940310] MSR:  00021032 <ME,IR,DR,RI>  CR: 44000822  XER: 20000000
[    5.946677]
[    5.946677] GPR00: 3d6a4000 c9023e68 c60ec000 00000001 c9023ea8 
00000004 c0001188 00000004
[    5.946677] GPR08: 00000000 00000000 00000000 c53720f0 22000222 
00000000 c0003964 00000000
[    5.946677] GPR16: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    5.946677] GPR24: 00000000 00000000 c0730000 00009032 c0734a88 
c0730000 c0001188 00000000
[    5.981416] NIP [c0012468] patch_instruction+0x20c/0x324
[    5.986656] LR [c0012460] patch_instruction+0x204/0x324
[    5.991772] Call Trace:
[    5.994231] [c9023e68] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[    6.001201] [c9023ee8] [c0010470] mmu_mark_initmem_nx+0x44/0x124
[    6.007132] [c9023f18] [c000e3cc] free_initmem+0x20/0x58
[    6.012383] [c9023f28] [c0003980] kernel_init+0x1c/0x130
[    6.017630] [c9023f38] [c000d174] ret_from_kernel_thread+0x14/0x1c
[    6.023698] Instruction dump:
[    6.026635] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[    6.034293] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[    6.042128] ---[ end trace c46738768244c84e ]---
[    6.047021] ------------[ cut here ]------------
[    6.051422] WARNING: CPU: 0 PID: 1 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[    6.060756] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[    6.070708] NIP:  c0012468 LR: c0012460 CTR: 00000000
[    6.075712] REGS: c9023db0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[    6.085408] MSR:  00021032 <ME,IR,DR,RI>  CR: 44000822  XER: 20000000
[    6.091775]
[    6.091775] GPR00: 2b8ac060 c9023e68 c60ec000 00000001 c9023ea8 
00000004 c000111c 00000004
[    6.091775] GPR08: 00000000 00000000 00000000 c53720f0 22000222 
00000000 c0003964 00000000
[    6.091775] GPR16: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    6.091775] GPR24: 00000000 00000000 c0730000 00009032 c0734a88 
c0730000 c000111c 00000000
[    6.126510] NIP [c0012468] patch_instruction+0x20c/0x324
[    6.131754] LR [c0012460] patch_instruction+0x204/0x324
[    6.136870] Call Trace:
[    6.139329] [c9023e68] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[    6.146299] [c9023ee8] [c00104a8] mmu_mark_initmem_nx+0x7c/0x124
[    6.152229] [c9023f18] [c000e3cc] free_initmem+0x20/0x58
[    6.157480] [c9023f28] [c0003980] kernel_init+0x1c/0x130
[    6.162729] [c9023f38] [c000d174] ret_from_kernel_thread+0x14/0x1c
[    6.168796] Instruction dump:
[    6.171733] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[    6.179391] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[    6.187226] ---[ end trace c46738768244c84f ]---
[    6.203450] Freeing unused kernel memory: 496K
[    6.207700] ------------[ cut here ]------------
[    6.212280] WARNING: CPU: 0 PID: 1 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[    6.221605] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[    6.231556] NIP:  c0012468 LR: c0012460 CTR: 00000000
[    6.236559] REGS: c9023da0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[    6.246256] MSR:  00021032 <ME,IR,DR,RI>  CR: 88000222  XER: 20000000
[    6.252622]
[    6.252622] GPR00: 3d6aff80 c9023e58 c60ec000 00000001 c9023e98 
00000004 c00012b0 00000004
[    6.252622] GPR08: 00000000 fffffffe 00000000 00000000 28000224 
00000000 c0003964 00000000
[    6.252622] GPR16: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    6.252622] GPR24: 00000000 00000000 c0730000 00009032 c0734a88 
c0730000 c00012b0 00000000
[    6.287362] NIP [c0012468] patch_instruction+0x20c/0x324
[    6.292602] LR [c0012460] patch_instruction+0x204/0x324
[    6.297718] Call Trace:
[    6.300178] [c9023e58] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[    6.307148] [c9023ed8] [c0010598] mmu_mark_rodata_ro+0x48/0xf8
[    6.312907] [c9023f08] [c000edf0] mark_rodata_ro+0xc4/0xd8
[    6.318327] [c9023f28] [c0003998] kernel_init+0x34/0x130
[    6.323576] [c9023f38] [c000d174] ret_from_kernel_thread+0x14/0x1c
[    6.329643] Instruction dump:
[    6.332580] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[    6.340238] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[    6.348074] ---[ end trace c46738768244c850 ]---

[   10.024271] ------------[ cut here ]------------
[   10.028719] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   10.038218] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   10.047999] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   10.053003] REGS: ca473960 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   10.062699] MSR:  00021032 <ME,IR,DR,RI>  CR: 48008842  XER: 20000000
[   10.069066]
[   10.069066] GPR00: 48000028 ca473a18 c65f2ae0 00000001 ca473a58 
00000004 c045b304 00000004
[   10.069066] GPR08: 00000000 00000000 00000000 00000004 c6276b2c 
10093080 00000000 00000000
[   10.069066] GPR16: 00000000 c0665cac 00000000 c6619050 c6619070 
00000000 c63e5800 ca473bb0
[   10.069066] GPR24: 00000001 00000001 c0730000 00009032 c0734a88 
c0730000 c045b304 00000000
[   10.103800] NIP [c0012468] patch_instruction+0x20c/0x324
[   10.109041] LR [c0012460] patch_instruction+0x204/0x324
[   10.114161] Call Trace:
[   10.116617] [ca473a18] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   10.123592] [ca473a98] [c00bfdd8] jump_label_update+0xe0/0x128
[   10.129353] [ca473ac8] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   10.136324] [ca473ad8] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   10.142512] [ca473b08] [c041c6c8] nf_register_net_hook+0x28/0x94
[   10.148458] [ca473b28] [c0440230] nf_tables_newchain+0x894/0xc04
[   10.154395] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   10.160415] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   10.165943] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   10.171610] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   10.177281] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   10.182873] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   10.188304] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   10.193638] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   10.199143] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   10.204645] --- interrupt: c01 at 0xfd95304
[   10.204645]     LR = 0xfd952e4
[   10.211752] Instruction dump:
[   10.214688] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   10.222346] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   10.230182] ---[ end trace c46738768244c851 ]---
[   10.235177] ------------[ cut here ]------------
[   10.239561] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   10.249067] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   10.258848] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   10.263852] REGS: ca473960 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   10.273547] MSR:  00021032 <ME,IR,DR,RI>  CR: 48008842  XER: 20000000
[   10.279915]
[   10.279915] GPR00: 4800001c ca473a18 c65f2ae0 00000001 ca473a58 
00000004 c045f8b8 00000004
[   10.279915] GPR08: 00000000 00000000 00000000 00000004 c6276b4c 
10093080 00000000 00000000
[   10.279915] GPR16: 00000000 c0665cac 00000000 c661909c c66190bc 
00000000 c63e5800 ca473bb0
[   10.279915] GPR24: 00000001 00000001 c0730000 00009032 c0734a88 
c0730000 c045f8b8 00000000
[   10.314647] NIP [c0012468] patch_instruction+0x20c/0x324
[   10.319890] LR [c0012460] patch_instruction+0x204/0x324
[   10.325009] Call Trace:
[   10.327465] [ca473a18] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   10.334439] [ca473a98] [c00bfdd8] jump_label_update+0xe0/0x128
[   10.340202] [ca473ac8] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   10.347173] [ca473ad8] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   10.353361] [ca473b08] [c041c6c8] nf_register_net_hook+0x28/0x94
[   10.359308] [ca473b28] [c0440230] nf_tables_newchain+0x894/0xc04
[   10.365243] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   10.371263] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   10.376792] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   10.382459] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   10.388130] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   10.393721] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   10.399150] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   10.404486] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   10.409993] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   10.415494] --- interrupt: c01 at 0xfd95304
[   10.415494]     LR = 0xfd952e4
[   10.422600] Instruction dump:
[   10.425536] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   10.433195] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   10.441030] ---[ end trace c46738768244c852 ]---
[   10.445997] ------------[ cut here ]------------
[   10.450411] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   10.459916] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   10.469696] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   10.474700] REGS: ca473960 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   10.484396] MSR:  00021032 <ME,IR,DR,RI>  CR: 48008842  XER: 20000000
[   10.490763]
[   10.490763] GPR00: 480000f8 ca473a18 c65f2ae0 00000001 ca473a58 
00000004 c048eaf0 00000004
[   10.490763] GPR08: 00000000 00000000 00000000 00000004 c6276b4c 
10093080 00000000 00000000
[   10.490763] GPR16: 00000000 c0665cac 00000000 c661909c c66190bc 
00000000 c63e5800 ca473bb0
[   10.490763] GPR24: 00000001 00000001 c0730000 00009032 c0734a88 
c0730000 c048eaf0 00000000
[   10.525498] NIP [c0012468] patch_instruction+0x20c/0x324
[   10.530738] LR [c0012460] patch_instruction+0x204/0x324
[   10.535858] Call Trace:
[   10.538313] [ca473a18] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   10.545287] [ca473a98] [c00bfdd8] jump_label_update+0xe0/0x128
[   10.551049] [ca473ac8] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   10.558022] [ca473ad8] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   10.564209] [ca473b08] [c041c6c8] nf_register_net_hook+0x28/0x94
[   10.570155] [ca473b28] [c0440230] nf_tables_newchain+0x894/0xc04
[   10.576092] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   10.582112] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   10.587639] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   10.593307] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   10.598978] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   10.604569] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   10.609999] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   10.615334] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   10.620841] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   10.626342] --- interrupt: c01 at 0xfd95304
[   10.626342]     LR = 0xfd952e4
[   10.633449] Instruction dump:
[   10.636385] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   10.644043] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   10.651879] ---[ end trace c46738768244c853 ]---
[   10.656931] ------------[ cut here ]------------
[   10.661347] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   10.670850] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   10.680631] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   10.685635] REGS: ca473960 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   10.695330] MSR:  00021032 <ME,IR,DR,RI>  CR: 48008842  XER: 20000000
[   10.701699]
[   10.701699] GPR00: 4800008c ca473a18 c65f2ae0 00000001 ca473a58 
00000004 c045ca54 00000004
[   10.701699] GPR08: 00000000 00000000 00000000 00000004 c6276b6c 
10093080 00000000 00000000
[   10.701699] GPR16: 00000000 c0665cac 00000000 c66190e8 c6619108 
00000000 c63e5800 ca473bb0
[   10.701699] GPR24: 00000001 00000001 c0730000 00009032 c0734a88 
c0730000 c045ca54 00000000
[   10.736428] NIP [c0012468] patch_instruction+0x20c/0x324
[   10.741673] LR [c0012460] patch_instruction+0x204/0x324
[   10.746792] Call Trace:
[   10.749249] [ca473a18] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   10.756222] [ca473a98] [c00bfdd8] jump_label_update+0xe0/0x128
[   10.761986] [ca473ac8] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   10.768956] [ca473ad8] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   10.775144] [ca473b08] [c041c6c8] nf_register_net_hook+0x28/0x94
[   10.781091] [ca473b28] [c0440230] nf_tables_newchain+0x894/0xc04
[   10.787026] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   10.793046] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   10.798576] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   10.804241] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   10.809913] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   10.815505] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   10.820933] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   10.826268] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   10.831776] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   10.837277] --- interrupt: c01 at 0xfd95304
[   10.837277]     LR = 0xfd952e4
[   10.844383] Instruction dump:
[   10.847319] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   10.854978] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   10.862813] ---[ end trace c46738768244c854 ]---
[   10.867709] ------------[ cut here ]------------
[   10.872107] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   10.881612] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   10.891393] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   10.896397] REGS: ca473960 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   10.906092] MSR:  00021032 <ME,IR,DR,RI>  CR: 48008842  XER: 20000000
[   10.912460]
[   10.912460] GPR00: 48000008 ca473a18 c65f2ae0 00000001 ca473a58 
00000004 c04bdcf8 00000004
[   10.912460] GPR08: 00000000 00000000 00000000 00000004 c6276b6c 
10093080 00000000 00000000
[   10.912460] GPR16: 00000000 c0665cac 00000000 c66190e8 c6619108 
00000000 c63e5800 ca473bb0
[   10.912460] GPR24: 00000001 00000001 c0730000 00009032 c0734a88 
c0730000 c04bdcf8 00000000
[   10.947193] NIP [c0012468] patch_instruction+0x20c/0x324
[   10.952435] LR [c0012460] patch_instruction+0x204/0x324
[   10.957555] Call Trace:
[   10.960011] [ca473a18] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   10.966984] [ca473a98] [c00bfdd8] jump_label_update+0xe0/0x128
[   10.972747] [ca473ac8] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   10.979720] [ca473ad8] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   10.985907] [ca473b08] [c041c6c8] nf_register_net_hook+0x28/0x94
[   10.991853] [ca473b28] [c0440230] nf_tables_newchain+0x894/0xc04
[   10.997790] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   11.003808] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   11.009337] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   11.015005] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   11.020675] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   11.026267] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   11.031696] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   11.037031] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   11.042537] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   11.048039] --- interrupt: c01 at 0xfd95304
[   11.048039]     LR = 0xfd952e4
[   11.055146] Instruction dump:
[   11.058082] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   11.065741] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   11.073576] ---[ end trace c46738768244c855 ]---
[   11.078537] ------------[ cut here ]------------
[   11.082954] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   11.092461] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   11.102242] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   11.107246] REGS: ca473960 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   11.116941] MSR:  00021032 <ME,IR,DR,RI>  CR: 48008842  XER: 20000000
[   11.123309]
[   11.123309] GPR00: 4bfffdd8 ca473a18 c65f2ae0 00000001 ca473a58 
00000004 c04bdf28 00000004
[   11.123309] GPR08: 00000000 00000000 00000000 00000004 c6276b6c 
10093080 00000000 00000000
[   11.123309] GPR16: 00000000 c0665cac 00000000 c66190e8 c6619108 
00000000 c63e5800 ca473bb0
[   11.123309] GPR24: 00000001 00000001 c0730000 00009032 c0734a88 
c0730000 c04bdf28 00000000
[   11.158041] NIP [c0012468] patch_instruction+0x20c/0x324
[   11.163283] LR [c0012460] patch_instruction+0x204/0x324
[   11.168403] Call Trace:
[   11.170859] [ca473a18] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   11.177834] [ca473a98] [c00bfdd8] jump_label_update+0xe0/0x128
[   11.183596] [ca473ac8] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   11.190567] [ca473ad8] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   11.196754] [ca473b08] [c041c6c8] nf_register_net_hook+0x28/0x94
[   11.202701] [ca473b28] [c0440230] nf_tables_newchain+0x894/0xc04
[   11.208637] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   11.214656] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   11.220185] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   11.225852] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   11.231524] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   11.237115] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   11.242545] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   11.247880] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   11.253386] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   11.258888] --- interrupt: c01 at 0xfd95304
[   11.258888]     LR = 0xfd952e4
[   11.265994] Instruction dump:
[   11.268931] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   11.276588] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   11.284424] ---[ end trace c46738768244c856 ]---
[   11.289492] ------------[ cut here ]------------
[   11.293889] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   11.303396] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   11.313176] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   11.318180] REGS: ca4738d0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   11.327876] MSR:  00021032 <ME,IR,DR,RI>  CR: 44008442  XER: 20000000
[   11.334243]
[   11.334243] GPR00: 48000104 ca473988 c65f2ae0 00000001 ca4739c8 
00000004 c045a954 00000004
[   11.334243] GPR08: 00000000 00000000 00000000 00000004 c6276b8c 
10093080 00000000 00000000
[   11.334243] GPR16: 00000000 c0665dd8 00000000 c6619134 c08e7340 
c63e5800 ca473c34 c625d6b0
[   11.334243] GPR24: 00000002 00000001 c0730000 00009032 c0734a88 
c0730000 c045a954 00000000
[   11.368977] NIP [c0012468] patch_instruction+0x20c/0x324
[   11.374218] LR [c0012460] patch_instruction+0x204/0x324
[   11.379338] Call Trace:
[   11.381794] [ca473988] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   11.388767] [ca473a08] [c00bfdd8] jump_label_update+0xe0/0x128
[   11.394530] [ca473a38] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   11.401500] [ca473a48] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   11.407689] [ca473a78] [c041c6c8] nf_register_net_hook+0x28/0x94
[   11.413628] [ca473a98] [c041c778] nf_register_net_hooks+0x44/0xac
[   11.419665] [ca473ab8] [c04caaf4] nf_defrag_ipv4_enable+0x80/0x94
[   11.425704] [ca473ad8] [c0426a00] nf_ct_netns_do_get+0x164/0x1d4
[   11.431642] [ca473af8] [c044e894] nft_ct_helper_obj_init+0x154/0x1d0
[   11.437898] [ca473b28] [c043f450] nft_obj_init+0xd4/0x178
[   11.443234] [ca473b48] [c0442b80] nf_tables_newobj+0x2e8/0x444
[   11.449003] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   11.455023] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   11.460548] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   11.466220] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   11.471891] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   11.477482] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   11.482910] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   11.488246] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   11.493753] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   11.499255] --- interrupt: c01 at 0xfd95304
[   11.499255]     LR = 0xfd952e4
[   11.506361] Instruction dump:
[   11.509298] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   11.516956] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   11.524792] ---[ end trace c46738768244c857 ]---
[   11.529687] ------------[ cut here ]------------
[   11.534086] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   11.543591] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   11.553372] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   11.558377] REGS: ca4738d0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   11.568071] MSR:  00021032 <ME,IR,DR,RI>  CR: 44008442  XER: 20000000
[   11.574438]
[   11.574438] GPR00: 48000010 ca473988 c65f2ae0 00000001 ca4739c8 
00000004 c045b3dc 00000004
[   11.574438] GPR08: 00000000 00000000 00000000 00000004 c6276b8c 
10093080 00000000 00000000
[   11.574438] GPR16: 00000000 c0665dd8 00000000 c6619134 c08e7340 
c63e5800 ca473c34 c625d6b0
[   11.574438] GPR24: 00000002 00000001 c0730000 00009032 c0734a88 
c0730000 c045b3dc 00000000
[   11.609176] NIP [c0012468] patch_instruction+0x20c/0x324
[   11.614413] LR [c0012460] patch_instruction+0x204/0x324
[   11.619533] Call Trace:
[   11.621989] [ca473988] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   11.628963] [ca473a08] [c00bfdd8] jump_label_update+0xe0/0x128
[   11.634725] [ca473a38] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   11.641697] [ca473a48] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   11.647885] [ca473a78] [c041c6c8] nf_register_net_hook+0x28/0x94
[   11.653823] [ca473a98] [c041c778] nf_register_net_hooks+0x44/0xac
[   11.659862] [ca473ab8] [c04caaf4] nf_defrag_ipv4_enable+0x80/0x94
[   11.665899] [ca473ad8] [c0426a00] nf_ct_netns_do_get+0x164/0x1d4
[   11.671837] [ca473af8] [c044e894] nft_ct_helper_obj_init+0x154/0x1d0
[   11.678092] [ca473b28] [c043f450] nft_obj_init+0xd4/0x178
[   11.683430] [ca473b48] [c0442b80] nf_tables_newobj+0x2e8/0x444
[   11.689200] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   11.695219] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   11.700744] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   11.706417] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   11.712087] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   11.717678] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   11.723106] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   11.728442] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   11.733949] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   11.739450] --- interrupt: c01 at 0xfd95304
[   11.739450]     LR = 0xfd952e4
[   11.746556] Instruction dump:
[   11.749492] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   11.757151] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   11.764987] ---[ end trace c46738768244c858 ]---
[   11.769879] ------------[ cut here ]------------
[   11.774281] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   11.783787] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   11.793567] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   11.798571] REGS: ca4738d0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   11.808266] MSR:  00021032 <ME,IR,DR,RI>  CR: 44008442  XER: 20000000
[   11.814633]
[   11.814633] GPR00: 48000048 ca473988 c65f2ae0 00000001 ca4739c8 
00000004 c04ce9d8 00000004
[   11.814633] GPR08: 00000000 00000000 00000000 00000004 c6276b8c 
10093080 00000000 00000000
[   11.814633] GPR16: 00000000 c0665dd8 00000000 c6619134 c08e7340 
c63e5800 ca473c34 c625d6b0
[   11.814633] GPR24: 00000002 00000001 c0730000 00009032 c0734a88 
c0730000 c04ce9d8 00000000
[   11.849366] NIP [c0012468] patch_instruction+0x20c/0x324
[   11.854610] LR [c0012460] patch_instruction+0x204/0x324
[   11.859728] Call Trace:
[   11.862184] [ca473988] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   11.869161] [ca473a08] [c00bfdd8] jump_label_update+0xe0/0x128
[   11.874920] [ca473a38] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   11.881891] [ca473a48] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   11.888080] [ca473a78] [c041c6c8] nf_register_net_hook+0x28/0x94
[   11.894018] [ca473a98] [c041c778] nf_register_net_hooks+0x44/0xac
[   11.900055] [ca473ab8] [c04caaf4] nf_defrag_ipv4_enable+0x80/0x94
[   11.906096] [ca473ad8] [c0426a00] nf_ct_netns_do_get+0x164/0x1d4
[   11.912034] [ca473af8] [c044e894] nft_ct_helper_obj_init+0x154/0x1d0
[   11.918287] [ca473b28] [c043f450] nft_obj_init+0xd4/0x178
[   11.923625] [ca473b48] [c0442b80] nf_tables_newobj+0x2e8/0x444
[   11.929393] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   11.935414] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   11.940938] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   11.946610] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   11.952282] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   11.957873] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   11.963303] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   11.968637] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   11.974144] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   11.979646] --- interrupt: c01 at 0xfd95304
[   11.979646]     LR = 0xfd952e4
[   11.986751] Instruction dump:
[   11.989688] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   11.997346] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   12.005182] ---[ end trace c46738768244c859 ]---
[   12.010129] ------------[ cut here ]------------
[   12.014564] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   12.024068] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   12.033847] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   12.038852] REGS: ca4738f0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   12.048547] MSR:  00021032 <ME,IR,DR,RI>  CR: 44008442  XER: 20000000
[   12.054914]
[   12.054914] GPR00: 48000008 ca4739a8 c65f2ae0 00000001 ca4739e8 
00000004 c0460db8 00000004
[   12.054914] GPR08: 00000000 00000000 00000000 c66a4508 c6276bac 
10093080 00000000 00000000
[   12.054914] GPR16: 00000000 c0665dd8 00000000 c6619134 c08e7340 
c63e5800 ca473c34 c625d6b0
[   12.054914] GPR24: 00000002 00000001 c0730000 00009032 c0734a88 
c0730000 c0460db8 00000000
[   12.089649] NIP [c0012468] patch_instruction+0x20c/0x324
[   12.094891] LR [c0012460] patch_instruction+0x204/0x324
[   12.100009] Call Trace:
[   12.102466] [ca4739a8] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   12.109439] [ca473a28] [c00bfdd8] jump_label_update+0xe0/0x128
[   12.115202] [ca473a58] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   12.122172] [ca473a68] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   12.128361] [ca473a98] [c041c6c8] nf_register_net_hook+0x28/0x94
[   12.134299] [ca473ab8] [c041c778] nf_register_net_hooks+0x44/0xac
[   12.140354] [ca473ad8] [c0426a28] nf_ct_netns_do_get+0x18c/0x1d4
[   12.146290] [ca473af8] [c044e894] nft_ct_helper_obj_init+0x154/0x1d0
[   12.152545] [ca473b28] [c043f450] nft_obj_init+0xd4/0x178
[   12.157883] [ca473b48] [c0442b80] nf_tables_newobj+0x2e8/0x444
[   12.163650] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   12.169671] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   12.175195] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   12.180868] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   12.186539] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   12.192130] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   12.197558] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   12.202894] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   12.208401] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   12.213903] --- interrupt: c01 at 0xfd95304
[   12.213903]     LR = 0xfd952e4
[   12.221008] Instruction dump:
[   12.223945] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   12.231603] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   12.239438] ---[ end trace c46738768244c85a ]---
[   12.244413] ------------[ cut here ]------------
[   12.248824] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   12.258325] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   12.268105] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   12.273110] REGS: ca4738f0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   12.282804] MSR:  00021032 <ME,IR,DR,RI>  CR: 44008442  XER: 20000000
[   12.289171]
[   12.289171] GPR00: 4800009c ca4739a8 c65f2ae0 00000001 ca4739e8 
00000004 c0460e6c 00000004
[   12.289171] GPR08: 00000000 00000000 00000000 c66a4508 c6276bac 
10093080 00000000 00000000
[   12.289171] GPR16: 00000000 c0665dd8 00000000 c6619134 c08e7340 
c63e5800 ca473c34 c625d6b0
[   12.289171] GPR24: 00000002 00000001 c0730000 00009032 c0734a88 
c0730000 c0460e6c 00000000
[   12.323909] NIP [c0012468] patch_instruction+0x20c/0x324
[   12.329146] LR [c0012460] patch_instruction+0x204/0x324
[   12.334267] Call Trace:
[   12.336722] [ca4739a8] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   12.343696] [ca473a28] [c00bfdd8] jump_label_update+0xe0/0x128
[   12.349458] [ca473a58] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   12.356430] [ca473a68] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   12.362618] [ca473a98] [c041c6c8] nf_register_net_hook+0x28/0x94
[   12.368556] [ca473ab8] [c041c778] nf_register_net_hooks+0x44/0xac
[   12.374607] [ca473ad8] [c0426a28] nf_ct_netns_do_get+0x18c/0x1d4
[   12.380551] [ca473af8] [c044e894] nft_ct_helper_obj_init+0x154/0x1d0
[   12.386801] [ca473b28] [c043f450] nft_obj_init+0xd4/0x178
[   12.392139] [ca473b48] [c0442b80] nf_tables_newobj+0x2e8/0x444
[   12.397909] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   12.403928] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   12.409452] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   12.415125] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   12.420795] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   12.426387] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   12.431814] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   12.437151] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   12.442658] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   12.448160] --- interrupt: c01 at 0xfd95304
[   12.448160]     LR = 0xfd952e4
[   12.455265] Instruction dump:
[   12.458202] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   12.465860] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   12.473696] ---[ end trace c46738768244c85b ]---
[   12.478748] ------------[ cut here ]------------
[   12.483165] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   12.492667] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   12.502449] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   12.507453] REGS: ca4738f0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   12.517147] MSR:  00021032 <ME,IR,DR,RI>  CR: 44008442  XER: 20000000
[   12.523515]
[   12.523515] GPR00: 48000008 ca4739a8 c65f2ae0 00000001 ca4739e8 
00000004 c0460e84 00000004
[   12.523515] GPR08: 00000000 00000000 00000000 c66a4508 c6276bac 
10093080 00000000 00000000
[   12.523515] GPR16: 00000000 c0665dd8 00000000 c6619134 c08e7340 
c63e5800 ca473c34 c625d6b0
[   12.523515] GPR24: 00000002 00000001 c0730000 00009032 c0734a88 
c0730000 c0460e84 00000000
[   12.558246] NIP [c0012468] patch_instruction+0x20c/0x324
[   12.563490] LR [c0012460] patch_instruction+0x204/0x324
[   12.568609] Call Trace:
[   12.571066] [ca4739a8] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   12.578040] [ca473a28] [c00bfdd8] jump_label_update+0xe0/0x128
[   12.583802] [ca473a58] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   12.590772] [ca473a68] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   12.596961] [ca473a98] [c041c6c8] nf_register_net_hook+0x28/0x94
[   12.602899] [ca473ab8] [c041c778] nf_register_net_hooks+0x44/0xac
[   12.608952] [ca473ad8] [c0426a28] nf_ct_netns_do_get+0x18c/0x1d4
[   12.614892] [ca473af8] [c044e894] nft_ct_helper_obj_init+0x154/0x1d0
[   12.621144] [ca473b28] [c043f450] nft_obj_init+0xd4/0x178
[   12.626482] [ca473b48] [c0442b80] nf_tables_newobj+0x2e8/0x444
[   12.632251] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   12.638271] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   12.643795] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   12.649467] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   12.655139] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   12.660730] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   12.666159] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   12.671495] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   12.677000] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   12.682503] --- interrupt: c01 at 0xfd95304
[   12.682503]     LR = 0xfd952e4
[   12.689609] Instruction dump:
[   12.692545] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   12.700203] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   12.708039] ---[ end trace c46738768244c85c ]---
[   12.713016] ------------[ cut here ]------------
[   12.717423] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   12.726924] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   12.736705] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   12.741710] REGS: ca4738f0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   12.751404] MSR:  00021032 <ME,IR,DR,RI>  CR: 44008442  XER: 20000000
[   12.757772]
[   12.757772] GPR00: 48000028 ca4739a8 c65f2ae0 00000001 ca4739e8 
00000004 c046102c 00000004
[   12.757772] GPR08: 00000000 00000000 00000000 c66a4508 c6276bac 
10093080 00000000 00000000
[   12.757772] GPR16: 00000000 c0665dd8 00000000 c6619134 c08e7340 
c63e5800 ca473c34 c625d6b0
[   12.757772] GPR24: 00000002 00000001 c0730000 00009032 c0734a88 
c0730000 c046102c 00000000
[   12.792504] NIP [c0012468] patch_instruction+0x20c/0x324
[   12.797747] LR [c0012460] patch_instruction+0x204/0x324
[   12.802867] Call Trace:
[   12.805323] [ca4739a8] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   12.812295] [ca473a28] [c00bfdd8] jump_label_update+0xe0/0x128
[   12.818059] [ca473a58] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   12.825030] [ca473a68] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   12.831217] [ca473a98] [c041c6c8] nf_register_net_hook+0x28/0x94
[   12.837156] [ca473ab8] [c041c778] nf_register_net_hooks+0x44/0xac
[   12.843211] [ca473ad8] [c0426a28] nf_ct_netns_do_get+0x18c/0x1d4
[   12.849148] [ca473af8] [c044e894] nft_ct_helper_obj_init+0x154/0x1d0
[   12.855401] [ca473b28] [c043f450] nft_obj_init+0xd4/0x178
[   12.860740] [ca473b48] [c0442b80] nf_tables_newobj+0x2e8/0x444
[   12.866507] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   12.872528] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   12.878053] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   12.883725] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   12.889395] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   12.894987] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   12.900414] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   12.905751] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   12.911258] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   12.916760] --- interrupt: c01 at 0xfd95304
[   12.916760]     LR = 0xfd952e4
[   12.923865] Instruction dump:
[   12.926802] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   12.934460] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   12.942296] ---[ end trace c46738768244c85d ]---
[   12.947193] ------------[ cut here ]------------
[   12.951591] WARNING: CPU: 0 PID: 153 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[   12.961095] CPU: 0 PID: 153 Comm: nft Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3526
[   12.970876] NIP:  c0012468 LR: c0012460 CTR: 00000000
[   12.975881] REGS: ca4738f0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[   12.985575] MSR:  00021032 <ME,IR,DR,RI>  CR: 44008442  XER: 20000000
[   12.991942]
[   12.991942] GPR00: 48000028 ca4739a8 c65f2ae0 00000001 ca4739e8 
00000004 c04cf028 00000004
[   12.991942] GPR08: 00000000 00000000 00000000 c66a4508 c6276bac 
10093080 00000000 00000000
[   12.991942] GPR16: 00000000 c0665dd8 00000000 c6619134 c08e7340 
c63e5800 ca473c34 c625d6b0
[   12.991942] GPR24: 00000002 00000001 c0730000 00009032 c0734a88 
c0730000 c04cf028 00000000
[   13.026676] NIP [c0012468] patch_instruction+0x20c/0x324
[   13.031919] LR [c0012460] patch_instruction+0x204/0x324
[   13.037037] Call Trace:
[   13.039493] [ca4739a8] [c001242c] patch_instruction+0x1d0/0x324 
(unreliable)
[   13.046468] [ca473a28] [c00bfdd8] jump_label_update+0xe0/0x128
[   13.052229] [ca473a58] [c00bfff0] 
static_key_slow_inc_cpuslocked+0x108/0x114
[   13.059197] [ca473a68] [c041c3e8] __nf_register_net_hook+0xb0/0x1a4
[   13.065389] [ca473a98] [c041c6c8] nf_register_net_hook+0x28/0x94
[   13.071328] [ca473ab8] [c041c778] nf_register_net_hooks+0x44/0xac
[   13.077378] [ca473ad8] [c0426a28] nf_ct_netns_do_get+0x18c/0x1d4
[   13.083323] [ca473af8] [c044e894] nft_ct_helper_obj_init+0x154/0x1d0
[   13.089572] [ca473b28] [c043f450] nft_obj_init+0xd4/0x178
[   13.094910] [ca473b48] [c0442b80] nf_tables_newobj+0x2e8/0x444
[   13.100680] [ca473ba8] [c041ede0] nfnetlink_rcv_batch+0x438/0x4c0
[   13.106699] [ca473ca8] [c041ef80] nfnetlink_rcv+0x118/0x138
[   13.112223] [ca473cd8] [c040f138] netlink_unicast+0x18c/0x240
[   13.117895] [ca473d08] [c040fa14] netlink_sendmsg+0x278/0x398
[   13.123566] [ca473d58] [c03ace48] ____sys_sendmsg+0xac/0x1e4
[   13.129158] [ca473db8] [c03ad174] ___sys_sendmsg+0x64/0x88
[   13.134585] [ca473ea8] [c03aeea0] __sys_sendmsg+0x44/0x88
[   13.139922] [ca473f08] [c03af3d8] sys_socketcall+0xf4/0x1fc
[   13.145429] [ca473f38] [c000d0c0] ret_from_syscall+0x0/0x34
[   13.150931] --- interrupt: c01 at 0xfd95304
[   13.150931]     LR = 0xfd952e4
[   13.158036] Instruction dump:
[   13.160973] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[   13.168631] 7fc3f378 48000855 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[   13.176467] ---[ end trace c46738768244c85e ]---


Christophe


