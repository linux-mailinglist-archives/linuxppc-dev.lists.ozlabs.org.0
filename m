Return-Path: <linuxppc-dev+bounces-7812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2758A948B5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 20:09:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgc2f3hDhz2yqc;
	Mon, 21 Apr 2025 04:09:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745172554;
	cv=none; b=gQrrsJQKeeQNfa5XOah5KLj/Jb8rGVmz3y4HbdgMj/H79tEOciIMiiaLtnG4SWcL6ltCHdVvm9FV3bw7rNGEaTDkxC1J3Zra4ZElAK0YlCw6JqOftqWSAkDRFiRdISWBu2TBeVmDMD3qJyRe/KrvrzFsRoSLraj0WtjH+KjkJ6d1evYK8AqPFfZ098XvrNDk6KgOefHchqSbOt4mEoLqjk125vTb33KeqPKb1xZDnbD+qfv+e0SD7VVQNOF6+wWWIo1BW9KNjrrXJYMoMBKwtcrTFqLHrre0l+fklJ3hTpAbJ0F/cEU6QMInrySPkbeA7rUt2IoZnyT/kDZqHXxhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745172554; c=relaxed/relaxed;
	bh=vfeYa5bA31OCo70H69Oab0RJU3GCxCAmq2HdDVc7bhU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l2LQjyW9N18LuTqM/FUhAwUxVshd4Whb+AeBDqSwM+Ru+jdEmL37n8jlaFdmB1QTqb4nQ3MzAOJWYIgjomoovWZGqM5V0u3Gq8LDzRf09dw5h68RhbxtgtM/gtq3G3dSw1PXoBY+Vsk/yL+vA9M90v2vZ3UvcOXt3nM9rWoYlx4jhjIEnxCtvKfjfsnQklwJXjTCQ09ChaZ8cu6LUFo3AwiJMbB8ck5kL7tYaseMjcxCCbR+yEEDInqUrmTU7q48fUz4NDwboqUg1qREMIya3TzxN3euJECKlKlTgGXueGd3jXXOAVdH35srbix3Faq66fDNYGYpfmZ6I9RVJG4QCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZNor9+eP; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZNor9+eP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgc2d41scz2yST
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 04:09:13 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KAuJtu003175
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vfeYa5bA31OCo70H6
	9Oab0RJU3GCxCAmq2HdDVc7bhU=; b=ZNor9+ePDL1iBPxs8vMzXc6srNgHBcnrg
	Ib4p75rZqW+kIx1hW81vbVmzRUNHjM7XZSEO8G/CTiQYr5nuADjVEfkm9Xlnj42o
	lTYByrf02YqzgbjyQi+0oKf9HbIut1GaEBJiNXx7b/Z/bxwWDVuKhLpmD6YTucX1
	hW+V7s9oVV6cX3Q78/baduKNUfLyo0ogM/tI9nloil5FYTWcgwdLBMlnqzxRPQ/3
	WOtdsvq4LvPkq5oh6Hi+gMebFvLOtJqpDS7WBZuqmfeqXZciOctp3tR4iBfINO5A
	lmluoO0RzBfHSMvvbZlDowxDpnH/1sCz+kQ+XavtR9JLLjNQiKRXQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464kyv2nb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53KFTAGx012355
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5su2nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53KI949O53346576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1B232004B;
	Sun, 20 Apr 2025 18:09:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB04620040;
	Sun, 20 Apr 2025 18:08:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.217])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 18:08:58 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V3 1/9] powerpc/pseries/htmdump: Add htm_hcall_wrapper to integrate other htm operations
Date: Sun, 20 Apr 2025 23:38:36 +0530
Message-Id: <20250420180844.53128-2-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: oT9oarfhgCLM5-ChmJwiaFBFf67C-XZQ
X-Proofpoint-ORIG-GUID: oT9oarfhgCLM5-ChmJwiaFBFf67C-XZQ
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=68053846 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=1fq2vgLfMoUJds7sEgMA:9
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

H_HTM (Hardware Trace Macro) hypervisor call is an HCALL to export data
from Hardware Trace Macro (HTM) function. The debugfs interface to
export the HTM function data in an lpar currently supports only dumping
of HTM data in an lpar. To add support for setup, configuration and
control of HTM function via debugfs interface, update the hcall wrapper
function. Rename and update htm_get_dump_hardware to htm_hcall_wrapper()
so that it can be used for other HTM operations as well. Additionally
include parameter "htm_op". Update htmdump module to check the return
code of hcall in a separate function so that it can be reused for other
option too. Add check to disable the interface in guest environment.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
 arch/powerpc/include/asm/plpar_wrappers.h | 18 +++++--
 arch/powerpc/platforms/pseries/htmdump.c  | 63 ++++++++++++++++++-----
 2 files changed, 63 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 91be7b885944..f3efa9946b3c 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -65,6 +65,14 @@ static inline long register_dtl(unsigned long cpu, unsigned long vpa)
 	return vpa_call(H_VPA_REG_DTL, cpu, vpa);
 }
 
