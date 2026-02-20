Return-Path: <linuxppc-dev+bounces-16984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP6tAecBmGnC/AIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 07:40:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA24165070
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 07:40:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHLGN6PmJz30MY;
	Fri, 20 Feb 2026 17:40:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771569612;
	cv=none; b=AgjbYl03GVQTpaJPnf3Y0KExMNr0p1ZAtMRalx9BPA3Sdr/WIBcqm7Zrd0KWdZZU7l30l5TUemviH242jVd9Ys5O8zQPGFOV6M0hvgKtHW80itXf9pRHlHpi9vsjMRTvcMQSbrCX8QJQV37GDFiqe85ThJ49oEW3+jO9ZyJxg1IZrqHuE5uVCN3DQ8KWRdzAG1oq7rZbFsr44QY49waLR/5AKE+i8bSMsPS2iwQxryCRTM3wrhOUJJp4/Sfj3JsTirgqaAcrMSdhZ2qsuSl7nGWR+Bxol13n5kguzdwIb0XyU48ripMfNPWk+JsB49BZa22LWHClrbfkHlW4tshEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771569612; c=relaxed/relaxed;
	bh=2+9mlsiduBw35d/lTGBdAsaqZYDgMRu4w9CpMRPeudA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgvO1U2O+5K3wDrrIVGy4QsSFg0sEVwtdJY7PuvUaw5NhP8XZiYivVSeRJMs3PMO6aZvHq7HFCEwYYPsGcq1/7w9ucHZ0vPNzkIEG/kHJT4pLtZLUt2irETK8GN3kqa1sHdBYCdPK3FnDr7Bv4cLys31CxyRpvThQhOPtiI436EvqlcpmyR5bQ5DzFP6nrKZk9633LqM+5r+bIgFmGlN/BzWqUUs14509jm7gc+5f0uxSJDERZ0a8YEloycX/RieAZHtMS8JOui1tKH7R5r+idyft/ON5sJmdUonGfECpqhEl6pL2BQPAr8l4giVLW+0WEtUpqCTZdKYl8qRo5yKKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EXJL5gg5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EXJL5gg5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHLGN0gqRz30M0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 17:40:11 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JMLlQo1260085;
	Fri, 20 Feb 2026 06:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=2+9mlsiduBw35d/lT
	GBdAsaqZYDgMRu4w9CpMRPeudA=; b=EXJL5gg5uvgk7DMnyQ2hD4kxtszEU9Rym
	jvU0paDxZiiC1OCrRbUOYgFktOKHTGN66SYKL+qBCtjqY5ULuyVrjpECV3uuXQ/1
	Wjo2QEIlzgXQf2wsLyYRgftLrG5mesEBDmijAMwCdYG9bgKsb8Rll/hoD2pkyEav
	w0nfvG3DadSRNE9gefJ1tWls+ch48uf4iQKMN+hRq2ZI8J3E8VeyCvbJ2DjixvTx
	HoJpjI30k3agwhc1NM9x+eJVyL/7eT36+U/t2hv7sZ9f+uxKHhNSL1+4i0Oozc5o
	lcpmmnsrEEaDEZuAGIPLWhlE7OC8Sz9DnIQSMTaCKPzeWaaafCiZg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj6s9r5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 06:39:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61K3ACSS011916;
	Fri, 20 Feb 2026 06:39:54 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ccb277ear-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 06:39:54 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61K6doSY51708410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Feb 2026 06:39:50 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7506820043;
	Fri, 20 Feb 2026 06:39:50 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 365BC20040;
	Fri, 20 Feb 2026 06:39:48 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.64.63])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Feb 2026 06:39:47 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>, bot+bpf-ci@kernel.org
Subject: [PATCH v2 5/5] powerpc64/bpf: fix handling of BPF stack in exception callback
Date: Fri, 20 Feb 2026 12:09:33 +0530
Message-ID: <20260220063933.196141-6-hbathini@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=dvvWylg4 c=1 sm=1 tr=0 ts=699801bb cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=zlExV_OUcOsWLKDeu1IA:9
X-Proofpoint-GUID: I0LjKGbpDrWcGxBk7qMf8NH9x2oN6YXN
X-Proofpoint-ORIG-GUID: I0LjKGbpDrWcGxBk7qMf8NH9x2oN6YXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1MiBTYWx0ZWRfXzcbEIUa/2U3j
 UCihGZyZwBYBlUyfAsHGJko3P8de94ZffYUp5I1PTl07J998TB5maXSJlzrVZcXpGNP8Zkqs6pg
 ZBl0u4yfIPbnDS5VB8dBZLGYZ9oQX5PYg5nDCagV7WEKPI9m+4cJ8bhVHNmE/a/ovshSqZHgFxo
 lGCRwbjxRwbiiN5k3zJJo3apw9QLgLgHdmdUfJzZj4wTVsBOirP9VqQLIV8IRU+xC3pqw2ZCPNR
 PqZ48/Y74mru+CcJtQZEJUAygo5cE6El/oAe2UwfmQrZbBlP5XkbqbTYmIdqY0XRlgPqW1d/P/k
 AupSgE0Cm+nLWXf+J/3aWmm3vFxOz2IOBZnYMnK5OmZcw2ebt3Rm3aLTy4iRtvbre2HeF0lhWrF
 i/ymK34Rt60z3HkZKfvvaWFfkNaJiBnW6YsTh0FI4aFbrL/bb0D3DgKiQSGI6Fl0HcRPImfvlo1
 1Jc5+9OaedUoLuEaqpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200052
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16984-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.994];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	TAGGED_RCPT(0.00)[linuxppc-dev,bpf-ci];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4AA24165070
X-Rspamd-Action: no action

