Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8151C493F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 23:48:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GGgz57CCzDqXV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 07:48:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=prsriva@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=ILUbPqhU; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 49GF7R5cL3zDqVs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 06:38:40 +1000 (AEST)
Received: from prsriva-linux.hsd1.wa.comcast.net
 (c-24-19-135-168.hsd1.wa.comcast.net [24.19.135.168])
 by linux.microsoft.com (Postfix) with ESMTPSA id 558D420B71B7;
 Mon,  4 May 2020 13:38:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 558D420B71B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1588624719;
 bh=C+sd6G4UJ2+JexgAlN+GBQQZCYjDYuFZwBIY4qNTUnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ILUbPqhUzBG5u0MGXSuDFN5LE1ejSw53zTKdYmcIaCJmbyfVQAR2NQ0Jf0TT1kqC/
 Mtkd2aQiWmcQzckF5k4es0KNH1L4I5jyS8VvRMyX83eGsWH2qeo3rhXX+p0P+FhcYP
 R6Q0qF8zHvMOcMU/IwwyQh5EuFdcBONAopknPSJs=
From: Prakhar Srivastava <prsriva@linux.microsoft.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [RFC][PATCH 1/2] Add a layer of abstraction to use the memory
 reserved by device tree for ima buffer pass.
Date: Mon,  4 May 2020 13:38:28 -0700
Message-Id: <20200504203829.6330-2-prsriva@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504203829.6330-1-prsriva@linux.microsoft.com>
References: <20200504203829.6330-1-prsriva@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 May 2020 07:46:27 +1000
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
Cc: kstewart@linuxfoundation.org, mark.rutland@arm.com, catalin.marinas@arm.com,
 bhsharma@redhat.com, tao.li@vivo.com, zohar@linux.ibm.com, paulus@samba.org,
 vincenzo.frascino@arm.com, frowand.list@gmail.com, nramas@linux.microsoft.com,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 serge@hallyn.com, pasha.tatashin@soleen.com, will@kernel.org,
 prsriva@linux.microsoft.com, robh+dt@kernel.org, hsinyi@chromium.org,
 tusharsu@linux.microsoft.com, tglx@linutronix.de, allison@lohutok.net,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 james.morse@arm.com, gregkh@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce a device tree layer for to read and store ima buffer
from the reserved memory section of a device tree.

Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
---
 drivers/of/Kconfig  |   6 ++
 drivers/of/Makefile |   1 +
 drivers/of/of_ima.c | 165 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h  |  34 +++++++++
 4 files changed, 206 insertions(+)
 create mode 100644 drivers/of/of_ima.c

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index d91618641be6..edb3c39740fb 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -107,4 +107,10 @@ config OF_DMA_DEFAULT_COHERENT
 	# arches should select this if DMA is coherent by default for OF devices
 	bool
 
+config OF_IMA
+	def_bool y
+	help
+	  IMA related wrapper functions to add/remove ima measurement logs during
+	  kexec_file_load call.
+
 endif # OF
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index 663a4af0cccd..b4caf083df4e 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -14,5 +14,6 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
 obj-$(CONFIG_OF_RESOLVE)  += resolver.o
 obj-$(CONFIG_OF_OVERLAY) += overlay.o
 obj-$(CONFIG_OF_NUMA) += of_numa.o
+obj-$(CONFIG_OF_IMA) += of_ima.o
 
 obj-$(CONFIG_OF_UNITTEST) += unittest-data/
