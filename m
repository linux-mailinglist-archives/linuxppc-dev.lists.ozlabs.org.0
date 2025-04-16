Return-Path: <linuxppc-dev+bounces-7708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42004A90C75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 21:41:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdBGb4lYcz3bxl;
	Thu, 17 Apr 2025 05:41:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744832471;
	cv=none; b=H+3HqeXzqFjl81y4kRneFMfRWl4ZTwGpE7oZKGUUPxCgLYHVzeRZDaAJ6I4QQHVzJ0OOaRrxGft++VUGzRc2Px5ZN9KOttn2JpjG8iBaHC/nKWewz5doKVb3fliTClkkHPLZT+EudskmoI/qUs3KzqtQsFgJRo5ddik7sPijN5vyDwbFM42J+/83g4S6ILAkm4qOlRSw89o9lAe5kXeFOvdAbPX3bpS+alnSBzHsFptt/A7X58Ahu7i/2cgvV0oWA7CutqwiXAViF4ybP2TyBxQzo+3HvMZAQnXl80Qosr8lUHg1zxXdmmtQEVkkBsASMzrw1TmPrHRZ1igQF3t2tA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744832471; c=relaxed/relaxed;
	bh=PYgvIimAY4RQmpa6T8DIstLC6ljNJ0UI3ypmqJEDKg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jugkbFSyhPJl1B8vOuKTVis0WGI5wZBAo4DEmSWABcBva6neBlFxluEQS8+Uu78B3QgZz7LiIl+dgZmXAPMugJ7J4SbokkYc5gk/d4ZGoUzMGrUCCzpmP1B5H+nX1AmIX5WfxWVOR4VYAwhZrYDZ9jdfB0g7fKcC4J1sVR+GqJ/TfddSY1FrSjVq3didRXwkWZ99GrRXU+3Wu7tJ16spFr/DIXzIocGlCR/Bz2yWTr0XgwTDWND2A405uPNhY/Wlw0VpdlxuC4Gsmjj3WGgzv9tkzYP8q2sBkeaanWRQITCkQI/Pz3r889H6Qoj/XFJ97HYh7vlwHlVkqiDHsKJk0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Um/0J/Em; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Um/0J/Em;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdBGZ4s50z3bx5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 05:41:10 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GIYDE8020363;
	Wed, 16 Apr 2025 19:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=PYgvIimAY4RQmpa6T8DIstLC6ljNJ0UI3ypmqJEDK
	g8=; b=Um/0J/EmFc4AyDS2vh2eZ7pQnWbVW3cUsZE3npMlx20dmVpBWThEltVMa
	biVhnGNVJ5j0wGFV26w41YccnfvQ/E0Hgon72iX4e6hMrAoXRWRU38zmX6fcTGmP
	v1IzDKIA4SxSp8Wk4JdIIlT4PEIT2kEa4apv/LxW6/DYAgDUHIM/aX+v6cv3a+VT
	nZM7VhTVioJvfF2n88LExzvWJG8YR/tkfby+lwjbd9ENVA63TfF2yAgpBCcjjN6G
	lD+KJdNt+qtKoo1KGy/0wCVc1xK21bYsYtCHGRmGH/fmvdtCf55QeEXQ3MepJDSx
	1Dbz8nb7aTY0XHuvRDMU/p6VQOxLw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462b0q2s4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:40:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53GJejnL015593;
	Wed, 16 Apr 2025 19:40:45 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462b0q2s48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:40:45 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GGWmQM024880;
	Wed, 16 Apr 2025 19:40:44 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4602gtjbmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:40:44 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GJefDH41943428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 19:40:41 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12C8F20043;
	Wed, 16 Apr 2025 19:40:41 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F69B20040;
	Wed, 16 Apr 2025 19:40:38 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.31.13])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 19:40:38 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2] powerpc64/bpf: fix JIT code size calculation of bpf trampoline
Date: Thu, 17 Apr 2025 01:10:37 +0530
Message-ID: <20250416194037.204424-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
X-Proofpoint-ORIG-GUID: IAeXY20ySMFhHiUxiyd8fkPTVhbuoGpQ
X-Proofpoint-GUID: lp4tVGEzo_PLNOLF70mUGvIZt95OUI2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=680
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504160159
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

arch_bpf_trampoline_size() provides JIT size of the BPF trampoline
before the buffer for JIT'ing it is allocated. The total number of
instructions emitted for BPF trampoline JIT code depends on where
the final image is located. So, the size arrived at with the dummy
pass in arch_bpf_trampoline_size() can vary from the actual size
needed in  arch_prepare_bpf_trampoline().  When the instructions
accounted in  arch_bpf_trampoline_size() is less than the number of
instructions emitted during the actual JIT compile of the trampoline,
the below warning is produced:

  WARNING: CPU: 8 PID: 204190 at arch/powerpc/net/bpf_jit_comp.c:981 __arch_prepare_bpf_trampoline.isra.0+0xd2c/0xdcc

