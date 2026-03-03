Return-Path: <linuxppc-dev+bounces-17615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGrdK0gkp2mrewAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 19:11:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8F31F50F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 19:11:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQP4Q3tkcz3cBd;
	Wed, 04 Mar 2026 05:11:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772561462;
	cv=none; b=P3bNMt+HrwlKfp98XpcgpBXJwiOYPwaAabbx6oBDX/oNxKaByezHYSJisr0JEMDoAOnMVYDdUJFPB6Mvf8dYx+lkeMmHRom/niV5j7Ktcfz3WFCOL5V17oMJ7zScRVYAWnTFDhZPwLNJdJGAGUAFjhYi9OrHKiSULtGPsm82eUdMxwi1SdLfwdUnak3VfbSvXyWRAIQY3WnZwV8EWO0DBWB1d9A0YWruVtkNHBI5+7Jm2hTp/UM/Spe9ec2NSM79KfCySPMSC1ijOyCX79BLFBLL+ldkBWFQLSZ9tyVgcfrZnrF04gAx7UjJ6wRgOgbhooKKT9VaNCjUVRJhqnCGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772561462; c=relaxed/relaxed;
	bh=8nJHViOeuJbakz8l0Jn8FCq6DebAaxUKHuJSMkFK8v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3RV5HF6FRFGC2k/jHz5hl4auLLUvcaGBrfK9UzxMcHDHm4vy8XGNIJjQ9HNmup11dd2SxsvfQQqXMbZRxdjw9lcrl15lco+IAYL5hT0HEjp5YSepMTsLbXgSzfNSxs+muEEdJNre6c2KPfojSRql0/pK+23Lvda/ZQ6UB9nvFfUodh8duFZhO5kpLnUqSf+/dDpRXf1rLwPdT0B+BdBUbF/9+4q4qOz2q/VpkJpyNs19LaO8bBMXiKV5K72eC3bJClwKtTDs7v5KDUHe3jsNhYRpd9PHS2nyXYRvyE1HriomD27iseWdiSLbrROmiGSVR742URK5O+Wuc6p61w7EQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XFx6z/QI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XFx6z/QI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQP4P5GZPz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 05:11:01 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235YF431787677;
	Tue, 3 Mar 2026 18:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=8nJHViOeuJbakz8l0
	Jn8FCq6DebAaxUKHuJSMkFK8v4=; b=XFx6z/QItC1laz3YSJC6EVqym48QL+UL0
	YEDIzD0JRcu9ha/hSsP2HtlTwRKKy8fqxab/xy3WTm2CGqXvNXtfmdk8dahEg475
	rbo+JZUGiPNRklfr7rwOmLkNnVl1iJs4INynj7ajKZAPRSsa60E+Wf5kZ9pHwAcH
	+WCA/xBFKKYgvtCc/ZR4aAcFZ67nbpj1M6Ry5tk6G2EQgij11KD0nWmHgsPjRvJQ
	e/Z+9Q7JKpbJ0IbrAmU6Ss9d3E1Qg2A+WrsOZ8/v183oTgRFF393lFLtyyF8sFR2
	CLmC3ZBX8LjE+qBMXY/COhk9dFQg28EnivywvMv5TLFZoprwMFf+w==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssmm132-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 18:10:46 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623ENRfn016384;
	Tue, 3 Mar 2026 18:10:46 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmbpn3fqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 18:10:46 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623IAgEM15073748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 18:10:42 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15CE820043;
	Tue,  3 Mar 2026 18:10:42 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA33320040;
	Tue,  3 Mar 2026 18:10:39 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.53.81])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 18:10:39 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v4 3/6] powerpc64/bpf: use consistent tailcall offset in trampoline
Date: Tue,  3 Mar 2026 23:40:27 +0530
Message-ID: <20260303181031.390073-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303181031.390073-1-hbathini@linux.ibm.com>
References: <20260303181031.390073-1-hbathini@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0NiBTYWx0ZWRfX+8hn+FKx7Qpb
 kNREVRr4tTZKYwq8f6aoGyR0cApgT1KtM85x9jQvgX/vJ5FKWnwmVvzj33V8sMfujYNoZHhka3t
 yRFyeeOYZCn9xzyQZY9sPuNCNlCcr9aJCX8ghEgmJHugZnyZ/y8I11blU9jOPtOCxner+5qaeuQ
 E4GpMtt9WnD/uTzczLTlQ5WWBHNw1v6xoGdc0BRaeHbk0OFo208VfL3a0XVQy5MQiLcQ+NCfDIQ
 JCqVFet+E9HAneECdXcC42G0Zc4Xb/JaTsZqY11xPCKPVpqXksDkzT/MvWS6t53lc3vSUnx+Ic1
 h2Mh5JDbr0QuihBWDcKK/O8RKK2vLCyk07MR5kfvI5Tkr1ydFp9WDgLiveQATS/ScKelaJKM2hx
 VgNdA/TomClR2/mb4ZztO8PGpKMVzkCvqyoSp4Mo1Aegz55Cq+tLWaH6ky+93U1dtZSusrMSJFI
 vr7ISxclx8pjNWkCJHQ==
