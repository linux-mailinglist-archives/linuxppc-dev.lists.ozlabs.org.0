Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904449867
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 06:40:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Sb3d3pRMzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:40:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SZnb644czDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 14:28:03 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I4RMu8152084
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 00:28:01 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t6nt15pnv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 00:28:00 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 18 Jun 2019 05:27:59 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 05:27:56 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5I4Rtul36241720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 04:27:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6078811C050;
 Tue, 18 Jun 2019 04:27:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59D7311C064;
 Tue, 18 Jun 2019 04:27:52 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.63.86])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jun 2019 04:27:52 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 5/5] Powerpc/Watchpoint: Fix length calculation for unaligned
 target
Date: Tue, 18 Jun 2019 09:57:32 +0530
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061804-4275-0000-0000-0000034336F6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061804-4276-0000-0000-000038535CFC
Message-Id: <20190618042732.5582-6-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180035
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Watchpoint match range is always doubleword(8 bytes) aligned on
powerpc. If the given range is crossing doubleword boundary, we
need to increase the length such that next doubleword also get
covered. Ex,

          address   len = 6 bytes
                |=========.
   |------------v--|------v--------|
   | | | | | | | | | | | | | | | | |
   |---------------|---------------|
    <---8 bytes--->

In such case, current code configures hw as:
  start_addr = address & ~HW_BREAKPOINT_ALIGN
  len = 8 bytes

And thus read/write in last 4 bytes of the given range is ignored.
Fix this by including next doubleword in the length. Watchpoint
exception handler already ignores extraneous exceptions, so no
changes required for that.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_breakpoint.h |  7 ++--
 arch/powerpc/kernel/hw_breakpoint.c      | 44 +++++++++++++-----------
 arch/powerpc/kernel/process.c            | 34 ++++++++++++++++--
 3 files changed, 60 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 8acbbdd4a2d5..749a357164d5 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -34,6 +34,8 @@ struct arch_hw_breakpoint {
 #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
 				 HW_BRK_TYPE_HYP)
 
+#define HW_BREAKPOINT_ALIGN 0x7
+
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 #include <linux/kdebug.h>
 #include <asm/reg.h>
@@ -45,8 +47,6 @@ struct pmu;
 struct perf_sample_data;
 struct task_struct;
 
-#define HW_BREAKPOINT_ALIGN 0x7
-
 extern int hw_breakpoint_slots(int type);
 extern int arch_bp_generic_fields(int type, int *gen_bp_type);
 extern int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
@@ -76,7 +76,8 @@ static inline void hw_breakpoint_disable(void)
 }
 extern void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs);
 int hw_breakpoint_handler(struct die_args *args);
-
+extern u16 hw_breakpoint_get_final_len(struct arch_hw_breakpoint *brk,
+		unsigned long *start_addr, unsigned long *end_addr);
 extern int set_dawr(struct arch_hw_breakpoint *brk);
 extern bool dawr_force_enable;
 static inline bool dawr_enabled(void)
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 36bcf705df65..c122fd55aa44 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -126,6 +126,28 @@ int arch_bp_generic_fields(int type, int *gen_bp_type)
 	return 0;
 }
 
+/* Maximum len for DABR is 8 bytes and DAWR is 512 bytes */
+static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
+{
+	u16 length_max = 8;
+	u16 final_len;
+	unsigned long start_addr, end_addr;
+
+	final_len = hw_breakpoint_get_final_len(hw, &start_addr, &end_addr);
+
+	if (dawr_enabled()) {
+		length_max = 512;
+		/* DAWR region can't cross 512 bytes boundary */
+		if ((start_addr >> 9) != (end_addr >> 9))
+			return -EINVAL;
+	}
+
+	if (final_len > length_max)
+		return -EINVAL;
+
+	return 0;
+}
+
 /*
  * Validate the arch-specific HW Breakpoint register settings
  */
@@ -133,12 +155,10 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 			     const struct perf_event_attr *attr,
 			     struct arch_hw_breakpoint *hw)
 {
-	int length_max;
-
 	if (!ppc_breakpoint_available())
 		return -ENODEV;
 
-	if (!bp)
+	if (!bp || !attr->bp_len)
 		return -EINVAL;
 
 	hw->type = HW_BRK_TYPE_TRANSLATE;
@@ -160,23 +180,7 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 	hw->address = attr->bp_addr;
 	hw->len = attr->bp_len;
 
-	length_max = 8; /* DABR */
-	if (dawr_enabled()) {
-		length_max = 512 ; /* 64 doublewords */
-		/* DAWR region can't cross 512 bytes boundary */
-		if ((hw->address >> 9) != ((hw->address + hw->len - 1) >> 9))
-			return -EINVAL;
-	}
-
-	/*
-	 * Since breakpoint length can be a maximum of length_max and
-	 * breakpoint addresses are aligned to nearest double-word
-	 * HW_BREAKPOINT_ALIGN by rounding off to the lower address,
-	 * the 'symbolsize' should satisfy the check below.
-	 */
-	if (hw->len > (length_max - (hw->address & HW_BREAKPOINT_ALIGN)))
-		return -EINVAL;
-	return 0;
+	return hw_breakpoint_validate_len(hw);
 }
 
 /*
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 265fac9fb3a4..159aaa70de46 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -802,9 +802,39 @@ static int disable_dawr(void)
 	return 0;
 }
 
+/*
+ * Watchpoint match range is always doubleword(8 bytes) aligned on
+ * powerpc. If the given range is crossing doubleword boundary, we
+ * need to increase the length such that next doubleword also get
+ * covered. Ex,
+ *
+ *          address   len = 6 bytes
+ *                |=========.
+ *   |------------v--|------v--------|
+ *   | | | | | | | | | | | | | | | | |
+ *   |---------------|---------------|
+ *    <---8 bytes--->
+ *
+ * In this case, we should configure hw as:
+ *   start_addr = address & ~HW_BREAKPOINT_ALIGN
+ *   len = 16 bytes
+ *
+ * @start_addr and @end_addr are inclusive.
+ */
+u16 hw_breakpoint_get_final_len(struct arch_hw_breakpoint *brk,
+				unsigned long *start_addr,
+				unsigned long *end_addr)
+{
+	*start_addr = brk->address & ~HW_BREAKPOINT_ALIGN;
+	*end_addr = (brk->address + brk->len - 1) | HW_BREAKPOINT_ALIGN;
+	return *end_addr - *start_addr + 1;
+}
+
 int set_dawr(struct arch_hw_breakpoint *brk)
 {
 	unsigned long dawr, dawrx, mrd;
+	unsigned long start_addr, end_addr;
+	u16 final_len;
 
 	if (brk->type == HW_BRK_TYPE_DISABLE)
 		return disable_dawr();
@@ -815,8 +845,8 @@ int set_dawr(struct arch_hw_breakpoint *brk)
 	dawrx |= ((brk->type & HW_BRK_TYPE_TRANSLATE) >> 2) << (63 - 59);
 	dawrx |= (brk->type & HW_BRK_TYPE_PRIV_ALL) >> 3;
 
-	/* brk->len is in bytes. */
-	mrd = ((brk->len + 7) >> 3) - 1;
+	final_len = hw_breakpoint_get_final_len(brk, &start_addr, &end_addr);
+	mrd = ((final_len + 7) >> 3) - 1;
 	dawrx |= (mrd & 0x3f) << (63 - 53);
 
 	if (ppc_md.set_dawr)
-- 
2.20.1

