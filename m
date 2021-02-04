Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AF730F906
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 18:06:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWlLm669dzDxTf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 04:06:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=GifiFuav; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DWkq40PMkzDrWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 03:42:08 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7F26C20B6C4B;
 Thu,  4 Feb 2021 08:42:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7F26C20B6C4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612456927;
 bh=R8BSoAz4O99+MwKOCBSEJqidoIYHvab9F/MGd3nVG6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GifiFuavJDtdzH4ztHcwcHTo9y3RmXFT4omP/KDlkZnG6o++lLc78WYH45RBhaE10
 JU5p7xbiZzm6eaG/rF8NLntPv7/WbXbp1FsXLXvXUEP+KraYHPh2IgFK2ZlB9r9OTI
 loCWRWSvnpjj+eQqdPy5+ks+KLXlgT8Eb+q/2fdA=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au
Subject: [PATCH v16 11/12] powerpc: Use OF alloc and free for FDT
Date: Thu,  4 Feb 2021 08:41:34 -0800
Message-Id: <20210204164135.29856-12-nramas@linux.microsoft.com>
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

of_alloc_and_init_fdt() and of_free_fdt() have been defined in
drivers/of/kexec.c to allocate and free memory for FDT.

Use of_alloc_and_init_fdt() and of_free_fdt() to allocate and
initialize the FDT, and to free the FDT respectively.

powerpc sets the FDT address in image_loader_data field in
"struct kimage" and the memory is freed in
kimage_file_post_load_cleanup().  This cleanup function uses kfree()
to free the memory. But since of_alloc_and_init_fdt() uses kvmalloc()
for allocation, the buffer needs to be freed using kvfree().

Define "fdt" field in "struct kimage_arch" for powerpc to store
the address of FDT, and free the memory in powerpc specific
arch_kimage_file_post_load_cleanup().

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Rob Herring <robh@kernel.org>
Suggested-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h  |  2 ++
 arch/powerpc/kexec/elf_64.c       | 26 ++++++++++++++++----------
 arch/powerpc/kexec/file_load_64.c |  3 +++
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 2c0be93d239a..d7d13cac4d31 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -111,6 +111,8 @@ struct kimage_arch {
 	unsigned long elf_headers_mem;
 	unsigned long elf_headers_sz;
 	void *elf_headers;
+
+	void *fdt;
 };
 
 char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index d0e459bb2f05..51d2d8eb6c1b 100644
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
@@ -32,7 +33,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	unsigned int fdt_size;
 	unsigned long kernel_load_addr;
 	unsigned long initrd_load_addr = 0, fdt_load_addr;
-	void *fdt;
+	void *fdt = NULL;
 	const void *slave_code;
 	struct elfhdr ehdr;
 	char *modified_cmdline = NULL;
@@ -103,18 +104,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	}
 
 	fdt_size = fdt_totalsize(initial_boot_params) * 2;
-	fdt = kmalloc(fdt_size, GFP_KERNEL);
+	fdt = of_alloc_and_init_fdt(fdt_size);
 	if (!fdt) {
 		pr_err("Not enough memory for the device tree.\n");
 		ret = -ENOMEM;
 		goto out;
 	}
-	ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
-	if (ret < 0) {
-		pr_err("Error setting up the new device tree.\n");
-		ret = -EINVAL;
-		goto out;
-	}
 
 	ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
 				  initrd_len, cmdline);
@@ -131,6 +126,10 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
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
+		of_free_fdt(fdt);
+
+	return ret ? ERR_PTR(ret) : NULL;
 }
 
 const struct kexec_file_ops kexec_elf64_ops = {
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 3cab318aa3b9..d9d5b5569a6d 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -1113,5 +1113,8 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	image->arch.elf_headers = NULL;
 	image->arch.elf_headers_sz = 0;
 
+	of_free_fdt(image->arch.fdt);
+	image->arch.fdt = NULL;
+
 	return kexec_image_post_load_cleanup_default(image);
 }
-- 
2.30.0

