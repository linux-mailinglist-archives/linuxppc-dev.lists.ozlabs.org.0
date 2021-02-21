Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888DC320C57
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 18:53:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkCbR2XFdz3dLf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 04:53:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=WFt1eJq5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=WFt1eJq5; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DkCWB50zlz30QZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 04:49:42 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4AB8620B57A6;
 Sun, 21 Feb 2021 09:49:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4AB8620B57A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613929781;
 bh=UcSmGozOexENegIGUGz3qQicWRTEGAasLQOBTUtlc0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WFt1eJq5Efwh83btLCIi59YgKIj0aHOdXfGC49i6llkIi24mC9rLUoO1gf0lmVxHD
 Ux+7g7zJVM62aoidzdGCuDwRtQaTe9Szy5FWsmfQP+X+PTrY+etNB9PNzqAlQMkmRM
 apoBOXTUevm9INOZAoMQWIxZEoyychOf/AkNHOLU=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au,
 sfr@canb.auug.org.au
Subject: [PATCH v19 08/13] powerpc: Move ima buffer fields to struct kimage
Date: Sun, 21 Feb 2021 09:49:25 -0800
Message-Id: <20210221174930.27324-9-nramas@linux.microsoft.com>
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

The fields ima_buffer_addr and ima_buffer_size in "struct kimage_arch"
for powerpc are used to carry forward the IMA measurement list across
kexec system call.  These fields are not architecture specific, but are
currently limited to powerpc.

arch_ima_add_kexec_buffer() defined in "arch/powerpc/kexec/ima.c"
sets ima_buffer_addr and ima_buffer_size for the kexec system call.
This function does not have architecture specific code, but is
currently limited to powerpc.

Move ima_buffer_addr and ima_buffer_size to "struct kimage".
Set ima_buffer_addr and ima_buffer_size in ima_add_kexec_buffer()
in security/integrity/ima/ima_kexec.c.

Co-developed-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Will Deacon <will@kernel.org>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/ima.h     |  3 ---
 arch/powerpc/include/asm/kexec.h   |  5 -----
 arch/powerpc/kexec/ima.c           | 29 ++++++-----------------------
 include/linux/kexec.h              |  3 +++
 security/integrity/ima/ima_kexec.c |  8 ++------
 5 files changed, 11 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/include/asm/ima.h b/arch/powerpc/include/asm/ima.h
index ead488cf3981..51f64fd06c19 100644
--- a/arch/powerpc/include/asm/ima.h
+++ b/arch/powerpc/include/asm/ima.h
@@ -14,9 +14,6 @@ static inline void remove_ima_buffer(void *fdt, int chosen_node) {}
 #endif
 
 #ifdef CONFIG_IMA_KEXEC
-int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
-			      size_t size);
-
 int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node);
 #else
 static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index c483c2cf284e..4d2c9b5087e1 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -108,11 +108,6 @@ struct kimage_arch {
 	unsigned long backup_start;
 	void *backup_buf;
 	void *fdt;
-
-#ifdef CONFIG_IMA_KEXEC
-	phys_addr_t ima_buffer_addr;
-	size_t ima_buffer_size;
-#endif
 };
 
 char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
diff --git a/arch/powerpc/kexec/ima.c b/arch/powerpc/kexec/ima.c
index 720e50e490b6..ed38125e2f87 100644
--- a/arch/powerpc/kexec/ima.c
+++ b/arch/powerpc/kexec/ima.c
@@ -128,23 +128,6 @@ void remove_ima_buffer(void *fdt, int chosen_node)
 }
 
 #ifdef CONFIG_IMA_KEXEC
-/**
- * arch_ima_add_kexec_buffer - do arch-specific steps to add the IMA buffer
- *
- * Architectures should use this function to pass on the IMA buffer
- * information to the next kernel.
- *
- * Return: 0 on success, negative errno on error.
- */
-int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
-			      size_t size)
-{
-	image->arch.ima_buffer_addr = load_addr;
-	image->arch.ima_buffer_size = size;
-
-	return 0;
-}
-
 static int write_number(void *p, u64 value, int cells)
 {
 	if (cells == 1) {
@@ -180,7 +163,7 @@ int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node)
 	u8 value[16];
 
 	remove_ima_buffer(fdt, chosen_node);
-	if (!image->arch.ima_buffer_size)
+	if (!image->ima_buffer_size)
 		return 0;
 
 	ret = get_addr_size_cells(&addr_cells, &size_cells);
@@ -192,11 +175,11 @@ int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node)
 	if (entry_size > sizeof(value))
 		return -EINVAL;
 
-	ret = write_number(value, image->arch.ima_buffer_addr, addr_cells);
+	ret = write_number(value, image->ima_buffer_addr, addr_cells);
 	if (ret)
 		return ret;
 
-	ret = write_number(value + 4 * addr_cells, image->arch.ima_buffer_size,
+	ret = write_number(value + 4 * addr_cells, image->ima_buffer_size,
 			   size_cells);
 	if (ret)
 		return ret;
@@ -206,13 +189,13 @@ int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node)
 	if (ret < 0)
 		return -EINVAL;
 
-	ret = fdt_add_mem_rsv(fdt, image->arch.ima_buffer_addr,
-			      image->arch.ima_buffer_size);
+	ret = fdt_add_mem_rsv(fdt, image->ima_buffer_addr,
+			      image->ima_buffer_size);
 	if (ret)
 		return -EINVAL;
 
 	pr_debug("IMA buffer at 0x%llx, size = 0x%zx\n",
-		 image->arch.ima_buffer_addr, image->arch.ima_buffer_size);
+		 image->ima_buffer_addr, image->ima_buffer_size);
 
 	return 0;
 }
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0208fe8f8e42..c3e2a2af1aea 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -304,6 +304,9 @@ struct kimage {
 #ifdef CONFIG_IMA_KEXEC
 	/* Virtual address of IMA measurement buffer for kexec syscall */
 	void *ima_buffer;
+
+	phys_addr_t ima_buffer_addr;
+	size_t ima_buffer_size;
 #endif
 
 	/* Core ELF header buffer */
diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
index e29bea3dd4cc..8b1a3d50c49c 100644
--- a/security/integrity/ima/ima_kexec.c
+++ b/security/integrity/ima/ima_kexec.c
@@ -123,12 +123,8 @@ void ima_add_kexec_buffer(struct kimage *image)
 		return;
 	}
 
-	ret = arch_ima_add_kexec_buffer(image, kbuf.mem, kexec_segment_size);
-	if (ret) {
-		pr_err("Error passing over kexec measurement buffer.\n");
-		return;
-	}
-
+	image->ima_buffer_addr = kbuf.mem;
+	image->ima_buffer_size = kexec_segment_size;
 	image->ima_buffer = kexec_buffer;
 
 	pr_debug("kexec measurement buffer for the loaded kernel at 0x%lx.\n",
-- 
2.30.0

