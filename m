Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D5237B48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 19:42:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KXzh1fl3zDqPW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 03:42:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KXs01jSWzDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 03:36:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45KXrz0zvRz8wGk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 03:36:34 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45KXry5Rwpz9sPl; Fri,  7 Jun 2019 03:36:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45KXrx3hrgz9sPC
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Jun 2019 03:36:33 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x56HTwCh072387
 for <linuxppc-dev@ozlabs.org>; Thu, 6 Jun 2019 13:36:31 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sy6ga2ng5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 06 Jun 2019 13:36:31 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Thu, 6 Jun 2019 18:36:30 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Jun 2019 18:36:26 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x56HaPEq29819206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jun 2019 17:36:25 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37925AC059;
 Thu,  6 Jun 2019 17:36:25 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66FF9AC05B;
 Thu,  6 Jun 2019 17:36:23 +0000 (GMT)
Received: from rino.br.ibm.com (unknown [9.18.235.79])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jun 2019 17:36:23 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 4/9] KVM: PPC: Ultravisor: Add generic ultravisor call
 handler
Date: Thu,  6 Jun 2019 14:36:09 -0300
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606173614.32090-1-cclaudio@linux.ibm.com>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060617-0052-0000-0000-000003CC51EF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011224; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214149; UDB=6.00638204; IPR=6.00995229; 
 MB=3.00027209; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-06 17:36:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060617-0053-0000-0000-00006135DC69
Message-Id: <20190606173614.32090-5-cclaudio@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906060117
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ram Pai <linuxram@us.ibm.com>

Add the ucall() function, which can be used to make ultravisor calls
with varied number of in and out arguments. Ultravisor calls can be made
from the host or guests.

This copies the implementation of plpar_hcall().

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
[Change ucall.S to not save CR, rename and move the headers, build
 ucall.S if CONFIG_PPC_UV set, and add some comments in the code]
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 arch/powerpc/include/asm/ultravisor-api.h | 20 +++++++++++++++
 arch/powerpc/include/asm/ultravisor.h     | 20 +++++++++++++++
 arch/powerpc/kernel/Makefile              |  2 +-
 arch/powerpc/kernel/ucall.S               | 31 +++++++++++++++++++++++
 arch/powerpc/kernel/ultravisor.c          |  4 +++
 5 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/ultravisor-api.h
 create mode 100644 arch/powerpc/kernel/ucall.S

diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
new file mode 100644
index 000000000000..5f538f33c704
--- /dev/null
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Ultravisor calls.
+ *
+ * Copyright 2019, IBM Corporation.
+ *
+ */
+#ifndef _ASM_POWERPC_ULTRAVISOR_API_H
+#define _ASM_POWERPC_ULTRAVISOR_API_H
+
+#include <asm/hvcall.h>
+
+/* Return codes */
+#define U_NOT_AVAILABLE		H_NOT_AVAILABLE
+#define U_SUCCESS		H_SUCCESS
+#define U_FUNCTION		H_FUNCTION
+#define U_PARAMETER		H_PARAMETER
+
+#endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
+
diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
index e5009b0d84ea..7500771a8ebd 100644
--- a/arch/powerpc/include/asm/ultravisor.h
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -8,8 +8,28 @@
 #ifndef _ASM_POWERPC_ULTRAVISOR_H
 #define _ASM_POWERPC_ULTRAVISOR_H
 
+#include <asm/ultravisor-api.h>
+
+#if !defined(__ASSEMBLY__)
+
 /* Internal functions */
 extern int early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
 					 int depth, void *data);
 
+/* API functions */
+#define UCALL_BUFSIZE 4
+/**
+ * ucall: Make a powerpc ultravisor call.
+ * @opcode: The ultravisor call to make.
+ * @retbuf: Buffer to store up to 4 return arguments in.
+ *
+ * This call supports up to 6 arguments and 4 return arguments. Use
+ * UCALL_BUFSIZE to size the return argument buffer.
+ */
+#if defined(CONFIG_PPC_UV)
+long ucall(unsigned long opcode, unsigned long *retbuf, ...);
+#endif
+
+#endif /* !__ASSEMBLY__ */
+
 #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index c8ca219e54bf..43ff4546e469 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -154,7 +154,7 @@ endif
 
 obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
-obj-$(CONFIG_PPC_UV)		+= ultravisor.o
+obj-$(CONFIG_PPC_UV)		+= ultravisor.o ucall.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
diff --git a/arch/powerpc/kernel/ucall.S b/arch/powerpc/kernel/ucall.S
new file mode 100644
index 000000000000..ecc88998a13b
--- /dev/null
+++ b/arch/powerpc/kernel/ucall.S
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Generic code to perform an ultravisor call.
+ *
+ * Copyright 2019, IBM Corporation.
+ *
+ */
+#include <asm/ppc_asm.h>
+
+/*
+ * This function is based on the plpar_hcall()
+ */
+_GLOBAL_TOC(ucall)
+	mr	r0,r3
+	std     r4,STK_PARAM(R4)(r1)     /* Save ret buffer */
+	mr	r3,r5
+	mr	r4,r6
+	mr	r5,r7
+	mr	r6,r8
+	mr	r7,r9
+	mr	r8,r10
+
+	sc 2				/* invoke the ultravisor */
+
+	ld	r12,STK_PARAM(R4)(r1)
+	std	r4,  0(r12)
+	std	r5,  8(r12)
+	std	r6, 16(r12)
+	std	r7, 24(r12)
+
+	blr				/* return r3 = status */
diff --git a/arch/powerpc/kernel/ultravisor.c b/arch/powerpc/kernel/ultravisor.c
index dc6021f63c97..02ddf79a9522 100644
--- a/arch/powerpc/kernel/ultravisor.c
+++ b/arch/powerpc/kernel/ultravisor.c
@@ -8,10 +8,14 @@
 #include <linux/init.h>
 #include <linux/printk.h>
 #include <linux/string.h>
+#include <linux/export.h>
 
 #include <asm/ultravisor.h>
 #include <asm/firmware.h>
 
+/* in ucall.S */
+EXPORT_SYMBOL_GPL(ucall);
+
 int __init early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
 					 int depth, void *data)
 {
-- 
2.20.1

