Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F9953A7B4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 16:02:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCrSs5cr8z3fc0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 00:02:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LGu9VJNw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LGu9VJNw;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCrL71vFZz3ch8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 23:57:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CFE5BCE1C37;
	Wed,  1 Jun 2022 13:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75509C385B8;
	Wed,  1 Jun 2022 13:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654091821;
	bh=8YTBb/y06p9bUmkDTqdpbZdm6d31m4hJrQ5IhM3kZbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGu9VJNwBCF9X3G2M8I7Ep2e7Zyqi8IAZJ3yttAUpQi6l/umvcKmbzWgh2a2DWi0v
	 mIUdt4cKDoLXZXD9q58uhYdPaeqiTCzHTciax+QsIuEWRExtGYKyJaV78FxgwgP1Ve
	 QpCl7NZBZmTNOmNGRAPfcD02Fov5ycZsqhueR3BYSBR9kOzgy1smQFh4mZ4VaZWvR9
	 bFXhyWj5cHY99u1b95+5htJRXY7B/O63V023BtqAhDemnECKGcx1TjfZlj4JlHPOJs
	 kxU23Sq7LTU8UlVBm/paLI4NCsbUZ7UsyfHa7bmKlqH3UtsD5xeeK3kq0FeXwmCjGS
	 o6OTwF35hTdIw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 17/37] powerpc/fadump: Fix fadump to work with a different endian capture kernel
Date: Wed,  1 Jun 2022 09:56:02 -0400
Message-Id: <20220601135622.2003939-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601135622.2003939-1-sashal@kernel.org>
References: <20220601135622.2003939-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, nick.child@ibm.com, Julia.Lawall@inria.fr, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Hari Bathini <hbathini@linux.ibm.com>

[ Upstream commit b74196af372f7cb4902179009265fe63ac81824f ]

Dump capture would fail if capture kernel is not of the endianess as the
production kernel, because the in-memory data structure (struct
opal_fadump_mem_struct) shared across production kernel and capture
kernel assumes the same endianess for both the kernels, which doesn't
have to be true always. Fix it by having a well-defined endianess for
struct opal_fadump_mem_struct.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/161902744901.86147.14719228311655123526.stgit@hbathini
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/opal-fadump.c | 94 +++++++++++---------
 arch/powerpc/platforms/powernv/opal-fadump.h | 10 +--
 2 files changed, 57 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 9a360ced663b..e23a51a05f99 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -60,7 +60,7 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	addr = be64_to_cpu(addr);
 	pr_debug("Kernel metadata addr: %llx\n", addr);
 	opal_fdm_active = (void *)addr;
-	if (opal_fdm_active->registered_regions == 0)
+	if (be16_to_cpu(opal_fdm_active->registered_regions) == 0)
 		return;
 
 	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_BOOT_MEM, &addr);
@@ -95,17 +95,17 @@ static int opal_fadump_unregister(struct fw_dump *fadump_conf);
 static void opal_fadump_update_config(struct fw_dump *fadump_conf,
 				      const struct opal_fadump_mem_struct *fdm)
 {
-	pr_debug("Boot memory regions count: %d\n", fdm->region_cnt);
+	pr_debug("Boot memory regions count: %d\n", be16_to_cpu(fdm->region_cnt));
 
 	/*
 	 * The destination address of the first boot memory region is the
 	 * destination address of boot memory regions.
 	 */
-	fadump_conf->boot_mem_dest_addr = fdm->rgn[0].dest;
+	fadump_conf->boot_mem_dest_addr = be64_to_cpu(fdm->rgn[0].dest);
 	pr_debug("Destination address of boot memory regions: %#016llx\n",
 		 fadump_conf->boot_mem_dest_addr);
 
-	fadump_conf->fadumphdr_addr = fdm->fadumphdr_addr;
+	fadump_conf->fadumphdr_addr = be64_to_cpu(fdm->fadumphdr_addr);
 }
 
 /*
@@ -126,9 +126,9 @@ static void opal_fadump_get_config(struct fw_dump *fadump_conf,
 	fadump_conf->boot_memory_size = 0;
 
 	pr_debug("Boot memory regions:\n");
-	for (i = 0; i < fdm->region_cnt; i++) {
-		base = fdm->rgn[i].src;
-		size = fdm->rgn[i].size;
+	for (i = 0; i < be16_to_cpu(fdm->region_cnt); i++) {
+		base = be64_to_cpu(fdm->rgn[i].src);
+		size = be64_to_cpu(fdm->rgn[i].size);
 		pr_debug("\t[%03d] base: 0x%lx, size: 0x%lx\n", i, base, size);
 
 		fadump_conf->boot_mem_addr[i] = base;
@@ -143,7 +143,7 @@ static void opal_fadump_get_config(struct fw_dump *fadump_conf,
 	 * Start address of reserve dump area (permanent reservation) for
 	 * re-registering FADump after dump capture.
 	 */
