Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 623DA3A57D5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 13:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2s8b0LM2z3ckR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 21:01:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKrrImVA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iKrrImVA; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2s881lNDz3036
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 21:01:12 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15DAj3cW061134; Sun, 13 Jun 2021 07:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=80pGqWi4gvGe3X7tIS3AtykvrPr01zw5ogC2VUygZrc=;
 b=iKrrImVAcQ8qhQBhqmEFiTaNoaApu/k1Tx2HI8zkHmqCqCl0ejy9oOy3qS4HuqWF51Rn
 dLHTwhniDOVyWpmj9gtSzuE2g+IPqMqkIj0NZ6xLHwHNDpRjjiUCE6rhT20gGCVH2KQ1
 H5xf3e3a2kvIxZlaQRrzYAOj5WS3+y3IArzr/IpmX1Y6wMpnYwF0+CfTzvKKRz4b9FAZ
 Gpr69k8kW89rYwY5Kz2lWB+zMhKmHtvm93lqHLi4YTF54dKLO0azIFYvXDxG2PpxXKxo
 vktgkmFY0e7EpT/JtXQLW7QFAJlTe6R7TIG27ntiPJa4P2VcrxPYDPosLvwRmyRYD24f CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 395ghmr664-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 07:01:04 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15DAjE3K062049;
 Sun, 13 Jun 2021 07:01:04 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 395ghmr65v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 07:01:04 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15DAvvAU004549;
 Sun, 13 Jun 2021 11:01:03 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 394mj9099p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 11:01:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15DB129Q9306384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 11:01:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7081D7805E;
 Sun, 13 Jun 2021 11:01:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD9F57805F;
 Sun, 13 Jun 2021 11:01:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 13 Jun 2021 11:01:00 +0000 (GMT)
Message-ID: <69f072aba166f51fb1837f294b2a188d938d7108.camel@linux.ibm.com>
Subject: [PATCH v5 10/17] powerpc/pseries/vas: Add hcall wrappers for VAS
 handling
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sun, 13 Jun 2021 04:00:58 -0700
In-Reply-To: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 77JksZNgeTaBnBuJcU1iWgHEiFvvWneu
X-Proofpoint-ORIG-GUID: 4_fo6VinqpyKfuDouZvPCROMLFzHjkbl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-13_04:2021-06-11,
 2021-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106130078
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
 arch/powerpc/platforms/pseries/vas.c | 181 +++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/vas.c

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
new file mode 100644
index 000000000000..fec280979d50
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -0,0 +1,181 @@
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
+/* phyp allows one credit per window right now */
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
+ * Allocate VAS window HCALL
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
+	switch (rc) {
+	case H_SUCCESS:
+		if (win->win_addr == VAS_INVALID_WIN_ADDRESS) {
+			pr_err("HCALL(%x): COPY/PASTE is not supported\n",
+				H_ALLOCATE_VAS_WINDOW);
+			return -ENOTSUPP;
+		}
+		win->vas_win.winid = retbuf[0];
+		win->win_addr = retbuf[1];
+		win->complete_irq = retbuf[2];
+		win->fault_irq = retbuf[3];
+		return 0;
+	case H_PARAMETER:
+		pr_err("HCALL(%x): Invalid window type (%u)\n",
+			H_ALLOCATE_VAS_WINDOW, wintype);
+		return -EINVAL;
+	case H_CONSTRAINED:
+		pr_err("HCALL(%x): Credits(%u) are not available\n",
+			H_ALLOCATE_VAS_WINDOW, credits);
+		return -EPERM;
+	default:
+		pr_err("HCALL(%x): Failed with error %ld\n",
+			H_ALLOCATE_VAS_WINDOW, rc);
+		return -EIO;
+	}
+}
+
+/*
+ * Deallocate VAS window HCALL.
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
+	switch (rc) {
+	case H_SUCCESS:
+		return 0;
+	case H_PARAMETER:
+		pr_err("HCALL(%x): Invalid window ID %llu\n",
+			H_DEALLOCATE_VAS_WINDOW, winid);
+		return -EINVAL;
+	default:
+		pr_err("HCALL(%x): Failed with error %ld for window(%llu)\n",
+			H_DEALLOCATE_VAS_WINDOW, rc, winid);
+		return -EIO;
+	}
+}
+
+/*
+ * Modify VAS window.
+ * After the window is opened with allocate window HCALL, configure it
+ * with flags and LPAR PID before using.
+ */
+static int h_modify_vas_window(struct pseries_vas_window *win)
+{
+	long rc;
+	u32 lpid = mfspr(SPRN_PID);
+
+	/*
+	 * AMR value is not supported in Linux VAS implementation
+	 * phyp ignores it if 0 is passed.
+	 */
+	do {
+		rc = plpar_hcall_norets(H_MODIFY_VAS_WINDOW,
+					win->vas_win.winid, lpid, 0,
+					VAS_MOD_WIN_FLAGS, 0);
+
+		rc = hcall_return_busy_check(rc);
+	} while (rc == H_BUSY);
+
+	switch (rc) {
+	case H_SUCCESS:
+		return 0;
+	case H_PARAMETER:
+		pr_err("HCALL(%x): Invalid window ID %u\n",
+			H_MODIFY_VAS_WINDOW, win->vas_win.winid);
+		return -EINVAL;
+	case H_P2:
+		pr_err("HCALL(%x): Window(%d): Invalid LPAR Process ID %u\n",
+			H_MODIFY_VAS_WINDOW, lpid, win->vas_win.winid);
+		return -EINVAL;
+	default:
+		pr_err("HCALL(%x): Failed with error %ld for window(%u)\n",
+			H_MODIFY_VAS_WINDOW, rc, win->vas_win.winid);
+		return -EIO;
+	}
+}
+
+/*
+ * This HCALL is used to determine the capabilities that pHyp provides.
+ * @hcall: H_QUERY_VAS_CAPABILITIES or H_QUERY_NX_CAPABILITIES
+ * @query_type: If 0 is passed, phyp returns the overall capabilities
+ *		which provides all feature(s) that are available. Then
+ *		query phyp to get the corresponding capabilities for
+ *		the specific feature.
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
+	switch (rc) {
+	case H_SUCCESS:
+		return 0;
+	case H_PARAMETER:
+		pr_err("HCALL(%llx): Invalid query type %u\n", hcall,
+			query_type);
+		return -EINVAL;
+	case H_PRIVILEGE:
+		pr_err("HCALL(%llx): Invalid result buffer 0x%llx\n",
+			hcall, result);
+		return -EACCES;
+	default:
+		pr_err("HCALL(%llx): Unexpected error %ld\n", hcall, rc);
+		return -EIO;
+	}
+}
-- 
2.18.2


