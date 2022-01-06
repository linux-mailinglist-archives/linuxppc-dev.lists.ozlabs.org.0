Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C6C4863EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 12:49:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JV4Pm6zRgz30Lc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 22:49:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pwA6R4zg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pwA6R4zg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JV4Lr48RRz30JB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 22:46:28 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206B6iiT018340; 
 Thu, 6 Jan 2022 11:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rJOIvohYLtxf2Gq6pKt9yzLd4MrYXsStnK384+ihmmc=;
 b=pwA6R4zgrvff05vGXKdyyp4Nq50GmoBpJvTNEqu77s6IWHfl9KJNw2RCFZVgkeUXiwFc
 n2q/Arf4lP5nn9u+PdJiCOM/Ec0pvwaZwaLouxW4Tgw5tvN+84oBEOqWlb04/MdKMgDd
 jUQGfRADZoESep1YKhWurmYR/6s1uLyLIDuSxz+XNcvwzZLjRHRak2cjVl/gS/X+9XwL
 8m4MdkYxi7/erT8uZqFNUBJJsTWHNimJcTpdovSH3dFYe2pb3/5BstxMyZvsfzYy/Baz
 1SFMsJVleR1s2CiHT89a0SG2Xm1PG93rz73QDcRLgavZCdouifbrXAk7L6xcvGtjfKDs UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ddud7vxfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:09 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 206Be1oY004529;
 Thu, 6 Jan 2022 11:46:09 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ddud7vxey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:09 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206BhJ5m013100;
 Thu, 6 Jan 2022 11:46:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3ddmugchn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:07 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206Bk4C348300446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 11:46:04 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 179EDA4068;
 Thu,  6 Jan 2022 11:46:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52212A4062;
 Thu,  6 Jan 2022 11:46:01 +0000 (GMT)
Received: from naverao1-tp.ibm.com (unknown [9.43.91.118])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 11:46:01 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: [PATCH 03/13] powerpc/bpf: Update ldimm64 instructions during extra
 pass
Date: Thu,  6 Jan 2022 17:15:07 +0530
Message-Id: <7cc162af77ba918eb3ecd26ec9e7824bc44b1fae.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rlfzlnLi8Hm7w9-59TNFnW9VVBklD9C5
X-Proofpoint-ORIG-GUID: cD0JcllM-d8ktZXvBYqvZ8lmJlV0Q08g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_04,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=621 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060081
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
Cc: ykaliuta@redhat.com, johan.almbladh@anyfinetworks.com,
 linuxppc-dev@lists.ozlabs.org, song@kernel.org, bpf@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These instructions are updated after the initial JIT, so redo codegen
during the extra pass. Rename bpf_jit_fixup_subprog_calls() to clarify
that this is more than just subprog calls.

Fixes: 69c087ba6225b5 ("bpf: Add bpf_for_each_map_elem() helper")
Cc: stable@vger.kernel.org # v5.15
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c   | 29 +++++++++++++++++++++++------
 arch/powerpc/net/bpf_jit_comp32.c |  6 ++++++
 arch/powerpc/net/bpf_jit_comp64.c |  7 ++++++-
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index d6ffdd0f2309d0..56dd1f4e3e4447 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -23,15 +23,15 @@ static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
 	memset32(area, BREAKPOINT_INSTRUCTION, size / 4);
 }
 
