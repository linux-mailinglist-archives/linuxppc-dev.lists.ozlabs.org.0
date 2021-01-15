Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7752F84DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:56:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHVlK1TxVzDqHK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:56:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=qt/SDxe2; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DHSrB135czDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 04:30:34 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id CBC5B20B6C45;
 Fri, 15 Jan 2021 09:30:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CBC5B20B6C45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1610731827;
 bh=6cVI3w8yCFM8GT1h4i1Nrs9SDPqvHQqdE5MXFjdMj1s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qt/SDxe2uULZ4NELCdi2m1k7zFPErA3uE/kHaQ7lss+J7LvogZQ9yjDnbUzo5odl7
 DuQzq93Xjq/tmMKhPgGIAm+3YZcFFRYVOV0EOi0+7eWB0NCQp/WBdlqIdVsUJxkiEf
 N01dOqeHlSUFfwQMvW18sm/MT114M0YtoGhqmW9E=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 catalin.marinas@arm.com, mpe@ellerman.id.au
Subject: [PATCH v15 06/10] powerpc: Move arch independent ima kexec functions
 to drivers/of/kexec.c
Date: Fri, 15 Jan 2021 09:30:13 -0800
Message-Id: <20210115173017.30617-7-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115173017.30617-1-nramas@linux.microsoft.com>
References: <20210115173017.30617-1-nramas@linux.microsoft.com>
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
Cc: mark.rutland@arm.com, bhsharma@redhat.com, tao.li@vivo.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 linux-arm-kernel@lists.infradead.org, serge@hallyn.com,
 devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 prsriva@linux.microsoft.com, hsinyi@chromium.org, allison@lohutok.net,
 christophe.leroy@c-s.fr, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org, james.morse@arm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The functions defined in "arch/powerpc/kexec/ima.c" handle setting up
and freeing the resources required to carry over the IMA measurement
list from the current kernel to the next kernel across kexec system call.
These functions do not have architecture specific code, but are
currently limited to powerpc.

Move setup_ima_buffer() call into of_kexec_setup_new_fdt() defined in
"drivers/of/kexec.c".  Call of_kexec_setup_new_fdt() from
setup_new_fdt_ppc64() and remove setup_new_fdt() in
"arch/powerpc/kexec/file_load.c".

Move the remaining architecture independent functions from
"arch/powerpc/kexec/ima.c" to "drivers/of/kexec.c".
Delete "arch/powerpc/kexec/ima.c" and "arch/powerpc/include/asm/ima.h".
Remove references to the deleted files in powerpc and in ima.

Co-developed-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 arch/powerpc/Kconfig               |   2 +-
 arch/powerpc/include/asm/ima.h     |  27 ----
 arch/powerpc/include/asm/kexec.h   |   3 -
 arch/powerpc/kexec/Makefile        |   7 -
 arch/powerpc/kexec/file_load.c     |  35 -----
 arch/powerpc/kexec/file_load_64.c  |   4 +-
 arch/powerpc/kexec/ima.c           | 202 ------------------------
 drivers/of/kexec.c                 | 240 +++++++++++++++++++++++++++++
 include/linux/of.h                 |   2 +
 security/integrity/ima/ima.h       |   4 -
 security/integrity/ima/ima_kexec.c |   1 +
 11 files changed, 247 insertions(+), 280 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/ima.h
 delete mode 100644 arch/powerpc/kexec/ima.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..4ddd17215ecf 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -548,7 +548,7 @@ config KEXEC
 config KEXEC_FILE
 	bool "kexec file based system call"
 	select KEXEC_CORE
-	select HAVE_IMA_KEXEC
+	select HAVE_IMA_KEXEC if IMA
 	select BUILD_BIN2C
 	select KEXEC_ELF
 	depends on PPC64
