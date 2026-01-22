Return-Path: <linuxppc-dev+bounces-16164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HDQGpKUcmksmQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:20:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369C6DAAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxv985l3Qz2xJ5;
	Fri, 23 Jan 2026 08:20:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769116812;
	cv=none; b=UBtIX38H383iHGBFYyK6FA82HS8Odagdrav5tYRF8+m+npfwjsqxpnhiigGrOyZwV+XDYwEy3ktj1bA3spDQiPYI5NnFLi/NaLKjK/+Mt98u2v1esqKh9vEkxIjAxQOBGq+hQCafHeCezXSyB5uOBZ1RQvByCbeADFafRqfgyjT0zbqnAkj8drVXs6iXORy4Yur6VhgMySNcfGZzjyVQmsnRTEC0nRDukiva+cZdTUprWf5v6ngxe/4oWK4AVlML6JH33LZQgV1vlu1xmt6ANE8TzqkKJJ7Q+mNCy/+jgkyn1fK4YNY+958v2egeCD3GRQerbchxTPvPzzHxF27yCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769116812; c=relaxed/relaxed;
	bh=MPzPgODU9C1SaV13CIbivxyR0sJHglUD9W4BPeaLFVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyEKG/Ru9ovtOqNqpW4HS8nsccoa5WbbQXSDVKSdJQkmDPrFTCjA4/s1WuUH3X7C2q/KtZcqcE6uWJ1Ul/AZSsF4E/Ufpu6VWrnNHv9cPpSCv9Cfi4aLDQD2MyHaSMbCT+4fetuaix1t/zRIVHMA9H8yTNhPzm8vGERyugcJh1wDHBZXsQsOFMlMwmcc3j8YYhVJfzFeNqBpPJEuMlK8YVAi7mKxO97boDm+mJ2sSiuGV5esvMJDu8lWHb89BtJLwNnhItvmBrULkROrT29JuIp8dckt5JGN6idgHjVHbktrOMWlCc643Yqm1p81rBM0JOLm2JfC4laHyrjtky6EOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rK7guGYC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rK7guGYC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxv973xhNz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 08:20:10 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60MIHTON005600;
	Thu, 22 Jan 2026 21:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=MPzPgODU9C1SaV13C
	IbivxyR0sJHglUD9W4BPeaLFVM=; b=rK7guGYCdxa7p78VyELOyl8R4J8kojmhS
	X8zf84E07KVqYM5x51cvfIghHtd49AvfqzcAHDcIT7d2Ober4yxjbH1jTSZsf/BM
	ewdsBd/5a0uMEzVe1Klq9pWD4UbpcKI5eFjjFE3p3M4P9qGArvKkdBW10yPt5sHD
	Lkc2xFFHCRHyAeApLMuRbvEUJtGp0o/7BQLKXLvV8zvtUcm4coYzTXglYftUHZz6
	3M08j+Kqsa8VLP/lUzblUYBEr/aUh7ubll/pGYAFXBI1mVEE6T8IQxpknw5w9M5t
	3n5Gb+042fMble+t0bJb48KZT0aWnJ/TA6WRZH989/hPH7AfKoEaw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bus1prq5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:19:25 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60MLJPwp003674;
	Thu, 22 Jan 2026 21:19:25 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bus1prq5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:19:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60ML5sWv027298;
	Thu, 22 Jan 2026 21:19:24 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brnrncy15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:19:24 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60MLJKfm50332150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 21:19:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E9C22004D;
	Thu, 22 Jan 2026 21:19:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E288020040;
	Thu, 22 Jan 2026 21:19:12 +0000 (GMT)
Received: from abhi.. (unknown [9.124.222.159])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Jan 2026 21:19:12 +0000 (GMT)
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
Subject: [PATCH v4 1/6] powerpc64/bpf: Moving tail_call_cnt to bottom of frame
Date: Fri, 23 Jan 2026 02:48:49 +0530
Message-ID: <20260122211854.5508-2-adubey@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: zq2mBy5psqrjac-qqNpGJXmSd-qqHTfr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE2MiBTYWx0ZWRfX2hqJ/04LgnoL
 QE/pDWYCaCSDdeKNL6DWd/tv2P5Td/j6B5NuPraMCSzd6C27W5AWVLTWCkkKLVAooR2HhbaI68Y
 nE5ixadIAtaMdyM4EtmEcaSbXy2EvjdhJMSDeznHJjQ9X8nEBiHgTgxTKYUaiFsyAP/0Ws8EHKo
 yU8xNqAD6KOTQwDk8Az5JIeBJ9ok/dznl86ZIpSbK6Wt+S5M4HUequ2eDFz8hLaey4E2FirHcxe
 8Tn0Uu6QXt2kbWzolUBtJpAUU4stxPZ+WoSVnlALpwds2Xb+yFI6q0+4f6SRMvsL+9lHvSMur+D
 FxdADlgO7b+dyHZIV7JI1cEDfob31vcVHOAYj88IajWrSgzq+7fHFB4Go9St3R7HWAR5qzwjI4i
 pQEma7/n93dO9YU1ThwaSLmBX3JhACR6/T+mCw3z3rKDIRmiRvgR7KfBT82x7vbcy0KBt4rkFVS
 0pElWas25xg1pYq0wkA==
