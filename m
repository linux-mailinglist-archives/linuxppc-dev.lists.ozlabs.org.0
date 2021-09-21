Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AC441343D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 15:33:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDMnM58jyz3cFZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:33:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WR7hNpBq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WR7hNpBq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDMkR0jCbz2yKV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 23:30:38 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18LChtZL021123; 
 Tue, 21 Sep 2021 09:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZVKPyZvzZGOVOmiE5FNQEBThnRyOR46N0N11qlidh40=;
 b=WR7hNpBq1MXo3Qko1J9PasbIBZhhB0Dps07vmWaMCok/6J3rNNrs434sBFX7ByEfDGZ6
 MkPMLuAw+P2M+P+w6mdqGLnnxZP0LSGgK0VR0kUY+bO/L6HcpllbyY+yznyO1K3OeNci
 /y/SGEzUsmYo7kO51pTqIVvW9kHvlCZSGAciZspflRmYBLz4oUA+rUQ8cRydohw6ww5W
 8rcyrTcjQV0u/dzYEeDRlby29JA3ba1Umprkc64Jibk2uwsKzSk1YAdIqsWKlEfUCb4H
 njdh3r1cc4gLNTpCrsowllxEOqcmns/gnzAhzzQkUKhwkI13MPzUKx6GtUGaBXiUpImA Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b7fnb9bnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 09:30:18 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18LDHE7N027089;
 Tue, 21 Sep 2021 09:30:17 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b7fnb9bky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 09:30:17 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18LDNFuu008092;
 Tue, 21 Sep 2021 13:30:13 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3b57r9njgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 13:30:13 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18LDU8pW57082360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Sep 2021 13:30:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E8C34C063;
 Tue, 21 Sep 2021 13:30:08 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75AC84C05E;
 Tue, 21 Sep 2021 13:30:03 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.43.117.91])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Sep 2021 13:30:03 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
Subject: [PATCH v3 3/8] bpf powerpc: refactor JIT compiler code
Date: Tue, 21 Sep 2021 18:59:38 +0530
Message-Id: <20210921132943.489732-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921132943.489732-1-hbathini@linux.ibm.com>
References: <20210921132943.489732-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uKo5Tp6-lIBNIKXMOKp65y3jiLqjEltS
X-Proofpoint-ORIG-GUID: zcwz9UE7KWNSBADS1wPFOwuRIS2keFYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210082
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
---

Changes in v3:
* Dropped ST(X) JITing coderefactoring and ensured the changes are
  minimal and relevant to BPF_PROBE_MEM support.
* Added a default for size switch case to ensure compiler would
  not complain.


 arch/powerpc/net/bpf_jit_comp32.c | 42 ++++++++++++++++++++-----------
 arch/powerpc/net/bpf_jit_comp64.c | 40 +++++++++++++++++++----------
 2 files changed, 55 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index b60b59426a24..6e4956cd52e7 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -282,6 +282,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u32 src_reg = bpf_to_ppc(ctx, insn[i].src_reg);
 		u32 src_reg_h = src_reg - 1;
 		u32 tmp_reg = bpf_to_ppc(ctx, TMP_REG);
+		u32 size = BPF_SIZE(code);
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -810,23 +811,36 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 * BPF_LDX
 		 */
 		case BPF_LDX | BPF_MEM | BPF_B: /* dst = *(u8 *)(ul) (src + off) */
-			EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
-			if (!fp->aux->verifier_zext)
-				EMIT(PPC_RAW_LI(dst_reg_h, 0));
-			break;
+			fallthrough;
 		case BPF_LDX | BPF_MEM | BPF_H: /* dst = *(u16 *)(ul) (src + off) */
-			EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
-			if (!fp->aux->verifier_zext)
-				EMIT(PPC_RAW_LI(dst_reg_h, 0));
-			break;
+			fallthrough;
 		case BPF_LDX | BPF_MEM | BPF_W: /* dst = *(u32 *)(ul) (src + off) */
-			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
-			if (!fp->aux->verifier_zext)
-				EMIT(PPC_RAW_LI(dst_reg_h, 0));
-			break;
+			fallthrough;
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
+			/*
+			 * With size not being an enum and BPF_B/H/W/DW being macros, ensure no
+			 * compiler warning/error by adding a default case that never reaches.
+			 */
+			default:
+				break;
+			}
+
+			if (size != BPF_DW && !fp->aux->verifier_zext)
+				EMIT(PPC_RAW_LI(dst_reg_h, 0));
 			break;
 
 		/*
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 2a87da50d9a4..991eb43d4cd2 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -285,6 +285,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u32 code = insn[i].code;
 		u32 dst_reg = b2p[insn[i].dst_reg];
 		u32 src_reg = b2p[insn[i].src_reg];
+		u32 size = BPF_SIZE(code);
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -716,25 +717,38 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 */
 		/* dst = *(u8 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_B:
-			EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
-			if (insn_is_zext(&insn[i + 1]))
-				addrs[++i] = ctx->idx * 4;
-			break;
+			fallthrough;
 		/* dst = *(u16 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_H:
-			EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
-			if (insn_is_zext(&insn[i + 1]))
-				addrs[++i] = ctx->idx * 4;
-			break;
+			fallthrough;
 		/* dst = *(u32 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_W:
-			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
-			if (insn_is_zext(&insn[i + 1]))
-				addrs[++i] = ctx->idx * 4;
-			break;
+			fallthrough;
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
+			/*
+			 * With size not being an enum and BPF_B/H/W/DW being macros, ensure no
+			 * compiler warning/error by adding a default case that never reaches.
+			 */
+			default:
+				break;
+			}
+
+			if (size != BPF_DW && insn_is_zext(&insn[i + 1]))
+				addrs[++i] = ctx->idx * 4;
 			break;
 
 		/*
-- 
2.31.1

