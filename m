Return-Path: <linuxppc-dev+bounces-17129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMFRIdgLnmkPTQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 21:36:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2A18C6C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 21:36:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL8dX4KwCz3cm9;
	Wed, 25 Feb 2026 07:36:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771965392;
	cv=none; b=XaXlmo5QQACJc4KQCouZTLGCa3Ibgq/tlcV/BBPcAtIRn+8nmoc4pma2K1szbdSCWvzMJKq4mF9BUWus9fWN6yNxsIh+zZ+5PjspfSt6U1lIWsdxGdhaj15hQnRkVa4IT2X/lZlJoSCxCYUYG8mznO9f+rU+cGWAEsic/YK3xP8rikn0483ZcCes5wFRQ/m/hZ/sV5TgEaaT70XAW6HUQ5RUYwbQPvY7APqT+EuRTXu8N/Us01pi23f4fR9EMRLo/BzHXcthXhChX5IqqOKYXNRJQC/bbPlJd1DTvMKEnwd8MzNfDi0zg1YeNM2y7QQ+EIT5i1Rd5FMYWIqiG45Pog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771965392; c=relaxed/relaxed;
	bh=MorJZ8vBjCpEczvVhVmJwcQR6S5TypBonUoZEwdPUNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LESbjNsEf146KgiBqwTSIvZm6lZ4oW+t/Bk0rooB3Xx/wyW3hklHdLr8oApo6KPGsMsAVPZkpHKtIz23poQG6m/IcGIwn+Q+Z+buxYIERdUmHJKp8ASrfB+FGvJuwf1DwUN//ZnJrpQgRhN91Cg+kxOiqyzQq8JNa7NZi/TQVZ/FV+kjfyG0Xb2MZR/18+CukxN7x8k162DS7rLBJd6CdNN3CU3Oj7fNap4bHkvvYFSzHh7F5+1IFLhBwhOg2olVAssP2vZnQBZe1Pc6a/2AxoKmtGM2lchE7OiIkxWwDsiK1krGEvucy+V5hyj1gw7iYLcfnmbCv46Ec6TnMyzfmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YEhKVv5f; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YEhKVv5f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL8dW5dZ0z3cl0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 07:36:31 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9s6VJ3015564;
	Tue, 24 Feb 2026 20:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=MorJZ8vBjCpEczvVh
	VmJwcQR6S5TypBonUoZEwdPUNQ=; b=YEhKVv5fd3D0YIDePQvALD/VKaqZczL+E
	a6g4FRZfTz7nKyEFyBOmyE/9ZhOw2EcE9Nd8l2l7ICvzPcher9chUi9xUglEtryL
	pkunV07hMW8uZfe7foO/b2jLikrcnQnfS+R1i4fq/+h2PIW1DmkYppykz8vPLbhn
	WePMaqpY216UsTM/oan4eY1wQGfrdETmi5AT3xRVk8zc0pBXOfTYb6KMJGeP3Pug
	GhOKKEVm9gZ6tEliMI07qWQVAuVUz0bdjo8dhyP+Y1jk/x165Fx0EFeXiXAx3QH7
	s8dBZK5ot6C36jdYcZwK5DopK4A3ITjY+daxmc/Xt/PVZHum0Wi0A==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4brvt1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 20:36:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61OKThdw015959;
	Tue, 24 Feb 2026 20:36:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfq1sjnah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 20:36:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61OKaCIk44499446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 20:36:12 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AC8D20043;
	Tue, 24 Feb 2026 20:36:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE4FF20040;
	Tue, 24 Feb 2026 20:36:10 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Feb 2026 20:36:10 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 1/4] powerpc/bpf: Move out dummy_tramp_addr after Long branch stub