X-Proofpoint-GUID: 8F6ZPkCXg0Uqm5ii68_r5aQrXU8mfR4S
X-Authority-Analysis: v=2.4 cv=GY8aXAXL c=1 sm=1 tr=0 ts=6972945d cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=ESdMh1-tTcp0eb2Uk-UA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_05,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601220162
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16164-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.391];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org]
X-Rspamd-Queue-Id: 7369C6DAAA
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

In the conventional stack frame, the position of tail_call_cnt
is after the NVR save area (BPF_PPC_STACK_SAVE). Whereas, the
offset of tail_call_cnt in the trampoline frame is after the
stack alignment padding. BPF JIT logic could become complex
when dealing with frame-sensitive offset calculation of
tail_call_cnt. Having the same offset in both frames is the
desired objective.

The trampoline frame does not have a BPF_PPC_STACK_SAVE area.
Introducing it leads to under-utilization of extra memory meant
only for the offset alignment of tail_call_cnt.
Another challenge is the variable alignment padding sitting at
the bottom of the trampoline frame, which requires additional
handling to compute tail_call_cnt offset.

This patch addresses the above issues by moving tail_call_cnt
to the bottom of the stack frame at offset 0 for both types
of frames. This saves additional bytes required by BPF_PPC_STACK_SAVE
in trampoline frame, and a common offset computation for
tail_call_cnt serves both frames.

The changes in this patch are required by the second patch in the
series, where the 'reference to tail_call_info' of the main frame
is copied into the trampoline frame from the previous frame.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  1 +
 arch/powerpc/net/bpf_jit_comp.c   | 15 ++++++++++++---
 arch/powerpc/net/bpf_jit_comp64.c | 31 ++++++++++++++++++++-----------
 3 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 8334cd667bba..9f6ec00bd02e 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -24,6 +24,7 @@
 
 #define SZL			sizeof(unsigned long)
 #define BPF_INSN_SAFETY		64
