Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F91B5FFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 17:56:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497MNG3L7QzDqx5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 01:55:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497LXm4GpKzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 01:18:10 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NF3W5I045055
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 11:18:07 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30k3xujtpg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 11:18:07 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 23 Apr 2020 16:17:18 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 23 Apr 2020 16:17:16 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03NFGsjU66519544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 15:16:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5014342045;
 Thu, 23 Apr 2020 15:18:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A79654204B;
 Thu, 23 Apr 2020 15:18:00 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.73.158])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Apr 2020 15:18:00 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] powerpc/ftrace: Use appropriate format specifier for
 printing kernel addresses
Date: Thu, 23 Apr 2020 20:47:36 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587652966.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1587652966.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042315-4275-0000-0000-000003C54D97
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042315-4276-0000-0000-000038DAD8BA
Message-Id: <7b05bc3debb99245267f89ee4d90554f914be138.1587652966.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_10:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=1
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230117
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update use of printk format specifiers in ftrace code, so that addresses
are made visible for privileged users, or always for pr_devel() code:
- change %lx to use %px or %pK
- change %p to %px or %pK
- add %pS in certain places to show the symbol as well

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 74 +++++++++++++++++-------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 679d5249b002..29b77204f46d 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -83,8 +83,8 @@ ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
 
 	/* Make sure it is what we expect it to be */
 	if (replaced != old) {
-		pr_err("%p: replaced (%#x) != old (%#x)",
-		(void *)ip, replaced, old);
+		pr_err("%pK (%pS): replaced (%#x) != old (%#x)",
+		       (void *)ip, (void *)ip, replaced, old);
 		return -EINVAL;
 	}
 
