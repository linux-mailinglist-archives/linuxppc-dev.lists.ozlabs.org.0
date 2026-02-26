Return-Path: <linuxppc-dev+bounces-17215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKBBIfCBn2lrcgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 00:12:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2942D19E9B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 00:12:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLr3G549Xz2xWP;
	Thu, 26 Feb 2026 10:12:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772061162;
	cv=none; b=grF0ZFE7AKh+2GlkJ47CDR2AePQOyiObTQ3iaVgvy9XeNjZtFZ5L3NePvD2SvEO+vtg3ALoP8qjyw/JMyktVkDX0uTe58PcmIPKaO0qg93Q5+HkAcKbSW73OTQvLTS131zzC5s03WTVNLwt3PGkJtN/MxTzFuUqZWQjUiMNj9KRFQLR0jJEGu1fpMoPtURv2q4CQvBvXTQEuPNT9JjtLV1QBO+KJBKBEY0kPOn4QEywOOLgZL/ABBbRYpt1KT5B5PfofR6IP6I9kWMPteKV7r6SM/+oSfC8SJh0BhdeQ+BuZni1cw6GIi8tKoLVI4fg26qxBwu6KGD9lLcdtj9TG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772061162; c=relaxed/relaxed;
	bh=m9BO38pWe3BGs3iSgg9zL0rfQqR0j5b9FLogTaldN6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAOWhH06bVvzNMZ6K3M0b38Sok6dPnLqwRZ6GJdbBteUWZkgZOzPwBS1pwUwcID+WhPqHQPIG9z29bPBHJhgk4BOZAzjpc2IBEs6p1xTQxe9BFYc0sOKG9lFPgITrAukL2GJQsBQ3BNSd6JLTYFSlrGeoxnVFdLLque8a6x4frtQAw1w931jF03XOrupyTiv2UGuqT2mWafR3RPGGvJxqWVVdDKmYEdUng7mVDDNdutUlBBH8juYw7TRpicbhuGksfp3tiXANi2w5V9kjat+D/jBwrxTW9TZfMDSqFuts2M4zGOrWNBP5b4AsfwUejNcWAbCm/bJ4X7opKXWMupXHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RmDZ8wic; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RmDZ8wic;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLr3F3mwlz2xNC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 10:12:40 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PLMbDc3390406;
	Wed, 25 Feb 2026 23:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=m9BO38pWe3BGs3iSgg9zL0rfQqR0j5b9FLogTaldN
	6k=; b=RmDZ8wicFKsdl8F7sKlK8VsUYXVMrsu7JVys0MfDmEyRXHO3GSX67i+j0
	OPOfed2dOEF4n7nt60BHTAQIHcuZpJoegKFUHb1wCrvFwriOxRdZ7R6PYgEtebET
	5AgGuoz66JnyWNi3OmRFy+QNycKFOcjuYl1n9boVo2xRCJ9xRrK1dmO7v/6wbrTi
	cUSKiAPN7off+HB/Kw9UdtBMq4ayFXh00aTL1MYjCtFDDCNIhbg5YzFBHDAaX9rj
	6mXKcmDx5xVd1iSFTZ2r+B7Gok3VqQ9j/nnkNvPYzvcJpMnoP2JxrouKFjnWJmxi
	yd6CSU3np+Y0hh7qh6GmAupcwtgWA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4723511-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 23:12:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61PNA2e1001659;
	Wed, 25 Feb 2026 23:12:24 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfr1n7ygb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 23:12:23 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61PNCJ8349414422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 23:12:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A851F20049;
	Wed, 25 Feb 2026 23:12:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FB0420040;
	Wed, 25 Feb 2026 23:12:18 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Feb 2026 23:12:17 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v2 1/3] powerpc64/bpf: Implement fsession support
Date: Wed, 25 Feb 2026 23:12:15 -0500
Message-ID: <20260226041217.18059-1-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
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
X-Proofpoint-ORIG-GUID: VMnX9COGN3NEFrWhF67XcdIiScdFG-52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIyMSBTYWx0ZWRfXwHy2eXvp5iXE
 r/ppb9RrcOduU/G4sBYS02flPlSAf/gEh+yPdE+CwVncoS5ktl9oI2ZlDkZHh7k14fpep6HD76/
 Hx3yJb7tZN4foCm96udqaxx36+pf5D5WqdS0fABEzFI+xTtObKvW/SzeGLOeL0pQ0QWBUxbk9bf
 7ZtDkonYvaanmRkwB/h0Kwvx7oKi+NihxuY6WfEs7FRIDgylTp+IfgWduZbz95/fr/bhrskNmQV
 8gUESCnpaKUIW5rtfD+wnkDmOVr3aG5hmv3WBlPPg+cpz9dEM5jIfptiCXl73X7IxXVcTBcyDCh
 h5HBEotKa03c/ebPxqN2+UWvZx5tPLO0flcVjRO/+iqFBIl7rAesf5ZCrsdjAn4hX/4/4mlfeqA
 WjsDv+ZleZpwb+YdMghNuFZbKh89/ZjMfgXc0zHd70JJJ6BllcCqnRf0rbTcFO90a65uWhzF76Q
 HDMwJPBrVC2F630rf9g==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=699f81d9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=VI0ruYTOgo-bu1z5fxYA:9
