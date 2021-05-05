Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A3D3740F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 18:41:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb2XV4Vpgz3f2K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 02:41:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t752fYDk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t752fYDk; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb2Vp1rHNz3cDK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 02:39:46 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA0C4619B2;
 Wed,  5 May 2021 16:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232783;
 bh=byXudzPcATVaf19KfyA9vcbW285hb40G/t66SVxVDAo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t752fYDk+GFMED1bxUGUctvkcIECmNpzICgt911YsCXput9hU6mtYLUHtDarsioX8
 M7ZLyofaRVWObYC5uzYMnSwZWo/lXPOARDS/GAIbM/9Pe8vUrh3LFKzwQxIr3vVZ6Z
 gi00YOq/kUBh7U3cIQ3UkdrirqBJpgkO/HI3rlLKM3/fsaIekQHTmwVUmtdeHW5yYD
 M25ermNPf9j85SzC5bOkUOekvrABzUVXKjHL2AWD+cbeIfdHy3nND9rQnI+GljV3DT
 fp4mr1JA4/kO+hnV0Y3aC8al1Tp6r8ShGOmjMF2DKKOx/SVor1F6Yvr5rlJcr+AChd
 5W1knQz36XzCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 32/46] powerpc/smp: Set numa node before updating
 mask
Date: Wed,  5 May 2021 12:38:42 -0400
Message-Id: <20210505163856.3463279-32-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163856.3463279-1-sashal@kernel.org>
References: <20210505163856.3463279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Sasha Levin <sashal@kernel.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

[ Upstream commit 6980d13f0dd189846887bbbfa43793d9a41768d3 ]

Geethika reported a trace when doing a dlpar CPU add.

------------[ cut here ]------------
WARNING: CPU: 152 PID: 1134 at kernel/sched/topology.c:2057
CPU: 152 PID: 1134 Comm: kworker/152:1 Not tainted 5.12.0-rc5-master #5
Workqueue: events cpuset_hotplug_workfn
NIP:  c0000000001cfc14 LR: c0000000001cfc10 CTR: c0000000007e3420
REGS: c0000034a08eb260 TRAP: 0700   Not tainted  (5.12.0-rc5-master+)
MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28828422  XER: 00000020
CFAR: c0000000001fd888 IRQMASK: 0 #012GPR00: c0000000001cfc10
c0000034a08eb500 c000000001f35400 0000000000000027 #012GPR04:
c0000035abaa8010 c0000035abb30a00 0000000000000027 c0000035abaa8018
#012GPR08: 0000000000000023 c0000035abaaef48 00000035aa540000
c0000035a49dffe8 #012GPR12: 0000000028828424 c0000035bf1a1c80
0000000000000497 0000000000000004 #012GPR16: c00000000347a258
0000000000000140 c00000000203d468 c000000001a1a490 #012GPR20:
c000000001f9c160 c0000034adf70920 c0000034aec9fd20 0000000100087bd3
#012GPR24: 0000000100087bd3 c0000035b3de09f8 0000000000000030
c0000035b3de09f8 #012GPR28: 0000000000000028 c00000000347a280
c0000034aefe0b00 c0000000010a2a68
NIP [c0000000001cfc14] build_sched_domains+0x6a4/0x1500
LR [c0000000001cfc10] build_sched_domains+0x6a0/0x1500
Call Trace:
[c0000034a08eb500] [c0000000001cfc10] build_sched_domains+0x6a0/0x1500 (unreliable)
[c0000034a08eb640] [c0000000001d1e6c] partition_sched_domains_locked+0x3ec/0x530
[c0000034a08eb6e0] [c0000000002936d4] rebuild_sched_domains_locked+0x524/0xbf0
[c0000034a08eb7e0] [c000000000296bb0] rebuild_sched_domains+0x40/0x70
[c0000034a08eb810] [c000000000296e74] cpuset_hotplug_workfn+0x294/0xe20
[c0000034a08ebc30] [c000000000178dd0] process_one_work+0x300/0x670
[c0000034a08ebd10] [c0000000001791b8] worker_thread+0x78/0x520
[c0000034a08ebda0] [c000000000185090] kthread+0x1a0/0x1b0
[c0000034a08ebe10] [c00000000000ccec] ret_from_kernel_thread+0x5c/0x70
Instruction dump:
7d2903a6 4e800421 e8410018 7f67db78 7fe6fb78 7f45d378 7f84e378 7c681b78
3c62ff1a 3863c6f8 4802dc35 60000000 <0fe00000> 3920fff4 f9210070 e86100a0
---[ end trace 532d9066d3d4d7ec ]---

Some of the per-CPU masks use cpu_cpu_mask as a filter to limit the search
for related CPUs. On a dlpar add of a CPU, update cpu_cpu_mask before
updating the per-CPU masks. This will ensure the cpu_cpu_mask is updated
correctly before its used in setting the masks. Setting the numa_node will
ensure that when cpu_cpu_mask() gets called, the correct node number is
used. This code movement helped fix the above call trace.

Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210401154200.150077-1-srikar@linux.vnet.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index ea6adbf6a221..b24d860bbab9 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1254,6 +1254,9 @@ void start_secondary(void *unused)
 
 	vdso_getcpu_init();
 #endif
+	set_numa_node(numa_cpu_lookup_table[cpu]);
+	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
+
 	/* Update topology CPU masks */
 	add_cpu_to_masks(cpu);
 
@@ -1266,9 +1269,6 @@ void start_secondary(void *unused)
 	if (!cpumask_equal(cpu_l2_cache_mask(cpu), sibling_mask(cpu)))
 		shared_caches = true;
 
-	set_numa_node(numa_cpu_lookup_table[cpu]);
-	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
-
 	smp_wmb();
 	notify_cpu_starting(cpu);
 	set_cpu_online(cpu, true);
-- 
2.30.2