+/*
+ * Invokes H_HTM hcall with parameters passed from htm_hcall_wrapper.
+ * flags: Set to hardwareTarget.
+ * target: Specifies target using node index, nodal chip index and core index.
+ * operation : action to perform ie configure, start, stop, deconfigure, trace
+ * based on the HTM type.
+ * param1, param2, param3: parameters for each action.
+ */
 static inline long htm_call(unsigned long flags, unsigned long target,
                unsigned long operation, unsigned long param1,
                unsigned long param2, unsigned long param3)
@@ -73,17 +81,17 @@ static inline long htm_call(unsigned long flags, unsigned long target,
                                  param1, param2, param3);
 }
 
-static inline long htm_get_dump_hardware(unsigned long nodeindex,
+static inline long htm_hcall_wrapper(unsigned long nodeindex,
                unsigned long nodalchipindex, unsigned long coreindexonchip,
-               unsigned long type, unsigned long addr, unsigned long size,
-               unsigned long offset)
+	       unsigned long type, unsigned long htm_op, unsigned long param1, unsigned long param2,
+	       unsigned long param3)
 {
        return htm_call(H_HTM_FLAGS_HARDWARE_TARGET,
                        H_HTM_TARGET_NODE_INDEX(nodeindex) |
                        H_HTM_TARGET_NODAL_CHIP_INDEX(nodalchipindex) |
                        H_HTM_TARGET_CORE_INDEX_ON_CHIP(coreindexonchip),
-                       H_HTM_OP(H_HTM_OP_DUMP_DATA) | H_HTM_TYPE(type),
-                       addr, size, offset);
+		       H_HTM_OP(htm_op) | H_HTM_TYPE(type),
+		       param1, param2, param3);
 }
 
 extern void vpa_init(int cpu);
diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index 57fc1700f604..604fde6a0559 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -18,20 +18,19 @@ static u32 coreindexonchip;
 static u32 htmtype;
 static struct dentry *htmdump_debugfs_dir;
 
-static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
-			     size_t count, loff_t *ppos)
+/*
+ * Check the return code for H_HTM hcall.
+ * Return non-zero value (1) if either H_PARTIAL or H_SUCCESS
+ * is returned. For other return codes:
+ * Return zero if H_NOT_AVAILABLE.
+ * Return -EBUSY if hcall return busy.
+ * Return -EINVAL if any parameter or operation is not valid.
+ * Return -EPERM if HTM Virtualization Engine Technology code
+ * is not applied.
+ * Return -EIO if the HTM state is not valid.
+ */
+static ssize_t htm_return_check(long rc)
 {
-	void *htm_buf = filp->private_data;
-	unsigned long page, read_size, available;
-	loff_t offset;
-	long rc;
-
-	page = ALIGN_DOWN(*ppos, PAGE_SIZE);
-	offset = (*ppos) % PAGE_SIZE;
-
-	rc = htm_get_dump_hardware(nodeindex, nodalchipindex, coreindexonchip,
-				   htmtype, virt_to_phys(htm_buf), PAGE_SIZE, page);
-
 	switch (rc) {
 	case H_SUCCESS:
 	/* H_PARTIAL for the case where all available data can't be
@@ -65,6 +64,38 @@ static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
 		return -EPERM;
 	}
 
+	/*
+	 * Return 1 for H_SUCCESS/H_PARTIAL
+	 */
+	return 1;
+}
+
+static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
+			     size_t count, loff_t *ppos)
+{
+	void *htm_buf = filp->private_data;
+	unsigned long page, read_size, available;
+	loff_t offset;
+	long rc, ret;
+
+	page = ALIGN_DOWN(*ppos, PAGE_SIZE);
+	offset = (*ppos) % PAGE_SIZE;
+
+	/*
+	 * Invoke H_HTM call with:
+	 * - operation as htm dump (H_HTM_OP_DUMP_DATA)
+	 * - last three values are address, size and offset
+	 */
+	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+				   htmtype, H_HTM_OP_DUMP_DATA, virt_to_phys(htm_buf),
+				   PAGE_SIZE, page);
+
+	ret = htm_return_check(rc);
+	if (ret <= 0) {
+		pr_debug("H_HTM hcall failed for op: H_HTM_OP_DUMP_DATA, returning %ld\n", ret);
+		return ret;
+	}
+
 	available = PAGE_SIZE;
 	read_size = min(count, available);
 	*ppos += read_size;
@@ -103,6 +134,12 @@ static int htmdump_init_debugfs(void)
 
 static int __init htmdump_init(void)
 {
+	/* Disable on kvm guest */
+	if (is_kvm_guest()) {
+		pr_info("htmdump not supported inside KVM guest\n");
+		return -EOPNOTSUPP;
+	}
+
 	if (htmdump_init_debugfs())
 		return -ENOMEM;
 
-- 
2.43.0


