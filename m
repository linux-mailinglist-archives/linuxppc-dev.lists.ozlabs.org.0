Return-Path: <linuxppc-dev+bounces-7818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8419CA948BE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 20:09:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgc3L6fNvz3c44;
	Mon, 21 Apr 2025 04:09:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745172590;
	cv=none; b=oUSYBfVQgAN+nRjtOB2vfMnuddDdH9Dj0YsNd7ZMDQrUMqs1Au8h0hm5iN+ZoI1oBBzXMy5CjrmMfwtXu4dsMzkcafEQJOic2989BVE8oQ9leyHto2Wh7NSeVzAIMXh520db4YrmCVyZw9NDAYZfPc1AS2oFafv4Q8l6bo3eXltdjHHKRbZE83qNRR+NK18V2k3TxRr28CZgmXQe5PFdwSuePF8ggJX8pO/LHInm5GKURdBVbdKQIACQf2EjmnHEfQ3KxIN6djsD9V9vBS2EeICDWFm/mHNOAE1lz2jYOSUpagwGpVVbuWIBo6VaCux58WVK3snB2HQdEx7u7cprzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745172590; c=relaxed/relaxed;
	bh=GiLiKixX6iLehk9FK7NqA5EKIkfAdIjuuWha4xRgpYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oZxmDZWbHuQV/85FX3iXwAizjw+e55RMD5rcxXswFmU7ShmnlfbIDRh6iI4PqM4EXtMUJOzdnI4r3zINWHJsb4O6abBZClLnL3FvHdb0hNKfuDi55HCRCaOyke3l7wRrVBvJK+Aq1vJp4SDG4r+ZJO1ra2YkoMD7H6rewbMuk+hPOqrv6mNxnEpPitfl7WJOPwuWsUNwdjGdmWFIes6zC5RjbBbAhWepFr24pDDwxkRcJJgR5aBUX+ekPw63MK91pWbGKXech8N7xmWr75A9L5ckhQ6YZHwdyV5w3dnWyKC8U25knaIsETCkGYX+b1P+NeJbtMRELeenpIla6ReE7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AXNetoas; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AXNetoas;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgc3L0sTWz3c2P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 04:09:49 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KB1vxt011608
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=GiLiKixX6iLehk9FK
	7NqA5EKIkfAdIjuuWha4xRgpYw=; b=AXNetoas1a/z0s252fGRRcnCIF5N+PGIq
	G1+L7H0+AEi2Y6laIe3JIwkJMQGdE8OSs4cQZJUjaeN7WGYjoNObS/DIOTxjXpuh
	XyCwyVqMiKqqH3un2k75Td7U/YDvq28yEyZpnR9BjRNtM9kOd/YBRia9NOj3hyqS
	cOaBeDlVf5+pPZvMeWJLt1+yKBgsLo9AWh1DX66BCvPcrn+BBJk6Lqaoim2hL1aV
	D4IrNM3ZDnb1h0xV+GNMaYGlP6+gXZArh32fb2GtCxr7gObQ+Djnrvrj/GsGNYn3
	gEFmtQ2HONha0pmd3ZYTC6vgMrxU2XziSXArc4iDlizqx3oOpeuow==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464kyv2nbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:47 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53KGigbG003021
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:47 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464q5nav4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:47 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53KI9gqO50463046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:42 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 325C120043;
	Sun, 20 Apr 2025 18:09:42 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA7D620040;
	Sun, 20 Apr 2025 18:09:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.217])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 18:09:36 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V3 7/9] powerpc/pseries/htmdump: Add htm flags support to htmdump module
Date: Sun, 20 Apr 2025 23:38:42 +0530
Message-Id: <20250420180844.53128-8-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250420180844.53128-1-atrajeev@linux.ibm.com>
References: <20250420180844.53128-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: lx5WMUYgvIIq3XQuYHAAOjx-7FdMeOrI
X-Proofpoint-ORIG-GUID: lx5WMUYgvIIq3XQuYHAAOjx-7FdMeOrI
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6805386b cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=Ri-ALIyKtE-1nQoya48A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_08,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200148
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Under debugfs folder, "/sys/kernel/debug/powerpc/htmdump", add file
"htmflags". Currently supported flag value is to enable/disable
HTM buffer wrap. wrap is used along with "configure" to prevent
HTM buffer from wrapping. Writing 1 will set noWrap while
configuring HTM

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
 arch/powerpc/include/asm/plpar_wrappers.h |  4 +-
 arch/powerpc/platforms/pseries/htmdump.c  | 57 +++++++++++++++++++----
 2 files changed, 50 insertions(+), 11 deletions(-)

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
index 39657e8655cb..dc5cdcd8c3c3 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -21,10 +21,13 @@ static u32 htmtype;
 static u32 htmconfigure;
 static u32 htmstart;
 static u32 htmsetup;
