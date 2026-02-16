Return-Path: <linuxppc-dev+bounces-16877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJNRFvvvkmkQ0QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 11:22:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB3F1424E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 11:22:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDzP243G3z2ySS;
	Mon, 16 Feb 2026 21:22:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771237366;
	cv=none; b=B8/pZixrngzVYy7oUnD9RD0skLYF5AGGl/gUh5rN71TjM07fTyz7vdQ89MZIuAGGJT6XcHOoV9A1a1YAylgmGMFamrfDvNQM/Qhn+tnzeSl9I2dgCZAgfrbqC4x48JwqXhkWK+7L0u+kuvFBIhsyjxHm6Xykn3osCazSwQDPH1OrTJLjP86lU4UAOdM4OBQincse6ccca7WLe7j9M6AwWVg9Uz/wqPvFTZvYREKO7zxStPf8RxnoN1eY8eZjOJVvM2Z8DL9rXi13U8z7EWA//C2MJx3WfNDX3LxeMtBFn7HvtbAXYBp1J40Z+YsfhCg/Ym1ivSv6ru9+zxFfGVPxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771237366; c=relaxed/relaxed;
	bh=Eom+h3mB7WCszSDoHhlS/sDtmGmLLxyusAv+KtbCsGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drtWrBB5RbouyRjuKYL26xuPcqg3V8K0g06uDsO8Et1eyuLN/nlVo1NY4KwL0JpqDYl/4m2+GBQgfX05FGMOc/gvq/QwfK2tFSNlDBYLFyeHN/DOj9l9MpRIPGWk9FqKTOWirWyX0B1CZcK4JUpd7a+sZsVv5hCGqcBiMhOxNuab2ETr2HgNSGz4EAdAQQHN3ACI4EHmeeK7uZ9dBnfVt2NRdfZU++1b21IqgnWZ3d38y8r9oJ6IF8n3BxoT3cfxEYW/Jt4OuSPZpxRixNWS2+Il8JjPQmFT3eAiP0+qaEVG3Tvf/ev7LhgGhDcHQXvADu0oqMMnxtSYI9XLvIFYBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UMCBjrxl; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UMCBjrxl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDzP12PLWz2xN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 21:22:44 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FNiNml1731753;
	Mon, 16 Feb 2026 10:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Eom+h3mB7WCszSDoHhlS/sDtmGmLLxyusAv+KtbCs
	GA=; b=UMCBjrxlCjlh3ZTlsbvcNlmAI23Bk+VeMPoQ9a3RWihhnT73AUefghxSU
	RLHF/cxpqCXxgE2OxLDtKklJgimHULfUnarPxjX347qyVVvsVYsQz99vgTpnvZ9/
	RiKOOiisKK+QC4NLK/g3FGMf6y5mb59JtUXxNAtRXdYXDdV/pBdAwBm6surCyXXr
	hldsVwKi28v4TY3sM923xG18RHyoDMq+i1cLkoFrikUCAyZLQ18NxUdY0GsDPXF2
	jR4mqjXFNpKfKxq7x61r7/QgYWxM4lV5HNeSdhWJkrTk2Uewdi11vRA+9Vsw39FJ
	Ta3jpS7sKU2OWH4QiRX13pDVT/8wA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cajcj6qn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 10:22:20 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61G6baxO012709;
	Mon, 16 Feb 2026 10:22:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cb3crw39j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 10:22:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61GAMFUX57606504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Feb 2026 10:22:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A18E720049;
	Mon, 16 Feb 2026 10:22:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D0CD2004B;
	Mon, 16 Feb 2026 10:22:13 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Feb 2026 10:22:13 +0000 (GMT)
From: adubey@linux.ibm.com
To: bpf@vger.kernel.org
Cc: hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org,
        eddyz87@gmail.com, yonghong.song@linux.dev, clm@meta.com,
        ihor.solodrai@linux.dev, chleroy@kernel.org,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 1/2] powerpc64/bpf: Implement JIT support for private stack
