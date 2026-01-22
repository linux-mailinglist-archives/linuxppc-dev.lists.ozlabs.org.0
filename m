Return-Path: <linuxppc-dev+bounces-16168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOxpNAWVcmksmQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:22:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D296DB2F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:22:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxvCQ5MQDz2xT4;
	Fri, 23 Jan 2026 08:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769116930;
	cv=none; b=aSnSYYLry4u5YImwIh91pNm9tPhF9Zcszo8Gy2hybEEEDir+3eg+7kExLwCKRIoE61XZTML0/agnHv5jqoD4Vmj9JxEjavQlfISfQJye89EtLrVKDsuVTEVhrDmJ9HjpaVM00ncIYlOCv4T3YsNmnjjH2K/4CX1yIsDtKcBVnkzoTiW4+q6UIfbKJlBLtj5WesoI9/2gVWXDoeb878QLXx1L9jJdX9GMMFDpedt3+ZbrXLMFSX3NQt6ZNXcfu8iHAk/FmQQzxm47EXPVm4Sirf9NOkrVbAkJ49VJwu2c5ficgTQdcWNCdrsCGapWNVSFPcRehOPWFJSCDucvoDfuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769116930; c=relaxed/relaxed;
	bh=8PUggZjcaHIEZpeT3Xm7CvXtCNJbJJE4E5IaGpaIdxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ca1CsXBVOfAcWoaieJbFE1cJJ+PaQ6Moo3J0h+SmAk8SiWrARvv5BdujV3w+9hgOc4GGJ5FtJQ4kNlP4zNiFqeGTlwvNhWSrAHQCu2ROBQJIm+HNVcf+baR8gfB/bzzrnA+72aG/1MTrkpZqIH5ojJeS+xwF3vxI9rI/WuLGuaG6A0j8wrRPOJrnwyGcU8UeNeRPnG37ewWEc9R22PZO0TghyxxY4A7GgLxo0jtY8kC16+Dx0UHiPqmOdsAnswuN1RzBZl8zw0sHXC75dfvQQGCVCA8MKCnnTHhzIuM6+UM4x1JjGM0k08ZeHiOPSgrRe/7YzUeQFEIqzxGEJxPvhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A5ERINqP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A5ERINqP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxvCQ0GKqz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 08:22:09 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60MCo28c028543;
	Thu, 22 Jan 2026 21:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=8PUggZjcaHIEZpeT3
	Xm7CvXtCNJbJJE4E5IaGpaIdxM=; b=A5ERINqPLJMFJ3BtCRM5tW5y0my/PU0tY
	WrdNc4HmVNax5GQtzeOOi0+6vMZWbYmsJyE3ML5Fi3+dgOsDIjZIx1Y+RzSf+o+4
	R8b6LnLDd8h1Q1gMm1kmeYx56kAcNUwx8gz6LmmmwkuWAXrH2Bk7Sx0ZKLP0YpbD
	/rvwNh4n8UFkOWVQaFlt/7g8W4gw2nOp5QQGW7+uVngrvRs1l4Am249pz5yrcOO5
	3V6KVQUju71gme/s5Mw9zfzrLmeuwaD9RTlT6LAxLxjVBs6TeEc6zvczR+AKcAq9
	fY7TXEq09TPiV5rYbf7UGVVXsoG35w+N9tj1XAGNlFn3pkjdf2TvA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60eys4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:20:31 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60MLKUZb025862;
	Thu, 22 Jan 2026 21:20:30 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60eys4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:20:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60MJ0H7V009265;
	Thu, 22 Jan 2026 21:20:29 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brp8kmwbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:20:29 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60MLKPIg36438284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 21:20:25 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E806420043;
	Thu, 22 Jan 2026 21:20:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDD4E20040;
	Thu, 22 Jan 2026 21:20:17 +0000 (GMT)
