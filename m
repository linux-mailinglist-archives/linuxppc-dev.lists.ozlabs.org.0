Return-Path: <linuxppc-dev+bounces-16983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOVSHd8BmGnC/AIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 07:40:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8A9165068
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 07:40:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHLGH6WZZz3c5j;
	Fri, 20 Feb 2026 17:40:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771569607;
	cv=none; b=HVEmz7MDp5qyd7xodldSozuVZApvzOyNg6xGzFShwFHzjuo5O5SLiryHAAoC9qjmFZip7He/6C18nXj5QCQeK7GFxU3RCo6gF0wg4zQoqBcG7mJmBZrpop20uBm0C3d+Dfn8TEvULh5ID/cDFslafemsOj1nDTNi/eIrmMq0kvDWxyVQvYqF8ACqKUKQxER9Fm13a0Ar3y9i7FlNzwwHRlHvS17DETij5MtF99x8K22jPTY+skFeLhP2AL1iFCSV584sj/1qIPWqPm4iZ5Wrg92yO5tcncizzyFpwcJ/K5lxsWe+Vo7o4V8APtHVpZMjXoPja4gxCj3rGJmWFw+HIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771569607; c=relaxed/relaxed;
	bh=4fo3CviLWzYU3gkx2LEh4K7KS1jNYDL5GrZ4RH0h61w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e3vWtFCI9JyyDBMDmXvKC+YpoSqQ3LkjonR2pNwx6+li4BlbxT43kuTwgR75JrRNWR2tVyCx4+kE2Ah5n36GZRsqsk4cBYwXz9SkOSe7pOwfv1b7ESsz8dFayjOuGOWOntBDYUB7EoRM54iihowck/YaGNPTK2yX1Y9Fn0+BvEtiqMF5aSCCprNwJd5TOecCFlw5tISCKXvSqXcQfAS9LhL8XJW0xKsDIF+8viFL/yqXDK1uZhJTt84XZ0uBkDjFOR82w7K6syu5qcdoNLSTvjsF9JT3V8MlXDRD4vHxVclnZmV9+FJiUFu4vSKzOegD4IFRHJYrZmaSlr1PkKlmUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K0lkqL/A; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K0lkqL/A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHLGH0DSQz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 17:40:06 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JMqkp61271499;
	Fri, 20 Feb 2026 06:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=4fo3CviLWzYU3gkx2
	LEh4K7KS1jNYDL5GrZ4RH0h61w=; b=K0lkqL/ATlhul8nwwdkEFjPGTtvIOeDhs
	Od0VXLK2WDSKeX6F13eltRb8bqdWB9lduHHllnto1zyewzyL2Kbiwws2YnTQyvFd
	vCKNsK2rYbpwhkngel39qKw5dEqWUHAW9xa/VwBcQm/8W0oXkymazfnmB7WP3y7J
	D0Clcvuh/YxYx4Dm/5PC0r3HtJB9bTcZFGVpGIp3qBn4KicSh16NekpkgunyFPsJ
	tkcO3a+GxDdS8rF+8QTFScf3wsD6PAFx16rBEY9KQU3u7yf6QsyVt1uY+fo+4og3
	6olwqtQDyb9C7Y4AAf9/VVdcjCU+AtQr7m2CU9zhvBK4cQy9zqw2w==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj4kracv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 06:39:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61K3wkGZ001391;
	Fri, 20 Feb 2026 06:39:51 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb2bqccg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 06:39:51 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61K6dlfa28639590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Feb 2026 06:39:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D500C20043;
	Fri, 20 Feb 2026 06:39:47 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A205D20040;
	Fri, 20 Feb 2026 06:39:45 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.64.63])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Feb 2026 06:39:45 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v2 4/5] powerpc64/bpf: remove BPF redzone protection in trampoline stack
Date: Fri, 20 Feb 2026 12:09:32 +0530
Message-ID: <20260220063933.196141-5-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220063933.196141-1-hbathini@linux.ibm.com>
References: <20260220063933.196141-1-hbathini@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1MiBTYWx0ZWRfX6Z47O/BqoUTE
 +FoPTT8bTEV2zF8jzHkZ62eruo7ilW3KF7yNC4n2V7HP2PjlwPsn+vSOTHt8EJqu67uf8R8s0t3
 L9F05Wvv9OYVS01K+ZKLr64/Qm/FbR9HMqc0GXxfRNwWmzmxY/wEdzeYb9CSNV65hGyuYHrgSKg
 qMNU8c1gnxvux9PT1uni9f+YPD9Ht4DQsjWRVyssGlyOFs2fMblK4qs36O5fYYbvg6fNX51eKEB
 GOJeMqfIeHCSd8srntmXzs1/JjYr05G7ThCbGIpsqsqGNtl7EVgvnRtWXz2PFfJRLaW+7GCCgpY
 1ZKl1iq3NRhwhKbuJboQdmp0WBTPka5+WM1zuZQ56GxsdCu16ypzzvAY3r9viFgFtRaNzs60I1E
 sTisQPt6J0+xBNnSMLfigBm71OK3SYT+QUuvqFm1TzF45lx/GfoU+7vKF9vz5s6oAuoFSs6id2I
 qYpXAx4krNkQVjGUKhQ==
X-Proofpoint-ORIG-GUID: 9LHjzmXdDboxbgJlCIZsDEPo5RWC6cH_
X-Proofpoint-GUID: 9LHjzmXdDboxbgJlCIZsDEPo5RWC6cH_
X-Authority-Analysis: v=2.4 cv=M7hA6iws c=1 sm=1 tr=0 ts=699801b8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=JSultybHC8KXmU0xdnMA:9
 a=LBBtDQzjK0eT1O6I:21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200052
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16983-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-0.997];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AE8A9165068
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
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 89 ++++++++++++---------------------
 1 file changed, 33 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 860b118391ed..256f9ee350eb 100644
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
 	 * Get IP address of the traced function.
@@ -920,9 +898,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		EMIT(PPC_RAW_STL(_R3, _R1, ip_off));
 
 	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
-		/* Fake our LR for unwind */
+		/* Fake our LR for BPF_TRAMP_F_CALL_ORIG case */
 		EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
-		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
+		EMIT(PPC_RAW_STL(_R3, _R1, retaddr_off));
 	}
 
 	/* Save function arg count -- see bpf_get_func_arg_cnt() */
@@ -961,20 +939,19 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
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
@@ -988,7 +965,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 
 		/* Restore updated tail_call_cnt */
 		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
-			bpf_trampoline_restore_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
+			bpf_trampoline_restore_tail_call_cnt(image, ctx, bpf_frame_size, r4_off);
 
 		/* Reserve space to patch branch instruction to skip fexit progs */
 		if (ro_image) /* image is NULL for dummy pass */
@@ -1040,7 +1017,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		EMIT(PPC_RAW_LD(_R2, _R1, 24));
 	if (flags & BPF_TRAMP_F_SKIP_FRAME) {
 		/* Skip the traced function and return to parent */
-		EMIT(PPC_RAW_ADDI(_R1, _R1, func_frame_offset));
+		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_frame_size));
 		EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
 		EMIT(PPC_RAW_MTLR(_R0));
 		EMIT(PPC_RAW_BLR());
@@ -1048,13 +1025,13 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
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