Date: Mon, 16 Feb 2026 10:22:33 -0500
Message-ID: <20260216152234.36632-1-adubey@linux.ibm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: XzMDQ7tZ9W1Kqg5mOl3Dep3viRcScAxZ
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=6992efdc cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=A8mRDSlWM7J1pTn1j8wA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA4NSBTYWx0ZWRfX2KxewgMASKc4
 tGjnJhX0zbHl9t8mZAgySd9zdlebnE4WyTuVmcsilHvKKmQl8ouaL7MSebgGLoTUwoaLmfBe1+P
 BijvN1nOe2Z2JnODVq/hwdQVtnZ/Mno507Oq7Mbz4K35F6LBjmzPsHWc5UG1Bw2d7OPsoUewh/C
 aIKAsY6uGxDk4nsqpvqV3Jv9qeeKc2x7d6bEHbJZO7ngNXlzy7PWgyVe49xTy20SSJ7/3Wr3f9g
 8sliAxFKylqA2afPTxNXP0n4BrGa3OIjuFyy951QjllPKnqvjX3fJ6XQwwb7vCGG69VAkWpz77O
 RvWd5J4Sp7d6FbtTtet39Oqz37JVozXf1XsSQFeiedSkKbFCAmIVOZaW98U3e0WubnUFhCzW6Y+
 t1LmdQrG/V9f1n7vQ3ofD2XsnOi6uS+1oZOvVO3U67hOdlrYnT/2E5fOZtEYQ2f1n0YdJ+v4vkF
 10v0Fewe95Q0DBTLC4w==
X-Proofpoint-GUID: 9FbaGHNwQ_D3s_ZrsejfcYXGMDOZ_R9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160085
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-16877-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:chleroy@kernel.org,m:adubey@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4BB3F1424E0
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

Provision the private stack as a per-CPU allocation during
bpf_int_jit_compile(). Align the stack to 16 bytes and place guard
regions at both ends to detect runtime stack overflow and underflow.

Round the private stack size up to the nearest 16-byte boundary.
Make each guard region 16 bytes to preserve the required overall
16-byte alignment. When private stack is set, skip bpf stack size
accounting in kernel stack.

There is no stack pointer in powerpc. Stack referencing during JIT
is done using frame pointer. Frame pointer calculation goes like:

BPF frame pointer = Priv stack allocation start address +
                    Overflow guard +
                    Actual stack size defined by verifier

Memory layout:

High Addr          +--------------------------------------------------+
                   |                                                  |
                   | 16 bytes Underflow guard (0xEB9F12345678eb9fULL) |
                   |                                                  |
         BPF FP -> +--------------------------------------------------+
                   |                                                  |
                   | Private stack - determined by verifier           |
                   | 16-bytes aligned                                 |
                   |                                                  |
                   +--------------------------------------------------+
                   |                                                  |
Lower Addr         | 16 byte Overflow guard (0xEB9F12345678eb9fULL)   |
                   |                                                  |
Priv stack alloc ->+--------------------------------------------------+
start

Update BPF_REG_FP to point to the calculated offset within the
allocated private stack buffer. Now, BPF stack usage reference
in the allocated private stack.

The patch is rebase over fixes by Hari:
https://lore.kernel.org/bpf/20260216065639.1750181-1-hbathini@linux.ibm.com/T/#mf02cad9096fa4ad1f05610b1f464da1cddf7445a

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  5 +++
 arch/powerpc/net/bpf_jit_comp.c   | 74 +++++++++++++++++++++++++++++++
 arch/powerpc/net/bpf_jit_comp64.c | 38 +++++++++++++---
 3 files changed, 112 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 7354e1d72f79..5a115c54e43a 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -178,8 +178,13 @@ struct codegen_context {
 	bool is_subprog;
 	bool exception_boundary;
 	bool exception_cb;
+	u64 priv_sp;
 };
 
+/* Memory size & magic-value to detect private stack overflow/underflow */
+#define PRIV_STACK_GUARD_SZ    16
+#define PRIV_STACK_GUARD_VAL   0xEB9F12345678eb9fULL
+
 #define bpf_to_ppc(r)	(ctx->b2p[r])
 
 #ifdef CONFIG_PPC32
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 278e09b57560..7a78e03d482f 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -129,6 +129,39 @@ bool bpf_jit_needs_zext(void)
 	return true;
 }
 
