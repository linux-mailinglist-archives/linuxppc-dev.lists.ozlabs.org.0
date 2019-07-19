Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE0A6E0AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 07:44:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qg1n0g5zzDqsN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 15:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="sbPTI4Uy"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qd200wKszDqkP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 14:14:48 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD2F321851;
 Fri, 19 Jul 2019 04:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563509686;
 bh=xLBip4cZruiuBdINg+7JNuRZK7kcfv3rNd423G4MXyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sbPTI4Uy/FoQii0qTn/clg4ALQAmfIu/b7D7NVtoc1zNW1BeNNBxFsLx8g7isgOmI
 vKjXid6wXlZIZzHGyH0lDlCJ01AXXj2MqSzSb8F5KV2zXzgBtqnfQk2eYoqew7j0Qv
 snvlekcXJGuLVvAampv/eNgSRMIbvpSqrFsAHPsQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 13/35] powerpc/pseries/mobility: rebuild cacheinfo
 hierarchy post-migration
Date: Fri, 19 Jul 2019 00:14:01 -0400
Message-Id: <20190719041423.19322-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719041423.19322-1-sashal@kernel.org>
References: <20190719041423.19322-1-sashal@kernel.org>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

[ Upstream commit e610a466d16a086e321f0bd421e2fc75cff28605 ]

It's common for the platform to replace the cache device nodes after a
migration. Since the cacheinfo code is never informed about this, it
never drops its references to the source system's cache nodes, causing
it to wind up in an inconsistent state resulting in warnings and oopses
as soon as CPU online/offline occurs after the migration, e.g.

  cache for /cpus/l3-cache@3113(Unified) refers to cache for /cpus/l2-cache@200d(Unified)
  WARNING: CPU: 15 PID: 86 at arch/powerpc/kernel/cacheinfo.c:176 release_cache+0x1bc/0x1d0
  [...]
  NIP release_cache+0x1bc/0x1d0
  LR  release_cache+0x1b8/0x1d0
  Call Trace:
    release_cache+0x1b8/0x1d0 (unreliable)
    cacheinfo_cpu_offline+0x1c4/0x2c0
    unregister_cpu_online+0x1b8/0x260
    cpuhp_invoke_callback+0x114/0xf40
    cpuhp_thread_fun+0x270/0x310
    smpboot_thread_fn+0x2c8/0x390
    kthread+0x1b8/0x1c0
    ret_from_kernel_thread+0x5c/0x68

Using device tree notifiers won't work since we want to rebuild the
hierarchy only after all the removals and additions have occurred and
the device tree is in a consistent state. Call cacheinfo_teardown()
before processing device tree updates, and rebuild the hierarchy
afterward.

Fixes: 410bccf97881 ("powerpc/pseries: Partition migration in the kernel")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/mobility.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index fcd1a32267c4..e85767c74e81 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -22,6 +22,7 @@
 #include <asm/machdep.h>
 #include <asm/rtas.h>
 #include "pseries.h"
+#include "../../kernel/cacheinfo.h"
 
 static struct kobject *mobility_kobj;
 
@@ -316,11 +317,20 @@ void post_mobility_fixup(void)
 	 */
 	cpus_read_lock();
 
+	/*
+	 * It's common for the destination firmware to replace cache
+	 * nodes.  Release all of the cacheinfo hierarchy's references
+	 * before updating the device tree.
+	 */
+	cacheinfo_teardown();
+
 	rc = pseries_devicetree_update(MIGRATION_SCOPE);
 	if (rc)
 		printk(KERN_ERR "Post-mobility device tree update "
 			"failed: %d\n", rc);
 
+	cacheinfo_rebuild();
+
 	cpus_read_unlock();
 
 	/* Possibly switch to a new RFI flush type */
-- 
2.20.1

