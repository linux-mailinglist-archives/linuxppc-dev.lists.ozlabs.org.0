Return-Path: <linuxppc-dev+bounces-2407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADDF9A44F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:38:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVX3k01cNz3bsS;
	Sat, 19 Oct 2024 04:38:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729273089;
	cv=none; b=JoFJrv7o5SOeqx6vVZAAzKh44dGt3haEQZn/fWwxxmxcBPJfkXE/hPSOCz7u36O0ZuebyhyDC2SxD2dORzPMZR/KVM/PQoCxEmMHKs1Q3uKJmR5eMbW58n3/BFnmOkgfo0eLlKaFED7L6mBvGIkQvG4JI43fj/yREy5P/TjlCqe11UwmALdDZTjxiC5+VZoIu1px5ijulamlUBLMDb8rpvAh7U2++e+rglgPwmkaogZoWW5jawUEeufCf9iQL+K2iihLxXQOO7kgelqbERm1rMIsOL25/Ds4lDIHgrhHd86SZPQSr1hO7Kip5r1Hka2i14F6gENFLILX78xS4RZn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729273089; c=relaxed/relaxed;
	bh=UAeRhYZbEhfvN1AIId58NCzeSIwdDuULGGT0t9eeCdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2i7OB5xQFaVepQZVq3qCY9E76lZUeb96555cl2D7YkPvfzmvLSNKiawD02RT6MLsMuzHRBX+TexGDfmheaHYgg6X7e27nb/jQqVMzPJ8XIIKp/P36p2M18tU9hNuzlVxJ1q07EFjfnMsXJz2OlJ9EpY/VQlggqcv9S/TBbYowTZbztkajQO7TP8NsuYgnuWybtjPLmI/lNsecTLFcoPUvRd7z+/VJ8BoxrKzJFvMZZOQz2FzgVanQYhzji2Ut0vkCUzH5b1LOnUVwOFGpTWwKG60ZyGAEc07RVoyf5/nCVAs54mb8Dzk+Abu6Ws2W1lrG0y90DmSg5dBbAdpCM2pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cqQgzswn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cqQgzswn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVX3j08zxz3cGt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:38:08 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IAfuv1013914;
	Fri, 18 Oct 2024 17:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=UAeRhYZbEhfvN1AII
	d58NCzeSIwdDuULGGT0t9eeCdA=; b=cqQgzswnfggqB6iodfth0M0Vw58rWN5EO
	BpJGPFmUx3dxTBbIvVRkpvGtDv9HvoSxXs1G36QDM3ZxeYaU94P4n82xcb/Aws51
	qYgH0vpMe0p/PIYLfbXeKtaWK5VLFnoU1t501ACvCYKCNfKnMKOKUiedwUOQQ5ve
	jWNEy/MTGpBH9nPk44s3iYjFTTrUrEZ9JcbZzfpJ2GpUL1jGONCWx1zGvTL7fSu2
	m3CsaN46cwQKH85tGdLWiIbIxx6MAIxqYiHQMpCRb99Qtmhe69s//iiUejppotLC
	bkYZ5H5SJFHrhStiGJs6Vdte7HwZVWWPnIJ7Avcs66WgYancy49FQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42aqk2u4f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:44 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49IHbiLg001199;
	Fri, 18 Oct 2024 17:37:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42aqk2u4ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:43 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49IFO4Y0005381;
	Fri, 18 Oct 2024 17:37:42 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4285njnppb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:42 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49IHbdvE33423824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 17:37:39 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73F4A20040;
	Fri, 18 Oct 2024 17:37:39 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 188D920043;
	Fri, 18 Oct 2024 17:37:36 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Oct 2024 17:37:35 +0000 (GMT)
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
Subject: [PATCH v6 14/17] powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_CALL_OPS
Date: Fri, 18 Oct 2024 23:06:29 +0530
Message-ID: <20241018173632.277333-15-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018173632.277333-1-hbathini@linux.ibm.com>
References: <20241018173632.277333-1-hbathini@linux.ibm.com>
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
X-Proofpoint-GUID: 8PsWW1uuVYjNgKAh16cJMLi_NYoM670d
X-Proofpoint-ORIG-GUID: _vyDM6ZQAjg0I4oByXi4m-BgMfNtt8Dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 mlxlogscore=651
 impostorscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180111
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Naveen N Rao <naveen@kernel.org>

