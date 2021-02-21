Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3F320C55
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 18:52:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkCZW62rzz3dDh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 04:52:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=p8xO9POx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=p8xO9POx; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DkCWB2JTwz30QC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 04:49:42 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 95E5F20B57A4;
 Sun, 21 Feb 2021 09:49:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 95E5F20B57A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613929781;
 bh=EAzOQp1EoLlFuUGOgX3bOC4Djb/UhDIvojIhY4WDPVM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p8xO9POxuoK2PKT4vOeRhyKOoVY8ddZaagtyvXoC6HQ6GiZybNrctcdHMsB5rqpJ7
 kEu8wMF2q9Ff+nKl3/31bDz/Cm9uDl/b0elsfv9iniDiIUhWnt2foPd23+vEY6OyIx
 n3zFz3yoBQYmxdfli1IA3ON+qMuZi+aX5TZoHLaA=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au,
 sfr@canb.auug.org.au
Subject: [PATCH v19 07/13] powerpc: Use common of_kexec_alloc_and_setup_fdt()
Date: Sun, 21 Feb 2021 09:49:24 -0800
Message-Id: <20210221174930.27324-8-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210221174930.27324-1-nramas@linux.microsoft.com>
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, paulus@samba.org,
 vincenzo.frascino@arm.com, frowand.list@gmail.com, sashal@kernel.org,
 masahiroy@kernel.org, jmorris@namei.org, allison@lohutok.net, serge@hallyn.com,
 devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 prsriva@linux.microsoft.com, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Rob Herring <robh@kernel.org>

The code for setting up the /chosen node in the device tree
and updating the memory reservation for the next kernel has been
moved to of_kexec_alloc_and_setup_fdt() defined in "drivers/of/kexec.c".

Use the common of_kexec_alloc_and_setup_fdt() to setup the device tree
and update the memory reservation for kexec for powerpc.

Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h  |   1 +
 arch/powerpc/kexec/elf_64.c       |  30 ++++---
 arch/powerpc/kexec/file_load.c    | 132 +-----------------------------
 arch/powerpc/kexec/file_load_64.c |   3 +
 4 files changed, 26 insertions(+), 140 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 69c2a8aa142a..c483c2cf284e 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -107,6 +107,7 @@ struct kimage_arch {
 
 	unsigned long backup_start;
 	void *backup_buf;
+	void *fdt;
 
 #ifdef CONFIG_IMA_KEXEC
 	phys_addr_t ima_buffer_addr;
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index d0e459bb2f05..87e34611f93d 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -19,6 +19,7 @@
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -29,7 +30,6 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 			unsigned long cmdline_len)
 {
 	int ret;
-	unsigned int fdt_size;
 	unsigned long kernel_load_addr;
 	unsigned long initrd_load_addr = 0, fdt_load_addr;
 	void *fdt;
@@ -102,15 +102,10 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		pr_debug("Loaded initrd at 0x%lx\n", initrd_load_addr);
 	}
 
-	fdt_size = fdt_totalsize(initial_boot_params) * 2;
-	fdt = kmalloc(fdt_size, GFP_KERNEL);
+	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
+					   initrd_len, cmdline,
+					   fdt_totalsize(initial_boot_params));
 	if (!fdt) {
-		pr_err("Not enough memory for the device tree.\n");
-		ret = -ENOMEM;
-		goto out;
-	}
-	ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
-	if (ret < 0) {
 		pr_err("Error setting up the new device tree.\n");
 		ret = -EINVAL;
 		goto out;
@@ -124,13 +119,17 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	fdt_pack(fdt);
 
 	kbuf.buffer = fdt;
-	kbuf.bufsz = kbuf.memsz = fdt_size;
+	kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
 	kbuf.buf_align = PAGE_SIZE;
 	kbuf.top_down = true;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
 		goto out;
+
+	/* FDT will be freed in arch_kimage_file_post_load_cleanup */
+	image->arch.fdt = fdt;
+
 	fdt_load_addr = kbuf.mem;
 
 	pr_debug("Loaded device tree at 0x%lx\n", fdt_load_addr);
@@ -145,8 +144,15 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	kfree(modified_cmdline);
 	kexec_free_elf_info(&elf_info);
 
-	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
-	return ret ? ERR_PTR(ret) : fdt;
+	/*
+	 * Once FDT buffer has been successfully passed to kexec_add_buffer(),
+	 * the FDT buffer address is saved in image->arch.fdt. In that case,
+	 * the memory cannot be freed here in case of any other error.
+	 */
+	if (ret && !image->arch.fdt)
+		kvfree(fdt);
+
+	return ret ? ERR_PTR(ret) : NULL;
 }
 
 const struct kexec_file_ops kexec_elf64_ops = {
diff --git a/arch/powerpc/kexec/file_load.c b/arch/powerpc/kexec/file_load.c
index 19d2c5f49daf..c6bbd06d13e2 100644
--- a/arch/powerpc/kexec/file_load.c
+++ b/arch/powerpc/kexec/file_load.c
@@ -156,135 +156,11 @@ int setup_new_fdt(const struct kimage *image, void *fdt,
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
-
-	if (image->type == KEXEC_TYPE_CRASH) {
-		/*
-		 * Avoid elfcorehdr from being stomped on in kdump kernel by
-		 * setting up memory reserve map.
-		 */
-		ret = fdt_add_mem_rsv(fdt, image->elf_load_addr,
-				      image->elf_headers_sz);
-		if (ret) {
-			pr_err("Error reserving elfcorehdr memory: %s\n",
-			       fdt_strerror(ret));
-			goto err;
-		}
-	}
-
-	ret = setup_ima_buffer(image, fdt, chosen_node);
-	if (ret) {
-		pr_err("Error setting up the new device tree.\n");
-		return ret;
-	}
+	int ret;
 
-	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
+	ret = setup_ima_buffer(image, fdt, fdt_path_offset(fdt, "/chosen"));
 	if (ret)
-		goto err;
-
-	return 0;
+		pr_err("Error setting up the new device tree.\n");
 
-err:
-	pr_err("Error setting up the new device tree.\n");
-	return -EINVAL;
+	return ret;
 }
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 4350f225bb67..733226fd7bcf 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -1111,5 +1111,8 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	image->elf_headers = NULL;
 	image->elf_headers_sz = 0;
 
+	kvfree(image->arch.fdt);
+	image->arch.fdt = NULL;
+
 	return kexec_image_post_load_cleanup_default(image);
 }
-- 
2.30.0

