Return-Path: <linuxppc-dev+bounces-7885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E37A9615F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 10:26:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhb1d0h2Dz3bcP;
	Tue, 22 Apr 2025 18:26:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745310405;
	cv=none; b=NoUqj7N41K3B6R8N5Q7/TqV37rE0InhHLyb3IKm/8UAvjAES5As5lnWt8eLKT78hU/eANRKYuJHcxi3+pOgowNklasPAAfhzvgvaIR363tWk189Yyaz9wYYCsxHYQpoUhzjWAIVHYFOO3SKqTTxqZ3YquLKZcrFJlUjxqW5iK0EbDpiDFSs2Nx30V7IWtuNxD/iEm63SEICQ+ZDF6L+Nl6m5S/8wa4fBz0HwJ0YoPs+utXbTpPA+1ipgZ0ZH2YUoUUeTi3IR4nygiraPYLHXO6S4SKgB8djBp4p3AVZ+s/D5sM+PUsADnTx5Pyvli/wdkbI9AxcrFqc0C9j6K35CDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745310405; c=relaxed/relaxed;
	bh=SQrqqKR7VA/qlP9yuXRKMxrzXQrlCZ/mnMefgR933BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fXdkR9i3ajAlROelHUjqHTulrNFZXhXxoKGfcX5MiEJxQdi1K5BfhONw+ZOFeW0AVMAG8aautJXyghlogk/TJfRHfAyIeh1i3aTwr14urdheY9r84HRmv0ngXaqvsMXcjsWW0bmYY0D+6lkgQMc4/GTcp92zxt/7Vtc1PJmXitCCPTV2fcqVE0YoZ91rtzM7TZNoQeI6McP+jxtHlzbwwGsMORrcqenR1XhWYdUeDEW19waBrpUkwCRpBGJ6vE8F7AQmY+c4s12XiXaDDuFVNtWcvo8WA2r8OAHEnBpDi6pijnh6PlokBRvZ8lFHP2Q0bVGoYmeKH3RCIgZYYCsSZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XNSNdpCm; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XNSNdpCm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhb1b67yqz2yqR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 18:26:43 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6bPuc012277;
	Tue, 22 Apr 2025 08:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=SQrqqKR7VA/qlP9yuXRKMxrzXQrlCZ/mnMefgR933
	BQ=; b=XNSNdpCm1ikfkBPtW5XwFgw7sMEjXHtzcUo2o+zs4zIRIhvC1+YxOTjSQ
	L3KapxnFi/b2MyLCcT8efVJOLsSV8dOgcswVwQWkKXfudZNUaCw0lBJpC8RJdn9l
	wBBu4DpwYy9XXe+wLs+eaJbzi1Tjw95p1XaSCG/hJU/qw4q2eeCIjbX/LhlYiFIA
	dwbs7OewILq8Fk6mo4hux1ci6im8+bwbbGugTJ55H34pF46ZJWPuIa3rWMuA/k0h
	6vrRzr3L797wgn+qUMpdne+0rVn0gJj+j4BYW0oWiEIuVl6qWVhjRhPxKocrflM9
	2kXCAQPkZecSt8GF6DfYS1rWIWQlQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46660fgex8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 08:26:17 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53M8LAum010061;
	Tue, 22 Apr 2025 08:26:17 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46660fgex5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 08:26:17 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53M8C1MT001858;
	Tue, 22 Apr 2025 08:26:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rck1rjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 08:26:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53M8QCPd34865912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:26:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C02F320043;
	Tue, 22 Apr 2025 08:26:12 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 472242004B;
	Tue, 22 Apr 2025 08:26:10 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.109.222.82])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 08:26:10 +0000 (GMT)
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
Subject: [PATCH v3] powerpc/bpf: fix JIT code size calculation of bpf trampoline
Date: Tue, 22 Apr 2025 13:56:09 +0530
Message-ID: <20250422082609.949301-1-hbathini@linux.ibm.com>
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
X-Proofpoint-GUID: NdZsWW6kC9lkoS6BCIFTHPEgBZaNs9IR
X-Authority-Analysis: v=2.4 cv=YdC95xRf c=1 sm=1 tr=0 ts=680752a9 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=2fGx8izRS4zgbLbr9iIA:9
X-Proofpoint-ORIG-GUID: J92uvSD2EgmyFHg2R5jQwwTzFFcgx9LC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=820 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220060
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
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
Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes since v2:
- Address review comments from Naveen:
  - Remove additional padding for 'case BPF_LD | BPF_IMM | BPF_DW:'
    in arch/powerpc/net/bpf_jit_comp*.c
  - Merge the if sequence in bpf_jit_emit_func_call_rel() with the
    other conditionals
  - Naveen, carried your Acked-by tag as the additional changes are
    minimal and in line with your suggestion. Feel free to update
    if you look at it differently.
  - Venkat, carried your Tested-by tag from v2 as the changes in
    v3 should not alter the test result. Feel free to update if
    you look at it differently.

