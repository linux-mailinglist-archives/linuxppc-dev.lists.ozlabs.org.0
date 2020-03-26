Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AD11946CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 19:52:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pDcd2x3lzDqTn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 05:52:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pDYp2pNnzDqTW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 05:49:50 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02QIWoZn130911
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 14:49:47 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0rjkac-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 14:49:47 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Thu, 26 Mar 2020 18:49:40 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 26 Mar 2020 18:49:37 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02QInfPC51380418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 18:49:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4F5F52054;
 Thu, 26 Mar 2020 18:49:40 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.184.69])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C865E5204E;
 Thu, 26 Mar 2020 18:49:38 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4] powerpc/pseries: Handle UE event for memcpy_mcsafe
Date: Fri, 27 Mar 2020 00:19:16 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 20032618-0008-0000-0000-00000364CED4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032618-0009-0000-0000-00004A8645FC
Message-Id: <20200326184916.31172-1-ganeshgr@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_10:2020-03-26,
 2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=438 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260138
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
Cc: mahesh@linux.vnet.ibm.com, santosh@fossix.org,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

memcpy_mcsafe has been implemented for power machines which is used
by pmem infrastructure, so that an UE encountered during memcpy from
pmem devices would not result in panic instead a right error code
is returned. The implementation expects machine check handler to ignore
the event and set nip to continue the execution from fixup code.

Appropriate changes are already made to powernv machine check handler,
make similar changes to pseries machine check handler to ignore the
the event and set nip to continue execution at the fixup entry if we
hit UE at an instruction with a fixup entry.

while we are at it, have a common function which searches the exception
table entry and updates nip with fixup address, and any future common
changes can be made in this function that are valid for both architectures.

powernv changes are made by
commit 895e3dceeb97 ("powerpc/mce: Handle UE event for memcpy_mcsafe")

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Reviewed-by: Santosh S <santosh@fossix.org>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
V2: Fixes a trivial checkpatch error in commit msg.
V3: Use proper subject prefix.
V4: Rephrase the commit message.
    Define a common function to update nip with fixup address.
---
 arch/powerpc/include/asm/mce.h       |  2 ++
 arch/powerpc/kernel/mce.c            | 14 ++++++++++++++
 arch/powerpc/kernel/mce_power.c      |  8 ++------
 arch/powerpc/platforms/pseries/ras.c |  3 +++
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 6a6ddaabdb34..376a395daf32 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -218,6 +218,8 @@ extern void machine_check_queue_event(void);
 extern void machine_check_print_event_info(struct machine_check_event *evt,
 					   bool user_mode, bool in_guest);
 unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
+extern void mce_common_process_ue(struct pt_regs *regs,
+				  struct mce_error_info *mce_err);
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 34c1001e9e8b..8077b5fb18a7 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -15,6 +15,7 @@
 #include <linux/percpu.h>
 #include <linux/export.h>
 #include <linux/irq_work.h>
+#include <linux/extable.h>
 
 #include <asm/machdep.h>
 #include <asm/mce.h>
@@ -251,6 +252,19 @@ void machine_check_queue_event(void)
 	/* Queue irq work to process this event later. */
 	irq_work_queue(&mce_event_process_work);
 }
+
+void mce_common_process_ue(struct pt_regs *regs,
+			   struct mce_error_info *mce_err)
+{
+	const struct exception_table_entry *entry;
+
+	entry = search_kernel_exception_table(regs->nip);
+	if (entry) {
+		mce_err->ignore_event = true;
+		regs->nip = extable_fixup(entry);
+	}
+}
+
 /*
  * process pending MCE event from the mce event queue. This function will be
  * called during syscall exit.
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 1cbf7f1a4e3d..067b094bfeff 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -579,14 +579,10 @@ static long mce_handle_ue_error(struct pt_regs *regs,
 				struct mce_error_info *mce_err)
 {
 	long handled = 0;
-	const struct exception_table_entry *entry;
 
-	entry = search_kernel_exception_table(regs->nip);
-	if (entry) {
-		mce_err->ignore_event = true;
-		regs->nip = extable_fixup(entry);
+	mce_common_process_ue(regs, mce_err);
+	if (mce_err->ignore_event)
 		return 1;
-	}
 
 	/*
 	 * On specific SCOM read via MMIO we may get a machine check
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 43710b69e09e..1d1da639b8b7 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -558,6 +558,9 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	switch (mce_log->error_type) {
 	case MC_ERROR_TYPE_UE:
 		mce_err.error_type = MCE_ERROR_TYPE_UE;
+		mce_common_process_ue(regs, &mce_err);
+		if (mce_err.ignore_event)
+			disposition = RTAS_DISP_FULLY_RECOVERED;
 		switch (err_sub_type) {
 		case MC_ERROR_UE_IFETCH:
 			mce_err.u.ue_error_type = MCE_UE_ERROR_IFETCH;
-- 
2.17.2

