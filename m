Return-Path: <linuxppc-dev+bounces-17617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Pg1KVckp2mrewAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 19:11:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B83381F512E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 19:11:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQP4W45x4z3cG3;
	Wed, 04 Mar 2026 05:11:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772561467;
	cv=none; b=VNwIrstyd53/A2++JC9z/GhpmYBuwUNrXraS+xwr2ROoV1GJ18AS/G7nPqVXzb94UbV/TdTNGX0mO8uA1tHceloCweX6yB8NXQFMl6AnUhaRVnF62I4UzvDO5CpS/SKY0Sf21AT4rBNuF0spUi2ZhVvfzMrk83y4F8rxo4zeKqyNwlNseB8xzSfYMb0rEV1h8N142LMZERmgLgQCFmBgx2pY2DgoWirbbyZ2pMsc/IxWtMp0MVb1VMCZYRBeur5XTssUe6pkOzW1MdvJnwHNGy43IZVMxoAUO4Cmd8R0oZPRV897cGGgjCOaqsLuooXS+MMARtjI2wnUvJozQJv5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772561467; c=relaxed/relaxed;
	bh=pMTGScymwo5E4qyRCuDqWQ1RRGHPMygEEiWcwIPFZ/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2OE6iPmDsMv0E3fg5l0QTB5qgrV1o4J0SeJwGSgG7QvYIOxyDdvZintIGqcmMHd9hQQXoRHMOYNxZJ9BgMXoG/P4CjJNNInc22BK4VxXw8IjzApowsAbKdxi7UQwpjmnk/zoKpNCtxNzB/jYku62A8bjQPnxWOurMg/6HFBvAd4eZN8PJobvmlL/M3mCgCCUjbqKyp6dwqkMkHgJ1CNOddWlpdtzH9O7DQfza1xdZaUX8baoD0HBpxFLxvpqj3tx4M5RhBktMD/jeNfHy+ElbYFEjSi6sziQwhOxEFAdl8Bj/GmmjQdTkxgr5kDLsc8qk33MfNUxQSPq0T4R1rG4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tcMd6efb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tcMd6efb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQP4V53ZPz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 05:11:06 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234a7se2072521;
	Tue, 3 Mar 2026 18:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=pMTGScymwo5E4qyRC
	uDqWQ1RRGHPMygEEiWcwIPFZ/s=; b=tcMd6efbcT4Rj5jsaPRKbou1cY+AUQqVR
	enjZyljD9u0yUR54T9L+WBgMN/AnrXF1RsVGDAG5wFbRyN6qJFt3gjnaBU1gOYUn
	g02DsgDmPd9/m/Z4UqgHYL0aR9tUzfRcIHdIvmnBSiqovcbx4DNOCcEKiwNZ6Die
	bRpPVihQY0cVAI0bsUcZ9HLCLVdf6M1HEpa39IEvQuzJUeWc1pYkGsVkTkus8q79
	lIr2Y0uHHEOXqNIqPIp1x+BNMZNtMNaeLmhE90k5X3eBGlxiAmGJdO/+JIPKOqwX
	JEAQCuJ4B67x+IDSo7gxjY7Jhy+x5XQuJovLfE+/ngqmlMXjqD58g==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckskbuy11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 18:10:51 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623I7IJt016408;
	Tue, 3 Mar 2026 18:10:51 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmbpn3fr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 18:10:51 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623IAlkw53019060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 18:10:47 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C2F72004B;
	Tue,  3 Mar 2026 18:10:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBE6F20040;
	Tue,  3 Mar 2026 18:10:44 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.53.81])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 18:10:44 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>, bot+bpf-ci@kernel.org
Subject: [PATCH v4 5/6] powerpc64/bpf: fix handling of BPF stack in exception callback
Date: Tue,  3 Mar 2026 23:40:29 +0530
Message-ID: <20260303181031.390073-6-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303181031.390073-1-hbathini@linux.ibm.com>
References: <20260303181031.390073-1-hbathini@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xFVJ4h6QI8UgS5b6auo135vWjiYBPkT0
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69a7242b cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=m4XNrN4Pf6lr1zoJ5mEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0NiBTYWx0ZWRfXz81N35fQ3OSy
 1UlUKfDFReonztF9Xmwyi+i66qHzIdzUSCS7FtXcCcagcz63EEEKki4s9iJ9UsA7jUVo2Y+1k7Q
 m/AUh4AFQW8txNO/tJFW76HmyjG69i7EmVQ5vyqI00E8jQAdREgDLBVZvauz4ri+rXtOLfEYghP
 Y9EvFf4qdOU5W+sl6fc43QAfqte1/TiI8Z4ojCyY4SdpSA4LPZna+arF+G/tapEaguxs0CAaxes
 DtaC5hPBeCQF+vFk+J62WHFAorJdRU6MP+fX9q0BV0QwFGd/J24+5+oJ/r+TFYRnnsZcM3NkBLl
 xRrJZegHVVuqginktCky158c28taJs4DwxBLHo4PqOSoM/h23eIM20IgW1QLg6S7Udr4r+0uucF
 7X83KRZ66p4WOGANh5OSVd4mEmzVT5AwpVtfYa49mfaS1zUnJ5rxzLMIc0mGM9WjtQ7ZuvaeQVE
 uSUkEp1OiS3ghQMS7SQ==
