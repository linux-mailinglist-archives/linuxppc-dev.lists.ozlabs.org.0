Return-Path: <linuxppc-dev+bounces-17566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAo3IAncpmnRXwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:03:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED551EFD22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:03:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQGDc1tgTz3cBx;
	Wed, 04 Mar 2026 00:02:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772542960;
	cv=none; b=Vpqrm/Nawl0OlgwNowR44fr0632W2ztv50C8BmYq9B5iJGNliBFop8xKbYzCktBs9y6w6lxVTwPHEWIK7BZMhrQWFlF5US398fxuF9QFR/uiE4/0JBO4TZBPw54lX6dVa0bXH3JlbrFVW6Q1A4XWRa/M+5VWZJ1dzrs+ESTbrNSKilbgc8tNyEEDFC/Zp3OlJ0OSYIyA5jSk2ZLB2yhGqm94Aln7Ta4mzr2lqOc8r64sYXBPiu28zos493GWW4aREsi0D6BwLIPDm1bo/GX7PS8UaTH0Y3n6Xia7juicazv8u5v6IOw1HUsE2tSDDl1vik9a+N4nFbkfleL3sjvPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772542960; c=relaxed/relaxed;
	bh=0bxxZjB1UqCr2g9aJH+ztRBNkUytRzzKe0CEwvLgaT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJpKRHWjyFZBl/h4LLuWNrKAyP9Cu5nTIhGms7zlkIFWZ5MJ89bMb8tXeCYafw1mBkgzR7TZPgWj1fOS1c+ryZ7FRaMlP9vIgoZ7KOdnJG7ByzcUwboVNunElhFE4fQ/AWbCG589Gnn45guKH49I4I3K27bZBSA8NE5q8OlyIvZ4XGXNdPBJYSZkwHYcrgnK+vQ8vgbfjhgkJVH65Oi+s4SbrrI64lGHw9SkO1ojdqJp0eX7LDKYBa7LQKij3CotPNhfyH1tEMQ/P/LkCE0ONoQi6d7t+ME11829VUi+hijWJnvEsDpRPnffDhM3JBnv2vbQjlNzW2ownfLb2tSFxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z6h9/qEa; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z6h9/qEa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQGDb2GZpz3cBT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 00:02:39 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234Wdci2084496;
	Tue, 3 Mar 2026 13:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=0bxxZjB1UqCr2g9aJ
	H+ztRBNkUytRzzKe0CEwvLgaT4=; b=Z6h9/qEaWEOjmLmiSHw8SFXsstLpViMfu
	fGeyFznGGekuhvNRGkP+urabGVPIxmUlimEeo26C9fiOb/IX7lTIWJPGI91Bf3/0
	7q3KfCSKWsj0RHAU2bpE56Ij49RSOkxYs7pZuOW1+qtNrpZPtH0qQWEqxNzNdH3c
	0udN3W/9K1je2ugqoT0TE1PTOnJ9A5+JKlO2BB4wyE5HlOfJxsoeFu29ngeuUGfV
	WMF+imQ4MuE/Qoj/C15Z8CzRST42B+gYVhsUoDB3CXEayb4gFb38Se1fRwoFCG78
	nfV07IceM3eXiyEP0tALfuk+U9e9TDO0dt8UlFJP3sVKdmcmSr/+A==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrj30bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:02:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623BPUim027658;
	Tue, 3 Mar 2026 13:02:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmcwja07f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:02:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623D2Fw961211128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 13:02:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D869A2004D;
	Tue,  3 Mar 2026 13:02:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00AA720043;
	Tue,  3 Mar 2026 13:02:14 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.78.106.17])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 13:02:13 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>, stable@vger.kernel.org
Subject: [PATCH v3 2/6] powerpc64/bpf: fix the address returned by bpf_get_func_ip
Date: Tue,  3 Mar 2026 18:32:04 +0530
Message-ID: <20260303130208.325249-3-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303130208.325249-1-hbathini@linux.ibm.com>
References: <20260303130208.325249-1-hbathini@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69a6dbdc cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=dqEaXb2bD6BGsTbsOCIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5OSBTYWx0ZWRfXzQ0HgbPMS3Bd
 IF2O8y8Ub2NlMB09ILnxHpvz8GgLz6+Y3pPLavnmgiT3JtX+EMD9HjgIT2IZUa/LdlR6D4GlkEQ
 nIWLjYMcLv07JM5emQXlpUiJrpNCnX9+0g5eIGrsOCJmNfNH+Fqh8QHV+Ia2mubGJhiOmzFKYX/
 GHnQbKgL1WHL0um2mfRdjWHDbz0TvH56DLNIX30ulajPKyuOFBJRBGsSmkpFB3+g/PcugJoooeq
 Ip5YSQKEjHOFMKL73yVXvZNh34fWpDcOVgo9cWnCSU3VXA9Wgb+42jMSj2LFrepoFslws16vbud
 7VBCcBmVFI4R68uxFh30lXnU8aDzBcwDJTKd7AVsuGd6NVl8KCzxqX60YBjn3K6FEbyejTw0+oT
 b7eIuAOm9Rk/cEgb700292wSDb36GOzLVrYtIc1Kywrl+TqiGtXwLISHa+2UUDH+lQFWVCnj2lo
 PuRj/rSexBNIpYrz8WQ==