Implement support for DYNAMIC_FTRACE_WITH_CALL_OPS similar to the
arm64 implementation.

This works by patching-in a pointer to an associated ftrace_ops
structure before each traceable function. If multiple ftrace_ops are
associated with a call site, then a special ftrace_list_ops is used to
enable iterating over all the registered ftrace_ops. If no ftrace_ops
are associated with a call site, then a special ftrace_nop_ops structure
is used to render the ftrace call as a no-op. ftrace trampoline can then
read the associated ftrace_ops for a call site by loading from an offset
from the LR, and branch directly to the associated function.

The primary advantage with this approach is that we don't have to
iterate over all the registered ftrace_ops for call sites that have a
single ftrace_ops registered. This is the equivalent of implementing
support for dynamic ftrace trampolines, which set up a special ftrace
trampoline for each registered ftrace_ops and have individual call sites
branch into those directly.

A secondary advantage is that this gives us a way to add support for
direct ftrace callers without having to resort to using stubs. The
address of the direct call trampoline can be loaded from the ftrace_ops
structure.

To support this, we reserve a nop before each function on 32-bit
powerpc. For 64-bit powerpc, two nops are reserved before each
out-of-line stub. During ftrace activation, we update this location with
the associated ftrace_ops pointer. Then, on ftrace entry, we load from
this location and call into ftrace_ops->func().

For 64-bit powerpc, we ensure that the out-of-line stub area is
doubleword aligned so that ftrace_ops address can be updated atomically.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig                       |  1 +
 arch/powerpc/Makefile                      |  4 ++
 arch/powerpc/include/asm/ftrace.h          |  5 +-
 arch/powerpc/kernel/asm-offsets.c          |  4 ++
 arch/powerpc/kernel/trace/ftrace.c         | 59 +++++++++++++++++++++-
 arch/powerpc/kernel/trace/ftrace_entry.S   | 36 ++++++++++---
 arch/powerpc/tools/ftrace-gen-ool-stubs.sh |  5 +-
 7 files changed, 102 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2e347f682c15..5c5db85c2097 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -234,6 +234,7 @@ config PPC
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
+	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if PPC_FTRACE_OUT_OF_LINE || (PPC32 && ARCH_USING_PATCHABLE_FUNCTION_ENTRY)
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c973e6cd1ae8..7dede0ec0163 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -158,8 +158,12 @@ KBUILD_CPPFLAGS	+= -DCC_USING_PATCHABLE_FUNCTION_ENTRY
 ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
 CC_FLAGS_FTRACE := -fpatchable-function-entry=1
 else
+ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS # PPC32 only
+CC_FLAGS_FTRACE := -fpatchable-function-entry=3,1
+else
 CC_FLAGS_FTRACE := -fpatchable-function-entry=2
 endif
+endif
 else
 CC_FLAGS_FTRACE := -pg
 ifdef CONFIG_MPROFILE_KERNEL
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 28f3590ca780..1ad1328cf4e3 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -136,8 +136,11 @@ static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
 extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
 #ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
 struct ftrace_ool_stub {
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+	struct ftrace_ops *ftrace_op;
+#endif
 	u32	insn[4];
-};
+} __aligned(sizeof(unsigned long));
 extern struct ftrace_ool_stub ftrace_ool_stub_text_end[], ftrace_ool_stub_text[],
 			      ftrace_ool_stub_inittext[];
 extern unsigned int ftrace_ool_stub_text_end_count, ftrace_ool_stub_text_count,
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 9f27ea489cd4..557abe800470 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -680,5 +680,9 @@ int main(void)
 	DEFINE(FTRACE_OOL_STUB_SIZE, sizeof(struct ftrace_ool_stub));
 #endif
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+	OFFSET(FTRACE_OPS_FUNC, ftrace_ops, func);
+#endif
+
 	return 0;
 }
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index bee2c54a8c04..9090d1a21600 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -38,8 +38,11 @@ unsigned long ftrace_call_adjust(unsigned long addr)
 		return 0;
 
 	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY) &&
