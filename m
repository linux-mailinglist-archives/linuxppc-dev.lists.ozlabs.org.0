Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B87B03ABD86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:36:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5YjW3DNbz3ddD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:35:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IfQ6lIsr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IfQ6lIsr; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Yj32l82z3bsW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:35:35 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HKYWcS155916; Thu, 17 Jun 2021 16:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=pErq9AGAVyAWfY8jVAAeecI4gNa41JE/uwHPcwZ3KOU=;
 b=IfQ6lIsrbvduZ/z+nbnjSzZVgjxMgxV3tu9wnsUvlu53fRYWwc+wHS224/TDX5gXokxk
 Jra9EsB6QjvrROIzSsO1loqdlmIHb2BC9PO+9gYi7k34ACCysAPkkMPiFDLYkAPDQcbK
 z5UnVUPN3ukmwGfa2vaQyb3XHaRPGBzgf3MWZ7RyJ8ruRqtRWCqEhI8xny1HtTtsbYJZ
 5I4YY4RY/wxS45b5XJxWnYzDgmNArqDHXpGsTR92pK5VzbdybpuSc1XXw+2V8rnO7Fap
 +c/5ysWhLXTUXxcnyBXJb4YdH6n/RALUeZCjRwg9oagBnTwjWLQOdMgF4XHiIU/V7zSt KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3988xqrp74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:35:27 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HKYnis160507;
 Thu, 17 Jun 2021 16:35:26 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3988xqrp6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:35:26 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HKHlAr023255;
 Thu, 17 Jun 2021 20:35:26 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 394mjaerde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 20:35:26 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HKZPXv36831676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 20:35:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DEE5124055;
 Thu, 17 Jun 2021 20:35:25 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 186CB124054;
 Thu, 17 Jun 2021 20:35:24 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 20:35:23 +0000 (GMT)
Message-ID: <40fb02a4d56ca4e240b074a15029082055be5997.camel@linux.ibm.com>
Subject: [PATCH v6 10/17] powerpc/pseries/vas: Add hcall wrappers for VAS
 handling
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Thu, 17 Jun 2021 13:35:22 -0700
In-Reply-To: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PJJQPyBd3JvWMFAa88SGdQHBGZMRljh7
X-Proofpoint-ORIG-GUID: 2G0CwOVCwbLXYdUI3hNVxHAHGwr4FCq0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170123
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This patch adds the following hcall wrapper functions to allocate,
modify and deallocate VAS windows, and retrieve VAS capabilities.

