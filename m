Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE6F55BBAF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 21:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWy605Wssz3cg2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 05:12:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HqSXj8SQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HqSXj8SQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWy5H1NPzz3bbv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 05:11:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RItiY5005983;
	Mon, 27 Jun 2022 19:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=f86dUmkYAtR6HvZ5LNSPoW61oYa7GUGOhMVkQHQA1lg=;
 b=HqSXj8SQGpRNdGtHd1UmzlBd1ZSjW48VhMfIEvRnSu7bASbIRnHZXIlB/lgMAyOKOFRN
 b1sYpDfBbUWxqNyf9TG3naBaLytC0ZTL8Bc6FRuxpdButPPD3BjU2yJ3tiYXvFDxv8T3
 e+7JK0LNpqPQcFaWX2WE48YrYkI9vv1teooNmEZhNky7zDf0x/eWF6XDgYqdnLVRnecn
 TBWO4cQ6mGgMH5Tg0ci/7r928LCdqwObbNeHMPH6T3ndUNTDdKoTv+QIRGsrnf9BonHj
 B9Eslqt2Rrjy9PVg7suy1wGr4JrVppVbUcNn3pjTZV6pLGBPCv1j6jGUDFS84GdYpU2n Rw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyj8t8c97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 19:11:39 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RJ7C9d030066;
	Mon, 27 Jun 2022 19:11:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 3gwt08tjm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 19:11:37 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25RJBZnJ8323464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 19:11:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E5BDA11C052;
	Mon, 27 Jun 2022 19:11:34 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B220211C04A;
	Mon, 27 Jun 2022 19:11:33 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.62.161])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jun 2022 19:11:33 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH powerpc v2] powerpc/bpf: Fix use of user_pt_regs in uapi
Date: Tue, 28 Jun 2022 00:41:19 +0530
Message-Id: <20220627191119.142867-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5LNIrSGw02SEUHSqrLOzahDCtBmgNfBa
X-Proofpoint-GUID: 5LNIrSGw02SEUHSqrLOzahDCtBmgNfBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=767 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270078
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Trying to build a .c file that includes <linux/bpf_perf_event.h>:
  $ cat test_bpf_headers.c
  #include <linux/bpf_perf_event.h>

throws the below error:
  /usr/include/linux/bpf_perf_event.h:14:28: error: field ‘regs’ has incomplete type
     14 |         bpf_user_pt_regs_t regs;
	|                            ^~~~

This is because we typedef bpf_user_pt_regs_t to 'struct user_pt_regs'
in arch/powerpc/include/uaps/asm/bpf_perf_event.h, but 'struct
user_pt_regs' is not exposed to userspace.

Powerpc has both pt_regs and user_pt_regs structures. However, unlike
arm64 and s390, we expose user_pt_regs to userspace as just 'pt_regs'.
As such, we should typedef bpf_user_pt_regs_t to 'struct pt_regs' for
userspace.

Within the kernel though, we want to typedef bpf_user_pt_regs_t to
'struct user_pt_regs'.

Remove arch/powerpc/include/uapi/asm/bpf_perf_event.h so that the
uapi/asm-generic version of the header is exposed to userspace.
Introduce arch/powerpc/include/asm/bpf_perf_event.h so that we can
typedef bpf_user_pt_regs_t to 'struct user_pt_regs' for use within the
kernel.

Note that this was not showing up with the bpf selftest build since
tools/include/uapi/asm/bpf_perf_event.h didn't include the powerpc
variant.

Fixes: a6460b03f945ee ("powerpc/bpf: Fix broken uapi for BPF_PROG_TYPE_PERF_EVENT")
Cc: stable@vger.kernel.org # v4.20+
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
v2: Add arch/powerpc/include/asm/bpf_perf_event.h

 arch/powerpc/include/asm/bpf_perf_event.h      | 9 +++++++++
 arch/powerpc/include/uapi/asm/bpf_perf_event.h | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)
 create mode 100644 arch/powerpc/include/asm/bpf_perf_event.h
 delete mode 100644 arch/powerpc/include/uapi/asm/bpf_perf_event.h

diff --git a/arch/powerpc/include/asm/bpf_perf_event.h b/arch/powerpc/include/asm/bpf_perf_event.h
new file mode 100644
index 00000000000000..a207467dd0a755
--- /dev/null
+++ b/arch/powerpc/include/asm/bpf_perf_event.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_BPF_PERF_EVENT_H
+#define _ASM_BPF_PERF_EVENT_H
+
+#include <asm/ptrace.h>
+
+typedef struct user_pt_regs bpf_user_pt_regs_t;
+
+#endif /* _ASM_BPF_PERF_EVENT_H */
diff --git a/arch/powerpc/include/uapi/asm/bpf_perf_event.h b/arch/powerpc/include/uapi/asm/bpf_perf_event.h
deleted file mode 100644
index 5e1e648aeec4c8..00000000000000
--- a/arch/powerpc/include/uapi/asm/bpf_perf_event.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI__ASM_BPF_PERF_EVENT_H__
-#define _UAPI__ASM_BPF_PERF_EVENT_H__
-
-#include <asm/ptrace.h>
-
-typedef struct user_pt_regs bpf_user_pt_regs_t;
-
-#endif /* _UAPI__ASM_BPF_PERF_EVENT_H__ */

base-commit: f85bb0e4405d64c657c3b10ca134bc8fff9afaaa
-- 
2.36.1

