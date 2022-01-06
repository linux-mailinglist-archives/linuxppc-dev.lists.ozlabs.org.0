Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37A34863FD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 12:55:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JV4Y53Kw2z3dv6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 22:55:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IefWFtgA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IefWFtgA; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JV4MQ2hDvz30QB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 22:46:58 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206BBgwC018773; 
 Thu, 6 Jan 2022 11:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DbI3/xkXjpbktuCx4yUCfGoplsX8q/nE87lXO0AJCJg=;
 b=IefWFtgA731+wctfVsZ6i/FDcB7N4wdaqphOgwQxcFbvlMOMVaZEeBq+HNgop/u+Gf2W
 mMPnJDwVG3R9NOKUnE/ZfSWBspNGGz3JsJHHfoPHMzlx4orJO7jUvnbA94W0tS1oexv7
 kPtTLjXYWCXv754udbi0H00LcYNTSUAvJCsuUyOanqnz3W7c+gGuiZISGNIr+Aj6rpZo
 iIxtjlkS3GNpcEzKSU4TzkCUeZNqDhq4AO+VXSdZGgEg1Y0LfEbj+Dp5LWaQIgscOZK2
 9ddmZ3dy6FKhv64EM6JNxlMUL0kEGeQq3KRUONYV/uBnFKmy0StOWvpw7+0OQI1iqUOe ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddyb68m8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:40 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 206BK8W2014981;
 Thu, 6 Jan 2022 11:46:39 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddyb68m8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:39 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206BgkGL004652;
 Thu, 6 Jan 2022 11:46:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3ddn4u4fgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206BkYvA42598708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 11:46:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88C42A405C;
 Thu,  6 Jan 2022 11:46:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB1B7A405F;
 Thu,  6 Jan 2022 11:46:31 +0000 (GMT)
Received: from naverao1-tp.ibm.com (unknown [9.43.91.118])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 11:46:31 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: [PATCH 12/13] powerpc64/bpf elfv1: Do not load TOC before calling
 functions
Date: Thu,  6 Jan 2022 17:15:16 +0530
Message-Id: <f8b4c430850c369c85d28d5bb80596521d137740.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 69DTPGCyxeIhu0c-PX8oKpGpDZyJu-OC
X-Proofpoint-GUID: gYfbQoU9ybykxcEFrm_swShAFjTCY9x6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_04,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=776
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
index 8c918db4c2c486..ce753aca5b3321 100644
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
index e05b577d95bf11..5da8e54d4d70b6 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -152,9 +152,13 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
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
@@ -162,25 +166,23 @@ static void bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx,
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
 
@@ -198,19 +200,14 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
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
@@ -896,9 +893,13 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
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
2.34.1

