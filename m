Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2EA68C66F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 20:08:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9bQ43h0wz3fgL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 06:08:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lTPR4QeL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lTPR4QeL;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9b601SDGz3cNN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 05:54:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 12286B815DB;
	Mon,  6 Feb 2023 18:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97735C433AA;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675709665;
	bh=0wRlHbiQWYkcnr2uGR+VT7fdBO3+c8RrPusq+5ENG1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lTPR4QeL4y0axJGPIMOjGbjI3F3FiMNgsRaaJKDsMBj/B0lyIfLuew3Dc5zYO0VbK
	 D4PdFSI0lfNULtow6y4nq5vhUe2BhklmOiP/OzzHONOgTB3+EIcifBQ3or9U2CgJxs
	 Ah2oxeircQNn9kqKnrJM0zGZEw9EKcBd70aJkbCvh5+8P1XARyp4MC4u1jNW10Kncf
	 5iaVKeOQQNiBpgWd1J8p0Cy1vgbL2LuN09lm/PyRkFQlnMBlg5T5anIk6hqs/DnMsT
	 6BTZflxb6QKIXM/mn1zEVHLOqpAl/qUJyf2lvVZMwdcC0zIypj9dCRqJhpkn5JmMhH
	 Msbkjr7z1b+lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871B0C636D4;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Feb 2023 12:54:27 -0600
Subject: [PATCH v2 11/19] powerpc/rtas: add work area allocator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v2-11-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675709663; l=12081;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=Yz/Jx3HhKE9ti5ppUlMm7pKx3p4XeEC5EaNN5H/pbkA=;
 b=9f+dFRVE3XaPOxRpDkX7B4mjC/FJdhKQ6GlyJVK3bIcISrO4WtNEqhUHrPT/v4MtVsAN6vDe2
 ttNCEiDhxw3BBUeqGMOK+t0nZK+TYWPuko+LohBM6xFSoWc1zquISOe
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Submission Endpoint for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Most callers of RTAS functions that take a temporary "work area"
parameter use the statically allocated rtas_data_buf buffer as the
argument. This buffer is protected by a global spinlock. So users of
rtas_data_buf cannot perform sleeping operations while accessing the
buffer.

