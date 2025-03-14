Return-Path: <linuxppc-dev+bounces-7070-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474D9A6132F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:57:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDmBf0DMjz3cZ1;
	Sat, 15 Mar 2025 00:56:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960617;
	cv=none; b=MYQWKEnXmlLAjUnuIXwFAEQYy3G2N97YWQY1fZKUj/+6PgCt2gfxVhheheZyiNsQzHs4cPKlqNM9Btt2sKAc4F2eDoiz/OAolE3ry4vAV23fppTxr73PjObNEPSR2EZaQBFeAMBGB7RSVad6pjJezHW89d2DWdRs0TL4YraPJQFlY0wicDpiWfO0dHdLKOI30PQ9IrIcqi/UlRGjU0fQbzUHhx7UBlpmYmBaQSGSORJ3DRrDrOLvwub8M6/y5zTYvW7bYLdw62zne1e/vRudfUeNvYIhEST6AowzlODm2hYfkNfSdb7/qxB5qgoczot8e15ZgZXIV0umFtw/GYzkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960617; c=relaxed/relaxed;
	bh=4bUt/h0o+ORmQwovx+L1rA3Rfl14295zHijCUqhHMNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GvtPldCxQ16A5fzCAGUheHW0V6i5/QnkXEc2RT3gItE7fYubG6zXSC7ZZ0v5JkuizvJ1RttNaIVTxxKexYO8Yrg42PUrmh6xkXkLT3HJ69i1FGWyclugALpzMcqH1ZrbBO3xCOmlehwusVxT9hmGjKmFNqNBKw+UTeO50RUCfMW64R7e4uF11uHu4OC6hxTrHIlElxjyaZGj/SqSHY+oxwO2ZO9qCrheeJjATcZxwq61HWFIKQjuiG3n8GKc8mvTmYNjjlp/bHsEwMr9R1wgffZa0xYDWVEaTl96V4DMaGOTAyOjCGn6Eqm+m9PNCEOTXlvoMxQKqAArm4rr6lmWkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PROmmSVi; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PROmmSVi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDmBd2GRmz3cYw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:56:57 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EAOtRG018092
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=4bUt/h0o+ORmQwovx
	+L1rA3Rfl14295zHijCUqhHMNc=; b=PROmmSVie7t8EyHgeZtIdNA/dEkN+U1KW
	2sK3DMkDK7A3tMjQss3Ipd3CGMlmdf9JoK7A7VejmEkch0ZAor+boqap9Ulelx1q
	u0jmduLgYuScw6K6do7zp6XseBK5Yh3addxDlcQKoUzQhnbbjcn/dhuGNhtnjd9K
	fA/PsAM734kCBQOJXOAsfoNl3VzR1wppSR3stBtvfu5Tlqs4wZsPUYYWqqH/S6q6
	Ut1U84o03t0JN1kLKNKSqEkJkMJEXPghlnm3SDqT0x35m+dsZnjPDlM1L0Dz9sy9
	cm7s8Dv25aKDt99qZI70DcW5DDLxNqKKGnzcQjj7Qa3OYTv9+6vyQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0sre522-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECYftF012255
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:40 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsrq6nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:39 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EDuVZm14746012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 13:56:32 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE8F820040;
	Fri, 14 Mar 2025 13:56:31 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A083C20043;
	Fri, 14 Mar 2025 13:56:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.102])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 13:56:26 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH 7/9] powerpc/pseries/htmdump: Add htm flags support to htmdump module
Date: Fri, 14 Mar 2025 19:25:39 +0530
Message-Id: <20250314135541.1831-8-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250314135541.1831-1-atrajeev@linux.ibm.com>
References: <20250314135541.1831-1-atrajeev@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _8PbzQfy4MUweYCRKjsuNLZm_zimj1iJ
X-Proofpoint-GUID: _8PbzQfy4MUweYCRKjsuNLZm_zimj1iJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Under debugfs folder, "/sys/kernel/debug/powerpc/htmdump", add file
"htmflags". Currently supported flag value is to enable/disable
HTM buffer wrap. wrap is used along with "configure" to prevent
HTM buffer from wrapping. Writing 1 will set noWrap while
configuring HTM

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/include/asm/plpar_wrappers.h |  4 +-
 arch/powerpc/platforms/pseries/htmdump.c  | 55 +++++++++++++++++++----
 2 files changed, 48 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index f3efa9946b3c..f2b6cc4341bb 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -81,12 +81,12 @@ static inline long htm_call(unsigned long flags, unsigned long target,
                                  param1, param2, param3);
 }
 