X-Proofpoint-GUID: CD7lMV2oBEySEjsefZ82Lb3wqUe62Low
X-Proofpoint-ORIG-GUID: CD7lMV2oBEySEjsefZ82Lb3wqUe62Low
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: CED551EFD22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17566-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linux.ibm.com:mid]
X-Rspamd-Action: no action

bpf_get_func_ip() helper function returns the address of the traced
function. It relies on the IP address stored at ctx - 16 by the bpf
trampoline. On 64-bit powerpc, this address is recovered from LR
accounting for OOL trampoline. But the address stored here was off
by 4-bytes. Ensure the address is the actual start of the traced
function.

Reported-by: Abhishek Dubey <adubey@linux.ibm.com>
Fixes: d243b62b7bd3 ("powerpc64/bpf: Add support for bpf trampolines")
Cc: stable@vger.kernel.org
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v3:
- Added Tested-by tag from Venkat.
- Updated comments based on suggestions from Abhishek.


 arch/powerpc/net/bpf_jit_comp.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 52162e4a7f84..95f208229b09 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -785,9 +785,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	 *       retval_off             [ return value      ]
 	 *                              [ reg argN          ]
 	 *                              [ ...               ]
-	 *       regs_off               [ reg_arg1          ] prog ctx context
-	 *       nregs_off              [ args count        ]
-	 *       ip_off                 [ traced function   ]
+	 *       regs_off               [ reg_arg1          ] prog_ctx
+	 *       nregs_off              [ args count        ] ((u64 *)prog_ctx)[-1]
+	 *       ip_off                 [ traced function   ] ((u64 *)prog_ctx)[-2]
 	 *                              [ ...               ]
 	 *       run_ctx_off            [ bpf_tramp_run_ctx ]
 	 *                              [ reg argN          ]
@@ -895,7 +895,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 
 	bpf_trampoline_save_args(image, ctx, func_frame_offset, nr_regs, regs_off);
 
-	/* Save our return address */
+	/* Save our LR/return address */
 	EMIT(PPC_RAW_MFLR(_R3));
 	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
 		EMIT(PPC_RAW_STL(_R3, _R1, alt_lr_off));
@@ -903,24 +903,34 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
 
 	/*
-	 * Save ip address of the traced function.
-	 * We could recover this from LR, but we will need to address for OOL trampoline,
-	 * and optional GEP area.
+	 * Derive IP address of the traced function.
+	 * In case of CONFIG_PPC_FTRACE_OUT_OF_LINE or BPF program, LR points to the instruction
+	 * after the 'bl' instruction in the OOL stub. Refer to ftrace_init_ool_stub() and
+	 * bpf_arch_text_poke() for OOL stub of kernel functions and bpf programs respectively.
+	 * Relevant stub sequence:
+	 *
+	 *               bl <tramp>
+	 *   LR (R3) =>  mtlr r0
+	 *               b <func_addr+4>
+	 *
+	 * Recover kernel function/bpf program address from the unconditional
+	 * branch instruction at the end of OOL stub.
 	 */
 	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE) || flags & BPF_TRAMP_F_IP_ARG) {
 		EMIT(PPC_RAW_LWZ(_R4, _R3, 4));
 		EMIT(PPC_RAW_SLWI(_R4, _R4, 6));
 		EMIT(PPC_RAW_SRAWI(_R4, _R4, 6));
 		EMIT(PPC_RAW_ADD(_R3, _R3, _R4));
-		EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
 	}
 
 	if (flags & BPF_TRAMP_F_IP_ARG)
 		EMIT(PPC_RAW_STL(_R3, _R1, ip_off));
 
-	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
+	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
 		/* Fake our LR for unwind */
+		EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
 		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
+	}
 
 	/* Save function arg count -- see bpf_get_func_arg_cnt() */
 	EMIT(PPC_RAW_LI(_R3, nr_regs));
-- 
2.53.0


