Return-Path: <linuxppc-dev+bounces-3140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C09C69AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 08:06:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpDq222Vmz2yYf;
	Wed, 13 Nov 2024 18:06:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731481598;
	cv=none; b=Ue2cpEjGkb+Cen+Qkd6AoPA+hNhKQryd8Ut9vWABv64hU/GyQwhZCraZfggwGei6V+wT5ST92lDLfktTjVh+x/Sfr13MvLuO16uL5lJOPySPEPW57v70SdfYdsQYBCAcW5hp30ky/Hqfk3/OZADgXoFCMKC6ZZofJp9hcqKoyqZPd+CTC8s5yV2XyMmkBtbbZG4NctKB5EG/fE5N+WJO5f7eX5nLIoGP/iecUkZ4AFFMyb3C2Fml4U4uPpDeTG91mxh1fkXrVm2/RtQDJrsJ94sSOpVbAJMIWagMPWI1FRtus3vUW9FS3EBHofZUDJ4SbnA63szcfJesTR1z6Uwr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731481598; c=relaxed/relaxed;
	bh=G6/UEAIJYHn2chGCKBaQexsRzPdmbZKSVhPt7X5zhnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bkfFyBhJH8qW4Wi4lz/sxpMj0DR2zQhKp+t8+CYfGSqaNpsR7+G3Bw39I8NMSO6Re04ZO1XPBUOi5ghtPsGEGyQlbJrAqUCEF+eJIrFmfLl42/eCqZpeXw4BHvhQd7XiLdxTEjEJHkfkH9N1+g8Hg0KkWVnQdQG3kkOeu2VpCFzLs/Oyu2/3twfFGuvdym2+mJOfKp8hQutYsSZYOpw72sLE2bxe+uN/Y/vyP+zkD31jR4hMhAeomfVX0OTSv0LbljZOfomWgYevFctBkFkBqcCxPbNSEJOUzXMYedPC2DtAa/Il9zw2N9pesr7AF6o0e0FJikagpLXQA9IOlUkiUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qJa9wGBu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qJa9wGBu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpDq10WRPz2yY9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 18:06:36 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD4AHJ0015762;
	Wed, 13 Nov 2024 07:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=G6/UEAIJYHn2chGCKBaQexsRzPdmbZKSVhPt7X5zh
	nM=; b=qJa9wGBu7hrwHuNsMFzDCJ/40NvJ56Uj/jSFvRh5Hf1KJLWzCz0T4789w
	iMtJWwTgKax7Q3sXkfwfWIpUxYfQAmo20iJYUjQoV6nSTi4Ln9VjPdOagMqyr7nQ
	NLpmNW/21klkqcvvB4fMDwiMNwm9g4WjgZzm0zqy4Gp9A8ICIwIzzH0VZEXhYwoc
	7sNpkBHjb0HM1BZjmI3zoRjLzHLweQCESWiEF/YJnPaNfdlfs4FkN0Bb0TPtZAaY
	cdpV/Go4/es+k1g5dFlEs7c/a7Nng6MRLEExXlibFheVCbVPniLVGVE4g58FMN95
	Imh8+q3owMylmSk7U3mlsGt09Ic3A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42vmuf0jaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:06:28 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AD76RMa007141;
	Wed, 13 Nov 2024 07:06:27 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42vmuf0jac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:06:27 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD5Pwfx002765;
	Wed, 13 Nov 2024 07:06:26 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 42tms15kds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:06:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AD76M7e42795440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Nov 2024 07:06:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 456102004B;
	Wed, 13 Nov 2024 07:06:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA2AC20049;
	Wed, 13 Nov 2024 07:06:20 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Nov 2024 07:06:20 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [PATCH v3 1/2] powerpc/fadump: allocate memory for additional parameters early
Date: Wed, 13 Nov 2024 12:36:17 +0530
Message-ID: <20241113070618.75744-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.46.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: foffbx_0VF4-fZh1ac1w6fqmvnptcK_E
X-Proofpoint-ORIG-GUID: Yf19nHWduqp8lj0EivHM6dm_k2muc1aO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 mlxlogscore=783
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Hari Bathini <hbathini@linux.ibm.com>

