Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301A4AB593
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 08:11:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsckG0zq4z3cSf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 18:11:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EAtBQeEG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EAtBQeEG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JscgH1VnSz3bWG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 18:08:27 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2174cD3t025112; 
 Mon, 7 Feb 2022 07:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m5/wOwEtBe7uMlr8/q+DbG4pqnQ2UCLmz/Xu4TfY6es=;
 b=EAtBQeEGa9Dip/SqjWz7IT2GiXpM8tz+gkdwAQgJHXfiZalTDX8tLEf7lqT71jLF5cLP
 WIX/VTDmho0/Mxq5FumT6q2KXG+j4SDvTakwpuddAiJb8ZCRronnYmNLGPZWWT1ZdsEj
 NPb/vgYz3hRbrNMn1ye6iyhulwazVLdb23ON6DZ1Jn0Kd+zpzkSl+eIo6nREWHQXSvni
 eLLoWtka+oK2HijFrWregus4TXifPLycMK6xm++xtUXnmSM0tsN+05/SU52Gp/aP1cMM
 X/uOwLrcp6Ucme4dLXMTtqEegO3pYveeeA/eg3EtVB1pL3aiKZ8+9VKMpwqEErRoFEFv KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22tqcjwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 07:07:57 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2176uxkl026697;
 Mon, 7 Feb 2022 07:07:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22tqcjvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 07:07:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21772Oa6007878;
 Mon, 7 Feb 2022 07:07:53 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3e1gv91ds1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 07:07:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21777lZH46924126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 07:07:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C32DA405F;
 Mon,  7 Feb 2022 07:07:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5390AA4060;
 Mon,  7 Feb 2022 07:07:44 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.33.186])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 07:07:44 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC PATCH 3/3] powerpc64/bpf: Add support for bpf trampolines
Date: Mon,  7 Feb 2022 12:37:22 +0530
Message-Id: <ab6c96592eeb184a0d171b3c61fa53333d65f0a9.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yqpcW8_Y4XCWOL2OIPsWd9CnBix4oMNs
X-Proofpoint-GUID: 8PAdQbMmMQMP4CaSNFGp_B94GbHSCBpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_02,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070046
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
Cc: Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
 Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 bpf@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for bpf_arch_text_poke() and arch_prepare_bpf_trampoline()
for powerpc64 -mprofile-kernel.

We set aside space for two stubs at the beginning of each bpf program.
These stubs are used if having to branch to locations outside the range
of a branch instruction.

BPF Trampolines adhere to the powerpc64 -mprofile-kernel ABI since these
need to attach to ftrace locations using ftrace direct attach. Due to
this, bpf_arch_text_poke() patches two instructions: 'mflr r0' and 'bl'
for BPF_MOD_CALL. The trampoline code itself closely follows the x86
implementation.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |   8 +
 arch/powerpc/net/bpf_jit_comp.c   |   5 +-
 arch/powerpc/net/bpf_jit_comp64.c | 619 +++++++++++++++++++++++++++++-
 3 files changed, 630 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 0832235a274983..777b10650678af 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -19,6 +19,14 @@
 #define FUNCTION_DESCR_SIZE	0
 #endif
 
+#ifdef PPC64_ELF_ABI_v2
+#define BPF_TRAMP_STUB_SIZE	32
+#else
+#define BPF_TRAMP_STUB_SIZE	0
+#endif
+
+#define PPC_BPF_MAGIC()			(0xeB9FC0DE)
+
 #define PLANT_INSTR(d, idx, instr)					      \
 	do { if (d) { (d)[idx] = instr; } idx++; } while (0)
 #define EMIT(instr)		PLANT_INSTR(image, ctx->idx, instr)
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 635f7448ff7952..5df2f15bfe4d75 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -220,7 +220,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	extable_len = fp->aux->num_exentries * sizeof(struct exception_table_entry);
 
 	proglen = cgctx.idx * 4;
-	alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_len;
+	alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_len + BPF_TRAMP_STUB_SIZE * 2;
 
 	bpf_hdr = bpf_jit_binary_alloc(alloclen, &image, 4, bpf_jit_fill_ill_insns);
 	if (!bpf_hdr) {
@@ -228,6 +228,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		goto out_addrs;
 	}
 
