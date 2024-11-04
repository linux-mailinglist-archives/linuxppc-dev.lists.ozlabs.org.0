Return-Path: <linuxppc-dev+bounces-2819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 954FA9BAE3D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 09:36:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhlFB38RTz2xb3;
	Mon,  4 Nov 2024 19:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730709406;
	cv=none; b=Rq+uCvJmgSNIxvmjRT7SYLJN2hpZlTSSWNo4CVQE5Ke6YJORTWhbuAoe6HqAtNo7xAayinRTNkCitJ4AO9nvbvHlrKvGU16kYPRhGfg/w50qutW6UYV+C/+1Oa5qvd9KflPNAwsetGI/IoF+Twyk+dPkjkSIM7sYkxmI43RVdc7ADWi2GDP2oTcUSyKAXNyFVpmDD4/0T3+iU6Zd3fdBqxNooiszhar8bAIrO6qdVQgh7TmpCAu57Evtf24q4GWP7R70SDX1G2QdEg8CfYR50az6T71lEpUvaKolEvZzM8cgq8JLH7RGgOPw6eqzoRZw5fggFDc7SwwJMDKW9I5CAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730709406; c=relaxed/relaxed;
	bh=t9jyRlrZkCDIkkHgATAK9H78at6NJAEg456qhfFvlQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nIDvwVttHTzlyd4+eP/Wper++wAyowTJSNOiT9gweeNry994YqFE0+p+LW7EaYgZF/gaYW95VpdZRw4eanjL31zzDvUBHctCkyQePg1NHGixRdkE1Ry4kfnK2tFOeVEqG9liwQDRpbnRn6fNvzlaS2Mgv602eYk1EHS2dJIH6CrSGWTLjFbyL6Ba/mKI5ewkDDH9N+G1FW8HAfwtr4J3SOnD9Y2AlKQqgiewKpLtHCgRjoYOWAmeefpAUjm8QZHsTKxO90TXpZaL5o1U+r5dEz9NnxFlNeZ6A8jG2xzB8JHXL9xoYano26nHEmbb6eVbGjHxONCnR3eCt22E5g2a4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SBWb1nz1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SBWb1nz1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhlF90t7Dz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 19:36:44 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A48AYlo021750;
	Mon, 4 Nov 2024 08:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=t9jyRlrZkCDIkkHgATAK9H78at6NJAEg456qhfFvl
	Q8=; b=SBWb1nz12rHhvHFAxFRFZ5JjjA3E3ZFvpZYPf5pOToQr4ZgQhPNCrLkRA
	JQ+rQ/I5d6VwbxxE2jKw1U6aEp8AIgb93k/QNhePZh8yN8F7re0V7ixukAoDsmVV
	8jiHDqhPh9Shx5ZNN9L63gctrqO47O9rImgwrZUrfoSnQuEDfEJo05RaibSRBWn8
	aK1n62EJX9+ne9wctLubIybxSzPyIVuluonjTphtZm2H0qSvTUdef/OpmZacaDFD
	NXHC0/zVu3FSIBuzLkQuYwc22dGYUAdTL893ESBpz5EOJidTLFjt26Ctp8B4UpB2
	tDvUdMc32vdtELxXDHriFRVsJHpRA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pth702er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 08:36:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A48L8ju024174;
	Mon, 4 Nov 2024 08:35:37 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nxsxug27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 08:35:36 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A48ZXVn57999762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Nov 2024 08:35:33 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EF5220043;
	Mon,  4 Nov 2024 08:35:33 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D47F2004D;
	Mon,  4 Nov 2024 08:35:31 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Nov 2024 08:35:31 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [PATCH 1/2] powerpc/fadump: allocate memory for additional parameters early
Date: Mon,  4 Nov 2024 14:05:27 +0530
Message-ID: <20241104083528.99520-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.46.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0NuM4_Hsh38fB9q2Mxg3N0p63k6X-TGx
X-Proofpoint-GUID: 0NuM4_Hsh38fB9q2Mxg3N0p63k6X-TGx
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=740 spamscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040076
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
the first memory block for it to be accesible in real mode in the
capture kernel (second boot). So, allocate memory for additional
parameters area as soon as MMU mode is obvious.

Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for dump capture kernel")
Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Closes: https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d@linux.vnet.ibm.com/T/#u
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump.h |  2 ++
 arch/powerpc/kernel/fadump.c      | 15 ++++++++++-----
 arch/powerpc/kernel/prom.c        |  3 +++
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index ef40c9b6972a..978102c5129e 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -19,6 +19,7 @@ extern int is_fadump_active(void);
 extern int should_fadump_crash(void);
 extern void crash_fadump(struct pt_regs *, const char *);
 extern void fadump_cleanup(void);
+extern void fadump_setup_param_area(void);
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
index a612e7513a4f..4a3f80f42118 100644
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
+	memset(__va(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
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
index 0be07ed407c7..47db1b1aef25 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -908,6 +908,9 @@ void __init early_init_devtree(void *params)
 
 	mmu_early_init_devtree();
 
+	/* Setup param area for passing additional parameters to fadump capture kernel. */
+	fadump_setup_param_area();
+
 #ifdef CONFIG_PPC_POWERNV
 	/* Scan and build the list of machine check recoverable ranges */
 	of_scan_flat_dt(early_init_dt_scan_recoverable_ranges, NULL);
-- 
2.46.2


