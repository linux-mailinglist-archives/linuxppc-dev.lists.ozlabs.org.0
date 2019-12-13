Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 762AC11DCAF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 04:52:48 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YxZh5zbQzDq7w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 14:52:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YxXH0SVGzDr72
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 14:50:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="AxLHPjfV"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47YxXG2hGDz9sP6; Fri, 13 Dec 2019 14:50:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47YxXG1tzPz9sPK; Fri, 13 Dec 2019 14:50:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576209038;
 bh=zbh7q8tvGos4I057DAetSoyGGD7GJeAtWoCpm2sw9CQ=;
 h=From:To:Cc:Subject:Date:From;
 b=AxLHPjfVv81vygQbMhfez4ipLmr5VoYSGWaJixLXuR2q92jOFfX9ZRyfD3hBKC/X5
 ckxyaYHGzt1QZxY9fNq+dbMvo0lOnfQHf4HCeM9lTEl+ygs9hLiOyJfXmdpeQx3Rkn
 raDsw+wYaY9+mCcLljQTsTGy8lICO62eBX44t9PnW6CAUvwMi/dFfH3CX2YEhyY++7
 NTMhRl4Ah6xqrkw9OKdgbo2x04SyXqfVqZvETswIGQXpfvVeyXROBJsUi6r5uQOQBi
 KVwxTLzQlvtYGjB1MLQKI4n8rz+eajRITt5KtwiaEMEYv4VZ+eJ+eKx+1luScSxjqd
 s6lu524V6zxTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v5 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
Date: Fri, 13 Dec 2019 14:50:35 +1100
Message-Id: <20191213035036.6913-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: juri.lelli@redhat.com, parth@linux.ibm.com, pauld@redhat.com,
 srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com, Ihor.Pasichnyk@ibm.com,
 longman@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