X-Proofpoint-ORIG-GUID: yXxOFM15YsuYBg3oAE8lsow2gzXUGXQk
X-Proofpoint-GUID: yXxOFM15YsuYBg3oAE8lsow2gzXUGXQk
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69a72427 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=mg7oJYEXke3Tg0AfzmQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030146
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1E8F31F50F8
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
	TAGGED_FROM(0.00)[bounces-17615-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Ideally, the offset used to load the tail call info field and to find
the pass by reference address for tail call field should be the same.
But while setting up the tail call info in the trampoline, this was
not followed. This can be misleading and can lead to unpredictable
results if and when bpf_has_stack_frame() ends up returning true
for trampoline frame. Since commit 15513beeb673 ("powerpc64/bpf:
Moving tail_call_cnt to bottom of frame") and commit 2ed2d8f6fb38
("powerpc64/bpf: Support tailcalls with subprogs") ensured tail call
field is at the bottom of the stack frame for BPF programs as well as
BPF trampoline, avoid relying on bpf_jit_stack_tailcallinfo_offset()
and bpf_has_stack_frame() for trampoline frame and always calculate
tail call field offset with reference to older frame.

Fixes: 2ed2d8f6fb38 ("powerpc64/bpf: Support tailcalls with subprogs")
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* No changes in v4.

Changes in v3:
- BPF_PPC_STACK_SAVE macro definition adjusted as suggested by Abhishek.


 arch/powerpc/net/bpf_jit.h        |  5 -----
 arch/powerpc/net/bpf_jit_comp.c   | 12 +++++-------
 arch/powerpc/net/bpf_jit_comp64.c |  5 ++++-
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 82bbf63f0e57..7354e1d72f79 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -81,9 +81,6 @@
 
 #ifdef CONFIG_PPC64
 
-/* for gpr non volatile registers BPG_REG_6 to 10 */
-#define BPF_PPC_STACK_SAVE	(6 * 8)
-
 /* If dummy pass (!image), account for maximum possible instructions */
 #define PPC_LI64(d, i)		do {					      \
 	if (!image)							      \
@@ -219,8 +216,6 @@ int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg,
 int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass,
 			  struct codegen_context *ctx, int insn_idx,
 			  int jmp_off, int dst_reg, u32 code);
-
-int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx);
 #endif
 
 #endif
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 95f208229b09..a4aa1e4c9f1c 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -642,15 +642,13 @@ static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_conte
 						int bpf_dummy_frame_size, int r4_off)
 {
 	if (IS_ENABLED(CONFIG_PPC64)) {
-		/* See Generated stack layout */
-		int tailcallinfo_offset = BPF_PPC_TAILCALL;
-
 		/*
 		 * func_frame_offset =                                   ...(1)
 		 *      bpf_dummy_frame_size + trampoline_frame_size
 		 */
 		EMIT(PPC_RAW_LD(_R4, _R1, func_frame_offset));
-		EMIT(PPC_RAW_LD(_R3, _R4, -tailcallinfo_offset));
+		/* Refer to trampoline's Generated stack layout */
+		EMIT(PPC_RAW_LD(_R3, _R4, -BPF_PPC_TAILCALL));
 
 		/*
 		 * Setting the tail_call_info in trampoline's frame
@@ -658,7 +656,7 @@ static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_conte
 		 */
 		EMIT(PPC_RAW_CMPLWI(_R3, MAX_TAIL_CALL_CNT));
 		PPC_BCC_CONST_SHORT(COND_GT, 8);
-		EMIT(PPC_RAW_ADDI(_R3, _R4, bpf_jit_stack_tailcallinfo_offset(ctx)));
+		EMIT(PPC_RAW_ADDI(_R3, _R4, -BPF_PPC_TAILCALL));
 		/*
 		 * From ...(1) above:
 		 * trampoline_frame_bottom =                            ...(2)
@@ -666,14 +664,14 @@ static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_conte
 		 *
 		 * Using ...(2) derived above:
 		 * trampoline_tail_call_info_offset =                  ...(3)
-		 *      trampoline_frame_bottom - tailcallinfo_offset
+		 *      trampoline_frame_bottom - BPF_PPC_TAILCALL
 		 *
 		 * From ...(3):
 		 * Use trampoline_tail_call_info_offset to write reference of main's
 		 * tail_call_info in trampoline frame.
 		 */
 		EMIT(PPC_RAW_STL(_R3, _R1, (func_frame_offset - bpf_dummy_frame_size)
-								- tailcallinfo_offset));
+								- BPF_PPC_TAILCALL));
 	} else {
 		/* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
 		EMIT(PPC_RAW_LL(_R4, _R1, r4_off));
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 44ce8a8783f9..7655be76f537 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -42,6 +42,9 @@
  * exception boundary.
  */
 
+/* BPF non-volatile registers save area size */
+#define BPF_PPC_STACK_SAVE	(6 * 8)
+
 /* for bpf JIT code internal usage */
 #define BPF_PPC_STACK_LOCALS	24
 /*
@@ -148,7 +151,7 @@ static int bpf_jit_stack_local(struct codegen_context *ctx)
 	}
 }
 
-int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx)
+static int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx)
 {
 	return bpf_jit_stack_local(ctx) + BPF_PPC_STACK_LOCALS + BPF_PPC_STACK_SAVE;
 }
-- 
2.53.0


