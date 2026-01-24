Return-Path: <linuxppc-dev+bounces-16272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBdgEPGidGnz8AAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 11:46:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 091187D47D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 11:46:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dys0T1xBRz2yDk;
	Sat, 24 Jan 2026 21:46:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769251561;
	cv=none; b=jd4ilhBQEpUzlGkHnDgU2p4zz37YFeaw0LXgwb76/ta2Cc7tltfqA8wo0xlJ413o1bNEKU/WSrnFnjiVNfof4J7cI+tRjrFsiJ0PcbVNfbpfNtB0zWcLnd0KqxIwQEKx6MNxvX3pJ3U4cjZLr9xCcX0+yQmc6Uc4aIbGu5jjmK4KBO1NMFJb2/ucUaJqlgTE9iLQWxZIqe6PdMLa2bpR4cjHUi4cSW0D4aAPtMBfaL9luMZbdggJ1i4vscYvnxIARgo7WuHmnXYsl+UeA7B6DLeQH4bDp6YGsmyvAPd1junF4Fh0grPs6Ym74ez0akFwbY0rfuOGLSpgFo432yfzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769251561; c=relaxed/relaxed;
	bh=UXdPxN0yzQYC1zXtRqHrrTIjvlERtEZxVMk7HfF01xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjvjlsNI9+LjP+xL1CzU/GIzbl7a87GacxVFlOXhQz3Nn8aadKIkVOvJCkG3IpDRb7YK3rGvu3vOR+ek8BFjFVerzTT4bllNL0Q8JTIsWIHQsM3y7h1N+2wfwINi6kpjnQsAJpMBkHiRqGQgjS0u314lBkk+R9q5BOyyLN2jvQft9AxmDNWSQswJuwiuYmKSEbamSen2WFPxAN/u1N0kbqXsGgJy4ttsJRdYvybNIHEkwKEg6kRdXhOgETUxRA0ZjzQ7TBAWonTXIrrqQFs+opuLRccYUUhOtP+w02OhfANNXBOM2endz6t7x4hSJargEHfq+Czr9LcpABg4bJKYKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mm1vQQqA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mm1vQQqA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dys0R6k0hz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 21:45:59 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60O5RSev024443;
	Sat, 24 Jan 2026 07:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=UXdPxN0yzQYC1zXtR
	qHrrTIjvlERtEZxVMk7HfF01xU=; b=mm1vQQqAipr4Psx80BtReaB7rzUE7oQO/
	VebSDCwbT/OVCBZ8YPUxNTeSLvVUHF/yv+bGzlizW6UC/VhnCGzHXWc+1Hxva9lP
	b7+AiKadjrQ51eWygQ1TtwQhDKuaPl8l0csisQlgRBmyHROIVubiajiZJUXHae+y
	zfQU/v+OrQNG8lA/6siEfb7RTrnXoWr8tfHXMrW3T1qr9YXgwcuxWZC3rZfTzj7D
	5MXBrNo/rWs6tebOc70GzkHpXnuOJNopaRMh5OI8fhHTu8CKVaxp56mld69cCTWw
	qgNoS9vFxlcz8DQy5ftlGYfKcWzbns0VxfDey/RjU8hv8ccbzZrfA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr5rjb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:53:09 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60O7r8R7010462;
	Sat, 24 Jan 2026 07:53:08 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr5rjb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:53:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60O24kpu006424;
	Sat, 24 Jan 2026 07:53:07 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brqf24n1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:53:07 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60O7r4Vo47514030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jan 2026 07:53:04 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9BA620043;
	Sat, 24 Jan 2026 07:53:03 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A36120040;
	Sat, 24 Jan 2026 07:52:57 +0000 (GMT)
Received: from abhi.. (unknown [9.124.223.59])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 24 Jan 2026 07:52:57 +0000 (GMT)
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
Subject: [PATCH v5 3/6] powerpc64/bpf: Avoid tailcall restore from trampoline
Date: Sat, 24 Jan 2026 13:22:20 +0530
Message-ID: <20260124075223.6033-4-adubey@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDA2MCBTYWx0ZWRfXyKAdOv1HA5FA
 84DoEfCC1SloNkLxLa+syX9gZPZbEJSl5o8fxx3mKyikDijirNWaPPQ5TVfZpIBasV2o0eWT/EA
 shBgEZL5FSNF3ZkCCes2VZtpPHrp6xzoOi7mGGZcXm9Z+9I2Jy4fnOOFYN+tXZST8vnOO+4Z451
 KbWrWRJOaeNrh/kT9GQ0DU07hOfsQHkAbAmPoRZOe/R7R3kuT6M2OGpZ3S+L87RrEb9gRPV/dgI
 O1QmMVI3KD+Z327VPP/7UsoDHooIHw47dzhanrGTeHcqcdIpYpyK9K48xXR4Xmya82dez/o2319
 PtbOibXjCFZ9c6RHhM2ESjFuDCzckCXfDjGOSqWSMwrnQ/AS1YqCQVbm0P2oEE946Fx0shmeQRn
 FVOMc56dpQPyd78e2030QACHnBblQyHoq5hFQx8SZCd/ixVRyyJH0iZCmjX2RoLjQa52qApLVgW
 3FCFXlFuOW2a84+f5/A==
X-Proofpoint-GUID: zttSLy4Wpu_vInN_j3ZKCS3aXrDsCSxt
X-Proofpoint-ORIG-GUID: PCDTYKd1zuPlntCIjQHjWNKfHLnepz56
X-Authority-Analysis: v=2.4 cv=X+Vf6WTe c=1 sm=1 tr=0 ts=69747a65 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=yUNxoNuUyiXgUDPvJtcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601240060
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16272-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:adubey@linux.ibm.com,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 091187D47D
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

Back propagation of tailcall count is no longer needed for
powerpc64 due to use of reference, which updates the tailcall
count in the tail_call_info field in the frame of the main
program only.

Back propagation is still required for 32-bit powerpc.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 4b18daed054a..f8769d785123 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -659,14 +659,11 @@ static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_conte
 static void bpf_trampoline_restore_tail_call_cnt(u32 *image, struct codegen_context *ctx,
 						 int func_frame_offset, int r4_off)
 {
-	if (IS_ENABLED(CONFIG_PPC64)) {
-		/* See bpf_jit_stack_tailcallcnt() */
-		int tailcallcnt_offset = BPF_PPC_TAILCALL;
-
-		EMIT(PPC_RAW_LL(_R3, _R1, -tailcallcnt_offset));
-		EMIT(PPC_RAW_STL(_R3, _R1, func_frame_offset - tailcallcnt_offset));
-	} else {
-		/* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		/*
+		 * Restore tailcall for 32-bit powerpc
+		 * See bpf_jit_stack_offsetof() and BPF_PPC_TC
+		 */
 		EMIT(PPC_RAW_STL(_R4, _R1, r4_off));
 	}
 }
-- 
2.48.1


