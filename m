Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A63B325A4A4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 06:39:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhB6r6Dx9zDqgp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TAneLO93; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh9w81rHQzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 14:30:16 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082420fv138888; Wed, 2 Sep 2020 00:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1QEBc2TPjLrv8f8ZCJ9FOnkRyYmJ5xKIJSDmE2ey2rs=;
 b=TAneLO93A8804MyeLnbyreO3o4uljHLPZFeDlrMx6/L1bSAMkqWcubivbWJSiSvUUeNx
 Z5tgbh0Cxg4wdhQ8Vcn0t+SYBUrWP74UKGUVYaBHXQBpC6W/jk9SQ7qBfGEIw7B/3Eow
 hE0fz48aOLalCmXSSgZKaHZN4lD49ZGQfTGes9qo5ZpcY6YVOlQMsBoX7GK8M/XwT2EA
 7DNY0jN/7Ema9X3JeC9sUUbnwL9SuvpBinInuJvAnyej+sGHMJ9iA9t6Oyfiy7d2+FhJ
 ATAPks0HWkq1ezpuInMWRNB6ELwkbDbMD/BGlhpQrtHpjDmwynAlALe4Z2A4zcOTZjii 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a321hqvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 00:30:09 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 082420ZK138878;
 Wed, 2 Sep 2020 00:30:08 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a321hqu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 00:30:08 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0824Rfej025858;
 Wed, 2 Sep 2020 04:30:06 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 337en848cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 04:30:06 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0824U38728508422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 04:30:03 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48E13A4060;
 Wed,  2 Sep 2020 04:30:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA72CA405B;
 Wed,  2 Sep 2020 04:30:00 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.120])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 04:30:00 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@c-s.fr
Subject: [PATCH v6 4/8] powerpc/watchpoint: Move DAWR detection logic outside
 of hw_breakpoint.c
Date: Wed,  2 Sep 2020 09:59:41 +0530
Message-Id: <20200902042945.129369-5-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
References: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_02:2020-09-01,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009020031
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, jniethe5@gmail.com,
 pedromfc@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 rogealve@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Power10 hw has multiple DAWRs but hw doesn't tell which DAWR caused
the exception. So we have a sw logic to detect that in hw_breakpoint.c.
But hw_breakpoint.c gets compiled only with CONFIG_HAVE_HW_BREAKPOINT=Y.
Move DAWR detection logic outside of hw_breakpoint.c so that it can be
reused when CONFIG_HAVE_HW_BREAKPOINT is not set.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_breakpoint.h      |   8 +
 arch/powerpc/kernel/Makefile                  |   3 +-
 arch/powerpc/kernel/hw_breakpoint.c           | 159 +----------------
 .../kernel/hw_breakpoint_constraints.c        | 162 ++++++++++++++++++
 4 files changed, 174 insertions(+), 158 deletions(-)
 create mode 100644 arch/powerpc/kernel/hw_breakpoint_constraints.c

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 9b68eafebf43..81872c420476 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -10,6 +10,7 @@
 #define _PPC_BOOK3S_64_HW_BREAKPOINT_H
 
 #include <asm/cpu_has_feature.h>
+#include <asm/inst.h>
 
 #ifdef	__KERNEL__
 struct arch_hw_breakpoint {
@@ -52,6 +53,13 @@ static inline int nr_wp_slots(void)
 	return cpu_has_feature(CPU_FTR_DAWR1) ? 2 : 1;
 }
 
+bool wp_check_constraints(struct pt_regs *regs, struct ppc_inst instr,
+			  unsigned long ea, int type, int size,
+			  struct arch_hw_breakpoint *info);
+
+void wp_get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
+			 int *type, int *size, unsigned long *ea);
+
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 #include <linux/kdebug.h>
 #include <asm/reg.h>
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index cbf41fb4ee89..a5550c2b24c4 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -45,7 +45,8 @@ obj-y				:= cputable.o syscalls.o \
 				   signal.o sysfs.o cacheinfo.o time.o \
 				   prom.o traps.o setup-common.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
