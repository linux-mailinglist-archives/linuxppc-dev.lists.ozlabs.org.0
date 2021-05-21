Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF438C348
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 11:36:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmhLl1DWpz3ckw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:36:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tQ9HT6P1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tQ9HT6P1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmhLG5ZPjz3035
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 19:35:50 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L9YLDZ136019; Fri, 21 May 2021 05:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=jaQq9cKngfukSIAawYHp/pAFrByJBlfYHaLCeM7dUUg=;
 b=tQ9HT6P1uyg5ZYBkHftjpzdIqvOI0Q+hL+vmnS9+4ldYx9B9uO2yRl0qA9Rjp71/OxZV
 pBvzw6dZnZFh4kgxhERdOBJkHK5AsjEc+eEN+F8SdXKNZqcYei4LcfqNuMh7w8dbr41H
 gbH5NlvaQ+5jDNnphjd7tt0lnaj77JArVxC5mutPbIqgGsrAHgwEXRNVbsy1qxymwFzW
 7jSE2IJOy5tR5xRLROZwUJSDcBpWIQOWJBwAhf5WKyx2WbD90uoE9c/1HERR3PzawP+R
 A5xe0zjxD9MULqaWvK0LSH5fZvD8YkxpbsnMl/ACMqAhT7fa9GBRF6qAmc/nFon9H5TU Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38pa92g49y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:35:42 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L9YWKg137040;
 Fri, 21 May 2021 05:35:42 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38pa92g48v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:35:42 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L9XAh3022064;
 Fri, 21 May 2021 09:35:41 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 38j5xaa5rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:35:41 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L9ZdDI19136922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 09:35:39 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 663166E052;
 Fri, 21 May 2021 09:35:39 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE9C06E04C;
 Fri, 21 May 2021 09:35:37 +0000 (GMT)
Received: from sig-9-65-94-165.ibm.com (unknown [9.65.94.165])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 09:35:37 +0000 (GMT)
Message-ID: <f52961e6941803366ecf6239ddb9532680516b78.camel@linux.ibm.com>
Subject: [PATCH v4 09/16] powerpc/pseries/vas: Add HCALL wrappers for VAS
 handling
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Fri, 21 May 2021 02:35:35 -0700
In-Reply-To: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZmQtnh4A0efs15r6soW8x9GIhMrMJfjy
X-Proofpoint-GUID: wW7w0o1Tjn1nX9bCIoiMVoWpFL-R1vsx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210061
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


This patch adds the following HCALL wrapper functions to allocate,
modify and deallocate VAS windows, and retrieve VAS capabilities.