X-Proofpoint-GUID: VMnX9COGN3NEFrWhF67XcdIiScdFG-52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602250221
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17215-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2942D19E9B7
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

Implement JIT support for fsession in powerpc64 trampoline.
The trampoline stack now accommodate session cookies and
function metadata in place of function argument. fentry/fexit
programs consume corresponding function metadata. This mirrors
existing x86 behavior and enable session cookies on powerpc64.

Patch rebased over:
https://lore.kernel.org/bpf/20260220063933.196141-1-hbathini@linux.ibm.com

v1->v2:
  No change since v1

[v1]: https://lore.kernel.org/bpf/20260216155310.38457-1-adubey@linux.ibm.com

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  4 +-
 arch/powerpc/net/bpf_jit_comp.c   | 69 ++++++++++++++++++++++++++-----
 arch/powerpc/net/bpf_jit_comp64.c | 25 +++++++++++
 3 files changed, 87 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index a232f3fb73be..f32de8704d4d 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -218,7 +218,9 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_build_fentry_stubs(u32 *image, struct codegen_context *ctx);
 void bpf_jit_realloc_regs(struct codegen_context *ctx);
 int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr);
-
+void prepare_for_fsession_fentry(u32 *image, struct codegen_context *ctx, int cookie_cnt,
+								int cookie_off, int retval_off);
+void store_func_meta(u32 *image, struct codegen_context *ctx, u64 func_meta, int func_meta_off);
 int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass,
 			  struct codegen_context *ctx, int insn_idx,
 			  int jmp_off, int dst_reg, u32 code);
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 08c992436ace..6d334c0c3d85 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -540,6 +540,11 @@ bool bpf_jit_supports_private_stack(void)
 	return IS_ENABLED(CONFIG_PPC64);
 }
 
+bool bpf_jit_supports_fsession(void)
+{
+	return IS_ENABLED(CONFIG_PPC64);
+}
+
 bool bpf_jit_supports_arena(void)
 {
 	return IS_ENABLED(CONFIG_PPC64);
@@ -812,12 +817,16 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 					 struct bpf_tramp_links *tlinks,
 					 void *func_addr)
 {
-	int regs_off, nregs_off, ip_off, run_ctx_off, retval_off, nvr_off, alt_lr_off, r4_off = 0;
+	int regs_off, func_meta_off, ip_off, run_ctx_off, retval_off;
+	int nvr_off, alt_lr_off, r4_off = 0;
 	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
 	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
 	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
 	int i, ret, nr_regs, retaddr_off, bpf_frame_size = 0;
 	struct codegen_context codegen_ctx, *ctx;
+	int cookie_off, cookie_cnt, cookie_ctx_off;
+	int fsession_cnt = bpf_fsession_cnt(tlinks);
+	u64 func_meta;
 	u32 *image = (u32 *)rw_image;
 	ppc_inst_t branch_insn;
 	u32 *branches = NULL;
@@ -853,9 +862,11 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	 *                              [ reg argN          ]
 	 *                              [ ...               ]
 	 *       regs_off               [ reg_arg1          ] prog ctx context
-	 *       nregs_off              [ args count        ] ((u64 *)prog_ctx)[-1]
+	 *       func_meta_off          [ args count        ] ((u64 *)prog_ctx)[-1]
 	 *       ip_off                 [ traced function   ] ((u64 *)prog_ctx)[-2]
+	 *                              [ stack cookieN     ]
 	 *                              [ ...               ]
+	 *       cookie_off             [ stack cookie1     ]
 	 *       run_ctx_off            [ bpf_tramp_run_ctx ]
 	 *                              [ reg argN          ]
 	 *                              [ ...               ]
@@ -887,16 +898,21 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	run_ctx_off = bpf_frame_size;
 	bpf_frame_size += round_up(sizeof(struct bpf_tramp_run_ctx), SZL);
 
+	/* room for session cookies */
+	cookie_off = bpf_frame_size;
+	cookie_cnt = bpf_fsession_cookie_cnt(tlinks);
+	bpf_frame_size += cookie_cnt * 8;
+
 	/* Room for IP address argument */
 	ip_off = bpf_frame_size;
 	if (flags & BPF_TRAMP_F_IP_ARG)
 		bpf_frame_size += SZL;
 
-	/* Room for args count */
-	nregs_off = bpf_frame_size;
+	/* Room for function metadata, arg regs count */
+	func_meta_off = bpf_frame_size;
 	bpf_frame_size += SZL;
 
-	/* Room for args */
+	/* Room for arg egs */
 	regs_off = bpf_frame_size;
 	bpf_frame_size += nr_regs * SZL;
 
@@ -990,9 +1006,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		EMIT(PPC_RAW_STL(_R3, _R1, retaddr_off));
 	}
 
