Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8450265F16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 13:56:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnvPH5NydzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 21:56:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnvMd6Xd2zDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 21:55:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EYe2RMO0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BnvMd0W3hz9sSs;
 Fri, 11 Sep 2020 21:55:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599825325;
 bh=ZovDPV7tljM0Sl5eeVf17HQSMDxWJixy/BwrnjgoaHw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EYe2RMO00+pMuHjK2w+wLLVK3M+sA2kfueEyIt/vsHqceRMieEY5fIabY564uHjbe
 2WjfcL622EXsNqkLtNj6S0GThxJei/SG1EpUQlIEx8rYxUsXStntInBh9co4ZnGyoY
 i5m+2Vr7W8+LLf6AvtMELhj9t9rk8v2Xxe+d80RTnzOxZws0sekk8CP4S3XrKZmE5i
 D0yklAEF6l6WRoi6yqWo2Ja2VUeBD91yJa0YPdF8ir8UjV2hFyr8DkyApR1zph9I9y
 L7R27eM3onDNAyYQTGW9S4VNwhvP2UozIjzKFTrA51LHUYQMSTi05RoVBcdqL0vuNJ
 yFUp3rECj8uHg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 05/10] powerpc/smp: Dont assume l2-cache to be superset
 of sibling
In-Reply-To: <20200810071834.92514-6-srikar@linux.vnet.ibm.com>
References: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
 <20200810071834.92514-6-srikar@linux.vnet.ibm.com>
Date: Fri, 11 Sep 2020 21:55:23 +1000
Message-ID: <87y2lgr0ic.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> Current code assumes that cpumask of cpus sharing a l2-cache mask will
> always be a superset of cpu_sibling_mask.
>
> Lets stop that assumption. cpu_l2_cache_mask is a superset of
> cpu_sibling_mask if and only if shared_caches is set.

I'm seeing oopses with this:

