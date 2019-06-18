Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 413624A4CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 17:08:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ss0P4mYnzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 01:08:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SrYp5xmDzDqcq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 00:48:46 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IEmGwJ133620
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 10:48:44 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t70kuv254-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 10:48:27 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 18 Jun 2019 15:48:10 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 15:47:50 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5IEloJU35127324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 14:47:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC31011C052;
 Tue, 18 Jun 2019 14:47:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0269011C04C;
 Tue, 18 Jun 2019 14:47:48 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.74.6])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jun 2019 14:47:47 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 5/7] powerpc/ftrace: Update ftrace_location() for powerpc
 -mprofile-kernel
Date: Tue, 18 Jun 2019 20:17:04 +0530
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061814-4275-0000-0000-00000343618C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061814-4276-0000-0000-0000385389DF
Message-Id: <186656540d3e6225abd98374e791a13d10d86fab.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=901 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Now that we are patching the preceding 'mflr r0' instruction with
-mprofile-kernel, we need to update ftrace_location[_range]() to
recognise that as being part of ftrace. To do this, we make a small
change to ftrace_location_range() and convert ftrace_cmp_recs() into a
weak function. We implement a custom version of ftrace_cmp_recs() which
looks at the instruction preceding the branch to _mcount() and marks
that instruction as belonging to ftrace if it is a 'nop' or 'mflr r0'.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 31 ++++++++++++++++++++++++++++++
 include/linux/ftrace.h             |  1 +
 kernel/trace/ftrace.c              |  4 ++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 5e2b29808af1..b84046e43207 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -951,6 +951,37 @@ void arch_ftrace_update_code(int command)
 }
 
 #ifdef CONFIG_MPROFILE_KERNEL
+/*
+ * We need to check if the previous instruction is a 'nop' or 'mflr r0'.
+ * If so, we will patch those subsequently and that instruction must be
+ * considered as part of ftrace.
+ */
+int ftrace_cmp_recs(const void *a, const void *b)
+{
+	const struct dyn_ftrace *key = a;
+	const struct dyn_ftrace *rec = b;
+	unsigned int op;
+
+	if (key->flags < rec->ip - MCOUNT_INSN_SIZE)
+		return -1;
+	if (key->ip >= rec->ip + MCOUNT_INSN_SIZE)
+		return 1;
+
+	if (key->flags > rec->ip)
+		return 0;
+
+	/* check the previous instruction */
+	if (probe_kernel_read(&op, (void *)rec->ip - MCOUNT_INSN_SIZE,
+				sizeof(op)))
+		/* assume we own it */
+		return 0;
+
+	if (op != PPC_INST_NOP && op != PPC_INST_MFLR)
+		return -1;
+
+	return 0;
+}
+
 /* Returns 1 if we patched in the mflr */
 static int __ftrace_make_call_prep(struct dyn_ftrace *rec)
 {
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index fa653a561da5..9941987bf510 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -435,6 +435,7 @@ struct dyn_ftrace *ftrace_rec_iter_record(struct ftrace_rec_iter *iter);
 int ftrace_update_record(struct dyn_ftrace *rec, int enable);
 int ftrace_test_record(struct dyn_ftrace *rec, int enable);
 void ftrace_run_stop_machine(int command);
+int ftrace_cmp_recs(const void *a, const void *b);
 unsigned long ftrace_location(unsigned long ip);
 unsigned long ftrace_location_range(unsigned long start, unsigned long end);
 unsigned long ftrace_get_addr_new(struct dyn_ftrace *rec);
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 21d8e201ee80..b5c61db0b452 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1517,7 +1517,7 @@ ftrace_ops_test(struct ftrace_ops *ops, unsigned long ip, void *regs)
 	}
 
 
-static int ftrace_cmp_recs(const void *a, const void *b)
+int __weak ftrace_cmp_recs(const void *a, const void *b)
 {
 	const struct dyn_ftrace *key = a;
 	const struct dyn_ftrace *rec = b;
@@ -1551,7 +1551,7 @@ unsigned long ftrace_location_range(unsigned long start, unsigned long end)
 	key.flags = end;	/* overload flags, as it is unsigned long */
 
 	for (pg = ftrace_pages_start; pg; pg = pg->next) {
-		if (end < pg->records[0].ip ||
+		if (end <= pg->records[0].ip ||
 		    start >= (pg->records[pg->index - 1].ip + MCOUNT_INSN_SIZE))
 			continue;
 		rec = bsearch(&key, pg->records, pg->index,
-- 
2.22.0