With commit 247f2f6f3c70 ("sched/core: Don't schedule threads on
pre-empted vCPUs"), the scheduler avoids preempted vCPUs to schedule
tasks on wakeup. This leads to wrong choice of CPU, which in-turn
leads to larger wakeup latencies. Eventually, it leads to performance
regression in latency sensitive benchmarks like soltp, schbench etc.

On Powerpc, vcpu_is_preempted() only looks at yield_count. If the
yield_count is odd, the vCPU is assumed to be preempted. However
yield_count is increased whenever the LPAR enters CEDE state (idle).
So any CPU that has entered CEDE state is assumed to be preempted.

Even if vCPU of dedicated LPAR is preempted/donated, it should have
right of first-use since they are supposed to own the vCPU.

On a Power9 System with 32 cores
  # lscpu
  Architecture:        ppc64le
  Byte Order:          Little Endian
  CPU(s):              128
  On-line CPU(s) list: 0-127
  Thread(s) per core:  8
  Core(s) per socket:  1
  Socket(s):           16
  NUMA node(s):        2
  Model:               2.2 (pvr 004e 0202)
  Model name:          POWER9 (architected), altivec supported
  Hypervisor vendor:   pHyp
  Virtualization type: para
  L1d cache:           32K
  L1i cache:           32K
  L2 cache:            512K
  L3 cache:            10240K
  NUMA node0 CPU(s):   0-63
  NUMA node1 CPU(s):   64-127

  # perf stat -a -r 5 ./schbench
  v5.4                                     v5.4 + patch
  Latency percentiles (usec)               Latency percentiles (usec)
  	50.0000th: 45                    	50.0000th: 39
  	75.0000th: 62                    	75.0000th: 53
  	90.0000th: 71                    	90.0000th: 67
  	95.0000th: 77                    	95.0000th: 76
  	*99.0000th: 91                   	*99.0000th: 89
  	99.5000th: 707                   	99.5000th: 93
  	99.9000th: 6920                  	99.9000th: 118
  	min=0, max=10048                 	min=0, max=211
  Latency percentiles (usec)               Latency percentiles (usec)
  	50.0000th: 45                    	50.0000th: 34
  	75.0000th: 61                    	75.0000th: 45
  	90.0000th: 72                    	90.0000th: 53
  	95.0000th: 79                    	95.0000th: 56
  	*99.0000th: 691                  	*99.0000th: 61
  	99.5000th: 3972                  	99.5000th: 63
  	99.9000th: 8368                  	99.9000th: 78
  	min=0, max=16606                 	min=0, max=228
  Latency percentiles (usec)               Latency percentiles (usec)
  	50.0000th: 45                    	50.0000th: 34
  	75.0000th: 61                    	75.0000th: 45
  	90.0000th: 71                    	90.0000th: 53
  	95.0000th: 77                    	95.0000th: 57
  	*99.0000th: 106                  	*99.0000th: 63
  	99.5000th: 2364                  	99.5000th: 68
  	99.9000th: 7480                  	99.9000th: 100
  	min=0, max=10001                 	min=0, max=134
  Latency percentiles (usec)               Latency percentiles (usec)
  	50.0000th: 45                    	50.0000th: 34
  	75.0000th: 62                    	75.0000th: 46
  	90.0000th: 72                    	90.0000th: 53
  	95.0000th: 78                    	95.0000th: 56
  	*99.0000th: 93                   	*99.0000th: 61
  	99.5000th: 108                   	99.5000th: 64
  	99.9000th: 6792                  	99.9000th: 85
  	min=0, max=17681                 	min=0, max=121
  Latency percentiles (usec)               Latency percentiles (usec)
  	50.0000th: 46                    	50.0000th: 33
  	75.0000th: 62                    	75.0000th: 44
  	90.0000th: 73                    	90.0000th: 51
  	95.0000th: 79                    	95.0000th: 54
  	*99.0000th: 113                  	*99.0000th: 61
  	99.5000th: 2724                  	99.5000th: 64
  	99.9000th: 6184                  	99.9000th: 82
  	min=0, max=9887                  	min=0, max=121

   Performance counter stats for 'system wide' (5 runs):

  context-switches    43,373  ( +-  0.40% )   44,597 ( +-  0.55% )
  cpu-migrations       1,211  ( +-  5.04% )      220 ( +-  6.23% )
  page-faults         15,983  ( +-  5.21% )   15,360 ( +-  3.38% )

Waiman Long suggested using static_keys.

Fixes: 247f2f6f3c70 ("sched/core: Don't schedule threads on pre-empted vCPUs")
Cc: stable@vger.kernel.org # v4.18+
Reported-by: Parth Shah <parth@linux.ibm.com>
Reported-by: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
Tested-by: Juri Lelli <juri.lelli@redhat.com>
Acked-by: Waiman Long <longman@redhat.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Acked-by: Phil Auld <pauld@redhat.com>
Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Tested-by: Parth Shah <parth@linux.ibm.com>
[mpe: Move the key and setting of the key to pseries/setup.c]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/spinlock.h    | 4 +++-
 arch/powerpc/platforms/pseries/setup.c | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

v5: mpe: Move the key and setting of the key to pseries/setup.c

Changelog v1 (https://patchwork.ozlabs.org/patch/1204190/) ->v3:
Code is now under CONFIG_PPC_SPLPAR as it depends on CONFIG_PPC_PSERIES.
This was suggested by Waiman Long.

Changelog v3 (https://patchwork.ozlabs.org/patch/1204526) ->v4:
Fix a build issue in CONFIG_NUMA=n reported by Michael Ellerman
by moving the relevant code from mm/numa.c to kernel/smp.c

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index e9a960e28f3c..cac95a3f30c2 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -36,10 +36,12 @@
 #endif
 
 #ifdef CONFIG_PPC_PSERIES
+DECLARE_STATIC_KEY_FALSE(shared_processor);
+
 #define vcpu_is_preempted vcpu_is_preempted
 static inline bool vcpu_is_preempted(int cpu)
 {
-	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
+	if (!static_branch_unlikely(&shared_processor))
 		return false;
 	return !!(be32_to_cpu(lppaca_of(cpu).yield_count) & 1);
 }
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 0a40201f315f..0c8421dd01ab 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -74,6 +74,9 @@
 #include "pseries.h"
 #include "../../../../drivers/pci/pci.h"
 
+DEFINE_STATIC_KEY_FALSE(shared_processor);
+EXPORT_SYMBOL_GPL(shared_processor);
+
 int CMO_PrPSP = -1;
 int CMO_SecPSP = -1;
 unsigned long CMO_PageSize = (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K);
@@ -758,6 +761,10 @@ static void __init pSeries_setup_arch(void)
 
 	if (firmware_has_feature(FW_FEATURE_LPAR)) {
 		vpa_init(boot_cpuid);
+
+		if (lppaca_shared_proc(get_lppaca()))
+			static_branch_enable(&shared_processor);
+
 		ppc_md.power_save = pseries_lpar_idle;
 		ppc_md.enable_pmcs = pseries_lpar_enable_pmcs;
 #ifdef CONFIG_PCI_IOV
-- 
2.21.0

