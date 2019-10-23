Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A73E0FBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 03:38:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yY1L6FNrzDqQ5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 12:38:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oR4wR/4L"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yXzT0fS5zDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 12:36:52 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id w8so9246638plq.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 18:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OM8bN9MJyNNkzeGUBmug5r4lWDXudOi8fXUM7aLJQ+U=;
 b=oR4wR/4LU9LDaKwlww1pGQZhz9/3ywO2vPpTkXa/MZxlAtiHfacK19/81TD3xGLv5c
 uzDzzevvElSP9GlkzMzVFkck+o2fpKirGMEdlt9x1VLA7H9/q3UIxAlZf9ogMnIeDcVu
 Y9RjaACugmdfBCQYXkThOg4YT3xHInQ55NVd9g8Gcsznp1UfSFFYhhR82Hec9kks52R4
 QgD9i29wLdl9cz9S4r6ACqMk6bdez7Wjfaa0jwak5KJdfijyFQ2dXAHdT7322FsR/KUe
 JyGIsU8K01dZlq1Hdn/fqG+c0tAvskhkcrfcp1DQRpghj0EOq/DOsNeqlNYQphIUSKPf
 EwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OM8bN9MJyNNkzeGUBmug5r4lWDXudOi8fXUM7aLJQ+U=;
 b=m6gkHg3UnoqJwBVPT3pKIVq0TIXoSKdVJZqVDuB2iRgbaZnzDvhQAyJRk5qAs8iYgn
 fW0nSekz4yvo0ftjSTzHP50MmZr2oRIDan6RWkkGwDBO7ZdmPjNodwF4l7ScmMZu5ky0
 453n5NZUxvxERF68pcCAaDDQoNQhVcqWhF2FfLQ/Ao0JahMmWpIJzCrSD8RoCfuvkryw
 vHTiPQOyEDiqZt3w08Kjrp/ouF7mC6SGl7WoIzfJCBvfxELsjqYfKeAFGoCcf7+AL0fk
 pdhi3mIRNj+l3upl0fEGq4YXU5pP7A9LFHVPCbHmLITqVv8JkrsthcSxdEmbjNlheqEu
 H4/g==
X-Gm-Message-State: APjAAAW33pbeixE9rH3NTm6DDvG5vkoI8uI1E51FYwvFmdK5x8xlH9+r
 zs9+3KGpIsj52A6yEamhmKnw4ECbjvo=
X-Google-Smtp-Source: APXvYqx9P773du+LVA2aBDRnaH9qMFhvD1XkFtBuz7vmvsYtQfcwUv77QlZmU/X7vSS3rnUUJO1BzQ==
X-Received: by 2002:a17:902:d88c:: with SMTP id
 b12mr6899086plz.254.1571794608638; 
 Tue, 22 Oct 2019 18:36:48 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id g4sm19711026pfo.33.2019.10.22.18.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 18:36:47 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/boot: Fix the initrd being overwritten under qemu
Date: Wed, 23 Oct 2019 12:36:35 +1100
Message-Id: <20191023013635.2512-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When booting under OF the zImage expects the initrd address and size to be
passed to it using registers r3 and r4. SLOF (guest firmware used by QEMU)
currently doesn't do this so the zImage is not aware of the initrd
location.  This can result in initrd corruption either though the zImage
extracting the vmlinux over the initrd, or by the vmlinux overwriting the
initrd when relocating itself.

QEMU does put the linux,initrd-start and linux,initrd-end properties into
the devicetree to vmlinux to find the initrd. We can work around the SLOF
bug by also looking those properties in the zImage.

Cc: stable@vger.kernel.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
First noticed here: https://unix.stackexchange.com/questions/547023/linux-kernel-on-ppc64le-vmlinux-equivalent-in-arch-powerpc-boot
---
 arch/powerpc/boot/devtree.c | 21 +++++++++++++++++++++
 arch/powerpc/boot/main.c    |  7 +++++++
 arch/powerpc/boot/of.h      | 16 ----------------
 arch/powerpc/boot/ops.h     |  1 +
 arch/powerpc/boot/swab.h    | 17 +++++++++++++++++
 5 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/boot/devtree.c b/arch/powerpc/boot/devtree.c
index 5d91036..ac5c26b 100644
--- a/arch/powerpc/boot/devtree.c
+++ b/arch/powerpc/boot/devtree.c
@@ -13,6 +13,7 @@
 #include "string.h"
 #include "stdio.h"
 #include "ops.h"
+#include "swab.h"
 
 void dt_fixup_memory(u64 start, u64 size)
 {
@@ -318,6 +319,26 @@ int dt_xlate_reg(void *node, int res, unsigned long *addr, unsigned long *size)
 	return dt_xlate(node, res, reglen, addr, size);
 }
 