Received: from abhi.. (unknown [9.124.222.159])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Jan 2026 21:20:17 +0000 (GMT)
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
Subject: [PATCH v4 6/6] powerpc64/bpf: Additional NVR handling for bpf_throw
Date: Fri, 23 Jan 2026 02:48:54 +0530
Message-ID: <20260122211854.5508-7-adubey@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=WMdyn3sR c=1 sm=1 tr=0 ts=6972949f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=2yuXeg4sgMS8061G0UsA:9
X-Proofpoint-GUID: _Lx3ftOdMDZ15M_8Hk44IxMJ4xH2OnF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE2MiBTYWx0ZWRfXxPpzeltT1tSM
 Zc4JbfEdsKK5mD2llE/AVliQXeHnEYraJWbJP0SQq13gj6ACMP2HkM0kQvGZxn9a76UQRfsZ5Rn
 8+/vujiR7fVIF7a1EAVaKJZz3YmQ/D/fvYq7q5Hrt4VUyxAY9S/t4YAYas5QQ0HmjLULohd8drX
 WH0JfZCxRrBS2WG/QI9OxlruuCZLt4X9J768O8aRqurueGXccfqQYhxm/ZiLxG7xmOQPyE0oLzI
 774lIxWch8dGK3fAY6J3Sfb/WILsKGDRwTOYPF4cYRcfspyAM44YaNz5l5JjhFYwrjlg5NMURAi
 +FS9ddk5+NX+Pc6Z413BpWIABM1GZjQV6UbcNRtmkukphf/B6JUXgX2xuDq2o79Jj0yEEtV5P3s
 cDgGLR5MGX2JzllqVHGuVHQB5Xe83TlzXUAGGf/oYb972N2h3mUhpyB8kx4fcvC/69QZ4YnZL7m
 hD6yR+k0Nb5kanpvhjA==
X-Proofpoint-ORIG-GUID: WiNFPQIcmRUQosg3U2XlDqFLDYNf107f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_05,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601220162
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16168-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.277];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F0D296DB2F
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

The bpf_throw() function never returns, if it has
clobbered any callee-saved register, those will
remain clobbered. The prologue must take care of
saving all callee-saved registers in the frame of
exception boundary program. Later these additional
non volatile registers R14-R25 along with other
NVRs are restored back in the epilogue of exception
callback.

To achieve above objective, the frame size is
determined dynamically to accommodate additional
non volatile registers in exception boundary's frame.
For non-exception boundary program, the frame size
remains optimal. The additional instructions to
save & restore r14-r25 registers are emitted only during
exception boundary and exception callback program
respectively.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp64.c | 81 ++++++++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index d7cd8ab6559c..df07375d1595 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -32,21 +32,37 @@
  *
  *		[	prev sp		] <-------------
  *		[    tail_call_info	] 8		|
- *		[   nv gpr save area	] 6*8		|
+ *		[   nv gpr save area	] 6*8 + (12*8)	|
  *		[    local_tmp_var	] 24		|
  * fp (r31) -->	[   ebpf stack space	] upto 512	|
  *		[     frame header	] 32/112	|
  * sp (r1) --->	[    stack pointer	] --------------
+ *
+ * Additional (12*8) in 'nv gpr save area' only in case of
+ * exception boundary.
  */
 
 /* for bpf JIT code internal usage */
 #define BPF_PPC_STACK_LOCALS	24
+/*
+ * for additional non volatile registers(r14-r25) to be saved
+ * at exception boundary
+ */
+#define BPF_PPC_EXC_STACK_SAVE (12*8)
+
 /* stack frame excluding BPF stack, ensure this is quadword aligned */
 #define BPF_PPC_STACKFRAME	(STACK_FRAME_MIN_SIZE + \
 				 BPF_PPC_STACK_LOCALS + \
 				 BPF_PPC_STACK_SAVE   + \
 				 BPF_PPC_TAILCALL)
 
+/*
+ * same as BPF_PPC_STACKFRAME with save area for additional
+ * non volatile registers saved at exception boundary.
+ * This is quad-word aligned.
+ */
+#define BPF_PPC_EXC_STACKFRAME (BPF_PPC_STACKFRAME + BPF_PPC_EXC_STACK_SAVE)
+
 /* BPF register usage */
 #define TMP_REG_1	(MAX_BPF_JIT_REG + 0)
 #define TMP_REG_2	(MAX_BPF_JIT_REG + 1)
