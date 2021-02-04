Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFBD30F12C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 11:49:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWb0F4tZLzDwx9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 21:49:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Exgd04b4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWZyQ01rFzDqQW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 21:47:57 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114Aa661170102; Thu, 4 Feb 2021 05:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HPR6DlPSP7KvGkC0gv83txqaiUk9ktfHmIcuRJJqKpY=;
 b=Exgd04b4gLK9KpVrnMDSBHhzM+TX7hbZSkpiNhkB9Y5jsEXOjsUCi8xVqkp/3w1dCbsU
 HmFDrzyfhwjCWSkoevy6QATlcd1SpVe8anfBcaB7HDfdNccoHcrsRZIJ6DbvrdRzowaa
 bodTTjJberNEKLRV2Q1CpuEIimOU9luoxOiOjHXsiZhHyK/Asm0l9LXcdLiJr/oRIkie
 HAWSUNFzkhXS8VvhS8AlIBFkaOb35rrMCSrSHTNrUylF6W/pI1i+vsXPvvkiZmnIEC2q
 zLBLtz8rhw89cZMs6OGUgjNz3D8NRnNwQ4tOS+v85pdNu5KDrYrrSgKNC3XpI+rp2oFC 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gcu8m9x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 05:47:25 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 114Aa9EL170232;
 Thu, 4 Feb 2021 05:47:24 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gcu8m9uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 05:47:24 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114AgAkT020751;
 Thu, 4 Feb 2021 10:47:20 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 36g2a90a01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 10:47:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114AlGC437355872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 10:47:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B549CA4060;
 Thu,  4 Feb 2021 10:47:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 699F0A4054;
 Thu,  4 Feb 2021 10:47:14 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.39.112])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 10:47:14 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/uprobes: Validation for prefixed instruction
Date: Thu,  4 Feb 2021 16:17:03 +0530
Message-Id: <20210204104703.273429-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_05:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040065
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

Don't allow Uprobe on 2nd word of a prefixed instruction. As per
ISA 3.1, prefixed instruction should not cross 64-byte boundary.
So don't allow Uprobe on such prefixed instruction as well.

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
v1: http://lore.kernel.org/r/20210119091234.76317-1-ravi.bangoria@linux.ibm.com
v1->v2:
  - Instead of introducing new arch hook from verify_opcode(), use
    existing hook arch_uprobe_analyze_insn().
  - Add explicit check for prefixed instruction crossing 64-byte
    boundary. If probe is on such instruction, throw an error.

 arch/powerpc/kernel/uprobes.c | 66 ++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index e8a63713e655..485d19a2a31f 100644
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
@@ -28,6 +29,69 @@ bool is_trap_insn(uprobe_opcode_t *insn)
 	return (is_trap(*insn));
 }
 
+#ifdef CONFIG_PPC64
+static int get_instr(struct mm_struct *mm, unsigned long addr, u32 *instr)
+{
+	struct page *page;
+	struct vm_area_struct *vma;
+	void *kaddr;
+	unsigned int gup_flags = FOLL_FORCE | FOLL_SPLIT_PMD;
+
+	if (get_user_pages_remote(mm, addr, 1, gup_flags, &page, &vma, NULL) <= 0)
+		return -EINVAL;
+
+	kaddr = kmap_atomic(page);
+	*instr = *((u32 *)(kaddr + (addr & ~PAGE_MASK)));
+	kunmap_atomic(kaddr);
+	put_page(page);
+	return 0;
+}
+
+static int validate_prefixed_instr(struct mm_struct *mm, unsigned long addr)
+{
+	struct ppc_inst inst;
+	u32 prefix, suffix;
+
+	/*
+	 * No need to check if addr is pointing to beginning of the
+	 * page. Even if probe is on a suffix of page-unaligned
+	 * prefixed instruction, hw will raise exception and kernel
+	 * will send SIGBUS.
+	 */
+	if (!(addr & ~PAGE_MASK))
+		return 0;
+
+	if (get_instr(mm, addr, &prefix) < 0)
+		return -EINVAL;
+	if (get_instr(mm, addr + 4, &suffix) < 0)
+		return -EINVAL;
+
+	inst = ppc_inst_prefix(prefix, suffix);
+	if (ppc_inst_prefixed(inst) && (addr & 0x3F) == 0x3C) {
+		printk_ratelimited("Cannot register a uprobe on 64 byte "
+				   "unaligned prefixed instruction\n");
+		return -EINVAL;
+	}
+
+	suffix = prefix;
+	if (get_instr(mm, addr - 4, &prefix) < 0)
+		return -EINVAL;
+
+	inst = ppc_inst_prefix(prefix, suffix);
+	if (ppc_inst_prefixed(inst)) {
+		printk_ratelimited("Cannot register a uprobe on the second "
+				   "word of prefixed instruction\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+#else
+static int validate_prefixed_instr(struct mm_struct *mm, unsigned long addr)
+{
+	return 0;
+}
+#endif
+
 /**
  * arch_uprobe_analyze_insn
  * @mm: the probed address space.
@@ -41,7 +105,7 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
 	if (addr & 0x03)
 		return -EINVAL;
 
-	return 0;
+	return validate_prefixed_instr(mm, addr);
 }
 
 /*
-- 
2.26.2

