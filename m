Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D207A38C00A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmchN5tVWz3c5Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 16:51:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XJaD1b0U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XJaD1b0U; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmcfh3lyRz2xvZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 16:49:48 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L6XTKP098640; Fri, 21 May 2021 02:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=L8ZadnABcObnYWaRi3QynUNs2KKY9t8NbDjJfuPG068=;
 b=XJaD1b0U3TpvJQi0Zm91QGZuhpUfZhzx9fHBrrmUaU3DAbgH7fTcNsGutOwX3jHjpOBU
 ArMDmdr+45zNLOQGRCWcdPqZId77nIUWjqeJKeYW2JqSAJAea7EsiHFrvKeR730yBlmx
 Nou0CAkl1b6d3LsEAe2x4LJzeFcMQ0WelwlLJ6GoClRofHZhHt6NW063KWlwpn/VDwli
 EwZHFyMKjk1WShYZYBDUNQlZ/f64zd91hTU2LcpbvfkbSFnkZLpqjI9D683ovqSWFhNq
 2AGnbKX93tSJ9vaFbyhaB1HJRe8ctxl0v9Mi53IHUGyRdi53xR0fKLSxEl4g3a/0mT6o Vw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p77ps30g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 02:49:18 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L6mss2004810;
 Fri, 21 May 2021 06:49:16 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 38j5x89np7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 06:49:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L6nDIT55247182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 06:49:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C95F242041;
 Fri, 21 May 2021 06:49:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FAD042056;
 Fri, 21 May 2021 06:49:11 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.15])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 06:49:10 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Suchanek <msuchanek@suse.de>, Torsten Duwe <duwe@suse.de>
Subject: [RFC PATCH 2/6] powerpc/trace: Add support for stack tracer
Date: Fri, 21 May 2021 12:18:37 +0530
Message-Id: <6ed4941e8ff48729a14b24c8e0d0f876fe8f22e0.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3ZDY7GYSHm63JmWbryuSqgzq5l8ZhIje
X-Proofpoint-GUID: 3ZDY7GYSHm63JmWbryuSqgzq5l8ZhIje
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210043
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

With -mprofile-kernel and ppc32, we call into ftrace at function entry
before the function can establish its own stack frame. This breaks the
ABI since functions are expected to setup a stack frame before calling
into another function. As a consequence of this, when walking the stack,
the ftraced function does not show up in the stack trace.

Fix this by checking for ftrace functions (ftrace_[regs_]call+4) in the
stack trace and looking up the stored nip in pt_regs in its stackframe.
Use the back chain from the stack frame headers to accurately determine
the stack frame sizes, except for the ftraced function on
-mprofile-kernel and ppc32 where we set the frame size to 0.

The max stack tracer ftrace selftest (ftrace/func_stack_tracer.tc)
passes on -mprofile-kernel with this patch.

Before this patch, top of a stack trace with the stack tracer:
        Depth    Size   Location    (44 entries)
        -----    ----   --------
  0)     7616     496   ftrace_call+0x4/0x44
  1)     7120      64   __mod_lruvec_page_state+0x90/0x110
  2)     7056      96   test_clear_page_writeback+0xe4/0x480
  3)     6960      48   end_page_writeback+0xa0/0x1c0
  4)     6912     256   ext4_finish_bio+0x2c0/0x350
  5)     6656     176   ext4_end_bio+0x74/0x280
  6)     6480      64   bio_endio+0x1cc/0x240
  7)     6416     176   blk_update_request+0x2b8/0x640
  8)     6240      64   blk_mq_end_request+0x3c/0x1e0
  9)     6176      48   virtblk_request_done+0x48/0xd0
 10)     6128      48   blk_complete_reqs+0x80/0xa0
 11)     6080     240   __do_softirq+0x150/0x408
 12)     5840      32   irq_exit+0x144/0x150
 13)     5808      80   do_IRQ+0xc8/0x140
 14)     5728      32   hardware_interrupt_common_virt+0x1a4/0x1b0
 15)     5696      64   0x0
 16)     5632     768   virtqueue_notify+0x40/0x80
 17)     4864     240   virtio_queue_rq+0x568/0x610
 18)     4624     256   blk_mq_dispatch_rq_list+0x190/0xbc0
 19)     4368     160   __blk_mq_do_dispatch_sched+0x1f0/0x3d0
 20)     4208      96   __blk_mq_sched_dispatch_requests+0x238/0x2c0
 ...