+static u64 htmflags;
 
 static struct dentry *htmdump_debugfs_dir;
 #define	HTM_ENABLE	1
 #define	HTM_DISABLE	0
+#define	HTM_NOWRAP	1
+#define	HTM_WRAP	0
 
 /*
  * Check the return code for H_HTM hcall.
@@ -94,7 +97,7 @@ static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
 	 * - operation as htm dump (H_HTM_OP_DUMP_DATA)
 	 * - last three values are address, size and offset
 	 */
-	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+	rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 				   htmtype, H_HTM_OP_DUMP_DATA, virt_to_phys(htm_buf),
 				   PAGE_SIZE, page);
 
@@ -119,6 +122,7 @@ static const struct file_operations htmdump_fops = {
 static int  htmconfigure_set(void *data, u64 val)
 {
 	long rc, ret;
+	unsigned long param1 = -1, param2 = -1;
 
 	/*
 	 * value as 1 : configure HTM.
@@ -129,17 +133,25 @@ static int  htmconfigure_set(void *data, u64 val)
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
 	} else if (val == HTM_DISABLE) {
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
@@ -177,7 +189,7 @@ static int  htmstart_set(void *data, u64 val)
 		 * - operation as htm start (H_HTM_OP_START)
 		 * - last three values are unused, hence set to zero
 		 */
-		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+		rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 			   htmtype, H_HTM_OP_START, 0, 0, 0);
 
 	} else if (val == HTM_DISABLE) {
@@ -186,7 +198,7 @@ static int  htmstart_set(void *data, u64 val)
 		 * - operation as htm stop (H_HTM_OP_STOP)
 		 * - last three values are unused, hence set to zero
 		 */
-		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+		rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 				htmtype, H_HTM_OP_STOP, 0, 0, 0);
 	} else
 		return -EINVAL;
@@ -223,7 +235,7 @@ static ssize_t htmstatus_read(struct file *filp, char __user *ubuf,
 	 * - operation as htm status (H_HTM_OP_STATUS)
 	 * - last three values as addr, size and offset
 	 */
-	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+	rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 				   htmtype, H_HTM_OP_STATUS, virt_to_phys(htm_status_buf),
 				   PAGE_SIZE, 0);
 
@@ -269,7 +281,7 @@ static ssize_t htminfo_read(struct file *filp, char __user *ubuf,
 	 * - operation as htm status (H_HTM_OP_STATUS)
 	 * - last three values as addr, size and offset
 	 */
-	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+	rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 				   htmtype, H_HTM_OP_DUMP_SYSPROC_CONF, virt_to_phys(htm_info_buf),
 				   PAGE_SIZE, 0);
 
@@ -311,7 +323,7 @@ static int  htmsetup_set(void *data, u64 val)
 	 * - parameter 1 set to input value.
 	 * - last two values are unused, hence set to zero
 	 */
-	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+	rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
 			htmtype, H_HTM_OP_SETUP, val, 0, 0);
 
 	ret = htm_return_check(rc);
@@ -332,9 +344,35 @@ static int htmsetup_get(void *data, u64 *val)
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
+	if (val == HTM_NOWRAP)
+		htmflags = H_HTM_FLAGS_NOWRAP;
+	else if (val == HTM_WRAP)
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
@@ -363,6 +401,7 @@ static int htmdump_init_debugfs(void)
 	debugfs_create_file("htmconfigure", 0600, htmdump_debugfs_dir, NULL, &htmconfigure_fops);
 	debugfs_create_file("htmstart", 0600, htmdump_debugfs_dir, NULL, &htmstart_fops);
 	debugfs_create_file("htmsetup", 0600, htmdump_debugfs_dir, NULL, &htmsetup_fops);
+	debugfs_create_file("htmflags", 0600, htmdump_debugfs_dir, NULL, &htmflags_fops);
 
 	/* Debugfs interface file to present status of HTM */
 	htm_status_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-- 
2.43.0


