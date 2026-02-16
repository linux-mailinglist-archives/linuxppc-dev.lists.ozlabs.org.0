Return-Path: <linuxppc-dev+bounces-16873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCy6AOu/kmmnxAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 07:57:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E27491412A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 07:57:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDtqq1kH2z3brt;
	Mon, 16 Feb 2026 17:57:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771225031;
	cv=none; b=dd8sfBYtt3Lg8cg7MsBMs72EXAyPJmMjswuFo/GFIO4JZW6yKHuaoBGg0v3YkeCTtStbZU5LNbPHCKkojxcGXmCE+liq4GGAKl5MKBhQSSJhi9WE45pLr2weU84XiSp7F3c7TEzsJkZSpL0yNJLlV6pFyULzeUot8Kn1uuIckbLBK2oA4nVFKLYcAm98vN6jIVzCy5sSm+OcEkvwJKfweKfLIHPf169IIidJpRzwWfh7TO8WifqGFIuc/CvtJq5b6eKCOU/2LeeigTC2qa3T0RnbH57TbhtEwDmL2DyMAHcqp3kJoCEV9hiYoYwr4DjFatAG5/gEruTHWfdl/3kC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771225031; c=relaxed/relaxed;
	bh=0ilvdESIvOCG3kvo+4Wme3H9202/aSYzmCUKPYJVAvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNDgo+n+pwqisvCxYLroRkL2QN9zHluDPgi73NHHUjN/cVbq34rFGI4dHv5HdF2fhXWLeNRlz8WjpIVl3EKrBaEzB1PyEvDlDKhb2ai9IeFGtVDhfb7LpTcPqE+IIsvREkEwArpT+2gyALztYPmFfilpdczq5zATstXxp8/stBNtv4gU26o6irtPqRarqvGXNoVfnF3hYWmNAeWrXotSEgUANjJydqqAo0wxwTXIpd3fBYIuh1HadwDTEG32dtjYNXMSeSNPHq9rXGGmvzS43icUVVXJ7XHCPxzPMXDXiy19EJViXzrQYJINhXCjq4ts0zyYIl9PXCu4XkULy9NDDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JfQ26m2D; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JfQ26m2D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDtqp1Szwz3brL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 17:57:10 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FMK7Nb3599349;
	Mon, 16 Feb 2026 06:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=0ilvdESIvOCG3kvo+
	4Wme3H9202/aSYzmCUKPYJVAvA=; b=JfQ26m2Dm6ErXt2ON/2n+u8aLjyKSiXv3
	m9ZURjwUoksC3c7LL+T3UiN8GrWBl7AtBwRyHo6oxP7IlcI+SfEkGWAIMk330BWH
	7vARbBGO6OTyckacXR9eiak8wv/ByWEY8epaN/bSiM3wbbfJP/k/CrFo/eUnU4Yc
	eYOn3wHfpcN7ZGjIlyncRtVYizhNUkXm2CyTpcRGf0yf+7aO+eNQPXCq+yDXF7Uz
	E1pzDAmupz8B6GbXtgChVNvvSNFciUymmTy01s2kmpsQ2lCetoaqazu8cxGR3q2X
	JOgICBL03u0retrLiK2eM5pvQ7qe6eM+T9SaDhGzL7wXg6FGAqJoA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj6uef4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 06:56:56 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61G3X1oA029129;
	Mon, 16 Feb 2026 06:56:55 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cb631437e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 06:56:55 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61G6upHB57606400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Feb 2026 06:56:52 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE4592004B;
	Mon, 16 Feb 2026 06:56:51 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0116520040;
	Mon, 16 Feb 2026 06:56:50 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.78.106.17])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Feb 2026 06:56:49 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>, bot+bpf-ci@kernel.org
Subject: [PATCH 5/5] powerpc64/bpf: fix handling of BPF stack in exception callback
Date: Mon, 16 Feb 2026 12:26:39 +0530
Message-ID: <20260216065639.1750181-6-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216065639.1750181-1-hbathini@linux.ibm.com>
References: <20260216065639.1750181-1-hbathini@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=E+/AZKdl c=1 sm=1 tr=0 ts=6992bfb8 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=zlExV_OUcOsWLKDeu1IA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA1NCBTYWx0ZWRfX91JNXsbccf+Z
 YSZ7p+Lia+ksNxOBYwPvhEo08wGsFy6/jr4eI9zxZ8rddlHr8uQ8MpdRRSnlztdWsnHa1iA29UE
 zk3rophSbsQnSL+GGyzUwBhQBStv5pJUrj9EvPXdJYX98F5tfren9yEgAKy5JZNuiTaQx4jea0Y
 Qyy63nbkNlxmBWwb8kV9424klugpqMG/jSRM7uOCuqjCWb7Yz3YXpkrMvwxTNxlVgK00Hm2QXim
 n+jlPGFhWZGKnPjOJ6weMaPS063uKa85gMd97Chw++rzoDHF4b4Nh6SMoQ+78ckgkB0BjRUpS3f
 rtdIBCh5xFZic5jmqFlAhwufEeBgOaPQwYC7YcrldMuZUwrNoBVuxrgVIxum7HVGnGlQPOwo5Nf
 iFfpiGOEwj3dPOk9hxdF5zl0+kFtC4392zBjs4ksiqJoHnEWAm5l9sOt4igJx3Y7Y7T/Hm81J2a
 QjFt1j8SgTLB+nJX4jQ==
X-Proofpoint-ORIG-GUID: UssT5T0Yis4W3D7Gi2gLozb4bDSLYcZn
X-Proofpoint-GUID: UssT5T0Yis4W3D7Gi2gLozb4bDSLYcZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160054
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16873-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev,bpf-ci];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E27491412A5
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
 arch/powerpc/net/bpf_jit_comp64.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 5d4d2bb23cef..640b84409687 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -32,14 +32,15 @@
  *
  *		[	prev sp		] <-------------
  *		[    tail_call_info	] 8		|
- *		[   nv gpr save area	] 6*8 + (12*8)	|
+ *		[   nv gpr save area	] 6*8		|
+ *		[ addl. nv gpr save area] (12*8)	| <--- exception boundary/callback program
  *		[    local_tmp_var	] 24		|
  * fp (r31) -->	[   ebpf stack space	] upto 512	|
  *		[     frame header	] 32/112	|
  * sp (r1) --->	[    stack pointer	] --------------
  *
  * Additional (12*8) in 'nv gpr save area' only in case of
- * exception boundary.
+ * exception boundary/callback.
  */
 
 /* BPF non-volatile registers save area size */
@@ -128,12 +129,13 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
  *		[	  ...       	] 		|
  * sp (r1) --->	[    stack pointer	] --------------
  *		[    tail_call_info	] 8
- *		[   nv gpr save area	] 6*8 + (12*8)
+ *		[   nv gpr save area	] 6*8
+ *		[ addl. nv gpr save area] (12*8) <--- exception boundary/callback program
  *		[    local_tmp_var	] 24
  *		[   unused red zone	] 224
  *
  * Additional (12*8) in 'nv gpr save area' only in case of
- * exception boundary.
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
+		EMIT(PPC_RAW_SUB(bpf_to_ppc(TMP_REG_2), _R1, bpf_to_ppc(TMP_REG_1)));
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


