Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A485CA02BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 15:12:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JR492HGQzDr9w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 23:12:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JQvw6kG6zDqDs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 23:05:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46JQvt0Vpzz9sBF; Wed, 28 Aug 2019 23:05:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46JQvr6gL6z9sN6; Wed, 28 Aug 2019 23:05:28 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v4 2/2] powerpc/powernv: Add ultravisor message log interface
Date: Wed, 28 Aug 2019 23:05:21 +1000
Message-Id: <20190828130521.26764-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828130521.26764-1-mpe@ellerman.id.au>
References: <20190828130521.26764-1-mpe@ellerman.id.au>
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
Cc: cclaudio@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Claudio Carvalho <cclaudio@linux.ibm.com>

The ultravisor (UV) provides an in-memory console which follows the
OPAL in-memory console structure.

This patch extends the OPAL msglog code to initialize the UV memory
console and provide the "/sys/firmware/ultravisor/msglog" interface
for userspace to view the UV message log.

Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v4: mpe: Move all the code into ultravisor.c.
    Consistently use "uv_" as the prefix not "ultra_".
    Use powernv.h for routines that are shared within the platform.
    Rather than bloating the kernel with strings for every rare error
    case, return error codes from the init routine which can be
    seen with initcall_debug.
---
 arch/powerpc/platforms/powernv/powernv.h    |  5 +++
 arch/powerpc/platforms/powernv/ultravisor.c | 45 +++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/powernv.h b/arch/powerpc/platforms/powernv/powernv.h
index fd4a1c5a6369..1aa51c4fa904 100644
--- a/arch/powerpc/platforms/powernv/powernv.h
+++ b/arch/powerpc/platforms/powernv/powernv.h
@@ -30,4 +30,9 @@ extern void opal_event_shutdown(void);
 
 bool cpu_core_split_required(void);
 
+struct memcons;
+ssize_t memcons_copy(struct memcons *mc, char *to, loff_t pos, size_t count);
+u32 memcons_get_size(struct memcons *mc);
+struct memcons *memcons_init(struct device_node *node, const char *mc_prop_name);
+
 #endif /* _POWERNV_H */
diff --git a/arch/powerpc/platforms/powernv/ultravisor.c b/arch/powerpc/platforms/powernv/ultravisor.c
index 02ac57b4bded..e4a00ad06f9d 100644
--- a/arch/powerpc/platforms/powernv/ultravisor.c
+++ b/arch/powerpc/platforms/powernv/ultravisor.c
@@ -8,9 +8,15 @@
 #include <linux/init.h>
 #include <linux/printk.h>
 #include <linux/of_fdt.h>
+#include <linux/of.h>
 
 #include <asm/ultravisor.h>
 #include <asm/firmware.h>
+#include <asm/machdep.h>
+
+#include "powernv.h"
+
+static struct kobject *ultravisor_kobj;
 
 int __init early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
 					 int depth, void *data)
@@ -22,3 +28,42 @@ int __init early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
 	pr_debug("Ultravisor detected!\n");
 	return 1;
 }
+
+static struct memcons *uv_memcons;
+
+static ssize_t uv_msglog_read(struct file *file, struct kobject *kobj,
+			      struct bin_attribute *bin_attr, char *to,
+			      loff_t pos, size_t count)
+{
+	return memcons_copy(uv_memcons, to, pos, count);
+}
+
+static struct bin_attribute uv_msglog_attr = {
+	.attr = {.name = "msglog", .mode = 0400},
+	.read = uv_msglog_read
+};
+
+static int __init uv_init(void)
+{
+	struct device_node *node;
+
+	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
+		return 0;
+
+	node = of_find_compatible_node(NULL, NULL, "ibm,uv-firmware");
+	if (!node)
+		return -ENODEV;
+
+	uv_memcons = memcons_init(node, "memcons");
+	if (!uv_memcons)
+		return -ENOENT;
+
+	uv_msglog_attr.size = memcons_get_size(uv_memcons);
+
+	ultravisor_kobj = kobject_create_and_add("ultravisor", firmware_kobj);
+	if (!ultravisor_kobj)
+		return -ENOMEM;
+
+	return sysfs_create_bin_file(ultravisor_kobj, &uv_msglog_attr);
+}
+machine_subsys_initcall(powernv, uv_init);
-- 
2.21.0

