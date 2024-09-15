Return-Path: <linuxppc-dev+bounces-1388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6849798D6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 22:58:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6L3F5c7bz2yY9;
	Mon, 16 Sep 2024 06:57:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726433865;
	cv=none; b=Hkih/dz0UcB+dzypj2pYMlMguZXvEC6nVVsWkgC15dvUGEpTvHOjE2MMJK6+TMfKLu73niSeydi0X63c7s43wOC390sr0IzYPddtD12hN1WYU2kP3Z5KBHtTcBAYyZc6MkpeQxpvAugI4oXVoAmCw8Q2xIOvD9rNdUgrGD3z5tISyPFJQGBEqWrRnhK7uria+63t0jve1JiFzyFGp7Arf9iD9pkMVaWaQfJjAeDPvzSSflwdF8FKOYsHpo9MGG90CKKGQodREUx/o8wKknVxhFQ+9ahscWcyYe2jAI+0eeen0LWA0z9geV542PM74Itumvqf8w5vx5FxsQI9VfoiXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726433865; c=relaxed/relaxed;
	bh=qJy2TSUcd69lFMcv1d6gXCK9l/C3ykRF0oD79UxFY+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxXgOo6awbdcM0ffeEFQjuzBAaITUvAJbvv3KY+lLAIZgfuQCn2+R/uZv1oKb2Kei1jdBRz1okA8/Vf/S1QYNI5JuqIcILdS3cBx3UNUBrqGQ5pNP1UZ/F/Q4X164F4v9086T/0Kl20JQmu+EUWed7mPZK5ZLvKVzqC/3S6Sm/gv5uhOKmnUBdexCg2vvb98MumFTqGj8sDh+0WIH5fmW354getlVliPd5TIRuq27kDcdJ269plvkCsUmKH/AESAnPQFip609eCB4P9HgXuieLcb14HaZb1DSqbA47tQ6bQUYBxI5jPa0/qWt+Ott70atrgPgc4fx8ouug6xKav8bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RinvUDTg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RinvUDTg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6L3F3CLlz2yFL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 06:57:45 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FJt9PP028508;
	Sun, 15 Sep 2024 20:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=qJy2TSUcd69lF
	Mcv1d6gXCK9l/C3ykRF0oD79UxFY+0=; b=RinvUDTg2HS/gV9jxPQSrUu+JyCN9
	8+3JpogjWWexKLLrNDZZXpqhriuFBSV30MXTEcLn+BLflWOMtcuov9itvVFDEgND
	uHPSRGAOn5dQkIGPJ2anlZuFzMcr9ulCOrrcrM1HV6Xv5LLazeeH5XkCoEfpeunz
	yRRb0S7hZDVVzg8hhSDohFo4PVBslxorNWiE2UcI4yXMj+Jb6GhLpiTTZJ/ZITrQ
	1yW1pE64vtFHPP7stLHTPdw6JeAtqFaM7/Ot+5OW4uKEOMOTRoEzVzXYSyUqBrhf
	3C3cffUwrlvHnts3gqJqrcwXPLvl058NEZQ2APWaCOyHAOqGXmtQvMzxg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3vd6euc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:24 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48FKvNcX007333;
	Sun, 15 Sep 2024 20:57:23 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3vd6eu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48FGwiqf001860;
	Sun, 15 Sep 2024 20:57:22 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41nqh3bbyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:22 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48FKvJmW57409992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Sep 2024 20:57:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CCB32004D;
	Sun, 15 Sep 2024 20:57:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89CF920049;
	Sun, 15 Sep 2024 20:57:15 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.68.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Sep 2024 20:57:15 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: "Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v5 06/17] powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
Date: Mon, 16 Sep 2024 02:26:37 +0530
Message-ID: <20240915205648.830121-7-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915205648.830121-1-hbathini@linux.ibm.com>
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CmkuigTsr1rjq2fT0bfASW2duyCrehSx
X-Proofpoint-GUID: N9vgXMnJ_Qc5cvwIGA_n41x0pWSonElW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_12,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409150159

From: Naveen N Rao <naveen@kernel.org>

Pointer to struct module is only relevant for ftrace records belonging
to kernel modules. Having this field in dyn_arch_ftrace wastes memory
for all ftrace records belonging to the kernel. Remove the same in
favour of looking up the module from the ftrace record address, similar
to other architectures.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/include/asm/ftrace.h        |  1 -
 arch/powerpc/kernel/trace/ftrace.c       | 49 +++++++++--------
 arch/powerpc/kernel/trace/ftrace_64_pg.c | 69 ++++++++++--------------
 3 files changed, 56 insertions(+), 63 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 559560286e6d..278d4548e8f1 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -24,7 +24,6 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 struct module;
 struct dyn_ftrace;
 struct dyn_arch_ftrace {
-	struct module *mod;
 };
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 8c3e523e4f96..fe0546fbac8e 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -106,28 +106,43 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 	return 0;
 }
 
