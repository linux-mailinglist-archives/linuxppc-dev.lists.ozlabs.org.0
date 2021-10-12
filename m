Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C2F42A48B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 14:34:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTFTc3z5gz3bhm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 23:34:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TdsYUyEc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TdsYUyEc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTFS35lTLz2yWN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 23:32:51 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CAgPAS013150; 
 Tue, 12 Oct 2021 08:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CqFXZneJPht/nn5GQ3+tRXE1/32B4G/e1aRS2zO7rkY=;
 b=TdsYUyEcLWOy5XDuq7OTHSBYSm/lHhtfJ9/NSAZXc12GdVjH4y471kSc99Whk8/WuquW
 SIJrjPd8gJUurgaCJqaJpLMKDAdriisnItCeSX1RT0kZpey9tG3qi3wnrRy+93NoNoTz
 OAswRFosuEE4YUms1T71QCos9N3dky2m5ScyOzp9WtwckbY8jM3HRrHipIhzm1j+FnLE
 IJ39rZ+RmwQyNdvtrlYadq3ya85fmYAAZTrSZ90igSub6a2DGosoXHw+/i5AHglvhgIw
 y3qtoO2JC4QX+2As5U5ijXGPkwqswnhUWA++jVyoB3bUS/Nt7dvv/EtOM6VShiVNV6St jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bn66qnybr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 08:32:30 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19CC9jDf030132;
 Tue, 12 Oct 2021 08:32:30 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bn66qnyb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 08:32:30 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19CCDNWd029519;
 Tue, 12 Oct 2021 12:32:28 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3bk2q9gcfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 12:32:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19CCWGp249938936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 12:32:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B34AA407E;
 Tue, 12 Oct 2021 12:32:16 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B02FA4072;
 Tue, 12 Oct 2021 12:32:00 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.43.27.69])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Oct 2021 12:31:59 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
Subject: [RESEND PATCH v4 3/8] bpf powerpc: refactor JIT compiler code
Date: Tue, 12 Oct 2021 18:00:51 +0530
Message-Id: <20211012123056.485795-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012123056.485795-1-hbathini@linux.ibm.com>
References: <20211012123056.485795-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vSaUOpWQQOFHiBbcdio9f_hHYIKZ8Jcd
X-Proofpoint-GUID: rHPW4ZzJJI2fYJDFUgRGIEfGGCYI0hkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-12_03,2021-10-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120073
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
Cc: songliubraving@fb.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, kpsingh@kernel.org, paulus@samba.org, yhs@fb.com,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kafai@fb.com,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Refactor powerpc LDX JITing code to simplify adding BPF_PROBE_MEM
support.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---

Changes in v4:
* Dropped the default case in the switch statement for bpf size.
* Dropped explicit fallthrough statement for empty switch cases.


 arch/powerpc/net/bpf_jit_comp32.c | 33 ++++++++++++++++++-------------
 arch/powerpc/net/bpf_jit_comp64.c | 31 +++++++++++++++++------------
 2 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 903f945601c0..8b2ac1c27f1f 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -284,6 +284,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u32 src_reg = bpf_to_ppc(ctx, insn[i].src_reg);
 		u32 src_reg_h = src_reg - 1;
 		u32 tmp_reg = bpf_to_ppc(ctx, TMP_REG);
+		u32 size = BPF_SIZE(code);
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -812,23 +813,27 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 * BPF_LDX
 		 */
 		case BPF_LDX | BPF_MEM | BPF_B: /* dst = *(u8 *)(ul) (src + off) */
-			EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
-			if (!fp->aux->verifier_zext)
-				EMIT(PPC_RAW_LI(dst_reg_h, 0));
-			break;
 		case BPF_LDX | BPF_MEM | BPF_H: /* dst = *(u16 *)(ul) (src + off) */
-			EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
-			if (!fp->aux->verifier_zext)
-				EMIT(PPC_RAW_LI(dst_reg_h, 0));
-			break;
 		case BPF_LDX | BPF_MEM | BPF_W: /* dst = *(u32 *)(ul) (src + off) */
-			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
-			if (!fp->aux->verifier_zext)
-				EMIT(PPC_RAW_LI(dst_reg_h, 0));
-			break;
 		case BPF_LDX | BPF_MEM | BPF_DW: /* dst = *(u64 *)(ul) (src + off) */
-			EMIT(PPC_RAW_LWZ(dst_reg_h, src_reg, off));
-			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off + 4));
+			switch (size) {
+			case BPF_B:
+				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
+				break;
+			case BPF_H:
+				EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
+				break;
+			case BPF_W:
+				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
+				break;
+			case BPF_DW:
+				EMIT(PPC_RAW_LWZ(dst_reg_h, src_reg, off));
+				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off + 4));
+				break;
+			}
+
+			if (size != BPF_DW && !fp->aux->verifier_zext)
+				EMIT(PPC_RAW_LI(dst_reg_h, 0));
 			break;
 
 		/*
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index b25bf9b11b9d..ad852f15ca61 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -311,6 +311,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u32 code = insn[i].code;
 		u32 dst_reg = b2p[insn[i].dst_reg];
 		u32 src_reg = b2p[insn[i].src_reg];
+		u32 size = BPF_SIZE(code);
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -778,25 +779,29 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 */
 		/* dst = *(u8 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_B:
-			EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
-			if (insn_is_zext(&insn[i + 1]))
-				addrs[++i] = ctx->idx * 4;
-			break;
 		/* dst = *(u16 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_H:
-			EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
-			if (insn_is_zext(&insn[i + 1]))
-				addrs[++i] = ctx->idx * 4;
-			break;
 		/* dst = *(u32 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_W:
-			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
-			if (insn_is_zext(&insn[i + 1]))
-				addrs[++i] = ctx->idx * 4;
-			break;
 		/* dst = *(u64 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_DW:
-			PPC_BPF_LL(dst_reg, src_reg, off);
+			switch (size) {
+			case BPF_B:
+				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
+				break;
+			case BPF_H:
+				EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
+				break;
+			case BPF_W:
+				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
+				break;
+			case BPF_DW:
+				PPC_BPF_LL(dst_reg, src_reg, off);
+				break;
+			}
+
+			if (size != BPF_DW && insn_is_zext(&insn[i + 1]))
+				addrs[++i] = ctx->idx * 4;
 			break;
 
 		/*
-- 
2.31.1

