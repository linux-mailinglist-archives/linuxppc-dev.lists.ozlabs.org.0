Return-Path: <linuxppc-dev+bounces-16264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qERJBrR6dGnU5wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:54:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3A47CEA6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:54:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dynBS5JRdz309S;
	Sat, 24 Jan 2026 18:54:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769241264;
	cv=none; b=Rnx26esmr7hQgWpMiKw1KKpFn9QTZ+Jb7JHdmYyWdgoaaNnVp0gJq1Vd3rdANTM0msjhZ8qbt4m0tMsFqIeQedaHqdsrRAQx46LUJ4WE4oQjyHy2wNMuUw9AaYSx3e+M1QZWN0mKuqaoruZvFPYxyPQdA8qogUpKwidR1vpvV/jKStyOzuvRRWCtVseqJLId4r9iruwvQhbXFNsHmyRxrbsedEznP1rPtXIUrwMXys0lq6ZSBNcbX7gBsZlmJb4/qthTAOzO87UgOLtTBj7UqUYMdGnNnD9DpO4tWji8J59leMgbIO91/R5U0R+fm3NvPsJa0ipQlWY/FaByX3f1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769241264; c=relaxed/relaxed;
	bh=ZQvpxZmGfyMOLJXKlM5mxfJFZy3MusBPwW32+h9PHUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iV2i1ua2j0wAFYCt3LsvIU3x8o+ycsAe3TvMGt5jBDOHGrj6S+f2NwMlXPcTEdg2u+p6Kw1GcJCKyAXtLEmGzrm/Q+OKsUh7dqh75tNynNEw4mvRuTS0DvxU3kP7u31qqYf8K7NbtjExlLTznJdZw5xvq5DiUsWm0LhODgdlcVvlu38CcCq0ET7iTJt6OQbErj8xxfRaBVA6JG8NaG+Gnrxk5MMxXwovJBwjx+NksI31JcauAONU+v3yfSiMkQwsKQG0KMHxp2/QcR5iEAKoSoFLt0CuPPwF5it/hD3yzcWU3yDSvexg8xVCDbc/61hc8sjx19rM3w2x0Q7ak0Fayg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iZODewMP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iZODewMP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dynBR3wXpz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 18:54:23 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60O4GdUq001887;
	Sat, 24 Jan 2026 07:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ZQvpxZmGfyMOLJXKl
	M5mxfJFZy3MusBPwW32+h9PHUk=; b=iZODewMPvE1+mEcEDI7Zj24ohOCg+n+uX
	Ee/nVLUTsDqNdAvXScZFLwT8wsUPdKk/MNdxG2aJ+cICd6E4CpEQfFOt5xigrLwo
	MSAxVENnCnBYJFW9sUVdkealTl0V7J+2NC1Ijwz+SCVDWwHHeuadtp0vYNW5HZEU
	9ZJgNDxZTK/8dWLX9B+Hg95tb4RStFCT0S17XdhbEcGcU1mRzP4f4jO612pDYyd9
	5aTLbuC/rPEvvqDz+hW4Z/sqkn0Uu8AVd2w5Azlq39aV+JV0+Kzgc7MIjKyyw1Qm
	DnAGbqKX2fTB6yO6EoH2Fb127/agSmpGb9Q4jvAOtVtoJzattGCrQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrt0qc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:52:53 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60O7qqW4000441;
	Sat, 24 Jan 2026 07:52:52 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrt0qc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:52:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60O2j3U5001168;
	Sat, 24 Jan 2026 07:52:51 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brpykcr6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:52:51 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60O7qmCt28836464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jan 2026 07:52:48 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E31DD20043;
	Sat, 24 Jan 2026 07:52:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53E6520040;
	Sat, 24 Jan 2026 07:52:41 +0000 (GMT)
Received: from abhi.. (unknown [9.124.223.59])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 24 Jan 2026 07:52:41 +0000 (GMT)
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
Subject: [PATCH v5 1/6] powerpc64/bpf: Moving tail_call_cnt to bottom of frame
Date: Sat, 24 Jan 2026 13:22:18 +0530
Message-ID: <20260124075223.6033-2-adubey@linux.ibm.com>
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
X-Proofpoint-GUID: nviSkfJrbQ322s3xSIEJIbDqwWDFVxuT
X-Authority-Analysis: v=2.4 cv=Uptu9uwB c=1 sm=1 tr=0 ts=69747a55 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=CgeYeB0JMTkxdtrR0HIA:9
X-Proofpoint-ORIG-GUID: LmBQxAACTNRXwkePuXyfuLglS-jFqN_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDA2MCBTYWx0ZWRfX+0fHpFAdGe/T
 +scmTfvhsW7uyQhWpneI58+Q+E4FlFpbBTU2Plq6VzbrfMrMCrj9ONa6+Lhv7H2zWFAFDDfI+b9
 5O3YmwLuR4Kz3zXkZSbVbnNiXiKE5UhXE2k+RSC9nkKvhTJvLhQT/fspxi9dvtrg03awtJ26goz
 A5uwz2Fqb5gOn0TpWwVCH7rSSBZg9bTu6Y7hWh5UCYHklLcAZhjKWQPPtwz574BuGNZL4DioYb6
 MV1E3P9mc81CX+4wHyZm7T0rgJQNVzy/LDZaWVIl1txZi9jRrYYN0E8BK62TKpmnBN+4tBQqY2w
 of1g+lY19426eO2VNf7ff2T+7w+9LV8XOe6IKmhkOSrK3V150W9eYnTyNXfQ/ecVRg3JygsPV+j
 puhCCTUG/nplnkyaXcQXb76+5a7rPHiQRVmXVk94Ajb6gkYR94y470sphMm48IV/0b6yQoF6LM2
 i/r0bH/jDaP6w8K5fFw==
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
	TAGGED_FROM(0.00)[bounces-16264-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2F3A47CEA6
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

To support tailcalls in subprogs, tail_call_cnt needs to be on the BPF
trampoline stack frame. In a regular BPF program or subprog stack
frame, the position of tail_call_cnt is after the NVR save area
(BPF_PPC_STACK_SAVE). To avoid complex logic in deducing offset for
tail_call_cnt, it has to be kept at the same offset on the trampoline
frame as well. But doing that wastes nearly all of BPF_PPC_STACK_SAVE
bytes on the BPF trampoline stack frame as the NVR save area is not
the same for BPF trampoline and regular BPF programs. Address this by
moving tail_call_cnt to the bottom of the frame.

This change avoids the need to account for BPF_PPC_STACK_SAVE bytes
in the BPF trampoline stack frame when support for tailcalls in BPF
subprogs is added later. Also, this change makes offset calculation
of tail_call_cnt field simpler all across.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  1 +
 arch/powerpc/net/bpf_jit_comp.c   |  6 +++---
 arch/powerpc/net/bpf_jit_comp64.c | 31 ++++++++++++++++++++-----------
 3 files changed, 24 insertions(+), 14 deletions(-)

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
index 5e976730b2f5..de1adc0b1157 100644
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


