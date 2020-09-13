Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9B267D30
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 03:48:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpspD0sJkzDqtR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 11:48:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpsmP4cl8zDqlf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Sep 2020 11:46:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nrEoN321; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BpsmM3b9Wz9sPB;
 Sun, 13 Sep 2020 11:46:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599961605;
 bh=5FA67MvB6UzESDdQ9Q4cvn1OLcYM7tPbebzMYHQl/V0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nrEoN321Orz4OXZs64+6NK48s0t0pH2TjoMDAda2r6fFcRZj52YzSfjZdTr2TYD5c
 Y0Sc2uPPfO+Z7zcXdr7A7In9LB7nT/7m/4zozzbW/eUqeJ0jl3mjtkyKYqm21L5IYW
 CYI0HkJm4zWH5TPIcuEz5SV6tOBvZ4JSpNdxtybLW+FB5RGvpKfuWxk2HITpIznZIt
 joG3NvGSu0xonU77+ljl4mY+rWGwVw41KHHR09fdMlHVvWmAotpg7bSDS83DJz0WCP
 Hz8zL9Dt1rmOFlga3MQ5Mv3pNcFjvkb8P9ysDRr6izEn4ren/QfJ4C0mV8LZGsyRD+
 d9nvs3tG+sYKQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 05/10] powerpc/smp: Dont assume l2-cache to be superset
 of sibling
In-Reply-To: <20200912044603.GA11808@linux.vnet.ibm.com>
References: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
 <20200810071834.92514-6-srikar@linux.vnet.ibm.com>
 <87y2lgr0ic.fsf@mpe.ellerman.id.au>
 <20200912044603.GA11808@linux.vnet.ibm.com>