diff --git a/arch/powerpc/include/asm/ima.h b/arch/powerpc/include/asm/ima.h
deleted file mode 100644
index 51f64fd06c19..000000000000
--- a/arch/powerpc/include/asm/ima.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_IMA_H
-#define _ASM_POWERPC_IMA_H
-
-struct kimage;
-
-int ima_get_kexec_buffer(void **addr, size_t *size);
-int ima_free_kexec_buffer(void);
-
-#ifdef CONFIG_IMA
-void remove_ima_buffer(void *fdt, int chosen_node);
-#else
-static inline void remove_ima_buffer(void *fdt, int chosen_node) {}
-#endif
-
-#ifdef CONFIG_IMA_KEXEC
-int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node);
-#else
-static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
-				   int chosen_node)
-{
-	remove_ima_buffer(fdt, chosen_node);
-	return 0;
-}
-#endif /* CONFIG_IMA_KEXEC */
-
-#endif /* _ASM_POWERPC_IMA_H */
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index dbf09d2f36d0..11679fc2cadc 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -123,9 +123,6 @@ char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 int setup_purgatory(struct kimage *image, const void *slave_code,
 		    const void *fdt, unsigned long kernel_load_addr,
 		    unsigned long fdt_load_addr);
-int setup_new_fdt(const struct kimage *image, void *fdt,
-		  unsigned long initrd_load_addr, unsigned long initrd_len,
-		  const char *cmdline);
 int delete_fdt_mem_rsv(void *fdt, unsigned long start, unsigned long size);
 
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index 4aff6846c772..b6c52608cb49 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -9,13 +9,6 @@ obj-$(CONFIG_PPC32)		+= relocate_32.o
 
 obj-$(CONFIG_KEXEC_FILE)	+= file_load.o ranges.o file_load_$(BITS).o elf_$(BITS).o
 
-ifdef CONFIG_HAVE_IMA_KEXEC
-ifdef CONFIG_IMA
-obj-y				+= ima.o
-endif
-endif
-
-
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_core_$(BITS).o := n
 KCOV_INSTRUMENT_core_$(BITS).o := n
diff --git a/arch/powerpc/kexec/file_load.c b/arch/powerpc/kexec/file_load.c
index 956bcb2d1ec2..5dd3a9c45a2d 100644
--- a/arch/powerpc/kexec/file_load.c
+++ b/arch/powerpc/kexec/file_load.c
@@ -20,7 +20,6 @@
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <asm/setup.h>
-#include <asm/ima.h>
 
 #define SLAVE_CODE_SIZE		256	/* First 0x100 bytes */
 
@@ -141,37 +140,3 @@ int delete_fdt_mem_rsv(void *fdt, unsigned long start, unsigned long size)
 
 	return -ENOENT;
 }
-
-/*
- * setup_new_fdt - modify /chosen and memory reservation for the next kernel
- * @image:		kexec image being loaded.
- * @fdt:		Flattened device tree for the next kernel.
- * @initrd_load_addr:	Address where the next initrd will be loaded.
- * @initrd_len:		Size of the next initrd, or 0 if there will be none.
- * @cmdline:		Command line for the next kernel, or NULL if there will
- *			be none.
- *
- * Return: 0 on success, or negative errno on error.
- */
-int setup_new_fdt(const struct kimage *image, void *fdt,
-		  unsigned long initrd_load_addr, unsigned long initrd_len,
-		  const char *cmdline)
-{
-	int ret;
-
-	ret = of_kexec_setup_new_fdt(image, fdt, initrd_load_addr, initrd_len, cmdline);
-	if (ret)
-		goto err;
-
-	ret = setup_ima_buffer(image, fdt, fdt_path_offset(fdt, "/chosen"));
-	if (ret) {
-		pr_err("Error setting up the new device tree.\n");
-		return ret;
-	}
-
-	return 0;
-
-err:
-	pr_err("Error setting up the new device tree.\n");
-	return -EINVAL;
-}
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index a05c19b3cc60..3cab318aa3b9 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -17,6 +17,7 @@
 #include <linux/kexec.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/memblock.h>
 #include <linux/slab.h>
