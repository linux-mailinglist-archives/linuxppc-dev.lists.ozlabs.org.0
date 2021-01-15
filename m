Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 942F82F84E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:59:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHVpG5qXyzDvYd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:59:02 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=default header.b=ghslIwj0; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DHSrB30FjzDsdD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 04:30:34 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1EAAB20B6C44;
 Fri, 15 Jan 2021 09:30:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1EAAB20B6C44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1610731826;
 bh=LbzCLl0uf9tmIpVZt74eQ/Joapw4vB5bPoYlweyhnuw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ghslIwj0P3FLP1IX3Dm9uZfb+AfMbx1mEGhvHCsYgVZdN0e66mmMuWGriTzl+SA9e
 D98dsviowHrUeZouMheNMNKVgQzu/LRqJ505OIKO8iWpIZT7N9/XicLLun71QZaKh/
 +pEW/vLQrD2tw0+Sa4yAF1Qg3z4BRlwXtOHH0Bvo=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 catalin.marinas@arm.com, mpe@ellerman.id.au
Subject: [PATCH v15 05/10] ima: Move arch_ima_add_kexec_buffer() to ima
Date: Fri, 15 Jan 2021 09:30:12 -0800
Message-Id: <20210115173017.30617-6-nramas@linux.microsoft.com>
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

arch_ima_add_kexec_buffer() defined in "arch/powerpc/kexec/ima.c"
sets up the address and size of the IMA measurement list in
the architecture specific fields in kimage struct.  This function does not
have architecture specific code, but is currently limited to powerpc.

Move arch_ima_add_kexec_buffer() to ima.

Co-developed-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Acked-by: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/ima.h     |  3 ---
 arch/powerpc/kexec/ima.c           | 17 -----------------
 security/integrity/ima/ima_kexec.c | 21 +++++++++++++++++++++
 3 files changed, 21 insertions(+), 20 deletions(-)

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
diff --git a/arch/powerpc/kexec/ima.c b/arch/powerpc/kexec/ima.c
index 720e50e490b6..7378d59c0c1e 100644
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
diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
index 121de3e04af2..95513c97ce8f 100644
--- a/security/integrity/ima/ima_kexec.c
+++ b/security/integrity/ima/ima_kexec.c
@@ -71,6 +71,27 @@ static int ima_dump_measurement_list(unsigned long *buffer_size, void **buffer,
 	return ret;
 }
 
+/**
+ * arch_ima_add_kexec_buffer - do arch-specific steps to add the IMA buffer
+ *
+ * @image: kimage struct to set IMA buffer data
+ * @load_addr: Starting address where IMA buffer is loaded at
+ * @size: Number of bytes in the IMA buffer
+ *
+ * Architectures should use this function to pass on the IMA buffer
+ * information to the next kernel.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+static int arch_ima_add_kexec_buffer(struct kimage *image,
+				     unsigned long load_addr, size_t size)
+{
+	image->arch.ima_buffer_addr = load_addr;
+	image->arch.ima_buffer_size = size;
+
+	return 0;
+}
+
 /*
  * Called during kexec_file_load so that IMA can add a segment to the kexec
  * image for the measurement list for the next kernel.
-- 
2.30.0