Date: Sun, 13 Sep 2020 11:46:41 +1000
Message-ID: <87imciqwhq.fsf@mpe.ellerman.id.au>
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
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Michael Ellerman <mpe@ellerman.id.au> [2020-09-11 21:55:23]:
>
>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> > Current code assumes that cpumask of cpus sharing a l2-cache mask will
>> > always be a superset of cpu_sibling_mask.
>> >
>> > Lets stop that assumption. cpu_l2_cache_mask is a superset of
>> > cpu_sibling_mask if and only if shared_caches is set.
>> 
>> I'm seeing oopses with this:
>> 
>> [    0.117392][    T1] smp: Bringing up secondary CPUs ...
>> [    0.156515][    T1] smp: Brought up 2 nodes, 2 CPUs
>> [    0.158265][    T1] numa: Node 0 CPUs: 0
>> [    0.158520][    T1] numa: Node 1 CPUs: 1
>> [    0.167453][    T1] BUG: Unable to handle kernel data access on read at 0x8000000041228298
>> [    0.167992][    T1] Faulting instruction address: 0xc00000000018c128
>> [    0.168817][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
>> [    0.168964][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>> [    0.169417][    T1] Modules linked in:
>> [    0.170047][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc2-00095-g7430ad5aa700 #209
>> [    0.170305][    T1] NIP:  c00000000018c128 LR: c00000000018c0cc CTR: c00000000004dce0
>> [    0.170498][    T1] REGS: c00000007e343880 TRAP: 0380   Not tainted  (5.9.0-rc2-00095-g7430ad5aa700)
>> [    0.170602][    T1] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44002222  XER: 00000000
>> [    0.170985][    T1] CFAR: c00000000018c288 IRQMASK: 0
>> [    0.170985][    T1] GPR00: 0000000000000000 c00000007e343b10 c00000000173e400 0000000000004000
>> [    0.170985][    T1] GPR04: 0000000000000000 0000000000000800 0000000000000800 0000000000000000
>> [    0.170985][    T1] GPR08: 0000000000000000 c00000000122c298 c00000003fffc000 c00000007fd05ce8
>> [    0.170985][    T1] GPR12: c00000007e0119f8 c000000001930000 00000000ffff8ade 0000000000000000
>> [    0.170985][    T1] GPR16: c00000007e3c0640 0000000000000917 c00000007e3c0658 0000000000000008
>> [    0.170985][    T1] GPR20: c0000000015d0bb8 00000000ffff8ade c000000000f57400 c000000001817c28
>> [    0.170985][    T1] GPR24: c00000000176dc80 c00000007e3c0890 c00000007e3cfe00 0000000000000000
>> [    0.170985][    T1] GPR28: c000000001772310 c00000007e011900 c00000007e3c0800 0000000000000001
>> [    0.172750][    T1] NIP [c00000000018c128] build_sched_domains+0x808/0x14b0
>> [    0.172900][    T1] LR [c00000000018c0cc] build_sched_domains+0x7ac/0x14b0
>> [    0.173186][    T1] Call Trace:
>> [    0.173484][    T1] [c00000007e343b10] [c00000000018bfe8] build_sched_domains+0x6c8/0x14b0 (unreliable)
>> [    0.173821][    T1] [c00000007e343c50] [c00000000018dcdc] sched_init_domains+0xec/0x130
>> [    0.174037][    T1] [c00000007e343ca0] [c0000000010d59d8] sched_init_smp+0x50/0xc4
>> [    0.174207][    T1] [c00000007e343cd0] [c0000000010b45c4] kernel_init_freeable+0x1b4/0x378
>> [    0.174378][    T1] [c00000007e343db0] [c0000000000129fc] kernel_init+0x24/0x158
>> [    0.174740][    T1] [c00000007e343e20] [c00000000000d9d0] ret_from_kernel_thread+0x5c/0x6c
>> [    0.175050][    T1] Instruction dump:
>> [    0.175626][    T1] 554905ee 71480040 7d2907b4 4182016c 2c290000 3920006e 913e002c 41820034
>> [    0.175841][    T1] 7c6307b4 e9300020 78631f24 7d58182a <7d2a482a> f93e0080 7d404828 314a0001
>> [    0.178340][    T1] ---[ end trace 6876b88dd1d4b3bb ]---
>> [    0.178512][    T1]
>> [    1.180458][    T1] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>> 
>> That's qemu:
>> 
>> qemu-system-ppc64 -nographic -vga none -M pseries -cpu POWER8 \
>>   -kernel build~/vmlinux \
>>   -m 2G,slots=2,maxmem=4G \
>>   -object memory-backend-ram,size=1G,id=m0 \
>>   -object memory-backend-ram,size=1G,id=m1 \
>>   -numa node,nodeid=0,memdev=m0 \
>>   -numa node,nodeid=1,memdev=m1 \
>>   -smp 2,sockets=2,maxcpus=2  \
>> 
>
> Thanks Michael for the report and also for identifying the patch and also
> giving an easy reproducer. That made my task easy. (My only problem was all
> my PowerKVM hosts had a old compiler that refuse to compile never kernels.)
>
> So in this setup, CPU doesn't have a l2-cache. And in that scenario, we
> miss updating the l2-cache domain. Actually the initial patch had this
> exact code. However it was my mistake. I should have reassessed it before
> making changes suggested by Gautham.
>
> Patch below. Do let me know if you want me to send the patch separately.

>> On mambo I get:
>> 
>> [    0.005069][    T1] smp: Bringing up secondary CPUs ...
>> [    0.011656][    T1] smp: Brought up 2 nodes, 8 CPUs
>> [    0.011682][    T1] numa: Node 0 CPUs: 0-3
>> [    0.011709][    T1] numa: Node 1 CPUs: 4-7
>> [    0.012015][    T1] BUG: arch topology borken
>> [    0.012040][    T1]      the SMT domain not a subset of the CACHE domain
>> [    0.012107][    T1] BUG: Unable to handle kernel data access on read at 0x80000001012e7398
>> [    0.012142][    T1] Faulting instruction address: 0xc0000000001aa4f0
>> [    0.012174][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
>> [    0.012206][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
>> [    0.012236][    T1] Modules linked in:
>> [    0.012264][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc2-00095-g7430ad5aa700 #1
>> [    0.012304][    T1] NIP:  c0000000001aa4f0 LR: c0000000001aa498 CTR: 0000000000000000
>> [    0.012341][    T1] REGS: c0000000ef583880 TRAP: 0380   Not tainted  (5.9.0-rc2-00095-g7430ad5aa700)
>> [    0.012379][    T1] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 44002222  XER: 00040000
>> [    0.012439][    T1] CFAR: c0000000000101b0 IRQMASK: 0
>> [    0.012439][    T1] GPR00: 0000000000000000 c0000000ef583b10 c0000000017fd000 0000000000004000
>> [    0.012439][    T1] GPR04: 0000000000000000 0000000000000800 0000000000000000 0000000000000000
>> [    0.012439][    T1] GPR08: 0000000000000000 c0000000012eb398 c0000000ffffc000 0000000000000000
>> [    0.012439][    T1] GPR12: 0000000000000020 c0000000019f0000 00000000ffff8ad1 0000000000000000
>> [    0.012439][    T1] GPR16: c0000000ef068658 c0000000018d7ba8 0000000000000008 c000000001690bb8
>> [    0.012439][    T1] GPR20: c00000000182dc80 c0000000ef06be90 00000000ffff8ad1 c000000001014aa8
>> [    0.012439][    T1] GPR24: 0000000000000917 c0000000ef068e00 0000000000000000 c0000000ef06be00
>> [    0.012439][    T1] GPR28: 0000000000000001 c0000000ef068640 c0000000ef4a1800 c000000001832310
>> [    0.012774][    T1] NIP [c0000000001aa4f0] build_sched_domains+0x5c0/0x14f0
>> [    0.012812][    T1] LR [c0000000001aa498] build_sched_domains+0x568/0x14f0
>> [    0.012842][    T1] Call Trace:
>> [    0.012872][    T1] [c0000000ef583b10] [c0000000001aa3b4] build_sched_domains+0x484/0x14f0 (unreliable)
>> [    0.012922][    T1] [c0000000ef583c50] [c0000000001ac3d8] sched_init_domains+0xd8/0x120
>> [    0.012966][    T1] [c0000000ef583ca0] [c0000000011962d0] sched_init_smp+0x50/0xc4
>> [    0.013008][    T1] [c0000000ef583cd0] [c00000000117451c] kernel_init_freeable+0x1b4/0x378
>> [    0.013051][    T1] [c0000000ef583db0] [c000000000012994] kernel_init+0x2c/0x158
>> [    0.013092][    T1] [c0000000ef583e20] [c00000000000d9d0] ret_from_kernel_thread+0x5c/0x6c
>> [    0.013128][    T1] Instruction dump:
>> [    0.013151][    T1] e93b003a 712a0040 552a05ee 418203c4 2c2a0000 3920006e 913b002c 41820034
>> [    0.013206][    T1] 7c6307b4 e93d0020 78631f24 7d54182a <7d2a482a> f93b0080 7d404828 314a0001
>> [    0.013267][    T1] ---[ end trace 1bf5f6f38a9fd096 ]---
>> 
>
> I haven't tried Mambo. But the problem report looks similar.

The patch fixes qemu, and I don't see the crash on mambo, but I still
see:

  [    0.010536] smp: Bringing up secondary CPUs ...
  [    0.019189] smp: Brought up 2 nodes, 8 CPUs
  [    0.019210] numa: Node 0 CPUs: 0-3
  [    0.019235] numa: Node 1 CPUs: 4-7
  [    0.023669] BUG: arch topology borken
  [    0.023690]      the SMT domain not a subset of the CACHE domain
  [    0.023726] BUG: arch topology borken
  [    0.023747]      the CACHE domain not a subset of the MC domain
  [    0.023808] BUG: arch topology borken
  [    0.023829]      the SMT domain not a subset of the CACHE domain
  [    0.023865] BUG: arch topology borken
  [    0.023887]      the CACHE domain not a subset of the MC domain
  [    0.023948] BUG: arch topology borken
  [    0.023969]      the SMT domain not a subset of the CACHE domain
  [    0.024005] BUG: arch topology borken
  [    0.024026]      the CACHE domain not a subset of the MC domain
  [    0.024087] BUG: arch topology borken
  [    0.024108]      the SMT domain not a subset of the CACHE domain
  [    0.024144] BUG: arch topology borken
  [    0.024165]      the CACHE domain not a subset of the MC domain
  [    0.024227] BUG: arch topology borken
  [    0.024248]      the SMT domain not a subset of the CACHE domain
  [    0.024284] BUG: arch topology borken
  [    0.024305]      the CACHE domain not a subset of the MC domain
  [    0.024366] BUG: arch topology borken
  [    0.024387]      the SMT domain not a subset of the CACHE domain
  [    0.024423] BUG: arch topology borken
  [    0.024444]      the CACHE domain not a subset of the MC domain
  [    0.024505] BUG: arch topology borken
  [    0.024527]      the SMT domain not a subset of the CACHE domain
  [    0.024563] BUG: arch topology borken
  [    0.024584]      the CACHE domain not a subset of the MC domain
  [    0.024645] BUG: arch topology borken
  [    0.024666]      the SMT domain not a subset of the CACHE domain
  [    0.024702] BUG: arch topology borken
  [    0.024723]      the CACHE domain not a subset of the MC domain

That's the p9 mambo model, using skiboot.tcl from skiboot, with CPUS=2,
THREADS=4 and MAMBO_NUMA=1.

Node layout is:

[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x00000000ffffffff]
[    0.000000]   node   1: [mem 0x0000200000000000-0x00002000ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000ffffffff]
[    0.000000] On node 0 totalpages: 65536
[    0.000000] Initmem setup node 1 [mem 0x0000200000000000-0x00002000ffffffff]
[    0.000000] On node 1 totalpages: 65536


There aren't any l2-cache properties in the device-tree under cpus.

I'll try and have a closer look tonight.

cheers
