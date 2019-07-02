Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 335A85C8E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:39:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCjt4QnZzDqKM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:39:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCQh5SvCzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:26:36 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x625NTtV094793
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 2 Jul 2019 01:26:32 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tfxgbn5hc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2019 01:26:32 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 2 Jul 2019 06:26:30 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Jul 2019 06:26:27 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x625QQl925166006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jul 2019 05:26:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C54534C04A;
 Tue,  2 Jul 2019 05:26:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AF9B4C050;
 Tue,  2 Jul 2019 05:26:25 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.195])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jul 2019 05:26:24 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v2 1/2] Powerpc/Watchpoint: Fix length calculation for
 unaligned target
Date: Tue,  2 Jul 2019 10:56:13 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070205-0008-0000-0000-000002F8FEC7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070205-0009-0000-0000-000022664613
Message-Id: <20190702052614.10408-1-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907020060
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
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
v1->v2:
 - v1: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-June/192162.html 
 - No cosmetic patches.
 - v1 fixed unaligned issue in core hw-breakpoint code only. But 
   ptrace was still messing up with address/len. Fix that in v2. 

 arch/powerpc/include/asm/debug.h         |  1 +
 arch/powerpc/include/asm/hw_breakpoint.h |  9 ++++-
 arch/powerpc/kernel/hw_breakpoint.c      | 26 +++---------
 arch/powerpc/kernel/process.c            | 50 +++++++++++++++++++++++-
 arch/powerpc/kernel/ptrace.c             | 37 ++++++++++--------
 arch/powerpc/xmon/xmon.c                 |  3 +-
 6 files changed, 83 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index 7756026b95ca..9c1b4aaa374b 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -45,6 +45,7 @@ static inline int debugger_break_match(struct pt_regs *regs) { return 0; }
 static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
 #endif
 
+int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw);
 void __set_breakpoint(struct arch_hw_breakpoint *brk);
 bool ppc_breakpoint_available(void);
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 0fe8c1e46bbc..ca2877be7f79 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -28,6 +28,7 @@ struct arch_hw_breakpoint {
 	unsigned long	address;
 	u16		type;
 	u16		len; /* length of the target data symbol */
+	u16		hw_len; /* length programmed in hw */
 };
 
 /* Note: Don't change the the first 6 bits below as they are in the same order
@@ -47,6 +48,11 @@ struct arch_hw_breakpoint {
 #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
 				 HW_BRK_TYPE_HYP)
 
+#define HW_BREAKPOINT_ALIGN 0x7
+
+#define DABR_MAX_LEN	8
+#define DAWR_MAX_LEN	512
+
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 #include <linux/kdebug.h>
 #include <asm/reg.h>
@@ -58,8 +64,6 @@ struct pmu;
 struct perf_sample_data;
 struct task_struct;
 
-#define HW_BREAKPOINT_ALIGN 0x7
-
 extern int hw_breakpoint_slots(int type);
 extern int arch_bp_generic_fields(int type, int *gen_bp_type);
 extern int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
@@ -84,6 +88,7 @@ static inline void hw_breakpoint_disable(void)
 	brk.address = 0;
 	brk.type = 0;
 	brk.len = 0;
+	brk.hw_len = 0;
 	if (ppc_breakpoint_available())
 		__set_breakpoint(&brk);
 }
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index da307dd93ee3..a61a1266089a 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -147,9 +147,9 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 			     const struct perf_event_attr *attr,
 			     struct arch_hw_breakpoint *hw)
 {
-	int ret = -EINVAL, length_max;
+	int ret = -EINVAL;
 
-	if (!bp)
+	if (!bp || !attr->bp_len)
 		return ret;
 
 	hw->type = HW_BRK_TYPE_TRANSLATE;
@@ -169,26 +169,10 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 	hw->address = attr->bp_addr;
 	hw->len = attr->bp_len;
 
-	/*
-	 * Since breakpoint length can be a maximum of HW_BREAKPOINT_LEN(8)
-	 * and breakpoint addresses are aligned to nearest double-word
-	 * HW_BREAKPOINT_ALIGN by rounding off to the lower address, the
-	 * 'symbolsize' should satisfy the check below.
-	 */
 	if (!ppc_breakpoint_available())
 		return -ENODEV;
