Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7C41F6CB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 23:19:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLjfj3NS4z3cQM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 07:19:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MLG5vFTq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MLG5vFTq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLjZh6KCkz306R
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 07:15:56 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191KgFqJ007707; 
 Fri, 1 Oct 2021 17:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8J+bcjfwIKr/jlNcTSfXonRF14lyFcdDUEuRi6t2ExQ=;
 b=MLG5vFTqPZ5+KfMwLt7jdLMOzGtJyM3pXLm2UjEDwZ8j7nhJIF/EVdcEsB7OFfVPhELm
 SWVLSq+LXm+aq4FQIWMJVPuvvYZx88Ne3pIG56gC7rJ8KdCVXpXyDt+f3SYUXMBxeVAy
 IRsTOJ2/KIdWcDO5eciq6A10SThM8XVowiuUDrSHREAOJpKV7k5Fpx8owCKK1Ez+/OAa
 Q9Gc0KaGNZc3QRaw/Qdp2NoB3vxuIXzW+V83xNaJ34YPS03d/Mq4/+kyRw8IpZPNhewe
 b04u/Lmi08bz0v+AkDSQ4nZNvkVv6clJVDCBtv+/DXDwIS0Hu5qhQrfAH6UKU84XptAK PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3be9kj0n1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 17:15:38 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 191Kvk0m003190;
 Fri, 1 Oct 2021 17:15:37 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3be9kj0n11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 17:15:37 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 191L6pxO007345;
 Fri, 1 Oct 2021 21:15:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3b9udb1yyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 21:15:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 191LAMbt34603334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Oct 2021 21:10:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C91B4C05A;
 Fri,  1 Oct 2021 21:15:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 622F44C044;
 Fri,  1 Oct 2021 21:15:30 +0000 (GMT)
Received: from naverao1-tp.ibm.com (unknown [9.43.54.98])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 Oct 2021 21:15:30 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>
Subject: [PATCH 4/9] powerpc/bpf: Handle large branch ranges with BPF_EXIT
Date: Sat,  2 Oct 2021 02:44:50 +0530
Message-Id: <ebc0317ce465cb4f8d6fe485ab468ac5bda7c48f.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4rnYCtwD0wr5VLXyeOZE_GhXHEDdA_mk
X-Proofpoint-GUID: 5NEgYGxOTDis30z6b6nVwEWFx0W4-WZo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_05,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110010147
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In some scenarios, it is possible that the program epilogue is outside
the branch range for a BPF_EXIT instruction. Instead of rejecting such
programs, emit an indirect branch. We track the size of the bpf program
emitted after the initial run and do a second pass since BPF_EXIT can
end up emitting different number of instructions depending on the
program size.

Suggested-by: Jordan Niethe <jniethe5@gmail.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  3 +++
 arch/powerpc/net/bpf_jit_comp.c   | 22 +++++++++++++++++++++-
 arch/powerpc/net/bpf_jit_comp32.c |  2 +-
 arch/powerpc/net/bpf_jit_comp64.c |  2 +-
 4 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 89bd744c2bffd4..4023de1698b9f5 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -126,6 +126,7 @@
 
 #define SEEN_FUNC	0x20000000 /* might call external helpers */
 #define SEEN_TAILCALL	0x40000000 /* uses tail calls */
+#define SEEN_BIG_PROG	0x80000000 /* large prog, >32MB */
 
 #define SEEN_VREG_MASK	0x1ff80000 /* Volatile registers r3-r12 */
 #define SEEN_NVREG_MASK	0x0003ffff /* Non volatile registers r14-r31 */
@@ -179,6 +180,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_realloc_regs(struct codegen_context *ctx);
+int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx,
+					int tmp_reg, unsigned long exit_addr);
 
 #endif
 
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index fcbf7a917c566e..3204872fbf2738 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -72,6 +72,21 @@ static int bpf_jit_fixup_subprog_calls(struct bpf_prog *fp, u32 *image,
 	return 0;
 }
 
+int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx,
+					int tmp_reg, unsigned long exit_addr)
+{
+	if (!(ctx->seen & SEEN_BIG_PROG) && is_offset_in_branch_range(exit_addr)) {
+		PPC_JMP(exit_addr);
+	} else {
+		ctx->seen |= SEEN_BIG_PROG;
+		PPC_FUNC_ADDR(tmp_reg, (unsigned long)image + exit_addr);
+		EMIT(PPC_RAW_MTCTR(tmp_reg));
+		EMIT(PPC_RAW_BCTR());
+	}
+
+	return 0;
+}
+
 struct powerpc64_jit_data {
 	struct bpf_binary_header *header;
 	u32 *addrs;
@@ -155,12 +170,17 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		goto out_addrs;
 	}
 
+	if (!is_offset_in_branch_range((long)cgctx.idx * 4))
+		cgctx.seen |= SEEN_BIG_PROG;
+
 	/*
 	 * If we have seen a tail call, we need a second pass.
 	 * This is because bpf_jit_emit_common_epilogue() is called
 	 * from bpf_jit_emit_tail_call() with a not yet stable ctx->seen.
+	 * We also need a second pass if we ended up with too large
+	 * a program so as to fix branches.
 	 */
-	if (cgctx.seen & SEEN_TAILCALL) {
+	if (cgctx.seen & (SEEN_TAILCALL | SEEN_BIG_PROG)) {
 		cgctx.idx = 0;
 		if (bpf_jit_build_body(fp, 0, &cgctx, addrs, false)) {
 			fp = org_fp;
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index a74d52204f8da2..d2a67574a23066 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -852,7 +852,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			 * we'll just fall through to the epilogue.
 			 */
 			if (i != flen - 1)
-				PPC_JMP(exit_addr);
+				bpf_jit_emit_exit_insn(image, ctx, tmp_reg, exit_addr);
 			/* else fall through to the epilogue */
 			break;
 
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index f06c62089b1457..3351a866ef6207 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -761,7 +761,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			 * we'll just fall through to the epilogue.
 			 */
 			if (i != flen - 1)
-				PPC_JMP(exit_addr);
+				bpf_jit_emit_exit_insn(image, ctx, b2p[TMP_REG_1], exit_addr);
 			/* else fall through to the epilogue */
 			break;
 
-- 
2.33.0

