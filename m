Return-Path: <linuxppc-dev+bounces-15255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E62DCF3131
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 11:53:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlB3v6rc8z2yhX;
	Mon, 05 Jan 2026 21:53:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767610411;
	cv=none; b=BXnA11w7QfIanHHr1B9cICy6F2M+O4UQmZV9qoMFBggzHGTTneXYEDWV0CQh+uRKbgfI+P75Dfaljs1J4wSaF5IlTJIrTHoeVCkgwUP97w9YeESbFAQG/NBv8EH66EtOoPPz9UZmc6/khqLpLbc6luRWUyKVg6f+GdcTjw6YHuv7RjK1BRAzDn+T5R4W1zXCQJ0GYUHbnC3yGG4GVYcVJw/oDOq1Ih3qECeRffYN6aq/s45ClMWIQiSh4IErCAMX3qYs1KzsPqFatBQ8uU2eDH2ZrtcxT6CRstlop+0Lfol7sagXjhp6vdxvnFN/rko/Uu00twtYgcBt5P5yGkSlfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767610411; c=relaxed/relaxed;
	bh=wzBaK8qWCdkqUY3g3Sj7Uoi09hD+8UHUGtCXe7xrww4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKYA/8I6VeLtml7xYqKfX1QkRi+WXUyGyCJtdtK9Z/ba2yzF7nSSf+BA6anA9NRRz81MTj/jp8azOb+Dx9Wnl8gkCnSr6gftUninCdHKYFKhm4ELI0mXnM5tc1EDq19bDK8ihf/QESbleC960ugzvA1ksZyEbUwYP7Oszc8AgiEdgbGMvexdP3YrkjCPdTAziJIw1w3JLy4uSF4CF1QS/kbT2dmK9GBAuRrgi+pcINNtYomboytVyov+9LnWhtiLp33pqrr/nSK9oFRWxEJyMnCo8dhHVleFoLPbA/atcLt7c96qFUBCt9sZ+nqudsWPsyDZecjw754T6zNXRsie5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XWSIeIo0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XWSIeIo0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlB3v1SNSz2yft
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 21:53:30 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 604GPB0w026573;
	Mon, 5 Jan 2026 10:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wzBaK8qWCdkqUY3g3
	Sj7Uoi09hD+8UHUGtCXe7xrww4=; b=XWSIeIo0bW23L4gDlGvrs5W+b77vSVXhJ
	K0m+iqZK9PbxvJOhDyt9bpOEQl2yXRr800GY93lyP/SkAe+/MtCyeP4Av9ulC34+
	8HKeselPnsN56tiNTYAyCgROnHmSOa7Q1rJXgCzD/6Atpq0PToasqvqqndEXQijK
	6VBR01d/LUx5/tdFSGLTcqCq5QoX+VMePHq++YnCWtc4lujmoR1fMh4qXCBNTMM7
	9/0N1wwWgKShkeRc9hNm1wx2mb4IPR3mW8eLnBr6KLGQG4OoGTlSNwzXHfwXp3Ek
	3upNx9Eno3yZasVsS0zRwyN8MZQemtIpb5m+VLfvGWVTIcqhgr2Fg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betrte68c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 10:53:04 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 605Aflws021848;
	Mon, 5 Jan 2026 10:53:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betrte68a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 10:53:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6058CIJB019161;
	Mon, 5 Jan 2026 10:53:02 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bfg50w08b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 10:53:02 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 605AqwGm35717390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jan 2026 10:52:58 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B296E20049;
	Mon,  5 Jan 2026 10:52:58 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D39E520040;
	Mon,  5 Jan 2026 10:52:52 +0000 (GMT)
Received: from abhi.. (unknown [9.124.213.127])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Jan 2026 10:52:52 +0000 (GMT)
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
Subject: [PATCH 4/6] powerpc64/bpf: Add arch_bpf_stack_walk() for BPF JIT
Date: Mon,  5 Jan 2026 16:22:10 +0530
Message-ID: <20260105105212.136645-5-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260105105212.136645-1-adubey@linux.ibm.com>
References: <20260105105212.136645-1-adubey@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=aaJsXBot c=1 sm=1 tr=0 ts=695b9810 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=ovcAVf-9gG4EF5hqTukA:9
X-Proofpoint-GUID: 1uSL2weSR1s7cYHIVMHughtrBm0l5nTR
X-Proofpoint-ORIG-GUID: tpHHNSAoaRePyi43WYGB6w5odCvUn63K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA5NSBTYWx0ZWRfX24Ob40dEZRU3
 4OeIU1sWWHJj6V9Ero72BF35800d8+4vHVBb5/GIWkh6/A8enM+2p3FpVBtboHL7CXeLyHHfjRa
 e+vsHPd4noSEadDT4UhV0ZdKRJcnhgLDE0wM9RO0dtrt0cRAAkUj8xOf48bd9nykQcr/aUaJSbM
 +ATcObndzJHpS18pdsTW9Js2Dm2BYaDmMszLAjm0Xna0fb+3PpuNLfTdyILL0tHFphqMbL+yZq8
 jtdBTVE/OvLB19fnSklIaDf5LduA/O6Z8EQAc9mNgRkjr4/h19ws/d/UnVzU2fPfT/vC9l/qNaV
 OpXlxhCPA6yKWI2tMAMznNBhj3cr/S6XemSthsGMcJl2avlrK4X90bVnoCC+VTOAcVjUP1OdJlf
 Fz9weRbgutZEG+S508m7SEsKchu4VSqtbDBXrJw6txutUxu4UVYEwKIPAZcPYev8Lgou8gwcjEX
 OEWHq7uYip4Xt6eUMqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601050095
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Abhishek Dubey <adubey@linux.ibm.com>

This function is used by bpf_throw() to unwind the stack
until frame of exception-boundary during BPF exception
handling.

This function is necessary to support BPF exceptions on
PowerPC.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp64.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 37c547b49da8..0f3af67914d6 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -237,6 +237,34 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	bpf_jit_build_fentry_stubs(image, ctx);
 }
 
+void arch_bpf_stack_walk(bool (*consume_fn)(void *, u64, u64, u64), void *cookie)
+{
+	// callback processing always in current context
+	unsigned long fp = current_stack_frame();
+
+	for (;;) {
+		unsigned long *frame = (unsigned long *) fp;
+		unsigned long ip;
+
+		if(!validate_sp(fp, current))
+			return;
+
+		ip = frame[STACK_FRAME_LR_SAVE];
+		if (!ip)
+			break;
+
+		/*
+		 * consume_fn common code expects stack pointer(sp) in third
+		 * argument. There is no sp in ppc64, rather pass frame
+		 * pointer.
+		 */
+		if (ip && !consume_fn(cookie, ip, fp, fp))
+			break;
+
+		fp = frame[0];
+	}
+}
+
 int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
 {
 	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;
-- 
2.48.1