After this patch:
        Depth    Size   Location    (44 entries)
        -----    ----   --------
  0)     7136       0   rcu_read_unlock_strict+0x8/0x10
  1)     7136      64   __mod_lruvec_page_state+0x90/0x110
  2)     7072      96   test_clear_page_writeback+0xe4/0x480
  3)     6976      48   end_page_writeback+0xa0/0x1c0
  4)     6928     256   ext4_finish_bio+0x2c0/0x350
  5)     6672     176   ext4_end_bio+0x74/0x280
  6)     6496      64   bio_endio+0x1cc/0x240
  7)     6432     176   blk_update_request+0x2b8/0x640
  8)     6256      64   blk_mq_end_request+0x3c/0x1e0
  9)     6192      48   virtblk_request_done+0x48/0xd0
 10)     6144      48   blk_complete_reqs+0x80/0xa0
 11)     6096     240   __do_softirq+0x150/0x408
 12)     5856      32   irq_exit+0x144/0x150
 13)     5824      80   do_IRQ+0xc8/0x140
 14)     5744     784   hardware_interrupt_common_virt+0x1a4/0x1b0
 15)     4960      32   0x0
 16)     4928      48   virtqueue_notify+0x40/0x80
 17)     4880     240   virtio_queue_rq+0x568/0x610
 18)     4640     256   blk_mq_dispatch_rq_list+0x190/0xbc0
 19)     4384     160   __blk_mq_do_dispatch_sched+0x1f0/0x3d0
 20)     4224      96   __blk_mq_sched_dispatch_requests+0x238/0x2c0
 ...

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ftrace.h  | 18 ++++++++
 arch/powerpc/kernel/trace/ftrace.c | 70 ++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index debe8c4f706260..392296df70e96c 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -126,6 +126,24 @@ static inline void this_cpu_enable_ftrace(void) { }
 static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled) { }
 static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
 #endif /* CONFIG_PPC64 */
+
+#ifdef CONFIG_FUNCTION_TRACER
+/*
+ * With ppc64 -mprofile-kernel and ppc32, mcount call is made before a function
+ * establishes its own stack frame. While unwinding the stack, such functions
+ * do not appear in the trace. This helper returns the traced function if ip in
+ * the stack frame points to ftrace_[regs_]call.
+ *
+ * In ppc64 ELFv1, mcount call is after a function establishes its own
+ * stackframe. So, this always returns 0.
+ */
+unsigned long ftrace_get_traced_func_if_no_stackframe(unsigned long ip, unsigned long *stack);
+#else
+static inline unsigned long ftrace_get_traced_func_if_no_stackframe(unsigned long ip, unsigned long *stack)
+{
+	return 0;
+}
+#endif /* FUNCTION_TRACER */
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_FTRACE */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index ffe9537195aa33..ec1072d9a858d0 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -21,6 +21,7 @@
 #include <linux/percpu.h>
 #include <linux/init.h>
 #include <linux/list.h>
+#include <linux/sched/task_stack.h>
 
 #include <asm/asm-prototypes.h>
 #include <asm/cacheflush.h>
@@ -987,3 +988,72 @@ char *arch_ftrace_match_adjust(char *str, const char *search)
 		return str;
 }
 #endif /* PPC64_ELF_ABI_v1 */
+
+static int is_ftrace_entry(unsigned long ip)
+{
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	if (ip == (unsigned long)&ftrace_call + 4 || ip == (unsigned long)&ftrace_regs_call + 4)
+#else
+	if (ip == (unsigned long)&ftrace_call + 4)
+#endif
+		return 1;
+
+	return 0;
+}
+
+unsigned long ftrace_get_traced_func_if_no_stackframe(unsigned long ip, unsigned long *stack)
+{
+	if (!is_ftrace_entry(ip))
+		return 0;
+
+	if (IS_ENABLED(CONFIG_PPC32))
+		return stack[11]; /* see MCOUNT_SAVE_FRAME */
+
+	if (!IS_ENABLED(CONFIG_MPROFILE_KERNEL))
+		return 0;
+
+	return stack[(STACK_FRAME_OVERHEAD + offsetof(struct pt_regs, nip)) / sizeof(unsigned long)];
+}
+
+#ifdef CONFIG_STACK_TRACER
+void stack_get_trace(unsigned long traced_ip,
+		     unsigned long *stack_ref __maybe_unused,
+		     unsigned long stack_size __maybe_unused,
+		     int *tracer_frame)
+{
+	unsigned long sp, newsp, top, ip;
+	int ftrace_call_found = 0;
+	unsigned long *stack;
+	int i = 0;
+
+	sp = current_stack_frame();
+	top = (unsigned long)task_stack_page(current) + THREAD_SIZE;
+
+	while (validate_sp(sp, current, STACK_FRAME_OVERHEAD) && i < STACK_TRACE_ENTRIES) {
+		stack = (unsigned long *) sp;
+		newsp = stack[0];
+		ip = stack[STACK_FRAME_LR_SAVE];
+
+		if (ftrace_call_found) {
+			stack_dump_trace[i] = ip;
+			stack_trace_index[i++] = top - sp;
+		}
+
+		if (is_ftrace_entry(ip)) {
+			if (IS_ENABLED(CONFIG_MPROFILE_KERNEL) || IS_ENABLED(CONFIG_PPC32)) {
+				stack_dump_trace[i] = ftrace_get_traced_func_if_no_stackframe(ip, stack);
+				stack_trace_index[i++] = top - newsp;
+			}
+			if (unlikely(!*tracer_frame)) {
+				*tracer_frame = newsp - (unsigned long)stack_ref;
+				stack_trace_max_size -= *tracer_frame;
+			}
+			ftrace_call_found = 1;
+		}
+
+		sp = newsp;
+	}
+
+	stack_trace_nr_entries = i;
+}
+#endif
-- 
2.30.2