-	/* Save function arg count -- see bpf_get_func_arg_cnt() */
-	EMIT(PPC_RAW_LI(_R3, nr_regs));
-	EMIT(PPC_RAW_STL(_R3, _R1, nregs_off));
+	/* Save function arg regs count -- see bpf_get_func_arg_cnt() */
+	func_meta = nr_regs;
+	store_func_meta(image, ctx, func_meta, func_meta_off);
 
 	/* Save nv regs */
 	EMIT(PPC_RAW_STL(_R25, _R1, nvr_off));
@@ -1006,10 +1022,28 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 			return ret;
 	}
 
-	for (i = 0; i < fentry->nr_links; i++)
+	if (fsession_cnt) {
+		/*
+		 * Clear all the session cookies' values
+		 * Clear the return value to make sure fentry always get 0
+		 */
+		prepare_for_fsession_fentry(image, ctx, cookie_cnt, cookie_off, retval_off);
+	}
+
+	cookie_ctx_off = (regs_off - cookie_off) / 8;
+
+	for (i = 0; i < fentry->nr_links; i++) {
+		if (bpf_prog_calls_session_cookie(fentry->links[i])) {
+			u64 meta = func_meta | (cookie_ctx_off << BPF_TRAMP_COOKIE_INDEX_SHIFT);
+
+			store_func_meta(image, ctx, meta, func_meta_off);
+			cookie_ctx_off--;
+		}
+
 		if (invoke_bpf_prog(image, ro_image, ctx, fentry->links[i], regs_off, retval_off,
 				    run_ctx_off, flags & BPF_TRAMP_F_RET_FENTRY_RET))
 			return -EINVAL;
+	}
 
 	if (fmod_ret->nr_links) {
 		branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
@@ -1071,12 +1105,27 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		image[branches[i]] = ppc_inst_val(branch_insn);
 	}
 
-	for (i = 0; i < fexit->nr_links; i++)
+	/* set the "is_return" flag for fsession */
+	func_meta |= (1ULL << BPF_TRAMP_IS_RETURN_SHIFT);
+	if (fsession_cnt)
+		store_func_meta(image, ctx, func_meta, func_meta_off);
+
+	cookie_ctx_off = (regs_off - cookie_off) / 8;
+
+	for (i = 0; i < fexit->nr_links; i++) {
+		if (bpf_prog_calls_session_cookie(fexit->links[i])) {
+			u64 meta = func_meta | (cookie_ctx_off << BPF_TRAMP_COOKIE_INDEX_SHIFT);
+
+			store_func_meta(image, ctx, meta, func_meta_off);
+			cookie_ctx_off--;
+		}
+
 		if (invoke_bpf_prog(image, ro_image, ctx, fexit->links[i], regs_off, retval_off,
 				    run_ctx_off, false)) {
 			ret = -EINVAL;
 			goto cleanup;
 		}
+	}
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		if (ro_image) /* image is NULL for dummy pass */
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 17aec341f5eb..1e2ac6c4f331 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -179,6 +179,31 @@ static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
 	BUG();
 }
 
+void prepare_for_fsession_fentry(u32 *image, struct codegen_context *ctx, int cookie_cnt,
+				int cookie_off, int retval_off)
+{
+	EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG_1), 0));
+
+	for (int i = 0; i < cookie_cnt; i++)
+		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, cookie_off + 8 * i));
+	EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, retval_off));
+}
+
+void store_func_meta(u32 *image, struct codegen_context *ctx,
+					u64 func_meta, int func_meta_off)
+{
+	/*
+	 * Store func_meta to stack at [R1 + func_meta_off] = func_meta
+	 *
+	 * func_meta :
+	 *	bit[63]: is_return flag
+	 *	byte[1]: cookie offset from ctx
+	 *	byte[0]: args count
+	 */
+	PPC_LI64(bpf_to_ppc(TMP_REG_1), func_meta);
+	EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, func_meta_off));
+}
+
 void bpf_jit_realloc_regs(struct codegen_context *ctx)
 {
 }
-- 
2.52.0