-	fadump_conf->reserve_dump_area_start = fdm->rgn[0].dest;
+	fadump_conf->reserve_dump_area_start = be64_to_cpu(fdm->rgn[0].dest);
 
 	/*
 	 * Rarely, but it can so happen that system crashes before all
@@ -155,13 +155,14 @@ static void opal_fadump_get_config(struct fw_dump *fadump_conf,
 	 * Hope the memory that could not be preserved only has pages
 	 * that are usually filtered out while saving the vmcore.
 	 */
-	if (fdm->region_cnt > fdm->registered_regions) {
+	if (be16_to_cpu(fdm->region_cnt) > be16_to_cpu(fdm->registered_regions)) {
 		pr_warn("Not all memory regions were saved!!!\n");
 		pr_warn("  Unsaved memory regions:\n");
-		i = fdm->registered_regions;
-		while (i < fdm->region_cnt) {
+		i = be16_to_cpu(fdm->registered_regions);
+		while (i < be16_to_cpu(fdm->region_cnt)) {
 			pr_warn("\t[%03d] base: 0x%llx, size: 0x%llx\n",
-				i, fdm->rgn[i].src, fdm->rgn[i].size);
+				i, be64_to_cpu(fdm->rgn[i].src),
+				be64_to_cpu(fdm->rgn[i].size));
 			i++;
 		}
 
@@ -170,7 +171,7 @@ static void opal_fadump_get_config(struct fw_dump *fadump_conf,
 	}
 
 	fadump_conf->boot_mem_top = (fadump_conf->boot_memory_size + hole_size);
-	fadump_conf->boot_mem_regs_cnt = fdm->region_cnt;
+	fadump_conf->boot_mem_regs_cnt = be16_to_cpu(fdm->region_cnt);
 	opal_fadump_update_config(fadump_conf, fdm);
 }
 
@@ -178,35 +179,38 @@ static void opal_fadump_get_config(struct fw_dump *fadump_conf,
 static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
 {
 	fdm->version = OPAL_FADUMP_VERSION;
-	fdm->region_cnt = 0;
-	fdm->registered_regions = 0;
-	fdm->fadumphdr_addr = 0;
+	fdm->region_cnt = cpu_to_be16(0);
+	fdm->registered_regions = cpu_to_be16(0);
+	fdm->fadumphdr_addr = cpu_to_be64(0);
 }
 
 static u64 opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
 	u64 addr = fadump_conf->reserve_dump_area_start;
+	u16 reg_cnt;
 	int i;
 
 	opal_fdm = __va(fadump_conf->kernel_metadata);
 	opal_fadump_init_metadata(opal_fdm);
 
 	/* Boot memory regions */
+	reg_cnt = be16_to_cpu(opal_fdm->region_cnt);
 	for (i = 0; i < fadump_conf->boot_mem_regs_cnt; i++) {
-		opal_fdm->rgn[i].src	= fadump_conf->boot_mem_addr[i];
-		opal_fdm->rgn[i].dest	= addr;
-		opal_fdm->rgn[i].size	= fadump_conf->boot_mem_sz[i];
+		opal_fdm->rgn[i].src	= cpu_to_be64(fadump_conf->boot_mem_addr[i]);
+		opal_fdm->rgn[i].dest	= cpu_to_be64(addr);
+		opal_fdm->rgn[i].size	= cpu_to_be64(fadump_conf->boot_mem_sz[i]);
 
-		opal_fdm->region_cnt++;
+		reg_cnt++;
 		addr += fadump_conf->boot_mem_sz[i];
 	}
+	opal_fdm->region_cnt = cpu_to_be16(reg_cnt);
 
 	/*
 	 * Kernel metadata is passed to f/w and retrieved in capture kerenl.
 	 * So, use it to save fadump header address instead of calculating it.
 	 */
-	opal_fdm->fadumphdr_addr = (opal_fdm->rgn[0].dest +
-				    fadump_conf->boot_memory_size);
+	opal_fdm->fadumphdr_addr = cpu_to_be64(be64_to_cpu(opal_fdm->rgn[0].dest) +
+					       fadump_conf->boot_memory_size);
 
 	opal_fadump_update_config(fadump_conf, opal_fdm);
 
@@ -269,18 +273,21 @@ static u64 opal_fadump_get_bootmem_min(void)
 static int opal_fadump_register(struct fw_dump *fadump_conf)
 {
 	s64 rc = OPAL_PARAMETER;
+	u16 registered_regs;
 	int i, err = -EIO;
 
-	for (i = 0; i < opal_fdm->region_cnt; i++) {
+	registered_regs = be16_to_cpu(opal_fdm->registered_regions);
+	for (i = 0; i < be16_to_cpu(opal_fdm->region_cnt); i++) {
 		rc = opal_mpipl_update(OPAL_MPIPL_ADD_RANGE,
-				       opal_fdm->rgn[i].src,
-				       opal_fdm->rgn[i].dest,
-				       opal_fdm->rgn[i].size);
+				       be64_to_cpu(opal_fdm->rgn[i].src),
+				       be64_to_cpu(opal_fdm->rgn[i].dest),
+				       be64_to_cpu(opal_fdm->rgn[i].size));
 		if (rc != OPAL_SUCCESS)
 			break;
 
-		opal_fdm->registered_regions++;
+		registered_regs++;
 	}
+	opal_fdm->registered_regions = cpu_to_be16(registered_regs);
 
 	switch (rc) {
 	case OPAL_SUCCESS:
@@ -291,7 +298,8 @@ static int opal_fadump_register(struct fw_dump *fadump_conf)
 	case OPAL_RESOURCE:
 		/* If MAX regions limit in f/w is hit, warn and proceed. */
 		pr_warn("%d regions could not be registered for MPIPL as MAX limit is reached!\n",
-			(opal_fdm->region_cnt - opal_fdm->registered_regions));
+			(be16_to_cpu(opal_fdm->region_cnt) -
+			 be16_to_cpu(opal_fdm->registered_regions)));
 		fadump_conf->dump_registered = 1;
 		err = 0;
 		break;
@@ -312,7 +320,7 @@ static int opal_fadump_register(struct fw_dump *fadump_conf)
 	 * If some regions were registered before OPAL_MPIPL_ADD_RANGE
 	 * OPAL call failed, unregister all regions.
 	 */
-	if ((err < 0) && (opal_fdm->registered_regions > 0))
+	if ((err < 0) && (be16_to_cpu(opal_fdm->registered_regions) > 0))
 		opal_fadump_unregister(fadump_conf);
 
 	return err;
@@ -328,7 +336,7 @@ static int opal_fadump_unregister(struct fw_dump *fadump_conf)
 		return -EIO;
 	}
 
-	opal_fdm->registered_regions = 0;
+	opal_fdm->registered_regions = cpu_to_be16(0);
 	fadump_conf->dump_registered = 0;
 	return 0;
 }
@@ -563,19 +571,20 @@ static void opal_fadump_region_show(struct fw_dump *fadump_conf,
 	else
 		fdm_ptr = opal_fdm;
 
-	for (i = 0; i < fdm_ptr->region_cnt; i++) {
+	for (i = 0; i < be16_to_cpu(fdm_ptr->region_cnt); i++) {
 		/*
 		 * Only regions that are registered for MPIPL
 		 * would have dump data.
 		 */
 		if ((fadump_conf->dump_active) &&
-		    (i < fdm_ptr->registered_regions))
-			dumped_bytes = fdm_ptr->rgn[i].size;
+		    (i < be16_to_cpu(fdm_ptr->registered_regions)))
+			dumped_bytes = be64_to_cpu(fdm_ptr->rgn[i].size);
 
 		seq_printf(m, "DUMP: Src: %#016llx, Dest: %#016llx, ",
-			   fdm_ptr->rgn[i].src, fdm_ptr->rgn[i].dest);
+			   be64_to_cpu(fdm_ptr->rgn[i].src),
+			   be64_to_cpu(fdm_ptr->rgn[i].dest));
 		seq_printf(m, "Size: %#llx, Dumped: %#llx bytes\n",
-			   fdm_ptr->rgn[i].size, dumped_bytes);
+			   be64_to_cpu(fdm_ptr->rgn[i].size), dumped_bytes);
 	}
 
 	/* Dump is active. Show reserved area start address. */