X-Proofpoint-GUID: xFVJ4h6QI8UgS5b6auo135vWjiYBPkT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030146
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: B83381F512E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17617-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linux.ibm.com:mid];
	TAGGED_RCPT(0.00)[linuxppc-dev,bpf-ci];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Exception callback reuses the stack frame of exception boundary. When
exception boundary and exception callback programs have different BPF
stack depth, the current stack unwind in exception callback will fail.
Adjust the stack frame size of exception callback, in its prologue,
if its BPF stack depth is different from that of exception boundary.

Reported-by: bot+bpf-ci@kernel.org
Closes: https://lore.kernel.org/bpf/2a310e86a59eb4c44c3ac9e5647814469d9c955580c9c0f1b3d9ca4a44717a34@mail.kernel.org/
Fixes: 11d45eee9f42 ("powerpc64/bpf: Additional NVR handling for bpf_throw")
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* No changes in v4.

Changes in v3:
- Fixed a few comments.


 arch/powerpc/net/bpf_jit_comp64.c | 36 +++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 7655be76f537..04e76440d1ad 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -32,14 +32,15 @@
  *
  *		[	prev sp		] <-------------
  *		[    tail_call_info	] 8		|
- *		[   nv gpr save area	] 6*8 + (12*8)	|
+ *		[   nv gpr save area	] (6 * 8)	|
+ *		[ addl. nv gpr save area] (12 * 8)	| <--- exception boundary/callback program
  *		[    local_tmp_var	] 24		|
  * fp (r31) -->	[   ebpf stack space	] upto 512	|
  *		[     frame header	] 32/112	|
  * sp (r1) --->	[    stack pointer	] --------------
  *
- * Additional (12*8) in 'nv gpr save area' only in case of
- * exception boundary.
+ * Additional (12 * 8) in 'nv gpr save area' only in case of
+ * exception boundary/callback.
  */
 
 /* BPF non-volatile registers save area size */
@@ -51,7 +52,7 @@
  * for additional non volatile registers(r14-r25) to be saved
  * at exception boundary
  */
-#define BPF_PPC_EXC_STACK_SAVE (12*8)
+#define BPF_PPC_EXC_STACK_SAVE (12 * 8)
 
 /* stack frame excluding BPF stack, ensure this is quadword aligned */
 #define BPF_PPC_STACKFRAME	(STACK_FRAME_MIN_SIZE + \
@@ -128,12 +129,13 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
  *		[	  ...       	] 		|
  * sp (r1) --->	[    stack pointer	] --------------
  *		[    tail_call_info	] 8
- *		[   nv gpr save area	] 6*8 + (12*8)
+ *		[   nv gpr save area	] (6 * 8)
+ *		[ addl. nv gpr save area] (12 * 8) <--- exception boundary/callback program
  *		[    local_tmp_var	] 24
  *		[   unused red zone	] 224
  *
- * Additional (12*8) in 'nv gpr save area' only in case of
- * exception boundary.
+ * Additional (12 * 8) in 'nv gpr save area' only in case of
+ * exception boundary/callback.
  */
 static int bpf_jit_stack_local(struct codegen_context *ctx)
 {
@@ -240,10 +242,6 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 
 	if (bpf_has_stack_frame(ctx) && !ctx->exception_cb) {
 		/*
-		 * exception_cb uses boundary frame after stack walk.
-		 * It can simply use redzone, this optimization reduces
-		 * stack walk loop by one level.
-		 *
 		 * We need a stack frame, but we don't necessarily need to
 		 * save/restore LR unless we call other functions
 		 */
@@ -287,6 +285,22 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		 * program(main prog) as third arg
 		 */
 		EMIT(PPC_RAW_MR(_R1, _R5));
+		/*
+		 * Exception callback reuses the stack frame of exception boundary.
+		 * But BPF stack depth of exception callback and exception boundary
+		 * don't have to be same. If BPF stack depth is different, adjust the
+		 * stack frame size considering BPF stack depth of exception callback.
+		 * The non-volatile register save area remains unchanged. These non-
+		 * volatile registers are restored in exception callback's epilogue.
+		 */
+		EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R5, 0));
+		EMIT(PPC_RAW_SUB(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_1), _R1));
+		EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_2),
+			-BPF_PPC_EXC_STACKFRAME));
+		EMIT(PPC_RAW_CMPLDI(bpf_to_ppc(TMP_REG_2), ctx->stack_size));
+		PPC_BCC_CONST_SHORT(COND_EQ, 12);
+		EMIT(PPC_RAW_MR(_R1, bpf_to_ppc(TMP_REG_1)));
+		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_EXC_STACKFRAME + ctx->stack_size)));
 	}
 
 	/*
-- 
2.53.0