-static inline long htm_hcall_wrapper(unsigned long nodeindex,
+static inline long htm_hcall_wrapper(unsigned long flags, unsigned long nodeindex,
                unsigned long nodalchipindex, unsigned long coreindexonchip,
 	       unsigned long type, unsigned long htm_op, unsigned long param1, unsigned long param2,
 	       unsigned long param3)
 {
-       return htm_call(H_HTM_FLAGS_HARDWARE_TARGET,
+	return htm_call(H_HTM_FLAGS_HARDWARE_TARGET | flags,
                        H_HTM_TARGET_NODE_INDEX(nodeindex) |
                        H_HTM_TARGET_NODAL_CHIP_INDEX(nodalchipindex) |
                        H_HTM_TARGET_CORE_INDEX_ON_CHIP(coreindexonchip),
diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index cadb0ad6ba31..0b3bed738db5 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -21,6 +21,7 @@ static u32 htmtype;
 static u32 htmconfigure;
 static u32 htmstart;
 static u32 htmsetup;
+static u64 htmflags;
 
 static struct dentry *htmdump_debugfs_dir;
 
@@ -92,7 +93,7 @@ static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
 	 * - operation as htm dump (H_HTM_OP_DUMP_DATA)
 	 * - last three values are address, size and offset
 	 */
-	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+	rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 				   htmtype, H_HTM_OP_DUMP_DATA, virt_to_phys(htm_buf),
 				   PAGE_SIZE, page);
 
@@ -115,6 +116,7 @@ static const struct file_operations htmdump_fops = {
 static int  htmconfigure_set(void *data, u64 val)
 {
 	long rc, ret;
+	unsigned long param1 = -1, param2 = -1;
 
 	/*
 	 * value as 1 : configure HTM.
@@ -125,17 +127,25 @@ static int  htmconfigure_set(void *data, u64 val)
 		/*
 		 * Invoke H_HTM call with:
 		 * - operation as htm configure (H_HTM_OP_CONFIGURE)
+		 * - If htmflags is set, param1 and param2 will be -1
+		 *   which is an indicator to use default htm mode reg mask
+		 *   and htm mode reg value.
 		 * - last three values are unused, hence set to zero
 		 */
-		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
-			   htmtype, H_HTM_OP_CONFIGURE, 0, 0, 0);
+		if (!htmflags) {
+			param1 = 0;
+			param2 = 0;
+		}
+
+		rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
+			   htmtype, H_HTM_OP_CONFIGURE, param1, param2, 0);
 	} else if (val == 0) {
 		/*
 		 * Invoke H_HTM call with:
 		 * - operation as htm deconfigure (H_HTM_OP_DECONFIGURE)
 		 * - last three values are unused, hence set to zero
 		 */
-		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+		rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 				htmtype, H_HTM_OP_DECONFIGURE, 0, 0, 0);
 	} else
 		return -EINVAL;
@@ -171,7 +181,7 @@ static int  htmstart_set(void *data, u64 val)
 		 * - operation as htm start (H_HTM_OP_START)
 		 * - last three values are unused, hence set to zero
 		 */
-		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+		rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 			   htmtype, H_HTM_OP_START, 0, 0, 0);
 
 	} else if (val == 0) {
@@ -180,7 +190,7 @@ static int  htmstart_set(void *data, u64 val)
 		 * - operation as htm start (H_HTM_OP_STOP)
 		 * - last three values are unused, hence set to zero
 		 */
-		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+		rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 				htmtype, H_HTM_OP_STOP, 0, 0, 0);
 	} else
 		return -EINVAL;
@@ -215,7 +225,7 @@ static ssize_t htmstatus_read(struct file *filp, char __user *ubuf,
 	 * - operation as htm status (H_HTM_OP_STATUS)
 	 * - last three values as addr, size and offset
 	 */
-	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+	rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 				   htmtype, H_HTM_OP_STATUS, virt_to_phys(htm_status_buf),
 				   PAGE_SIZE, 0);
 
@@ -259,7 +269,7 @@ static ssize_t htminfo_read(struct file *filp, char __user *ubuf,
 	 * - operation as htm status (H_HTM_OP_STATUS)
 	 * - last three values as addr, size and offset
 	 */
-	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+	rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 				   htmtype, H_HTM_OP_DUMP_SYSPROC_CONF, virt_to_phys(htm_info_buf),
 				   PAGE_SIZE, 0);
 
@@ -299,7 +309,7 @@ static int  htmsetup_set(void *data, u64 val)
 	 * - parameter 1 set to input value.
 	 * - last two values are unused, hence set to zero
 	 */
-	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+	rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 			htmtype, H_HTM_OP_SETUP, val, 0, 0);
 
 	ret = htm_return_check(rc);
@@ -318,9 +328,35 @@ static int htmsetup_get(void *data, u64 *val)
 	return 0;
 }
 
+static int  htmflags_set(void *data, u64 val)
+{
+	/*
+	 * Input value:
+	 * Currently supported flag value is to enable/disable
+	 * HTM buffer wrap. wrap is used along with "configure"
+	 * to prevent HTM buffer from wrapping.
+	 * Writing 1 will set noWrap while configuring HTM
+	 */
+	if (val == 1)
+		htmflags = H_HTM_FLAGS_NOWRAP;
+	else if (val == 0)
+		htmflags = 0;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int htmflags_get(void *data, u64 *val)
+{
+	*val = htmflags;
+	return 0;
+}
+
 DEFINE_SIMPLE_ATTRIBUTE(htmconfigure_fops, htmconfigure_get, htmconfigure_set, "%llu\n");
 DEFINE_SIMPLE_ATTRIBUTE(htmstart_fops, htmstart_get, htmstart_set, "%llu\n");
 DEFINE_SIMPLE_ATTRIBUTE(htmsetup_fops, htmsetup_get, htmsetup_set, "%llu\n");
+DEFINE_SIMPLE_ATTRIBUTE(htmflags_fops, htmflags_get, htmflags_set, "%llu\n");
 
 static int htmdump_init_debugfs(void)
 {
@@ -349,6 +385,7 @@ static int htmdump_init_debugfs(void)
 	debugfs_create_file("htmconfigure", 0600, htmdump_debugfs_dir, NULL, &htmconfigure_fops);
 	debugfs_create_file("htmstart", 0600, htmdump_debugfs_dir, NULL, &htmstart_fops);
 	debugfs_create_file("htmsetup", 0600, htmdump_debugfs_dir, NULL, &htmsetup_fops);
+	debugfs_create_file("htmflags", 0600, htmdump_debugfs_dir, NULL, &htmflags_fops);
 
 	/* Debugfs interface file to present status of HTM */
 	htm_status_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-- 
2.43.5


