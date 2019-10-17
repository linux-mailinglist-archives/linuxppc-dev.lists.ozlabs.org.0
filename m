Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DA3DA878
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 11:38:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v3y5638MzDqch
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 20:38:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46v3px0NXbzDrBm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 20:32:24 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9H9SBOE119922
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 05:32:23 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vpnpmr2mc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 05:32:22 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Thu, 17 Oct 2019 10:32:19 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 17 Oct 2019 10:32:17 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9H9WGI135258606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Oct 2019 09:32:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B3F4C059;
 Thu, 17 Oct 2019 09:32:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B6A14C046;
 Thu, 17 Oct 2019 09:32:13 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.56.216])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Oct 2019 09:32:12 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: christophe.leroy@c-s.fr, mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v6 2/7] Powerpc/Watchpoint: Fix length calculation for
 unaligned target
Date: Thu, 17 Oct 2019 15:01:59 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191017093204.7511-1-ravi.bangoria@linux.ibm.com>
References: <20191017093204.7511-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101709-0028-0000-0000-000003AADD5C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101709-0029-0000-0000-0000246CF9A7
Message-Id: <20191017093204.7511-3-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-17_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910170083
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
Fix this by including next doubleword in the length.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_breakpoint.h |  2 +
 arch/powerpc/kernel/dawr.c               |  6 +--
 arch/powerpc/kernel/hw_breakpoint.c      | 67 +++++++++++++++++-------
 arch/powerpc/kernel/process.c            |  3 ++
 arch/powerpc/kernel/ptrace.c             |  1 +
 5 files changed, 56 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 4a887e85a5f4..ea91ac7f5a27 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -14,6 +14,7 @@ struct arch_hw_breakpoint {
 	unsigned long	address;
 	u16		type;
 	u16		len; /* length of the target data symbol */
+	u16		hw_len; /* length programmed in hw */
 };
 
 /* Note: Don't change the the first 6 bits below as they are in the same order
@@ -73,6 +74,7 @@ static inline void hw_breakpoint_disable(void)
 	brk.address = 0;
 	brk.type = 0;
 	brk.len = 0;
+	brk.hw_len = 0;
 	if (ppc_breakpoint_available())
 		__set_breakpoint(&brk);
 }
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
index 5f66b95b6858..cc14aa6c4a1b 100644
--- a/arch/powerpc/kernel/dawr.c
+++ b/arch/powerpc/kernel/dawr.c
@@ -30,10 +30,10 @@ int set_dawr(struct arch_hw_breakpoint *brk)
 	 * DAWR length is stored in field MDR bits 48:53.  Matches range in
 	 * doublewords (64 bits) baised by -1 eg. 0b000000=1DW and
 	 * 0b111111=64DW.
-	 * brk->len is in bytes.
+	 * brk->hw_len is in bytes.
 	 * This aligns up to double word size, shifts and does the bias.
 	 */
-	mrd = ((brk->len + 7) >> 3) - 1;
+	mrd = ((brk->hw_len + 7) >> 3) - 1;
 	dawrx |= (mrd & 0x3f) << (63 - 53);
 
 	if (ppc_md.set_dawr)
@@ -54,7 +54,7 @@ static ssize_t dawr_write_file_bool(struct file *file,
 				    const char __user *user_buf,
 				    size_t count, loff_t *ppos)
 {
-	struct arch_hw_breakpoint null_brk = {0, 0, 0};
+	struct arch_hw_breakpoint null_brk = {0};
 	size_t rc;
 
 	/* Send error to user if they hypervisor won't allow us to write DAWR */
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 677041cb3c3e..f36274d426ed 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -126,6 +126,49 @@ int arch_bp_generic_fields(int type, int *gen_bp_type)
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
+static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
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
 /*
  * Validate the arch-specific HW Breakpoint register settings
  */
@@ -133,9 +176,9 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 			     const struct perf_event_attr *attr,
 			     struct arch_hw_breakpoint *hw)
 {
-	int ret = -EINVAL, length_max;
+	int ret = -EINVAL;
 
-	if (!bp)
+	if (!bp || !attr->bp_len)
 		return ret;
 
 	hw->type = HW_BRK_TYPE_TRANSLATE;
@@ -155,26 +198,10 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
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
-	length_max = DABR_MAX_LEN; /* DABR */
-	if (dawr_enabled()) {
-		length_max = DAWR_MAX_LEN; /* 64 doublewords */
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
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 639ceae7da9d..4df94b6e2f32 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -715,6 +715,8 @@ static void set_debug_reg_defaults(struct thread_struct *thread)
 {
 	thread->hw_brk.address = 0;
 	thread->hw_brk.type = 0;
+	thread->hw_brk.len = 0;
+	thread->hw_brk.hw_len = 0;
 	if (ppc_breakpoint_available())
 		set_breakpoint(&thread->hw_brk);
 }
@@ -816,6 +818,7 @@ static inline bool hw_brk_match(struct arch_hw_breakpoint *a,
 		return false;
 	if (a->len != b->len)
 		return false;
+	/* no need to check hw_len. it's calculated from address and len */
 	return true;
 }
 
diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
index f22e773a416a..c861b12337bd 100644
--- a/arch/powerpc/kernel/ptrace.c
+++ b/arch/powerpc/kernel/ptrace.c
@@ -2426,6 +2426,7 @@ static int ptrace_set_debugreg(struct task_struct *task, unsigned long addr,
 	hw_brk.address = data & (~HW_BRK_TYPE_DABR);
 	hw_brk.type = (data & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
 	hw_brk.len = DABR_MAX_LEN;
+	hw_brk.hw_len = DABR_MAX_LEN;
 	set_bp = (data) && (hw_brk.type & HW_BRK_TYPE_RDWR);
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	bp = thread->ptrace_bps[0];
-- 
2.21.0

