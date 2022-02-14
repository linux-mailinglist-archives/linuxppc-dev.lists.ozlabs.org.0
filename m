Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FFF4B4CAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 11:53:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy1KY0nLGz3dhV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:53:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pohzy8te;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Pohzy8te; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy15r6Sl8z3cV2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 21:43:12 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EA989O012418; 
 Mon, 14 Feb 2022 10:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jciDulqJWPzW2WJ3Xrcy9hExfdSEWKkmsuYqrMQx61o=;
 b=Pohzy8te5LeI2NdGyXNJBT4mXzdIQuuHDaEUWgxY3p6FG5VTfzSMgH0nxfQtwWoG4yDE
 oTMd4upFpa1obp8aeH5sCisDCWnca/o9POFKaiPWjSSsPSRoVcYr78v5/MHaYBK2ti3S
 qKV2aOELrRxKcPd6eVtItfoVGn+g0AF1KA9G8Fb39mMcOt8EAPORpqjt/kkt5D6nbwrU
 lmcRSDTCb51mK5/RL5s8uQjkWBmlsBI0WJDGH5VKkWx3kjCk6GgJV27sHDuYuH/exh7I
 zANkjzJJPQXbOi8iL+MTLupD1DgDRNIuPv1VSpnMWYERI8IzfGXwJw7APKQwCCfFzDMB nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7c4dtpeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:56 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EAA2qR011285;
 Mon, 14 Feb 2022 10:42:56 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7c4dtpdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:56 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EAXsHJ005422;
 Mon, 14 Feb 2022 10:42:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3e64h937rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:54 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21EAgjGw47645078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 10:42:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06680AE058;
 Mon, 14 Feb 2022 10:42:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1BE5AE04D;
 Mon, 14 Feb 2022 10:42:42 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.124.167])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 10:42:42 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH powerpc/next 14/17] powerpc/bpf: Move bpf_jit64.h into
 bpf_jit_comp64.c
Date: Mon, 14 Feb 2022 16:11:48 +0530
Message-Id: <b873a8e6eff7d91bf2a2cabdd53082aadfe20761.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y1qYPZT-u3RhJr0PNd6A8t7xp3IpX1AJ
X-Proofpoint-ORIG-GUID: 2Dj-yHXCr5IrAtfH_ON039csJv-Hr2GL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140064
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need for a separate header anymore. Move the contents of
bpf_jit64.h into bpf_jit_comp64.c

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit64.h      | 69 -------------------------------
 arch/powerpc/net/bpf_jit_comp64.c | 54 +++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 70 deletions(-)
 delete mode 100644 arch/powerpc/net/bpf_jit64.h

