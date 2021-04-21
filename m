Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E14583671FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 19:51:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQSm66LPwz30FQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 03:51:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XNw/IoEm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=tngu=js=linux.ibm.com=hbathini@ozlabs.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XNw/IoEm; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQSlg46dsz2yjB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 03:51:11 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4FQSlg1Yqkz9sVw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 03:51:11 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FQSlg1NMNz9sVv; Thu, 22 Apr 2021 03:51:11 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XNw/IoEm; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4FQSlf4cV8z9sVq;
 Thu, 22 Apr 2021 03:51:09 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LHXc69057517; Wed, 21 Apr 2021 13:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=M1Xfg5sNwmEiCEqv1b87tqO8RUnZrEVGFMZPe0KBf6c=;
 b=XNw/IoEm+rGRDtvvpC/4C85RHdxpc0h4aMCn78CTAy3BgTVUvdomimuqZ/r4WA03CFfo
 Oa6byyP8FdRPtPghX4bY4UzwSKdjzb2QqLwAaUJmJ16f8W8M8tsXAm6CWpRhqJTrS/hb
 WQT6oRnpapphSzYJlETscKZiYSYLPiREPQlbwu6OshnQd2eomypcQ3dgWFcS3tU/1bkZ
 nnrGL3Kb3DpL7oOVTkSDaSVblTFKg6MeKL8BCiFCnJBLl7NWXIaFCbMDvPEK+R/RLhdA
 tsaie7LpuP//vvXaBivQ5lTaPxzfABzkVvpclRDYwgOhOmhJ/5tJDibjB+ofgebPk8Bl 8A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382mtkgspu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 13:51:07 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13LHXuvh021229;
 Wed, 21 Apr 2021 17:51:05 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 37ypxh9bgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 17:51:05 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13LHoeJL34144716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 17:50:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39100AE04D;
 Wed, 21 Apr 2021 17:51:03 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07CC2AE051;
 Wed, 21 Apr 2021 17:51:02 +0000 (GMT)
Received: from [192.168.0.9] (unknown [9.211.129.195])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Apr 2021 17:51:01 +0000 (GMT)
Subject: [PATCH] opal/fadump: fix fadump to work with a different endian
 capture kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:20:52 +0530
Message-ID: <161902744901.86147.14719228311655123526.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TYqwZzUWriIOjzqvyh7myOyv5d5BrPMD
X-Proofpoint-GUID: TYqwZzUWriIOjzqvyh7myOyv5d5BrPMD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-21_05:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210124
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dump capture would fail if capture kernel is not of the endianess as
the production kernel, because the in-memory data structure (struct
opal_fadump_mem_struct) shared across production kernel and capture
kernel assumes the same endianess for both the kernels, which doesn't
have to be true always. Fix it by having a well-defined endianess for
struct opal_fadump_mem_struct.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-fadump.c |   94 ++++++++++++++------------
 arch/powerpc/platforms/powernv/opal-fadump.h |   10 +--
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


