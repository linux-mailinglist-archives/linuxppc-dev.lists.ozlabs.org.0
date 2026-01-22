Return-Path: <linuxppc-dev+bounces-16167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DHlHtyUcmksmQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:21:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD46DAEC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:21:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxvBb314Xz3blr;
	Fri, 23 Jan 2026 08:21:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769116887;
	cv=none; b=MEuJZ6WQtaEF4qHIDwuve76KrKIF5Vcd8PHSHPDNnr+vn2aq7Crc2Dk6+Zay6KlO8teTrCbhsycinqFuOt72BnoazcU3YSTlfbxWWxxR8y8j4vgbJQsadeemsy6nLS6gs9EG+yCN20wn671g/WCBN6/tHJfhsAH0VBSDvsOdmB7nqNOGPKOq/uHKpMzVR3WhgNg5ZM/Hfs2924CPsu5M8SvW0oIUfoDKydh4MPzccCpj1TXujtezYZexwpbG1WpqoNrd858plxmFI+ownhextuCUil5I7vfTWfkAWxJiRu+KVWOpocDzwLeq5cND0VTUdY2b80X6Ml6QzyQfpub32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769116887; c=relaxed/relaxed;
	bh=2aqmAFlIDX6Vm3pGIzlQzZebzSwq7r1k6HwxWg2oJvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T38FZEaQXFb8XH+7yM4CbWmN7mcFxOmj9dpUhRoqtuRGoCaSREcjzxPMkmXWUWOgRZS6gzn9iyPuOaWQgqHes3IEErFU66s58tvQr5Aw2EfZ1le43Jo05T+ockowb2qwSlGV5bv6oWKbJmc0k2XzNlHmH5K1relF2nm6xTbVgF3gEevEKxIqXeAvXMTmw20nQF9SA7r3h9uowHdU9M7GDGRxHcwNL2hmZdCWPKiUqOnxMmgdna76/ba3eRPsZAXm4tKEF2qiabTBScPgKgnYs3Lq5wLT5HQDA5TxsHJ7vBmpyKBnl8VtrHG7HuoJmZBDcRCFy7aDyI5wPdkzcB6/xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=abuErt/Y; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=abuErt/Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxvBZ3rg4z2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 08:21:26 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60MEI3h5007031;
	Thu, 22 Jan 2026 21:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=2aqmAFlIDX6Vm3pGI
	zlQzZebzSwq7r1k6HwxWg2oJvg=; b=abuErt/YqhJbfR6mAO8DyLVUkS+FoE35l
	WZ/7hcd6kU4Atx9QenJZGV2bqlj8aBU/opvxzzQCFjyrQrJ8yEWkbJ8F43GNi89L
	4g+vEY0OYRjeaKGA/DhnNdSPKHJSlXinXZa8lrp7XfptYfTF07tIl1mguQA7nnc+
	52gYFnF4PxYGJcza/Jldgn5aQ5bW9bwM0fWfEqCgvlORvd0G2xpzBsTUsyfRBgSs
	dj5sA2YzA7bCL5RnZJAV5oGiqcku99i1DkVUxEGdCF4/Porg8rcpnBoIS3jZ5ib9
	tUqxk3qtzMtX9dmA4AnyR/qd6xmzSw0Cvuz5NZLO4TmGZK3MZ+ipQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23sc92f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:20:15 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60MLKFRj019799;
	Thu, 22 Jan 2026 21:20:15 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23sc92c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:20:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60ML7XoG027334;
	Thu, 22 Jan 2026 21:20:13 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brnrncy4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:20:13 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60MLK9vv50135372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 21:20:09 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BDAA20043;
	Thu, 22 Jan 2026 21:20:09 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0AAE20040;
	Thu, 22 Jan 2026 21:20:02 +0000 (GMT)
Received: from abhi.. (unknown [9.124.222.159])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Jan 2026 21:20:02 +0000 (GMT)
From: adubey@linux.ibm.com
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
Subject: [PATCH v4 5/6] powerpc64/bpf: Support exceptions
Date: Fri, 23 Jan 2026 02:48:53 +0530
Message-ID: <20260122211854.5508-6-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260122211854.5508-1-adubey@linux.ibm.com>
References: <20260122211854.5508-1-adubey@linux.ibm.com>
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
X-Proofpoint-GUID: fB_JUKWn7jaJvHv9t3cJaviFoNxob3IK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE2MiBTYWx0ZWRfX9TCu8XKoVDhb
 Nou+G9uM6dV7GpLjVsQP0H2x8/NqZRgbn8EP4rS2bzI0aat7ztjg8+c/FoNMYRvBsI6nEl42a4d
 HX/5Kb+aQhJeuuz2qWcKPqH8a9kjPDfFlkwGgXGbOPTfqMNOx4aic2SwHL1rJCKpoBNFQ5niAWn
 JRoSiP2FxN7tRg/ZHIPF5M3MEkzBdbWdP5kJUOkQKh6kP6pqlv3ZrnCYNm897KNuiZXQ3DT2Z+i
 8sWxzR5fizaYEVGeJnNPcEIz8EWg2uNoj1QFWi0CAsLL2Wv8xbbnfPgb37d6I+SP/XttIEdCSpj
 /dsBajzE6jn0TVZT9XTb//pXV8f1O1gljFxPS9ofcX5xK2bLyX/jI+i8J8queHvNvh3N50vzFdq
 u7pdJAbmeImZ9eojdsye9IZXL80ybk8b5ABoK4PfMzUHfM4knT1W5pp6FZuyIxguh+tpMxAPzN3
 p/hdie0anNKYcrGOoUw==
