Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E839F456C80
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 10:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwWrM6Rlsz3c73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 20:41:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kh9rM6hD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=calvinzhang.cool@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kh9rM6hD; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwTdD5LPKz2xtL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 19:01:20 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 28so7952677pgq.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 00:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EE3SEPXoBbvJsiDAeji5FCMph0V1ZFJAuPncPXWzYuc=;
 b=kh9rM6hD/csU0psarGvH1deMLlvio0l/tW7tpWG4HVab9CRAttPkIbjpp6FapiotvQ
 v+n0cwlXmnNVtZyxR2b+uBvS92Lz153yWkr/cmJi0KHaXXnX6oK4zGfI52zhRETcTN6N
 44TPhShDpdj0EetsUVqeCGFQZDOsL/oEJvHmtBHBSHy9DnuUAGRpAG9+ELmu3MR1kDaN
 iqkSLqMtydAGnIOFHe7nWWreBeqbUKunO3mV0FfI1thtKKXNGKBhhM0ty73iKv+AEnQk
 x+/KZIOChNy8YO3PBh934tpq4Mk9ZCbnOdbbPaupoCRfm5APF2mDupRZqzwZqTg3CTPL
 TfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EE3SEPXoBbvJsiDAeji5FCMph0V1ZFJAuPncPXWzYuc=;
 b=AWv6hvgD2HgkhwhYq3ag269WYvx0cYyd6CI9/W2m8HxKPGZMQUnRzXMtOYvH6zF4R0
 yxOalVw3e9/PXr38SfkuLLu2tVCk4S3+w3NWQQwWFtdjmQlHBd523TcctAiVxy9zBuaD
 FosSkC6Nb3mwh3zcsCQe1FOTLczUK83cdJHlGzpPCageUym2YuM5GhmUlXfDgX6b73bb
 B4V/FXpqFwXjGIfCCJXuRRcKecwugTBQwzojyd8XJijcnKGNH5erlKXbUMb8UKl2UCrB
 PnAl73m71UIEGMkfv6jchQbhctqnnUk85c7/g6K3k4DbeycYHzMiTj3VbYhsgQmSh4X9
 rkuQ==
X-Gm-Message-State: AOAM532NEkFaSediOtEsdfdfakA2rgusbqEH3FJ5XA70w6UTyLYzeQk0
 kHUmCx9GNaH7yevKYzAZVkc=
X-Google-Smtp-Source: ABdhPJzldH7ipqqyeM+oT5d6Qzi/yvo/sIXQ5tPUpktsTjymUZzDLBV0pBKyCmXVkuqv/SB3PAreQA==
X-Received: by 2002:a63:b25d:: with SMTP id t29mr16036769pgo.79.1637308877488; 
 Fri, 19 Nov 2021 00:01:17 -0800 (PST)
Received: from localhost.localdomain ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id o6sm1791259pfh.70.2021.11.19.00.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 00:01:17 -0800 (PST)
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vladimir Isaev <isaev@synopsys.com>,
 Calvin Zhang <calvinzhang.cool@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Guenter Roeck <linux@roeck-us.net>, Marc Zyngier <maz@kernel.org>,
 David Brazdil <dbrazdil@google.com>, Mark Rutland <mark.rutland@arm.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Jinyang He <hejinyang@loongson.cn>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Alexandre Ghiti <alex@ghiti.fr>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [PATCH 1/2] of: Sort reserved_mem related code
Date: Fri, 19 Nov 2021 15:58:18 +0800
Message-Id: <20211119075844.2902592-2-calvinzhang.cool@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Nov 2021 20:39:55 +1100
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, Rob Herring <robh@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Mauri Sandberg <sandberg@mailfence.com>,
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move code about parsing /reserved-memory and initializing of
reserved_mems array to of_reserved_mem.c for better modularity.

Rename array name from reserved_mem to reserved_mems to distinguish
from type definition.

Signed-off-by: Calvin Zhang <calvinzhang.cool@gmail.com>
---
 drivers/of/fdt.c                | 108 +--------------------
 drivers/of/of_private.h         |  12 ++-
 drivers/of/of_reserved_mem.c    | 163 ++++++++++++++++++++++++++------
 include/linux/of_reserved_mem.h |   4 +
 4 files changed, 149 insertions(+), 138 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index bdca35284ceb..445af4e69300 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -80,7 +80,7 @@ void __init of_fdt_limit_memory(int limit)
 	}
 }
 
