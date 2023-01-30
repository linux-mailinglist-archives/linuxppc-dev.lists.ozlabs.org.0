Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA7968038E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 02:45:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4rbJ4Wqfz3cdZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 12:45:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KxUpd+Lz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4rZL6jV5z2yJT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 12:44:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KxUpd+Lz;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P4rZH2H3dz4xFv;
	Mon, 30 Jan 2023 12:44:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675043047;
	bh=+gQLSnKsIPx3qg+LvQXg+Nbn3xDFi5VgPPdklVh5Y8Q=;
	h=From:To:Cc:Subject:Date:From;
	b=KxUpd+Lza6zniwTMiQZ2sMsQJwejCm+hyX4nZocp9QiMuL8i2gXHX5sEFauAi+CbU
	 He6YAS1DGZ2jz5m3V1M6oU1+UNKPUQWmwS3cZtAszAkp3qcCGynWW7EwUi/NtQSQYd
	 jV3PYpshiUKk5Dnsp47VkMrdgC8VYocKrvPnjoiKQBDvqjt07ffL+1Hp0l83ZaM6C7
	 lvDIe6SDT177dsYB6dyjLkRL6Ae9w+IUA8oLm7aTfuryJbKLJzyDNH2OFJkfYY/sdJ
	 4KYn8a1HMWuL+bglwr40pE3tGH/NtTwfLavdaJx6hVGwPszxn2RTNmcBN6K4BImf22
	 JjIevGA0g78GQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/imc-pmu: Revert nest_init_lock to being a mutex
Date: Mon, 30 Jan 2023 12:44:01 +1100
Message-Id: <20230130014401.540543-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.1
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
Cc: kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The recent commit 76d588dddc45 ("powerpc/imc-pmu: Fix use of mutex in
IRQs disabled section") fixed warnings (and possible deadlocks) in the
IMC PMU driver by converting the locking to use spinlocks.

It also converted the init-time nest_init_lock to a spinlock, even
though it's not used at runtime in IRQ disabled sections or while
holding other spinlocks.

This leads to warnings such as:

  BUG: sleeping function called from invalid context at include/linux/percpu-rwsem.h:49
  in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
  preempt_count: 1, expected: 0
  CPU: 7 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc2-14719-gf12cd06109f4-dirty #1
  Hardware name: Mambo,Simulated-System POWER9 0x4e1203 opal:v6.6.6 PowerNV
  Call Trace:
    dump_stack_lvl+0x74/0xa8 (unreliable)
    __might_resched+0x178/0x1a0
    __cpuhp_setup_state+0x64/0x1e0
    init_imc_pmu+0xe48/0x1250
    opal_imc_counters_probe+0x30c/0x6a0
    platform_probe+0x78/0x110
    really_probe+0x104/0x420
    __driver_probe_device+0xb0/0x170
    driver_probe_device+0x58/0x180
    __driver_attach+0xd8/0x250
    bus_for_each_dev+0xb4/0x140
    driver_attach+0x34/0x50
    bus_add_driver+0x1e8/0x2d0
    driver_register+0xb4/0x1c0
    __platform_driver_register+0x38/0x50
    opal_imc_driver_init+0x2c/0x40
    do_one_initcall+0x80/0x360
    kernel_init_freeable+0x310/0x3b8
    kernel_init+0x30/0x1a0
    ret_from_kernel_thread+0x5c/0x64

Fix it by converting nest_init_lock back to a mutex, so that we can call
sleeping functions while holding it. There is no interaction between
nest_init_lock and the runtime spinlocks used by the actual PMU routines.

Fixes: 76d588dddc45 ("powerpc/imc-pmu: Fix use of mutex in IRQs disabled section")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/perf/imc-pmu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 100e97daf76b..9d229ef7f86e 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -22,7 +22,7 @@
  * Used to avoid races in counting the nest-pmu units during hotplug
  * register and unregister
  */
-static DEFINE_SPINLOCK(nest_init_lock);
+static DEFINE_MUTEX(nest_init_lock);
 static DEFINE_PER_CPU(struct imc_pmu_ref *, local_nest_imc_refc);
 static struct imc_pmu **per_nest_pmu_arr;
 static cpumask_t nest_imc_cpumask;
@@ -1629,7 +1629,7 @@ static void imc_common_mem_free(struct imc_pmu *pmu_ptr)
 static void imc_common_cpuhp_mem_free(struct imc_pmu *pmu_ptr)
 {
 	if (pmu_ptr->domain == IMC_DOMAIN_NEST) {
-		spin_lock(&nest_init_lock);
+		mutex_lock(&nest_init_lock);
 		if (nest_pmus == 1) {
 			cpuhp_remove_state(CPUHP_AP_PERF_POWERPC_NEST_IMC_ONLINE);
 			kfree(nest_imc_refc);
@@ -1639,7 +1639,7 @@ static void imc_common_cpuhp_mem_free(struct imc_pmu *pmu_ptr)
 
 		if (nest_pmus > 0)
 			nest_pmus--;
-		spin_unlock(&nest_init_lock);
+		mutex_unlock(&nest_init_lock);
 	}
 
 	/* Free core_imc memory */
@@ -1796,11 +1796,11 @@ int init_imc_pmu(struct device_node *parent, struct imc_pmu *pmu_ptr, int pmu_id
 		* rest. To handle the cpuhotplug callback unregister, we track
 		* the number of nest pmus in "nest_pmus".
 		*/
-		spin_lock(&nest_init_lock);
+		mutex_lock(&nest_init_lock);
 		if (nest_pmus == 0) {
 			ret = init_nest_pmu_ref();
 			if (ret) {
-				spin_unlock(&nest_init_lock);
+				mutex_unlock(&nest_init_lock);
 				kfree(per_nest_pmu_arr);
 				per_nest_pmu_arr = NULL;
 				goto err_free_mem;
@@ -1808,7 +1808,7 @@ int init_imc_pmu(struct device_node *parent, struct imc_pmu *pmu_ptr, int pmu_id
 			/* Register for cpu hotplug notification. */
 			ret = nest_pmu_cpumask_init();
 			if (ret) {
-				spin_unlock(&nest_init_lock);
+				mutex_unlock(&nest_init_lock);
 				kfree(nest_imc_refc);
 				kfree(per_nest_pmu_arr);
 				per_nest_pmu_arr = NULL;
@@ -1816,7 +1816,7 @@ int init_imc_pmu(struct device_node *parent, struct imc_pmu *pmu_ptr, int pmu_id
 			}
 		}
 		nest_pmus++;
-		spin_unlock(&nest_init_lock);
+		mutex_unlock(&nest_init_lock);
 		break;
 	case IMC_DOMAIN_CORE:
 		ret = core_imc_pmu_cpumask_init();
-- 
2.39.1