which is:

  /* Make sure the trampoline generation logic doesn't overflow */
  if (image && WARN_ON_ONCE(&image[ctx->idx] >
  			(u32 *)rw_image_end - BPF_INSN_SAFETY)) {

So, during the dummy pass, instead of providing some arbitrary image
location, account for maximum possible instructions if and when there
is a dependency with image location for JIT'ing.

Fixes: d243b62b7bd3 ("powerpc64/bpf: Add support for bpf trampolines")
Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/6168bfc8-659f-4b5a-a6fb-90a916dde3b3@linux.ibm.com/
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes since v1:
- Pass NULL for image during intial pass and account for max. possible
  instruction during this pass as Naveen suggested.


 arch/powerpc/net/bpf_jit.h        | 20 ++++++++++++++++---
 arch/powerpc/net/bpf_jit_comp.c   | 33 ++++++++++---------------------
 arch/powerpc/net/bpf_jit_comp64.c |  9 +++++++++
 3 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 6beacaec63d3..4c26912c2e3c 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -51,8 +51,16 @@
 		EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | (offset & 0xfffc));					\
 	} while (0)
 
-/* Sign-extended 32-bit immediate load */
+/*
+ * Sign-extended 32-bit immediate load
+ *
+ * If this is a dummy pass (!image), account for
+ * maximum possible instructions.
+ */
 #define PPC_LI32(d, i)		do {					      \
+	if (!image)							      \
+		ctx->idx += 2;						      \
+	else {								      \
 		if ((int)(uintptr_t)(i) >= -32768 &&			      \
 				(int)(uintptr_t)(i) < 32768)		      \
 			EMIT(PPC_RAW_LI(d, i));				      \
@@ -60,10 +68,15 @@
 			EMIT(PPC_RAW_LIS(d, IMM_H(i)));			      \
 			if (IMM_L(i))					      \
 				EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));	      \
-		} } while(0)
+		}							      \
+	} } while (0)
 
 #ifdef CONFIG_PPC64
+/* If dummy pass (!image), account for maximum possible instructions */
 #define PPC_LI64(d, i)		do {					      \
+	if (!image)							      \
+		ctx->idx += 5;						      \
+	else {								      \
 		if ((long)(i) >= -2147483648 &&				      \
 				(long)(i) < 2147483648)			      \
 			PPC_LI32(d, i);					      \
@@ -84,7 +97,8 @@
 			if ((uintptr_t)(i) & 0x000000000000ffffULL)	      \
 				EMIT(PPC_RAW_ORI(d, d, (uintptr_t)(i) &       \
 							0xffff));             \
-		} } while (0)
+		}							      \
+	} } while (0)
 #define PPC_LI_ADDR	PPC_LI64
 
 #ifndef CONFIG_PPC_KERNEL_PCREL
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 2991bb171a9b..c0684733e9d6 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -504,10 +504,11 @@ static int invoke_bpf_prog(u32 *image, u32 *ro_image, struct codegen_context *ct
 	EMIT(PPC_RAW_ADDI(_R3, _R1, regs_off));
 	if (!p->jited)
 		PPC_LI_ADDR(_R4, (unsigned long)p->insnsi);
-	if (!create_branch(&branch_insn, (u32 *)&ro_image[ctx->idx], (unsigned long)p->bpf_func,
-			   BRANCH_SET_LINK)) {
-		if (image)
-			image[ctx->idx] = ppc_inst_val(branch_insn);
+	/* Account for max possible instructions during dummy pass for size calculation */
+	if (image && !create_branch(&branch_insn, (u32 *)&ro_image[ctx->idx],
+				    (unsigned long)p->bpf_func,
+				    BRANCH_SET_LINK)) {
+		image[ctx->idx] = ppc_inst_val(branch_insn);
 		ctx->idx++;
 	} else {
 		EMIT(PPC_RAW_LL(_R12, _R25, offsetof(struct bpf_prog, bpf_func)));
@@ -889,7 +890,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 			bpf_trampoline_restore_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
 
 		/* Reserve space to patch branch instruction to skip fexit progs */
-		im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
+		if (ro_image) /* image is NULL for dummy pass */
+			im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
 		EMIT(PPC_RAW_NOP());
 	}
 
@@ -912,7 +914,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		}
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
-		im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
+		if (ro_image) /* image is NULL for dummy pass */
+			im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
 		PPC_LI_ADDR(_R3, im);
 		ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
 						 (unsigned long)__bpf_tramp_exit);
@@ -973,25 +976,9 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
 			     struct bpf_tramp_links *tlinks, void *func_addr)
 {
 	struct bpf_tramp_image im;
-	void *image;
 	int ret;
 
-	/*
-	 * Allocate a temporary buffer for __arch_prepare_bpf_trampoline().
-	 * This will NOT cause fragmentation in direct map, as we do not
-	 * call set_memory_*() on this buffer.
-	 *
-	 * We cannot use kvmalloc here, because we need image to be in
-	 * module memory range.
-	 */
-	image = bpf_jit_alloc_exec(PAGE_SIZE);
-	if (!image)
-		return -ENOMEM;
-
-	ret = __arch_prepare_bpf_trampoline(&im, image, image + PAGE_SIZE, image,
-					    m, flags, tlinks, func_addr);
-	bpf_jit_free_exec(image);
-
+	ret = __arch_prepare_bpf_trampoline(&im, NULL, NULL, NULL, m, flags, tlinks, func_addr);
 	return ret;
 }
 
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 233703b06d7c..91f9efe8b8d7 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -225,6 +225,15 @@ int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *
 	}
 
 #ifdef CONFIG_PPC_KERNEL_PCREL
+	/*
+	 * If fimage is NULL (the initial pass to find image size),
+	 * account for the maximum no. of instructions possible.
+	 */
+	if (!fimage) {
+		ctx->idx += 7;
+		return 0;
+	}
+
 	reladdr = func_addr - local_paca->kernelbase;
 
 	if (reladdr < (long)SZ_8G && reladdr >= -(long)SZ_8G) {
-- 
2.49.0


