Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D32422C5C12
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:34:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChmdQ6G29zDrgL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:34:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d8I380Cr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm6K4nhCzDrMy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:11:21 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI2Pbb124491; Thu, 26 Nov 2020 13:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0gRkVfqo+rmwKeSJSwiJRabHCEnM9EP+Drx9sTwZLl0=;
 b=d8I380CrCkTyO6eyAwUEe4cYy0Of0i3UoCPBuMM2coLVZoRBpks6x9SLhC/ALjsmY2SG
 Rw+ZPVLVXa5jyvS60+RIoUbUsgtvhFgV30UCE+iwhciXZRgQoEFksZVqoWhfXFBgRonC
 8GRhJM3M4ViGeiRL6GVdBJFs+JdxacYJs9ykyyNObxwwj9XGbRpZjuWhyqrjyMJHOaCO
 GdogVLQ3F0nkJsvfpoP6S7pktjDwKVONXKwPwLAF6sdaHybU2NQr/LLAW7Qgo78mhUNq
 N9+2yAnBkNQFWtvNSOORQXbqkgVAnck1OuXj7eZ4V8FGYTaqN4Fi5cgp1rbC5YZEguSf Jg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352gps0xtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:11:00 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI92cn016526;
 Thu, 26 Nov 2020 18:10:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 34yy8r3b6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:10:57 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQI9eY555247212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B027A405B;
 Thu, 26 Nov 2020 18:09:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8D51A4054;
 Thu, 26 Nov 2020 18:09:37 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:37 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 09/14] powerpc/ftrace: Use a hash table for tracking
 ftrace stubs
Date: Thu, 26 Nov 2020 23:38:46 +0530
Message-Id: <1c89e59d3186172d6e72f8f339e8118cfdda9e6d.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_08:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011260108
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

In preparation for having to deal with large number of ftrace stubs in
support of ftrace direct calls, convert existing stubs to use a hash
table. The hash table is key'ed off the target address for the stubs
since there could be multiple stubs for the same target to cover the
full kernel text.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 75 +++++++++++++-----------------
 1 file changed, 33 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 14b39f7797d455..7ddb6e4b527c39 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -13,6 +13,7 @@
 
 #define pr_fmt(fmt) "ftrace-powerpc: " fmt
 
+#include <linux/hashtable.h>
 #include <linux/spinlock.h>
 #include <linux/hardirq.h>
 #include <linux/uaccess.h>
@@ -32,14 +33,12 @@
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
-/*
- * We generally only have a single long_branch tramp and at most 2 or 3 plt
- * tramps generated. But, we don't use the plt tramps currently. We also allot
- * 2 tramps after .text and .init.text. So, we only end up with around 3 usable
- * tramps in total. Set aside 8 just to be sure.
- */
-#define	NUM_FTRACE_TRAMPS	8
-static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
+static DEFINE_HASHTABLE(ppc_ftrace_stubs, 8);
+struct ppc_ftrace_stub_data {
+	unsigned long addr;
+	unsigned long target;
+	struct hlist_node hentry;
+};
 
 static struct ppc_inst
 ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