Most RTAS functions that have a work area parameter can return a
status (-2/990x) that indicates that the caller should retry. Before
retrying, the caller may need to reschedule or sleep (see
rtas_busy_delay() for details). This combination of factors
necessitates uncomfortable constructions like this:

	do {
		spin_lock(&rtas_data_buf_lock);
		rc = rtas_call(token, __pa(rtas_data_buf, ...);
		if (rc == 0) {
			/* parse or copy out rtas_data_buf contents */
		}
		spin_unlock(&rtas_data_buf_lock);
	} while (rtas_busy_delay(rc));

Another unfortunately common way of handling this is for callers to
blithely ignore the possibility of a -2/990x status and hope for the
best.

If users were allowed to perform blocking operations while owning a
work area, the programming model would become less tedious and
error-prone. Users could schedule away, sleep, or perform other
blocking operations without having to release and re-acquire
resources.

We could continue to use a single work area buffer, and convert
rtas_data_buf_lock to a mutex. But that would impose an unnecessarily
coarse serialization on all users. As awkward as the current design
is, it prevents longer running operations that need to repeatedly use
rtas_data_buf from blocking the progress of others.

There are more considerations. One is that while 4KB is fine for all
current in-kernel uses, some RTAS calls can take much smaller buffers,
and some (VPD, platform dumps) would likely benefit from larger
ones. Another is that at least one RTAS function (ibm,get-vpd)
has *two* work area parameters. And finally, we should expect the
number of work area users in the kernel to increase over time as we
introduce lockdown-compatible ABIs to replace less safe use cases
based on sys_rtas/librtas.

So a special-purpose allocator for RTAS work area buffers seems worth
trying.

Properties:

* The backing memory for the allocator is reserved early in boot in
  order to satisfy RTAS addressing requirements, and then managed with
  genalloc.
* Allocations can block, but they never fail (mempool-like).
* Prioritizes first-come, first-serve fairness over throughput.
* Early boot allocations before the allocator has been initialized are
  served via an internal static buffer.

Intended to replace rtas_data_buf. New code that needs RTAS work area
buffers should prefer this API.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas-work-area.h |  45 +++++++
 arch/powerpc/kernel/Makefile              |   3 +-
 arch/powerpc/kernel/rtas-work-area.c      | 208 ++++++++++++++++++++++++++++++
 arch/powerpc/kernel/rtas.c                |   3 +
 4 files changed, 258 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas-work-area.h b/arch/powerpc/include/asm/rtas-work-area.h
new file mode 100644
index 000000000000..76ccb039cc37
--- /dev/null
+++ b/arch/powerpc/include/asm/rtas-work-area.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef POWERPC_RTAS_WORK_AREA_H
+#define POWERPC_RTAS_WORK_AREA_H
+
+#include <linux/types.h>
+
+#include <asm/page.h>
+
+/**
+ * struct rtas_work_area - RTAS work area descriptor.
+ *
+ * Descriptor for a "work area" in PAPR terminology that satisfies
+ * RTAS addressing requirements.
+ */
+struct rtas_work_area {
+	/* private: Use the APIs provided below. */
+	char *buf;
+	size_t size;
+};
+
+struct rtas_work_area *rtas_work_area_alloc(size_t size);
+void rtas_work_area_free(struct rtas_work_area *area);
+
+static inline char *rtas_work_area_raw_buf(const struct rtas_work_area *area)
+{
+	return area->buf;
+}
+
+static inline size_t rtas_work_area_size(const struct rtas_work_area *area)
+{
+	return area->size;
+}
+
+static inline phys_addr_t rtas_work_area_phys(const struct rtas_work_area *area)
+{
+	return __pa(area->buf);
+}
+
+/*
+ * Early setup for the work area allocator. Call from
+ * rtas_initialize() only.
+ */
+int rtas_work_area_reserve_arena(phys_addr_t);
+
+#endif /* POWERPC_RTAS_WORK_AREA_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 9b6146056e48..69e652e319a4 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -90,7 +90,8 @@ obj-$(CONFIG_PPC_BOOK3S_IDLE)	+= idle_book3s.o
 procfs-y			:= proc_powerpc.o
 obj-$(CONFIG_PROC_FS)		+= $(procfs-y)
 rtaspci-$(CONFIG_PPC64)-$(CONFIG_PCI)	:= rtas_pci.o
-obj-$(CONFIG_PPC_RTAS)		+= rtas_entry.o rtas.o rtas-rtc.o $(rtaspci-y-y)
+obj-$(CONFIG_PPC_RTAS)		+= rtas_entry.o rtas.o rtas-rtc.o $(rtaspci-y-y) \
+                                   rtas-work-area.o
 obj-$(CONFIG_PPC_RTAS_DAEMON)	+= rtasd.o
 obj-$(CONFIG_RTAS_FLASH)	+= rtas_flash.o
 obj-$(CONFIG_RTAS_PROC)		+= rtas-proc.o
diff --git a/arch/powerpc/kernel/rtas-work-area.c b/arch/powerpc/kernel/rtas-work-area.c
new file mode 100644
index 000000000000..75950e13a0fe
--- /dev/null
+++ b/arch/powerpc/kernel/rtas-work-area.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define pr_fmt(fmt)	"rtas-work-area: " fmt
+
+#include <linux/genalloc.h>
+#include <linux/log2.h>
+#include <linux/kernel.h>
+#include <linux/memblock.h>
+#include <linux/mempool.h>
+#include <linux/minmax.h>
+#include <linux/mutex.h>
+#include <linux/numa.h>
+#include <linux/sizes.h>
+#include <linux/wait.h>
+
+#include <asm/machdep.h>
+#include <asm/rtas-work-area.h>
+
+enum {
+	/*
+	 * Ensure the pool is page-aligned.
+	 */
+	RTAS_WORK_AREA_ARENA_ALIGN = PAGE_SIZE,
+
+	RTAS_WORK_AREA_ARENA_SZ = SZ_256K,
+	/*
+	 * The smallest known work area size is for ibm,get-vpd's
+	 * location code argument, which is limited to 79 characters
+	 * plus 1 nul terminator.
+	 *
+	 * PAPR+ 7.3.20 ibm,get-vpd RTAS Call
+	 * PAPR+ 12.3.2.4 Converged Location Code Rules - Length Restrictions
+	 */
+	RTAS_WORK_AREA_MIN_ALLOC_SZ = roundup_pow_of_two(80),
+	/*
+	 * Don't let a single allocation claim the whole arena.
+	 */
+	RTAS_WORK_AREA_MAX_ALLOC_SZ = RTAS_WORK_AREA_ARENA_SZ / 2,
+};
+
+static struct rtas_work_area_allocator_state {
+	struct gen_pool *gen_pool;
+	char *arena;
+	struct mutex mutex; /* serializes allocations */
+	struct wait_queue_head wqh;
+	mempool_t descriptor_pool;
+	bool available;
+} rwa_state_ = {
+	.mutex = __MUTEX_INITIALIZER(rwa_state_.mutex),
+	.wqh = __WAIT_QUEUE_HEAD_INITIALIZER(rwa_state_.wqh),
+};
+static struct rtas_work_area_allocator_state *rwa_state = &rwa_state_;
+
+/*
+ * A single work area buffer and descriptor to serve requests early in
+ * boot before the allocator is fully initialized.
+ */
+static bool early_work_area_in_use __initdata;
+static char early_work_area_buf[SZ_4K] __initdata;
+static struct rtas_work_area early_work_area __initdata = {
+	.buf = early_work_area_buf,
+	.size = sizeof(early_work_area_buf),
+};
+
+
+static struct rtas_work_area * __init rtas_work_area_alloc_early(size_t size)
+{
+	WARN_ON(size > early_work_area.size);
+	WARN_ON(early_work_area_in_use);
+	early_work_area_in_use = true;
+	memset(early_work_area.buf, 0, early_work_area.size);
+	return &early_work_area;
+}
+
+static void __init rtas_work_area_free_early(struct rtas_work_area *work_area)
+{
+	WARN_ON(work_area != &early_work_area);
+	WARN_ON(!early_work_area_in_use);
+	early_work_area_in_use = false;
+}
+
+struct rtas_work_area * __ref rtas_work_area_alloc(size_t size)
+{
+	struct rtas_work_area *area;
+	unsigned long addr;
+
+	might_sleep();
+
+	WARN_ON(size > RTAS_WORK_AREA_MAX_ALLOC_SZ);
+	size = min_t(size_t, size, RTAS_WORK_AREA_MAX_ALLOC_SZ);
+
+	if (!rwa_state->available) {
+		area = rtas_work_area_alloc_early(size);
+		goto out;
+	}
+
+	/*
+	 * To ensure FCFS behavior and prevent a high rate of smaller
+	 * requests from starving larger ones, use the mutex to queue
+	 * allocations.
+	 */
+	mutex_lock(&rwa_state->mutex);
+	wait_event(rwa_state->wqh,
+		   (addr = gen_pool_alloc(rwa_state->gen_pool, size)) != 0);
+	mutex_unlock(&rwa_state->mutex);
+
+	area = mempool_alloc(&rwa_state->descriptor_pool, GFP_KERNEL);
+	*area = (typeof(*area)){
+		.size = size,
+		.buf = (char *)addr,
+	};
+out:
+	pr_devel("%ps -> %s() -> buf=%p size=%zu\n",
+		 (void *)_RET_IP_, __func__, area->buf, area->size);
+
+	return area;
+}
+
+void __ref rtas_work_area_free(struct rtas_work_area *area)
+{
+	pr_devel("%ps -> %s() -> buf=%p size=%zu\n",
+		 (void *)_RET_IP_, __func__, area->buf, area->size);
+
+	if (!rwa_state->available) {
+		rtas_work_area_free_early(area);
+		return;
+	}
+
+	gen_pool_free(rwa_state->gen_pool, (unsigned long)area->buf, area->size);
+	mempool_free(area, &rwa_state->descriptor_pool);
+	wake_up(&rwa_state->wqh);
+}
+
+/*
+ * Initialization of the work area allocator happens in two parts. To
+ * reliably reserve an arena that satisfies RTAS addressing
+ * requirements, we must perform a memblock allocation early,
+ * immmediately after RTAS instantiation. Then we have to wait until
+ * the slab allocator is up before setting up the descriptor mempool
+ * and adding the arena to a gen_pool.
+ */
+static __init int rtas_work_area_allocator_init(void)
+{
+	const unsigned int order = ilog2(RTAS_WORK_AREA_MIN_ALLOC_SZ);
+	const phys_addr_t pa_start = __pa(rwa_state->arena);
+	const phys_addr_t pa_end = pa_start + RTAS_WORK_AREA_ARENA_SZ - 1;
+	struct gen_pool *pool;
+	const int nid = NUMA_NO_NODE;
+	int err;
+
+	err = -ENOMEM;
+	if (!rwa_state->arena)
+		goto err_out;
+
+	pool = gen_pool_create(order, nid);
+	if (!pool)
+		goto err_out;
+	/*
+	 * All RTAS functions that consume work areas are OK with
+	 * natural alignment, when they have alignment requirements at
+	 * all.
+	 */
+	gen_pool_set_algo(pool, gen_pool_first_fit_order_align, NULL);
+
+	err = gen_pool_add(pool, (unsigned long)rwa_state->arena,
+			   RTAS_WORK_AREA_ARENA_SZ, nid);
+	if (err)
+		goto err_destroy;
+
+	err = mempool_init_kmalloc_pool(&rwa_state->descriptor_pool, 1,
+					sizeof(struct rtas_work_area));
+	if (err)
+		goto err_destroy;
+
+	rwa_state->gen_pool = pool;
+	rwa_state->available = true;
+
+	pr_debug("arena [%pa-%pa] (%uK), min/max alloc sizes %u/%u\n",
+		 &pa_start, &pa_end,
+		 RTAS_WORK_AREA_ARENA_SZ / SZ_1K,
+		 RTAS_WORK_AREA_MIN_ALLOC_SZ,
+		 RTAS_WORK_AREA_MAX_ALLOC_SZ);
+
+	return 0;
+
+err_destroy:
+	gen_pool_destroy(pool);
+err_out:
+	return err;
+}
+machine_arch_initcall(pseries, rtas_work_area_allocator_init);
+
+/**
+ * rtas_work_area_reserve_arena() - reserve memory suitable for RTAS work areas.
+ */
+int __init rtas_work_area_reserve_arena(const phys_addr_t limit)
+{
+	const phys_addr_t align = RTAS_WORK_AREA_ARENA_ALIGN;
+	const phys_addr_t size = RTAS_WORK_AREA_ARENA_SZ;
+	const phys_addr_t min = MEMBLOCK_LOW_LIMIT;
+	const int nid = NUMA_NO_NODE;
+
+	rwa_state->arena = memblock_alloc_try_nid(size, align, min, limit, nid);
+	if (!rwa_state->arena)
+		return -ENOMEM;
+
+	return 0;
+}
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 3290f25b9b34..41c430dc40c2 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -36,6 +36,7 @@
 #include <asm/machdep.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
+#include <asm/rtas-work-area.h>
 #include <asm/rtas.h>
 #include <asm/time.h>
 #include <asm/trace.h>
@@ -1938,6 +1939,8 @@ void __init rtas_initialize(void)
 #endif
 	ibm_open_errinjct_token = rtas_token("ibm,open-errinjct");
 	ibm_errinjct_token = rtas_token("ibm,errinjct");
+
+	rtas_work_area_reserve_arena(rtas_region);
 }
 
 int __init early_init_dt_scan_rtas(unsigned long node,

-- 
2.39.1

