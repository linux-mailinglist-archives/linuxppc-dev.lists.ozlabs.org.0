Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0F4B4CA5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 11:51:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy1H6469Qz3dll
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:51:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qshKKDKs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qshKKDKs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy15f6CGXz3cTD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 21:43:02 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E91fwq003287; 
 Mon, 14 Feb 2022 10:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HiKsGPcz0CNIMy0amaxaBRi2aeH099rWT2ASLHqkkiM=;
 b=qshKKDKsUAKdD+yfddoaIpALDqepNCdm3fZIc0fzvNlntPdYDKGfBfAyXdBc04ZDCcy1
 aQ0HwLv1wZ59HMxCHOkRh81/S3Ztk5ss8+rY1m6ZBJunHimG3FEZYs0kQ+n9WJAnTzSD
 rJ9EhqSiJxLQ03ajBZ39saDkb8PmrRH8kaopm582zBRnbcM1TRuW/SSoLETpSqG8mUP4
 6eWDPAtbz3QTa946uGc0zzYpDVjeL+UzHz25vWQhOtzhQ4DJ47KC+L/5NbfYFizyt9Fp
 9lKCvkTfoXqmtb1L9OwX25rfy+X5C0Fuz8iQMg+9W3+BorXnBkwZWtf10IMr+NrunKbG ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e71jvm9v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:45 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EAeCMt014766;
 Mon, 14 Feb 2022 10:42:45 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e71jvm9ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:44 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EAXmjC028311;
 Mon, 14 Feb 2022 10:42:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3e64h9m0st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EAgd6a46268726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 10:42:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 913CEAE051;
 Mon, 14 Feb 2022 10:42:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5078BAE056;
 Mon, 14 Feb 2022 10:42:37 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.124.167])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 10:42:37 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH powerpc/next 12/17] powerpc64/bpf: Get rid of
 PPC_BPF_[LL|STL|STLU] macros
Date: Mon, 14 Feb 2022 16:11:46 +0530
Message-Id: <e0526fc7633a34f983a7a330712b55bdfaf20482.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NfKREzvWRmvDk5kU6rGGWl377i5FJ-k4
X-Proofpoint-GUID: sbbbs-3QEHmRTDh0yAg_e9v7X6QtENW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
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

All these macros now have a single user. Expand their usage in place.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit64.h      | 22 ----------------------
 arch/powerpc/net/bpf_jit_comp64.c | 21 +++++++++++++++------
 2 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit64.h b/arch/powerpc/net/bpf_jit64.h
index 82cdfee412784a..199348b7296653 100644
--- a/arch/powerpc/net/bpf_jit64.h
+++ b/arch/powerpc/net/bpf_jit64.h
@@ -64,28 +64,6 @@ const int b2p[MAX_BPF_JIT_REG + 2] = {
 /* PPC NVR range -- update this if we ever use NVRs below r27 */
 #define BPF_PPC_NVR_MIN		27
 
-/*
- * WARNING: These can use TMP_REG_2 if the offset is not at word boundary,
- * so ensure that it isn't in use already.
- */
-#define PPC_BPF_LL(r, base, i) do {					      \
-				if ((i) % 4) {				      \
-					EMIT(PPC_RAW_LI(b2p[TMP_REG_2], (i)));\
-					EMIT(PPC_RAW_LDX(r, base,	      \
-							b2p[TMP_REG_2]));     \
-				} else					      \
-					EMIT(PPC_RAW_LD(r, base, i));	      \
-				} while(0)
-#define PPC_BPF_STL(r, base, i) do {					      \
-				if ((i) % 4) {				      \
-					EMIT(PPC_RAW_LI(b2p[TMP_REG_2], (i)));\
-					EMIT(PPC_RAW_STDX(r, base,	      \
-							b2p[TMP_REG_2]));     \
-				} else					      \
-					EMIT(PPC_RAW_STD(r, base, i));	      \
-				} while(0)
-#define PPC_BPF_STLU(r, base, i) do { EMIT(PPC_RAW_STDU(r, base, i)); } while(0)
-
 #endif /* !__ASSEMBLY__ */
 
 #endif
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 411ac41dba4293..eeda636cd7be64 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -100,7 +100,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 			EMIT(PPC_RAW_STD(0, 1, PPC_LR_STKOFF));
 		}
 
-		PPC_BPF_STLU(1, 1, -(BPF_PPC_STACKFRAME + ctx->stack_size));
+		EMIT(PPC_RAW_STDU(1, 1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
 	}
 
 	/*
@@ -726,7 +726,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				PPC_LI32(b2p[TMP_REG_1], imm);
 				src_reg = b2p[TMP_REG_1];
 			}
-			PPC_BPF_STL(src_reg, dst_reg, off);
+			if (off % 4) {
+				EMIT(PPC_RAW_LI(b2p[TMP_REG_2], off));
+				EMIT(PPC_RAW_STDX(src_reg, dst_reg, b2p[TMP_REG_2]));
+			} else {
+				EMIT(PPC_RAW_STD(src_reg, dst_reg, off));
+			}
 			break;
 
 		/*
@@ -802,9 +807,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				PPC_BCC_SHORT(COND_GT, (ctx->idx + 3) * 4);
 				EMIT(PPC_RAW_LI(dst_reg, 0));
 				/*
-				 * Check if 'off' is word aligned because PPC_BPF_LL()
-				 * (BPF_DW case) generates two instructions if 'off' is not
-				 * word-aligned and one instruction otherwise.
+				 * Check if 'off' is word aligned for BPF_DW, because
+				 * we might generate two instructions.
 				 */
 				if (BPF_SIZE(code) == BPF_DW && (off & 3))
 					PPC_JMP((ctx->idx + 3) * 4);
@@ -823,7 +827,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
 				break;
 			case BPF_DW:
-				PPC_BPF_LL(dst_reg, src_reg, off);
+				if (off % 4) {
+					EMIT(PPC_RAW_LI(b2p[TMP_REG_1], off));
+					EMIT(PPC_RAW_LDX(dst_reg, src_reg, b2p[TMP_REG_1]));
+				} else {
+					EMIT(PPC_RAW_LD(dst_reg, src_reg, off));
+				}
 				break;
 			}
 
-- 
2.35.1

