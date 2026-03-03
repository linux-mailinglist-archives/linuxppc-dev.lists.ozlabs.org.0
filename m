Return-Path: <linuxppc-dev+bounces-17569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLMuFCPcpmnRXwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:03:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A5B1EFD41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:03:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQGDl3ZKyz3cH3;
	Wed, 04 Mar 2026 00:02:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772542967;
	cv=none; b=Rf4UZ15mwch4S07Qs+02MdVFDWkLgZBm+7UNgaiJmUO1vF1ahMOZo2/hLT3jQ1+zy4WgyuXzPHxYB9LVoVw2BfEsRa+WlLcEEL85gQc3IVu8A3Sf66TlHhNetiFkyMe6AIf0En82+ZGAMPCqQN+FW8Nd4GmkFfeKH4QqWdfsFYyfCaE0WZF6x5O0UawW5KvPl8nc2VwLzBI6E3duk3sHI2dTN6CfO/RgnAC68yDb3NJMx5YOp0K4dwYZKmoiEkCBJiUW6WNoejkGCoxbYVA79bxmaPHeu8mrGK5dTgAMAgqF++ba7v2xpzQubkHM1Fpk1ki/Z/B/e2ucaPnWFpEoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772542967; c=relaxed/relaxed;
	bh=tJ+djHdG8yurEofd/LMnchboWAMBDb49zq9rzT+0PlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ga7cxFTP2HSEQhLhZk4N2J++zVxUJaS2jbt8eN1JmjifvoooMlNwryKS0XAJJMKq4buyDqO8Uc2yHTT4Hkt14MXGbaV85USnR4Ko5E/I5hWOtBYNEVHw7tMt+LM28LfSLOHP20bhAmY9H23LXUoDT9uOSH7SuiFYUIdMyS8Frt6S4fLQYHgojN9LPuOIATcOBSsEXDebeT0h27TEnV3R1TVsCiuEAdt7Nj8PCiHCbRBbhS7d5FG2sS1CVgG8qE+NUmvut4HqARSh021F3qnQ3+LfNQT8kfeFYy1bfJF/MgSLf/sk9CkFZV/Qs/iRnkjyxkDQwm09fFAxk+IHr2OrcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kvsXjsVY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kvsXjsVY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQGDk2XKCz3cG6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 00:02:46 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622KvJrK902068;
	Tue, 3 Mar 2026 13:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tJ+djHdG8yurEofd/
	LMnchboWAMBDb49zq9rzT+0PlI=; b=kvsXjsVY0JhpMIryLIdB1+MQKHBqxw/ub
	yudX6A0mVtnfldmb417K3TyoDUDC2DO1ALhD2ZGRaTC/w0f/ZYNn6WpjKPxFu0G6
	uVUtwQTLXgoDcnqFXk3Rd2Qmji1bs0c0FW1zrfX/65Bmi/rM+w7xf54YGI7qSH9d
	UWmbiiRc9JIWZTKgfoK7UIbQtcnR+irHX4zhPFHUfYNSTlCpcke6ZdK3DJUASuIv
	WWkURO4OuEtrY41zmTkmCDcFj13YvNfxTS33ZFJKdqgjg7GzTNNjZzlxI+U6fFIC
	BFRZ5PlJooWm3xo/IFrBzAdwElPgZzV1FYb8CipDjrpj4I4N6UB9w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksk3tqe6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:02:25 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623Ack8g010327;
	Tue, 3 Mar 2026 13:02:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmc6k260e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:02:24 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623D2K5522020574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 13:02:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F88E20040;
	Tue,  3 Mar 2026 13:02:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87EC120043;
	Tue,  3 Mar 2026 13:02:18 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.78.106.17])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 13:02:18 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v3 4/6] powerpc64/bpf: remove BPF redzone protection in trampoline stack
Date: Tue,  3 Mar 2026 18:32:06 +0530
Message-ID: <20260303130208.325249-5-hbathini@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: CyNRnyeMz0BhR-KSEHBBbiqLd1sm-eXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5OSBTYWx0ZWRfX8Wpy7W8gA7rJ
 EHzyYLRjs+skHqniiRPIXxGTJgKi0BmgFL9jKWRo7BdSzzJwVHgZ4zlH9L+r3as59marhCuGFrM
 i+gwkwUXiouCVZOhJTkv4tarJMTOkKnJe7PfgLyG6UtFKG5rLKeOP+zcgx0sqB0SHCn9owMi6W4
 j6LuR77/qQDoUOOXRxK9wWkjkNEuZhHlN4ESU24I7Po6wO//h+Fvpj/MvIX9+fGQw2mWfMEd/yW
 eZ5Nf7s4QgNA6WAAjg00OHJnCq5SD2h+6+cUzzKUhWJ2FGo+iWb/MVDomMZbGY2rpMKTUlR17G5
 W/pbuClfsPsDhbxHWP/tmIfDDZsiq8tP8HgoB5cMKzfQT/edjJ/ERFrkystV5AzsrUZpMawghVO
 nKMbahzR8oaEpaD8wh3KdMP1/ytx8Mmt5dGWq9tHuWMnJKvaHG+qzAvHEBSS30M1VoUEolj7w3c
 vC1iWBE6BCwIGWK8KlQ==
