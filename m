Return-Path: <linuxppc-dev+bounces-7064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89326A61322
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:56:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDm9f3S0gz3cXx;
	Sat, 15 Mar 2025 00:56:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960566;
	cv=none; b=Br3mRFOT+zV3QlynNg4Gll1CbtxYhPdjE/ylKlUJlCD2zVuAJ9MtUiJ1JRZXjlvBXuAxmgvE1sYVZnVhAl2N3iLlrHs1tsbwtmwDGdTjNzgQoczNWUT+rghqcNSc8f6v8MkAKhTRgWF6047WM8a4pQx1gzBQo06H4hft0F/9Y7ATdR4V0Nf8viwT5h3FNLsnS8ymoNa0XqPdSt0AyrNcFpcD7qORFRyLiyFiKAMy1e4prxhVL4JGjB2zx9fOuhVH417xBlOeUMpppCXtOFRhlAMxhajPUY5bDAPxaR9e7ajRJLZ4KVLjx3v6Oous26L2fzMb3oQ4tFct1U0GvrwH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960566; c=relaxed/relaxed;
	bh=x6Z9VWxPhZNes6Kw4kg3uHXM5Trx+vUxzG8x2c8MI4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M13icQYRYfD4pjwxlEPxyrZF5gwtzi81EBRoJtHMDEv6Usx9vBLI1MlDUYaxdbuLN9UqBCXGUBX/W0XHRhLATVraAROx+jpAjYdU2BPQAfjd1s+hDpWTtFH2OnEjkjYTI6XnUTD2Mq37sQU81VUyCJEj1/ED+YLN25Y/L7FXHGUt2mNeo5+koWygsh/SfVRBwJ7AzxT4hBiH+6OyfE4YEcxZCS9x+RsAb2XjK4ylb/VjIYTl7ENAmOLiMfw2ZxWzr2nzHEdfQdzQ1oYxrC4JLm90HZ/7i5DcaVLKpEEcIhO+uPC8eKvqYLcG4JrBE438rfaqNnp5ZvB0wEXdO6vDqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pEpR4cmo; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pEpR4cmo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDm9d3JCjz3cZB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:56:04 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECK6sP015109
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=x6Z9VWxPhZNes6Kw4
	kg3uHXM5Trx+vUxzG8x2c8MI4U=; b=pEpR4cmoypLXKAxArmJ51HVW3Seue8asC
	fRMK1BuhNxf3hBVBRWtT9PvGDMRWfjVfHfaKa/yhvo5mMaQ0OSIJhdtnyfIJrcUh
	+KVGfHRWNSRiE2X66eMlb3skXGAZqAW6g52OGBmcCa2Zb9apBnuukGyS+l1XjuB+
	VvI24AsRPbEXHrMPOXpfWADF1RmgRvBHgUOyeub6RQy04IdSsDGhfN8cMADRQakI
	fGfe8vmLcI2lSfyhwpbGUcSP0w3uRsMpcUv3Fzsdbozr8Vrl7g7YvS/vJpYe/CWp
	qeWeJIHmp5qt0QYSXFZhYVaa69VZhJNxLkPYMEt8878foiT+IpGtw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6k0420k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:02 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECcFwv026166
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:01 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atspq8kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:01 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EDtvHi36635064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 13:55:57 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 163D12004D;
	Fri, 14 Mar 2025 13:55:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2260E20043;
	Fri, 14 Mar 2025 13:55:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.102])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 13:55:51 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH 1/9] powerpc/pseries/htmdump: Add htm_hcall_wrapper to integrate other htm operations
Date: Fri, 14 Mar 2025 19:25:33 +0530
Message-Id: <20250314135541.1831-2-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: xnlslQj-I6VT_vhfwdURfjLLyKAMwwH7
X-Proofpoint-ORIG-GUID: xnlslQj-I6VT_vhfwdURfjLLyKAMwwH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503140106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

H_HTM (Hardware Trace Macro) hypervisor call is an HCALL to export data
from Hardware Trace Macro (HTM) function. The debugfs interface to
export the HTM function data in an lpar currently supports only dumping
of HTM data in an lpar. To add support for setup, configuration and
control of HTM function via debugfs interface, update the hcall wrapper
function. Rename and update htm_get_dump_hardware to htm_hcall_wrapper()
so that it can be used for other HTM operations as well. Additionally
include parameter "htm_op". Update htmdump module to check the return
code of hcall in a separate function so that it can be reused for other
option too.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/include/asm/plpar_wrappers.h | 18 +++++---
 arch/powerpc/platforms/pseries/htmdump.c  | 55 +++++++++++++++++------
 2 files changed, 55 insertions(+), 18 deletions(-)

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
index 57fc1700f604..f13a5570446c 100644
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
@@ -65,6 +64,36 @@ static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
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
+	if (ret <= 0)
+		return ret;
+
 	available = PAGE_SIZE;
 	read_size = min(count, available);
 	*ppos += read_size;
-- 
2.43.5