+static void priv_stack_init_guard(void __percpu *priv_stack_ptr, int alloc_size)
+{
+	int cpu, underflow_idx = (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
+	u64 *stack_ptr;
+
+	for_each_possible_cpu(cpu) {
+		stack_ptr = per_cpu_ptr(priv_stack_ptr, cpu);
+		stack_ptr[0] = PRIV_STACK_GUARD_VAL;
+		stack_ptr[1] = PRIV_STACK_GUARD_VAL;
+		stack_ptr[underflow_idx] = PRIV_STACK_GUARD_VAL;
+		stack_ptr[underflow_idx + 1] = PRIV_STACK_GUARD_VAL;
+	}
+}
+
+static void priv_stack_check_guard(void __percpu *priv_stack_ptr, int alloc_size,
+								struct bpf_prog *fp)
+{
+	int cpu, underflow_idx = (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
+	u64 *stack_ptr;
+
+	for_each_possible_cpu(cpu) {
+		stack_ptr = per_cpu_ptr(priv_stack_ptr, cpu);
+		if (stack_ptr[0] != PRIV_STACK_GUARD_VAL ||
+			stack_ptr[1] != PRIV_STACK_GUARD_VAL ||
+			stack_ptr[underflow_idx] != PRIV_STACK_GUARD_VAL ||
+			stack_ptr[underflow_idx + 1] != PRIV_STACK_GUARD_VAL) {
+			pr_err("BPF private stack overflow/underflow detected for prog %sx\n",
+			bpf_jit_get_prog_name(fp));
+			break;
+		}
+	}
+}
+
 struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 {
 	u32 proglen;
@@ -140,6 +173,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	struct codegen_context cgctx;
 	int pass;
 	int flen;
+	int priv_stack_alloc_size;
+	void __percpu *priv_stack_ptr = NULL;
 	struct bpf_binary_header *fhdr = NULL;
 	struct bpf_binary_header *hdr = NULL;
 	struct bpf_prog *org_fp = fp;
@@ -173,6 +208,25 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		fp->aux->jit_data = jit_data;
 	}
 
+	if (!priv_stack_ptr && fp->aux->jits_use_priv_stack) {
+		/*
+		 * Allocate private stack of size equivalent to
+		 * verifier-calculated stack size plus two memory
+		 * guard regions to detect private stack overflow
+		 * and underflow.
+		 */
+		priv_stack_alloc_size = round_up(fp->aux->stack_depth, 16) +
+							2 * PRIV_STACK_GUARD_SZ;
+		priv_stack_ptr = __alloc_percpu_gfp(priv_stack_alloc_size, 16, GFP_KERNEL);
+		if (!priv_stack_ptr) {
+			fp = org_fp;
+			goto out_priv_stack;
+		}
+
+		priv_stack_init_guard(priv_stack_ptr, priv_stack_alloc_size);
+		fp->aux->priv_stack_ptr = priv_stack_ptr;
+	}
+
 	flen = fp->len;
 	addrs = jit_data->addrs;
 	if (addrs) {
@@ -209,6 +263,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	cgctx.is_subprog = bpf_is_subprog(fp);
 	cgctx.exception_boundary = fp->aux->exception_boundary;
 	cgctx.exception_cb = fp->aux->exception_cb;
+	cgctx.priv_sp = priv_stack_ptr ? (u64)priv_stack_ptr : 0;
 
 	/* Scouting faux-generate pass 0 */
 	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
@@ -306,7 +361,12 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		}
 		bpf_prog_fill_jited_linfo(fp, addrs);
 out_addrs:
+		if (!image && priv_stack_ptr) {
+			free_percpu(priv_stack_ptr);
+			fp->aux->priv_stack_ptr = NULL;
+		}
 		kfree(addrs);
+out_priv_stack:
 		kfree(jit_data);
 		fp->aux->jit_data = NULL;
 	} else {
@@ -419,6 +479,8 @@ void bpf_jit_free(struct bpf_prog *fp)
 	if (fp->jited) {
 		struct powerpc_jit_data *jit_data = fp->aux->jit_data;
 		struct bpf_binary_header *hdr;
+		void __percpu *priv_stack_ptr;
+		int priv_stack_alloc_size;
 
 		/*
 		 * If we fail the final pass of JIT (from jit_subprogs),
@@ -432,6 +494,13 @@ void bpf_jit_free(struct bpf_prog *fp)
 		}
 		hdr = bpf_jit_binary_pack_hdr(fp);
 		bpf_jit_binary_pack_free(hdr, NULL);
+		priv_stack_ptr = fp->aux->priv_stack_ptr;
+		if (priv_stack_ptr) {
+			priv_stack_alloc_size = round_up(fp->aux->stack_depth, 16) +
+							2 * PRIV_STACK_GUARD_SZ;
+			priv_stack_check_guard(priv_stack_ptr, priv_stack_alloc_size, fp);
+			free_percpu(priv_stack_ptr);
+		}
 		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(fp));
 	}
 
@@ -453,6 +522,11 @@ bool bpf_jit_supports_kfunc_call(void)
 	return true;
 }
 
+bool bpf_jit_supports_private_stack(void)
+{
+	return IS_ENABLED(CONFIG_PPC64);
+}
+
 bool bpf_jit_supports_arena(void)
 {
 	return IS_ENABLED(CONFIG_PPC64);
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 640b84409687..206ef43b4090 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -183,6 +183,20 @@ void bpf_jit_realloc_regs(struct codegen_context *ctx)
 {
 }
 
+static void emit_fp_priv_stack(u32 *image, struct codegen_context *ctx, void __percpu *ptr)
+{
+	/* Load percpu data offset */
+	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R13,
+			offsetof(struct paca_struct, data_offset)));
+	PPC_LI64(bpf_to_ppc(BPF_REG_FP), (u64)ptr);
+	/*
+	 * Set frame pointer with percpu allocated
+	 * buffer for private stack.
+	 */
+	EMIT(PPC_RAW_ADD(bpf_to_ppc(BPF_REG_FP),
+			bpf_to_ppc(TMP_REG_1), bpf_to_ppc(BPF_REG_FP)));
+}
+
 /*
  * For exception boundary & exception_cb progs:
  *     return increased size to accommodate additional NVRs.
@@ -197,6 +211,12 @@ static int bpf_jit_stack_size(struct codegen_context *ctx)
 void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 {
 	int i;
+	void __percpu *priv_frame_ptr = NULL;
+
+	if (ctx->priv_sp) {
+		priv_frame_ptr = (void*) ctx->priv_sp + PRIV_STACK_GUARD_SZ +
+					round_up(ctx->stack_size, 16);
+	}
 
 	/* Instruction for trampoline attach */
 	EMIT(PPC_RAW_NOP());