+#define BPF_PPC_TAILCALL	8
 
 #define PLANT_INSTR(d, idx, instr)					      \
 	do { if (d) { (d)[idx] = instr; } idx++; } while (0)
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 5e976730b2f5..d51c696221d7 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -604,8 +604,8 @@ static void bpf_trampoline_setup_tail_call_cnt(u32 *image, struct codegen_contex
 					       int func_frame_offset, int r4_off)
 {
 	if (IS_ENABLED(CONFIG_PPC64)) {
-		/* See bpf_jit_stack_tailcallcnt() */
-		int tailcallcnt_offset = 7 * 8;
+		/* See Generated stack layout */
+		int tailcallcnt_offset = BPF_PPC_TAILCALL;
 
 		EMIT(PPC_RAW_LL(_R3, _R1, func_frame_offset - tailcallcnt_offset));
 		EMIT(PPC_RAW_STL(_R3, _R1, -tailcallcnt_offset));
@@ -620,7 +620,7 @@ static void bpf_trampoline_restore_tail_call_cnt(u32 *image, struct codegen_cont
 {
 	if (IS_ENABLED(CONFIG_PPC64)) {
 		/* See bpf_jit_stack_tailcallcnt() */
-		int tailcallcnt_offset = 7 * 8;
+		int tailcallcnt_offset = BPF_PPC_TAILCALL;
 
 		EMIT(PPC_RAW_LL(_R3, _R1, -tailcallcnt_offset));
 		EMIT(PPC_RAW_STL(_R3, _R1, func_frame_offset - tailcallcnt_offset));
@@ -714,6 +714,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	 * LR save area                 [ r0 save (64-bit)  ]   | header
 	 *                              [ r0 save (32-bit)  ]   |
 	 * dummy frame for unwind       [ back chain 1      ] --
+	 *                              [ tail_call_cnt     ] optional - 64-bit powerpc
 	 *                              [ padding           ] align stack frame
 	 *       r4_off                 [ r4 (tailcallcnt)  ] optional - 32-bit powerpc
 	 *       alt_lr_off             [ real lr (ool stub)] optional - actual lr
@@ -795,6 +796,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
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
 
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 1fe37128c876..296e9ea14f2e 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -20,13 +20,15 @@
 #include "bpf_jit.h"
 
 /*
- * Stack layout:
+ * Stack layout with frame:
+ * Layout when setting up our own stack frame.
+ * Note: r1 at bottom, component offsets positive wrt r1.
  * Ensure the top half (upto local_tmp_var) stays consistent
  * with our redzone usage.
  *
  *		[	prev sp		] <-------------
- *		[   nv gpr save area	] 6*8		|
  *		[    tail_call_cnt	] 8		|
+ *		[   nv gpr save area	] 6*8		|
  *		[    local_tmp_var	] 24		|
  * fp (r31) -->	[   ebpf stack space	] upto 512	|
  *		[     frame header	] 32/112	|
@@ -36,10 +38,12 @@
 /* for gpr non volatile registers BPG_REG_6 to 10 */
 #define BPF_PPC_STACK_SAVE	(6*8)
 /* for bpf JIT code internal usage */
-#define BPF_PPC_STACK_LOCALS	32
+#define BPF_PPC_STACK_LOCALS	24
 /* stack frame excluding BPF stack, ensure this is quadword aligned */
 #define BPF_PPC_STACKFRAME	(STACK_FRAME_MIN_SIZE + \
-				 BPF_PPC_STACK_LOCALS + BPF_PPC_STACK_SAVE)
+				 BPF_PPC_STACK_LOCALS + \
+				 BPF_PPC_STACK_SAVE   + \
+				 BPF_PPC_TAILCALL)
 
 /* BPF register usage */
 #define TMP_REG_1	(MAX_BPF_JIT_REG + 0)
@@ -87,27 +91,32 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
 }
 
 /*
+ * Stack layout with redzone:
  * When not setting up our own stackframe, the redzone (288 bytes) usage is:
+ * Note: r1 from prev frame. Component offset negative wrt r1.
  *
  *		[	prev sp		] <-------------
  *		[	  ...       	] 		|
  * sp (r1) --->	[    stack pointer	] --------------
- *		[   nv gpr save area	] 6*8
  *		[    tail_call_cnt	] 8
+ *		[   nv gpr save area	] 6*8
  *		[    local_tmp_var	] 24
  *		[   unused red zone	] 224
  */
 static int bpf_jit_stack_local(struct codegen_context *ctx)
 {
-	if (bpf_has_stack_frame(ctx))
+	if (bpf_has_stack_frame(ctx)) {
+		/* Stack layout with frame */
 		return STACK_FRAME_MIN_SIZE + ctx->stack_size;
-	else
-		return -(BPF_PPC_STACK_SAVE + 32);
+	} else {
+		/* Stack layout with redzone */
+		return -(BPF_PPC_TAILCALL + BPF_PPC_STACK_SAVE + BPF_PPC_STACK_LOCALS);
+	}
 }
 
 static int bpf_jit_stack_tailcallcnt(struct codegen_context *ctx)
 {
-	return bpf_jit_stack_local(ctx) + 24;
+	return bpf_jit_stack_local(ctx) + BPF_PPC_STACK_LOCALS + BPF_PPC_STACK_SAVE;
 }
 
 static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
@@ -115,7 +124,7 @@ static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
 	if (reg >= BPF_PPC_NVR_MIN && reg < 32)
 		return (bpf_has_stack_frame(ctx) ?
 			(BPF_PPC_STACKFRAME + ctx->stack_size) : 0)
-				- (8 * (32 - reg));
+				- (8 * (32 - reg)) - BPF_PPC_TAILCALL;
 
 	pr_err("BPF JIT is asking about unknown registers");
 	BUG();
@@ -145,7 +154,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	if (ctx->seen & SEEN_TAILCALL) {
 		EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG_1), 0));
 		/* this goes in the redzone */
-		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_STACK_SAVE + 8)));
+		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_TAILCALL)));
 	} else {
 		EMIT(PPC_RAW_NOP());
 		EMIT(PPC_RAW_NOP());
-- 
2.48.1


