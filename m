Return-Path: <linuxppc-dev+bounces-2705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A673B9B5C59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 08:10:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XddYD6WWZz2ysD;
	Wed, 30 Oct 2024 18:09:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730272192;
	cv=none; b=jxCQvur9H1qY6J33z2TpZBp/U9Z8qcUq0JW3cZ214fDCB/tOZiLinYjCSinUyT9EXrPQFVXZbiMTlYsZD784NUtlTpYDwi3aLcsEAgB1g7vF2ae8j+CV3xQEUDYNpIROA2ifLKi4okjIumbjLxY3A4Y7sOIBSR9KcnblegaE7XiyPAlHUw8ygAPe8IMBCX9CKkpX5avOKAErZVFziKefcOb+KKV8ej3j+6whmbu9yBP86EXXxuqraBlKDZ7yYGuCpOH7cSAb/hlQ8JxXzarqUimHV+0XvIu2e1w52DM02WThwm5tzi+qHrf/wW77T5LtaQ/x04mHoVnLyioZfT2vWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730272192; c=relaxed/relaxed;
	bh=3NxYv02vuxaMO5r29ohIPPG4f4pCCqbUWFgSHUSuV0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z/8rZBH0NxtlbNO0l75ORLGegL9gdbTI/7jMdTYeGIWOm/HDWh5oc85uaXS4dhyWsydlNbzaBUZGTpkd/pIQeOA2JhsTn4D4LNp5idwQJ2kBpM2fpWLi6KWjzIzARj95EanMCqxciMIkuyy9vNSLSA6J7aGlmPzFUHYFjG7Rsdz31VwhyX1vwicQo/1PhsG7N6GCutB4CixRiljZrqbcO3NjN2dT66F00Wg1mjJckx2YT064ds4sZb6xkbJfxjDZ81sUhoT5XwKgpOr+EoFbWr4KyJu39EtKEdVifTJezKojhu+qd87ujw+Nvdm+D1JbAKcD7G0xIDUONDkr0dDp1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXQDcTxU; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXQDcTxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XddYC6gWnz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 18:09:51 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U2d2Ih003165;
	Wed, 30 Oct 2024 07:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=3NxYv02vuxaMO5r29
	ohIPPG4f4pCCqbUWFgSHUSuV0c=; b=gXQDcTxUAl4ZrrakckPSg8BKpXNq2abhz
	/5tfAP0sCD7T6SZuf+QkNoQbyaSqtarzpPUrqrrHXGAr+eLtXBH48f6cQmh7Y7CX
	90LD8U2qYuCtpOlPUS5K9VgGZDHhGVCPtOfPyUwsjPwr4LCR1McRqDymdj2dR1Cg
	65M8kwJXlBXk487LuGWPCc+XZUoPJldbOn2U0c0kBOxsRaZI9oJzE6qV8Oa1DwvU
	WjDtIY32Osd81xzlmoOS5tY2PC+vd1jf77nwraJ/+cnKM7jnff2ib+/ANhjHAVKh
	lPXYfD391ftLSulsiyjvA8au72x1TIUevuxfOfwnJO5FuXDiTWZ7w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42j3nswmhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:24 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49U79Oxa004166;
	Wed, 30 Oct 2024 07:09:24 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42j3nswmhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49U4qK7c024554;
	Wed, 30 Oct 2024 07:09:23 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42hcyjemue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:23 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49U79Jlb56099144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2024 07:09:19 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A78792004B;
	Wed, 30 Oct 2024 07:09:19 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA36B20043;
	Wed, 30 Oct 2024 07:09:15 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.143])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Oct 2024 07:09:15 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v7 06/17] powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
Date: Wed, 30 Oct 2024 12:38:39 +0530
Message-ID: <20241030070850.1361304-7-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030070850.1361304-1-hbathini@linux.ibm.com>
References: <20241030070850.1361304-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HVO0SvC_tMNoX5yGmH9gtoi8CjuDtBpe
X-Proofpoint-GUID: i1Nk48XWnY1ypGcVpsC253mwdCT2GXuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300050
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
2.47.0


