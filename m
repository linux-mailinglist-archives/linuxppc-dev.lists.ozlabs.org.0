Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F16F130F8BE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 17:58:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWlBS06cxzDsV4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 03:58:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=XqMv0O33; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DWkq20NdqzDrWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 03:42:06 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1BE6F20B6C49;
 Thu,  4 Feb 2021 08:42:05 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1BE6F20B6C49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612456925;
 bh=j+m2dR5ww3SCw8oyyZKjTEpLaO6j8YaYz0eXbFOJGks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XqMv0O331GqkREnDVAzOHFGxCo7GVTqw2Avx6Ws9r4a3pfiBlYy3873CU7aRY8ks/
 DiUi04CRZrwWifQlps/Faz87RtB92C12EnLlTlS+pGqmEy5JzpZ6FEwAMIzds4D6nv
 RyGv80vBtgXh9fB2WwCZsGaO/ztZqb+PMV1tS3mQ=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au
Subject: [PATCH v16 09/12] of: Define functions to allocate and free FDT
Date: Thu,  4 Feb 2021 08:41:32 -0800
Message-Id: <20210204164135.29856-10-nramas@linux.microsoft.com>
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

Kernel components that use Flattened Device Tree (FDT) allocate kernel
memory and call fdt_open_into() to reorganize the tree into a form
suitable for the read-write operations.  These operations can be
combined into a single function to allocate and initialize the FDT
so the different architecures do not have to duplicate the code.

Define of_alloc_and_init_fdt() and of_free_fdt() in drivers/of/kexec.c
to allocate and initialize FDT, and to free the FDT buffer respectively.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Rob Herring <robh@kernel.org>
Suggested-by: Joe Perches <joe@perches.com>
---
 drivers/of/kexec.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/of.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 5ae0e5d90f55..197e71104f47 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -11,6 +11,7 @@
 
 #include <linux/kernel.h>
 #include <linux/kexec.h>
+#include <linux/mm.h>
 #include <linux/memblock.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
@@ -28,6 +29,42 @@
 #define FDT_PROP_RNG_SEED	"rng-seed"
 #define RNG_SEED_SIZE		128
 
+/**
+ * of_alloc_and_init_fdt - Allocate and initialize a Flattened device tree
+ *
+ * @fdt_size:	Flattened device tree size
+ *
+ * Return the allocated FDT buffer on success, or NULL on error.
+ */
+void *of_alloc_and_init_fdt(unsigned int fdt_size)
+{
+	void *fdt;
+	int ret;
+
+	fdt = kvmalloc(fdt_size, GFP_KERNEL);
+	if (!fdt)
+		return NULL;
+
+	ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
+	if (ret < 0) {
+		pr_err("Error setting up the new device tree.\n");
+		kvfree(fdt);
+		fdt = NULL;
+	}
+
+	return fdt;
+}
+
+/**
+ * of_free_fdt - Free the buffer for Flattened device tree
+ *
+ * @fdt:	Flattened device tree buffer to free
+ */
+void of_free_fdt(void *fdt)
+{
+	kvfree(fdt);
+}
+
 /**
  * fdt_find_and_del_mem_rsv - delete memory reservation with given address and size
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index 19f77dd12507..9f0261761e28 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -563,6 +563,8 @@ struct kimage;
 int of_kexec_setup_new_fdt(const struct kimage *image, void *fdt,
 			   unsigned long initrd_load_addr, unsigned long initrd_len,
 			   const char *cmdline);
+void *of_alloc_and_init_fdt(unsigned int fdt_size);
+void of_free_fdt(void *fdt);
 
 #ifdef CONFIG_IMA_KEXEC
 int of_ima_add_kexec_buffer(struct kimage *image,
-- 
2.30.0

