Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73F2F84AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:46:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHVXB02JdzDvWK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:46:50 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=default header.b=ktUyR6Wf; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DHSr85qy4zDqC8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 04:30:29 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5E52B20B6C43;
 Fri, 15 Jan 2021 09:30:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5E52B20B6C43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1610731826;
 bh=Sd8T0e6P8u+loATpNeokWfqgEz2Z/zfdEmJ6vGkoVO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ktUyR6WfaUt3tm6L1bWQ7aEaN75ohK6Vy3cFhF9qh2P/nDpZ1cqHHI6Chl5xnxb+0
 J6n53fRktOiFEmPUfaMCBCKHBprjN5TyV3uEod1uTgFWZ4QPY2VcSqtzGs49ikj/Z8
 XFxb1OIMj9HZMEp8zMm2Tvr8kr5Pwysb7cGvuq18=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 catalin.marinas@arm.com, mpe@ellerman.id.au
Subject: [PATCH v15 04/10] powerpc: Use common of_kexec_setup_new_fdt()
Date: Fri, 15 Jan 2021 09:30:11 -0800
Message-Id: <20210115173017.30617-5-nramas@linux.microsoft.com>
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

From: Rob Herring <robh@kernel.org>

The code for setting up the /chosen node in the device tree
and updating the memory reservation for the next kernel has been
moved to of_kexec_setup_new_fdt() defined in "drivers/of/kexec.c".

Use the common of_kexec_setup_new_fdt() to setup the device tree
and update the memory reservation for kexec for powerpc.

Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 arch/powerpc/kexec/file_load.c | 125 ++-------------------------------
 1 file changed, 6 insertions(+), 119 deletions(-)

diff --git a/arch/powerpc/kexec/file_load.c b/arch/powerpc/kexec/file_load.c
index e452b11df631..956bcb2d1ec2 100644
--- a/arch/powerpc/kexec/file_load.c
+++ b/arch/powerpc/kexec/file_load.c
@@ -16,6 +16,7 @@
 
 #include <linux/slab.h>
 #include <linux/kexec.h>
+#include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <asm/setup.h>
@@ -156,132 +157,18 @@ int setup_new_fdt(const struct kimage *image, void *fdt,
 		  unsigned long initrd_load_addr, unsigned long initrd_len,
 		  const char *cmdline)
 {
-	int ret, chosen_node;
-	const void *prop;
-
-	/* Remove memory reservation for the current device tree. */
-	ret = delete_fdt_mem_rsv(fdt, __pa(initial_boot_params),
-				 fdt_totalsize(initial_boot_params));
-	if (ret == 0)
-		pr_debug("Removed old device tree reservation.\n");
-	else if (ret != -ENOENT)
-		return ret;
-
-	chosen_node = fdt_path_offset(fdt, "/chosen");
-	if (chosen_node == -FDT_ERR_NOTFOUND) {
-		chosen_node = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"),
-					      "chosen");
-		if (chosen_node < 0) {
-			pr_err("Error creating /chosen.\n");
-			return -EINVAL;
-		}
-	} else if (chosen_node < 0) {
-		pr_err("Malformed device tree: error reading /chosen.\n");
-		return -EINVAL;
-	}
-
-	/* Did we boot using an initrd? */
-	prop = fdt_getprop(fdt, chosen_node, "linux,initrd-start", NULL);
-	if (prop) {
-		uint64_t tmp_start, tmp_end, tmp_size;
-
-		tmp_start = fdt64_to_cpu(*((const fdt64_t *) prop));
-
-		prop = fdt_getprop(fdt, chosen_node, "linux,initrd-end", NULL);
-		if (!prop) {
-			pr_err("Malformed device tree.\n");
-			return -EINVAL;
-		}
-		tmp_end = fdt64_to_cpu(*((const fdt64_t *) prop));
-
-		/*
-		 * kexec reserves exact initrd size, while firmware may
-		 * reserve a multiple of PAGE_SIZE, so check for both.
-		 */
-		tmp_size = tmp_end - tmp_start;
-		ret = delete_fdt_mem_rsv(fdt, tmp_start, tmp_size);
-		if (ret == -ENOENT)
-			ret = delete_fdt_mem_rsv(fdt, tmp_start,
-						 round_up(tmp_size, PAGE_SIZE));
-		if (ret == 0)
-			pr_debug("Removed old initrd reservation.\n");
-		else if (ret != -ENOENT)
-			return ret;
-
-		/* If there's no new initrd, delete the old initrd's info. */
-		if (initrd_len == 0) {
-			ret = fdt_delprop(fdt, chosen_node,
-					  "linux,initrd-start");
-			if (ret) {
-				pr_err("Error deleting linux,initrd-start.\n");
-				return -EINVAL;
-			}
-
-			ret = fdt_delprop(fdt, chosen_node, "linux,initrd-end");
-			if (ret) {
-				pr_err("Error deleting linux,initrd-end.\n");
-				return -EINVAL;
-			}
-		}
-	}
-
-	if (initrd_len) {
-		ret = fdt_setprop_u64(fdt, chosen_node,
-				      "linux,initrd-start",
-				      initrd_load_addr);
-		if (ret < 0)
-			goto err;
-
-		/* initrd-end is the first address after the initrd image. */
-		ret = fdt_setprop_u64(fdt, chosen_node, "linux,initrd-end",
-				      initrd_load_addr + initrd_len);
-		if (ret < 0)
-			goto err;
-
-		ret = fdt_add_mem_rsv(fdt, initrd_load_addr, initrd_len);
-		if (ret) {
-			pr_err("Error reserving initrd memory: %s\n",
-			       fdt_strerror(ret));
-			return -EINVAL;
-		}
-	}
-
-	if (cmdline != NULL) {
-		ret = fdt_setprop_string(fdt, chosen_node, "bootargs", cmdline);
-		if (ret < 0)
-			goto err;
-	} else {
-		ret = fdt_delprop(fdt, chosen_node, "bootargs");
-		if (ret && ret != -FDT_ERR_NOTFOUND) {
-			pr_err("Error deleting bootargs.\n");
-			return -EINVAL;
-		}
-	}
+	int ret;
 
-	if (image->type == KEXEC_TYPE_CRASH) {
-		/*
-		 * Avoid elfcorehdr from being stomped on in kdump kernel by
-		 * setting up memory reserve map.
-		 */
-		ret = fdt_add_mem_rsv(fdt, image->arch.elf_headers_mem,
-				      image->arch.elf_headers_sz);
-		if (ret) {
-			pr_err("Error reserving elfcorehdr memory: %s\n",
-			       fdt_strerror(ret));
-			goto err;
-		}
-	}
+	ret = of_kexec_setup_new_fdt(image, fdt, initrd_load_addr, initrd_len, cmdline);
+	if (ret)
+		goto err;
 
-	ret = setup_ima_buffer(image, fdt, chosen_node);
+	ret = setup_ima_buffer(image, fdt, fdt_path_offset(fdt, "/chosen"));
 	if (ret) {
 		pr_err("Error setting up the new device tree.\n");
 		return ret;
 	}
 
-	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
-	if (ret)
-		goto err;
-
 	return 0;
 
 err:
-- 
2.30.0

