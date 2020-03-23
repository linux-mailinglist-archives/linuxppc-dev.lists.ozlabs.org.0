Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061918F3D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 12:37:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mC6d08wbzDqJM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 22:37:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mC0C0KBCzDqBW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 22:32:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=q924BTFW; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48mC094BK0z8tHw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 22:32:09 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48mC0915lBz9sRY; Mon, 23 Mar 2020 22:32:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=q924BTFW; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48mC061p78z9sQt
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 22:32:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48mBzt4FCwz9txs2;
 Mon, 23 Mar 2020 12:31:54 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=q924BTFW; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PaA2bhS44x6q; Mon, 23 Mar 2020 12:31:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48mBzt2CWSz9txs1;
 Mon, 23 Mar 2020 12:31:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584963114; bh=FfCcQ9Nucnv18PfnibrE9ImY5aDSBg5XytBcBnBhxe0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=q924BTFWFCQjvllh42EjYyC6aDHrqVJqhdX6NJdZyTZHldZ8XlX6mLgQKmDtpFCQm
 lq2nkNVy4Vr3GRX8cUH70VGNSXuohswd/KfayIC29fGL1s72ge7P9C6dQ7oVzvlsH5
 Kw7qCLqK/d8vLic5B86vNgCpJN+CtvKTrI4rpe6Q=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 267098B76E;
 Mon, 23 Mar 2020 12:31:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rqddR-LQxEFV; Mon, 23 Mar 2020 12:31:59 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 848DD8B752;
 Mon, 23 Mar 2020 12:31:58 +0100 (CET)
Subject: Re: [RFC PATCH 0/3] Use per-CPU temporary mappings for patching
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20200323045205.20314-1-cmr@informatik.wtf>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <173d34a7-a178-ed52-df92-eac8e47d347c@c-s.fr>
Date: Mon, 23 Mar 2020 11:30:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200323045205.20314-1-cmr@informatik.wtf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 03/23/2020 04:52 AM, Christopher M. Riedl wrote:
> When compiled with CONFIG_STRICT_KERNEL_RWX, the kernel must create
> temporary mappings when patching itself. These mappings temporarily
> override the strict RWX text protections to permit a write. Currently,
> powerpc allocates a per-CPU VM area for patching. Patching occurs as
> follows:
> 
> 	1. Map page of text to be patched to per-CPU VM area w/
> 	   PAGE_KERNEL protection
> 	2. Patch text
> 	3. Remove the temporary mapping
> 
> While the VM area is per-CPU, the mapping is actually inserted into the
> kernel page tables. Presumably, this could allow another CPU to access
> the normally write-protected text - either malicously or accidentally -
> via this same mapping if the address of the VM area is known. Ideally,
> the mapping should be kept local to the CPU doing the patching (or any
> other sensitive operations requiring temporarily overriding memory
> protections) [0].
> 
> x86 introduced "temporary mm" structs which allow the creation of
> mappings local to a particular CPU [1]. This series intends to bring the
> notion of a temporary mm to powerpc and harden powerpc by using such a
> mapping for patching a kernel with strict RWX permissions.
> 
> The first patch introduces the temporary mm struct and API for powerpc
> along with a new function to retrieve a current hw breakpoint.
> 
> The second patch uses the `poking_init` init hook added by the x86
> patches to initialize a temporary mm and patching address. The patching
> address is randomized between 0 and DEFAULT_MAP_WINDOW-PAGE_SIZE. The
> upper limit is necessary due to how the hash MMU operates - by default
> the space above DEFAULT_MAP_WINDOW is not available. For now, both hash
> and radix randomize inside this range. The number of possible random
> addresses is dependent on PAGE_SIZE and limited by DEFAULT_MAP_WINDOW.
> 
> Bits of entropy with 64K page size on BOOK3S_64:
> 
> 	bits-o-entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)
> 
> 	PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
> 	bits-o-entropy = log2(128TB / 64K)
> 	bits-o-entropy = 31
> 
> Currently, randomization occurs only once during initialization at boot.
> 
> The third patch replaces the VM area with the temporary mm in the
> patching code. The page for patching has to be mapped PAGE_SHARED with
> the hash MMU since hash prevents the kernel from accessing userspace
> pages with PAGE_PRIVILEGED bit set. There is on-going work on my side to
> explore if this is actually necessary in the hash codepath.
> 
> Testing so far is limited to booting on QEMU (power8 and power9 targets)
> and a POWER8 VM along with setting some simple xmon breakpoints (which
> makes use of code-patching). A POC lkdtm test is in-progress to actually
> exploit the existing vulnerability (ie. the mapping during patching is
> exposed in kernel page tables and accessible by other CPUS) - this will
> accompany a future v1 of this series.

