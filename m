Return-Path: <linuxppc-dev+bounces-16262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J0OOIR6dGnU5wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:53:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F22C27CE5A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:53:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyn9Y3qRmz308l;
	Sat, 24 Jan 2026 18:53:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769241217;
	cv=none; b=XWhnyO0cs87MZsztWHzO8K8lTMerPpQdR6FpcbRgy5d2dPwaLNEmB+JawJ18ctSYcSgalQVe4tabm5uVKtEhDpXD/G6rhGQx5yzaiMGjJncArTtyl/2Dxza79qOICqh4pMe6Czc1/0S4PwCt/prcTMT5CEpL4wXmN904rHJD2zekl9jbAVla9eoIbRobyoa8PjjHTNDIv3EazaK22EO2R6NLOPj94RDD6SeFQx8vo9PPWhlclT7EVRLDZU9kAfs8a8oUoraSMNiJsFAuMBcQFEgjdX1z54mIahBJfSXBMjdFRpP6E9QU/GSOQnf2bzEYlhzcLNV/DDsLQghBM0g7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769241217; c=relaxed/relaxed;
	bh=cqhK3eE5u6cz/6sB9gU2oMvs86G2G2g2ijzWa+XLki4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvkPTPlRYtFWgagmlLe97o4gAp8ytKxkQZC8ocNgoKei4ZPZPSzYGS0yLPuUracOqDDeDguORIpJYKBUEumIPHWtsN13NIdMVX2uBsBWXIPHMGMNtyW/7zjK0ZwvagFqsEfA1MeRVB+msnna1hRuZCkp2JkZlDPDW4b8jvC5C4mndOJEWqxyNFXUdubIsQ/W1qSK1IDHTk7BHReN2/6DEUzclwPw5KG95sAORrlwzfswver/SneBOTcGUQgxgCL17IAOC+81Um9zyMi9zy8h5Uh1HNd2hnXTthSI+H8NElstE05wp0SpcmBzSAQnZXa3pK70UetGuGgEW6SH0K4vqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=STdSqVsS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=STdSqVsS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyn9X5lSnz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 18:53:36 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60O7mBQQ027202;
	Sat, 24 Jan 2026 07:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=cqhK3eE5u6cz/6sB9
	gU2oMvs86G2G2g2ijzWa+XLki4=; b=STdSqVsSbr5hJ4RlFkV5LTr3LUxoUHuor
	J6O8jFZuVIQ98BVR0M+SOGdrmWHw0TB5EyLAbtcnQdXQm+yN6NtqXiWvwrOYB7IG
	xBu+7Hh5k4pMasMYee/cddoRS3io2LaXw1Cau534WNJN3FIamZvFCImSyCBOH23K
	qMr22HwaaOzxwhFY+vkmDqTruHzKjNW5HjAk6EnUX4zN9WqjFa6ZOgwdM4wCudqm
	ZYzRFX3GmZh2wN3ZRINGf3hCkikq1pKC8CfmXZ1FAYSVfjXmnmXY+x6zDTalQsbY
	qzAO4inx+cICSKmi5Gns6gJDA/xyMQVhAcyAQC7hlto7Kk6SO5fig==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrt0qcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:53:01 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60O7r1Va000916;
	Sat, 24 Jan 2026 07:53:01 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrt0qcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:53:01 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60O4D3Dq006427;
	Sat, 24 Jan 2026 07:53:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brqf24n1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:53:00 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60O7qu1J41222534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jan 2026 07:52:56 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F90920043;
	Sat, 24 Jan 2026 07:52:56 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B1C420040;
	Sat, 24 Jan 2026 07:52:49 +0000 (GMT)