diff --git a/drivers/of/of_ima.c b/drivers/of/of_ima.c
new file mode 100644
index 000000000000..131f68d81e2e
--- /dev/null
+++ b/drivers/of/of_ima.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Microsoft Corporation.
+ */
+
+#include <linux/slab.h>
+#include <linux/kexec.h>
+#include <linux/of.h>
+#include <linux/memblock.h>
+#include <linux/libfdt.h>
+#include <linux/of_address.h>
+
+static bool dtb_status_enabled;
+static struct resource mem_res;
+static void *vaddr;
+
+
+/**
+ * of_is_ima_memory_reserved - check if memory is reserved via device
+ *							tree.
+ *	Return: zero when memory is not reserved.
+ *			positive number on success.
+ *
+ */
+int of_is_ima_memory_reserved(void)
+{
+	return dtb_status_enabled;
+}
+
+/**
+ * of_ima_write_buffer - Write the ima buffer into the reserved memory.
+ *
+ * ima_buffer - buffer starting address.
+ * ima_buffer_size - size of segment.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int of_ima_write_buffer(void *ima_buffer, size_t ima_buffer_size)
+{
+	void *addr;
+
+	if (!dtb_status_enabled)
+		return -EOPNOTSUPP;
+
+	vaddr = memremap(mem_res.start, resource_size(&mem_res), MEMREMAP_WB);
+	pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX\n , size : %lld",
+	(u64)vaddr, mem_res.start, resource_size(&mem_res));
+
+	if (vaddr) {
+		memcpy(vaddr, &ima_buffer_size, sizeof(size_t));
+		addr =  vaddr + sizeof(size_t);
+		memcpy(addr, ima_buffer, ima_buffer_size);
+		memunmap(vaddr);
+		vaddr = NULL;
+	}
+
+	return 0;
+}
+
+/**
+ * of_remove_ima_buffer - Write 0(Zero length buffer to read)to the
+ *                        size location of the buffer.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int of_remove_ima_buffer(void)
+{
+	size_t empty_buffer_size = 0;
+
+	if (!dtb_status_enabled)
+		return -ENOTSUPP;
+
+	if (vaddr) {
+		memcpy(vaddr, &empty_buffer_size, sizeof(size_t));
+		memunmap(vaddr);
+		vaddr = NULL;
+	}
+
+	return 0;
+}
+
+/**
+ * of_ima_get_size_allocated - Get the usable buffer size thats allocated in
+ *                             the device-tree.
+ *
+ * Return: 0 on unavailable node, size of the memory block - (size_t)
+ */
+size_t of_ima_get_size_allocated(void)
+{
+	size_t size = 0;
+
+	if (!dtb_status_enabled)
+		return size;
+
+	size = resource_size(&mem_res) - sizeof(size_t);
+	return size;
+}
+
+/**
+ * of_get_ima_buffer - Get IMA buffer address.
+ *
+ * @addr:       On successful return, set to point to the buffer contents.
+ * @size:       On successful return, set to the buffer size.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int of_get_ima_buffer(void **addr, size_t *size)
+{
+	if (!dtb_status_enabled)
+		return -ENOTSUPP;
+
+	vaddr = memremap(mem_res.start, resource_size(&mem_res), MEMREMAP_WB);
+	pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX,\n allocated size : %lld, ima_buffer_size: %ld ",
+	(u64)vaddr, mem_res.start, resource_size(&mem_res), *(size_t *)vaddr);
+
+	*size = *(size_t *)vaddr;
+	*addr = vaddr + sizeof(size_t);
+	return 0;
+}
+
+static const struct of_device_id ima_buffer_pass_ids[] = {
+	{
+		.compatible = "linux,ima_buffer_pass",
+	},
+	{}
+};
+
+static const struct of_device_id ima_buffer_pass_match[] = {
+	{
+		.name = "ima_buffer_pass",
+	},
+};
+MODULE_DEVICE_TABLE(of, ima_buffer_pass_match);
+
+static int __init ima_buffer_pass_init(void)
+{
+	int ret = 0;
+	struct device_node *memnp;
+	struct device_node *ima_buffer_pass_node;
+
+	ima_buffer_pass_node = of_find_matching_node(NULL, ima_buffer_pass_ids);
+	if (!ima_buffer_pass_node)
+		return -ENOENT;
+
+	memnp = of_parse_phandle(ima_buffer_pass_node, "memory-region", 0);
+	if (!memnp)
+		return -ENXIO;
+
+	ret = of_address_to_resource(memnp, 0, &mem_res);
+	if (ret < 0)
+		return -ENOENT;
+
+	of_node_put(memnp);
+	dtb_status_enabled = true;
+
+	return ret;
+}
+
+static void __exit ima_buffer_pass_exit(void)
+{
+	pr_info("trying to exit the ima driver\n");
+}
+
+module_init(ima_buffer_pass_init);
+module_exit(ima_buffer_pass_exit);
diff --git a/include/linux/of.h b/include/linux/of.h
index c669c0a4732f..85ce2f24024f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1485,4 +1485,38 @@ static inline int of_overlay_notifier_unregister(struct notifier_block *nb)
 
 #endif
 
+#ifdef CONFIG_OF_IMA
+int of_is_ima_memory_reserved(void);
+int of_remove_ima_buffer(void);
+int of_get_ima_buffer(void **addr, size_t *size);
+size_t of_ima_get_size_allocated(void);
+int of_ima_write_buffer(void *ima_buffer,
+		size_t ima_buffer_size);
+#else
+static inline int of_is_ima_memory_reserved(void)
+{
+	return -ENOTSUPP;
+};
+static inline int of_remove_ima_buffer(void)
+{
+	return -ENOTSUPP;
+};
+
+static inline int of_get_ima_buffer(void **addr, size_t *size)
+{
+	return -ENOTSUPP;
+};
+
+static inline size_t of_ima_get_size_allocated(void)
+{
+	return 0;
+};
+
+static inline int of_ima_write_buffer(void *ima_buffer,
+				      size_t ima_buffer_size)
+{
+	return -ENOTSUPP;
+};
+#endif
+
 #endif /* _LINUX_OF_H */
-- 
2.25.1