@@ -624,6 +633,7 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 {
 	const __be32 *prop;
 	unsigned long dn;
+	__be64 be_addr;
 	u64 addr = 0;
 	int i, len;
 	s64 ret;
@@ -680,13 +690,13 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	if (!prop)
 		return;
 
-	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &addr);
-	if ((ret != OPAL_SUCCESS) || !addr) {
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &be_addr);
+	if ((ret != OPAL_SUCCESS) || !be_addr) {
 		pr_err("Failed to get Kernel metadata (%lld)\n", ret);
 		return;
 	}
 
-	addr = be64_to_cpu(addr);
+	addr = be64_to_cpu(be_addr);
 	pr_debug("Kernel metadata addr: %llx\n", addr);
 
 	opal_fdm_active = __va(addr);
@@ -697,14 +707,14 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	}
 
 	/* Kernel regions not registered with f/w for MPIPL */
-	if (opal_fdm_active->registered_regions == 0) {
+	if (be16_to_cpu(opal_fdm_active->registered_regions) == 0) {
 		opal_fdm_active = NULL;
 		return;
 	}
 
-	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, &addr);
-	if (addr) {
-		addr = be64_to_cpu(addr);
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, &be_addr);
+	if (be_addr) {
+		addr = be64_to_cpu(be_addr);
 		pr_debug("CPU metadata addr: %llx\n", addr);
 		opal_cpu_metadata = __va(addr);
 	}
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index f1e9ecf548c5..3f715efb0aa6 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -31,14 +31,14 @@
  * OPAL FADump kernel metadata
  *
  * The address of this structure will be registered with f/w for retrieving