X-Authority-Analysis: v=2.4 cv=csCWUl4i c=1 sm=1 tr=0 ts=69a6dbe1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=JSultybHC8KXmU0xdnMA:9
 a=LBBtDQzjK0eT1O6I:21
X-Proofpoint-GUID: CyNRnyeMz0BhR-KSEHBBbiqLd1sm-eXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 64A5B1EFD41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17569-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Since bpf2bpf tailcall support is enabled for 64-bit powerpc with
kernel commit 2ed2d8f6fb38 ("powerpc64/bpf: Support tailcalls with
subprogs"), 'tailcalls/tailcall_bpf2bpf_hierarchy_fexit' BPF selftest
is triggering "corrupted stack end detected inside scheduler" with the
config option CONFIG_SCHED_STACK_END_CHECK enabled. While reviewing
the stack layout for BPF trampoline, observed that the dummy frame is
trying to protect the redzone of BPF program. This is because tail
call info and NVRs save area are in redzone at the time of tailcall
as the current BPF program stack frame is teared down before the
tailcall. But saving this redzone in the dummy frame of trampoline
is unnecessary because of the follow reasons:

  1) Firstly, trampoline can be attached to BPF entry/main program
     or subprog. But prologue part of the BPF entry/main program,
     where the trampoline attachpoint is, is skipped during tailcall.
     So, protecting the redzone does not arise when the trampoline is
     not even triggered in this scenario.
  2) In case of subprog, the caller's stackframe is already setup
     and the subprog's stackframe is yet to be setup. So, nothing
     on the redzone to be protected.

Also, using dummy frame in BPF trampoline, wastes critically scarce
kernel stack space, especially in tailcall sequence, for marginal
benefit in stack unwinding. So, drop setting up the dummy frame.
Instead, save return address in bpf trampoline frame and use it as
appropriate. Pruning this unnecessary stack usage mitigates the
likelihood of stack overflow in scenarios where bpf2bpf tailcalls
and fexit programs are mixed.