+#ifdef CONFIG_MODULES
+static unsigned long ftrace_lookup_module_stub(unsigned long ip, unsigned long addr)
+{
+	struct module *mod = NULL;
+
+	preempt_disable();
+	mod = __module_text_address(ip);
+	preempt_enable();
+
+	if (!mod)
+		pr_err("No module loaded at addr=%lx\n", ip);
+
+	return (addr == (unsigned long)ftrace_caller ? mod->arch.tramp : mod->arch.tramp_regs);
+}
+#else
+static unsigned long ftrace_lookup_module_stub(unsigned long ip, unsigned long addr)
+{
+	return 0;
+}
+#endif
+
 static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_inst_t *call_inst)
 {
 	unsigned long ip = rec->ip;
 	unsigned long stub;
 
-	if (is_offset_in_branch_range(addr - ip)) {
+	if (is_offset_in_branch_range(addr - ip))
 		/* Within range */
 		stub = addr;
-#ifdef CONFIG_MODULES
-	} else if (rec->arch.mod) {
-		/* Module code would be going to one of the module stubs */
-		stub = (addr == (unsigned long)ftrace_caller ? rec->arch.mod->arch.tramp :
-							       rec->arch.mod->arch.tramp_regs);
-#endif
-	} else if (core_kernel_text(ip)) {
+	else if (core_kernel_text(ip))
 		/* We would be branching to one of our ftrace stubs */
 		stub = find_ftrace_tramp(ip);
-		if (!stub) {
-			pr_err("0x%lx: No ftrace stubs reachable\n", ip);
-			return -EINVAL;
-		}
-	} else {
+	else
+		stub = ftrace_lookup_module_stub(ip, addr);
+
+	if (!stub) {
+		pr_err("0x%lx: No ftrace stubs reachable\n", ip);
 		return -EINVAL;
 	}
 
@@ -262,14 +277,6 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	if (ret)
 		return ret;
 
-	if (!core_kernel_text(ip)) {
-		if (!mod) {
-			pr_err("0x%lx: No module provided for non-kernel address\n", ip);
-			return -EFAULT;
-		}
-		rec->arch.mod = mod;
-	}
-
 	/* Nop-out the ftrace location */
 	new = ppc_inst(PPC_RAW_NOP());
 	addr = MCOUNT_ADDR;
diff --git a/arch/powerpc/kernel/trace/ftrace_64_pg.c b/arch/powerpc/kernel/trace/ftrace_64_pg.c
index 12fab1803bcf..8a551dfca3d0 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_pg.c
+++ b/arch/powerpc/kernel/trace/ftrace_64_pg.c
@@ -116,6 +116,20 @@ static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
 }
 
 #ifdef CONFIG_MODULES
+static struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
+{
+	struct module *mod;
+
+	preempt_disable();
+	mod = __module_text_address(rec->ip);
+	preempt_enable();
+
+	if (!mod)
+		pr_err("No module loaded at addr=%lx\n", rec->ip);
+
+	return mod;
+}
+
 static int
 __ftrace_make_nop(struct module *mod,
 		  struct dyn_ftrace *rec, unsigned long addr)
@@ -124,6 +138,12 @@ __ftrace_make_nop(struct module *mod,
 	unsigned long ip = rec->ip;
 	ppc_inst_t op, pop;
 
+	if (!mod) {
+		mod = ftrace_lookup_module(rec);
+		if (!mod)
+			return -EINVAL;
+	}
+
 	/* read where this goes */
 	if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
@@ -366,27 +386,6 @@ int ftrace_make_nop(struct module *mod,
 		return -EINVAL;
 	}
 
-	/*
-	 * Out of range jumps are called from modules.
-	 * We should either already have a pointer to the module
-	 * or it has been passed in.
-	 */
-	if (!rec->arch.mod) {
-		if (!mod) {
-			pr_err("No module loaded addr=%lx\n", addr);
-			return -EFAULT;
-		}
-		rec->arch.mod = mod;
-	} else if (mod) {
-		if (mod != rec->arch.mod) {
-			pr_err("Record mod %p not equal to passed in mod %p\n",
-			       rec->arch.mod, mod);
-			return -EINVAL;
-		}
-		/* nothing to do if mod == rec->arch.mod */
-	} else
-		mod = rec->arch.mod;
-
 	return __ftrace_make_nop(mod, rec, addr);
 }
 
@@ -411,7 +410,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	ppc_inst_t op[2];
 	void *ip = (void *)rec->ip;
 	unsigned long entry, ptr, tramp;
-	struct module *mod = rec->arch.mod;
+	struct module *mod = ftrace_lookup_module(rec);
+
+	if (!mod)
+		return -EINVAL;
 
 	/* read where this goes */
 	if (copy_inst_from_kernel_nofault(op, ip))
@@ -533,16 +535,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EINVAL;
 	}
 
-	/*
-	 * Out of range jumps are called from modules.
-	 * Being that we are converting from nop, it had better
-	 * already have a module defined.
-	 */
-	if (!rec->arch.mod) {
-		pr_err("No module loaded\n");
-		return -EINVAL;
-	}
-
 	return __ftrace_make_call(rec, addr);
 }
 
@@ -555,7 +547,10 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	ppc_inst_t op;
 	unsigned long ip = rec->ip;
 	unsigned long entry, ptr, tramp;
-	struct module *mod = rec->arch.mod;
+	struct module *mod = ftrace_lookup_module(rec);
+
+	if (!mod)
+		return -EINVAL;
 
 	/* If we never set up ftrace trampolines, then bail */
 	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
@@ -668,14 +663,6 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		return -EINVAL;
 	}
 
-	/*
-	 * Out of range jumps are called from modules.
-	 */
-	if (!rec->arch.mod) {
-		pr_err("No module loaded\n");
-		return -EINVAL;
-	}
-
 	return __ftrace_modify_call(rec, old_addr, addr);
 }
 #endif
-- 
2.46.0


