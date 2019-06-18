Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 347364A4B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 17:04:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SrvZ55q9zDqcq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 01:04:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SrY21ypWzDqd2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 00:48:06 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IEkkn1113571
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 10:48:00 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t716f2px9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 10:48:00 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 18 Jun 2019 15:47:58 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 15:47:55 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5IElkLZ15991058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 14:47:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6846D11C05B;
 Tue, 18 Jun 2019 14:47:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82F7811C04C;
 Tue, 18 Jun 2019 14:47:52 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.74.6])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jun 2019 14:47:52 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 7/7] powerpc/kprobes: Allow probing on any ftrace address
Date: Tue, 18 Jun 2019 20:17:06 +0530
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061814-0020-0000-0000-0000034B28F5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061814-0021-0000-0000-0000219E7782
Message-Id: <d26f5467577ff0aeecea55e7035ea64e303bdf17.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=239 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180119
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With KPROBES_ON_FTRACE, kprobe is allowed to be inserted on instructions
that branch to _mcount (referred to as ftrace location). With
-mprofile-kernel, we now include the preceding 'mflr r0' as being part
of the ftrace location.

However, by default, probing on an instruction that is not actually the
branch to _mcount() is prohibited, as that is considered to not be at an
instruction boundary. This is not the case on powerpc, so allow the same
by overriding arch_check_ftrace_location()

In addition, we update kprobe_ftrace_handler() to detect this scenarios
and to pass the proper nip to the pre and post probe handlers.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/kprobes-ftrace.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
index 972cb28174b2..6a0bd3c16cb6 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -12,14 +12,34 @@
 #include <linux/preempt.h>
 #include <linux/ftrace.h>
 
+/*
+ * With -mprofile-kernel, we patch two instructions -- the branch to _mcount
+ * as well as the preceding 'mflr r0'. Both these instructions are claimed
+ * by ftrace and we should allow probing on either instruction.
+ */
+int arch_check_ftrace_location(struct kprobe *p)
+{
+	if (ftrace_location((unsigned long)p->addr))
+		p->flags |= KPROBE_FLAG_FTRACE;
+	return 0;
+}
+
 /* Ftrace callback handler for kprobes */
 void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 			   struct ftrace_ops *ops, struct pt_regs *regs)
 {
 	struct kprobe *p;
+	int mflr_kprobe = 0;
 	struct kprobe_ctlblk *kcb;
 
 	p = get_kprobe((kprobe_opcode_t *)nip);
+	if (unlikely(!p)) {
+		p = get_kprobe((kprobe_opcode_t *)(nip - MCOUNT_INSN_SIZE));
+		if (!p)
+			return;
+		mflr_kprobe = 1;
+	}
+
 	if (unlikely(!p) || kprobe_disabled(p))
 		return;
 
@@ -33,6 +53,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 		 */
 		regs->nip -= MCOUNT_INSN_SIZE;
 
+		if (mflr_kprobe)
+			regs->nip -= MCOUNT_INSN_SIZE;
+
 		__this_cpu_write(current_kprobe, p);
 		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
 		if (!p->pre_handler || !p->pre_handler(p, regs)) {
@@ -45,6 +68,8 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 				kcb->kprobe_status = KPROBE_HIT_SSDONE;
 				p->post_handler(p, regs, 0);
 			}
+			if (mflr_kprobe)
+				regs->nip += MCOUNT_INSN_SIZE;
 		}
 		/*
 		 * If pre_handler returns !0, it changes regs->nip. We have to
@@ -57,6 +82,11 @@ NOKPROBE_SYMBOL(kprobe_ftrace_handler);
 
 int arch_prepare_kprobe_ftrace(struct kprobe *p)
 {
+	if ((unsigned long)p->addr & 0x03) {
+		printk("Attempt to register kprobe at an unaligned address\n");
+		return -EILSEQ;
+	}
+
 	p->ainsn.insn = NULL;
 	p->ainsn.boostable = -1;
 	return 0;
-- 
2.22.0

