Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F39C94B9F05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 12:38:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jzt9n3mYWz3cFX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 22:38:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SfuxF3V5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SfuxF3V5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzt9070Ksz2ybK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 22:37:24 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21HB9Hvm002737; 
 Thu, 17 Feb 2022 11:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kJD/XeCV9sYc2VxxV22CxFZX2bIMIheeokMIOZ2MLgw=;
 b=SfuxF3V5bgCDnPPnYgDZdqK03O1psJC2QgPiHC1/HQ8UOZqIEvXKGb0PNx4xscRJTINr
 +DoUtPI83pSXsT+o5v49qzJAlP2Zmr/EvmR1MZ2x473iASAzHOpvr9WbRsPM9Yuyixli
 6LIfWYy/QVTsGWbkhqYUXKsjsEXNEFwx7pGnNLfs9u0AEJJHiV5VyQ8s1dwgaPX+pf8o
 aIU8ZKqSJPAMZ9zmRT/chNScDmRYqKTv2l6sO50Ov7YG/JVqTulRcL+h+yWxDOsIiJV/
 lFkSJpWuJGK82v9FTxrW1Zvk/NwbKz16GvQEsC94bqV4/0bE4ivxCaGOnnKYzaHaR5XT uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9hu2cmrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:36:51 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21HBSk6J004072;
 Thu, 17 Feb 2022 11:36:51 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9hu2cmqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:36:51 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21HBaEJW008693;
 Thu, 17 Feb 2022 11:36:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3e64haf7ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:36:48 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21HBak5138273368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 11:36:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5873D52050;
 Thu, 17 Feb 2022 11:36:46 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.115.39])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EFDEC5206D;
 Thu, 17 Feb 2022 11:36:43 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 1/3] powerpc/ftrace: Reserve instructions from function entry
 for ftrace
Date: Thu, 17 Feb 2022 17:06:23 +0530
Message-Id: <8843d65ac0878232433573d10ebee30457748624.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ru5iKSd-xiMgaB_hKuoS9FVCmjWSGT4o
X-Proofpoint-ORIG-GUID: 4kh5FzR50R7g40nHwBWh7_1ulXDWEBPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_04,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=811 malwarescore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170051
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On some architectures, enabling function tracing results in multiple
instructions being emitted at function entry. As an example, on
powerpc64 with -mprofile-kernel, two instructions are emitted at
function entry:
	mflr	r0
	bl	_mcount

It is desirable to nop out both these instructions when ftrace is not
active. For that purpose, it is essential to mark both these
instructions as belonging to ftrace so that other kernel subsystems
(such as kprobes) do not modify these instructions.

Add support for this by allowing architectures to override
ftrace_cmp_recs() and to match against address ranges over and above a
single MCOUNT_INSN_SIZE.

For powerpc32, we mark the two instructions preceding the call to
_mcount() as belonging to ftrace.

For powerpc64, an additional aspect to consider is that functions can
have a global entry point for setting up the TOC when invoked from other
modules. If present, global entry point always involves two instructions
(addis/lis and addi). To handle this, we provide a custom
ftrace_init_nop() for powerpc64 where we identify functions having a
global entry point and record this information in the LSB of
dyn_ftrace->arch.mod. This information is used in ftrace_cmp_recs() to
reserve instructions from the global entry point.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ftrace.h  |  15 ++++
 arch/powerpc/kernel/trace/ftrace.c | 110 ++++++++++++++++++++++++++---
 kernel/trace/ftrace.c              |   2 +
 3 files changed, 117 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index debe8c4f706260..8eb3235831633d 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -59,6 +59,21 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
 struct dyn_arch_ftrace {
 	struct module *mod;
 };