@@ -152,19 +152,20 @@ __ftrace_make_nop(struct module *mod,
 	/* lets find where the pointer goes */
 	tramp = find_bl_target(ip, op);
 
-	pr_devel("ip:%lx jumps to %lx", ip, tramp);
+	pr_devel("ip:0x%px jumps to 0x%px", (void *)ip, (void *)tramp);
 
 	if (module_trampoline_target(mod, tramp, &ptr)) {
 		pr_err("Failed to get trampoline target\n");
 		return -EFAULT;
 	}
 
-	pr_devel("trampoline target %lx", ptr);
+	pr_devel("trampoline target 0x%px", (void *)ptr);
 
 	entry = ppc_global_function_entry((void *)addr);
 	/* This should match what was called */
 	if (ptr != entry) {
-		pr_err("addr %lx does not match expected %lx\n", ptr, entry);
+		pr_err("addr 0x%pK does not match expected 0x%pK\n",
+				(void *)ptr, (void *)entry);
 		return -EINVAL;
 	}
 
@@ -173,7 +174,8 @@ __ftrace_make_nop(struct module *mod,
 	pop = PPC_INST_NOP;
 
 	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
-		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
+		pr_err("Fetching instruction at 0x%pK (%pS) failed.\n",
+				(void *)(ip - 4), (void *)(ip - 4));
 		return -EFAULT;
 	}
 
@@ -249,11 +251,11 @@ __ftrace_make_nop(struct module *mod,
 	 *  0x4e, 0x80, 0x04, 0x20  bctr
 	 */
 
-	pr_devel("ip:%lx jumps to %lx", ip, tramp);
+	pr_devel("ip:0x%px jumps to 0x%px", (void *)ip, (void *)tramp);
 
 	/* Find where the trampoline jumps to */
 	if (probe_kernel_read(jmp, (void *)tramp, sizeof(jmp))) {
-		pr_err("Failed to read %lx\n", tramp);
+		pr_err("Failed to read 0x%pK\n", (void *)tramp);
 		return -EFAULT;
 	}
 
@@ -273,11 +275,11 @@ __ftrace_make_nop(struct module *mod,
 	if (tramp & 0x8000)
 		tramp -= 0x10000;
 
-	pr_devel(" %lx ", tramp);
+	pr_devel(" 0x%px ", (void *)tramp);
 
 	if (tramp != addr) {
-		pr_err("Trampoline location %08lx does not match addr\n",
-		       tramp);
+		pr_err("Trampoline location 0x%pK does not match addr\n",
+		       (void *)tramp);
 		return -EINVAL;
 	}
 
@@ -362,7 +364,8 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 	ptr = find_bl_target(tramp, op);
 
 	if (ptr != ppc_global_function_entry((void *)_mcount)) {
-		pr_debug("Trampoline target %p is not _mcount\n", (void *)ptr);
+		pr_debug("Trampoline target 0x%px (%pS) is not _mcount\n",
+				(void *)ptr, (void *)ptr);
 		return -1;
 	}
 
@@ -374,8 +377,8 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 #endif
 	op = create_branch((void *)tramp, ptr, 0);
 	if (!op) {
-		pr_debug("%ps is not reachable from existing mcount tramp\n",
-				(void *)ptr);
+		pr_debug("0x%px (%ps) is not reachable from existing mcount tramp\n",
+				(void *)ptr, (void *)ptr);
 		return -1;
 	}
 
@@ -409,13 +412,13 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	/* Let's find where the pointer goes */
 	tramp = find_bl_target(ip, op);
 
-	pr_devel("ip:%lx jumps to %lx", ip, tramp);
+	pr_devel("ip:0x%px jumps to 0x%px", (void *)ip, (void *)tramp);
 
 	if (setup_mcount_compiler_tramp(tramp)) {
 		/* Are other trampolines reachable? */
 		if (!find_ftrace_tramp(ip)) {
-			pr_err("No ftrace trampolines reachable from %ps\n",
-					(void *)ip);
+			pr_err("No ftrace trampolines reachable from 0x%pK (%pS)\n",
+					(void *)ip, (void *)ip);
 			return -EINVAL;
 		}
 	}
@@ -452,13 +455,13 @@ int ftrace_make_nop(struct module *mod,
 	 */
 	if (!rec->arch.mod) {
 		if (!mod) {
-			pr_err("No module loaded addr=%lx\n", addr);
+			pr_err("No module loaded addr=0x%pK\n", (void *)addr);
 			return -EFAULT;
 		}
 		rec->arch.mod = mod;
 	} else if (mod) {
 		if (mod != rec->arch.mod) {
-			pr_err("Record mod %p not equal to passed in mod %p\n",
+			pr_err("Record mod %pK not equal to passed in mod %pK\n",
 			       rec->arch.mod, mod);
 			return -EINVAL;
 		}
@@ -521,8 +524,8 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
-		pr_err("Unexpected call sequence at %p: %x %x\n",
-		ip, op[0], op[1]);
+		pr_err("Unexpected call sequence at %pK: %x %x\n",
+			ip, op[0], op[1]);
 		return -EINVAL;
 	}
 
@@ -548,12 +551,13 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 	}
 
-	pr_devel("trampoline target %lx", ptr);
+	pr_devel("trampoline target 0x%px", (void *)ptr);
 
 	entry = ppc_global_function_entry((void *)addr);
 	/* This should match what was called */
 	if (ptr != entry) {
-		pr_err("addr %lx does not match expected %lx\n", ptr, entry);
+		pr_err("addr 0x%pK does not match expected 0x%pK\n",
+				(void *)ptr, (void *)entry);
 		return -EINVAL;
 	}
 
@@ -600,7 +604,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EINVAL;
 	}
 
-	pr_devel("write to %lx\n", rec->ip);
+	pr_devel("write to 0x%px\n", (void *)rec->ip);
 
 	PATCH_INSN(ip, op);
 
@@ -624,7 +628,8 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		entry = ppc_global_function_entry((void *)ftrace_regs_caller);
 		if (ptr != entry) {
 #endif
-			pr_err("Unknown ftrace addr to patch: %ps\n", (void *)ptr);
+			pr_err("Unknown ftrace addr to patch: 0x%pK (%pS)\n",
+					(void *)ptr, (void *)ptr);
 			return -EINVAL;
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 		}
@@ -633,18 +638,19 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 
 	/* Make sure we have a nop */
 	if (probe_kernel_read(&op, ip, sizeof(op))) {
-		pr_err("Unable to read ftrace location %p\n", ip);
+		pr_err("Unable to read ftrace location %pK\n", ip);
 		return -EFAULT;
 	}
 
 	if (op != PPC_INST_NOP) {
-		pr_err("Unexpected call sequence at %p: %x\n", ip, op);
+		pr_err("Unexpected call sequence at %pK: %x\n", ip, op);
 		return -EINVAL;
 	}
 
 	tramp = find_ftrace_tramp((unsigned long)ip);
 	if (!tramp) {
-		pr_err("No ftrace trampolines reachable from %ps\n", ip);
+		pr_err("No ftrace trampolines reachable from 0x%pK (%pS)\n",
+				ip, ip);
 		return -EINVAL;
 	}
 
@@ -728,7 +734,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	tramp = find_bl_target(ip, op);
 	entry = ppc_global_function_entry((void *)old_addr);
 
-	pr_devel("ip:%lx jumps to %lx", ip, tramp);
+	pr_devel("ip:0x%px jumps to 0x%px", (void *)ip, (void *)tramp);
 
 	if (tramp != entry) {
 		/* old_addr is not within range, so we must have used a trampoline */
@@ -737,11 +743,12 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 			return -EFAULT;
 		}
 
-		pr_devel("trampoline target %lx", ptr);
+		pr_devel("trampoline target 0x%px", (void *)ptr);
 
 		/* This should match what was called */
 		if (ptr != entry) {
-			pr_err("addr %lx does not match expected %lx\n", ptr, entry);
+			pr_err("addr 0x%pK does not match expected 0x%pK\n",
+					(void *)ptr, (void *)entry);
 			return -EINVAL;
 		}
 	}
@@ -765,12 +772,13 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		return -EFAULT;
 	}
 
-	pr_devel("trampoline target %lx", ptr);
+	pr_devel("trampoline target 0x%px", (void *)ptr);
 
 	entry = ppc_global_function_entry((void *)addr);
 	/* This should match what was called */
 	if (ptr != entry) {
-		pr_err("addr %lx does not match expected %lx\n", ptr, entry);
+		pr_err("addr 0x%pK does not match expected 0x%pK\n",
+				(void *)ptr, (void *)entry);
 		return -EINVAL;
 	}
 
-- 
2.25.1