Date: Tue, 24 Feb 2026 20:36:24 -0500
Message-ID: <20260225013627.22098-2-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225013627.22098-1-adubey@linux.ibm.com>
References: <20260225013627.22098-1-adubey@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: zKc_LSWZDtVWy4P7buRnDARgb3Z7RaqG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE3MyBTYWx0ZWRfX2mZS8O4WsaE6
 PsakszOwK9v0h9dXlV0qo0WQwP49WSAxsv48qX6621jBokXqy7rwbURAbNzLmOeW6pn4iuR/2He
 rncwSD7QonzBNzQXiIAswJzJ5G3dRoepR5uB0ReEPocfCTBAoTf9Mkc4EnXQJRSpmE3M/4+xWtj
 DQW+g4iF5xgQcTE4luxmBkoYUf9O6AIkzUB6VQAxgCGfqjkxjKbB3RE5jDQXOAv/s3XP4popKMn
 uMkokCHFM9fzdIGqlR1HrWRjxIp3Ib0Rmm9aicC15jqqbrz+LuclSexCbFY8wCVwdqP3tKaMIHS
 JL/k7AG7/z0lV++IGTlt1DkRGp7xKCQtbpoSnLAMnOaD7tWioAZ7dHIoq3lctJsD5CqIhIJanWE
 ba5kmVOwDSH6YrIFYEz8+8qTGT1HaTWBuLncriXiFulFMyG6zbGOfNJZOZ3fedN9jsz6Kq7M91T
 Ei5obR3qCU9Z6/nz01A==
X-Authority-Analysis: v=2.4 cv=eNceTXp1 c=1 sm=1 tr=0 ts=699e0bc1 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=1VRrxSKOiSBxsvn29CgA:9
X-Proofpoint-GUID: zKc_LSWZDtVWy4P7buRnDARgb3Z7RaqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602240173
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17129-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 90C2A18C6C0
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

Move the long branch address space to the bottom of the long
branch stub. This allows uninterrupted disassembly until the
last 8 bytes. Exclude these last bytes from the overall
program length to prevent failure in assembly generation.
Also, align dummy_tramp_addr field with 8-byte boundary.

Following is disassembler output for test program with moved down
dummy_tramp_addr field:
.....
.....
pc:68    left:44     a6 03 08 7c  :  mtlr 0
pc:72    left:40     bc ff ff 4b  :  b .-68
pc:76    left:36     a6 02 68 7d  :  mflr 11
pc:80    left:32     05 00 9f 42  :  bcl 20, 31, .+4
pc:84    left:28     a6 02 88 7d  :  mflr 12
pc:88    left:24     14 00 8c e9  :  ld 12, 20(12)
pc:92    left:20     a6 03 89 7d  :  mtctr 12
pc:96    left:16     a6 03 68 7d  :  mtlr 11
pc:100   left:12     20 04 80 4e  :  bctr
pc:104   left:8      c0 34 1d 00  :

Failure log:
Can't disasm instruction at offset 104: c0 34 1d 00 00 00 00 c0
Disassembly logic can truncate at 104, ignoring last 8 bytes.

Update the dummy_tramp_addr field offset calculation from the end
of the program to reflect its new location, for bpf_arch_text_poke()
to update the actual trampoline's address in this field.

