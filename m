Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18611DA881
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 11:40:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v40C3XPDzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 20:40:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46v3q50Q5vzDrCD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 20:32:32 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9H9Exwd102071
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 05:32:27 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vpnaxh3yv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 05:32:25 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Thu, 17 Oct 2019 10:32:24 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 17 Oct 2019 10:32:20 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9H9VlF338404410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Oct 2019 09:31:47 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 312884C04A;
 Thu, 17 Oct 2019 09:32:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C4A44C052;
 Thu, 17 Oct 2019 09:32:16 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.56.216])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Oct 2019 09:32:16 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: christophe.leroy@c-s.fr, mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v6 3/7] Powerpc/Watchpoint: Fix ptrace code that muck around
 with address/len
Date: Thu, 17 Oct 2019 15:02:00 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191017093204.7511-1-ravi.bangoria@linux.ibm.com>
References: <20191017093204.7511-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101709-0016-0000-0000-000002B8DE00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101709-0017-0000-0000-0000331A0550
Message-Id: <20191017093204.7511-4-ravi.bangoria@linux.ibm.com>
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

ptrace_set_debugreg() does not consider new length while overwriting
the watchpoint. Fix that. ppc_set_hwdebug() aligns watchpoint address
to doubleword boundary but does not change the length. If address range
is crossing doubleword boundary and length is less then 8, we will loose
samples from second doubleword. So fix that as well.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_breakpoint.h | 4 ++--
 arch/powerpc/kernel/ptrace.c             | 9 +++------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index ea91ac7f5a27..27ac6f5d2891 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -34,6 +34,8 @@ struct arch_hw_breakpoint {
 #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
 				 HW_BRK_TYPE_HYP)
 
+#define HW_BREAKPOINT_ALIGN 0x7
+
 #define DABR_MAX_LEN	8
 #define DAWR_MAX_LEN	512
 
@@ -48,8 +50,6 @@ struct pmu;
 struct perf_sample_data;
 struct task_struct;
 
-#define HW_BREAKPOINT_ALIGN 0x7
-
 extern int hw_breakpoint_slots(int type);
 extern int arch_bp_generic_fields(int type, int *gen_bp_type);
 extern int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
index c861b12337bd..8ea6f01531f1 100644
--- a/arch/powerpc/kernel/ptrace.c
+++ b/arch/powerpc/kernel/ptrace.c
@@ -2440,6 +2440,7 @@ static int ptrace_set_debugreg(struct task_struct *task, unsigned long addr,
 	if (bp) {
 		attr = bp->attr;
 		attr.bp_addr = hw_brk.address;
+		attr.bp_len = DABR_MAX_LEN;
 		arch_bp_generic_fields(hw_brk.type, &attr.bp_type);
 
 		/* Enable breakpoint */
@@ -2881,7 +2882,7 @@ static long ppc_set_hwdebug(struct task_struct *child,
 	if ((unsigned long)bp_info->addr >= TASK_SIZE)
 		return -EIO;
 
-	brk.address = bp_info->addr & ~7UL;
+	brk.address = bp_info->addr & ~HW_BREAKPOINT_ALIGN;
 	brk.type = HW_BRK_TYPE_TRANSLATE;
 	brk.len = DABR_MAX_LEN;
 	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
@@ -2889,10 +2890,6 @@ static long ppc_set_hwdebug(struct task_struct *child,
 	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
 		brk.type |= HW_BRK_TYPE_WRITE;
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-	/*
-	 * Check if the request is for 'range' breakpoints. We can
-	 * support it if range < 8 bytes.
-	 */
 	if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE)
 		len = bp_info->addr2 - bp_info->addr;
 	else if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_EXACT)
@@ -2905,7 +2902,7 @@ static long ppc_set_hwdebug(struct task_struct *child,
 
 	/* Create a new breakpoint request if one doesn't exist already */
 	hw_breakpoint_init(&attr);
-	attr.bp_addr = (unsigned long)bp_info->addr & ~HW_BREAKPOINT_ALIGN;
+	attr.bp_addr = (unsigned long)bp_info->addr;
 	attr.bp_len = len;
 	arch_bp_generic_fields(brk.type, &attr.bp_type);
 
-- 
2.21.0