diff --git a/arch/powerpc/net/bpf_jit64.h b/arch/powerpc/net/bpf_jit64.h
deleted file mode 100644
index 199348b7296653..00000000000000
--- a/arch/powerpc/net/bpf_jit64.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * bpf_jit64.h: BPF JIT compiler for PPC64
- *
- * Copyright 2016 Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
- *		  IBM Corporation
- */
-#ifndef _BPF_JIT64_H
-#define _BPF_JIT64_H
-
-#include "bpf_jit.h"
-
-/*
- * Stack layout:
- * Ensure the top half (upto local_tmp_var) stays consistent
- * with our redzone usage.
- *
- *		[	prev sp		] <-------------
- *		[   nv gpr save area	] 5*8		|
- *		[    tail_call_cnt	] 8		|
- *		[    local_tmp_var	] 16		|
- * fp (r31) -->	[   ebpf stack space	] upto 512	|
- *		[     frame header	] 32/112	|
- * sp (r1) --->	[    stack pointer	] --------------
- */
-
-/* for gpr non volatile registers BPG_REG_6 to 10 */
-#define BPF_PPC_STACK_SAVE	(5*8)
-/* for bpf JIT code internal usage */
-#define BPF_PPC_STACK_LOCALS	24
-/* stack frame excluding BPF stack, ensure this is quadword aligned */
-#define BPF_PPC_STACKFRAME	(STACK_FRAME_MIN_SIZE + \
-				 BPF_PPC_STACK_LOCALS + BPF_PPC_STACK_SAVE)
-
-#ifndef __ASSEMBLY__
-
-/* BPF register usage */
-#define TMP_REG_1	(MAX_BPF_JIT_REG + 0)
-#define TMP_REG_2	(MAX_BPF_JIT_REG + 1)
-
-/* BPF to ppc register mappings */
-const int b2p[MAX_BPF_JIT_REG + 2] = {
-	/* function return value */
-	[BPF_REG_0] = 8,
-	/* function arguments */
-	[BPF_REG_1] = 3,
-	[BPF_REG_2] = 4,
-	[BPF_REG_3] = 5,
-	[BPF_REG_4] = 6,
-	[BPF_REG_5] = 7,
-	/* non volatile registers */
-	[BPF_REG_6] = 27,
-	[BPF_REG_7] = 28,
-	[BPF_REG_8] = 29,
-	[BPF_REG_9] = 30,
-	/* frame pointer aka BPF_REG_10 */
-	[BPF_REG_FP] = 31,
-	/* eBPF jit internal registers */
-	[BPF_REG_AX] = 12,
-	[TMP_REG_1] = 9,
-	[TMP_REG_2] = 10
-};
-
-/* PPC NVR range -- update this if we ever use NVRs below r27 */
-#define BPF_PPC_NVR_MIN		27
-
-#endif /* !__ASSEMBLY__ */
-
-#endif
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index eeda636cd7be64..3e4ed556094770 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -17,7 +17,59 @@
 #include <linux/bpf.h>
 #include <asm/security_features.h>
 
-#include "bpf_jit64.h"
+#include "bpf_jit.h"
+
+/*
+ * Stack layout:
+ * Ensure the top half (upto local_tmp_var) stays consistent
+ * with our redzone usage.
+ *
+ *		[	prev sp		] <-------------
+ *		[   nv gpr save area	] 5*8		|
+ *		[    tail_call_cnt	] 8		|
+ *		[    local_tmp_var	] 16		|
+ * fp (r31) -->	[   ebpf stack space	] upto 512	|
+ *		[     frame header	] 32/112	|
+ * sp (r1) --->	[    stack pointer	] --------------
+ */
+
+/* for gpr non volatile registers BPG_REG_6 to 10 */
+#define BPF_PPC_STACK_SAVE	(5*8)
+/* for bpf JIT code internal usage */
+#define BPF_PPC_STACK_LOCALS	24
+/* stack frame excluding BPF stack, ensure this is quadword aligned */
+#define BPF_PPC_STACKFRAME	(STACK_FRAME_MIN_SIZE + \
+				 BPF_PPC_STACK_LOCALS + BPF_PPC_STACK_SAVE)
+
+/* BPF register usage */
+#define TMP_REG_1	(MAX_BPF_JIT_REG + 0)
+#define TMP_REG_2	(MAX_BPF_JIT_REG + 1)
+
+/* BPF to ppc register mappings */
+const int b2p[MAX_BPF_JIT_REG + 2] = {
+	/* function return value */
+	[BPF_REG_0] = 8,
+	/* function arguments */
+	[BPF_REG_1] = 3,
+	[BPF_REG_2] = 4,
+	[BPF_REG_3] = 5,
+	[BPF_REG_4] = 6,
+	[BPF_REG_5] = 7,
+	/* non volatile registers */
+	[BPF_REG_6] = 27,
+	[BPF_REG_7] = 28,
+	[BPF_REG_8] = 29,
+	[BPF_REG_9] = 30,
+	/* frame pointer aka BPF_REG_10 */
+	[BPF_REG_FP] = 31,
+	/* eBPF jit internal registers */
+	[BPF_REG_AX] = 12,
+	[TMP_REG_1] = 9,
+	[TMP_REG_2] = 10
+};
+
+/* PPC NVR range -- update this if we ever use NVRs below r27 */
+#define BPF_PPC_NVR_MIN		27
 
 static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
 {
-- 
2.35.1

