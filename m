Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2781805F59
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 21:22:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dtikExE2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlBlX3DjTz3vbp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 07:22:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dtikExE2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlBgv47qYz3cWW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 07:18:51 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B5KDT6H003779;
	Tue, 5 Dec 2023 20:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=28cdqMsE9LwTxE1nlyWY/zjclGZZWIJKgOtfCalZDqg=;
 b=dtikExE2PCcUGC3kol41yqHDQM8JJRyvCJC+c5mqPaeEd4a68eqL6WMDibmOqIQS+Bvy
 crCuLCDmP/lK1GysJsfHakwH7D83vWW7oLXOuXPP5AlAuOLcuPIQu8RQvAEVvcTKxsz8
 CeJcbtV9ynDKoPH8Yysy+M3SxUils58Hf9zzLaUBrn709E1eJKesnnmYkPjExa6lUBoc
 Z+7ytlJF2BJFXP3qJ+ca0IA6aq2FAnOMS0evAc39jPY2/4W843h57dyQe8+pwLnnFT4H
 VF41pGrWogIlYgvsqQGNob35hlfFP4KZ9RAT7ZcyvgsBxMTWRc0GfsPdEAAxUXnUjKQC wA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3utaq9g414-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 20:18:47 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B5J4n9Z009911;
	Tue, 5 Dec 2023 20:18:46 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3urh4kgqx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 20:18:46 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B5KIhC67799326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Dec 2023 20:18:43 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94C1C20049;
	Tue,  5 Dec 2023 20:18:43 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4223620040;
	Tue,  5 Dec 2023 20:18:42 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.30.216])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Dec 2023 20:18:42 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 3/3] powerpc/fadump: pass additional parameters when fadump is active
Date: Wed,  6 Dec 2023 01:48:35 +0530
Message-ID: <20231205201835.388030-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205201835.388030-1-hbathini@linux.ibm.com>
References: <20231205201835.388030-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N280NqocDSvJ6T9BDPMoRnQ-o4cJRuyL
X-Proofpoint-GUID: N280NqocDSvJ6T9BDPMoRnQ-o4cJRuyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_16,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=935
 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312050161
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Append the additional parameters passed/set in the dedicated parameter
area (RTAS_FADUMP_PARAM_AREA) to bootargs in fadump capture kernel.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump.h |  2 ++
 arch/powerpc/kernel/fadump.c      | 34 +++++++++++++++++++++++++++++++
 arch/powerpc/kernel/prom.c        |  3 +++
 3 files changed, 39 insertions(+)

diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index 526a6a647312..ef40c9b6972a 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -19,12 +19,14 @@ extern int is_fadump_active(void);
 extern int should_fadump_crash(void);
 extern void crash_fadump(struct pt_regs *, const char *);
 extern void fadump_cleanup(void);
+extern void fadump_append_bootargs(void);
 
 #else	/* CONFIG_FA_DUMP */
 static inline int is_fadump_active(void) { return 0; }
 static inline int should_fadump_crash(void) { return 0; }
 static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
 static inline void fadump_cleanup(void) { }
+static inline void fadump_append_bootargs(void) { }
 #endif /* !CONFIG_FA_DUMP */
 
 #if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 98f089747ac9..9b1601f99f72 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -133,6 +133,40 @@ static int __init fadump_cma_init(void)
 static int __init fadump_cma_init(void) { return 1; }
 #endif /* CONFIG_CMA */
 
+/*
+ * Additional parameters meant for capture kernel are placed in a dedicated area.
+ * If this is capture kernel boot, append these parameters to bootargs.
+ */
+void __init fadump_append_bootargs(void)
+{
+	char *append_args;
+	size_t len;
+
+	if (!fw_dump.dump_active || !fw_dump.param_area_supported || !fw_dump.param_area)
+		return;
+
+	/* TODO: What to do if this overlaps with reserve area (radix case?) */
+	if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
+		pr_warn("WARNING: Can't use additional parameters area!\n");
+		fw_dump.param_area = 0;
+		return;
+	}
+
+	append_args = (char *)fw_dump.param_area;
+	len = strlen(boot_command_line);
+
+	/*
+	 * Too late to fail even if cmdline size exceeds. Truncate additional parameters
+	 * to cmdline size and proceed anyway.
+	 */
+	if (len + strlen(append_args) >= COMMAND_LINE_SIZE - 1)
+		pr_warn("WARNING: Appending parameters exceeds cmdline size. Truncating!\n");
+
+	pr_debug("Cmdline: %s\n", boot_command_line);
+	snprintf(boot_command_line + len, COMMAND_LINE_SIZE - len, " %s", append_args);
+	pr_info("Updated cmdline: %s\n", boot_command_line);
+}
+
 /* Scan the Firmware Assisted dump configuration details. */
 int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 				      int depth, void *data)
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b..00a03d476cb9 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -791,6 +791,9 @@ void __init early_init_devtree(void *params)
 	 */
 	of_scan_flat_dt(early_init_dt_scan_chosen_ppc, boot_command_line);
 
+	/* Append additional parameters passed for fadump capture kernel */
+	fadump_append_bootargs();
+
 	/* Scan memory nodes and rebuild MEMBLOCKs */
 	early_init_dt_scan_root();
 	early_init_dt_scan_memory_ppc();
-- 
2.43.0

