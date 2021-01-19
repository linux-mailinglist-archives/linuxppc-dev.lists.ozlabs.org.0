Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB132FB4DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 10:14:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKjfN1kjwzDr3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 20:14:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WmnH56xc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKjcj4BVVzDqsd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 20:13:24 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10J9AjxY134957; Tue, 19 Jan 2021 04:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=B9fPVhsYHZ9MUgvx5shkeAk+LRY3aHnUMBspjKAb654=;
 b=WmnH56xcFfo4qr+gZAKshSPC/i9jp69EncdX3atomCknagdx8SQ7J4S+ijX77Y/g6uVP
 i/QxsX36YAePLFsaa3rrjwHnSGkU1kIKDY6qGlxU9LAWDChYtojnSSVMXr3dLv6Te40N
 lDWqQ2jwg0oRU7cz1MkhwPtKSgOzvig2qTE+fy5a88cpzN/BjviPWoAX7dVQ2VgH5ae3
 75ztiDJ5BirGzS+X6zpIsRIFmMwnUPN2SllZhjYTNwkMnVSBTTpPqRb5ZRVcYJossxbw
 4l2UhVyVu0ET2LCQMI2Va1ZMavsm6jbtghF/M8JoQK7EKCZAE74UB391e44UdWLLZL7Z Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 365v9a89sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 04:12:51 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10J9Cpb4139548;
 Tue, 19 Jan 2021 04:12:51 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 365v9a89sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 04:12:51 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10J9BLQB030385;
 Tue, 19 Jan 2021 09:12:49 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 363qs7jvq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 09:12:49 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10J9Ck6f41484590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 09:12:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6450A4054;
 Tue, 19 Jan 2021 09:12:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0605A405C;
 Tue, 19 Jan 2021 09:12:44 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.45.223])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 09:12:44 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/uprobes: Don't allow probe on suffix of prefixed
 instruction
Date: Tue, 19 Jan 2021 14:42:34 +0530
Message-Id: <20210119091234.76317-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_01:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190052
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, oleg@redhat.com,
 rostedt@goodmis.org, linux-kernel@vger.kernel.org, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Probe on 2nd word of a prefixed instruction is invalid scenario and
should be restricted.

There are two ways probed instruction is changed in mapped pages.
First, when Uprobe is activated, it searches for all the relevant
pages and replace instruction in them. In this case, if we notice
that probe is on the 2nd word of prefixed instruction, error out
directly. Second, when Uprobe is already active and user maps a
relevant page via mmap(), instruction is replaced via mmap() code
path. But because Uprobe is invalid, entire mmap() operation can
not be stopped. In this case just print an error and continue.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/kernel/uprobes.c | 28 ++++++++++++++++++++++++++++
 include/linux/uprobes.h       |  1 +
 kernel/events/uprobes.c       |  8 ++++++++
 3 files changed, 37 insertions(+)

diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index e8a63713e655..c73d5a397164 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -7,6 +7,7 @@
  * Adapted from the x86 port by Ananth N Mavinakayanahalli <ananth@in.ibm.com>
  */
 #include <linux/kernel.h>
+#include <linux/highmem.h>
 #include <linux/sched.h>
 #include <linux/ptrace.h>
 #include <linux/uprobes.h>
@@ -44,6 +45,33 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
 	return 0;
 }
 
+#ifdef CONFIG_PPC64
+int arch_uprobe_verify_opcode(struct page *page, unsigned long vaddr,
+			      uprobe_opcode_t opcode)
+{
+	uprobe_opcode_t prefix;
+	void *kaddr;
+	struct ppc_inst inst;
+
+	/* Don't check if vaddr is pointing to the beginning of page */
+	if (!(vaddr & ~PAGE_MASK))
+		return 0;
+
+	kaddr = kmap_atomic(page);
+	memcpy(&prefix, kaddr + ((vaddr - 4) & ~PAGE_MASK), UPROBE_SWBP_INSN_SIZE);
+	kunmap_atomic(kaddr);
+
+	inst = ppc_inst_prefix(prefix, opcode);
+
+	if (ppc_inst_prefixed(inst)) {
+		printk_ratelimited("Cannot register a uprobe on the second "
+				   "word of prefixed instruction\n");
+		return -1;
+	}
+	return 0;
+}
+#endif
+
 /*
  * arch_uprobe_pre_xol - prepare to execute out of line.
  * @auprobe: the probepoint information.
diff --git a/include/linux/uprobes.h b/include/linux/uprobes.h
index f46e0ca0169c..5a3b45878e13 100644
--- a/include/linux/uprobes.h
+++ b/include/linux/uprobes.h
@@ -128,6 +128,7 @@ extern bool uprobe_deny_signal(void);
 extern bool arch_uprobe_skip_sstep(struct arch_uprobe *aup, struct pt_regs *regs);
 extern void uprobe_clear_state(struct mm_struct *mm);
 extern int  arch_uprobe_analyze_insn(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long addr);
+int arch_uprobe_verify_opcode(struct page *page, unsigned long vaddr, uprobe_opcode_t opcode);
 extern int  arch_uprobe_pre_xol(struct arch_uprobe *aup, struct pt_regs *regs);
 extern int  arch_uprobe_post_xol(struct arch_uprobe *aup, struct pt_regs *regs);
 extern bool arch_uprobe_xol_was_trapped(struct task_struct *tsk);
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index bf9edd8d75be..be02e6c26e3f 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -255,6 +255,12 @@ static void copy_to_page(struct page *page, unsigned long vaddr, const void *src
 	kunmap_atomic(kaddr);
 }
 
+int __weak arch_uprobe_verify_opcode(struct page *page, unsigned long vaddr,
+				     uprobe_opcode_t opcode)
+{
+	return 0;
+}
+
 static int verify_opcode(struct page *page, unsigned long vaddr, uprobe_opcode_t *new_opcode)
 {
 	uprobe_opcode_t old_opcode;
@@ -275,6 +281,8 @@ static int verify_opcode(struct page *page, unsigned long vaddr, uprobe_opcode_t
 	if (is_swbp_insn(new_opcode)) {
 		if (is_swbp)		/* register: already installed? */
 			return 0;
+		if (arch_uprobe_verify_opcode(page, vaddr, old_opcode))
+			return -EINVAL;
 	} else {
 		if (!is_swbp)		/* unregister: was it changed by us? */
 			return 0;
-- 
2.26.2

