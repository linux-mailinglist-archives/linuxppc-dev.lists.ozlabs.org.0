Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FDB1C4944
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 23:53:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GGnM34RFzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 07:53:11 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=default header.b=PwEu7JQq; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 49GF7S2NqrzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 06:38:41 +1000 (AEST)
Received: from prsriva-linux.hsd1.wa.comcast.net
 (c-24-19-135-168.hsd1.wa.comcast.net [24.19.135.168])
 by linux.microsoft.com (Postfix) with ESMTPSA id 48ADA20B71CC;
 Mon,  4 May 2020 13:38:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 48ADA20B71CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1588624720;
 bh=9BrQRipJ8L0+PR7w+BHorvxfJzUA9j4XBGTJLVfj2wo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PwEu7JQqBDNtq0Ye6OGM+lwHUvBLraMCPYd6S0gRzmT+DyyNhHY+NbfP5f4uH4gtm
 gX62CyYfzrXnAQeSD+SIqrWcSWeWjxA/cxR8sFn1vT7e5h8gn8tXWrycaXfTF7VyXI
 q0Yci1unj92sYaUT+UKvMO/gBetA75txVtFxqyNM=
From: Prakhar Srivastava <prsriva@linux.microsoft.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [RFC][PATCH 2/2] Add support for ima buffer pass using reserved
 memory arm64
Date: Mon,  4 May 2020 13:38:29 -0700
Message-Id: <20200504203829.6330-3-prsriva@linux.microsoft.com>
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

 Add support for ima buffer pass using reserved memory for
 arm64 kexec. Update the arch sepcific code path in kexec file load to store
 the ima buffer in the reserved memory. The same reserved memory is read on
 kexec or cold boot.

Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
---
 arch/arm64/Kconfig                     |  1 +
 arch/arm64/include/asm/ima.h           | 22 +++++++++
 arch/arm64/include/asm/kexec.h         |  5 ++
 arch/arm64/kernel/Makefile             |  1 +
 arch/arm64/kernel/ima_kexec.c          | 64 ++++++++++++++++++++++++++
 arch/arm64/kernel/machine_kexec_file.c |  1 +
 arch/powerpc/include/asm/ima.h         |  3 +-
 arch/powerpc/kexec/ima.c               | 14 +++++-
 security/integrity/ima/ima_kexec.c     | 15 ++++--
 9 files changed, 119 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/include/asm/ima.h
 create mode 100644 arch/arm64/kernel/ima_kexec.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 40fb05d96c60..bc9e1a91686b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1069,6 +1069,7 @@ config KEXEC
 config KEXEC_FILE
 	bool "kexec file based system call"
 	select KEXEC_CORE
+	select HAVE_IMA_KEXEC
 	help
 	  This is new version of kexec system call. This system call is
 	  file based and takes file descriptors as system call argument
diff --git a/arch/arm64/include/asm/ima.h b/arch/arm64/include/asm/ima.h
new file mode 100644
index 000000000000..58033b427e59
--- /dev/null
+++ b/arch/arm64/include/asm/ima.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_IMA_H
+#define _ASM_ARM64_IMA_H
+
+struct kimage;
+
+int is_ima_memory_reserved(void);
+int ima_get_kexec_buffer(void **addr, size_t *size);
+int ima_free_kexec_buffer(void);
+
+#ifdef CONFIG_IMA_KEXEC
+int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
+			      void *buffer, size_t size);
+
+#else
+int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
+			      void *buffer, size_t size)
+{
+	return 0;
+}
+#endif /* CONFIG_IMA_KEXEC */
+#endif /* _ASM_ARM64_IMA_H */
diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
index d24b527e8c00..2bd19ccb6c43 100644
--- a/arch/arm64/include/asm/kexec.h
+++ b/arch/arm64/include/asm/kexec.h
@@ -100,6 +100,11 @@ struct kimage_arch {
 	void *elf_headers;
 	unsigned long elf_headers_mem;
 	unsigned long elf_headers_sz;
+
+#ifdef CONFIG_IMA_KEXEC
+	phys_addr_t ima_buffer_addr;
+	size_t ima_buffer_size;
+#endif
 };
 
 extern const struct kexec_file_ops kexec_image_ops;
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 4e5b8ee31442..cd3cb7690d51 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_RANDOMIZE_BASE)		+= kaslr.o
 obj-$(CONFIG_HIBERNATION)		+= hibernate.o hibernate-asm.o
 obj-$(CONFIG_KEXEC_CORE)		+= machine_kexec.o relocate_kernel.o	\
 					   cpu-reset.o
+obj-$(CONFIG_HAVE_IMA_KEXEC)		+= ima_kexec.o
 obj-$(CONFIG_KEXEC_FILE)		+= machine_kexec_file.o kexec_image.o
 obj-$(CONFIG_ARM64_RELOC_TEST)		+= arm64-reloc-test.o
 arm64-reloc-test-y := reloc_test_core.o reloc_test_syms.o
