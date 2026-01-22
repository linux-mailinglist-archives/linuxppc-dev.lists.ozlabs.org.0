Return-Path: <linuxppc-dev+bounces-16157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBt7BW9XcmkpiwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 17:59:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B03F6A8ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 17:59:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxnNC6fK2z30hP;
	Fri, 23 Jan 2026 03:59:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769101163;
	cv=none; b=YpkJNQguERNMaRw/1QiOYxMrY4+EY92euBnp/w1rHOLWXm/n67SnVT+drQwPfxSEtFMEk5fwZBqcvCSk42jyTdr3Z5jsKoQA/xfbjJ28zqRRekhQ24da0nOHeFUbbO3hjO0bQfcfrhRNe2LuT5P5FV/LTPPlD+wawL6SGfNHbyQEaXjX3exobxhEgL5mbkrfDS137rAEI6OdbMakK9cZ2EGKnwdsiTr4jzr6Bj9QV2xezb9yCa0miyMMhejqxVR8ROU5BALqN8riIix9LllDXe8WbtEj+D4dMzUOC8TjoiS1WPwTb1pB6sFjv8FDzqJUcWeL1h3IOV9ymUz/H62dTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769101163; c=relaxed/relaxed;
	bh=/eHX9B+rQjztqsfK1dbsZkcMj6llvfxq0MlC2mC0A2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imr28jri2xQEMBWldWpLLiKdjUXdr67NBt0yKenXerFxed+vqjWn9jd1FHVZFowNShaT/eBiyTRMUNeSyxK6UIQ+gjVwnpJQtY4BOPWX8luLllckn2+9aKwHjcUUwUW5bGeao3JXYvCP2Uac8yYetpb4OC+CTT2rmHZjGINJh/kQdwUn42ceQCLIZSo90zkUWLUMS8EwYpGkQojfSqIMfmisfMZq4Hggx0EyyaHuLbsMrlXyWNmJXvOXw+gWkUCegNatf/XyIY3Cpdbz1QGNGKfcAs07WM3pSVRsU1qHSfRZNonWRAsVudEI4WJZoV5wQ0t1tcs3EY0uNTX8pB/nJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sOLWr/V/; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sOLWr/V/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxnNB3Jrjz2yql
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 03:59:22 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60MDZPXA020990;
	Thu, 22 Jan 2026 16:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=/eHX9B+rQjztqsfK1
	dbsZkcMj6llvfxq0MlC2mC0A2k=; b=sOLWr/V/Al95Xm9mr9nkv8v21sHLYewOs
	td86ld8zl5r22cpI54pZ+XWdyaW/Dw0g4IdEbNHKw9vZ8LHDWTEsE+r24ulFMRxY
	4K8hGT2LfVZyr9QjerCpu/DyQLsLANvx+O2/Q9qP4PvokNxFkVc1ScEmc3JyDbfl
	rQ0sCtzIBvtiHRVDtVv//X64jhkujVdOg0YTDsQvz3KzY/qZMTCGp3i68WN1NBKK
	ynnZ8d1m13nx8ug4cLtMf76ryYGp8/rm8nIA1hdI1v794akXa+ejjVWQgI5d5QlQ
	0gnm+gLqizFrzCC/xCIyDKiYVLtHqJ0QyBnuqIJcF2BrDuR3kisTA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br0ufsh4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 16:58:57 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60MGoBSB012660;
	Thu, 22 Jan 2026 16:58:56 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br0ufsh4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 16:58:56 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60MEwtNl006427;
	Thu, 22 Jan 2026 16:58:55 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brqf1u5hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 16:58:55 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60MGwpAs41943358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 16:58:51 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4E1B20040;
	Thu, 22 Jan 2026 16:58:51 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9235020043;
	Thu, 22 Jan 2026 16:58:42 +0000 (GMT)
Received: from abhi.. (unknown [9.39.26.73])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Jan 2026 16:58:42 +0000 (GMT)
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
        iii@linux.ibm.com, shuah@kernel.org,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v3 5/6] powerpc64/bpf: Support exceptions
Date: Thu, 22 Jan 2026 22:27:15 +0530
Message-ID: <20260122165716.10508-6-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260122165716.10508-1-adubey@linux.ibm.com>
References: <20260122165716.10508-1-adubey@linux.ibm.com>
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
X-Proofpoint-GUID: Wr_21ZGH3LbqbZJ7F_5HJbcJ-5o1CVKd
X-Proofpoint-ORIG-GUID: K5s7DPISdH0d1g-JZzAOxzSj7BpoeNwp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyOSBTYWx0ZWRfX9DlCFjeZkbmD
 nufukhfdODR+V0JL63dS4T2DQ3UTNcR6RAvt42GUJvbBuLmvrgOyz/0Rj1raXVBbROIhUlRz4Rd
 rEZW/xbiAZO1DIh3YyDH/cvxSCfDOktDsWty9JiDdpmLVOX37nhk9ebidZd18V7BrAmBtD7ds66
 ALTN2KcWCro1PBivWab7NZTcokPVHciAiDcIPhflPVzrsH0VbuZjBfE+4g8Ck9MZjDXBOcZ0PKs
 LZZc0e8cPcELCam4B9XiRqU5oD9bWYDiP/hkuReZLf/RYJt/51+GIaQYSplrgAVdsIsaY+kxkEb
 bYkYg+8t0WFvvyLCTNI+OfMim0pAtWVLCKONetLRpCOOLdqG8WySZfsiSR/KkpHsMli4JmwYfEv
 iX8lOC14OqEm9/hA8514IGHzuH3hrfYPyKhJUPUAWuoipESSwp0sJ5D8fZbh6cvVXeiu/ucaObs
 +FB6T+Z//LqQe8UryGg==
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69725751 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=DU0EyFXtAAAA:8 a=VnNF1IyMAAAA:8
 a=xcpHmmOOOUdXZ9sPVCMA:9 a=UCR5be5CC-YrbG9FbbB0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601220129
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16157-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:adubey@linux.ibm.com,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: 2B03F6A8ED
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
index 9a8236d161ef..e5a044364835 100644
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