+int dt_read_addr(void *node, const char *prop, unsigned long *out_addr)
+{
+	int reglen;
+
+	*out_addr = 0;
+
+	reglen = getprop(node, prop, prop_buf, sizeof(prop_buf)) / 4;
+	if (reglen == 2) {
+		u64 v0 = be32_to_cpu(prop_buf[0]);
+		u64 v1 = be32_to_cpu(prop_buf[1]);
+		*out_addr = (v0 << 32) | v1;
+	} else if (reglen == 1) {
+		*out_addr = be32_to_cpu(prop_buf[0]);
+	} else {
+		return 0;
+	}
+
+	return 1;
+}
+
 int dt_xlate_addr(void *node, u32 *buf, int buflen, unsigned long *xlated_addr)
 {
 
diff --git a/arch/powerpc/boot/main.c b/arch/powerpc/boot/main.c
index a9d2091..518af24 100644
--- a/arch/powerpc/boot/main.c
+++ b/arch/powerpc/boot/main.c
@@ -112,6 +112,13 @@ static struct addr_range prep_initrd(struct addr_range vmlinux, void *chosen,
 	} else if (initrd_size > 0) {
 		printf("Using loader supplied ramdisk at 0x%lx-0x%lx\n\r",
 		       initrd_addr, initrd_addr + initrd_size);
+	} else if (chosen) {
+		unsigned long initrd_end;
+
+		dt_read_addr(chosen, "linux,initrd-start", &initrd_addr);
+		dt_read_addr(chosen, "linux,initrd-end", &initrd_end);
+
+		initrd_size = initrd_end - initrd_addr;
 	}
 
 	/* If there's no initrd at all, we're done */
diff --git a/arch/powerpc/boot/of.h b/arch/powerpc/boot/of.h
index 31b2f5d..dc24770 100644
--- a/arch/powerpc/boot/of.h
+++ b/arch/powerpc/boot/of.h
@@ -26,22 +26,6 @@ typedef u16			__be16;
 typedef u32			__be32;
 typedef u64			__be64;
 
-#ifdef __LITTLE_ENDIAN__
-#define cpu_to_be16(x) swab16(x)
-#define be16_to_cpu(x) swab16(x)
-#define cpu_to_be32(x) swab32(x)
-#define be32_to_cpu(x) swab32(x)
-#define cpu_to_be64(x) swab64(x)
-#define be64_to_cpu(x) swab64(x)
-#else
-#define cpu_to_be16(x) (x)
-#define be16_to_cpu(x) (x)
-#define cpu_to_be32(x) (x)
-#define be32_to_cpu(x) (x)
-#define cpu_to_be64(x) (x)
-#define be64_to_cpu(x) (x)
-#endif
-
 #define PROM_ERROR (-1u)
 
 #endif /* _PPC_BOOT_OF_H_ */
diff --git a/arch/powerpc/boot/ops.h b/arch/powerpc/boot/ops.h
index e060676..5100dd7 100644
--- a/arch/powerpc/boot/ops.h
+++ b/arch/powerpc/boot/ops.h
@@ -95,6 +95,7 @@ void *simple_alloc_init(char *base, unsigned long heap_size,
 extern void flush_cache(void *, unsigned long);
 int dt_xlate_reg(void *node, int res, unsigned long *addr, unsigned long *size);
 int dt_xlate_addr(void *node, u32 *buf, int buflen, unsigned long *xlated_addr);
+int dt_read_addr(void *node, const char *prop, unsigned long *out);
 int dt_is_compatible(void *node, const char *compat);
 void dt_get_reg_format(void *node, u32 *naddr, u32 *nsize);
 int dt_get_virtual_reg(void *node, void **addr, int nres);
diff --git a/arch/powerpc/boot/swab.h b/arch/powerpc/boot/swab.h
index 11d2069..82db2c1 100644
--- a/arch/powerpc/boot/swab.h
+++ b/arch/powerpc/boot/swab.h
@@ -27,4 +27,21 @@ static inline u64 swab64(u64 x)
 		(u64)((x & (u64)0x00ff000000000000ULL) >> 40) |
 		(u64)((x & (u64)0xff00000000000000ULL) >> 56);
 }
+
+#ifdef __LITTLE_ENDIAN__
+#define cpu_to_be16(x) swab16(x)
+#define be16_to_cpu(x) swab16(x)
+#define cpu_to_be32(x) swab32(x)
+#define be32_to_cpu(x) swab32(x)
+#define cpu_to_be64(x) swab64(x)
+#define be64_to_cpu(x) swab64(x)
+#else
+#define cpu_to_be16(x) (x)
+#define be16_to_cpu(x) (x)
+#define cpu_to_be32(x) (x)
+#define be32_to_cpu(x) (x)
+#define cpu_to_be64(x) (x)
+#define be64_to_cpu(x) (x)
+#endif
+
 #endif /* _PPC_BOOT_SWAB_H_ */
-- 
2.9.5