H_ALLOCATE_VAS_WINDOW: Allocate VAS window
H_DEALLOCATE_VAS_WINDOW: Close VAS window
H_MODIFY_VAS_WINDOW: Setup window before using
H_QUERY_VAS_CAPABILITIES: Get VAS capabilities

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/vas.c | 147 +++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/vas.c

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
new file mode 100644
index 000000000000..a73d7d00bf55
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2020-21 IBM Corp.
+ */
+
+#define pr_fmt(fmt) "vas: " fmt
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/export.h>
+#include <linux/types.h>
+#include <linux/delay.h>
+#include <asm/hvcall.h>
+#include <asm/plpar_wrappers.h>
+#include <asm/vas.h>
+#include "vas.h"
+
+#define VAS_INVALID_WIN_ADDRESS	0xFFFFFFFFFFFFFFFFul
+#define VAS_DEFAULT_DOMAIN_ID	0xFFFFFFFFFFFFFFFFul
+/* The hypervisor allows one credit per window right now */
+#define DEF_WIN_CREDS		1
+
+static long hcall_return_busy_check(long rc)
+{
+	/* Check if we are stalled for some time */
+	if (H_IS_LONG_BUSY(rc)) {
+		msleep(get_longbusy_msecs(rc));
+		rc = H_BUSY;
+	} else if (rc == H_BUSY) {
+		cond_resched();
+	}
+
+	return rc;
+}
+
+/*
+ * Allocate VAS window hcall
+ */
+static int h_allocate_vas_window(struct pseries_vas_window *win, u64 *domain,
+				     u8 wintype, u16 credits)
+{
+	long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
+	long rc;
+
+	do {
+		rc = plpar_hcall9(H_ALLOCATE_VAS_WINDOW, retbuf, wintype,
+				  credits, domain[0], domain[1], domain[2],
+				  domain[3], domain[4], domain[5]);
+
+		rc = hcall_return_busy_check(rc);
+	} while (rc == H_BUSY);
+
+	if (rc == H_SUCCESS) {
+		if (win->win_addr == VAS_INVALID_WIN_ADDRESS) {
+			pr_err("H_ALLOCATE_VAS_WINDOW: COPY/PASTE is not supported\n");
+			return -ENOTSUPP;
+		}
+		win->vas_win.winid = retbuf[0];
+		win->win_addr = retbuf[1];
+		win->complete_irq = retbuf[2];
+		win->fault_irq = retbuf[3];
+		return 0;
+	}
+
+	pr_err("H_ALLOCATE_VAS_WINDOW error: %ld, wintype: %u, credits: %u\n",
+		rc, wintype, credits);
+
+	return -EIO;
+}
+
+/*
+ * Deallocate VAS window hcall.
+ */
+static int h_deallocate_vas_window(u64 winid)
+{
+	long rc;
+
+	do {
+		rc = plpar_hcall_norets(H_DEALLOCATE_VAS_WINDOW, winid);
+
+		rc = hcall_return_busy_check(rc);
+	} while (rc == H_BUSY);
+
+	if (rc == H_SUCCESS)
+		return 0;
+
+	pr_err("H_DEALLOCATE_VAS_WINDOW error: %ld, winid: %llu\n",
+		rc, winid);
+	return -EIO;
+}
+
+/*
+ * Modify VAS window.
+ * After the window is opened with allocate window hcall, configure it
+ * with flags and LPAR PID before using.
+ */
+static int h_modify_vas_window(struct pseries_vas_window *win)
+{
+	long rc;
+	u32 lpid = mfspr(SPRN_PID);
+
+	/*
+	 * AMR value is not supported in Linux VAS implementation.
+	 * The hypervisor ignores it if 0 is passed.
+	 */
+	do {
+		rc = plpar_hcall_norets(H_MODIFY_VAS_WINDOW,
+					win->vas_win.winid, lpid, 0,
+					VAS_MOD_WIN_FLAGS, 0);
+
+		rc = hcall_return_busy_check(rc);
+	} while (rc == H_BUSY);
+
+	if (rc == H_SUCCESS)
+		return 0;
+
+	pr_err("H_MODIFY_VAS_WINDOW error: %ld, winid %u lpid %u\n",
+			rc, win->vas_win.winid, lpid);
+	return -EIO;
+}
+
+/*
+ * This hcall is used to determine the capabilities from the hypervisor.
+ * @hcall: H_QUERY_VAS_CAPABILITIES or H_QUERY_NX_CAPABILITIES
+ * @query_type: If 0 is passed, the hypervisor returns the overall
+ *		capabilities which provides all feature(s) that are
+ *		available. Then query the hypervisor to get the
+ *		corresponding capabilities for the specific feature.
+ *		Example: H_QUERY_VAS_CAPABILITIES provides VAS GZIP QoS
+ *			and VAS GZIP Default capabilities.
+ *			H_QUERY_NX_CAPABILITIES provides NX GZIP
+ *			capabilities.
+ * @result: Return buffer to save capabilities.
+ */
+int h_query_vas_capabilities(const u64 hcall, u8 query_type, u64 result)
+{
+	long rc;
+
+	rc = plpar_hcall_norets(hcall, query_type, result);
+
+	if (rc == H_SUCCESS)
+		return 0;
+
+	pr_err("HCALL(%llx) error %ld, query_type %u, result buffer 0x%llx\n",
+			hcall, rc, query_type, result);
+	return -EIO;
+}
-- 
2.18.2


