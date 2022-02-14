Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80FB4B4C96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 11:47:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy1CB1zJNz3dp5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:47:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rzgBy7Vo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rzgBy7Vo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy15S5YPjz3bSs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 21:42:52 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E8kHbD012501; 
 Mon, 14 Feb 2022 10:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=01X0wh4IqhJB9RmsggWnnjv+0T5Ve6071p8cn01Pvu4=;
 b=rzgBy7VozGAzMkj7jNDPI37ODdg3ZwAvaU5NhkQaKSqI5XSvbn07Tw/ccB2yz3vqRjWo
 1XzI6y5wkdpP06nnWvpaqxhRw0Gm22U8duyctArbGQPWUTmQdLn5OwwFEwQthzJ0E9Sf
 5eIhPPc/ZSvnMZnLzad+0h1t5KE/JPNHaDa6evs9Cdb/elsdPb5ulcFl0B1OwaesRD3d
 KdbtHZDGPV0ILn+2FdP6SVrW/BiHKjtUIM21OrRf9xZtZzOH+mJl/S8CAngsgFt9q+14
 HsbMlHsDTOGc02IMymGFAY6VPUFBh5LHD5pccM6qxNFN3B4UZCWZDlgDNDvqgmOT0YqS sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e785sxrej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:35 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EAb4Bf016161;
 Mon, 14 Feb 2022 10:42:34 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e785sxrdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:34 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EAXiRI014776;
 Mon, 14 Feb 2022 10:42:32 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3e645jb9wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:31 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EAgTMv28442882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 10:42:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3A99AE055;
 Mon, 14 Feb 2022 10:42:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71C98AE05D;
 Mon, 14 Feb 2022 10:42:26 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.124.167])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 10:42:25 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH powerpc/next 08/17] powerpc64/bpf elfv1: Do not load TOC
 before calling functions
Date: Mon, 14 Feb 2022 16:11:42 +0530
Message-Id: <a3cd3da4d24d95d845cd10382b1af083600c9074.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5-iMrdFGFSgFVsOdvFCj1WC0CEw6dN4a
X-Proofpoint-ORIG-GUID: qUKRNmnKzHHJpHvW8UIMsKKIsxWBQCti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140062
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BPF helpers always reside in core kernel and all BPF programs use the
kernel TOC. As such, there is no need to load the TOC before calling
helpers or other BPF functions. Drop code to do the same.

Add a check to ensure we don't proceed if this assumption ever changes
in future.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  2 +-
 arch/powerpc/net/bpf_jit_comp.c   |  4 +++-
 arch/powerpc/net/bpf_jit_comp32.c |  8 +++++--
 arch/powerpc/net/bpf_jit_comp64.c | 39 ++++++++++++++++---------------
 4 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 3b5c44c0b6638d..5cb3efd76715a9 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -181,7 +181,7 @@ static inline void bpf_clear_seen_register(struct codegen_context *ctx, int i)
 	ctx->seen &= ~(1 << (31 - i));
 }
 
-void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func);
+int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func);
 int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
 		       u32 *addrs, int pass);
 void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 141e64585b6458..635f7448ff7952 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -59,7 +59,9 @@ static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
 			 */
 			tmp_idx = ctx->idx;
 			ctx->idx = addrs[i] / 4;
-			bpf_jit_emit_func_call_rel(image, ctx, func_addr);
+			ret = bpf_jit_emit_func_call_rel(image, ctx, func_addr);
+			if (ret)
+				return ret;
 
 			/*
 			 * Restore ctx->idx here. This is safe as the length
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index f401bfc5a67684..014cf893ce90d6 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -185,7 +185,7 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	EMIT(PPC_RAW_BLR());
 }
 
-void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func)
+int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func)
 {
 	s32 rel = (s32)func - (s32)(image + ctx->idx);
 
@@ -201,6 +201,8 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
 		EMIT(PPC_RAW_MTCTR(_R0));
 		EMIT(PPC_RAW_BCTRL());
 	}
+
+	return 0;
 }
 
 static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
@@ -953,7 +955,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				EMIT(PPC_RAW_STW(bpf_to_ppc(ctx, BPF_REG_5), _R1, 12));
 			}
 
-			bpf_jit_emit_func_call_rel(image, ctx, func_addr);
+			ret = bpf_jit_emit_func_call_rel(image, ctx, func_addr);
+			if (ret)
+				return ret;
 
 			EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_0) - 1, _R3));
 			EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_0), _R4));
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 44314ee60155e4..e9fd4694226fe0 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -147,9 +147,13 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	EMIT(PPC_RAW_BLR());
 }
 
-static void bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx,
-				       u64 func)
+static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u64 func)
 {
+	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;
+
+	if (WARN_ON_ONCE(!core_kernel_text(func_addr)))
+		return -EINVAL;
+
 #ifdef PPC64_ELF_ABI_v1
 	/* func points to the function descriptor */
 	PPC_LI64(b2p[TMP_REG_2], func);
@@ -157,25 +161,23 @@ static void bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx,
 	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_2], 0);
 	/* ... and move it to CTR */
 	EMIT(PPC_RAW_MTCTR(b2p[TMP_REG_1]));
-	/*
-	 * Load TOC from function descriptor at offset 8.
-	 * We can clobber r2 since we get called through a
-	 * function pointer (so caller will save/restore r2)
-	 * and since we don't use a TOC ourself.
-	 */
-	PPC_BPF_LL(2, b2p[TMP_REG_2], 8);
 #else
 	/* We can clobber r12 */
 	PPC_FUNC_ADDR(12, func);
 	EMIT(PPC_RAW_MTCTR(12));
 #endif
 	EMIT(PPC_RAW_BCTRL());
+
+	return 0;
 }
 
-void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func)
+int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func)
 {
 	unsigned int i, ctx_idx = ctx->idx;
 
+	if (WARN_ON_ONCE(func && is_module_text_address(func)))
+		return -EINVAL;
+
 	/* Load function address into r12 */
 	PPC_LI64(12, func);
 
@@ -193,19 +195,14 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
 		EMIT(PPC_RAW_NOP());
 
 #ifdef PPC64_ELF_ABI_v1
-	/*
-	 * Load TOC from function descriptor at offset 8.
-	 * We can clobber r2 since we get called through a
-	 * function pointer (so caller will save/restore r2)
-	 * and since we don't use a TOC ourself.
-	 */
-	PPC_BPF_LL(2, 12, 8);
 	/* Load actual entry point from function descriptor */
 	PPC_BPF_LL(12, 12, 0);
 #endif
 
 	EMIT(PPC_RAW_MTCTR(12));
 	EMIT(PPC_RAW_BCTRL());
+
+	return 0;
 }
 
 static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
@@ -890,9 +887,13 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				return ret;
 
 			if (func_addr_fixed)
-				bpf_jit_emit_func_call_hlp(image, ctx, func_addr);
+				ret = bpf_jit_emit_func_call_hlp(image, ctx, func_addr);
 			else
-				bpf_jit_emit_func_call_rel(image, ctx, func_addr);
+				ret = bpf_jit_emit_func_call_rel(image, ctx, func_addr);
+
+			if (ret)
+				return ret;
+
 			/* move return value from r3 to BPF_REG_0 */
 			EMIT(PPC_RAW_MR(b2p[BPF_REG_0], 3));
 			break;
-- 
2.35.1