- * and processing during crash dump.
+ * in the capture kernel to process the crash dump.
  */
 struct opal_fadump_mem_struct {
 	u8	version;
 	u8	reserved[3];
-	u16	region_cnt;		/* number of regions */
-	u16	registered_regions;	/* Regions registered for MPIPL */
-	u64	fadumphdr_addr;
+	__be16	region_cnt;		/* number of regions */
+	__be16	registered_regions;	/* Regions registered for MPIPL */
+	__be64	fadumphdr_addr;
 	struct opal_mpipl_region	rgn[FADUMP_MAX_MEM_REGS];
 } __packed;
 
@@ -135,7 +135,7 @@ static inline void opal_fadump_read_regs(char *bufp, unsigned int regs_cnt,
 	for (i = 0; i < regs_cnt; i++, bufp += reg_entry_size) {
 		reg_entry = (struct hdat_fadump_reg_entry *)bufp;
 		val = (cpu_endian ? be64_to_cpu(reg_entry->reg_val) :
-		       reg_entry->reg_val);
+		       (u64)(reg_entry->reg_val));
 		opal_fadump_set_regval_regnum(regs,
 					      be32_to_cpu(reg_entry->reg_type),
 					      be32_to_cpu(reg_entry->reg_num),
-- 
2.35.1