All BPF trampoline selftests continue to pass with this patch applied.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 45 +++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 7a78e03d482f..f8f6305b0d9f 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -51,7 +51,9 @@ asm (
 
 void bpf_jit_build_fentry_stubs(u32 *image, struct codegen_context *ctx)
 {
-	int ool_stub_idx, long_branch_stub_idx;
+	int ool_stub_idx, long_branch_stub_idx, tramp_load_offset;
+	bool tramp_needs_align;
+	u32 tramp_idx;
 
 	/*
 	 * Out-of-line stub:
@@ -70,27 +72,45 @@ void bpf_jit_build_fentry_stubs(u32 *image, struct codegen_context *ctx)
 
 	/*
 	 * Long branch stub:
-	 *	.long	<dummy_tramp_addr>
 	 *	mflr	r11
 	 *	bcl	20,31,$+4
-	 *	mflr	r12
-	 *	ld	r12, -8-SZL(r12)
+	 *	mflr	r12		// lr/r12 stores current pc
+	 *	ld	r12, 20(r12)	// offset(dummy_tramp_addr) from prev inst. is 20
 	 *	mtctr	r12
-	 *	mtlr	r11 // needed to retain ftrace ABI
+	 *	mtlr	r11		// needed to retain ftrace ABI
 	 *	bctr
+	 *	nop			// Optional, for mem alignment of dummy_tramp_addr
+	 *	.long	<dummy_tramp_addr>
 	 */
-	if (image)
-		*((unsigned long *)&image[ctx->idx]) = (unsigned long)dummy_tramp;
-	ctx->idx += SZL / 4;
 	long_branch_stub_idx = ctx->idx;
 	EMIT(PPC_RAW_MFLR(_R11));
 	EMIT(PPC_RAW_BCL4());
 	EMIT(PPC_RAW_MFLR(_R12));
-	EMIT(PPC_RAW_LL(_R12, _R12, -8-SZL));
+
+	/* Relative offset of dummy_tramp_addr wrt start of long branch stub */
+	tramp_idx = long_branch_stub_idx + 7;
+	/*
+	 * Image layout need not be considered 8-byte aligned.
+	 * Lower 3 bits must be clear for 8-bytes alignment.
+	 * Adjust offset for padding NOP before dummy_tramp_addr
+	 */
+	tramp_needs_align = (((unsigned long)&image[tramp_idx]) & 7) != 0;
+	tramp_load_offset = tramp_needs_align ? 24 : 20;
+
+	EMIT(PPC_RAW_LL(_R12, _R12, tramp_load_offset));
 	EMIT(PPC_RAW_MTCTR(_R12));
 	EMIT(PPC_RAW_MTLR(_R11));
 	EMIT(PPC_RAW_BCTR());
 
+	/* align dummy_tramp_addr to 8 bytes */
+	if (tramp_needs_align)
+		EMIT(PPC_RAW_NOP());
+
+	if (image)
+		*((unsigned long *)&image[ctx->idx]) = (unsigned long)dummy_tramp;
+
+	ctx->idx += SZL / 4;
+
 	if (!bpf_jit_ool_stub) {
 		bpf_jit_ool_stub = (ctx->idx - ool_stub_idx) * 4;
 		bpf_jit_long_branch_stub = (ctx->idx - long_branch_stub_idx) * 4;
@@ -1206,7 +1226,6 @@ static void do_isync(void *info __maybe_unused)
  *	b	bpf_func + 4
  * 3. Long branch stub:
  * long_branch_stub:
- *	.long	<branch_addr>/<dummy_tramp>
  *	mflr	r11
  *	bcl	20,31,$+4
  *	mflr	r12
@@ -1214,6 +1233,8 @@ static void do_isync(void *info __maybe_unused)
  *	mtctr	r12
  *	mtlr	r11 // needed to retain ftrace ABI
  *	bctr
+ *	nop         // optinonal, mem align dummy_tramp field
+ *	.long	<branch_addr>/<dummy_tramp>
  *
  * dummy_tramp is used to reduce synchronization requirements.
  *
@@ -1315,10 +1336,12 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 	 * 1. Update the address in the long branch stub:
 	 * If new_addr is out of range, we will have to use the long branch stub, so patch new_addr
 	 * here. Otherwise, revert to dummy_tramp, but only if we had patched old_addr here.
+	 *
+	 * dummy_tramp_addr moved to bottom of long branch stub.
 	 */
 	if ((new_addr && !is_offset_in_branch_range(new_addr - ip)) ||
 	    (old_addr && !is_offset_in_branch_range(old_addr - ip)))
-		ret = patch_ulong((void *)(bpf_func_end - bpf_jit_long_branch_stub - SZL),
+		ret = patch_ulong((void *)(bpf_func_end - SZL), /* SZL: dummy_tramp_addr offset */
 				  (new_addr && !is_offset_in_branch_range(new_addr - ip)) ?
 				  (unsigned long)new_addr : (unsigned long)dummy_tramp);
 	if (ret)
-- 
2.52.0