Got following failures on an 8xx. Note that "fault blocked by AP 
register !" means an unauthorised access from Kernel to Userspace.

[    6.113538] ------------[ cut here ]------------
[    6.117852] Bug: fault blocked by AP register !
[    6.117977] WARNING: CPU: 0 PID: 1 at 
./arch/powerpc/include/asm/nohash/32/kup-8xx.h:67 do_page_fault+0x660/0x6ec
[    6.132532] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3524
[    6.142484] NIP:  c000f148 LR: c000f148 CTR: 00000000
[    6.147490] REGS: c9023ca8 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[    6.157185] MSR:  00021032 <ME,IR,DR,RI>  CR: 39023333  XER: a0002100
[    6.163553]
[    6.163553] GPR00: c000f148 c9023d60 c60ec000 00000023 c0924862 
0000000b c0921f7a 6c742062
[    6.163553] GPR08: 00001032 c088e534 00000000 00000004 39023333 
00000000 c0003964 00000000
[    6.163553] GPR16: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    6.163553] GPR24: 00000000 00000000 c0730000 00000300 c60dc000 
23085188 82000000 c9023db0
[    6.198284] NIP [c000f148] do_page_fault+0x660/0x6ec
[    6.203182] LR [c000f148] do_page_fault+0x660/0x6ec
[    6.207958] Call Trace:
[    6.210412] [c9023d60] [c000f148] do_page_fault+0x660/0x6ec (unreliable)
[    6.217037] [c9023da0] [c000e2f0] handle_page_fault+0x8/0x34
[    6.222684] --- interrupt: 301 at __patch_instruction+0x4/0x2c
[    6.222684]     LR = patch_instruction+0x144/0x324
[    6.233138] [c9023e68] [c0013408] patch_instruction+0x120/0x324 
(unreliable)
[    6.240108] [c9023ee8] [c00114fc] mmu_mark_initmem_nx+0x44/0x124
[    6.246039] [c9023f18] [c000f42c] free_initmem+0x20/0x58
[    6.251292] [c9023f28] [c0003980] kernel_init+0x1c/0x130
[    6.256538] [c9023f38] [c000e184] ret_from_kernel_thread+0x14/0x1c
[    6.262605] Instruction dump:
[    6.265542] 4182fc30 39200002 912a0610 7fa5eb78 38800002 38600007 
4801e8a9 38600000
[    6.273200] 4bfffa78 3c60c06d 38632f0c 4800eb95 <0fe00000> 3860000b 
4bfffa60 73490040
[    6.281034] ---[ end trace 18702eef58b6f5ff ]---
[    6.285638] ------------[ cut here ]------------
[    6.290233] WARNING: CPU: 0 PID: 1 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[    6.299575] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3524
[    6.309527] NIP:  c00134f4 LR: c00134ec CTR: 00000000
[    6.314533] REGS: c9023db0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[    6.324229] MSR:  00021032 <ME,IR,DR,RI>  CR: 55000933  XER: a0002100
[    6.330597]
[    6.330597] GPR00: 3d6a4000 c9023e68 c60ec000 00000001 c9023ea8 
00000004 c0001188 00000004
[    6.330597] GPR08: 00000000 00000000 00000000 c53720f0 33000333 
00000000 c0003964 00000000
[    6.330597] GPR16: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    6.330597] GPR24: 00000000 00000000 c0730000 00009032 c0734b50 
c0730000 c0001188 00000000
[    6.365337] NIP [c00134f4] patch_instruction+0x20c/0x324
[    6.370576] LR [c00134ec] patch_instruction+0x204/0x324
[    6.375690] Call Trace:
[    6.378150] [c9023e68] [c00134b8] patch_instruction+0x1d0/0x324 
(unreliable)
[    6.385121] [c9023ee8] [c00114fc] mmu_mark_initmem_nx+0x44/0x124
[    6.391051] [c9023f18] [c000f42c] free_initmem+0x20/0x58
[    6.396303] [c9023f28] [c0003980] kernel_init+0x1c/0x130
[    6.401550] [c9023f38] [c000e184] ret_from_kernel_thread+0x14/0x1c
[    6.407617] Instruction dump:
[    6.410554] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[    6.418212] 7fc3f378 4800086d 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[    6.426046] ---[ end trace 18702eef58b6f600 ]---
[    6.430941] ------------[ cut here ]------------
[    6.435243] Bug: fault blocked by AP register !
[    6.435363] WARNING: CPU: 0 PID: 1 at 
./arch/powerpc/include/asm/nohash/32/kup-8xx.h:67 do_page_fault+0x660/0x6ec
[    6.449923] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3524
[    6.459875] NIP:  c000f148 LR: c000f148 CTR: 00000000
[    6.464881] REGS: c9023ca8 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[    6.474577] MSR:  00021032 <ME,IR,DR,RI>  CR: 39023333  XER: a0002100
[    6.480945]
[    6.480945] GPR00: c000f148 c9023d60 c60ec000 00000023 c0924862 
0000000b c0921f7a 6c742062
[    6.480945] GPR08: 00001032 c088e534 00000000 00000004 39023333 
00000000 c0003964 00000000
[    6.480945] GPR16: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    6.480945] GPR24: 00000000 00000000 c0730000 00000300 c60dc000 
2308511c 82000000 c9023db0
[    6.515670] NIP [c000f148] do_page_fault+0x660/0x6ec
[    6.520573] LR [c000f148] do_page_fault+0x660/0x6ec
[    6.525350] Call Trace:
[    6.527804] [c9023d60] [c000f148] do_page_fault+0x660/0x6ec (unreliable)
[    6.534428] [c9023da0] [c000e2f0] handle_page_fault+0x8/0x34
[    6.540072] --- interrupt: 301 at __patch_instruction+0x4/0x2c
[    6.540072]     LR = patch_instruction+0x144/0x324
[    6.550531] [c9023e68] [c0013408] patch_instruction+0x120/0x324 
(unreliable)
[    6.557500] [c9023ee8] [c0011534] mmu_mark_initmem_nx+0x7c/0x124
[    6.563431] [c9023f18] [c000f42c] free_initmem+0x20/0x58
[    6.568683] [c9023f28] [c0003980] kernel_init+0x1c/0x130
[    6.573931] [c9023f38] [c000e184] ret_from_kernel_thread+0x14/0x1c
[    6.579996] Instruction dump:
[    6.582934] 4182fc30 39200002 912a0610 7fa5eb78 38800002 38600007 
4801e8a9 38600000
[    6.590592] 4bfffa78 3c60c06d 38632f0c 4800eb95 <0fe00000> 3860000b 
4bfffa60 73490040
[    6.598425] ---[ end trace 18702eef58b6f601 ]---
[    6.603026] ------------[ cut here ]------------
[    6.607623] WARNING: CPU: 0 PID: 1 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[    6.616968] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3524
[    6.626919] NIP:  c00134f4 LR: c00134ec CTR: 00000000
[    6.631925] REGS: c9023db0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[    6.641621] MSR:  00021032 <ME,IR,DR,RI>  CR: 55000933  XER: a0002100
[    6.647988]
[    6.647988] GPR00: 2b8ac060 c9023e68 c60ec000 00000001 c9023ea8 
00000004 c000111c 00000004
[    6.647988] GPR08: 00000000 00000000 00000000 c53720f0 33000333 
00000000 c0003964 00000000
[    6.647988] GPR16: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    6.647988] GPR24: 00000000 00000000 c0730000 00009032 c0734b50 
c0730000 c000111c 00000000
[    6.682728] NIP [c00134f4] patch_instruction+0x20c/0x324
[    6.687968] LR [c00134ec] patch_instruction+0x204/0x324
[    6.693082] Call Trace:
[    6.695542] [c9023e68] [c00134b8] patch_instruction+0x1d0/0x324 
(unreliable)
[    6.702512] [c9023ee8] [c0011534] mmu_mark_initmem_nx+0x7c/0x124
[    6.708443] [c9023f18] [c000f42c] free_initmem+0x20/0x58
[    6.713694] [c9023f28] [c0003980] kernel_init+0x1c/0x130
[    6.718942] [c9023f38] [c000e184] ret_from_kernel_thread+0x14/0x1c
[    6.725008] Instruction dump:
[    6.727946] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[    6.735604] 7fc3f378 4800086d 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[    6.743437] ---[ end trace 18702eef58b6f602 ]---
[    6.759669] Freeing unused kernel memory: 496K
[    6.764014] ------------[ cut here ]------------
[    6.768382] Bug: fault blocked by AP register !
[    6.768515] WARNING: CPU: 0 PID: 1 at 
./arch/powerpc/include/asm/nohash/32/kup-8xx.h:67 do_page_fault+0x660/0x6ec
[    6.783065] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3524
[    6.793016] NIP:  c000f148 LR: c000f148 CTR: 00000000
[    6.798022] REGS: c9023c98 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[    6.807717] MSR:  00021032 <ME,IR,DR,RI>  CR: 39023333  XER: a0002100
[    6.814085]
[    6.814085] GPR00: c000f148 c9023d50 c60ec000 00000023 c0924862 
0000000b c0921f7a 6c742062
[    6.814085] GPR08: 00001032 c088e534 00000000 00000004 39023333 
00000000 c0003964 00000000
[    6.814085] GPR16: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    6.814085] GPR24: 00000000 00000000 c0730000 00000300 c60dc000 
230852b0 82000000 c9023da0
[    6.848811] NIP [c000f148] do_page_fault+0x660/0x6ec
[    6.853714] LR [c000f148] do_page_fault+0x660/0x6ec
[    6.858491] Call Trace:
[    6.860944] [c9023d50] [c000f148] do_page_fault+0x660/0x6ec (unreliable)
[    6.867569] [c9023d90] [c000e2f0] handle_page_fault+0x8/0x34
[    6.873215] --- interrupt: 301 at __patch_instruction+0x4/0x2c
[    6.873215]     LR = patch_instruction+0x144/0x324
[    6.883670] [c9023e58] [c0013408] patch_instruction+0x120/0x324 
(unreliable)
[    6.890640] [c9023ed8] [c0011624] mmu_mark_rodata_ro+0x48/0xf8
[    6.896401] [c9023f08] [c000fe50] mark_rodata_ro+0xc4/0xd8
[    6.901824] [c9023f28] [c0003998] kernel_init+0x34/0x130
[    6.907072] [c9023f38] [c000e184] ret_from_kernel_thread+0x14/0x1c
[    6.913137] Instruction dump:
[    6.916074] 4182fc30 39200002 912a0610 7fa5eb78 38800002 38600007 
4801e8a9 38600000
[    6.923732] 4bfffa78 3c60c06d 38632f0c 4800eb95 <0fe00000> 3860000b 
4bfffa60 73490040
[    6.931565] ---[ end trace 18702eef58b6f603 ]---
[    6.936166] ------------[ cut here ]------------
[    6.940763] WARNING: CPU: 0 PID: 1 at 
arch/powerpc/lib/code-patching.c:182 patch_instruction+0x20c/0x324
[    6.950108] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5 #3524
[    6.960059] NIP:  c00134f4 LR: c00134ec CTR: 00000000
[    6.965067] REGS: c9023da0 TRAP: 0700   Tainted: G        W 
(5.6.0-rc6-s3k-dev-00903-g70f8a9483ed5)
[    6.974761] MSR:  00021032 <ME,IR,DR,RI>  CR: 99000333  XER: a0002100
[    6.981129]
[    6.981129] GPR00: 3d6aff80 c9023e58 c60ec000 00000001 c9023e98 
00000004 c00012b0 00000004
[    6.981129] GPR08: 00000000 fffffffe 00000000 00000000 39000335 
00000000 c0003964 00000000
[    6.981129] GPR16: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    6.981129] GPR24: 00000000 00000000 c0730000 00009032 c0734b50 
c0730000 c00012b0 00000000
[    7.015870] NIP [c00134f4] patch_instruction+0x20c/0x324
[    7.021109] LR [c00134ec] patch_instruction+0x204/0x324
[    7.026222] Call Trace:
[    7.028683] [c9023e58] [c00134b8] patch_instruction+0x1d0/0x324 
(unreliable)
[    7.035653] [c9023ed8] [c0011624] mmu_mark_rodata_ro+0x48/0xf8
[    7.041415] [c9023f08] [c000fe50] mark_rodata_ro+0xc4/0xd8
[    7.046835] [c9023f28] [c0003998] kernel_init+0x34/0x130
[    7.052083] [c9023f38] [c000e184] ret_from_kernel_thread+0x14/0x1c
[    7.058149] Instruction dump:
[    7.061086] 2f890000 91220000 409e0010 81220070 712a0004 40820120 
38a00004 38810040
[    7.068744] 7fc3f378 4800086d 3123ffff 7c691910 <0f030000> 7f600124 
7fe9fb78 80010084
[    7.076578] ---[ end trace 18702eef58b6f604 ]---

Christophe