@@ -103,9 +119,12 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
  *		[	  ...       	] 		|
  * sp (r1) --->	[    stack pointer	] --------------
  *		[    tail_call_info	] 8
- *		[   nv gpr save area	] 6*8
+ *		[   nv gpr save area	] 6*8 + (12*8)
  *		[    local_tmp_var	] 24
  *		[   unused red zone	] 224
+ *
+ * Additional (12*8) in 'nv gpr save area' only in case of
+ * exception boundary.
  */
 static int bpf_jit_stack_local(struct codegen_context *ctx)
 {
@@ -114,7 +133,12 @@ static int bpf_jit_stack_local(struct codegen_context *ctx)
 		return STACK_FRAME_MIN_SIZE + ctx->stack_size;
 	} else {
 		/* Stack layout with redzone */
-		return -(BPF_PPC_TAILCALL + BPF_PPC_STACK_SAVE + BPF_PPC_STACK_LOCALS);
+		return -(BPF_PPC_TAILCALL
+			+BPF_PPC_STACK_SAVE
+			+(ctx->exception_boundary || ctx->exception_cb ?
+						BPF_PPC_EXC_STACK_SAVE : 0)
+			+BPF_PPC_STACK_LOCALS
+			);
 	}
 }
 
@@ -125,9 +149,19 @@ int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx)
 
 static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
 {
-	if (reg >= BPF_PPC_NVR_MIN && reg < 32)
+	int min_valid_nvreg = BPF_PPC_NVR_MIN;
+	/* Default frame size for all cases except exception boundary */
+	int frame_nvr_size = BPF_PPC_STACKFRAME;
+
+	/* Consider all nv regs for handling exceptions */
+	if (ctx->exception_boundary || ctx->exception_cb) {
+		min_valid_nvreg = _R14;
+		frame_nvr_size = BPF_PPC_EXC_STACKFRAME;
+	}
+
+	if (reg >= min_valid_nvreg && reg < 32)
 		return (bpf_has_stack_frame(ctx) ?
-			(BPF_PPC_STACKFRAME + ctx->stack_size) : 0)
+			(frame_nvr_size + ctx->stack_size) : 0)
 				- (8 * (32 - reg)) - BPF_PPC_TAILCALL;
 
 	pr_err("BPF JIT is asking about unknown registers");
@@ -138,6 +172,17 @@ void bpf_jit_realloc_regs(struct codegen_context *ctx)
 {
 }
 
+/*
+ * For exception boundary & exception_cb progs:
+ *     return increased size to accommodate additional NVRs.
+ */
+static int bpf_jit_stack_size(struct codegen_context *ctx)
+{
+	return ctx->exception_boundary || ctx->exception_cb ?
+					BPF_PPC_EXC_STACKFRAME :
+					BPF_PPC_STACKFRAME;
+}
+
 void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 {
 	int i;
@@ -198,7 +243,19 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 			EMIT(PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF));
 		}
 
-		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
+		EMIT(PPC_RAW_STDU(_R1, _R1,
+				-(bpf_jit_stack_size(ctx) + ctx->stack_size)));
+	}
+
+	/*
+	 * Program acting as exception boundary pushes R14..R25 in addition to
+	 * BPF callee-saved non volatile registers. Exception callback uses
+	 * the boundary program's stack frame, recover additionally saved
+	 * registers in epilogue of exception callback.
+	 */
+	if (ctx->exception_boundary) {
+		for (i = _R14; i <= _R25; i++)
+			EMIT(PPC_RAW_STD(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
 	}
 
 	if (!ctx->exception_cb) {
@@ -245,9 +302,19 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 		EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
 				bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
 
+	if (ctx->exception_cb) {
+		/*
+		 * Recover additionally saved non volatile registers from stack
+		 * frame of exception boundary program.
+		 */
+		for (i = _R14; i <= _R25; i++)
+			EMIT(PPC_RAW_LD(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
+	}
+
 	/* Tear down our stack frame */
 	if (bpf_has_stack_frame(ctx)) {
-		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
+		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_jit_stack_size(ctx) + ctx->stack_size));
+
 		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
 			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
 			EMIT(PPC_RAW_MTLR(_R0));
-- 
2.48.1