+	image += BPF_TRAMP_STUB_SIZE * 2;
+
 	if (extable_len)
 		fp->aux->extable = (void *)image + FUNCTION_DESCR_SIZE + proglen + fixup_len;
 
@@ -251,6 +253,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	}
 
 	/* Code generation passes 1-2 */
+	*(code_base - 1) = PPC_BPF_MAGIC();
 	for (pass = 1; pass < 3; pass++) {
 		/* Now build the prologue, body code & epilogue for real. */
 		cgctx.idx = 0;
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index c3cfe1f4338fca..20d8f6e3cc9bb0 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -13,6 +13,7 @@
 #include <linux/netdevice.h>
 #include <linux/filter.h>
 #include <linux/if_vlan.h>
+#include <linux/memory.h>
 #include <asm/kprobes.h>
 #include <linux/bpf.h>
 #include <asm/security_features.h>
@@ -73,6 +74,10 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 {
 	int i;
 
+	/* two nops for trampoline attach */
+	EMIT(PPC_RAW_NOP());
+	EMIT(PPC_RAW_NOP());
+
 #ifdef PPC64_ELF_ABI_v2
 	PPC_BPF_LL(_R2, _R13, offsetof(struct paca_struct, kernel_toc));
 #else
@@ -93,7 +98,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		EMIT(PPC_RAW_NOP());
 	}
 
-#define BPF_TAILCALL_PROLOGUE_SIZE	12
+#define BPF_TAILCALL_PROLOGUE_SIZE	20
 
 	if (bpf_has_stack_frame(ctx)) {
 		/*
@@ -1133,3 +1138,615 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 
 	return 0;
 }
+
+#ifdef PPC64_ELF_ABI_v2
+
+static __always_inline int bpf_check_and_patch(u32 *ip, ppc_inst_t old_inst, ppc_inst_t new_inst)
+{
+	ppc_inst_t org_inst = ppc_inst_read(ip);
+	if (!ppc_inst_equal(org_inst, old_inst)) {
+		pr_info("bpf_check_and_patch: ip: 0x%lx, org_inst(0x%x) != old_inst (0x%x)\n",
+				(unsigned long)ip, ppc_inst_val(org_inst), ppc_inst_val(old_inst));
+		return -EBUSY;
+	}
+	if (ppc_inst_equal(org_inst, new_inst))
+		return 1;
+	return patch_instruction(ip, new_inst);
+}
+
+static u32 *bpf_find_existing_stub(u32 *ip, enum bpf_text_poke_type t, void *old_addr)
+{
+	int branch_flags = t == BPF_MOD_JUMP ? 0 : BRANCH_SET_LINK;
+	u32 *stub_addr = 0, *stub1, *stub2;
+	ppc_inst_t org_inst, old_inst;
+
+	if (!old_addr)
+		return 0;
+
+	stub1 = ip - (BPF_TRAMP_STUB_SIZE / sizeof(u32)) - (t == BPF_MOD_CALL ? 1 : 0);
+	stub2 = stub1 - (BPF_TRAMP_STUB_SIZE / sizeof(u32));
+	org_inst = ppc_inst_read(ip);
+	if (!create_branch(&old_inst, ip, (unsigned long)stub1, branch_flags) &&
+	    ppc_inst_equal(org_inst, old_inst))
+		stub_addr = stub1;
+	if (!create_branch(&old_inst, ip, (unsigned long)stub2, branch_flags) &&
+	    ppc_inst_equal(org_inst, old_inst))
+		stub_addr = stub2;
+
+	return stub_addr;
+}
+
+static u32 *bpf_setup_stub(u32 *ip, enum bpf_text_poke_type t, void *old_addr, void *new_addr)
+{
+	u32 *stub_addr, *stub1, *stub2;
+	ppc_inst_t org_inst, old_inst;
+	int i, ret;
+	u32 stub[] = {
+		PPC_RAW_LIS(12, 0),
+		PPC_RAW_ORI(12, 12, 0),
+		PPC_RAW_SLDI(12, 12, 32),
+		PPC_RAW_ORIS(12, 12, 0),
+		PPC_RAW_ORI(12, 12, 0),
+		PPC_RAW_MTCTR(12),
+		PPC_RAW_BCTR(),
+	};
+
+	/* verify we are patching the right location */
+	if (t == BPF_MOD_JUMP)
+		org_inst = ppc_inst_read(ip - 1);
+	else
+		org_inst = ppc_inst_read(ip - 2);
+	old_inst = ppc_inst(PPC_BPF_MAGIC());
+	if (!ppc_inst_equal(org_inst, old_inst))
+		return 0;
+
+	/* verify existing branch and note down the stub to use */
+	stub1 = ip - (BPF_TRAMP_STUB_SIZE / sizeof(u32)) - (t == BPF_MOD_CALL ? 1 : 0);
+	stub2 = stub1 - (BPF_TRAMP_STUB_SIZE / sizeof(u32));
+	stub_addr = 0;
+	org_inst = ppc_inst_read(ip);
+	if (old_addr) {
+		stub_addr = bpf_find_existing_stub(ip, t, old_addr);
+		/* existing instruction should branch to one of the two stubs */
+		if (!stub_addr)
+			return 0;
+	} else {
+		old_inst = ppc_inst(PPC_RAW_NOP());
+		if (!ppc_inst_equal(org_inst, old_inst))
+			return 0;
+	}
+	if (stub_addr == stub1)
+		stub_addr = stub2;
+	else
+		stub_addr = stub1;
+
+	/* setup stub */
+	stub[0] |= IMM_L((unsigned long)new_addr >> 48);
+	stub[1] |= IMM_L((unsigned long)new_addr >> 32);
+	stub[3] |= IMM_L((unsigned long)new_addr >> 16);
+	stub[4] |= IMM_L((unsigned long)new_addr);
+	for (i = 0; i < sizeof(stub) / sizeof(u32); i++) {
+		ret = patch_instruction(stub_addr + i, ppc_inst(stub[i]));
+		if (ret) {
+			pr_err("bpf: patch_instruction() error while setting up stub: ret %d\n", ret);
+			return 0;
+		}
+	}
+
+	return stub_addr;
+}
+
+int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type t, void *old_addr, void *new_addr)
+{
+	ppc_inst_t org_inst, old_inst, new_inst;
+	int ret = -EINVAL;
+	u32 *stub_addr;
+
+	/* We currently only support poking bpf programs */
+	if (!is_bpf_text_address((long)ip)) {
+		pr_info("bpf_arch_text_poke (0x%lx): kernel/modules are not supported\n", (unsigned long)ip);
+		return -EINVAL;
+	}
+
+	mutex_lock(&text_mutex);
+	if (t == BPF_MOD_JUMP) {
+		/*
+		 * This can point to the beginning of a bpf program, or to certain locations
+		 * within a bpf program. We operate on a single instruction at ip here,
+		 * converting among a nop and an unconditional branch. Depending on branch
+		 * target, we may use the stub area at the beginning of the bpf program and
+		 * we assume that BPF_MOD_JUMP and BPF_MOD_CALL are never used without
+		 * transitioning to a nop.
+		 */
+		if (!old_addr && new_addr) {
+			/* nop -> b */
+			old_inst = ppc_inst(PPC_RAW_NOP());
+			if (create_branch(&new_inst, (u32 *)ip, (unsigned long)new_addr, 0)) {
+				stub_addr = bpf_setup_stub(ip, t, old_addr, new_addr);
+				if (!stub_addr ||
+				    create_branch(&new_inst, (u32 *)ip, (unsigned long)stub_addr, 0)) {
+					ret = -EINVAL;
+					goto out;
+				}
+			}
+			ret = bpf_check_and_patch(ip, old_inst, new_inst);
+		} else if (old_addr && !new_addr) {
+			/* b -> nop */
+			new_inst = ppc_inst(PPC_RAW_NOP());
+			if (create_branch(&old_inst, (u32 *)ip, (unsigned long)old_addr, 0)) {
+				stub_addr = bpf_find_existing_stub(ip, t, old_addr);
+				if (!stub_addr ||
+				    create_branch(&old_inst, (u32 *)ip, (unsigned long)stub_addr, 0)) {
+					ret = -EINVAL;
+					goto out;
+				}
+			}
+			ret = bpf_check_and_patch(ip, old_inst, new_inst);
+		} else if (old_addr && new_addr) {
+			/* b -> b */
+			stub_addr = 0;
+			if (create_branch(&old_inst, (u32 *)ip, (unsigned long)old_addr, 0)) {
+				stub_addr = bpf_find_existing_stub(ip, t, old_addr);
+				if (!stub_addr ||
+				    create_branch(&old_inst, (u32 *)ip, (unsigned long)stub_addr, 0)) {
+					ret = -EINVAL;
+					goto out;
+				}
+			}
+			if (create_branch(&new_inst, (u32 *)ip, (unsigned long)new_addr, 0)) {
+				stub_addr = bpf_setup_stub(ip, t, old_addr, new_addr);
+				if (!stub_addr ||
+				    create_branch(&new_inst, (u32 *)ip, (unsigned long)stub_addr, 0)) {
+					ret = -EINVAL;
+					goto out;
+				}
+			}
+			ret = bpf_check_and_patch((u32 *)ip, old_inst, new_inst);
+		}
+	} else if (t == BPF_MOD_CALL) {
+		/*
+		 * For a BPF_MOD_CALL, we expect ip to point at the start of a bpf program.
+		 * We will have to patch two instructions to mimic -mprofile-kernel: a 'mflr r0'
+		 * followed by a 'bl'. Instruction patching order matters: we always patch-in
+		 * the 'mflr r0' first and patch it out the last.
+		 */
+		if (!old_addr && new_addr) {
+			/* nop -> bl */
+
+			/* confirm that we have two nops */
+			old_inst = ppc_inst(PPC_RAW_NOP());
+			org_inst = ppc_inst_read(ip);
+			if (!ppc_inst_equal(org_inst, old_inst)) {
+				ret = -EINVAL;
+				goto out;
+			}
+			org_inst = ppc_inst_read((u32 *)ip + 1);
+			if (!ppc_inst_equal(org_inst, old_inst)) {
+				ret = -EINVAL;
+				goto out;
+			}
+
+			/* patch in the mflr */
+			new_inst = ppc_inst(PPC_RAW_MFLR(_R0));
+			ret = bpf_check_and_patch(ip, old_inst, new_inst);
+			if (ret)
+				goto out;
+
+			/* prep the stub if needed */
+			ip = (u32 *)ip + 1;
+			if (create_branch(&new_inst, (u32 *)ip, (unsigned long)new_addr, BRANCH_SET_LINK)) {
+				stub_addr = bpf_setup_stub(ip, t, old_addr, new_addr);
+				if (!stub_addr ||
+				    create_branch(&new_inst, (u32 *)ip, (unsigned long)stub_addr, BRANCH_SET_LINK)) {
+					ret = -EINVAL;
+					goto out;
+				}
+			}
+
+			synchronize_rcu();
+
+			/* patch in the bl */
+			ret = bpf_check_and_patch(ip, old_inst, new_inst);
+		} else if (old_addr && !new_addr) {
+			/* bl -> nop */
+
+			/* confirm the expected instruction sequence */
+			old_inst = ppc_inst(PPC_RAW_MFLR(_R0));
+			org_inst = ppc_inst_read(ip);
+			if (!ppc_inst_equal(org_inst, old_inst)) {
+				ret = -EINVAL;
+				goto out;
+			}
+			ip = (u32 *)ip + 1;
+			org_inst = ppc_inst_read(ip);
+			if (create_branch(&old_inst, (u32 *)ip, (unsigned long)old_addr, BRANCH_SET_LINK)) {
+				stub_addr = bpf_find_existing_stub(ip, t, old_addr);
+				if (!stub_addr ||
+				    create_branch(&old_inst, (u32 *)ip, (unsigned long)stub_addr, BRANCH_SET_LINK)) {
+					ret = -EINVAL;
+					goto out;
+				}
+			}
+			if (!ppc_inst_equal(org_inst, old_inst)) {
+				ret = -EINVAL;
+				goto out;
+			}
+
+			/* patch out the branch first */
+			new_inst = ppc_inst(PPC_RAW_NOP());
+			ret = bpf_check_and_patch(ip, old_inst, new_inst);
+			if (ret)
+				goto out;
+
+			synchronize_rcu();
+
+			/* then, the mflr */
+			old_inst = ppc_inst(PPC_RAW_MFLR(_R0));
+			ret = bpf_check_and_patch((u32 *)ip - 1, old_inst, new_inst);
+		} else if (old_addr && new_addr) {
+			/* bl -> bl */
+
+			/* confirm the expected instruction sequence */
+			old_inst = ppc_inst(PPC_RAW_MFLR(_R0));
+			org_inst = ppc_inst_read(ip);
+			if (!ppc_inst_equal(org_inst, old_inst)) {
+				ret = -EINVAL;
+				goto out;
+			}
+			ip = (u32 *)ip + 1;
+			org_inst = ppc_inst_read(ip);
+			if (create_branch(&old_inst, (u32 *)ip, (unsigned long)old_addr, BRANCH_SET_LINK)) {
+				stub_addr = bpf_find_existing_stub(ip, t, old_addr);
+				if (!stub_addr ||
+				    create_branch(&old_inst, (u32 *)ip, (unsigned long)stub_addr, BRANCH_SET_LINK)) {
+					ret = -EINVAL;
+					goto out;
+				}
+			}
+			if (!ppc_inst_equal(org_inst, old_inst)) {
+				ret = -EINVAL;
+				goto out;
+			}
+
+			/* setup the new branch */
+			if (create_branch(&new_inst, (u32 *)ip, (unsigned long)new_addr, BRANCH_SET_LINK)) {
+				stub_addr = bpf_setup_stub(ip, t, old_addr, new_addr);
+				if (!stub_addr ||
+				    create_branch(&new_inst, (u32 *)ip, (unsigned long)stub_addr, BRANCH_SET_LINK)) {
+					ret = -EINVAL;
+					goto out;
+				}
+			}
+			ret = bpf_check_and_patch(ip, old_inst, new_inst);
+		}
+	}
+
+out:
+	mutex_unlock(&text_mutex);
+	return ret;
+}
+
+/*
+ * BPF Trampoline stack frame layout:
+ *
+ *		[	prev sp		] <-----
+ *		[   BPF_TRAMP_R26_SAVE	] 8	|
+ *		[   BPF_TRAMP_R25_SAVE	] 8	|
+ *		[   BPF_TRAMP_LR_SAVE	] 8	|
+ *		[       ret val		] 8	|
+ *		[   BPF_TRAMP_PROG_CTX	] 8 * 8	|
+ *		[ BPF_TRAMP_FUNC_ARG_CNT] 8	|
+ *		[   BPF_TRAMP_FUNC_IP	] 8	|
+ * sp (r1) --->	[   stack frame header	] ------
+ */
+
+/* stack frame header + data, quadword aligned */
+#define BPF_TRAMP_FRAME_SIZE	(STACK_FRAME_MIN_SIZE + (14 * 8))
+
+/* The below are offsets from r1 */
+/* upto 8 dword func parameters, as bpf prog ctx */
+#define BPF_TRAMP_PROG_CTX	(STACK_FRAME_MIN_SIZE + 16)
+/* bpf_get_func_arg_cnt() needs this before prog ctx */
+#define BPF_TRAMP_FUNC_ARG_CNT	(BPF_TRAMP_PROG_CTX - 8)
+/* bpf_get_func_ip() needs this here */
+#define BPF_TRAMP_FUNC_IP	(BPF_TRAMP_PROG_CTX - 16)
+/* lr save area, after space for upto 8 args followed by retval of orig_call/fentry progs */
+#define BPF_TRAMP_LR_SAVE	(BPF_TRAMP_PROG_CTX + (8 * 8) + 8)
+#define BPF_TRAMP_R25_SAVE	(BPF_TRAMP_LR_SAVE + 8)
+#define BPF_TRAMP_R26_SAVE	(BPF_TRAMP_R25_SAVE + 8)
+
+#define BPF_INSN_SAFETY		64
+
+static int invoke_bpf_prog(const struct btf_func_model *m, u32 *image, struct codegen_context *ctx,
+			   struct bpf_prog *p, bool save_ret)
+{
+	ppc_inst_t branch_insn;
+	u32 jmp_idx;
+	int ret;
+
+	/* __bpf_prog_enter(p) */
+	PPC_LI64(_R3, (unsigned long)p);
+	EMIT(PPC_RAW_MR(_R25, _R3));
+	ret = bpf_jit_emit_func_call_hlp(image, ctx,
+			p->aux->sleepable ? (u64)__bpf_prog_enter_sleepable : (u64)__bpf_prog_enter);
+	if (ret)
+		return ret;
+
+	/* remember prog start time returned by __bpf_prog_enter */
+	EMIT(PPC_RAW_MR(_R26, _R3));
+
+	/*
+	 * if (__bpf_prog_enter(p) == 0)
+	 *	goto skip_exec_of_prog;
+	 *
+	 * emit a nop to be later patched with conditional branch, once offset is known
+	 */
+	EMIT(PPC_RAW_CMPDI(_R3, 0));
+	jmp_idx = ctx->idx;
+	EMIT(PPC_RAW_NOP());
+
+	/* p->bpf_func() */
+	EMIT(PPC_RAW_ADDI(_R3, _R1, BPF_TRAMP_PROG_CTX));
+	if (!p->jited)
+		PPC_LI64(_R4, (unsigned long)p->insnsi);
+	if (is_offset_in_branch_range((unsigned long)p->bpf_func - (unsigned long)&image[ctx->idx])) {
+		PPC_BL((unsigned long)p->bpf_func);
+	} else {
+		PPC_BPF_LL(_R12, _R25, offsetof(struct bpf_prog, bpf_func));
+		EMIT(PPC_RAW_MTCTR(_R12));
+		EMIT(PPC_RAW_BCTRL());
+	}
+
+	if (save_ret)
+		PPC_BPF_STL(_R3, _R1, BPF_TRAMP_PROG_CTX + (m->nr_args * 8));
+
+	/* fix up branch */
+	if (create_cond_branch(&branch_insn, &image[jmp_idx], (unsigned long)&image[ctx->idx], COND_EQ << 16))
+		return -EINVAL;
+	image[jmp_idx] = ppc_inst_val(branch_insn);
+
+	/* __bpf_prog_exit(p, start_time) */
+	EMIT(PPC_RAW_MR(_R3, _R25));
+	EMIT(PPC_RAW_MR(_R4, _R26));
+	ret = bpf_jit_emit_func_call_hlp(image, ctx,
+			p->aux->sleepable ? (u64)__bpf_prog_exit_sleepable : (u64)__bpf_prog_exit);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int invoke_bpf(const struct btf_func_model *m, u32 *image, struct codegen_context *ctx,
+		      struct bpf_tramp_progs *tp, bool save_ret)
+{
+	int i;
+
+	for (i = 0; i < tp->nr_progs; i++) {
+		if (invoke_bpf_prog(m, image, ctx, tp->progs[i], save_ret))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int invoke_bpf_mod_ret(const struct btf_func_model *m, u32 *image, struct codegen_context *ctx,
+			      struct bpf_tramp_progs *tp, u32 *branches)
+{
+	int i;
+
+	/*
+	 * The first fmod_ret program will receive a garbage return value.
+	 * Set this to 0 to avoid confusing the program.
+	 */
+	EMIT(PPC_RAW_LI(_R3, 0));
+	PPC_BPF_STL(_R3, _R1, BPF_TRAMP_PROG_CTX + (m->nr_args * 8));
+	for (i = 0; i < tp->nr_progs; i++) {
+		if (invoke_bpf_prog(m, image, ctx, tp->progs[i], true))
+			return -EINVAL;
+
+		/*
+		 * mod_ret prog stored return value after prog ctx. Emit:
+		 * if (*(u64 *)(ret_val) !=  0)
+		 *	goto do_fexit;
+		 */
+		PPC_BPF_LL(_R3, _R1, BPF_TRAMP_PROG_CTX + (m->nr_args * 8));
+		EMIT(PPC_RAW_CMPDI(_R3, 0));
+
+		/*
+		 * Save the location of the branch and generate a nop, which is
+		 * replaced with a conditional jump once do_fexit (i.e. the
+		 * start of the fexit invocation) is finalized.
+		 */
+		branches[i] = ctx->idx;
+		EMIT(PPC_RAW_NOP());
+	}
+
+	return 0;
+}
+
+static bool is_valid_bpf_tramp_flags(unsigned int flags)
+{
+	if ((flags & BPF_TRAMP_F_RESTORE_REGS) && (flags & BPF_TRAMP_F_SKIP_FRAME))
+		return false;
+
+	/* We only support attaching to function entry */
+	if ((flags & BPF_TRAMP_F_CALL_ORIG) && !(flags & BPF_TRAMP_F_SKIP_FRAME))
+		return false;
+
+	/* BPF_TRAMP_F_RET_FENTRY_RET is only used by bpf_struct_ops, and it must be used alone */
+	if ((flags & BPF_TRAMP_F_RET_FENTRY_RET) && (flags & ~BPF_TRAMP_F_RET_FENTRY_RET))
+		return false;
+
+	return true;
+}
+
+/*
+ * We assume that orig_call is what this trampoline is being attached to and we use the link
+ * register for BPF_TRAMP_F_CALL_ORIG -- see is_valid_bpf_tramp_flags() for validating this.
+ */
+int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image_start, void *image_end,
+				const struct btf_func_model *m, u32 flags,
+				struct bpf_tramp_progs *tprogs,
+				void *orig_call __maybe_unused)
+{
+	bool save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
+	struct bpf_tramp_progs *fentry = &tprogs[BPF_TRAMP_FENTRY];
+	struct bpf_tramp_progs *fexit = &tprogs[BPF_TRAMP_FEXIT];
+	struct bpf_tramp_progs *fmod_ret = &tprogs[BPF_TRAMP_MODIFY_RETURN];
+	struct codegen_context codegen_ctx, *ctx;
+	int i, ret, nr_args = m->nr_args;
+	u32 *image = (u32 *)image_start;
+	ppc_inst_t branch_insn;
+	u32 *branches = NULL;
+
+	if (nr_args > 8 || !is_valid_bpf_tramp_flags(flags))
+		return -EINVAL;
+
+	ctx = &codegen_ctx;
+	memset(ctx, 0, sizeof(*ctx));
+
+	/*
+	 * Prologue for the trampoline follows ftrace -mprofile-kernel ABI.
+	 * On entry, LR has our return address while r0 has original return address.
+	 *	std	r0, 16(r1)
+	 *	stdu	r1, -144(r1)
+	 *	mflr	r0
+	 *	std	r0, 112(r1)
+	 *	std	r2, 24(r1)
+	 *	ld	r2, PACATOC(r13)
+	 *	std	r3, 40(r1)
+	 *	std	r4, 48(r2)
+	 *	...
+	 *	std	r25, 120(r1)
+	 *	std	r26, 128(r1)
+	 */
+	PPC_BPF_STL(_R0, _R1, PPC_LR_STKOFF);
+	PPC_BPF_STLU(_R1, _R1, -BPF_TRAMP_FRAME_SIZE);
+	EMIT(PPC_RAW_MFLR(_R0));
+	PPC_BPF_STL(_R0, _R1, BPF_TRAMP_LR_SAVE);
+	PPC_BPF_STL(_R2, _R1, 24);
+	PPC_BPF_LL(_R2, _R13, offsetof(struct paca_struct, kernel_toc));
+	for (i = 0; i < nr_args; i++)
+		PPC_BPF_STL(_R3 + i, _R1, BPF_TRAMP_PROG_CTX + (i * 8));
+	PPC_BPF_STL(_R25, _R1, BPF_TRAMP_R25_SAVE);
+	PPC_BPF_STL(_R26, _R1, BPF_TRAMP_R26_SAVE);
+
+	/* save function arg count -- see bpf_get_func_arg_cnt() */
+	EMIT(PPC_RAW_LI(_R3, nr_args));
+	PPC_BPF_STL(_R3, _R1, BPF_TRAMP_FUNC_ARG_CNT);
+
+	/* save nip of the traced function before bpf prog ctx -- see bpf_get_func_ip() */
+	if (flags & BPF_TRAMP_F_IP_ARG) {
+		/* TODO: should this be GEP? */
+		EMIT(PPC_RAW_ADDI(_R3, _R0, -8));
+		PPC_BPF_STL(_R3, _R1, BPF_TRAMP_FUNC_IP);
+	}
+
+	if (flags & BPF_TRAMP_F_CALL_ORIG) {
+		PPC_LI64(_R3, (unsigned long)im);
+		ret = bpf_jit_emit_func_call_hlp(image, ctx, (u64)__bpf_tramp_enter);
+		if (ret)
+			return ret;
+	}
+
+	if (fentry->nr_progs)
+		if (invoke_bpf(m, image, ctx, fentry, flags & BPF_TRAMP_F_RET_FENTRY_RET))
+			return -EINVAL;
+
+	if (fmod_ret->nr_progs) {
+		branches = kcalloc(fmod_ret->nr_progs, sizeof(u32), GFP_KERNEL);
+		if (!branches)
+			return -ENOMEM;
+
+		if (invoke_bpf_mod_ret(m, image, ctx, fmod_ret, branches)) {
+			ret = -EINVAL;
+			goto cleanup;
+		}
+	}
+
+	/* call original function */
+	if (flags & BPF_TRAMP_F_CALL_ORIG) {
+		PPC_BPF_LL(_R3, _R1, BPF_TRAMP_LR_SAVE);
+		EMIT(PPC_RAW_MTCTR(_R3));
+
+		/* restore args */
+		for (i = 0; i < nr_args; i++)
+			PPC_BPF_LL(_R3 + i, _R1, BPF_TRAMP_PROG_CTX + (i * 8));
+
+		PPC_BPF_LL(_R2, _R1, 24);
+		EMIT(PPC_RAW_BCTRL());
+		PPC_BPF_LL(_R2, _R13, offsetof(struct paca_struct, kernel_toc));
+
+		/* remember return value in a stack for bpf prog to access */
+		PPC_BPF_STL(_R3, _R1, BPF_TRAMP_PROG_CTX + (nr_args * 8));
+
+		/* reserve space to patch branch instruction to skip fexit progs */
+		im->ip_after_call = &image[ctx->idx];
+		EMIT(PPC_RAW_NOP());
+	}
+
+	if (fmod_ret->nr_progs) {
+		/* update branches saved in invoke_bpf_mod_ret with aligned address of do_fexit */
+		for (i = 0; i < fmod_ret->nr_progs; i++) {
+			if (create_cond_branch(&branch_insn, &image[branches[i]],
+					       (unsigned long)&image[ctx->idx], COND_NE << 16)) {
+				ret = -EINVAL;
+				goto cleanup;
+			}
+
+			image[branches[i]] = ppc_inst_val(branch_insn);
+		}
+	}
+
+	if (fexit->nr_progs)
+		if (invoke_bpf(m, image, ctx, fexit, false)) {
+			ret = -EINVAL;
+			goto cleanup;
+		}
+
+	if (flags & BPF_TRAMP_F_RESTORE_REGS)
+		for (i = 0; i < nr_args; i++)
+			PPC_BPF_LL(_R3 + i, _R1, BPF_TRAMP_PROG_CTX + (i * 8));
+
+	if (flags & BPF_TRAMP_F_CALL_ORIG) {
+		im->ip_epilogue = &image[ctx->idx];
+		PPC_LI64(_R3, (unsigned long)im);
+		ret = bpf_jit_emit_func_call_hlp(image, ctx, (u64)__bpf_tramp_exit);
+		if (ret)
+			goto cleanup;
+	}
+
+	/* restore return value of orig_call or fentry prog */
+	if (save_ret)
+		PPC_BPF_LL(_R3, _R1, BPF_TRAMP_PROG_CTX + (nr_args * 8));
+
+	/* epilogue */
+	PPC_BPF_LL(_R26, _R1, BPF_TRAMP_R26_SAVE);
+	PPC_BPF_LL(_R25, _R1, BPF_TRAMP_R25_SAVE);
+	PPC_BPF_LL(_R2, _R1, 24);
+	if (flags & BPF_TRAMP_F_SKIP_FRAME) {
+		/* skip our return address and return to parent */
+		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_TRAMP_FRAME_SIZE));
+		PPC_BPF_LL(_R0, _R1, PPC_LR_STKOFF);
+		EMIT(PPC_RAW_MTCTR(_R0));
+	} else {
+		PPC_BPF_LL(_R0, _R1, BPF_TRAMP_LR_SAVE);
+		EMIT(PPC_RAW_MTCTR(_R0));
+		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_TRAMP_FRAME_SIZE));
+		PPC_BPF_LL(_R0, _R1, PPC_LR_STKOFF);
+		EMIT(PPC_RAW_MTLR(_R0));
+	}
+	EMIT(PPC_RAW_BCTR());
+
+	/* make sure the trampoline generation logic doesn't overflow */
+	if (WARN_ON_ONCE(&image[ctx->idx] > (u32 *)image_end - BPF_INSN_SAFETY)) {
+		ret = -EFAULT;
+		goto cleanup;
+	}
+	ret = (u8 *)&image[ctx->idx] - (u8 *)image;
+
+cleanup:
+	kfree(branches);
+	return ret;
+}
+#endif
-- 
2.34.1