@@ -944,7 +945,8 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 	struct crash_mem *umem = NULL, *rmem = NULL;
 	int i, nr_ranges, ret;
 
-	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len, cmdline);
+	ret = of_kexec_setup_new_fdt(image, fdt, initrd_load_addr, initrd_len,
+				     cmdline);
 	if (ret)
 		goto out;
 
diff --git a/arch/powerpc/kexec/ima.c b/arch/powerpc/kexec/ima.c
deleted file mode 100644
index 7378d59c0c1e..000000000000
--- a/arch/powerpc/kexec/ima.c
+++ /dev/null
@@ -1,202 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2016 IBM Corporation
- *
- * Authors:
- * Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
- */
-
-#include <linux/slab.h>
-#include <linux/kexec.h>
-#include <linux/of.h>
-#include <linux/memblock.h>
-#include <linux/libfdt.h>
-
-static int get_addr_size_cells(int *addr_cells, int *size_cells)
-{
-	struct device_node *root;
-
-	root = of_find_node_by_path("/");
-	if (!root)
-		return -EINVAL;
-
-	*addr_cells = of_n_addr_cells(root);
-	*size_cells = of_n_size_cells(root);
-
-	of_node_put(root);
-
-	return 0;
-}
-
-static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
-			       size_t *size)
-{
-	int ret, addr_cells, size_cells;
-
-	ret = get_addr_size_cells(&addr_cells, &size_cells);
-	if (ret)
-		return ret;
-
-	if (len < 4 * (addr_cells + size_cells))
-		return -ENOENT;
-
-	*addr = of_read_number(prop, addr_cells);
-	*size = of_read_number(prop + 4 * addr_cells, size_cells);
-
-	return 0;
-}
-
-/**
- * ima_get_kexec_buffer - get IMA buffer from the previous kernel
- * @addr:	On successful return, set to point to the buffer contents.
- * @size:	On successful return, set to the buffer size.
- *
- * Return: 0 on success, negative errno on error.
- */
-int ima_get_kexec_buffer(void **addr, size_t *size)
-{
-	int ret, len;
-	unsigned long tmp_addr;
-	size_t tmp_size;
-	const void *prop;
-
-	prop = of_get_property(of_chosen, "linux,ima-kexec-buffer", &len);
-	if (!prop)
-		return -ENOENT;
-
-	ret = do_get_kexec_buffer(prop, len, &tmp_addr, &tmp_size);
-	if (ret)
-		return ret;
-
-	*addr = __va(tmp_addr);
-	*size = tmp_size;
-
-	return 0;
-}
-
-/**
- * ima_free_kexec_buffer - free memory used by the IMA buffer
- */
-int ima_free_kexec_buffer(void)
-{
-	int ret;
-	unsigned long addr;
-	size_t size;
-	struct property *prop;
-
-	prop = of_find_property(of_chosen, "linux,ima-kexec-buffer", NULL);
-	if (!prop)
-		return -ENOENT;
-
-	ret = do_get_kexec_buffer(prop->value, prop->length, &addr, &size);
-	if (ret)
-		return ret;
-
-	ret = of_remove_property(of_chosen, prop);
-	if (ret)
-		return ret;
-
-	return memblock_free(addr, size);
-
-}
-
-/**
- * remove_ima_buffer - remove the IMA buffer property and reservation from @fdt
- *
- * The IMA measurement buffer is of no use to a subsequent kernel, so we always
- * remove it from the device tree.
- */
-void remove_ima_buffer(void *fdt, int chosen_node)
-{
-	int ret, len;
-	unsigned long addr;
-	size_t size;
-	const void *prop;
-
-	prop = fdt_getprop(fdt, chosen_node, "linux,ima-kexec-buffer", &len);
-	if (!prop)
-		return;
-
-	ret = do_get_kexec_buffer(prop, len, &addr, &size);
-	fdt_delprop(fdt, chosen_node, "linux,ima-kexec-buffer");
-	if (ret)
-		return;
-
-	ret = delete_fdt_mem_rsv(fdt, addr, size);
-	if (!ret)
-		pr_debug("Removed old IMA buffer reservation.\n");
-}
-
-#ifdef CONFIG_IMA_KEXEC
-static int write_number(void *p, u64 value, int cells)
-{
-	if (cells == 1) {
-		u32 tmp;
-
-		if (value > U32_MAX)
-			return -EINVAL;
-
-		tmp = cpu_to_be32(value);
-		memcpy(p, &tmp, sizeof(tmp));
-	} else if (cells == 2) {
-		u64 tmp;
-
-		tmp = cpu_to_be64(value);
-		memcpy(p, &tmp, sizeof(tmp));
-	} else
-		return -EINVAL;
-
-	return 0;
-}
-
-/**
- * setup_ima_buffer - add IMA buffer information to the fdt
- * @image:		kexec image being loaded.
- * @fdt:		Flattened device tree for the next kernel.
- * @chosen_node:	Offset to the chosen node.
- *
- * Return: 0 on success, or negative errno on error.
- */
-int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node)
-{
-	int ret, addr_cells, size_cells, entry_size;
-	u8 value[16];
-
-	remove_ima_buffer(fdt, chosen_node);
-	if (!image->arch.ima_buffer_size)
-		return 0;
-
-	ret = get_addr_size_cells(&addr_cells, &size_cells);
-	if (ret)
-		return ret;
-
-	entry_size = 4 * (addr_cells + size_cells);
-
-	if (entry_size > sizeof(value))
-		return -EINVAL;
-
-	ret = write_number(value, image->arch.ima_buffer_addr, addr_cells);
-	if (ret)
-		return ret;
-
-	ret = write_number(value + 4 * addr_cells, image->arch.ima_buffer_size,
-			   size_cells);
-	if (ret)
-		return ret;
-
-	ret = fdt_setprop(fdt, chosen_node, "linux,ima-kexec-buffer", value,
-			  entry_size);
-	if (ret < 0)
-		return -EINVAL;
-
-	ret = fdt_add_mem_rsv(fdt, image->arch.ima_buffer_addr,
-			      image->arch.ima_buffer_size);
-	if (ret)
-		return -EINVAL;
-
-	pr_debug("IMA buffer at 0x%llx, size = 0x%zx\n",
-		 image->arch.ima_buffer_addr, image->arch.ima_buffer_size);
-
-	return 0;
-}
-#endif /* CONFIG_IMA_KEXEC */
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 4afd3cc1c04a..450fa6128001 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -11,6 +11,7 @@
 
 #include <linux/kernel.h>
 #include <linux/kexec.h>
