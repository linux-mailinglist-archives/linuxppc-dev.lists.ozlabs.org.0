Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D9F363A26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:12:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNthJ3HLHz3gQn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:12:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtW749BBz3clP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:51 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVp3Q7sz9vH2; Mon, 19 Apr 2021 14:04:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
Message-Id: <161880480776.1398509.10613061597432855363.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 14:00:07 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Ingo Molnar <mingo@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 1 Apr 2021 21:12:00 +0530, Srikar Dronamraju wrote:
> Geethika reported a trace when doing a dlpar CPU add.
> 
> ------------[ cut here ]------------
> WARNING: CPU: 152 PID: 1134 at kernel/sched/topology.c:2057
> CPU: 152 PID: 1134 Comm: kworker/152:1 Not tainted 5.12.0-rc5-master #5
> Workqueue: events cpuset_hotplug_workfn
> NIP:  c0000000001cfc14 LR: c0000000001cfc10 CTR: c0000000007e3420
> REGS: c0000034a08eb260 TRAP: 0700   Not tainted  (5.12.0-rc5-master+)
> MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28828422  XER: 00000020
> CFAR: c0000000001fd888 IRQMASK: 0 #012GPR00: c0000000001cfc10
> c0000034a08eb500 c000000001f35400 0000000000000027 #012GPR04:
> c0000035abaa8010 c0000035abb30a00 0000000000000027 c0000035abaa8018
> #012GPR08: 0000000000000023 c0000035abaaef48 00000035aa540000
> c0000035a49dffe8 #012GPR12: 0000000028828424 c0000035bf1a1c80
> 0000000000000497 0000000000000004 #012GPR16: c00000000347a258
> 0000000000000140 c00000000203d468 c000000001a1a490 #012GPR20:
> c000000001f9c160 c0000034adf70920 c0000034aec9fd20 0000000100087bd3
> #012GPR24: 0000000100087bd3 c0000035b3de09f8 0000000000000030
> c0000035b3de09f8 #012GPR28: 0000000000000028 c00000000347a280
> c0000034aefe0b00 c0000000010a2a68
> NIP [c0000000001cfc14] build_sched_domains+0x6a4/0x1500
> LR [c0000000001cfc10] build_sched_domains+0x6a0/0x1500
> Call Trace:
> [c0000034a08eb500] [c0000000001cfc10] build_sched_domains+0x6a0/0x1500 (unreliable)
> [c0000034a08eb640] [c0000000001d1e6c] partition_sched_domains_locked+0x3ec/0x530
> [c0000034a08eb6e0] [c0000000002936d4] rebuild_sched_domains_locked+0x524/0xbf0
> [c0000034a08eb7e0] [c000000000296bb0] rebuild_sched_domains+0x40/0x70
> [c0000034a08eb810] [c000000000296e74] cpuset_hotplug_workfn+0x294/0xe20
> [c0000034a08ebc30] [c000000000178dd0] process_one_work+0x300/0x670
> [c0000034a08ebd10] [c0000000001791b8] worker_thread+0x78/0x520
> [c0000034a08ebda0] [c000000000185090] kthread+0x1a0/0x1b0
> [c0000034a08ebe10] [c00000000000ccec] ret_from_kernel_thread+0x5c/0x70
> Instruction dump:
> 7d2903a6 4e800421 e8410018 7f67db78 7fe6fb78 7f45d378 7f84e378 7c681b78
> 3c62ff1a 3863c6f8 4802dc35 60000000 <0fe00000> 3920fff4 f9210070 e86100a0
> ---[ end trace 532d9066d3d4d7ec ]---
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/smp: Set numa node before updating mask
      https://git.kernel.org/powerpc/c/6980d13f0dd189846887bbbfa43793d9a41768d3

cheers