@@ -251,7 +271,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		}
 
 		EMIT(PPC_RAW_STDU(_R1, _R1,
-				-(bpf_jit_stack_size(ctx) + ctx->stack_size)));
+			-(bpf_jit_stack_size(ctx) + (ctx->priv_sp ? 0 : ctx->stack_size))));
 	}
 
 	/*
@@ -307,9 +327,16 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 * Exception_cb not restricted from using stack area or arena.
 	 * Setup frame pointer to point to the bpf stack area
 	 */
-	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
-		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
-			STACK_FRAME_MIN_SIZE + ctx->stack_size));
+	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP))) {
+		if (ctx->priv_sp && priv_frame_ptr) {
+			/* Set up private stack pointer */
+			emit_fp_priv_stack(image, ctx, priv_frame_ptr);
+		} else {
+			/* Setup frame pointer to point to the bpf stack area */
+			EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
+				STACK_FRAME_MIN_SIZE + ctx->stack_size));
+		}
+	}
 
 	if (ctx->arena_vm_start)
 		PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
@@ -339,7 +366,8 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 
 	/* Tear down our stack frame */
 	if (bpf_has_stack_frame(ctx)) {
-		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_jit_stack_size(ctx) + ctx->stack_size));
+		EMIT(PPC_RAW_ADDI(_R1, _R1,
+			bpf_jit_stack_size(ctx) + (ctx->priv_sp ? 0 : ctx->stack_size)));
 
 		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
 			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
-- 
2.52.0