-static bool of_fdt_device_is_available(const void *blob, unsigned long node)
+bool of_fdt_device_is_available(const void *blob, unsigned long node)
 {
 	const char *status = fdt_getprop(blob, node, "status", NULL);
 
@@ -476,7 +476,7 @@ void *initial_boot_params __ro_after_init;
 
 static u32 of_fdt_crc32;
 
-static int __init early_init_dt_reserve_memory_arch(phys_addr_t base,
+int __init early_init_dt_reserve_memory_arch(phys_addr_t base,
 					phys_addr_t size, bool nomap)
 {
 	if (nomap) {
@@ -492,108 +492,6 @@ static int __init early_init_dt_reserve_memory_arch(phys_addr_t base,
 	return memblock_reserve(base, size);
 }
 
-/*
- * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
- */
-static int __init __reserved_mem_reserve_reg(unsigned long node,
-					     const char *uname)
-{
-	int t_len = (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32);
-	phys_addr_t base, size;
-	int len;
-	const __be32 *prop;
-	int first = 1;
-	bool nomap;
-
-	prop = of_get_flat_dt_prop(node, "reg", &len);
-	if (!prop)
-		return -ENOENT;
-
-	if (len && len % t_len != 0) {
-		pr_err("Reserved memory: invalid reg property in '%s', skipping node.\n",
-		       uname);
-		return -EINVAL;
-	}
-
-	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
-
-	while (len >= t_len) {
-		base = dt_mem_next_cell(dt_root_addr_cells, &prop);
-		size = dt_mem_next_cell(dt_root_size_cells, &prop);
-
-		if (size &&
-		    early_init_dt_reserve_memory_arch(base, size, nomap) == 0)
-			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
-				uname, &base, (unsigned long)(size / SZ_1M));
-		else
-			pr_info("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
-				uname, &base, (unsigned long)(size / SZ_1M));
-
-		len -= t_len;
-		if (first) {
-			fdt_reserved_mem_save_node(node, uname, base, size);
-			first = 0;
-		}
-	}
-	return 0;
-}
-
-/*
- * __reserved_mem_check_root() - check if #size-cells, #address-cells provided
- * in /reserved-memory matches the values supported by the current implementation,
- * also check if ranges property has been provided
- */
-static int __init __reserved_mem_check_root(unsigned long node)
-{
-	const __be32 *prop;
-
-	prop = of_get_flat_dt_prop(node, "#size-cells", NULL);
-	if (!prop || be32_to_cpup(prop) != dt_root_size_cells)
-		return -EINVAL;
-
-	prop = of_get_flat_dt_prop(node, "#address-cells", NULL);
-	if (!prop || be32_to_cpup(prop) != dt_root_addr_cells)
-		return -EINVAL;
-
-	prop = of_get_flat_dt_prop(node, "ranges", NULL);
-	if (!prop)
-		return -EINVAL;
-	return 0;
-}
-
-/*
- * fdt_scan_reserved_mem() - scan a single FDT node for reserved memory
- */
-static int __init fdt_scan_reserved_mem(void)
-{
-	int node, child;
-	const void *fdt = initial_boot_params;
-
-	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0)
-		return -ENODEV;
-
-	if (__reserved_mem_check_root(node) != 0) {
-		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return -EINVAL;
-	}
-
-	fdt_for_each_subnode(child, fdt, node) {
-		const char *uname;
-		int err;
-
-		if (!of_fdt_device_is_available(fdt, child))
-			continue;
-
-		uname = fdt_get_name(fdt, child, NULL);
-
-		err = __reserved_mem_reserve_reg(child, uname);
-		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL))
-			fdt_reserved_mem_save_node(child, uname, 0, 0);
-	}
-	return 0;
-}
-
 /*
  * fdt_reserve_elfcorehdr() - reserves memory for elf core header
  *
@@ -642,7 +540,7 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	}
 
 	fdt_scan_reserved_mem();
-	fdt_init_reserved_mem();
+	of_reserved_mem_init();
 	fdt_reserve_elfcorehdr();
 }
 
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 9324483397f6..88b67f8ed698 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -163,8 +163,14 @@ static inline int of_dma_get_range(struct device_node *np,
 }
 #endif
 
-void fdt_init_reserved_mem(void);
-void fdt_reserved_mem_save_node(unsigned long node, const char *uname,
-			       phys_addr_t base, phys_addr_t size);
+bool of_fdt_device_is_available(const void *blob, unsigned long node);
+int early_init_dt_reserve_memory_arch(phys_addr_t base,
+					phys_addr_t size, bool nomap);
+#ifdef CONFIG_OF_RESERVED_MEM
+int fdt_scan_reserved_mem(void);
+#else
+static inline int fdt_scan_reserved_mem(void) { }
+#endif
+
 
 #endif /* _LINUX_OF_PRIVATE_H */
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 9c0fb962c22b..784cfc5cd251 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -20,13 +20,14 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/sort.h>
 #include <linux/slab.h>