H_ALLOCATE_VAS_WINDOW: Allocate VAS window
H_DEALLOCATE_VAS_WINDOW: Close VAS window
H_MODIFY_VAS_WINDOW: Setup window before using
H_QUERY_VAS_CAPABILITIES: Get VAS capabilities

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/vas.c | 217 +++++++++++++++++++++++++++
 1 file changed, 217 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/vas.c

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
new file mode 100644
index 000000000000..06960151477c
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -0,0 +1,217 @@
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
+#include <linux/slab.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
+#include <linux/sched/mm.h>
+#include <linux/mmu_context.h>
+#include <asm/hvcall.h>
+#include <asm/hvconsole.h>
+#include <asm/machdep.h>
+#include <asm/plpar_wrappers.h>
+#include <asm/vas.h>
+#include "vas.h"
+
+#define	VAS_INVALID_WIN_ADDRESS	0xFFFFFFFFFFFFFFFFul
+#define	VAS_DEFAULT_DOMAIN_ID	0xFFFFFFFFFFFFFFFFul
+/* Authority Mask Register (AMR) value is not supported in */
+/* linux implementation. So pass '0' to modify window HCALL */
+#define	VAS_AMR_VALUE	0
+/* phyp allows one credit per window right now */
+#define DEF_WIN_CREDS		1
+
+static int64_t hcall_return_busy_check(int64_t rc)
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
+static int plpar_vas_allocate_window(struct vas_window *win, u64 *domain,
+				     u8 wintype, u16 credits)
+{
+	long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
+	int64_t rc;
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
+		win->winid = retbuf[0];
+		win->lpar.win_addr = retbuf[1];
+		win->lpar.complete_irq = retbuf[2];
+		win->lpar.fault_irq = retbuf[3];
+		if (win->lpar.win_addr == VAS_INVALID_WIN_ADDRESS) {
+			pr_err("HCALL(%x): COPY/PASTE is not supported\n",
+				H_ALLOCATE_VAS_WINDOW);
+			return -ENOTSUPP;
+		}
+		return 0;
+	case H_PARAMETER:
+		pr_err("HCALL(%x): Invalid window type (%u)\n",
+			H_ALLOCATE_VAS_WINDOW, wintype);
+		return -EINVAL;
+	case H_P2:
+		pr_err("HCALL(%x): Credits(%u) exceed maximum window credits\n",
+			H_ALLOCATE_VAS_WINDOW, credits);
+		return -EINVAL;
+	case H_COP_HW:
+		pr_err("HCALL(%x): User-mode COPY/PASTE is not supported\n",
+			H_ALLOCATE_VAS_WINDOW);
+		return -ENOTSUPP;
+	case H_RESOURCE:
+		pr_err("HCALL(%x): LPAR credit limit exceeds window limit\n",
+			H_ALLOCATE_VAS_WINDOW);
+		return -EPERM;
+	case H_CONSTRAINED:
+		pr_err("HCALL(%x): Credits (%u) are not available\n",
+			H_ALLOCATE_VAS_WINDOW, credits);
+		return -EPERM;
+	default:
+		pr_err("HCALL(%x): Unexpected error %lld\n",
+			H_ALLOCATE_VAS_WINDOW, rc);
+		return -EIO;
+	}
+}
+
+/*
+ * Deallocate VAS window HCALL.
+ */
+static int plpar_vas_deallocate_window(u64 winid)
+{
+	int64_t rc;
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
+	case H_STATE:
+		pr_err("HCALL(%x): Window(%llu): Invalid page table entries\n",
+			H_DEALLOCATE_VAS_WINDOW, winid);
+		return -EPERM;
+	default:
+		pr_err("HCALL(%x): Unexpected error %lld for window(%llu)\n",
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
+static int plpar_vas_modify_window(struct vas_window *win)
+{
+	int64_t rc;
+	u32 lpid = mfspr(SPRN_PID);
+
+	/*
+	 * AMR value is not supported in Linux implementation
+	 * phyp ignores it if 0 is passed.
+	 */
+	do {
+		rc = plpar_hcall_norets(H_MODIFY_VAS_WINDOW, win->winid,
+					lpid, 0, VAS_MOD_WIN_FLAGS,
+					VAS_AMR_VALUE);
+
+		rc = hcall_return_busy_check(rc);
+	} while (rc == H_BUSY);
+
+	switch (rc) {
+	case H_SUCCESS:
+		return 0;
+	case H_PARAMETER:
+		pr_err("HCALL(%x): Invalid window ID %u\n",
+			H_MODIFY_VAS_WINDOW, win->winid);
+		return -EINVAL;
+	case H_P2:
+		pr_err("HCALL(%x): Window(%d): Invalid LPAR Process ID %u\n",
+			H_MODIFY_VAS_WINDOW, lpid, win->winid);
+		return -EINVAL;
+	case H_P3:
+		/* LPAR thread ID is deprecated on P10 */
+		pr_err("HCALL(%x): Invalid LPAR Thread ID for window(%u)\n",
+			H_MODIFY_VAS_WINDOW, win->winid);
+		return -EINVAL;
+	case H_STATE:
+		pr_err("HCALL(%x): Jobs in progress, Can't modify window(%u)\n",
+			H_MODIFY_VAS_WINDOW, win->winid);
+		return -EBUSY;
+	default:
+		pr_err("HCALL(%x): Unexpected error %lld for window(%u)\n",
+			H_MODIFY_VAS_WINDOW, rc, win->winid);
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
+int plpar_vas_query_capabilities(const u64 hcall, u8 query_type,
+					u64 result)
+{
+	int64_t rc;
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
+		pr_err("HCALL(%llx): Unexpected error %lld\n", hcall, rc);
+		return -EIO;
+	}
+}
-- 
2.18.2