Reported-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Fixes: 2ed2d8f6fb38 ("powerpc64/bpf: Support tailcalls with subprogs")
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v3:
- Added Tested-by tag from Venkat.


 arch/powerpc/net/bpf_jit_comp.c | 89 ++++++++++++---------------------
 1 file changed, 33 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index a4aa1e4c9f1c..85457bcb2040 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -638,15 +638,10 @@ static int invoke_bpf_mod_ret(u32 *image, u32 *ro_image, struct codegen_context
  * for the traced function (BPF subprog/callee) to fetch it.
  */
 static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_context *ctx,
-						int func_frame_offset,
-						int bpf_dummy_frame_size, int r4_off)
+						int bpf_frame_size, int r4_off)
 {
 	if (IS_ENABLED(CONFIG_PPC64)) {
-		/*
-		 * func_frame_offset =                                   ...(1)
-		 *      bpf_dummy_frame_size + trampoline_frame_size
-		 */
-		EMIT(PPC_RAW_LD(_R4, _R1, func_frame_offset));
+		EMIT(PPC_RAW_LD(_R4, _R1, bpf_frame_size));
 		/* Refer to trampoline's Generated stack layout */
 		EMIT(PPC_RAW_LD(_R3, _R4, -BPF_PPC_TAILCALL));
 
@@ -657,21 +652,13 @@ static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_conte
 		EMIT(PPC_RAW_CMPLWI(_R3, MAX_TAIL_CALL_CNT));
 		PPC_BCC_CONST_SHORT(COND_GT, 8);
 		EMIT(PPC_RAW_ADDI(_R3, _R4, -BPF_PPC_TAILCALL));
+
 		/*
-		 * From ...(1) above:
-		 * trampoline_frame_bottom =                            ...(2)
-		 *      func_frame_offset - bpf_dummy_frame_size
-		 *
-		 * Using ...(2) derived above:
-		 * trampoline_tail_call_info_offset =                  ...(3)
-		 *      trampoline_frame_bottom - BPF_PPC_TAILCALL
-		 *
-		 * From ...(3):
-		 * Use trampoline_tail_call_info_offset to write reference of main's
-		 * tail_call_info in trampoline frame.
+		 * Trampoline's tail_call_info is at the same offset, as that of
+		 * any bpf program, with reference to previous frame. Update the
+		 * address of main's tail_call_info in trampoline frame.
 		 */
-		EMIT(PPC_RAW_STL(_R3, _R1, (func_frame_offset - bpf_dummy_frame_size)
-								- BPF_PPC_TAILCALL));
+		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size - BPF_PPC_TAILCALL));
 	} else {
 		/* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
 		EMIT(PPC_RAW_LL(_R4, _R1, r4_off));
@@ -679,7 +666,7 @@ static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_conte
 }
 
 static void bpf_trampoline_restore_tail_call_cnt(u32 *image, struct codegen_context *ctx,
-						 int func_frame_offset, int r4_off)
+						 int bpf_frame_size, int r4_off)
 {
 	if (IS_ENABLED(CONFIG_PPC32)) {
 		/*
@@ -690,12 +677,12 @@ static void bpf_trampoline_restore_tail_call_cnt(u32 *image, struct codegen_cont
 	}
 }
 
-static void bpf_trampoline_save_args(u32 *image, struct codegen_context *ctx, int func_frame_offset,
-				     int nr_regs, int regs_off)
+static void bpf_trampoline_save_args(u32 *image, struct codegen_context *ctx,
+				     int bpf_frame_size, int nr_regs, int regs_off)
 {
 	int param_save_area_offset;
 
-	param_save_area_offset = func_frame_offset; /* the two frames we alloted */
+	param_save_area_offset = bpf_frame_size;
 	param_save_area_offset += STACK_FRAME_MIN_SIZE; /* param save area is past frame header */
 
 	for (int i = 0; i < nr_regs; i++) {
@@ -718,11 +705,11 @@ static void bpf_trampoline_restore_args_regs(u32 *image, struct codegen_context
 
 /* Used when we call into the traced function. Replicate parameter save area */
 static void bpf_trampoline_restore_args_stack(u32 *image, struct codegen_context *ctx,
-					      int func_frame_offset, int nr_regs, int regs_off)
+					      int bpf_frame_size, int nr_regs, int regs_off)
 {
 	int param_save_area_offset;
 
-	param_save_area_offset = func_frame_offset; /* the two frames we alloted */
+	param_save_area_offset = bpf_frame_size;
 	param_save_area_offset += STACK_FRAME_MIN_SIZE; /* param save area is past frame header */
 
 	for (int i = 8; i < nr_regs; i++) {
@@ -739,10 +726,10 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 					 void *func_addr)
 {
 	int regs_off, nregs_off, ip_off, run_ctx_off, retval_off, nvr_off, alt_lr_off, r4_off = 0;
-	int i, ret, nr_regs, bpf_frame_size = 0, bpf_dummy_frame_size = 0, func_frame_offset;
 	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
 	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
 	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
+	int i, ret, nr_regs, retaddr_off, bpf_frame_size = 0;
 	struct codegen_context codegen_ctx, *ctx;
 	u32 *image = (u32 *)rw_image;
 	ppc_inst_t branch_insn;
@@ -768,16 +755,11 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	 * Generated stack layout:
 	 *
 	 * func prev back chain         [ back chain        ]
-	 *                              [                   ]
-	 * bpf prog redzone/tailcallcnt [ ...               ] 64 bytes (64-bit powerpc)
-	 *                              [                   ] --
-	 * LR save area                 [ r0 save (64-bit)  ]   | header
-	 *                              [ r0 save (32-bit)  ]   |
-	 * dummy frame for unwind       [ back chain 1      ] --
 	 *                              [ tail_call_info    ] optional - 64-bit powerpc
 	 *                              [ padding           ] align stack frame
 	 *       r4_off                 [ r4 (tailcallcnt)  ] optional - 32-bit powerpc
 	 *       alt_lr_off             [ real lr (ool stub)] optional - actual lr
+	 *       retaddr_off            [ return address    ]
 	 *                              [ r26               ]
 	 *       nvr_off                [ r25               ] nvr save area
 	 *       retval_off             [ return value      ]
@@ -841,6 +823,10 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	nvr_off = bpf_frame_size;
 	bpf_frame_size += 2 * SZL;
 
+	/* Save area for return address */
+	retaddr_off = bpf_frame_size;
+	bpf_frame_size += SZL;
+
 	/* Optional save area for actual LR in case of ool ftrace */
 	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
 		alt_lr_off = bpf_frame_size;
@@ -867,16 +853,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	/* Padding to align stack frame, if any */
 	bpf_frame_size = round_up(bpf_frame_size, SZL * 2);
 
-	/* Dummy frame size for proper unwind - includes 64-bytes red zone for 64-bit powerpc */
-	bpf_dummy_frame_size = STACK_FRAME_MIN_SIZE + 64;
-
-	/* Offset to the traced function's stack frame */
-	func_frame_offset = bpf_dummy_frame_size + bpf_frame_size;
-
-	/* Create dummy frame for unwind, store original return value */
+	/*  Store original return value */
 	EMIT(PPC_RAW_STL(_R0, _R1, PPC_LR_STKOFF));
-	/* Protect red zone where tail call count goes */
-	EMIT(PPC_RAW_STLU(_R1, _R1, -bpf_dummy_frame_size));
 
 	/* Create our stack frame */
 	EMIT(PPC_RAW_STLU(_R1, _R1, -bpf_frame_size));
@@ -891,14 +869,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	if (IS_ENABLED(CONFIG_PPC32) && nr_regs < 2)
 		EMIT(PPC_RAW_STL(_R4, _R1, r4_off));
 
-	bpf_trampoline_save_args(image, ctx, func_frame_offset, nr_regs, regs_off);
+	bpf_trampoline_save_args(image, ctx, bpf_frame_size, nr_regs, regs_off);
 
 	/* Save our LR/return address */
 	EMIT(PPC_RAW_MFLR(_R3));
 	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
 		EMIT(PPC_RAW_STL(_R3, _R1, alt_lr_off));
 	else
-		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
+		EMIT(PPC_RAW_STL(_R3, _R1, retaddr_off));
 
 	/*
 	 * Derive IP address of the traced function.
@@ -925,9 +903,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		EMIT(PPC_RAW_STL(_R3, _R1, ip_off));
 
 	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
-		/* Fake our LR for unwind */
+		/* Fake our LR for BPF_TRAMP_F_CALL_ORIG case */
 		EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
-		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
+		EMIT(PPC_RAW_STL(_R3, _R1, retaddr_off));
 	}
 
 	/* Save function arg count -- see bpf_get_func_arg_cnt() */
@@ -966,20 +944,19 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	/* Call the traced function */
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		/*
-		 * The address in LR save area points to the correct point in the original function
+		 * retaddr on trampoline stack points to the correct point in the original function
 		 * with both PPC_FTRACE_OUT_OF_LINE as well as with traditional ftrace instruction
 		 * sequence
 		 */
-		EMIT(PPC_RAW_LL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
+		EMIT(PPC_RAW_LL(_R3, _R1, retaddr_off));
 		EMIT(PPC_RAW_MTCTR(_R3));
 
 		/* Replicate tail_call_cnt before calling the original BPF prog */
 		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
-			bpf_trampoline_setup_tail_call_info(image, ctx, func_frame_offset,
-								bpf_dummy_frame_size, r4_off);
+			bpf_trampoline_setup_tail_call_info(image, ctx, bpf_frame_size, r4_off);
 
 		/* Restore args */
-		bpf_trampoline_restore_args_stack(image, ctx, func_frame_offset, nr_regs, regs_off);
+		bpf_trampoline_restore_args_stack(image, ctx, bpf_frame_size, nr_regs, regs_off);
 
 		/* Restore TOC for 64-bit */
 		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
@@ -993,7 +970,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 
 		/* Restore updated tail_call_cnt */
 		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
-			bpf_trampoline_restore_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
+			bpf_trampoline_restore_tail_call_cnt(image, ctx, bpf_frame_size, r4_off);
 
 		/* Reserve space to patch branch instruction to skip fexit progs */
 		if (ro_image) /* image is NULL for dummy pass */
@@ -1045,7 +1022,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		EMIT(PPC_RAW_LD(_R2, _R1, 24));
 	if (flags & BPF_TRAMP_F_SKIP_FRAME) {
 		/* Skip the traced function and return to parent */
-		EMIT(PPC_RAW_ADDI(_R1, _R1, func_frame_offset));
+		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_frame_size));
 		EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
 		EMIT(PPC_RAW_MTLR(_R0));
 		EMIT(PPC_RAW_BLR());
@@ -1053,13 +1030,13 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
 			EMIT(PPC_RAW_LL(_R0, _R1, alt_lr_off));
 			EMIT(PPC_RAW_MTLR(_R0));
-			EMIT(PPC_RAW_ADDI(_R1, _R1, func_frame_offset));
+			EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_frame_size));
 			EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
 			EMIT(PPC_RAW_BLR());
 		} else {
-			EMIT(PPC_RAW_LL(_R0, _R1, bpf_frame_size + PPC_LR_STKOFF));
+			EMIT(PPC_RAW_LL(_R0, _R1, retaddr_off));
 			EMIT(PPC_RAW_MTCTR(_R0));
-			EMIT(PPC_RAW_ADDI(_R1, _R1, func_frame_offset));
+			EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_frame_size));
 			EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
 			EMIT(PPC_RAW_MTLR(_R0));
 			EMIT(PPC_RAW_BCTR());
-- 
2.53.0


