Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0568130F845
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 17:44:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWksF1M0JzDwtH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 03:44:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=ZHR7Fz+H; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DWkpx5QTJzDrhY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 03:42:01 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 15F3920B6C42;
 Thu,  4 Feb 2021 08:42:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 15F3920B6C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612456920;
 bh=QqJjoAw6r5UdJOMDZZK/2/XH05Zha+acJ0i6Z4rZgHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZHR7Fz+H6Ng3KFhuRGLrkKJ8G26Elkxl0S51PdTtotTn0sTeEb7N3/Dy5d7uwCFGd
 dknC9FIYVineJXD6TG1bRVkOFi+hACsehxkw3kRmLhbJrOHFG6vqtt/fIzlGwpoYse
 QjoDHHw4TXijJ8Rzb+f15jJ1Hsi7VhuBS+h9Upuo=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au
Subject: [PATCH v16 02/12] of: Add a common kexec FDT setup function
Date: Thu,  4 Feb 2021 08:41:25 -0800
Message-Id: <20210204164135.29856-3-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204164135.29856-1-nramas@linux.microsoft.com>
References: <20210204164135.29856-1-nramas@linux.microsoft.com>
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

From: Rob Herring <robh@kernel.org>

Both arm64 and powerpc do essentially the same FDT /chosen setup for
kexec.  The differences are either omissions that arm64 should have
or additional properties that will be ignored.  The setup code can be
combined and shared by both powerpc and arm64.

The differences relative to the arm64 version:
 - If /chosen doesn't exist, it will be created (should never happen).
 - Any old dtb and initrd reserved memory will be released.
 - The new initrd and elfcorehdr are marked reserved.
 - "linux,booted-from-kexec" is set.

The differences relative to the powerpc version:
 - "kaslr-seed" and "rng-seed" may be set.
 - "linux,elfcorehdr" is set.
 - Any existing "linux,usable-memory-range" is removed.

Combine the code for setting up the /chosen node in the FDT and updating
the memory reservation for kexec, for powerpc and arm64, in
of_kexec_setup_new_fdt() and move it to "drivers/of/kexec.c".

Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 drivers/of/Makefile |   1 +
 drivers/of/kexec.c  | 236 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h  |   4 +
 3 files changed, 241 insertions(+)
 create mode 100644 drivers/of/kexec.c

diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index 6e1e5212f058..8ce11955afde 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -13,5 +13,6 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
 obj-$(CONFIG_OF_RESOLVE)  += resolver.o
 obj-$(CONFIG_OF_OVERLAY) += overlay.o
 obj-$(CONFIG_OF_NUMA) += of_numa.o
