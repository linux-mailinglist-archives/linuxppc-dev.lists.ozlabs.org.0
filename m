Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA14C1D2E9F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 13:45:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N8q31SbwzDqnc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 21:45:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N8Dq2QBszDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 21:18:51 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EB44tA009155; Thu, 14 May 2020 07:18:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 310uaur9t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 07:18:42 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04EB4Baj009700;
 Thu, 14 May 2020 07:18:41 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 310uaur9sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 07:18:41 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04EBFsFU003490;
 Thu, 14 May 2020 11:18:39 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3100ub1dvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:18:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04EBHPwi55902548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 May 2020 11:17:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBF0442041;
 Thu, 14 May 2020 11:18:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DF9842042;
 Thu, 14 May 2020 11:18:33 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.59.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 May 2020 11:18:33 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v6 12/16] powerpc/watchpoint: Use builtin ALIGN*() macros
Date: Thu, 14 May 2020 16:47:37 +0530
Message-Id: <20200514111741.97993-13-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514111741.97993-1-ravi.bangoria@linux.ibm.com>
References: <20200514111741.97993-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 cotscore=-2147483648 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005140095
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
Cc: christophe.leroy@c-s.fr, apopple@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 peterz@infradead.org, fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently we calculate hw aligned start and end addresses manually.
Replace them with builtin ALIGN_DOWN() and ALIGN() macros.

So far end_addr was inclusive but this patch makes it exclusive (by
avoiding -1) for better readability.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Reviewed-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/include/asm/hw_breakpoint.h  |  5 +++--
 arch/powerpc/kernel/hw_breakpoint.c       | 12 ++++++------
 arch/powerpc/kernel/process.c             |  8 ++++----
 arch/powerpc/kernel/ptrace/ptrace-noadv.c |  2 +-
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index d472b2eb757e..add5aa076919 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -34,10 +34,11 @@ struct arch_hw_breakpoint {
 #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
 				 HW_BRK_TYPE_HYP)
 
+/* Minimum granularity */
 #ifdef CONFIG_PPC_8xx
-#define HW_BREAKPOINT_ALIGN 0x3
+#define HW_BREAKPOINT_SIZE  0x4
 #else
-#define HW_BREAKPOINT_ALIGN 0x7
+#define HW_BREAKPOINT_SIZE  0x8
 #endif
 
 #define DABR_MAX_LEN	8
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 8028a2704874..4366bd0c90c4 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -146,10 +146,10 @@ int arch_bp_generic_fields(int type, int *gen_bp_type)
  *    <---8 bytes--->
  *
  * In this case, we should configure hw as:
- *   start_addr = address & ~HW_BREAKPOINT_ALIGN
+ *   start_addr = address & ~(HW_BREAKPOINT_SIZE - 1)
  *   len = 16 bytes
  *
- * @start_addr and @end_addr are inclusive.
+ * @start_addr is inclusive but @end_addr is exclusive.
  */
 static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
 {
@@ -157,14 +157,14 @@ static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
 	u16 hw_len;
 	unsigned long start_addr, end_addr;
 
-	start_addr = hw->address & ~HW_BREAKPOINT_ALIGN;
-	end_addr = (hw->address + hw->len - 1) | HW_BREAKPOINT_ALIGN;
-	hw_len = end_addr - start_addr + 1;
+	start_addr = ALIGN_DOWN(hw->address, HW_BREAKPOINT_SIZE);
+	end_addr = ALIGN(hw->address + hw->len, HW_BREAKPOINT_SIZE);
+	hw_len = end_addr - start_addr;
 
 	if (dawr_enabled()) {
 		max_len = DAWR_MAX_LEN;
 		/* DAWR region can't cross 512 bytes boundary */
-		if ((start_addr >> 9) != (end_addr >> 9))
+		if (ALIGN(start_addr, SZ_512M) != ALIGN(end_addr - 1, SZ_512M))
 			return -EINVAL;
 	} else if (IS_ENABLED(CONFIG_PPC_8xx)) {
 		/* 8xx can setup a range without limitation */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 77ec1299e2fd..9b11575dcb8a 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -800,12 +800,12 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
 	unsigned long lctrl1 = LCTRL1_CTE_GT | LCTRL1_CTF_LT | LCTRL1_CRWE_RW |
 			       LCTRL1_CRWF_RW;
 	unsigned long lctrl2 = LCTRL2_LW0EN | LCTRL2_LW0LADC | LCTRL2_SLW0EN;
-	unsigned long start_addr = brk->address & ~HW_BREAKPOINT_ALIGN;
-	unsigned long end_addr = (brk->address + brk->len - 1) | HW_BREAKPOINT_ALIGN;
+	unsigned long start_addr = ALIGN_DOWN(brk->address, HW_BREAKPOINT_SIZE);
+	unsigned long end_addr = ALIGN(brk->address + brk->len, HW_BREAKPOINT_SIZE);
 
 	if (start_addr == 0)
 		lctrl2 |= LCTRL2_LW0LA_F;
-	else if (end_addr == ~0U)
+	else if (end_addr == 0)
 		lctrl2 |= LCTRL2_LW0LA_E;
 	else
 		lctrl2 |= LCTRL2_LW0LA_EandF;
@@ -821,7 +821,7 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
 		lctrl1 |= LCTRL1_CRWE_WO | LCTRL1_CRWF_WO;
 
 	mtspr(SPRN_CMPE, start_addr - 1);
-	mtspr(SPRN_CMPF, end_addr + 1);
+	mtspr(SPRN_CMPF, end_addr);
 	mtspr(SPRN_LCTRL1, lctrl1);
 	mtspr(SPRN_LCTRL2, lctrl2);
 
diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index 08cb8c1b504c..697c7e4b5877 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -216,7 +216,7 @@ long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_inf
 	if ((unsigned long)bp_info->addr >= TASK_SIZE)
 		return -EIO;
 
-	brk.address = bp_info->addr & ~HW_BREAKPOINT_ALIGN;
+	brk.address = ALIGN_DOWN(bp_info->addr, HW_BREAKPOINT_SIZE);
 	brk.type = HW_BRK_TYPE_TRANSLATE;
 	brk.len = DABR_MAX_LEN;
 	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
-- 
2.26.2