@@ -288,36 +287,31 @@ __ftrace_make_nop(struct module *mod,
 #endif /* PPC64 */
 #endif /* CONFIG_MODULES */
 
-static unsigned long find_ftrace_tramp(unsigned long ip)
+static unsigned long find_ftrace_tramp(unsigned long ip, unsigned long target)
 {
-	int i;
+	struct ppc_ftrace_stub_data *stub;
 	struct ppc_inst instr;
 
-	/*
-	 * We have the compiler generated long_branch tramps at the end
-	 * and we prefer those
-	 */
-	for (i = NUM_FTRACE_TRAMPS - 1; i >= 0; i--)
-		if (!ftrace_tramps[i])
-			continue;
-		else if (create_branch(&instr, (void *)ip,
-				       ftrace_tramps[i], 0) == 0)
-			return ftrace_tramps[i];
+	hash_for_each_possible(ppc_ftrace_stubs, stub, hentry, target)
+		if (stub->target == target && !create_branch(&instr, (void *)ip, stub->addr, 0))
+			return stub->addr;
 
 	return 0;
 }
 
-static int add_ftrace_tramp(unsigned long tramp)
+static int add_ftrace_tramp(unsigned long tramp, unsigned long target)
 {
-	int i;
+	struct ppc_ftrace_stub_data *stub;
 
-	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
-		if (!ftrace_tramps[i]) {
-			ftrace_tramps[i] = tramp;
-			return 0;
-		}
+	stub = kmalloc(sizeof(*stub), GFP_KERNEL);
+	if (!stub)
+		return -1;
 
-	return -1;
+	stub->addr = tramp;
+	stub->target = target;
+	hash_add(ppc_ftrace_stubs, &stub->hentry, target);
+
+	return 0;
 }
 
 /*
@@ -328,16 +322,14 @@ static int add_ftrace_tramp(unsigned long tramp)
  */
 static int setup_mcount_compiler_tramp(unsigned long tramp)
 {
-	int i;
 	struct ppc_inst op;
-	unsigned long ptr;
 	struct ppc_inst instr;
+	struct ppc_ftrace_stub_data *stub;
+	unsigned long ptr, ftrace_target = ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
 
 	/* Is this a known long jump tramp? */
-	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
-		if (!ftrace_tramps[i])
-			break;
-		else if (ftrace_tramps[i] == tramp)
+	hash_for_each_possible(ppc_ftrace_stubs, stub, hentry, ftrace_target)
+		if (stub->target == ftrace_target && stub->addr == tramp)
 			return 0;
 
 	/* New trampoline -- read where this goes */
@@ -361,19 +353,18 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 	}
 
 	/* Let's re-write the tramp to go to ftrace_[regs_]caller */
-	ptr = ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
-	if (create_branch(&instr, (void *)tramp, ptr, 0)) {
+	if (create_branch(&instr, (void *)tramp, ftrace_target, 0)) {
 		pr_debug("%ps is not reachable from existing mcount tramp\n",
-				(void *)ptr);
+				(void *)ftrace_target);
 		return -1;
 	}
 
-	if (patch_branch((struct ppc_inst *)tramp, ptr, 0)) {
+	if (patch_branch((struct ppc_inst *)tramp, ftrace_target, 0)) {
 		pr_debug("REL24 out of range!\n");
 		return -1;
 	}
 
-	if (add_ftrace_tramp(tramp)) {
+	if (add_ftrace_tramp(tramp, ftrace_target)) {
 		pr_debug("No tramp locations left\n");
 		return -1;
 	}
@@ -405,7 +396,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 
 	if (setup_mcount_compiler_tramp(tramp)) {
 		/* Are other trampolines reachable? */
-		if (!find_ftrace_tramp(ip)) {
+		if (!find_ftrace_tramp(ip, FTRACE_REGS_ADDR)) {
 			pr_err("No ftrace trampolines reachable from %ps\n",
 					(void *)ip);
 			return -EINVAL;
@@ -646,7 +637,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EINVAL;
 	}
 
-	tramp = find_ftrace_tramp((unsigned long)ip);
+	tramp = find_ftrace_tramp((unsigned long)ip, FTRACE_REGS_ADDR);
 	if (!tramp) {
 		pr_err("No ftrace trampolines reachable from %ps\n", ip);
 		return -EINVAL;
@@ -894,7 +885,7 @@ int __init ftrace_dyn_arch_init(void)
 		memcpy(tramp[i], stub_insns, sizeof(stub_insns));
 		tramp[i][1] |= PPC_HA(reladdr);
 		tramp[i][2] |= PPC_LO(reladdr);
-		add_ftrace_tramp((unsigned long)tramp[i]);
+		add_ftrace_tramp((unsigned long)tramp[i], addr);
 	}
 
 	return 0;
-- 
2.25.4

