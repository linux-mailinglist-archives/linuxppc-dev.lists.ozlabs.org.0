Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 171D45BDD9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 16:14:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cq9v2YF3zDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 00:14:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cq562HXMzDq6K
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 00:10:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45cq541WHqz8t9Z
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 00:10:00 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45cq5360qFz9sPb; Tue,  2 Jul 2019 00:09:59 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45cq5325L3z9sPY
 for <linuxppc-dev@ozlabs.org>; Tue,  2 Jul 2019 00:09:59 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61E8tVa003442
 for <linuxppc-dev@ozlabs.org>; Mon, 1 Jul 2019 10:09:56 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tfjreukd9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 01 Jul 2019 10:09:56 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Mon, 1 Jul 2019 15:09:55 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 15:09:53 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x61E9qkG38863262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 14:09:52 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4522EAC066;
 Mon,  1 Jul 2019 14:09:52 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDB3EAC05B;
 Mon,  1 Jul 2019 14:09:49 +0000 (GMT)
Received: from rino.ibm.com (unknown [9.80.232.19])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 14:09:49 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH] powerpc: Add the ppc_capabilities ELF note
Date: Mon,  1 Jul 2019 11:09:48 -0300
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070114-0064-0000-0000-000003F5BE4C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011359; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01225922; UDB=6.00645354; IPR=6.01007135; 
 MB=3.00027534; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-01 14:09:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070114-0065-0000-0000-00003E196B74
Message-Id: <20190701140948.26775-1-cclaudio@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010175
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
Cc: Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the ppc_capabilities ELF note to the powerpc kernel binary. It is a
bitmap that can be used to advertise kernel capabilities to userland.

This patch also defines PPCCAP_ULTRAVISOR_BIT as being the bit zero.

Suggested-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 arch/powerpc/kernel/Makefile |  2 +-
 arch/powerpc/kernel/note.S   | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/kernel/note.S

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 0ea6c4aa3a20..4ec36fe4325b 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -49,7 +49,7 @@ obj-y				:= cputable.o ptrace.o syscalls.o \
 				   signal.o sysfs.o cacheinfo.o time.o \
 				   prom.o traps.o setup-common.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
-				   of_platform.o prom_parse.o
+				   of_platform.o prom_parse.o note.o
 obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
 				   signal_64.o ptrace32.o \
 				   paca.o nvram_64.o firmware.o
diff --git a/arch/powerpc/kernel/note.S b/arch/powerpc/kernel/note.S
new file mode 100644
index 000000000000..721bf8ce9eb7
--- /dev/null
+++ b/arch/powerpc/kernel/note.S
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PowerPC ELF notes.
+ *
+ * Copyright 2019, IBM Corporation
+ */
+#include <linux/elfnote.h>
+
+/*
+ * Ultravisor-capable bit (PowerNV only).
+ *
+ * Indicate that the powerpc kernel binary knows how to run in an
+ * ultravisor-enabled system.
+ *
+ * In an ultravisor-enabled system, some machine resources are now controlled
+ * by the ultravisor. If the kernel is not ultravisor-capable, but it ends up
+ * being run on a machine with ultravisor, the kernel will probably crash
+ * trying to access ultravisor resources. For instance, it may crash in early
+ * boot trying to set the partition table entry 0.
+ *
+ * In an ultravisor-enabled system, petitboot can warn the user or prevent the
+ * kernel from being run if the ppc_capabilities doesn't exist or the
+ * Ultravisor-capable bit is not set.
+ */
+#if defined(CONFIG_PPC_POWERNV)
+#define PPCCAP_ULTRAVISOR_BIT		(1 << 0)
+#else
+#define PPCCAP_ULTRAVISOR_BIT		0
+#endif
+
+/*
+ * Add the ppc_capabilities ELF note to the powerpc kernel binary. It is a
+ * bitmap that can be used to advertise kernel capabilities to userland.
+ */
+ELFNOTE(ppc_capabilities, 3,
+	.long PPCCAP_ULTRAVISOR_BIT)
-- 
2.20.1

