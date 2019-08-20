Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C6995433
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:18:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CDwP0rgQzDqT5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CDqr22MJzDqlX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:13:59 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K2CcPt003928; Mon, 19 Aug 2019 22:13:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ug669382f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 22:13:51 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7K2CbSh003836;
 Mon, 19 Aug 2019 22:13:51 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ug6693823-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 22:13:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7K29o2K018741;
 Tue, 20 Aug 2019 02:13:50 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 2ue976j2vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2019 02:13:50 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7K2Dmba49152432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 02:13:49 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF721C6057;
 Tue, 20 Aug 2019 02:13:48 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2B0CC6059;
 Tue, 20 Aug 2019 02:13:45 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.220.248])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 02:13:45 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 01/16] powerpc/kernel: Add ucall_norets() ultravisor call
 handler
Date: Mon, 19 Aug 2019 23:13:11 -0300
Message-Id: <20190820021326.6884-2-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820021326.6884-1-bauerman@linux.ibm.com>
References: <20190820021326.6884-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200018
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Claudio Carvalho <cclaudio@linux.ibm.com>

The ultracalls (ucalls for short) allow the Secure Virtual Machines
(SVM)s and hypervisor to request services from the ultravisor such as
accessing a register or memory region that can only be accessed when
running in ultravisor-privileged mode.

This patch adds the ucall_norets() ultravisor call handler. Like
plpar_hcall_norets(), it also saves and restores the Condition
Register (CR).

The specific service needed from an ucall is specified in register
R3 (the first parameter to the ucall). Other parameters to the
ucall, if any, are specified in registers R4 through R12.

Return value of all ucalls is in register R3. Other output values
from the ucall, if any, are returned in registers R4 through R12.

Each ucall returns specific error codes, applicable in the context
of the ucall. However, like with the PowerPC Architecture Platform
Reference (PAPR), if no specific error code is defined for a particular
situation, then the ucall will fallback to an erroneous
parameter-position based code. i.e U_PARAMETER, U_P2, U_P3 etc depending
on the ucall parameter that may have caused the error.

Every host kernel (powernv) needs to be able to do ucalls in case it
ends up being run in a machine with ultravisor enabled. Otherwise, the
kernel may crash early in boot trying to access ultravisor resources,
for instance, trying to set the partition table entry 0. Secure guests
also need to be able to do ucalls and its kernel may not have
CONFIG_PPC_POWERNV=y. For that reason, the ucall.S file is placed under
arch/powerpc/kernel.

If ultravisor is not enabled, the ucalls will be redirected to the
hypervisor which must handle/fail the call.

Thanks to inputs from Ram Pai and Michael Anderson.

Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/asm-prototypes.h | 11 +++++++++++
 arch/powerpc/include/asm/ultravisor-api.h | 23 +++++++++++++++++++++++
 arch/powerpc/kernel/Makefile              |  1 +
 arch/powerpc/kernel/ucall.S               | 20 ++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index ec1c97a8e8cb..e698f48cbc6d 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -15,6 +15,7 @@
 #include <asm/epapr_hcalls.h>
 #include <asm/dcr.h>
 #include <asm/mmu_context.h>
+#include <asm/ultravisor-api.h>
 
 #include <uapi/asm/ucontext.h>
 
@@ -34,6 +35,16 @@ extern struct static_key hcall_tracepoint_key;
 void __trace_hcall_entry(unsigned long opcode, unsigned long *args);
 void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf);
 
+/* Ultravisor */
+#ifdef CONFIG_PPC_POWERNV
+long ucall_norets(unsigned long opcode, ...);
+#else
+static inline long ucall_norets(unsigned long opcode, ...)
+{
+	return U_NOT_AVAILABLE;
+}
+#endif
+
 /* OPAL */
 int64_t __opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 		    int64_t a4, int64_t a5, int64_t a6, int64_t a7,
diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
new file mode 100644
index 000000000000..88ffa78f9d61
--- /dev/null
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Ultravisor API.
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
+#define U_FUNCTION		H_FUNCTION
+#define U_NOT_AVAILABLE		H_NOT_AVAILABLE
+#define U_P2			H_P2
+#define U_P3			H_P3
+#define U_P4			H_P4
+#define U_P5			H_P5
+#define U_PARAMETER		H_PARAMETER
+#define U_SUCCESS		H_SUCCESS
+
+#endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index ea0c69236789..c6c4ea240b2a 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -156,6 +156,7 @@ endif
 
 obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
+obj-$(CONFIG_PPC_POWERNV)	+= ucall.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
diff --git a/arch/powerpc/kernel/ucall.S b/arch/powerpc/kernel/ucall.S
new file mode 100644
index 000000000000..de9133e45d21
--- /dev/null
+++ b/arch/powerpc/kernel/ucall.S
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Generic code to perform an ultravisor call.
+ *
+ * Copyright 2019, IBM Corporation.
+ *
+ */
+#include <asm/ppc_asm.h>
+#include <asm/export.h>
+
+_GLOBAL(ucall_norets)
+EXPORT_SYMBOL_GPL(ucall_norets)
+	mfcr	r0
+	stw	r0,8(r1)
+
+	sc	2		/* Invoke the ultravisor */
+
+	lwz	r0,8(r1)
+	mtcrf	0xff,r0
+	blr			/* Return r3 = status */