Received: from abhi.. (unknown [9.124.223.59])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 24 Jan 2026 07:52:49 +0000 (GMT)
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
Subject: [PATCH v5 2/6] powerpc64/bpf: Support tailcalls with subprogs
Date: Sat, 24 Jan 2026 13:22:19 +0530
Message-ID: <20260124075223.6033-3-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260124075223.6033-1-adubey@linux.ibm.com>
References: <20260124075223.6033-1-adubey@linux.ibm.com>
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
X-Proofpoint-GUID: D5kswbOd7w7mYhxRyknAsqGIWqc4166s
X-Authority-Analysis: v=2.4 cv=Uptu9uwB c=1 sm=1 tr=0 ts=69747a5d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=aLVHvtoiTwlSXXnS9I8A:9
X-Proofpoint-ORIG-GUID: UY6qxMp2h8366d0qLIuqp8FhIPzkCZAr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDA2MCBTYWx0ZWRfX4wdD/H1X3ZmQ
 +siSjx5igiL6z7KzjO8iNisXPsgDjRihEJJRpzFvHl2CF+PSdwHMXL5BpG+Q1/uUUqDwgBOps5J
 Zzw5keWOlcDYKVEyjfK1XkkkP7XHp9ZY0r45Qc1VU65joyTs9bn6e7CcHI8dG3Ap4u7A1QIMhP4
 JZfKgm8ceviCOF6BWjERLUAWFDUexIHZW4kdCLvrxR0+S5Bu1cSZNnRLNj1NTPDSaevTQqNwtFh
 YZMpLdx9TQUMJC0ENjZ487jYmeM7KqDOD1fCaB3k2ajLw24DhEEbln+IvbW28N45daUp62gWVy2
 c2EVnjhnQ6XhtrfhP+5L7yDPHRW1xAATJ3AsvxRRDjYDxuP84Ox/00ntF5naZzQMXzeTOTv2Q91
 AIerA+L0/yQb9pRkxOSil94n8uHmE8VTsaSxzDk5EQ4LS54uKxN7VGnzR1844Wez3bOmIHAeLQI
 YLudq3smpuZuD7hzkRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601240060
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	TAGGED_FROM(0.00)[bounces-16262-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:adubey@linux.ibm.com,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F22C27CE5A
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

Enable tailcalls support in subprogs by passing tail call count as
reference instead of value. The actual tailcall count is always
maintained in the tailcall field present in the frame of main
function (also called entry function). The tailcall field in the
stack frame of subprogs contains reference to the tailcall field
in the stack frame of main BPF program. Accordingly, rename
tail_call_cnt field in the stack layout to tail_call_info.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        | 13 ++++++
 arch/powerpc/net/bpf_jit_comp.c   | 63 +++++++++++++++++++++++++---
 arch/powerpc/net/bpf_jit_comp64.c | 68 +++++++++++++++++++++++--------
 3 files changed, 122 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 9f6ec00bd02e..56f56fdd4969 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -52,6 +52,13 @@
 		EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | (offset & 0xfffc));					\
 	} while (0)
 
+/* When constant jump offset is known prior */
+#define PPC_BCC_CONST_SHORT(cond, offset)							\
+	do {											\
+		BUILD_BUG_ON(offset < -0x8000 || offset > 0x7fff || (offset & 0x3));		\
+		EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | (offset & 0xfffc));	\
+	} while (0)
+
 /*
  * Sign-extended 32-bit immediate load
  *
@@ -73,6 +80,10 @@
 	} } while (0)
 
 #ifdef CONFIG_PPC64
+
+/* for gpr non volatile registers BPG_REG_6 to 10 */
+#define BPF_PPC_STACK_SAVE	(6 * 8)
+
 /* If dummy pass (!image), account for maximum possible instructions */
 #define PPC_LI64(d, i)		do {					      \
 	if (!image)							      \
@@ -167,6 +178,7 @@ struct codegen_context {
 	unsigned int alt_exit_addr;
 	u64 arena_vm_start;
 	u64 user_vm_start;
+	bool is_subprog;
 };
 
 #define bpf_to_ppc(r)	(ctx->b2p[r])
@@ -206,6 +218,7 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass
 			  struct codegen_context *ctx, int insn_idx,
 			  int jmp_off, int dst_reg, u32 code);
 
+int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx);
 #endif
 
 #endif
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index de1adc0b1157..4b18daed054a 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -206,6 +206,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
 	cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
 	cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
+	cgctx.is_subprog = bpf_is_subprog(fp);
 
 	/* Scouting faux-generate pass 0 */
 	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
@@ -435,6 +436,11 @@ void bpf_jit_free(struct bpf_prog *fp)
 	bpf_prog_unlock_free(fp);
 }
 
