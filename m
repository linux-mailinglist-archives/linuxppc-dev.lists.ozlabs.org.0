Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5996338C00D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmcht1m30z3c9D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 16:51:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hC/Rmkhg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hC/Rmkhg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmcfk5fpkz302c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 16:49:50 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L6YFHW106555; Fri, 21 May 2021 02:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9gXwWu7kVsWsnV0jOjC1VbrCXnrOp0qiZR39j0/dF3U=;
 b=hC/RmkhggcU56nVg7Mmlguitw7GuLhFAJQU137gs1sU4RjUN9c+xLclMjKNiuqEKJ3/a
 z4AhA+oDthcGmJJosUzHj6w081imfWedQ08lOd97C8qYt/wuG5ZWy40Cm3huocf4dT8S
 d1dB/ho/kkET1qgQKVAv87ef+H+qq6NsQf0emNdFWftjNmixBUjYbw3cGlxRMHrwXWhF
 yNv/xXC36ziUwFFjr/AL1aZ/IMv23LFHwcS2NdrTSKzKMmFhQw82AWbeQpVWpCm1ciLh
 M+Q9eZhVaj8yLf8j8fzDqgWR4kVsPwAR5mW7dEJNUGPf3Og4kJ8+qR4Cx917BP1uQNcw dw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p7pkrbxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 02:49:21 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L6n4tf002702;
 Fri, 21 May 2021 06:49:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 38j5jgtyrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 06:49:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14L6mmAx27394318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 06:48:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B52442045;
 Fri, 21 May 2021 06:49:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F1D54204C;
 Fri, 21 May 2021 06:49:14 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.15])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 06:49:14 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Suchanek <msuchanek@suse.de>, Torsten Duwe <duwe@suse.de>
Subject: [RFC PATCH 3/6] powerpc: Indicate traced function name in show_stack()
Date: Fri, 21 May 2021 12:18:38 +0530
Message-Id: <9358c81e47f9d395d90691f77f50feaf20be963e.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lQUZm0Oq1wdJ3ZjOptMHT9YDmOJRwvm3
X-Proofpoint-ORIG-GUID: lQUZm0Oq1wdJ3ZjOptMHT9YDmOJRwvm3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 mlxlogscore=775 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210043
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

With -mprofile-kernel and ppc32, the function tracer is invoked before a
function sets up its own stackframe. This results in the traced function
not appearing in stack traces. Fix this by checking for ftrace entry and
including the traced function in the stack trace.

With this patch, stack traces show the function traced next to the
ftrace entry:
    NIP [c0080000003700d4] handler_pre+0x1c/0x5c [kprobe_example]
    LR [c00000000006c118] kprobe_ftrace_handler+0x1b8/0x270
    Call Trace:
    [c00000001ed7fa50] [c00000001ed7faa0] 0xc00000001ed7faa0 (unreliable)
    [c00000001ed7fab0] [c00000000006c118] kprobe_ftrace_handler+0x1b8/0x270
    [c00000001ed7fb00] [c000000000076604] ftrace_regs_call+0x4/0xa4 (kernel_clone+0xc/0x600)
                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^
    [c00000001ed7fcf0] [c000000000139e08] __do_sys_clone+0x88/0xd0
    [c00000001ed7fdb0] [c00000000002b6c4] system_call_exception+0xf4/0x200
    [c00000001ed7fe10] [c00000000000ca5c] system_call_common+0xec/0x278

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/process.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 89e34aa273e21a..9df1d44939bec1 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2160,6 +2160,9 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
 						&ftrace_idx, ip, stack);
 			if (ret_addr != ip)
 				pr_cont(" (%pS)", (void *)ret_addr);
+			ip = ftrace_get_traced_func_if_no_stackframe(ip, stack);
+			if (ip)
+				pr_cont(" (%pS)", (void *)ip);
 			if (firstframe)
 				pr_cont(" (unreliable)");
 			pr_cont("\n");
-- 
2.30.2