+#include <linux/memblock.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -63,6 +64,240 @@ static int fdt_find_and_del_mem_rsv(void *fdt, unsigned long start, unsigned lon
 	return -ENOENT;
 }
 
+/**
+ * get_addr_size_cells - Get address and size of root node
+ *
+ * @addr_cells: Return address of the root node
+ * @size_cells: Return size of the root node
+ *
+ * Return: 0 on success, or negative errno on error.
+ */
+static int get_addr_size_cells(int *addr_cells, int *size_cells)
+{
+	struct device_node *root;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return -EINVAL;
+
+	*addr_cells = of_n_addr_cells(root);
+	*size_cells = of_n_size_cells(root);
+
+	of_node_put(root);
+
+	return 0;
+}
+
+/**
+ * do_get_kexec_buffer - Get address and size of device tree property
+ *
+ * @prop: Device tree property
+ * @len: Size of @prop
+ * @addr: Return address of the node
+ * @size: Return size of the node
+ *
+ * Return: 0 on success, or negative errno on error.
+ */
+static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
+			       size_t *size)
+{
+	int ret, addr_cells, size_cells;
+
+	ret = get_addr_size_cells(&addr_cells, &size_cells);
+	if (ret)
+		return ret;
+
+	if (len < 4 * (addr_cells + size_cells))
+		return -ENOENT;
+
+	*addr = of_read_number(prop, addr_cells);
+	*size = of_read_number(prop + 4 * addr_cells, size_cells);
+
+	return 0;
+}
+
+/**
+ * remove_ima_buffer - remove the IMA buffer property and reservation from @fdt
+ *
+ * @fdt: Flattened Device Tree to update
+ * @chosen_node: Offset to the chosen node in the device tree
+ *
+ * The IMA measurement buffer is of no use to a subsequent kernel, so we always
+ * remove it from the device tree.
+ */
+static void remove_ima_buffer(void *fdt, int chosen_node)
+{
+	int ret, len;
+	unsigned long addr;
+	size_t size;
+	const void *prop;
+
+	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
+		return;
+
+	prop = fdt_getprop(fdt, chosen_node, "linux,ima-kexec-buffer", &len);
+	if (!prop)
+		return;
+
+	ret = do_get_kexec_buffer(prop, len, &addr, &size);
+	fdt_delprop(fdt, chosen_node, "linux,ima-kexec-buffer");
+	if (ret)
+		return;
+
+	ret = fdt_find_and_del_mem_rsv(fdt, addr, size);
+	if (!ret)
+		pr_debug("Removed old IMA buffer reservation.\n");
+}
+
+/**
+ * ima_get_kexec_buffer - get IMA buffer from the previous kernel
+ * @addr:	On successful return, set to point to the buffer contents.
+ * @size:	On successful return, set to the buffer size.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int ima_get_kexec_buffer(void **addr, size_t *size)
+{
+	int ret, len;
+	unsigned long tmp_addr;
+	size_t tmp_size;
+	const void *prop;
+
+	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
+		return -ENOTSUPP;
+
+	prop = of_get_property(of_chosen, "linux,ima-kexec-buffer", &len);
+	if (!prop)
+		return -ENOENT;
+
+	ret = do_get_kexec_buffer(prop, len, &tmp_addr, &tmp_size);
+	if (ret)
+		return ret;
+
+	*addr = __va(tmp_addr);
+	*size = tmp_size;
+
+	return 0;
+}
+
+/**
+ * ima_free_kexec_buffer - free memory used by the IMA buffer
+ */
+int ima_free_kexec_buffer(void)
+{
+	int ret;
+	unsigned long addr;
+	size_t size;
+	struct property *prop;
+
+	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
+		return -ENOTSUPP;
+
+	prop = of_find_property(of_chosen, "linux,ima-kexec-buffer", NULL);
+	if (!prop)
+		return -ENOENT;
+
+	ret = do_get_kexec_buffer(prop->value, prop->length, &addr, &size);
+	if (ret)
+		return ret;
+
+	ret = of_remove_property(of_chosen, prop);
+	if (ret)
+		return ret;
+
+	return memblock_free(addr, size);
+
+}
+
+#ifdef CONFIG_IMA_KEXEC
+/**
+ * write_number - Convert number to big-endian format
+ *
+ * @p:		Buffer to write the number to
+ * @value:	Number to convert
+ * @cells:	Number of cells
+ *
+ * Return: 0 on success, or negative errno on error.
+ */
+static int write_number(void *p, u64 value, int cells)
+{
+	if (cells == 1) {
+		u32 tmp;
+
+		if (value > U32_MAX)
+			return -EINVAL;
+
+		tmp = cpu_to_be32(value);
+		memcpy(p, &tmp, sizeof(tmp));
+	} else if (cells == 2) {
+		u64 tmp;
+
+		tmp = cpu_to_be64(value);
+		memcpy(p, &tmp, sizeof(tmp));
+	} else
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
+ * setup_ima_buffer - add IMA buffer information to the fdt
+ * @image:		kexec image being loaded.
+ * @fdt:		Flattened device tree for the next kernel.
+ * @chosen_node:	Offset to the chosen node.
+ *
+ * Return: 0 on success, or negative errno on error.
+ */
+static int setup_ima_buffer(const struct kimage *image, void *fdt,
+			    int chosen_node)
+{
+	int ret, addr_cells, size_cells, entry_size;
+	u8 value[16];
+
+	if (!image->arch.ima_buffer_size)
+		return 0;
+
+	ret = get_addr_size_cells(&addr_cells, &size_cells);
+	if (ret)
+		return ret;
+
+	entry_size = 4 * (addr_cells + size_cells);
+
+	if (entry_size > sizeof(value))
+		return -EINVAL;
+
+	ret = write_number(value, image->arch.ima_buffer_addr, addr_cells);
+	if (ret)
+		return ret;
+
+	ret = write_number(value + 4 * addr_cells, image->arch.ima_buffer_size,
+			   size_cells);
+	if (ret)
+		return ret;
+
+	ret = fdt_setprop(fdt, chosen_node, "linux,ima-kexec-buffer", value,
+			  entry_size);
+	if (ret < 0)
+		return -EINVAL;
+
+	ret = fdt_add_mem_rsv(fdt, image->arch.ima_buffer_addr,
+			      image->arch.ima_buffer_size);
+	if (ret)
+		return -EINVAL;
+
+	pr_debug("IMA buffer at 0x%llx, size = 0x%zx\n",
+		 image->arch.ima_buffer_addr, image->arch.ima_buffer_size);
+
+	return 0;
+}
+#else /* CONFIG_IMA_KEXEC */
+static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
+				   int chosen_node)
+{
+	return 0;
+}
+#endif /* CONFIG_IMA_KEXEC */
+
 /*
  * of_kexec_setup_new_fdt - modify /chosen and memory reservation for the next kernel
  *
@@ -227,6 +462,11 @@ int of_kexec_setup_new_fdt(const struct kimage *image, void *fdt,
 	}
 
 	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
+	if (ret)
+		goto out;
+
+	remove_ima_buffer(fdt, chosen_node);
+	ret = setup_ima_buffer(image, fdt, fdt_path_offset(fdt, "/chosen"));
 
 out:
 	if (ret)
diff --git a/include/linux/of.h b/include/linux/of.h
index 3375f5295875..48eb2d05c0ec 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -562,6 +562,8 @@ struct kimage;
 int of_kexec_setup_new_fdt(const struct kimage *image, void *fdt,
 			   unsigned long initrd_load_addr, unsigned long initrd_len,
 			   const char *cmdline);
+int ima_get_kexec_buffer(void **addr, size_t *size);
+int ima_free_kexec_buffer(void);
 
 #else /* CONFIG_OF */
 
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index 8e8b1e3cb847..cc0906cd3cd6 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -24,10 +24,6 @@
 
 #include "../integrity.h"
 
-#ifdef CONFIG_HAVE_IMA_KEXEC
-#include <asm/ima.h>
-#endif
-
 enum ima_show_type { IMA_SHOW_BINARY, IMA_SHOW_BINARY_NO_FIELD_LEN,
 		     IMA_SHOW_BINARY_OLD_STRING_FMT, IMA_SHOW_ASCII };
 enum tpm_pcrs { TPM_PCR0 = 0, TPM_PCR8 = 8, TPM_PCR10 = 10 };
diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
index 95513c97ce8f..c62bbb586d2e 100644
--- a/security/integrity/ima/ima_kexec.c
+++ b/security/integrity/ima/ima_kexec.c
@@ -10,6 +10,7 @@
 #include <linux/seq_file.h>
 #include <linux/vmalloc.h>
 #include <linux/kexec.h>
+#include <linux/of.h>
 #include "ima.h"
 
 #ifdef CONFIG_IMA_KEXEC
-- 
2.30.0