-				   of_platform.o prom_parse.o firmware.o
+				   of_platform.o prom_parse.o firmware.o \
+				   hw_breakpoint_constraints.o
 obj-y				+= ptrace/
 obj-$(CONFIG_PPC64)		+= setup_64.o \
 				   paca.o nvram_64.o note.o syscall_64.o
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index f6b24838ca3c..f4e8f21046f5 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -494,161 +494,6 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 	}
 }
 
-static bool dar_in_user_range(unsigned long dar, struct arch_hw_breakpoint *info)
-{
-	return ((info->address <= dar) && (dar - info->address < info->len));
-}
-
-static bool ea_user_range_overlaps(unsigned long ea, int size,
-				   struct arch_hw_breakpoint *info)
-{
-	return ((ea < info->address + info->len) &&
-		(ea + size > info->address));
-}
-
-static bool dar_in_hw_range(unsigned long dar, struct arch_hw_breakpoint *info)
-{
-	unsigned long hw_start_addr, hw_end_addr;
-
-	hw_start_addr = ALIGN_DOWN(info->address, HW_BREAKPOINT_SIZE);
-	hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE);
-
-	return ((hw_start_addr <= dar) && (hw_end_addr > dar));
-}
-
-static bool ea_hw_range_overlaps(unsigned long ea, int size,
-				 struct arch_hw_breakpoint *info)
-{
-	unsigned long hw_start_addr, hw_end_addr;
-	unsigned long align_size = HW_BREAKPOINT_SIZE;
-
-	/*
-	 * On p10 predecessors, quadword is handle differently then
-	 * other instructions.
-	 */
-	if (!cpu_has_feature(CPU_FTR_ARCH_31) && size == 16)
-		align_size = HW_BREAKPOINT_SIZE_QUADWORD;
-
-	hw_start_addr = ALIGN_DOWN(info->address, align_size);
-	hw_end_addr = ALIGN(info->address + info->len, align_size);
-
-	return ((ea < hw_end_addr) && (ea + size > hw_start_addr));
-}
-
-/*
- * If hw has multiple DAWR registers, we also need to check all
- * dawrx constraint bits to confirm this is _really_ a valid event.
- * If type is UNKNOWN, but privilege level matches, consider it as
- * a positive match.
- */
-static bool check_dawrx_constraints(struct pt_regs *regs, int type,
-				    struct arch_hw_breakpoint *info)
-{
-	if (OP_IS_LOAD(type) && !(info->type & HW_BRK_TYPE_READ))
-		return false;
-
-	/*
-	 * The Cache Management instructions other than dcbz never
-	 * cause a match. i.e. if type is CACHEOP, the instruction
-	 * is dcbz, and dcbz is treated as Store.
-	 */
-	if ((OP_IS_STORE(type) || type == CACHEOP) && !(info->type & HW_BRK_TYPE_WRITE))
-		return false;
-
-	if (is_kernel_addr(regs->nip) && !(info->type & HW_BRK_TYPE_KERNEL))
-		return false;
-
-	if (user_mode(regs) && !(info->type & HW_BRK_TYPE_USER))
-		return false;
-
-	return true;
-}
-
-/*
- * Return true if the event is valid wrt dawr configuration,
- * including extraneous exception. Otherwise return false.
- */
-static bool check_constraints(struct pt_regs *regs, struct ppc_inst instr,
-			      unsigned long ea, int type, int size,
-			      struct arch_hw_breakpoint *info)
-{
-	bool in_user_range = dar_in_user_range(regs->dar, info);
-	bool dawrx_constraints;
-
-	/*
-	 * 8xx supports only one breakpoint and thus we can
-	 * unconditionally return true.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_8xx)) {
-		if (!in_user_range)
-			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
-		return true;
-	}
-
-	if (unlikely(ppc_inst_equal(instr, ppc_inst(0)))) {
-		if (cpu_has_feature(CPU_FTR_ARCH_31) &&
-		    !dar_in_hw_range(regs->dar, info))
-			return false;
-
-		return true;
-	}
-
-	dawrx_constraints = check_dawrx_constraints(regs, type, info);
-
-	if (type == UNKNOWN) {
-		if (cpu_has_feature(CPU_FTR_ARCH_31) &&
-		    !dar_in_hw_range(regs->dar, info))
-			return false;
-
-		return dawrx_constraints;
-	}
-
-	if (ea_user_range_overlaps(ea, size, info))
-		return dawrx_constraints;
-
-	if (ea_hw_range_overlaps(ea, size, info)) {
-		if (dawrx_constraints) {
-			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
-			return true;
-		}
-	}
-	return false;
-}
-
-static int cache_op_size(void)
-{
-#ifdef __powerpc64__
-	return ppc64_caches.l1d.block_size;
-#else
-	return L1_CACHE_BYTES;
-#endif
-}
-
-static void get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
-			     int *type, int *size, unsigned long *ea)
-{
-	struct instruction_op op;
-
-	if (__get_user_instr_inatomic(*instr, (void __user *)regs->nip))
-		return;
-
-	analyse_instr(&op, regs, *instr);
-	*type = GETTYPE(op.type);
-	*ea = op.ea;
-#ifdef __powerpc64__
-	if (!(regs->msr & MSR_64BIT))
-		*ea &= 0xffffffffUL;
-#endif
-
-	*size = GETSIZE(op.type);
-	if (*type == CACHEOP) {
-		*size = cache_op_size();
-		*ea &= ~(*size - 1);
-	} else if (*type == LOAD_VMX || *type == STORE_VMX) {
-		*ea &= ~(*size - 1);
-	}
-}
-
 static bool is_larx_stcx_instr(int type)
 {
 	return type == LARX || type == STCX;
@@ -732,7 +577,7 @@ int hw_breakpoint_handler(struct die_args *args)
 	rcu_read_lock();
 
 	if (!IS_ENABLED(CONFIG_PPC_8xx))
-		get_instr_detail(regs, &instr, &type, &size, &ea);
+		wp_get_instr_detail(regs, &instr, &type, &size, &ea);
 
 	for (i = 0; i < nr_wp_slots(); i++) {
 		bp[i] = __this_cpu_read(bp_per_reg[i]);
@@ -742,7 +587,7 @@ int hw_breakpoint_handler(struct die_args *args)
 		info[i] = counter_arch_bp(bp[i]);
 		info[i]->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
 
-		if (check_constraints(regs, instr, ea, type, size, info[i])) {
+		if (wp_check_constraints(regs, instr, ea, type, size, info[i])) {
 			if (!IS_ENABLED(CONFIG_PPC_8xx) &&
 			    ppc_inst_equal(instr, ppc_inst(0))) {
 				handler_error(bp[i], info[i]);
diff --git a/arch/powerpc/kernel/hw_breakpoint_constraints.c b/arch/powerpc/kernel/hw_breakpoint_constraints.c
new file mode 100644
index 000000000000..867ee4aa026a
--- /dev/null
+++ b/arch/powerpc/kernel/hw_breakpoint_constraints.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/kernel.h>
+#include <linux/uaccess.h>
+#include <linux/sched.h>
+#include <asm/hw_breakpoint.h>
+#include <asm/sstep.h>
+#include <asm/cache.h>
+
+static bool dar_in_user_range(unsigned long dar, struct arch_hw_breakpoint *info)
+{
+	return ((info->address <= dar) && (dar - info->address < info->len));
+}
+
+static bool ea_user_range_overlaps(unsigned long ea, int size,
+				   struct arch_hw_breakpoint *info)
+{
+	return ((ea < info->address + info->len) &&
+		(ea + size > info->address));
+}
+
+static bool dar_in_hw_range(unsigned long dar, struct arch_hw_breakpoint *info)
+{
+	unsigned long hw_start_addr, hw_end_addr;
+
+	hw_start_addr = ALIGN_DOWN(info->address, HW_BREAKPOINT_SIZE);
+	hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE);
+
+	return ((hw_start_addr <= dar) && (hw_end_addr > dar));
+}
+
+static bool ea_hw_range_overlaps(unsigned long ea, int size,
+				 struct arch_hw_breakpoint *info)
+{
+	unsigned long hw_start_addr, hw_end_addr;
+	unsigned long align_size = HW_BREAKPOINT_SIZE;
+
+	/*
+	 * On p10 predecessors, quadword is handle differently then
+	 * other instructions.
+	 */
+	if (!cpu_has_feature(CPU_FTR_ARCH_31) && size == 16)
+		align_size = HW_BREAKPOINT_SIZE_QUADWORD;
+
+	hw_start_addr = ALIGN_DOWN(info->address, align_size);
+	hw_end_addr = ALIGN(info->address + info->len, align_size);
+
+	return ((ea < hw_end_addr) && (ea + size > hw_start_addr));
+}
+
+/*
+ * If hw has multiple DAWR registers, we also need to check all
+ * dawrx constraint bits to confirm this is _really_ a valid event.
+ * If type is UNKNOWN, but privilege level matches, consider it as
+ * a positive match.
+ */
+static bool check_dawrx_constraints(struct pt_regs *regs, int type,
+				    struct arch_hw_breakpoint *info)
+{
+	if (OP_IS_LOAD(type) && !(info->type & HW_BRK_TYPE_READ))
+		return false;
+
+	/*
+	 * The Cache Management instructions other than dcbz never
+	 * cause a match. i.e. if type is CACHEOP, the instruction
+	 * is dcbz, and dcbz is treated as Store.
+	 */
+	if ((OP_IS_STORE(type) || type == CACHEOP) && !(info->type & HW_BRK_TYPE_WRITE))
+		return false;
+
+	if (is_kernel_addr(regs->nip) && !(info->type & HW_BRK_TYPE_KERNEL))
+		return false;
+
+	if (user_mode(regs) && !(info->type & HW_BRK_TYPE_USER))
+		return false;
+
+	return true;
+}
+
+/*
+ * Return true if the event is valid wrt dawr configuration,
+ * including extraneous exception. Otherwise return false.
+ */
+bool wp_check_constraints(struct pt_regs *regs, struct ppc_inst instr,
+			  unsigned long ea, int type, int size,
+			  struct arch_hw_breakpoint *info)
+{
+	bool in_user_range = dar_in_user_range(regs->dar, info);
+	bool dawrx_constraints;
+
+	/*
+	 * 8xx supports only one breakpoint and thus we can
+	 * unconditionally return true.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_8xx)) {
+		if (!in_user_range)
+			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+		return true;
+	}
+
+	if (unlikely(ppc_inst_equal(instr, ppc_inst(0)))) {
+		if (cpu_has_feature(CPU_FTR_ARCH_31) &&
+		    !dar_in_hw_range(regs->dar, info))
+			return false;
+
+		return true;
+	}
+
+	dawrx_constraints = check_dawrx_constraints(regs, type, info);
+
+	if (type == UNKNOWN) {
+		if (cpu_has_feature(CPU_FTR_ARCH_31) &&
+		    !dar_in_hw_range(regs->dar, info))
+			return false;
+
+		return dawrx_constraints;
+	}
+
+	if (ea_user_range_overlaps(ea, size, info))
+		return dawrx_constraints;
+
+	if (ea_hw_range_overlaps(ea, size, info)) {
+		if (dawrx_constraints) {
+			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+			return true;
+		}
+	}
+	return false;
+}
+
+static int cache_op_size(void)
+{
+#ifdef __powerpc64__
+	return ppc64_caches.l1d.block_size;
+#else
+	return L1_CACHE_BYTES;
+#endif
+}
+
+void wp_get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
+			 int *type, int *size, unsigned long *ea)
+{
+	struct instruction_op op;
+
+	if (__get_user_instr_inatomic(*instr, (void __user *)regs->nip))
+		return;
+
+	analyse_instr(&op, regs, *instr);
+	*type = GETTYPE(op.type);
+	*ea = op.ea;
+#ifdef __powerpc64__
+	if (!(regs->msr & MSR_64BIT))
+		*ea &= 0xffffffffUL;
+#endif
+
+	*size = GETSIZE(op.type);
+	if (*type == CACHEOP) {
+		*size = cache_op_size();
+		*ea &= ~(*size - 1);
+	} else if (*type == LOAD_VMX || *type == STORE_VMX) {
+		*ea &= ~(*size - 1);
+	}
+}
-- 
2.26.2

