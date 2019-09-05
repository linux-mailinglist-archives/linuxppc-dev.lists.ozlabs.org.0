Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7418FAAB05
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 20:30:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PTlT70kdzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 04:30:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PTXK4hfWzDqkm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 04:21:05 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x85IChtc124680
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Sep 2019 14:21:03 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uu70u19ra-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2019 14:21:03 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 5 Sep 2019 19:21:00 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Sep 2019 19:20:57 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x85IKuPR55836852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Sep 2019 18:20:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61EF5AE053;
 Thu,  5 Sep 2019 18:20:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86CC9AE051;
 Thu,  5 Sep 2019 18:20:54 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.95.49])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Sep 2019 18:20:54 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 3/3] powerpc: Use ftrace_graph_ret_addr() when unwinding
Date: Thu,  5 Sep 2019 23:50:30 +0530
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1567707399.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1567707399.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19090518-4275-0000-0000-000003619928
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090518-4276-0000-0000-00003873E295
Message-Id: <dc89c9a887121342d9c7819482c3dabdece2a323.1567707399.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-05_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909050172
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With support for HAVE_FUNCTION_GRAPH_RET_ADDR_PTR,
ftrace_graph_ret_addr() provides more robust unwinding when function
graph is in use. Update show_stack() to use the same.

With dump_stack() added to sysrq_sysctl_handler(), before this patch:
  root@(none):/sys/kernel/debug/tracing# cat /proc/sys/kernel/sysrq
  CPU: 0 PID: 218 Comm: cat Not tainted 5.3.0-rc7-00868-g8453ad4a078c-dirty #20
  Call Trace:
  [c0000000d1e13c30] [c00000000006ab98] return_to_handler+0x0/0x40 (dump_stack+0xe8/0x164) (unreliable)
  [c0000000d1e13c80] [c000000000145680] sysrq_sysctl_handler+0x48/0xb8
  [c0000000d1e13cd0] [c00000000006ab98] return_to_handler+0x0/0x40 (proc_sys_call_handler+0x274/0x2a0)
  [c0000000d1e13d60] [c00000000006ab98] return_to_handler+0x0/0x40 (return_to_handler+0x0/0x40)
  [c0000000d1e13d80] [c00000000006ab98] return_to_handler+0x0/0x40 (__vfs_read+0x3c/0x70)
  [c0000000d1e13dd0] [c00000000006ab98] return_to_handler+0x0/0x40 (vfs_read+0xb8/0x1b0)
  [c0000000d1e13e20] [c00000000006ab98] return_to_handler+0x0/0x40 (ksys_read+0x7c/0x140)

After this patch:
  Call Trace:
  [c0000000d1e33c30] [c00000000006ab58] return_to_handler+0x0/0x40 (dump_stack+0xe8/0x164) (unreliable)
  [c0000000d1e33c80] [c000000000145680] sysrq_sysctl_handler+0x48/0xb8
  [c0000000d1e33cd0] [c00000000006ab58] return_to_handler+0x0/0x40 (proc_sys_call_handler+0x274/0x2a0)
  [c0000000d1e33d60] [c00000000006ab58] return_to_handler+0x0/0x40 (__vfs_read+0x3c/0x70)
  [c0000000d1e33d80] [c00000000006ab58] return_to_handler+0x0/0x40 (vfs_read+0xb8/0x1b0)
  [c0000000d1e33dd0] [c00000000006ab58] return_to_handler+0x0/0x40 (ksys_read+0x7c/0x140)
  [c0000000d1e33e20] [c00000000006ab58] return_to_handler+0x0/0x40 (system_call+0x5c/0x68)

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/process.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 24621e7e5033..f289bdd2b562 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2047,10 +2047,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 	int count = 0;
 	int firstframe = 1;
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	struct ftrace_ret_stack *ret_stack;
-	extern void return_to_handler(void);
-	unsigned long rth = (unsigned long)return_to_handler;
-	int curr_frame = 0;
+	unsigned long ret_addr;
+	int ftrace_idx = 0;
 #endif
 
 	if (tsk == NULL)
@@ -2079,15 +2077,10 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 		if (!firstframe || ip != lr) {
 			printk("["REG"] ["REG"] %pS", sp, ip, (void *)ip);
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
-			if ((ip == rth) && curr_frame >= 0) {
-				ret_stack = ftrace_graph_get_ret_stack(current,
-								  curr_frame++);
-				if (ret_stack)
-					pr_cont(" (%pS)",
-						(void *)ret_stack->ret);
-				else
-					curr_frame = -1;
-			}
+			ret_addr = ftrace_graph_ret_addr(current,
+						&ftrace_idx, ip, stack);
+			if (ret_addr != ip)
+				pr_cont(" (%pS)", (void *)ret_addr);
 #endif
 			if (firstframe)
 				pr_cont(" (unreliable)");
-- 
2.23.0