-/* Fix the branch target addresses for subprog calls */
-static int bpf_jit_fixup_subprog_calls(struct bpf_prog *fp, u32 *image,
-				       struct codegen_context *ctx, u32 *addrs)
+/* Fix updated addresses (for subprog calls, ldimm64, et al) during extra pass */
+static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
+				   struct codegen_context *ctx, u32 *addrs)
 {
 	const struct bpf_insn *insn = fp->insnsi;
 	bool func_addr_fixed;
 	u64 func_addr;
 	u32 tmp_idx;
-	int i, ret;
+	int i, j, ret;
 
 	for (i = 0; i < fp->len; i++) {
 		/*
@@ -66,6 +66,23 @@ static int bpf_jit_fixup_subprog_calls(struct bpf_prog *fp, u32 *image,
 			 * of the JITed sequence remains unchanged.
 			 */
 			ctx->idx = tmp_idx;
+		} else if (insn[i].code == (BPF_LD | BPF_IMM | BPF_DW)) {
+			tmp_idx = ctx->idx;
+			ctx->idx = addrs[i] / 4;
+#ifdef CONFIG_PPC32
+			PPC_LI32(ctx->b2p[insn[i].dst_reg] - 1, (u32)insn[i + 1].imm);
+			PPC_LI32(ctx->b2p[insn[i].dst_reg], (u32)insn[i].imm);
+			for (j = ctx->idx - addrs[i] / 4; j < 4; j++)
+				EMIT(PPC_RAW_NOP());
+#else
+			func_addr = ((u64)(u32)insn[i].imm) | (((u64)(u32)insn[i + 1].imm) << 32);
+			PPC_LI64(b2p[insn[i].dst_reg], func_addr);
+			/* overwrite rest with nops */
+			for (j = ctx->idx - addrs[i] / 4; j < 5; j++)
+				EMIT(PPC_RAW_NOP());
+#endif
+			ctx->idx = tmp_idx;
+			i++;
 		}
 	}
 
@@ -200,13 +217,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		/*
 		 * Do not touch the prologue and epilogue as they will remain
 		 * unchanged. Only fix the branch target address for subprog
-		 * calls in the body.
+		 * calls in the body, and ldimm64 instructions.
 		 *
 		 * This does not change the offsets and lengths of the subprog
 		 * call instruction sequences and hence, the size of the JITed
 		 * image as well.
 		 */
-		bpf_jit_fixup_subprog_calls(fp, code_base, &cgctx, addrs);
+		bpf_jit_fixup_addresses(fp, code_base, &cgctx, addrs);
 
 		/* There is no need to perform the usual passes. */
 		goto skip_codegen_passes;
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 997a47fa615b30..2258d3886d02ec 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -293,6 +293,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		bool func_addr_fixed;
 		u64 func_addr;
 		u32 true_cond;
+		u32 tmp_idx;
+		int j;
 
 		/*
 		 * addrs[] maps a BPF bytecode address into a real offset from
@@ -908,8 +910,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 * 16 byte instruction that uses two 'struct bpf_insn'
 		 */
 		case BPF_LD | BPF_IMM | BPF_DW: /* dst = (u64) imm */
+			tmp_idx = ctx->idx;
 			PPC_LI32(dst_reg_h, (u32)insn[i + 1].imm);
 			PPC_LI32(dst_reg, (u32)insn[i].imm);
+			/* padding to allow full 4 instructions for later patching */
+			for (j = ctx->idx - tmp_idx; j < 4; j++)
+				EMIT(PPC_RAW_NOP());
 			/* Adjust for two bpf instructions */
 			addrs[++i] = ctx->idx * 4;
 			break;
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 472d4a551945dd..3d018ecc475b2b 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -319,6 +319,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u64 imm64;
 		u32 true_cond;
 		u32 tmp_idx;
+		int j;
 
 		/*
 		 * addrs[] maps a BPF bytecode address into a real offset from
@@ -848,9 +849,13 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		case BPF_LD | BPF_IMM | BPF_DW: /* dst = (u64) imm */
 			imm64 = ((u64)(u32) insn[i].imm) |
 				    (((u64)(u32) insn[i+1].imm) << 32);
+			tmp_idx = ctx->idx;
+			PPC_LI64(dst_reg, imm64);
+			/* padding to allow full 5 instructions for later patching */
+			for (j = ctx->idx - tmp_idx; j < 5; j++)
+				EMIT(PPC_RAW_NOP());
 			/* Adjust for two bpf instructions */
 			addrs[++i] = ctx->idx * 4;
-			PPC_LI64(dst_reg, imm64);
 			break;
 
 		/*
-- 
2.34.1

