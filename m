Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A7E7E3BA5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 13:08:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I1pkrHzS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPn6r13jRz3cNt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 23:08:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I1pkrHzS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPn601PxTz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 23:07:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AB5B8B8168C;
	Tue,  7 Nov 2023 12:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192C8C433CA;
	Tue,  7 Nov 2023 12:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699358851;
	bh=IRBKkKgv5aR88byIZ6Re2E0UvtxYIrRtCbz9MOSX40g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I1pkrHzSP0vFV+JJD7NtKgcQPP+JjC9OWdPQkkPv2aKVjBigVIqzt6l1e43229GIT
	 H7Se785jE467lbpE+MdZ6Q2blOlTpr15gpRjfziVNnThWWV6wYUmXwSj7otTtAJYOb
	 o/dskAUygHHRHznqO8hrFFYNbP6m826dZPjFOBlKmGqO5YBogbeJcgunGxq/X48iq9
	 ssTd2FpWukR3sPHY1ggpLSrKYFRTuCCONX2NIvBD/NSxr5LTyuF3adIRWHBkIY+dOl
	 ptwap3F/V/oNIR7JdMDlYzCUey1n0E2KlRxrnp8twiWJRU10xk3oNSGzll/w6Xq37o
	 S4nYtGmhAZIOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 11/31] ACPI: APEI: Fix AER info corruption when error status data has multiple sections
Date: Tue,  7 Nov 2023 07:05:58 -0500
Message-ID: <20231107120704.3756327-11-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120704.3756327-1-sashal@kernel.org>
References: <20231107120704.3756327-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
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
Cc: Sasha Levin <sashal@kernel.org>, linmiaohe@huawei.com, tony.luck@intel.com, rafael@kernel.org, linux-pci@vger.kernel.org, kvalo@kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, mahesh@linux.ibm.com, rostedt@goodmis.org, robert.moore@intel.com, linux-acpi@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, acpica-devel@lists.linuxfoundation.org, leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Shiju Jose <shiju.jose@huawei.com>

[ Upstream commit e2abc47a5a1a9f641e7cacdca643fdd40729bf6e ]

ghes_handle_aer() passes AER data to the PCI core for logging and
recovery by calling aer_recover_queue() with a pointer to struct
aer_capability_regs.

The problem was that aer_recover_queue() queues the pointer directly
without copying the aer_capability_regs data.  The pointer was to
the ghes->estatus buffer, which could be reused before
aer_recover_work_func() reads the data.

To avoid this problem, allocate a new aer_capability_regs structure
from the ghes_estatus_pool, copy the AER data from the ghes->estatus
buffer into it, pass a pointer to the new struct to
aer_recover_queue(), and free it after aer_recover_work_func() has
processed it.

Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
[ rjw: Subject edits ]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/acpi/apei/ghes.c | 23 ++++++++++++++++++++++-
 drivers/pci/pcie/aer.c   | 10 ++++++++++
 include/acpi/ghes.h      |  4 ++++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index ef59d6ea16da0..63ad0541db381 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -209,6 +209,20 @@ int ghes_estatus_pool_init(unsigned int num_ghes)
 	return -ENOMEM;
 }
 
+/**
+ * ghes_estatus_pool_region_free - free previously allocated memory
+ *				   from the ghes_estatus_pool.
+ * @addr: address of memory to free.
+ * @size: size of memory to free.
+ *
+ * Returns none.
+ */
+void ghes_estatus_pool_region_free(unsigned long addr, u32 size)
+{
+	gen_pool_free(ghes_estatus_pool, addr, size);
+}
+EXPORT_SYMBOL_GPL(ghes_estatus_pool_region_free);
+
 static int map_gen_v2(struct ghes *ghes)
 {
 	return apei_map_generic_address(&ghes->generic_v2->read_ack_register);
@@ -564,6 +578,7 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
 	    pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO) {
 		unsigned int devfn;
 		int aer_severity;
+		u8 *aer_info;
 
 		devfn = PCI_DEVFN(pcie_err->device_id.device,
 				  pcie_err->device_id.function);
@@ -577,11 +592,17 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
 		if (gdata->flags & CPER_SEC_RESET)
 			aer_severity = AER_FATAL;
 
+		aer_info = (void *)gen_pool_alloc(ghes_estatus_pool,
+						  sizeof(struct aer_capability_regs));
+		if (!aer_info)
+			return;
+		memcpy(aer_info, pcie_err->aer_info, sizeof(struct aer_capability_regs));
+
 		aer_recover_queue(pcie_err->device_id.segment,
 				  pcie_err->device_id.bus,
 				  devfn, aer_severity,
 				  (struct aer_capability_regs *)
-				  pcie_err->aer_info);
+				  aer_info);
 	}
 #endif
 }
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9c8fd69ae5ad8..40d84cb0c601e 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -29,6 +29,7 @@
 #include <linux/kfifo.h>
 #include <linux/slab.h>
 #include <acpi/apei.h>
+#include <acpi/ghes.h>
 #include <ras/ras_event.h>
 
 #include "../pci.h"
@@ -997,6 +998,15 @@ static void aer_recover_work_func(struct work_struct *work)
 			continue;
 		}
 		cper_print_aer(pdev, entry.severity, entry.regs);
+		/*
+		 * Memory for aer_capability_regs(entry.regs) is being allocated from the
+		 * ghes_estatus_pool to protect it from overwriting when multiple sections
+		 * are present in the error status. Thus free the same after processing
+		 * the data.
+		 */
+		ghes_estatus_pool_region_free((unsigned long)entry.regs,
+					      sizeof(struct aer_capability_regs));
+
 		if (entry.severity == AER_NONFATAL)
 			pcie_do_recovery(pdev, pci_channel_io_normal,
 					 aer_root_reset);
diff --git a/include/acpi/ghes.h b/include/acpi/ghes.h
index 3c8bba9f1114a..be1dd4c1a9174 100644
--- a/include/acpi/ghes.h
+++ b/include/acpi/ghes.h
@@ -73,8 +73,12 @@ int ghes_register_vendor_record_notifier(struct notifier_block *nb);
 void ghes_unregister_vendor_record_notifier(struct notifier_block *nb);
 
 struct list_head *ghes_get_devices(void);
+
+void ghes_estatus_pool_region_free(unsigned long addr, u32 size);
 #else
 static inline struct list_head *ghes_get_devices(void) { return NULL; }
+
+static inline void ghes_estatus_pool_region_free(unsigned long addr, u32 size) { return; }
 #endif
 
 int ghes_estatus_pool_init(unsigned int num_ghes);
-- 
2.42.0