+bool bpf_jit_supports_subprog_tailcalls(void)
+{
+	return IS_ENABLED(CONFIG_PPC64);
+}
+
 bool bpf_jit_supports_kfunc_call(void)
 {
 	return true;
@@ -600,15 +606,50 @@ static int invoke_bpf_mod_ret(u32 *image, u32 *ro_image, struct codegen_context
 	return 0;
 }
 
-static void bpf_trampoline_setup_tail_call_cnt(u32 *image, struct codegen_context *ctx,
-					       int func_frame_offset, int r4_off)
+/*
+ * Refer __arch_prepare_bpf_trampoline() for stack component details.
+ *
+ * The tailcall count/reference is present in caller's stack frame. The
+ * tail_call_info is saved at the same offset on the trampoline frame
+ * for the traced function (BPF subprog/callee) to fetch it.
+ */
+static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_context *ctx,
+						int func_frame_offset,
+						int bpf_dummy_frame_size, int r4_off)
 {
 	if (IS_ENABLED(CONFIG_PPC64)) {
 		/* See Generated stack layout */
-		int tailcallcnt_offset = BPF_PPC_TAILCALL;
+		int tailcallinfo_offset = BPF_PPC_TAILCALL;
+
+		/*
+		 * func_frame_offset =                                   ...(1)
+		 *      bpf_dummy_frame_size + trampoline_frame_size
+		 */
+		EMIT(PPC_RAW_LD(_R4, _R1, func_frame_offset));
+		EMIT(PPC_RAW_LD(_R3, _R4, -tailcallinfo_offset));
 
-		EMIT(PPC_RAW_LL(_R3, _R1, func_frame_offset - tailcallcnt_offset));
-		EMIT(PPC_RAW_STL(_R3, _R1, -tailcallcnt_offset));
+		/*
+		 * Setting the tail_call_info in trampoline's frame
+		 * depending on if previous frame had value or reference.
+		 */
+		EMIT(PPC_RAW_CMPLWI(_R3, MAX_TAIL_CALL_CNT));
+		PPC_BCC_CONST_SHORT(COND_GT, 8);
+		EMIT(PPC_RAW_ADDI(_R3, _R4, bpf_jit_stack_tailcallinfo_offset(ctx)));
+		/*
+		 * From ...(1) above:
+		 * trampoline_frame_bottom =                            ...(2)
+		 *      func_frame_offset - bpf_dummy_frame_size
+		 *
+		 * Using ...(2) derived above:
+		 * trampoline_tail_call_info_offset =                  ...(3)
+		 *      trampoline_frame_bottom - tailcallinfo_offset
+		 *
+		 * From ...(3):
+		 * Use trampoline_tail_call_info_offset to write reference of main's
+		 * tail_call_info in trampoline frame.
+		 */
+		EMIT(PPC_RAW_STL(_R3, _R1, (func_frame_offset - bpf_dummy_frame_size)
+								- tailcallinfo_offset));
 	} else {
 		/* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
 		EMIT(PPC_RAW_LL(_R4, _R1, r4_off));
@@ -714,6 +755,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	 * LR save area                 [ r0 save (64-bit)  ]   | header
 	 *                              [ r0 save (32-bit)  ]   |
 	 * dummy frame for unwind       [ back chain 1      ] --
+	 *                              [ tail_call_info    ] optional - 64-bit powerpc
 	 *                              [ padding           ] align stack frame
 	 *       r4_off                 [ r4 (tailcallcnt)  ] optional - 32-bit powerpc
 	 *       alt_lr_off             [ real lr (ool stub)] optional - actual lr
@@ -795,6 +837,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		}
 	}
 
+	/*
+	 * Save tailcall count pointer at the same offset on the
+	 * stack where subprogs expect it
+	 */
+	if ((flags & BPF_TRAMP_F_CALL_ORIG) &&
+		(flags & BPF_TRAMP_F_TAIL_CALL_CTX))
+		bpf_frame_size += BPF_PPC_TAILCALL;
+
 	/* Padding to align stack frame, if any */
 	bpf_frame_size = round_up(bpf_frame_size, SZL * 2);
 
@@ -896,7 +946,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 
 		/* Replicate tail_call_cnt before calling the original BPF prog */
 		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
-			bpf_trampoline_setup_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
+			bpf_trampoline_setup_tail_call_info(image, ctx, func_frame_offset,
+								bpf_dummy_frame_size, r4_off);
 
 		/* Restore args */
 		bpf_trampoline_restore_args_stack(image, ctx, func_frame_offset, nr_regs, regs_off);
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 296e9ea14f2e..18da5a866447 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -26,8 +26,12 @@
  * Ensure the top half (upto local_tmp_var) stays consistent
  * with our redzone usage.
  *
+ * tail_call_info - stores tailcall count value in main program's
+ *                  frame, stores reference to tail_call_info of
+ *                  main's frame in sub-prog's frame.
+ *
  *		[	prev sp		] <-------------
- *		[    tail_call_cnt	] 8		|
+ *		[    tail_call_info	] 8		|
  *		[   nv gpr save area	] 6*8		|
  *		[    local_tmp_var	] 24		|
  * fp (r31) -->	[   ebpf stack space	] upto 512	|
@@ -35,8 +39,6 @@
  * sp (r1) --->	[    stack pointer	] --------------
  */
 
-/* for gpr non volatile registers BPG_REG_6 to 10 */
-#define BPF_PPC_STACK_SAVE	(6*8)
 /* for bpf JIT code internal usage */
 #define BPF_PPC_STACK_LOCALS	24
 /* stack frame excluding BPF stack, ensure this is quadword aligned */
@@ -98,7 +100,7 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
  *		[	prev sp		] <-------------
  *		[	  ...       	] 		|
  * sp (r1) --->	[    stack pointer	] --------------
- *		[    tail_call_cnt	] 8
+ *		[    tail_call_info	] 8
  *		[   nv gpr save area	] 6*8
  *		[    local_tmp_var	] 24
  *		[   unused red zone	] 224
@@ -114,7 +116,7 @@ static int bpf_jit_stack_local(struct codegen_context *ctx)
 	}
 }
 
