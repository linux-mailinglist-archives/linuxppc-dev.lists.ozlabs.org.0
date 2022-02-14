Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE744B4CA0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 11:50:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy1GL6H0Nz3f0y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:50:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LDMLj5VS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LDMLj5VS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy15c0Clxz3cRP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 21:42:59 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E9LCft003556; 
 Mon, 14 Feb 2022 10:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0YUswnmmsPdrnIUuNRNtpZu2+MBxfUX1qSGmicM6LvE=;
 b=LDMLj5VSyevVlnO6ul3GLvzHE96mYQegN0OK4Hfm4+x7tZdANDo9snewvAsakzPHPb6P
 PjB5bXac4q3/2KDWATFZbkR0cUOiMNMq159ARQCGLS/rcgaaq2kbL4aOeIFo7jYNB48A
 kfHCiyo+UMDiv/4w3z45fuMYk25DH4cKCp4zHODt6IQQZ60o9mWz9shQAuip++JU4rad
 8rvxauAlmh/2wWgMUhdh69pLGcU35LyGv1bo9AmFMfeenOxk9ZPMT5bBk3jRLy/+sdkM
 5fiq7wuVtpBQLXxu65+ws2ocLXlqQOuZF5aoR3/h5F67ZOaGPFZVp5jnC+ySO+k9iQIj eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7ath407n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:20 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EA0iTV012824;
 Mon, 14 Feb 2022 10:42:20 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7ath406w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:20 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EAXt0h005444;
 Mon, 14 Feb 2022 10:42:17 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3e64h937ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EAgEoc44368164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 10:42:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13E36AE061;
 Mon, 14 Feb 2022 10:42:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C419EAE045;
 Mon, 14 Feb 2022 10:42:11 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.124.167])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 10:42:11 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH powerpc/next 03/17] powerpc/bpf: Handle large branch ranges
 with BPF_EXIT
Date: Mon, 14 Feb 2022 16:11:37 +0530
Message-Id: <33aa2e92645a92712be23b18035a2c6dcb92ff8d.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DktMQKaM_gIxIasgzYa-ByYSL8ffYfHr
X-Proofpoint-GUID: WLY8b783cQYNBouAcTswsVr-pjtwC3hA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=813
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202140064
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

In some scenarios, it is possible that the program epilogue is outside
the branch range for a BPF_EXIT instruction. Instead of rejecting such
programs, emit epilogue as an alternate exit point from the program.
Track the location of the same so that subsequent exits can take either
of the two paths.

Reported-by: Jordan Niethe <jniethe5@gmail.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  2 ++
 arch/powerpc/net/bpf_jit_comp.c   | 22 +++++++++++++++++++++-
 arch/powerpc/net/bpf_jit_comp32.c |  7 +++++--
 arch/powerpc/net/bpf_jit_comp64.c |  7 +++++--
 4 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 9cdd33d6be4cc0..3b5c44c0b6638d 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -151,6 +151,7 @@ struct codegen_context {
 	unsigned int stack_size;
 	int b2p[ARRAY_SIZE(b2p)];
 	unsigned int exentry_idx;
+	unsigned int alt_exit_addr;
 };
 
 #ifdef CONFIG_PPC32
@@ -186,6 +187,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_realloc_regs(struct codegen_context *ctx);
+int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr);
 
 int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct codegen_context *ctx,
 			  int insn_idx, int jmp_off, int dst_reg);
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 56dd1f4e3e4447..141e64585b6458 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -89,6 +89,22 @@ static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
 	return 0;
 }
 
+int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr)
+{
+	if (!exit_addr || is_offset_in_branch_range(exit_addr - (ctx->idx * 4))) {
+		PPC_JMP(exit_addr);
+	} else if (ctx->alt_exit_addr) {
+		if (WARN_ON(!is_offset_in_branch_range((long)ctx->alt_exit_addr - (ctx->idx * 4))))
+			return -1;
+		PPC_JMP(ctx->alt_exit_addr);
+	} else {
+		ctx->alt_exit_addr = ctx->idx * 4;
+		bpf_jit_build_epilogue(image, ctx);
+	}
+
+	return 0;
+}
+
 struct powerpc64_jit_data {
 	struct bpf_binary_header *header;
 	u32 *addrs;
@@ -177,8 +193,10 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	 * If we have seen a tail call, we need a second pass.
 	 * This is because bpf_jit_emit_common_epilogue() is called
 	 * from bpf_jit_emit_tail_call() with a not yet stable ctx->seen.
+	 * We also need a second pass if we ended up with too large
+	 * a program so as to ensure BPF_EXIT branches are in range.
 	 */
-	if (cgctx.seen & SEEN_TAILCALL) {
+	if (cgctx.seen & SEEN_TAILCALL || !is_offset_in_branch_range((long)cgctx.idx * 4)) {
 		cgctx.idx = 0;
 		if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0)) {
 			fp = org_fp;
@@ -193,6 +211,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	 * calculate total size from idx.
 	 */
 	bpf_jit_build_prologue(0, &cgctx);
+	addrs[fp->len] = cgctx.idx * 4;
 	bpf_jit_build_epilogue(0, &cgctx);
 
 	fixup_len = fp->aux->num_exentries * BPF_FIXUP_LEN * 4;
@@ -233,6 +252,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	for (pass = 1; pass < 3; pass++) {
 		/* Now build the prologue, body code & epilogue for real. */
 		cgctx.idx = 0;
+		cgctx.alt_exit_addr = 0;
 		bpf_jit_build_prologue(code_base, &cgctx);
 		if (bpf_jit_build_body(fp, code_base, &cgctx, addrs, pass)) {
 			bpf_jit_binary_free(bpf_hdr);
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 81e0c56661ddf2..f401bfc5a67684 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -929,8 +929,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			 * the epilogue. If we _are_ the last instruction,
 			 * we'll just fall through to the epilogue.
 			 */
-			if (i != flen - 1)
-				PPC_JMP(exit_addr);
+			if (i != flen - 1) {
+				ret = bpf_jit_emit_exit_insn(image, ctx, _R0, exit_addr);
+				if (ret)
+					return ret;
+			}
 			/* else fall through to the epilogue */
 			break;
 
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index b1ed8611091d2b..371bd5a16859c7 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -871,8 +871,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			 * the epilogue. If we _are_ the last instruction,
 			 * we'll just fall through to the epilogue.
 			 */
-			if (i != flen - 1)
-				PPC_JMP(exit_addr);
+			if (i != flen - 1) {
+				ret = bpf_jit_emit_exit_insn(image, ctx, b2p[TMP_REG_1], exit_addr);
+				if (ret)
+					return ret;
+			}
 			/* else fall through to the epilogue */
 			break;
 
-- 
2.35.1

