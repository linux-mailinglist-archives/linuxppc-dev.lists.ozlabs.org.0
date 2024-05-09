Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 729E88C0F17
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 14:00:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UvVNYjGG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZrFF6lcwz3dRB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 22:00:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UvVNYjGG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZrBF6SvHz3cTh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 21:58:13 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 449BaDYl029303;
	Thu, 9 May 2024 11:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DTCorESddXM/KPd/FdeTUQjRKEenNnY9wvqIhrQjMV0=;
 b=UvVNYjGGtjR1R3cuSZe1wNCBeaoYHtv/Av4nXbJT7m49gym18vO1EzeLrhmaiE8/JyaE
 q8vhSxgYcDHshPV4ofzTRFO8OkJWqo/3fuFynWIstDxJb5Vsx/OWy65+1l8EkDiD9v6c
 iALLzA8jkKaST3drnpGyAQVd/TvDgfbvVYFqpLBy/nt8rEBmC1wW82Ev8kQghCnx/eXc
 W1jjsv0XhzQdXC0gCP9gggEMn8MUrm1/U8sumdVZRgtgglmSdguWH4dCpItA8IGOpYyJ
 VqvafCGpbBo+KPJMzev6f3eHfVaCJdZUgdxs+zl9pIwmoZGewFJiMcPDTLI0KiIU613L jQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y0wdtg2d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 11:58:08 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 449BnQ8H009781;
	Thu, 9 May 2024 11:58:08 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xyshutmsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 11:58:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 449Bw33Y49742120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 May 2024 11:58:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB0EB2004E;
	Thu,  9 May 2024 11:58:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A53720040;
	Thu,  9 May 2024 11:58:01 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 May 2024 11:58:01 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 3/3] powerpc/fadump: pass additional parameters when fadump is active
Date: Thu,  9 May 2024 17:27:55 +0530
Message-ID: <20240509115755.519982-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509115755.519982-1-hbathini@linux.ibm.com>
References: <20240509115755.519982-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LrGBUZEE2CK93ryvdCr4tWhubBRgCsuf
X-Proofpoint-ORIG-GUID: LrGBUZEE2CK93ryvdCr4tWhubBRgCsuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_06,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405090079
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Append the additional parameters passed/set in the dedicated parameter
area (RTAS_FADUMP_PARAM_AREA) to bootargs in fadump capture kernel.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump.h |  2 ++
 arch/powerpc/kernel/fadump.c      | 35 +++++++++++++++++++++++++++++++
 arch/powerpc/kernel/prom.c        |  3 +++
 3 files changed, 40 insertions(+)

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
index 6d35b09d6f3a..2276bacc4170 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -131,6 +131,41 @@ static int __init fadump_cma_init(void)
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
+	if (fw_dump.param_area >= fw_dump.boot_mem_top) {
+		if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
+			pr_warn("WARNING: Can't use additional parameters area!\n");
+			fw_dump.param_area = 0;
+			return;
+		}
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
index eb140ea6b6ff..60819751e55e 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -813,6 +813,9 @@ void __init early_init_devtree(void *params)
 	 */
 	of_scan_flat_dt(early_init_dt_scan_chosen_ppc, boot_command_line);
 
+	/* Append additional parameters passed for fadump capture kernel */
+	fadump_append_bootargs();
+
 	/* Scan memory nodes and rebuild MEMBLOCKs */
 	early_init_dt_scan_root();
 	early_init_dt_scan_memory_ppc();
-- 
2.45.0