-static int bpf_jit_stack_tailcallcnt(struct codegen_context *ctx)
+int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx)
 {
 	return bpf_jit_stack_local(ctx) + BPF_PPC_STACK_LOCALS + BPF_PPC_STACK_SAVE;
 }
@@ -147,17 +149,32 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 #endif
 
 	/*
-	 * Initialize tail_call_cnt if we do tail calls.
-	 * Otherwise, put in NOPs so that it can be skipped when we are
-	 * invoked through a tail call.
+	 * Tail call count(tcc) is saved & updated only in main
+	 * program's frame and the address of tcc in main program's
+	 * frame (tcc_ptr) is saved in subprogs frame.
+	 *
+	 * Offset of tail_call_info on any frame will be interpreted
+	 * as either tcc_ptr or tcc value depending on whether it is
+	 * greater than MAX_TAIL_CALL_CNT or not.
 	 */
-	if (ctx->seen & SEEN_TAILCALL) {
+	if (!ctx->is_subprog) {
 		EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG_1), 0));
 		/* this goes in the redzone */
 		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_TAILCALL)));
 	} else {
-		EMIT(PPC_RAW_NOP());
-		EMIT(PPC_RAW_NOP());
+		/*
+		 * if tail_call_info < MAX_TAIL_CALL_CNT
+		 *      main prog calling first subprog -> copy reference
+		 * else
+		 *      subsequent subprog calling another subprog -> directly copy content
+		 */
+		EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_2), _R1, 0));
+		EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_2), -(BPF_PPC_TAILCALL)));
+		EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_1), MAX_TAIL_CALL_CNT));
+		PPC_BCC_CONST_SHORT(COND_GT, 8);
+		EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_2),
+								-(BPF_PPC_TAILCALL)));
+		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_TAILCALL)));
 	}
 
 	if (bpf_has_stack_frame(ctx)) {
@@ -352,19 +369,38 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	EMIT(PPC_RAW_CMPLW(b2p_index, bpf_to_ppc(TMP_REG_1)));
 	PPC_BCC_SHORT(COND_GE, out);
 
+	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R1, bpf_jit_stack_tailcallinfo_offset(ctx)));
+	EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_1), MAX_TAIL_CALL_CNT));
+	PPC_BCC_CONST_SHORT(COND_LE, 8);
+
+	/* dereference TMP_REG_1 */
+	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), 0));
+
 	/*
-	 * if (tail_call_cnt >= MAX_TAIL_CALL_CNT)
+	 * if (tail_call_info == MAX_TAIL_CALL_CNT)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R1, bpf_jit_stack_tailcallcnt(ctx)));
 	EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_1), MAX_TAIL_CALL_CNT));
-	PPC_BCC_SHORT(COND_GE, out);
+	PPC_BCC_SHORT(COND_EQ, out);
 
 	/*
-	 * tail_call_cnt++;
+	 * tail_call_info++; <- Actual value of tcc here
 	 */
 	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), 1));
-	EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, bpf_jit_stack_tailcallcnt(ctx)));
+
+	/*
+	 * Before writing updated tail_call_info, distinguish if current frame
+	 * is storing a reference to tail_call_info or actual tcc value in
+	 * tail_call_info.
+	 */
+	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_2), _R1, bpf_jit_stack_tailcallinfo_offset(ctx)));
+	EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_2), MAX_TAIL_CALL_CNT));
+	PPC_BCC_CONST_SHORT(COND_GT, 8);
+
+	/* First get address of tail_call_info */
+	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_2), _R1, bpf_jit_stack_tailcallinfo_offset(ctx)));
+	/* Writeback updated value to tail_call_info */
+	EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_2), 0));
 
 	/* prog = array->ptrs[index]; */
 	EMIT(PPC_RAW_MULI(bpf_to_ppc(TMP_REG_1), b2p_index, 8));
-- 
2.48.1