Changes since v1:
- Pass NULL for image during intial pass and account for max. possible
  instruction during this pass as Naveen suggested.


 arch/powerpc/net/bpf_jit.h        | 20 ++++++++++++++++---
 arch/powerpc/net/bpf_jit_comp.c   | 33 ++++++++++---------------------
 arch/powerpc/net/bpf_jit_comp32.c |  6 ------
 arch/powerpc/net/bpf_jit_comp64.c | 15 +++++++-------
 4 files changed, 35 insertions(+), 39 deletions(-)

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
 
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index c4db278dae36..0aace304dfe1 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -313,7 +313,6 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		u64 func_addr;
 		u32 true_cond;
 		u32 tmp_idx;
-		int j;
 
 		if (i && (BPF_CLASS(code) == BPF_ALU64 || BPF_CLASS(code) == BPF_ALU) &&
 		    (BPF_CLASS(prevcode) == BPF_ALU64 || BPF_CLASS(prevcode) == BPF_ALU) &&
@@ -1099,13 +1098,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		 * 16 byte instruction that uses two 'struct bpf_insn'
 		 */
 		case BPF_LD | BPF_IMM | BPF_DW: /* dst = (u64) imm */
-			tmp_idx = ctx->idx;
 			PPC_LI32(dst_reg_h, (u32)insn[i + 1].imm);
 			PPC_LI32(dst_reg, (u32)insn[i].imm);
-			/* padding to allow full 4 instructions for later patching */
-			if (!image)
-				for (j = ctx->idx - tmp_idx; j < 4; j++)
-					EMIT(PPC_RAW_NOP());
 			/* Adjust for two bpf instructions */
 			addrs[++i] = ctx->idx * 4;
 			break;
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 233703b06d7c..5daa77aee7f7 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -227,7 +227,14 @@ int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *
 #ifdef CONFIG_PPC_KERNEL_PCREL
 	reladdr = func_addr - local_paca->kernelbase;
 
-	if (reladdr < (long)SZ_8G && reladdr >= -(long)SZ_8G) {
+	/*
+	 * If fimage is NULL (the initial pass to find image size),
+	 * account for the maximum no. of instructions possible.
+	 */
+	if (!fimage) {
+		ctx->idx += 7;
+		return 0;
+	} else if (reladdr < (long)SZ_8G && reladdr >= -(long)SZ_8G) {
 		EMIT(PPC_RAW_LD(_R12, _R13, offsetof(struct paca_struct, kernelbase)));
 		/* Align for subsequent prefix instruction */
 		if (!IS_ALIGNED((unsigned long)fimage + CTX_NIA(ctx), 8))
@@ -412,7 +419,6 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		u64 imm64;
 		u32 true_cond;
 		u32 tmp_idx;
-		int j;
 
 		/*
 		 * addrs[] maps a BPF bytecode address into a real offset from
@@ -1046,12 +1052,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		case BPF_LD | BPF_IMM | BPF_DW: /* dst = (u64) imm */
 			imm64 = ((u64)(u32) insn[i].imm) |
 				    (((u64)(u32) insn[i+1].imm) << 32);
-			tmp_idx = ctx->idx;
 			PPC_LI64(dst_reg, imm64);
-			/* padding to allow full 5 instructions for later patching */
-			if (!image)
-				for (j = ctx->idx - tmp_idx; j < 5; j++)
-					EMIT(PPC_RAW_NOP());
 			/* Adjust for two bpf instructions */
 			addrs[++i] = ctx->idx * 4;
 			break;
-- 
2.49.0