diff --git a/arch/arm64/kernel/ima_kexec.c b/arch/arm64/kernel/ima_kexec.c
new file mode 100644
index 000000000000..ff5649333c7c
--- /dev/null
+++ b/arch/arm64/kernel/ima_kexec.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Microsoft Corporation.
+ *
+ * Authors:
+ * Prakhar Srivastava <prsriva@linux.microsoft.com>
+ */
+
+#include <linux/kexec.h>
+#include <linux/of.h>
+
+
+/**
+ * is_ima_memory_reserved - check if memory is reserved via device
+ *			    tree.
+ *	Return: negative or zero when memory is not reserved.
+ *	positive number on success.
+ *
+ */
+int is_ima_memory_reserved(void)
+{
+	return of_is_ima_memory_reserved();
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
+	return of_get_ima_buffer(addr, size);
+}
+
+/**
+ * ima_free_kexec_buffer - free memory used by the IMA buffer
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int ima_free_kexec_buffer(void)
+{
+	return of_remove_ima_buffer();
+}
+
+#ifdef CONFIG_IMA_KEXEC
+/**
+ * arch_ima_add_kexec_buffer - do arch-specific steps to add the IMA
+ *	measurement log.
+ * @image: - pointer to the kimage, to store the address and size of the
+ *	IMA measurement log.
+ * @load_addr: - the address where the IMA measurement log is stored.
+ * @size - size of the IMA measurement log.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
+			      void *buffer, size_t size)
+{
+	of_ima_write_buffer(buffer, size);
+	return 0;
+}
+#endif /* CONFIG_IMA_KEXEC */
diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index b40c3b0def92..8dc25511142d 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -22,6 +22,7 @@
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 #include <asm/byteorder.h>
+#include <asm/ima.h>
 
 /* relevant device tree properties */
 #define FDT_PROP_KEXEC_ELFHDR	"linux,elfcorehdr"
diff --git a/arch/powerpc/include/asm/ima.h b/arch/powerpc/include/asm/ima.h
index ead488cf3981..a8febc620b42 100644
--- a/arch/powerpc/include/asm/ima.h
+++ b/arch/powerpc/include/asm/ima.h
@@ -4,6 +4,7 @@
 
 struct kimage;
 
+int is_ima_memory_reserved(void);
 int ima_get_kexec_buffer(void **addr, size_t *size);
 int ima_free_kexec_buffer(void);
 
@@ -15,7 +16,7 @@ static inline void remove_ima_buffer(void *fdt, int chosen_node) {}
 
 #ifdef CONFIG_IMA_KEXEC
 int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
-			      size_t size);
+			      void *buffer, size_t size);
 
 int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node);
 #else
diff --git a/arch/powerpc/kexec/ima.c b/arch/powerpc/kexec/ima.c
index 720e50e490b6..3823539d4e07 100644
--- a/arch/powerpc/kexec/ima.c
+++ b/arch/powerpc/kexec/ima.c
@@ -46,6 +46,18 @@ static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
 	return 0;
 }
 
+/**
+ * is_ima_memory_reserved - check if memory is reserved via device
+ *			    tree.
+ *	Return: negative or zero when memory is not reserved.
+ *	positive number on success.
+ *
+ */
+int is_ima_memory_reserved(void)
+{
+	return -EOPNOTSUPP;
+}
+
 /**
  * ima_get_kexec_buffer - get IMA buffer from the previous kernel
  * @addr:	On successful return, set to point to the buffer contents.
@@ -137,7 +149,7 @@ void remove_ima_buffer(void *fdt, int chosen_node)
  * Return: 0 on success, negative errno on error.
  */
 int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
-			      size_t size)
+			      void *buffer, size_t size)
 {
 	image->arch.ima_buffer_addr = load_addr;
 	image->arch.ima_buffer_size = size;
diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
index 121de3e04af2..3749472c7e18 100644
--- a/security/integrity/ima/ima_kexec.c
+++ b/security/integrity/ima/ima_kexec.c
@@ -116,13 +116,18 @@ void ima_add_kexec_buffer(struct kimage *image)
 	kbuf.buffer = kexec_buffer;
 	kbuf.bufsz = kexec_buffer_size;
 	kbuf.memsz = kexec_segment_size;
-	ret = kexec_add_buffer(&kbuf);
-	if (ret) {
-		pr_err("Error passing over kexec measurement buffer.\n");
-		return;
+
+	if (!is_ima_memory_reserved()) {
+
+		ret = kexec_add_buffer(&kbuf);
+		if (ret) {
+			pr_err("Error passing over kexec measurement buffer.\n");
+			return;
+		}
 	}
 
-	ret = arch_ima_add_kexec_buffer(image, kbuf.mem, kexec_segment_size);
+	ret = arch_ima_add_kexec_buffer(image, kbuf.mem, kexec_buffer,
+					kexec_segment_size);
 	if (ret) {
 		pr_err("Error passing over kexec measurement buffer.\n");
 		return;
-- 
2.25.1