-	length_max = 8; /* DABR */
-	if (dawr_enabled()) {
-		length_max = 512 ; /* 64 doublewords */
-		/* DAWR region can't cross 512 boundary */
-		if ((attr->bp_addr >> 9) !=
-		    ((attr->bp_addr + attr->bp_len - 1) >> 9))
-			return -EINVAL;
-	}
-	if (hw->len >
-	    (length_max - (hw->address & HW_BREAKPOINT_ALIGN)))
-		return -EINVAL;
-	return 0;
+
+	return hw_breakpoint_validate_len(hw);
 }
 
 /*
@@ -388,7 +372,7 @@ static ssize_t dawr_write_file_bool(struct file *file,
 				    const char __user *user_buf,
 				    size_t count, loff_t *ppos)
 {
-	struct arch_hw_breakpoint null_brk = {0, 0, 0};
+	struct arch_hw_breakpoint null_brk = {0, 0, 0, 0};
 	size_t rc;
 
 	/* Send error to user if they hypervisor won't allow us to write DAWR */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 87da40129927..97383c4e505e 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -732,6 +732,8 @@ static void set_debug_reg_defaults(struct thread_struct *thread)
 {
 	thread->hw_brk.address = 0;
 	thread->hw_brk.type = 0;
+	thread->hw_brk.len = 0;
+	thread->hw_brk.hw_len = 0;
 	if (ppc_breakpoint_available())
 		set_breakpoint(&thread->hw_brk);
 }