Exception callback reuses the stack frame of exception boundary. When
exception boundary and exception callback programs have different BPF
stack depth, the current stack unwind in exception callback will fail.
Adjust the stack frame size of exception callback, in its prologue,
if its BPF stack depth is different from that of exception boundary.

Reported-by: bot+bpf-ci@kernel.org
Closes: https://lore.kernel.org/bpf/2a310e86a59eb4c44c3ac9e5647814469d9c955580c9c0f1b3d9ca4a44717a34@mail.kernel.org/
Fixes: 11d45eee9f42 ("powerpc64/bpf: Additional NVR handling for bpf_throw")
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes since v1:
* Fixed incorrect use of PPC_RAW_SUB() as pointed out by
  bot+bpf-ci@kernel.org.


 arch/powerpc/net/bpf_jit_comp64.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 5d4d2bb23cef..33b2a7fd9067 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -32,14 +32,15 @@
  *
  *		[	prev sp		] <-------------
  *		[    tail_call_info	] 8		|
- *		[   nv gpr save area	] 6*8 + (12*8)	|
+ *		[   nv gpr save area	] 6*8		|
+ *		[ addl. nv gpr save area] (12*8)	| <--- exception boundary/callback program
  *		[    local_tmp_var	] 24		|
  * fp (r31) -->	[   ebpf stack space	] upto 512	|
  *		[     frame header	] 32/112	|
  * sp (r1) --->	[    stack pointer	] --------------
  *
  * Additional (12*8) in 'nv gpr save area' only in case of
- * exception boundary.
+ * exception boundary/callback.
  */
 
 /* BPF non-volatile registers save area size */
@@ -128,12 +129,13 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
  *		[	  ...       	] 		|
  * sp (r1) --->	[    stack pointer	] --------------
  *		[    tail_call_info	] 8
- *		[   nv gpr save area	] 6*8 + (12*8)
+ *		[   nv gpr save area	] 6*8
+ *		[ addl. nv gpr save area] (12*8) <--- exception boundary/callback program
  *		[    local_tmp_var	] 24
  *		[   unused red zone	] 224
  *
  * Additional (12*8) in 'nv gpr save area' only in case of
- * exception boundary.
+ * exception boundary/callback.
  */
 static int bpf_jit_stack_local(struct codegen_context *ctx)
 {
@@ -240,10 +242,6 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 
 	if (bpf_has_stack_frame(ctx) && !ctx->exception_cb) {
 		/*
-		 * exception_cb uses boundary frame after stack walk.
-		 * It can simply use redzone, this optimization reduces
-		 * stack walk loop by one level.
-		 *
 		 * We need a stack frame, but we don't necessarily need to
 		 * save/restore LR unless we call other functions
 		 */
@@ -287,6 +285,22 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		 * program(main prog) as third arg
 		 */
 		EMIT(PPC_RAW_MR(_R1, _R5));
+		/*
+		 * Exception callback reuses the stack frame of exception boundary.
+		 * But BPF stack depth of exception callback and exception boundary
+		 * don't have to be same. If BPF stack depth is different, adjust the
+		 * stack frame size considering BPF stack depth of exception callback.
+		 * The non-volatile register save area remains unchanged. These non-
+		 * volatile registers are restored in exception callback's epilogue.
+		 */
+		EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R5, 0));
+		EMIT(PPC_RAW_SUB(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_1), _R1));
+		EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_2),
+			-BPF_PPC_EXC_STACKFRAME));
+		EMIT(PPC_RAW_CMPLDI(bpf_to_ppc(TMP_REG_2), ctx->stack_size));
+		PPC_BCC_CONST_SHORT(COND_EQ, 12);
+		EMIT(PPC_RAW_MR(_R1, bpf_to_ppc(TMP_REG_1)));
+		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_EXC_STACKFRAME + ctx->stack_size)));
 	}
 
 	/*
-- 
2.53.0