+#include <linux/libfdt.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
 
 #include "of_private.h"
 
 #define MAX_RESERVED_REGIONS	64
-static struct reserved_mem reserved_mem[MAX_RESERVED_REGIONS];
+static struct reserved_mem reserved_mems[MAX_RESERVED_REGIONS];
 static int reserved_mem_count;
 
 static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
@@ -56,12 +57,12 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 /*
  * fdt_reserved_mem_save_node() - save fdt node for second pass initialization
  */
-void __init fdt_reserved_mem_save_node(unsigned long node, const char *uname,
+static void __init fdt_reserved_mem_save_node(unsigned long node, const char *uname,
 				      phys_addr_t base, phys_addr_t size)
 {
-	struct reserved_mem *rmem = &reserved_mem[reserved_mem_count];
+	struct reserved_mem *rmem = &reserved_mems[reserved_mem_count];
 
-	if (reserved_mem_count == ARRAY_SIZE(reserved_mem)) {
+	if (reserved_mem_count == ARRAY_SIZE(reserved_mems)) {
 		pr_err("not enough space for all defined regions.\n");
 		return;
 	}
@@ -173,29 +174,105 @@ static const struct of_device_id __rmem_of_table_sentinel
 	__used __section("__reservedmem_of_table_end");
 
 /*
- * __reserved_mem_init_node() - call region specific reserved memory init code
+ * __reserved_mem_check_root() - check if #size-cells, #address-cells provided
+ * in /reserved-memory matches the values supported by the current implementation,
+ * also check if ranges property has been provided
  */
-static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
+static int __init __reserved_mem_check_root(unsigned long node)
 {
-	extern const struct of_device_id __reservedmem_of_table[];
-	const struct of_device_id *i;
-	int ret = -ENOENT;
+	const __be32 *prop;
 
-	for (i = __reservedmem_of_table; i < &__rmem_of_table_sentinel; i++) {
-		reservedmem_of_init_fn initfn = i->data;
-		const char *compat = i->compatible;
+	prop = of_get_flat_dt_prop(node, "#size-cells", NULL);
+	if (!prop || be32_to_cpup(prop) != dt_root_size_cells)
+		return -EINVAL;
 
-		if (!of_flat_dt_is_compatible(rmem->fdt_node, compat))
-			continue;
+	prop = of_get_flat_dt_prop(node, "#address-cells", NULL);
+	if (!prop || be32_to_cpup(prop) != dt_root_addr_cells)
+		return -EINVAL;
 
-		ret = initfn(rmem);
-		if (ret == 0) {
-			pr_info("initialized node %s, compatible id %s\n",
-				rmem->name, compat);
-			break;
+	prop = of_get_flat_dt_prop(node, "ranges", NULL);
+	if (!prop)
+		return -EINVAL;
+	return 0;
+}
+
+/*
+ * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
+ */
+static int __init __reserved_mem_reserve_reg(unsigned long node,
+					     const char *uname)
+{
+	int t_len = (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32);
+	phys_addr_t base, size;
+	int len;
+	const __be32 *prop;
+	int first = 1;
+	bool nomap;
+
+	prop = of_get_flat_dt_prop(node, "reg", &len);
+	if (!prop)
+		return -ENOENT;
+
+	if (len && len % t_len != 0) {
+		pr_err("Reserved memory: invalid reg property in '%s', skipping node.\n",
+		       uname);
+		return -EINVAL;
+	}
+
+	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+
+	while (len >= t_len) {
+		base = dt_mem_next_cell(dt_root_addr_cells, &prop);
+		size = dt_mem_next_cell(dt_root_size_cells, &prop);
+
+		if (size &&
+		    early_init_dt_reserve_memory_arch(base, size, nomap) == 0)
+			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
+				uname, &base, (unsigned long)(size / SZ_1M));
+		else
+			pr_info("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
+				uname, &base, (unsigned long)(size / SZ_1M));
+
+		len -= t_len;
+		if (first) {
+			fdt_reserved_mem_save_node(node, uname, base, size);
+			first = 0;
 		}
 	}
-	return ret;
+	return 0;
+}
+
+/*
+ * fdt_scan_reserved_mem() - scan a single FDT node for reserved memory
+ */
+int __init fdt_scan_reserved_mem(void)
+{
+	int node, child;
+	const void *fdt = initial_boot_params;
+
+	node = fdt_path_offset(fdt, "/reserved-memory");
+	if (node < 0)
+		return -ENODEV;
+
+	if (__reserved_mem_check_root(node) != 0) {
+		pr_err("Reserved memory: unsupported node format, ignoring\n");
+		return -EINVAL;
+	}
+
+	fdt_for_each_subnode(child, fdt, node) {
+		const char *uname;
+		int err;
+
+		if (!of_fdt_device_is_available(fdt, child))
+			continue;
+
+		uname = fdt_get_name(fdt, child, NULL);
+
+		err = __reserved_mem_reserve_reg(child, uname);
+		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL))
+			fdt_reserved_mem_save_node(child, uname, 0, 0);
+	}
+	return 0;
 }
 
 static int __init __rmem_cmp(const void *a, const void *b)
@@ -228,13 +305,13 @@ static void __init __rmem_check_for_overlap(void)
 	if (reserved_mem_count < 2)
 		return;
 
-	sort(reserved_mem, reserved_mem_count, sizeof(reserved_mem[0]),
+	sort(reserved_mems, reserved_mem_count, sizeof(reserved_mems[0]),
 	     __rmem_cmp, NULL);
 	for (i = 0; i < reserved_mem_count - 1; i++) {
 		struct reserved_mem *this, *next;
 
-		this = &reserved_mem[i];
-		next = &reserved_mem[i + 1];
+		this = &reserved_mems[i];
+		next = &reserved_mems[i + 1];
 
 		if (this->base + this->size > next->base) {
 			phys_addr_t this_end, next_end;
@@ -248,10 +325,36 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+/*
+ * __reserved_mem_init_node() - call region specific reserved memory init code
+ */
+static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
+{
+	extern const struct of_device_id __reservedmem_of_table[];
+	const struct of_device_id *i;
+	int ret = -ENOENT;
+
+	for (i = __reservedmem_of_table; i < &__rmem_of_table_sentinel; i++) {
+		reservedmem_of_init_fn initfn = i->data;
+		const char *compat = i->compatible;
+
+		if (!of_flat_dt_is_compatible(rmem->fdt_node, compat))
+			continue;
+
+		ret = initfn(rmem);
+		if (ret == 0) {
+			pr_info("initialized node %s, compatible id %s\n",
+				rmem->name, compat);
+			break;
+		}
+	}
+	return ret;
+}
+
 /**
- * fdt_init_reserved_mem() - allocate and init all saved reserved memory regions
+ * of_reserved_mem_init() - allocate and init all saved reserved memory regions
  */
-void __init fdt_init_reserved_mem(void)
+void __init of_reserved_mem_init(void)
 {
 	int i;
 
@@ -259,7 +362,7 @@ void __init fdt_init_reserved_mem(void)
 	__rmem_check_for_overlap();
 
 	for (i = 0; i < reserved_mem_count; i++) {
-		struct reserved_mem *rmem = &reserved_mem[i];
+		struct reserved_mem *rmem = &reserved_mems[i];
 		unsigned long node = rmem->fdt_node;
 		int len;
 		const __be32 *prop;
@@ -299,8 +402,8 @@ static inline struct reserved_mem *__find_rmem(struct device_node *node)
 		return NULL;
 
 	for (i = 0; i < reserved_mem_count; i++)
-		if (reserved_mem[i].phandle == node->phandle)
-			return &reserved_mem[i];
+		if (reserved_mems[i].phandle == node->phandle)
+			return &reserved_mems[i];
 	return NULL;
 }
 
@@ -442,8 +545,8 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 
 	name = kbasename(np->full_name);
 	for (i = 0; i < reserved_mem_count; i++)
-		if (!strcmp(reserved_mem[i].name, name))
-			return &reserved_mem[i];
+		if (!strcmp(reserved_mems[i].name, name))
+			return &reserved_mems[i];
 
 	return NULL;
 }
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 4de2a24cadc9..34e134bec606 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -32,6 +32,8 @@ typedef int (*reservedmem_of_init_fn)(struct reserved_mem *rmem);
 #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
 	_OF_DECLARE(reservedmem, name, compat, init, reservedmem_of_init_fn)
 
+void of_reserved_mem_init(void);
+
 int of_reserved_mem_device_init_by_idx(struct device *dev,
 				       struct device_node *np, int idx);
 int of_reserved_mem_device_init_by_name(struct device *dev,
@@ -45,6 +47,8 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
 #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
 	_OF_DECLARE_STUB(reservedmem, name, compat, init, reservedmem_of_init_fn)
 
+static inline void of_reserved_mem_init(void) { }
+
 static inline int of_reserved_mem_device_init_by_idx(struct device *dev,
 					struct device_node *np, int idx)
 {
-- 
2.30.2

