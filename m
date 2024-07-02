Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A38549249B0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 23:04:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=chH1WdRO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDFlk3BkVz3dCy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 07:04:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=chH1WdRO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDFl06hrbz3cVD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 07:03:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A0E361E1F;
	Tue,  2 Jul 2024 21:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF44C116B1;
	Tue,  2 Jul 2024 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719954233;
	bh=TWwYAQR1/ZQz/7w57+uehXebPTXv6mBfcflgPdnnh5I=;
	h=From:To:Cc:Subject:Date:From;
	b=chH1WdROMrOiLZfIMPm2z55nJ9wY79Igw6knK4JxetYJgEGb4DIhY4LFHk7hIqD9F
	 b5iqjqAQ2b+RRiVkxTc6ZOPWgp1HuhNd2IzWOwGO246STu9LQtPQXKucZhC3gtb3JV
	 W8iT1sZkxyPXRK7O7/+ETlQUyOW3GNpXPCUebwEC56IGXc1sL7/7yfue5IDZ9ZRB28
	 9kEF9TYJjUKYwIGda8MBE4vv7KUPb+za5k4o8aCE5Ak9M3qXc0M36ngMQaIhd+riqQ
	 A6m6o3/XcbuimYwUGPKBQxjGFj5fm1kiEBgiomMvg1bq6AsWufPyEkbRuGf7UCfc+Y
	 5IYtnmvlhq2cQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH] powerpc: kexec: Use of_property_read_reg()
Date: Tue,  2 Jul 2024 15:03:44 -0600
Message-ID: <20240702210344.722364-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace open-coded parsing of "reg" property with
of_property_read_reg().

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/powerpc/kexec/file_load_64.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 925a69ad2468..5200529bf4db 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -18,6 +18,7 @@
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
@@ -376,10 +377,9 @@ static int kdump_setup_usable_lmb(struct drmem_lmb *lmb, const __be32 **usm,
 static int add_usable_mem_property(void *fdt, struct device_node *dn,
 				   struct umem_info *um_info)
 {
-	int n_mem_addr_cells, n_mem_size_cells, node;
+	int node;
 	char path[NODE_PATH_LEN];
-	int i, len, ranges, ret;
-	const __be32 *prop;
+	int i, ret;
 	u64 base, end;
 
 	of_node_get(dn);
@@ -399,40 +399,29 @@ static int add_usable_mem_property(void *fdt, struct device_node *dn,
 		goto out;
 	}
 
-	/* Get the address & size cells */
-	n_mem_addr_cells = of_n_addr_cells(dn);
-	n_mem_size_cells = of_n_size_cells(dn);
-	kexec_dprintk("address cells: %d, size cells: %d\n", n_mem_addr_cells,
-		      n_mem_size_cells);
-
 	um_info->idx  = 0;
 	if (!check_realloc_usable_mem(um_info, 2)) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	prop = of_get_property(dn, "reg", &len);
-	if (!prop || len <= 0) {
-		ret = 0;
-		goto out;
-	}
-
 	/*
 	 * "reg" property represents sequence of (addr,size) tuples
 	 * each representing a memory range.
 	 */
-	ranges = (len >> 2) / (n_mem_addr_cells + n_mem_size_cells);
+	for (i = 0; ; i++) {
+		ret = of_property_read_reg(dn, i, &base, &end);
+		if (ret)
+			break;
 
-	for (i = 0; i < ranges; i++) {
-		base = of_read_number(prop, n_mem_addr_cells);
-		prop += n_mem_addr_cells;
-		end = base + of_read_number(prop, n_mem_size_cells) - 1;
-		prop += n_mem_size_cells;
+		end += base - 1;
 
 		ret = add_usable_mem(um_info, base, end);
 		if (ret)
 			goto out;
 	}
+	if (!i)
+		goto out;
 
 	/*
 	 * No kdump kernel usable memory found in this memory node.
-- 
2.43.0

