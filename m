Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B10390265
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 15:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqFGk2Cwdz3ckm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 23:26:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fpg+GW+b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fpg+GW+b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqFFC28PBz3035
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 23:25:19 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PD3f2E128328; Tue, 25 May 2021 09:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=wEFwGpdaAmMgJ8tI5lKSYfaLA8z4blkHbwepG++/go0=;
 b=fpg+GW+bvlKAnpGL9nqs20KaFS/pz+9aG3bwZC36r7F6WhWleRR5QDkT2O/Emsp9VMGz
 Pord+v4aozZLJQZWQ1Fw7MQ5cFVU7tL6xvQbxvkCIcWRJthxocmvPSiGYz8Ey7fPQI0f
 e+qhBOz+5EiL2JSD8PLnOw1ojZ1kdL4RtWqOMc9tkIn2w2woZ0QyWJoZNqY5WpR9gSBU
 tND/JqlMe2l7+nJW7Gct8MpFOQY0cZPm3O4w9Jd+QBGef39cGMVWbQf6/KeVhyVRzm3I
 4QZ/bJYWVAnTEnVo10fM3LgVnJjpuFTe9+FyhtQjjxclDvKp7qQrk3VERFj2zfnaXLPa ew== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38rw4w27h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 09:25:11 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PDFCZW023763;
 Tue, 25 May 2021 13:25:09 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 38s1ktg0af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 13:25:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PDP6iQ15532408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 13:25:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0603C4C044;
 Tue, 25 May 2021 13:25:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 985684C04E;
 Tue, 25 May 2021 13:25:04 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.179.98])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 13:25:04 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [V2 2/2] selftests/powerpc: EBB selftest for MMCR0 control for PMU
 SPRs in ISA v3.1
Date: Tue, 25 May 2021 09:24:59 -0400
Message-Id: <1621949099-1470-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1621949099-1470-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1621949099-1470-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 76k55mc78EHNCoSzthkvUIAoLBJnYzCx
X-Proofpoint-ORIG-GUID: 76k55mc78EHNCoSzthkvUIAoLBJnYzCx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_06:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=825 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250081
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
Cc: shirisha.ganta1@ibm.com, kjain@linux.ibm.com, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the MMCR0 control bit (PMCCEXT) in ISA v3.1, read access to
group B registers is restricted when MMCR0 PMCC=0b00. In other
platforms (like power9), the older behaviour works where group B
PMU SPRs are readable.

Patch creates a selftest which verifies that the test takes a
SIGILL when attempting to read PMU registers via helper function
"dump_ebb_state" for ISA v3.1.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/testing/selftests/powerpc/pmu/ebb/Makefile   |  2 +-
 .../powerpc/pmu/ebb/regs_access_pmccext_test.c     | 63 ++++++++++++++++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/ebb/regs_access_pmccext_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/Makefile b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
index c5ecb46..0101606 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
@@ -24,7 +24,7 @@ TEST_GEN_PROGS := reg_access_test event_attributes_test cycles_test	\
 	 fork_cleanup_test ebb_on_child_test			\
 	 ebb_on_willing_child_test back_to_back_ebbs_test	\
 	 lost_exception_test no_handler_test			\
-	 cycles_with_mmcr2_test
+	 cycles_with_mmcr2_test regs_access_pmccext_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/regs_access_pmccext_test.c b/tools/testing/selftests/powerpc/pmu/ebb/regs_access_pmccext_test.c
new file mode 100644
index 0000000..5f1a040
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/ebb/regs_access_pmccext_test.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2021, Athira Rajeev, IBM Corp.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <setjmp.h>
+#include <signal.h>
+
+#include "ebb.h"
+
+
+/*
+ * Test that closing the EBB event clears MMCR0_PMCC and
+ * sets MMCR0_PMCCEXT preventing further read access to the
+ * group B PMU registers.
+ */
+
+static int regs_access_pmccext(void)
+{
+	struct event event;
+
+	SKIP_IF(!ebb_is_supported());
+
+	event_init_named(&event, 0x1001e, "cycles");
+	event_leader_ebb_init(&event);
+
+	FAIL_IF(event_open(&event));
+
+	ebb_enable_pmc_counting(1);
+	setup_ebb_handler(standard_ebb_callee);
+	ebb_global_enable();
+	FAIL_IF(ebb_event_enable(&event));
+
+	mtspr(SPRN_PMC1, pmc_sample_period(sample_period));
+
+	while (ebb_state.stats.ebb_count < 1)
+		FAIL_IF(core_busy_loop());
+
+	ebb_global_disable();
+	event_close(&event);
+
+	FAIL_IF(ebb_state.stats.ebb_count == 0);
+
+	/*
+	 * For ISA v3.1, verify the test takes a SIGILL when reading
+	 * PMU regs after the event is closed. With the control bit
+	 * in MMCR0 (PMCCEXT) restricting access to group B PMU regs,
+	 * sigill is expected.
+	 */
+	if (have_hwcap2(PPC_FEATURE2_ARCH_3_1))
+		FAIL_IF(catch_sigill(dump_ebb_state));
+	else
+		dump_ebb_state();
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(regs_access_pmccext,"regs_access_pmccext");
+}
-- 
1.8.3.1