Memory for passing additional parameters to fadump capture kernel
is allocated during subsys_initcall level, using memblock. But
as slab is already available by this time, allocation happens via
the buddy allocator. This may work for radix MMU but is likely to
fail in most cases for hash MMU as hash MMU needs this memory in
the first memory block for it to be accessible in real mode in the
capture kernel (second boot). So, allocate memory for additional
parameters area as soon as MMU mode is obvious.

Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for dump capture kernel")
Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Closes: https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d@linux.vnet.ibm.com/T/#u
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Changelog:

Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
  - Drop extern keyword from fadump_setup_param_area function declaration
  - Don't use __va() while resetting param memory area

Since v2: https://lore.kernel.org/all/20241107055817.489795-1-sourabhjain@linux.ibm.com/
 - Update comment around fadump_setup_param_area() to indicate its
   dependency on MMU type
 - Add Reviewed-by tag
 - No functional change

---
 arch/powerpc/include/asm/fadump.h |  2 ++
 arch/powerpc/kernel/fadump.c      | 15 ++++++++++-----
 arch/powerpc/kernel/prom.c        |  7 +++++++
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index ef40c9b6972a..7b3473e05273 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -19,6 +19,7 @@ extern int is_fadump_active(void);
 extern int should_fadump_crash(void);
 extern void crash_fadump(struct pt_regs *, const char *);
 extern void fadump_cleanup(void);
+void fadump_setup_param_area(void);
 extern void fadump_append_bootargs(void);
 
 #else	/* CONFIG_FA_DUMP */
@@ -26,6 +27,7 @@ static inline int is_fadump_active(void) { return 0; }
 static inline int should_fadump_crash(void) { return 0; }
 static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
 static inline void fadump_cleanup(void) { }
+static inline void fadump_setup_param_area(void) { }
 static inline void fadump_append_bootargs(void) { }
 #endif /* !CONFIG_FA_DUMP */
 
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index a612e7513a4f..3a2863307863 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1586,6 +1586,12 @@ static void __init fadump_init_files(void)
 		return;
 	}
 
+	if (fw_dump.param_area) {
+		rc = sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr);
+		if (rc)
+			pr_err("unable to create bootargs_append sysfs file (%d)\n", rc);
+	}
+
 	debugfs_create_file("fadump_region", 0444, arch_debugfs_dir, NULL,
 			    &fadump_region_fops);
 
@@ -1740,7 +1746,7 @@ static void __init fadump_process(void)
  * Reserve memory to store additional parameters to be passed
  * for fadump/capture kernel.
  */
-static void __init fadump_setup_param_area(void)
+void __init fadump_setup_param_area(void)
 {
 	phys_addr_t range_start, range_end;
 
@@ -1748,7 +1754,7 @@ static void __init fadump_setup_param_area(void)
 		return;
 
 	/* This memory can't be used by PFW or bootloader as it is shared across kernels */
-	if (radix_enabled()) {
+	if (early_radix_enabled()) {
 		/*
 		 * Anywhere in the upper half should be good enough as all memory
 		 * is accessible in real mode.
@@ -1776,12 +1782,12 @@ static void __init fadump_setup_param_area(void)
 						       COMMAND_LINE_SIZE,
 						       range_start,
 						       range_end);
-	if (!fw_dump.param_area || sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr)) {
+	if (!fw_dump.param_area) {
 		pr_warn("WARNING: Could not setup area to pass additional parameters!\n");
 		return;
 	}
 
-	memset(phys_to_virt(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
+	memset((void *)fw_dump.param_area, 0, COMMAND_LINE_SIZE);
 }
 
 /*
@@ -1807,7 +1813,6 @@ int __init setup_fadump(void)
 	}
 	/* Initialize the kernel dump memory structure and register with f/w */
 	else if (fw_dump.reserve_dump_area_size) {
-		fadump_setup_param_area();
 		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
 		register_fadump();
 	}
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0be07ed407c7..7ac03655338d 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -908,6 +908,13 @@ void __init early_init_devtree(void *params)
 
 	mmu_early_init_devtree();
 
+	/*
+	 * Setup param area for passing additional parameters to the fadump
+	 * capture kernel. Since this depends on the MMU type, the function
+	 * must be called after the MMU type is finalized.
+	 */
+	fadump_setup_param_area();
+
 #ifdef CONFIG_PPC_POWERNV
 	/* Scan and build the list of machine check recoverable ranges */
 	of_scan_flat_dt(early_init_dt_scan_recoverable_ranges, NULL);
-- 
2.46.2