@@ -797,6 +799,49 @@ static inline int set_dabr(struct arch_hw_breakpoint *brk)
 	return __set_dabr(dabr, dabrx);
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
+int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
+{
+	u16 max_len = DABR_MAX_LEN;
+	u16 hw_len;
+	unsigned long start_addr, end_addr;
+
+	start_addr = hw->address & ~HW_BREAKPOINT_ALIGN;
+	end_addr = (hw->address + hw->len - 1) | HW_BREAKPOINT_ALIGN;
+	hw_len = end_addr - start_addr + 1;
+
+	if (dawr_enabled()) {
+		max_len = DAWR_MAX_LEN;
+		/* DAWR region can't cross 512 bytes boundary */
+		if ((start_addr >> 9) != (end_addr >> 9))
+			return -EINVAL;
+	}
+
+	if (hw_len > max_len)
+		return -EINVAL;
+
+	hw->hw_len = hw_len;
+	return 0;
+}
+
 int set_dawr(struct arch_hw_breakpoint *brk)
 {
 	unsigned long dawr, dawrx, mrd;
@@ -812,10 +857,10 @@ int set_dawr(struct arch_hw_breakpoint *brk)
 	/* dawr length is stored in field MDR bits 48:53.  Matches range in
 	   doublewords (64 bits) baised by -1 eg. 0b000000=1DW and
 	   0b111111=64DW.
-	   brk->len is in bytes.
+	   brk->hw_len is in bytes.
 	   This aligns up to double word size, shifts and does the bias.
 	*/
-	mrd = ((brk->len + 7) >> 3) - 1;
+	mrd = ((brk->hw_len + 7) >> 3) - 1;
 	dawrx |= (mrd & 0x3f) << (63 - 53);
 
 	if (ppc_md.set_dawr)
@@ -861,6 +906,7 @@ static inline bool hw_brk_match(struct arch_hw_breakpoint *a,
 		return false;
 	if (a->len != b->len)
 		return false;
+	/* no need to check hw_len. it's calculated from address and len */
 	return true;
 }
 
diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
index 684b0b315c32..fc52c078d921 100644
--- a/arch/powerpc/kernel/ptrace.c
+++ b/arch/powerpc/kernel/ptrace.c
@@ -2425,7 +2425,8 @@ static int ptrace_set_debugreg(struct task_struct *task, unsigned long addr,
 		return -EIO;
 	hw_brk.address = data & (~HW_BRK_TYPE_DABR);
 	hw_brk.type = (data & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
-	hw_brk.len = 8;
+	hw_brk.len = DABR_MAX_LEN;
+	hw_brk.hw_len = DABR_MAX_LEN;
 	set_bp = (data) && (hw_brk.type & HW_BRK_TYPE_RDWR);
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	bp = thread->ptrace_bps[0];
@@ -2439,6 +2440,7 @@ static int ptrace_set_debugreg(struct task_struct *task, unsigned long addr,
 	if (bp) {
 		attr = bp->attr;
 		attr.bp_addr = hw_brk.address;
+		attr.bp_len = DABR_MAX_LEN;
 		arch_bp_generic_fields(hw_brk.type, &attr.bp_type);
 
 		/* Enable breakpoint */
@@ -2456,7 +2458,7 @@ static int ptrace_set_debugreg(struct task_struct *task, unsigned long addr,
 	/* Create a new breakpoint request if one doesn't exist already */
 	hw_breakpoint_init(&attr);
 	attr.bp_addr = hw_brk.address;
-	attr.bp_len = 8;
+	attr.bp_len = DABR_MAX_LEN;
 	arch_bp_generic_fields(hw_brk.type,
 			       &attr.bp_type);
 
@@ -2827,13 +2829,13 @@ static long ppc_set_hwdebug(struct task_struct *child,
 		     struct ppc_hw_breakpoint *bp_info)
 {
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-	int len = 0;
 	struct thread_struct *thread = &(child->thread);
 	struct perf_event *bp;
 	struct perf_event_attr attr;
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 #ifndef CONFIG_PPC_ADV_DEBUG_REGS
 	struct arch_hw_breakpoint brk;
+	int ret = 0;
 #endif
 
 	if (bp_info->version != 1)
@@ -2881,32 +2883,33 @@ static long ppc_set_hwdebug(struct task_struct *child,
 	if ((unsigned long)bp_info->addr >= TASK_SIZE)
 		return -EIO;
 
-	brk.address = bp_info->addr & ~7UL;
+	brk.address = bp_info->addr;
 	brk.type = HW_BRK_TYPE_TRANSLATE;
-	brk.len = 8;
+
+	if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE)
+		brk.len = bp_info->addr2 - bp_info->addr;
+	else if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_EXACT)
+		brk.len = 1;
+	else
+		return -EINVAL;
+
+	ret = hw_breakpoint_validate_len(&brk);
+	if (ret)
+		return ret;
+
 	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
 		brk.type |= HW_BRK_TYPE_READ;
 	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
 		brk.type |= HW_BRK_TYPE_WRITE;
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-	/*
-	 * Check if the request is for 'range' breakpoints. We can
-	 * support it if range < 8 bytes.
-	 */
-	if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE)
-		len = bp_info->addr2 - bp_info->addr;
-	else if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_EXACT)
-		len = 1;
-	else
-		return -EINVAL;
 	bp = thread->ptrace_bps[0];
 	if (bp)
 		return -ENOSPC;
 
 	/* Create a new breakpoint request if one doesn't exist already */
 	hw_breakpoint_init(&attr);
-	attr.bp_addr = (unsigned long)bp_info->addr & ~HW_BREAKPOINT_ALIGN;
-	attr.bp_len = len;
+	attr.bp_addr = (unsigned long)bp_info->addr;
+	attr.bp_len = brk.len;
 	arch_bp_generic_fields(brk.type, &attr.bp_type);
 
 	thread->ptrace_bps[0] = bp = register_user_hw_breakpoint(&attr,
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 1b0149b2bb6c..6069b32e4087 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -886,7 +886,8 @@ static void insert_cpu_bpts(void)
 	if (dabr.enabled) {
 		brk.address = dabr.address;
 		brk.type = (dabr.enabled & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
-		brk.len = 8;
+		brk.len = DABR_MAX_LEN;
+		brk.hw_len = DABR_MAX_LEN;
 		__set_breakpoint(&brk);
 	}
 
-- 
2.20.1

