Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304BD35D9FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 10:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJb008Vdz3dYT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 18:25:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EmugSNyt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EmugSNyt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJZD3W77z3dDr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 18:25:08 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13D89Td6089149; Tue, 13 Apr 2021 04:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=9ETTbJjrjvw9mMBYfehCAwyxedjykqeURiOMtjUAEwo=;
 b=EmugSNytv1RI+E/pyZh3g+gYcAAhJ2E1eTAXIBgaTR9uyBOjvV0Fv77u4j7eeS588U+q
 GtBaodZyup0NP+Ulf8tRZF1JwLztcMHcrXXYi0xdoXy76YbuLZch866djfy/L7smI6Um
 wXH15aBoYvR/gzNkk6I+0Ap2gez09qzBASnli/YHnrB4FBRoM0c8JQhDATHnAn8UkDwL
 C+D79+owq3PkzMyc8dHBl60YrTi7EMhwO8zhwR5ul4w0ZtjYVmDC9/7xqyFR0HY98mdz
 kioj/uhuTYKSMYmWcWlIiQvBI/Wqd4n8Vi31VmNI6PfdNUL93wunUF4kx5eQli9tsg0r 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vkdkthjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 04:25:03 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13D89Xfs089428;
 Tue, 13 Apr 2021 04:25:02 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vkdkthhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 04:25:02 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13D8M7xh007019;
 Tue, 13 Apr 2021 08:25:01 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 37u3n8vvyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 08:25:01 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13D8P1n620447710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 08:25:01 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08C22124055;
 Tue, 13 Apr 2021 08:25:01 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B92C124053;
 Tue, 13 Apr 2021 08:25:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.232.48])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 08:24:59 +0000 (GMT)
Message-ID: <347ce23b6d8ab3a05b0f2b9ae59ec3977a7b981a.camel@linux.ibm.com>
Subject: [V2 PATCH 08/16] powerpc/pseries/VAS: Implement
 allocate/modify/deallocate HCALLS
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Tue, 13 Apr 2021 01:24:58 -0700
In-Reply-To: <68aa9f2860f9acffa41469d3858883c938634722.camel@linux.ibm.com>
References: <68aa9f2860f9acffa41469d3858883c938634722.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tXbMTvUeV2LG8MMCxTAYuxd-vThv8AZE
X-Proofpoint-GUID: Cmp7BWr4_b6tb0GKatK3NxjG0bjJ95Hn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_03:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104130055
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


This patch adds the following HCALLs which are used to allocate,
modify and deallocate VAS windows.

H_ALLOCATE_VAS_WINDOW: Allocate VAS window
H_DEALLOCATE_VAS_WINDOW: Close VAS window
H_MODIFY_VAS_WINDOW: Setup window before using

Also adds phyp call (H_QUERY_VAS_CAPABILITIES) to get all VAS
capabilities that phyp provides.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
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