+obj-$(CONFIG_KEXEC_FILE) += kexec.o
 
 obj-$(CONFIG_OF_UNITTEST) += unittest-data/
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
new file mode 100644
index 000000000000..4afd3cc1c04a
--- /dev/null
+++ b/drivers/of/kexec.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 Arm Limited
+ *
+ * Based on arch/arm64/kernel/machine_kexec_file.c:
+ *  Copyright (C) 2018 Linaro Limited
+ *
+ * And arch/powerpc/kexec/file_load.c:
+ *  Copyright (C) 2016  IBM Corporation
+ */
+
+#include <linux/kernel.h>
+#include <linux/kexec.h>
+#include <linux/libfdt.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/random.h>
+#include <linux/types.h>
+
+/* relevant device tree properties */
+#define FDT_PROP_KEXEC_ELFHDR	"linux,elfcorehdr"
+#define FDT_PROP_MEM_RANGE	"linux,usable-memory-range"
+#define FDT_PROP_INITRD_START	"linux,initrd-start"
+#define FDT_PROP_INITRD_END	"linux,initrd-end"
+#define FDT_PROP_BOOTARGS	"bootargs"
+#define FDT_PROP_KASLR_SEED	"kaslr-seed"
+#define FDT_PROP_RNG_SEED	"rng-seed"
+#define RNG_SEED_SIZE		128
+
+/**
+ * fdt_find_and_del_mem_rsv - delete memory reservation with given address and size
+ *
+ * @fdt:	Flattened device tree for the current kernel.
+ * @start:	Starting address of the reserved memory.
+ * @size:	Size of the reserved memory.
+ *
+ * Return: 0 on success, or negative errno on error.
+ */
+static int fdt_find_and_del_mem_rsv(void *fdt, unsigned long start, unsigned long size)
+{
+	int i, ret, num_rsvs = fdt_num_mem_rsv(fdt);
+
+	for (i = 0; i < num_rsvs; i++) {
+		u64 rsv_start, rsv_size;
+
+		ret = fdt_get_mem_rsv(fdt, i, &rsv_start, &rsv_size);
+		if (ret) {
+			pr_err("Malformed device tree.\n");
+			return -EINVAL;
+		}
+
+		if (rsv_start == start && rsv_size == size) {
+			ret = fdt_del_mem_rsv(fdt, i);
+			if (ret) {
+				pr_err("Error deleting device tree reservation.\n");
+				return -EINVAL;
+			}
+
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
+/*
+ * of_kexec_setup_new_fdt - modify /chosen and memory reservation for the next kernel
+ *
+ * @image:		kexec image being loaded.
+ * @fdt:		Flattened device tree for the next kernel.
+ * @initrd_load_addr:	Address where the next initrd will be loaded.
+ * @initrd_len:		Size of the next initrd, or 0 if there will be none.
+ * @cmdline:		Command line for the next kernel, or NULL if there will
+ *			be none.
+ *
+ * Return: 0 on success, or negative errno on error.
+ */
+int of_kexec_setup_new_fdt(const struct kimage *image, void *fdt,
+			   unsigned long initrd_load_addr, unsigned long initrd_len,
+			   const char *cmdline)
+{
+	int ret, chosen_node;
+	const void *prop;
+
+	/* Remove memory reservation for the current device tree. */
+	ret = fdt_find_and_del_mem_rsv(fdt, __pa(initial_boot_params),
+				       fdt_totalsize(initial_boot_params));
+	if (ret == -EINVAL)
+		return ret;
+
+	chosen_node = fdt_path_offset(fdt, "/chosen");
+	if (chosen_node == -FDT_ERR_NOTFOUND)
+		chosen_node = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"),
+					      "chosen");
+	if (chosen_node < 0) {
+		ret = chosen_node;
+		goto out;
+	}
+
+	ret = fdt_delprop(fdt, chosen_node, FDT_PROP_KEXEC_ELFHDR);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		goto out;
+	ret = fdt_delprop(fdt, chosen_node, FDT_PROP_MEM_RANGE);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		goto out;
+
+	/* Did we boot using an initrd? */
+	prop = fdt_getprop(fdt, chosen_node, "linux,initrd-start", NULL);
+	if (prop) {
+		u64 tmp_start, tmp_end, tmp_size;
+
+		tmp_start = fdt64_to_cpu(*((const fdt64_t *) prop));
+
+		prop = fdt_getprop(fdt, chosen_node, "linux,initrd-end", NULL);
+		if (!prop)
+			return -EINVAL;
+
+		tmp_end = fdt64_to_cpu(*((const fdt64_t *) prop));
+
+		/*
+		 * kexec reserves exact initrd size, while firmware may
+		 * reserve a multiple of PAGE_SIZE, so check for both.
+		 */
+		tmp_size = tmp_end - tmp_start;
+		ret = fdt_find_and_del_mem_rsv(fdt, tmp_start, tmp_size);
+		if (ret == -ENOENT)
+			ret = fdt_find_and_del_mem_rsv(fdt, tmp_start,
+						       round_up(tmp_size, PAGE_SIZE));
+		if (ret == -EINVAL)
+			return ret;
+	}
+
+	/* add initrd-* */
+	if (initrd_load_addr) {
+		ret = fdt_setprop_u64(fdt, chosen_node, FDT_PROP_INITRD_START,
+				      initrd_load_addr);
+		if (ret)
+			goto out;
+
+		ret = fdt_setprop_u64(fdt, chosen_node, FDT_PROP_INITRD_END,
+				      initrd_load_addr + initrd_len);
+		if (ret)
+			goto out;
+
+		ret = fdt_add_mem_rsv(fdt, initrd_load_addr, initrd_len);
+		if (ret)
+			goto out;
+
+	} else {
+		ret = fdt_delprop(fdt, chosen_node, FDT_PROP_INITRD_START);
+		if (ret && (ret != -FDT_ERR_NOTFOUND))
+			goto out;
+
+		ret = fdt_delprop(fdt, chosen_node, FDT_PROP_INITRD_END);
+		if (ret && (ret != -FDT_ERR_NOTFOUND))
+			goto out;
+	}
+
+	if (image->type == KEXEC_TYPE_CRASH) {
+		/* add linux,elfcorehdr */
+		ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
+				FDT_PROP_KEXEC_ELFHDR,
+				image->arch.elf_headers_mem,
+				image->arch.elf_headers_sz);
+		if (ret)
+			goto out;
+
+		/*
+		 * Avoid elfcorehdr from being stomped on in kdump kernel by
+		 * setting up memory reserve map.
+		 */
+		ret = fdt_add_mem_rsv(fdt, image->arch.elf_headers_mem,
+				      image->arch.elf_headers_sz);
+		if (ret)
+			goto out;
+
+		/* add linux,usable-memory-range */
+		ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
+				FDT_PROP_MEM_RANGE,
+				crashk_res.start,
+				crashk_res.end - crashk_res.start + 1);
+		if (ret)
+			goto out;
+	}
+
+	/* add bootargs */
+	if (cmdline) {
+		ret = fdt_setprop_string(fdt, chosen_node, FDT_PROP_BOOTARGS, cmdline);
+		if (ret)
+			goto out;
+	} else {
+		ret = fdt_delprop(fdt, chosen_node, FDT_PROP_BOOTARGS);
+		if (ret && (ret != -FDT_ERR_NOTFOUND))
+			goto out;
+	}
+
+	/* add kaslr-seed */
+	ret = fdt_delprop(fdt, chosen_node, FDT_PROP_KASLR_SEED);
+	if (ret == -FDT_ERR_NOTFOUND)
+		ret = 0;
+	else if (ret)
+		goto out;
+
+	if (rng_is_initialized()) {
+		u64 seed = get_random_u64();
+
+		ret = fdt_setprop_u64(fdt, chosen_node, FDT_PROP_KASLR_SEED, seed);
+		if (ret)
+			goto out;
+	} else {
+		pr_notice("RNG is not initialised: omitting \"%s\" property\n",
+				FDT_PROP_KASLR_SEED);
+	}
+
+	/* add rng-seed */
+	if (rng_is_initialized()) {
+		void *rng_seed;
+
+		ret = fdt_setprop_placeholder(fdt, chosen_node, FDT_PROP_RNG_SEED,
+				RNG_SEED_SIZE, &rng_seed);
+		if (ret)
+			goto out;
+		get_random_bytes(rng_seed, RNG_SEED_SIZE);
+	} else {
+		pr_notice("RNG is not initialised: omitting \"%s\" property\n",
+				FDT_PROP_RNG_SEED);
+	}
+
+	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
+
+out:
+	if (ret)
+		return (ret == -FDT_ERR_NOSPACE) ? -ENOMEM : -EINVAL;
+
+	return 0;
+}
diff --git a/include/linux/of.h b/include/linux/of.h
index 4b27c9a27df3..41e256adf758 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -559,6 +559,10 @@ int of_map_id(struct device_node *np, u32 id,
 	       struct device_node **target, u32 *id_out);
 
 phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
+struct kimage;
+int of_kexec_setup_new_fdt(const struct kimage *image, void *fdt,
+			   unsigned long initrd_load_addr, unsigned long initrd_len,
+			   const char *cmdline);
 
 #else /* CONFIG_OF */
 
-- 
2.30.0