X-Authority-Analysis: v=2.4 cv=J9SnLQnS c=1 sm=1 tr=0 ts=6972948f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=DU0EyFXtAAAA:8 a=VnNF1IyMAAAA:8
 a=xcpHmmOOOUdXZ9sPVCMA:9 a=UCR5be5CC-YrbG9FbbB0:22
X-Proofpoint-ORIG-GUID: t-e6rztzxNzvTrLnK7oFJBPZfU5OD4Lt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_05,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601220162
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16167-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	NEURAL_HAM(-0.00)[-0.325];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 92CD46DAEC
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

The modified prologue/epilogue generation code now
enables exception-callback to use the stack frame of
the program marked as exception boundary, where callee
saved registers are stored.

As per ppc64 ABIv2 documentation[1], r14-r31 are callee
saved registers. BPF programs on ppc64 already saves
r26-r31 registers. Saving the remaining set of callee
saved registers(r14-r25) is handled in the next patch.

[1] https://ftp.rtems.org/pub/rtems/people/sebh/ABI64BitOpenPOWERv1.1_16July2015_pub.pdf

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  2 ++
 arch/powerpc/net/bpf_jit_comp.c   |  7 ++++
 arch/powerpc/net/bpf_jit_comp64.c | 58 +++++++++++++++++++++----------
 3 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 56f56fdd4969..82bbf63f0e57 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -179,6 +179,8 @@ struct codegen_context {
 	u64 arena_vm_start;
 	u64 user_vm_start;
 	bool is_subprog;
+	bool exception_boundary;
+	bool exception_cb;
 };
 
 #define bpf_to_ppc(r)	(ctx->b2p[r])
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 1a305f0fed27..2607ea0bedef 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -207,6 +207,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
 	cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
 	cgctx.is_subprog = bpf_is_subprog(fp);
+	cgctx.exception_boundary = fp->aux->exception_boundary;
+	cgctx.exception_cb = fp->aux->exception_cb;
 
 	/* Scouting faux-generate pass 0 */
 	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
@@ -436,6 +438,11 @@ void bpf_jit_free(struct bpf_prog *fp)
 	bpf_prog_unlock_free(fp);
 }
 
+bool bpf_jit_supports_exceptions(void)
+{
+	return IS_ENABLED(CONFIG_PPC64);
+}
+
 bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return IS_ENABLED(CONFIG_PPC64);
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index c25ba1ad587a..d7cd8ab6559c 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -89,7 +89,9 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
 	 * - the bpf program uses its stack area
 	 * The latter condition is deduced from the usage of BPF_REG_FP
 	 */
-	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP));
+	return ctx->seen & SEEN_FUNC ||
+	       bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)) ||
+	       ctx->exception_cb;
 }
 
 /*
@@ -161,8 +163,13 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG_1), 0));
 		/* this goes in the redzone */
 		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_TAILCALL)));
-	} else {
+	} else if (!ctx->exception_cb) {
 		/*
+		 * Tailcall jitting for non exception_cb progs only.
+		 * exception_cb won't require tail_call_info to be setup.
+		 *
+		 * tail_call_info interpretation logic:
+		 *
 		 * if tail_call_info < MAX_TAIL_CALL_CNT
 		 *      main prog calling first subprog -> copy reference
 		 * else
@@ -177,8 +184,12 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_TAILCALL)));
 	}
 
-	if (bpf_has_stack_frame(ctx)) {
+	if (bpf_has_stack_frame(ctx) && !ctx->exception_cb) {
 		/*
+		 * exception_cb uses boundary frame after stack walk.
+		 * It can simply use redzone, this optimization reduces
+		 * stack walk loop by one level.
+		 *
 		 * We need a stack frame, but we don't necessarily need to
 		 * save/restore LR unless we call other functions
 		 */
@@ -190,23 +201,32 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
 	}
 
-	/*
-	 * Back up non-volatile regs -- BPF registers 6-10
-	 * If we haven't created our own stack frame, we save these
-	 * in the protected zone below the previous stack frame
-	 */
-	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
-			EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
+	if (!ctx->exception_cb) {
+		/*
+		 * Back up non-volatile regs -- BPF registers 6-10
+		 * If we haven't created our own stack frame, we save these
+		 * in the protected zone below the previous stack frame
+		 */
+		for (i = BPF_REG_6; i <= BPF_REG_10; i++)
+			if (ctx->exception_boundary || bpf_is_seen_register(ctx, bpf_to_ppc(i)))
+				EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1,
+					bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
 
-	if (ctx->arena_vm_start)
-		EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
+		if (ctx->exception_boundary || ctx->arena_vm_start)
+			EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
 				 bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
 
-	/* Setup frame pointer to point to the bpf stack area */
-	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
-		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
+		/* Setup frame pointer to point to the bpf stack area */
+		if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
+			EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
 				STACK_FRAME_MIN_SIZE + ctx->stack_size));
+	} else {
+		/*
+		 * Exception callback receives Frame Pointer of main
+		 * program as third arg
+		 */
+		EMIT(PPC_RAW_MR(_R1, _R5));
+	}
 
 	if (ctx->arena_vm_start)
 		PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
@@ -218,17 +238,17 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 
 	/* Restore NVRs */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
+		if (ctx->exception_cb || bpf_is_seen_register(ctx, bpf_to_ppc(i)))
 			EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
 
-	if (ctx->arena_vm_start)
+	if (ctx->exception_cb || ctx->arena_vm_start)
 		EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
 				bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
 
 	/* Tear down our stack frame */
 	if (bpf_has_stack_frame(ctx)) {
 		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
-		if (ctx->seen & SEEN_FUNC) {
+		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
 			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
 			EMIT(PPC_RAW_MTLR(_R0));
 		}
-- 
2.48.1