+
+struct dyn_ftrace;
+struct module *ftrace_mod_addr_get(struct dyn_ftrace *rec);
+void ftrace_mod_addr_set(struct dyn_ftrace *rec, struct module *mod);
+
+#ifdef CONFIG_MPROFILE_KERNEL
+int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
+#define ftrace_init_nop ftrace_init_nop
+#endif
+
+#if defined(CONFIG_MPROFILE_KERNEL) || defined(CONFIG_PPC32)
+int ftrace_cmp_recs(const void *a, const void *b);
+#define ftrace_cmp_recs ftrace_cmp_recs
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 80b6285769f27c..11ce9296ce3cf2 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -428,21 +428,21 @@ int ftrace_make_nop(struct module *mod,
 	 * We should either already have a pointer to the module
 	 * or it has been passed in.
 	 */
-	if (!rec->arch.mod) {
+	if (!ftrace_mod_addr_get(rec)) {
 		if (!mod) {
 			pr_err("No module loaded addr=%lx\n", addr);
 			return -EFAULT;
 		}
-		rec->arch.mod = mod;
+		ftrace_mod_addr_set(rec, mod);
 	} else if (mod) {
-		if (mod != rec->arch.mod) {
+		if (mod != ftrace_mod_addr_get(rec)) {
 			pr_err("Record mod %p not equal to passed in mod %p\n",
-			       rec->arch.mod, mod);
+			       ftrace_mod_addr_get(rec), mod);
 			return -EINVAL;
 		}
 		/* nothing to do if mod == rec->arch.mod */
 	} else
-		mod = rec->arch.mod;
+		mod = ftrace_mod_addr_get(rec);
 
 	return __ftrace_make_nop(mod, rec, addr);
 #else
@@ -451,6 +451,96 @@ int ftrace_make_nop(struct module *mod,
 #endif /* CONFIG_MODULES */
 }
 
+#define FUNC_MCOUNT_OFFSET_PPC32	8
+#define FUNC_MCOUNT_OFFSET_PPC64_LEP	4
+#define FUNC_MCOUNT_OFFSET_PPC64_GEP	12
+
+#ifdef CONFIG_MPROFILE_KERNEL
+struct module *ftrace_mod_addr_get(struct dyn_ftrace *rec)
+{
+	return (struct module *)((unsigned long)rec->arch.mod & ~0x1);
+}
+
+void ftrace_mod_addr_set(struct dyn_ftrace *rec, struct module *mod)
+{
+	rec->arch.mod = (struct module *)(((unsigned long)rec->arch.mod & 0x1) | (unsigned long)mod);
+}
+
+int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
+{
+	unsigned long offset, ip = rec->ip;
+	ppc_inst_t op1, op2;
+	int ret;
+
+	if (!kallsyms_lookup_size_offset(rec->ip, NULL, &offset) ||
+	    (offset != FUNC_MCOUNT_OFFSET_PPC64_GEP && offset != FUNC_MCOUNT_OFFSET_PPC64_LEP)) {
+		ip -= FUNC_MCOUNT_OFFSET_PPC64_GEP;
+		ret = copy_inst_from_kernel_nofault(&op1, (void *)ip);
+		ret |= copy_inst_from_kernel_nofault(&op2, (void *)(ip + MCOUNT_INSN_SIZE));
+		if (!ret &&
+		    ((ppc_inst_val(op1) & 0xffff0000) == PPC_RAW_LIS(_R2, 0) ||
+		     (ppc_inst_val(op1) & 0xffff0000) == PPC_RAW_ADDIS(_R2, _R12, 0)) &&
+		    (ppc_inst_val(op2) & 0xffff0000) == PPC_RAW_ADDI(_R2, _R2, 0))
+			ftrace_mod_addr_set(rec, (struct module *)1);
+	} else if (offset == FUNC_MCOUNT_OFFSET_PPC64_GEP) {
+		ftrace_mod_addr_set(rec, (struct module *)1);
+	}
+
+	return ftrace_make_nop(mod, rec, MCOUNT_ADDR);
+}
+#else
+struct module *ftrace_mod_addr_get(struct dyn_ftrace *rec)
+{
+	return rec->arch.mod;
+}
+
+void ftrace_mod_addr_set(struct dyn_ftrace *rec, struct module *mod)
+{
+	rec->arch.mod = mod;
+}
+#endif /* CONFIG_MPROFILE_KERNEL */
+
+#if defined(CONFIG_MPROFILE_KERNEL) || defined(CONFIG_PPC32)
+int ftrace_location_get_offset(const struct dyn_ftrace *rec)
+{
+	if (IS_ENABLED(CONFIG_MPROFILE_KERNEL))
+		/*
+		 * On ppc64le with -mprofile-kernel, function entry can have:
+		 *   addis r2, r12, M
+		 *   addi  r2, r2, N
+		 *   mflr  r0
+		 *   bl    _mcount
+		 *
+		 * The first two instructions are for TOC setup and represent the global entry
+		 * point for cross-module calls, and may be missing if the function is never called
+		 * from other modules.
+		 */
+		return ((unsigned long)rec->arch.mod & 0x1) ? FUNC_MCOUNT_OFFSET_PPC64_GEP :
+							      FUNC_MCOUNT_OFFSET_PPC64_LEP;
+	else
+		/*
+		 * On ppc32, function entry always has:
+		 *   mflr r0
+		 *   stw  r0, 4(r1)
+		 *   bl   _mcount
+		 */
+		return FUNC_MCOUNT_OFFSET_PPC32;
+}
+
+int ftrace_cmp_recs(const void *a, const void *b)
+{
+	const struct dyn_ftrace *key = a;
+	const struct dyn_ftrace *rec = b;
+	int offset = ftrace_location_get_offset(rec);
+
+	if (key->flags < rec->ip - offset)
+		return -1;
+	if (key->ip >= rec->ip + MCOUNT_INSN_SIZE)
+		return 1;
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_MODULES
 #ifdef CONFIG_PPC64
 /*
@@ -494,7 +584,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	ppc_inst_t instr;
 	void *ip = (void *)rec->ip;
 	unsigned long entry, ptr, tramp;
-	struct module *mod = rec->arch.mod;
+	struct module *mod = ftrace_mod_addr_get(rec);
 
 	/* read where this goes */
 	if (copy_inst_from_kernel_nofault(op, ip))
@@ -561,7 +651,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	int err;
 	ppc_inst_t op;
 	u32 *ip = (u32 *)rec->ip;
-	struct module *mod = rec->arch.mod;
+	struct module *mod = ftrace_mod_addr_get(rec);
 	unsigned long tramp;
 
 	/* read where this goes */
@@ -678,7 +768,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	 * Being that we are converting from nop, it had better
 	 * already have a module defined.
 	 */
-	if (!rec->arch.mod) {
+	if (!ftrace_mod_addr_get(rec)) {
 		pr_err("No module loaded\n");
 		return -EINVAL;
 	}
@@ -699,7 +789,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	ppc_inst_t op;
 	unsigned long ip = rec->ip;
 	unsigned long entry, ptr, tramp;
-	struct module *mod = rec->arch.mod;
+	struct module *mod = ftrace_mod_addr_get(rec);
 
 	/* If we never set up ftrace trampolines, then bail */
 	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
@@ -814,7 +904,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	/*
 	 * Out of range jumps are called from modules.
 	 */
-	if (!rec->arch.mod) {
+	if (!ftrace_mod_addr_get(rec)) {
 		pr_err("No module loaded\n");
 		return -EINVAL;
 	}
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index f9feb197b2daaf..68f20cf34b0c47 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1510,6 +1510,7 @@ ftrace_ops_test(struct ftrace_ops *ops, unsigned long ip, void *regs)
 	}
 
 
+#ifndef ftrace_cmp_recs
 static int ftrace_cmp_recs(const void *a, const void *b)
 {
 	const struct dyn_ftrace *key = a;
@@ -1521,6 +1522,7 @@ static int ftrace_cmp_recs(const void *a, const void *b)
 		return 1;
 	return 0;
 }
+#endif
 
 static struct dyn_ftrace *lookup_rec(unsigned long start, unsigned long end)
 {
-- 
2.35.1