-	    !IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
+	    !IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
 		addr += MCOUNT_INSN_SIZE;
+		if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
+			addr += MCOUNT_INSN_SIZE;
+	}
 
 	return addr;
 }
@@ -264,6 +267,46 @@ static int ftrace_init_ool_stub(struct module *mod, struct dyn_ftrace *rec)
 #endif
 }
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+static const struct ftrace_ops *powerpc_rec_get_ops(struct dyn_ftrace *rec)
+{
+	const struct ftrace_ops *ops = NULL;
+
+	if (rec->flags & FTRACE_FL_CALL_OPS_EN) {
+		ops = ftrace_find_unique_ops(rec);
+		WARN_ON_ONCE(!ops);
+	}
+
+	if (!ops)
+		ops = &ftrace_list_ops;
+
+	return ops;
+}
+
+static int ftrace_rec_set_ops(struct dyn_ftrace *rec, const struct ftrace_ops *ops)
+{
+	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
+		return patch_ulong((void *)(ftrace_get_ool_stub(rec) - sizeof(unsigned long)),
+				   (unsigned long)ops);
+	else
+		return patch_ulong((void *)(rec->ip - MCOUNT_INSN_SIZE - sizeof(unsigned long)),
+				   (unsigned long)ops);
+}
+
+static int ftrace_rec_set_nop_ops(struct dyn_ftrace *rec)
+{
+	return ftrace_rec_set_ops(rec, &ftrace_nop_ops);
+}
+
+static int ftrace_rec_update_ops(struct dyn_ftrace *rec)
+{
+	return ftrace_rec_set_ops(rec, powerpc_rec_get_ops(rec));
+}
+#else
+static int ftrace_rec_set_nop_ops(struct dyn_ftrace *rec) { return 0; }
+static int ftrace_rec_update_ops(struct dyn_ftrace *rec) { return 0; }
+#endif
+
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned long addr)
 {
@@ -294,6 +337,10 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	if (!ret)
 		ret = ftrace_modify_code(ip, old, new);
 
+	ret = ftrace_rec_update_ops(rec);
+	if (ret)
+		return ret;
+
 	if (!ret && IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
 		ret = ftrace_modify_code(rec->ip, ppc_inst(PPC_RAW_NOP()),
 			 ppc_inst(PPC_RAW_BRANCH((long)ftrace_get_ool_stub(rec) - (long)rec->ip)));
@@ -345,16 +392,19 @@ void ftrace_replace_code(int enable)
 		case FTRACE_UPDATE_MODIFY_CALL:
 			ret = ftrace_get_call_inst(rec, new_addr, &new_call_inst);
 			ret |= ftrace_get_call_inst(rec, addr, &call_inst);
+			ret |= ftrace_rec_update_ops(rec);
 			old = call_inst;
 			new = new_call_inst;
 			break;
 		case FTRACE_UPDATE_MAKE_NOP:
 			ret = ftrace_get_call_inst(rec, addr, &call_inst);
+			ret |= ftrace_rec_set_nop_ops(rec);
 			old = call_inst;
 			new = nop_inst;
 			break;
 		case FTRACE_UPDATE_MAKE_CALL:
 			ret = ftrace_get_call_inst(rec, new_addr, &call_inst);
+			ret |= ftrace_rec_update_ops(rec);
 			old = nop_inst;
 			new = call_inst;
 			break;
@@ -470,6 +520,13 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	ppc_inst_t old, new;
 	int ret;
 
+	/*
+	 * When using CALL_OPS, the function to call is associated with the
+	 * call site, and we don't have a global function pointer to update.
+	 */
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
+		return 0;
+
 	old = ppc_inst_read((u32 *)&ftrace_call);
 	new = ftrace_create_branch_inst(ip, ppc_function_entry(func), 1);
 	ret = ftrace_modify_code(ip, old, new);
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index a6bf7f841040..ff376c990308 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -85,11 +85,21 @@
 	/* Save callee's TOC in the ABI compliant location */
 	std	r2, STK_GOT(r1)
 	LOAD_PACA_TOC()		/* get kernel TOC in r2 */
+#endif
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+	/* r7 points to the instruction following the call to ftrace */
+	PPC_LL	r5, -(MCOUNT_INSN_SIZE*2 + SZL)(r7)
+	PPC_LL	r12, FTRACE_OPS_FUNC(r5)
+	mtctr	r12
+#else /* !CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS */
+#ifdef CONFIG_PPC64
 	LOAD_REG_ADDR(r3, function_trace_op)
 	ld	r5,0(r3)
 #else
 	lis	r3,function_trace_op@ha
 	lwz	r5,function_trace_op@l(r3)
+#endif
 #endif
 
 	/* Save special regs */
@@ -205,20 +215,30 @@
 #endif
 .endm
 
-_GLOBAL(ftrace_regs_caller)
-	ftrace_regs_entry 1
-	/* ftrace_call(r3, r4, r5, r6) */
+.macro ftrace_regs_func allregs
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+	bctrl
+#else
+	.if \allregs == 1
 .globl ftrace_regs_call
 ftrace_regs_call:
+	.else
+.globl ftrace_call
+ftrace_call:
+	.endif
+	/* ftrace_call(r3, r4, r5, r6) */
 	bl	ftrace_stub
+#endif
+.endm
+
+_GLOBAL(ftrace_regs_caller)
+	ftrace_regs_entry 1
+	ftrace_regs_func 1
 	ftrace_regs_exit 1
 
 _GLOBAL(ftrace_caller)
 	ftrace_regs_entry 0
-	/* ftrace_call(r3, r4, r5, r6) */
-.globl ftrace_call
-ftrace_call:
-	bl	ftrace_stub
+	ftrace_regs_func 0
 	ftrace_regs_exit 0
 
 _GLOBAL(ftrace_stub)
@@ -377,7 +397,7 @@ _GLOBAL(return_to_handler)
 #ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
 SYM_DATA(ftrace_ool_stub_text_count, .long CONFIG_PPC_FTRACE_OUT_OF_LINE_NUM_RESERVE)
 
-SYM_CODE_START(ftrace_ool_stub_text)
+SYM_START(ftrace_ool_stub_text, SYM_L_GLOBAL, .balign SZL)
 	.space CONFIG_PPC_FTRACE_OUT_OF_LINE_NUM_RESERVE * FTRACE_OOL_STUB_SIZE
 SYM_CODE_END(ftrace_ool_stub_text)
 #endif
diff --git a/arch/powerpc/tools/ftrace-gen-ool-stubs.sh b/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
index 3ea0f23f2501..76df5a3e8cf7 100755
--- a/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
+++ b/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
@@ -28,12 +28,13 @@ fi
 
 cat > "$arch_vmlinux_S" <<EOF
 #include <asm/asm-offsets.h>
+#include <asm/ppc_asm.h>
 #include <linux/linkage.h>
 
 .pushsection .tramp.ftrace.text,"aw"
 SYM_DATA(ftrace_ool_stub_text_end_count, .long $num_ool_stubs_text_end)
 
-SYM_CODE_START(ftrace_ool_stub_text_end)
+SYM_START(ftrace_ool_stub_text_end, SYM_L_GLOBAL, .balign SZL)
 	.space $num_ool_stubs_text_end * FTRACE_OOL_STUB_SIZE
 SYM_CODE_END(ftrace_ool_stub_text_end)
 .popsection
@@ -41,7 +42,7 @@ SYM_CODE_END(ftrace_ool_stub_text_end)
 .pushsection .tramp.ftrace.init,"aw"
 SYM_DATA(ftrace_ool_stub_inittext_count, .long $num_ool_stubs_inittext)
 
-SYM_CODE_START(ftrace_ool_stub_inittext)
+SYM_START(ftrace_ool_stub_inittext, SYM_L_GLOBAL, .balign SZL)
 	.space $num_ool_stubs_inittext * FTRACE_OOL_STUB_SIZE
 SYM_CODE_END(ftrace_ool_stub_inittext)
 .popsection
-- 
2.47.0