[    0.117392][    T1] smp: Bringing up secondary CPUs ...
[    0.156515][    T1] smp: Brought up 2 nodes, 2 CPUs
[    0.158265][    T1] numa: Node 0 CPUs: 0
[    0.158520][    T1] numa: Node 1 CPUs: 1
[    0.167453][    T1] BUG: Unable to handle kernel data access on read at 0x8000000041228298
[    0.167992][    T1] Faulting instruction address: 0xc00000000018c128
[    0.168817][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.168964][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[    0.169417][    T1] Modules linked in:
[    0.170047][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc2-00095-g7430ad5aa700 #209
[    0.170305][    T1] NIP:  c00000000018c128 LR: c00000000018c0cc CTR: c00000000004dce0
[    0.170498][    T1] REGS: c00000007e343880 TRAP: 0380   Not tainted  (5.9.0-rc2-00095-g7430ad5aa700)
[    0.170602][    T1] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44002222  XER: 00000000
[    0.170985][    T1] CFAR: c00000000018c288 IRQMASK: 0
[    0.170985][    T1] GPR00: 0000000000000000 c00000007e343b10 c00000000173e400 0000000000004000
[    0.170985][    T1] GPR04: 0000000000000000 0000000000000800 0000000000000800 0000000000000000
[    0.170985][    T1] GPR08: 0000000000000000 c00000000122c298 c00000003fffc000 c00000007fd05ce8
[    0.170985][    T1] GPR12: c00000007e0119f8 c000000001930000 00000000ffff8ade 0000000000000000
[    0.170985][    T1] GPR16: c00000007e3c0640 0000000000000917 c00000007e3c0658 0000000000000008
[    0.170985][    T1] GPR20: c0000000015d0bb8 00000000ffff8ade c000000000f57400 c000000001817c28
[    0.170985][    T1] GPR24: c00000000176dc80 c00000007e3c0890 c00000007e3cfe00 0000000000000000
[    0.170985][    T1] GPR28: c000000001772310 c00000007e011900 c00000007e3c0800 0000000000000001
[    0.172750][    T1] NIP [c00000000018c128] build_sched_domains+0x808/0x14b0
[    0.172900][    T1] LR [c00000000018c0cc] build_sched_domains+0x7ac/0x14b0
[    0.173186][    T1] Call Trace:
[    0.173484][    T1] [c00000007e343b10] [c00000000018bfe8] build_sched_domains+0x6c8/0x14b0 (unreliable)
[    0.173821][    T1] [c00000007e343c50] [c00000000018dcdc] sched_init_domains+0xec/0x130
[    0.174037][    T1] [c00000007e343ca0] [c0000000010d59d8] sched_init_smp+0x50/0xc4
[    0.174207][    T1] [c00000007e343cd0] [c0000000010b45c4] kernel_init_freeable+0x1b4/0x378
[    0.174378][    T1] [c00000007e343db0] [c0000000000129fc] kernel_init+0x24/0x158
[    0.174740][    T1] [c00000007e343e20] [c00000000000d9d0] ret_from_kernel_thread+0x5c/0x6c
[    0.175050][    T1] Instruction dump:
[    0.175626][    T1] 554905ee 71480040 7d2907b4 4182016c 2c290000 3920006e 913e002c 41820034
[    0.175841][    T1] 7c6307b4 e9300020 78631f24 7d58182a <7d2a482a> f93e0080 7d404828 314a0001
[    0.178340][    T1] ---[ end trace 6876b88dd1d4b3bb ]---
[    0.178512][    T1]
[    1.180458][    T1] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

That's qemu:

qemu-system-ppc64 -nographic -vga none -M pseries -cpu POWER8 \
  -kernel build~/vmlinux \
  -m 2G,slots=2,maxmem=4G \
  -object memory-backend-ram,size=1G,id=m0 \
  -object memory-backend-ram,size=1G,id=m1 \
  -numa node,nodeid=0,memdev=m0 \
  -numa node,nodeid=1,memdev=m1 \
  -smp 2,sockets=2,maxcpus=2  \


On mambo I get:

[    0.005069][    T1] smp: Bringing up secondary CPUs ...
[    0.011656][    T1] smp: Brought up 2 nodes, 8 CPUs
[    0.011682][    T1] numa: Node 0 CPUs: 0-3
[    0.011709][    T1] numa: Node 1 CPUs: 4-7
[    0.012015][    T1] BUG: arch topology borken
[    0.012040][    T1]      the SMT domain not a subset of the CACHE domain
[    0.012107][    T1] BUG: Unable to handle kernel data access on read at 0x80000001012e7398
[    0.012142][    T1] Faulting instruction address: 0xc0000000001aa4f0
[    0.012174][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.012206][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
[    0.012236][    T1] Modules linked in:
[    0.012264][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc2-00095-g7430ad5aa700 #1
[    0.012304][    T1] NIP:  c0000000001aa4f0 LR: c0000000001aa498 CTR: 0000000000000000
[    0.012341][    T1] REGS: c0000000ef583880 TRAP: 0380   Not tainted  (5.9.0-rc2-00095-g7430ad5aa700)
[    0.012379][    T1] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 44002222  XER: 00040000
[    0.012439][    T1] CFAR: c0000000000101b0 IRQMASK: 0
[    0.012439][    T1] GPR00: 0000000000000000 c0000000ef583b10 c0000000017fd000 0000000000004000
[    0.012439][    T1] GPR04: 0000000000000000 0000000000000800 0000000000000000 0000000000000000
[    0.012439][    T1] GPR08: 0000000000000000 c0000000012eb398 c0000000ffffc000 0000000000000000
[    0.012439][    T1] GPR12: 0000000000000020 c0000000019f0000 00000000ffff8ad1 0000000000000000
[    0.012439][    T1] GPR16: c0000000ef068658 c0000000018d7ba8 0000000000000008 c000000001690bb8
[    0.012439][    T1] GPR20: c00000000182dc80 c0000000ef06be90 00000000ffff8ad1 c000000001014aa8
[    0.012439][    T1] GPR24: 0000000000000917 c0000000ef068e00 0000000000000000 c0000000ef06be00
[    0.012439][    T1] GPR28: 0000000000000001 c0000000ef068640 c0000000ef4a1800 c000000001832310
[    0.012774][    T1] NIP [c0000000001aa4f0] build_sched_domains+0x5c0/0x14f0
[    0.012812][    T1] LR [c0000000001aa498] build_sched_domains+0x568/0x14f0
[    0.012842][    T1] Call Trace:
[    0.012872][    T1] [c0000000ef583b10] [c0000000001aa3b4] build_sched_domains+0x484/0x14f0 (unreliable)
[    0.012922][    T1] [c0000000ef583c50] [c0000000001ac3d8] sched_init_domains+0xd8/0x120
[    0.012966][    T1] [c0000000ef583ca0] [c0000000011962d0] sched_init_smp+0x50/0xc4
[    0.013008][    T1] [c0000000ef583cd0] [c00000000117451c] kernel_init_freeable+0x1b4/0x378
[    0.013051][    T1] [c0000000ef583db0] [c000000000012994] kernel_init+0x2c/0x158
[    0.013092][    T1] [c0000000ef583e20] [c00000000000d9d0] ret_from_kernel_thread+0x5c/0x6c
[    0.013128][    T1] Instruction dump:
[    0.013151][    T1] e93b003a 712a0040 552a05ee 418203c4 2c2a0000 3920006e 913b002c 41820034
[    0.013206][    T1] 7c6307b4 e93d0020 78631f24 7d54182a <7d2a482a> f93b0080 7d404828 314a0001
[    0.013267][    T1] ---[ end trace 1bf5f6f38a9fd096 ]---


Did I miss a lead-up patch?

See here for what I have applied:
  https://github.com/linuxppc/linux/commits/next-test

cheers
