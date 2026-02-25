Return-Path: <linuxppc-dev+bounces-17172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF8uG4HRnmnwXQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 11:40:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A3195E08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 11:40:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWLj6hb0z3dXK;
	Wed, 25 Feb 2026 21:39:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772015997;
	cv=none; b=UxAeESkUec6b2ANhSh/1rL5vK1leXLbZLfZlRhpWpr0+9AMiPDQRvRNBCK3XrzcWbdcDsjg+a3eiI2+G/hadWYJCnuRkVH3wdqGyNAhdrM4RPnIkuShB4C8vdwOHPYVQbT5/gPb+tN7QLm7dwZYlfPIMyNyG7BW8yqfccrbR8gxXOrwIQYYBnF54mO9bgzfpC8OtSItblhy2WlzS4cSwrTgGIfY+gnC1/qQ1htrYSni6tPR/A54ebEUmrAFJdaQpKsZnIV9f4mEFVZ805DI/7ueFfRkkDEm2OvBCDX8XpTEZvsSDhR/v5Z8QAOXwkyGxRUNTapZIy1fEr4dKTFmIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772015997; c=relaxed/relaxed;
	bh=kN8GJstFaROeGew1zH2sV4IYeY8QipFgE5+WI+f5mgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JR3/hSGdzjp0vBrYAjafuY9ridl7lSCOVR6z3sg+/ERtRhWMjsvxWhxR9njRL4f7NURV5/2ImL5fw1kB+JqtLkbszgP9EkkSepAC1bAhgjlG0N6EAO+9dg1naAhe9/IhaurZCCLi3FJdtZLAUXgILunlwIAiIoB88xftQX4RBZIB90JW+ZuLkY3iOnu2s7qFU+MvvraZ3oYvZtGGOJ2OcUcXBFTJjn6NT0Ps/o8NIzP6W3YY9smA/sRxj6i0j/DHg9unoKRFDNU3lPomzDs97um77UH+astfId24iv4BihkNYx/KmqBNPBpCfRJm7fIROzFvkxrEye6dnemkZb2TGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LZsssGI5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LZsssGI5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWLj16MKz3d44
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 21:39:56 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OMbgfL3074079;
	Wed, 25 Feb 2026 10:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=kN8GJstFaROeGew1zH2sV4IYeY8QipFgE5+WI+f5m
	gg=; b=LZsssGI5IZ+ujtttbvmMDI7JnIU/rpOY/RvtGQZMtyje22FzEnPumAH4w
	JnQztnmlJwSrFgWWCZP9ueAqdSs+b+TPYX3K5C5/2YkokufEzgoAgnPsvoYG7RaR
	9hDStPZoluQCZ4bAyEVk5Ux4QwGYnYsJsIXGYP+beyp1mmwzm0drLwWlvKFlSGbV
	aZoy575kP259yt6rTVzZAP4hmOvzTwms/40wM0TQuXd6q79FLJIHA6nTEK+HENhY
	hbc55nBGsDAL6RTqREUetf0msVoCfb+TM9kuDSnUYFYvUIbye26zlOR760Y5PyZX
	wu3mQwjUSKjFx7SgP+yAfUdpoVEoQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf471yuru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 10:39:42 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61P97FbC003386;
	Wed, 25 Feb 2026 10:39:41 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfs8jvqvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 10:39:41 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61PAdbYx46727542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 10:39:37 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A51662004D;
	Wed, 25 Feb 2026 10:39:37 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23CB420043;
	Wed, 25 Feb 2026 10:39:36 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Feb 2026 10:39:35 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v2 1/2] powerpc64/bpf: Implement JIT support for private stack
Date: Wed, 25 Feb 2026 10:39:49 -0500
Message-ID: <20260225153950.15331-1-adubey@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: MBhtfZT89ulX7mU-dG2GURG9CGi_RgYR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwNCBTYWx0ZWRfX8e0X2UbPw/0o
 RE1LaAEo0djzLAU0h3si+uwb/CSqXSu4aw1zF6qgnHAFzFRyRCVz8H2sxXVoYwonIZP7RF1ijeV
 uyo8tXPD9dkjWVjqSNTTKxAaiEdy9YNNBJrrAhFgmsuX21LLVZEu1/p76CBlSCA8f+RW8kOacdl
 D+pmdKa1kk8NCJFO7QnVksmF46cBGfoCiidnU8Mf4J1/1MEoZW0tAMe8QzQ3mBNR7VK2O+NDenN
 3T9na1mCONcdMeRYiOOPYxjlI4r+YUHsQm7OM0BDrH6w+wcIx06oyNjDAjKtLaejgG7cJZZJX11
 3Bh++7Us8L8/FrO5wdIFzxiB96R3agyx8yqWq+Je2mNNg6fwkKtbt4WhW00mOeW4RlmaTSOKZn/
 UlR6M/9cFFXiB2QG1ngbGZXIVFtCqgrd6pKeAQDMjineGuggaVuKFLtv4a6USxevY8i6ThWMNBu
 YVpsyNmTyrZxbFgh9Uw==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=699ed16e cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=F76KSA7jxJ0ultxYvGsA:9
X-Proofpoint-GUID: MBhtfZT89ulX7mU-dG2GURG9CGi_RgYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602250104
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17172-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7E1A3195E08
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
https://lore.kernel.org/bpf/20260220063933.196141-1-hbathini@linux.ibm.com/

v1->v2:
  Fix ci-bot warning for percpu pointer casting
  Minor refactoring

[v1]: https://lore.kernel.org/bpf/20260216152234.36632-1-adubey@linux.ibm.com

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  5 +++
 arch/powerpc/net/bpf_jit_comp.c   | 75 +++++++++++++++++++++++++++++++
 arch/powerpc/net/bpf_jit_comp64.c | 34 +++++++++++---
 3 files changed, 109 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 7354e1d72f79..eb0a400b5a98 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -178,8 +178,13 @@ struct codegen_context {
 	bool is_subprog;
 	bool exception_boundary;
 	bool exception_cb;
+	void __percpu *priv_sp;
 };
 
+/* Memory size & magic-value to detect private stack overflow/underflow */
+#define PRIV_STACK_GUARD_SZ    16
+#define PRIV_STACK_GUARD_VAL   0xEB9F12345678eb9fULL
+
 #define bpf_to_ppc(r)	(ctx->b2p[r])
 
 #ifdef CONFIG_PPC32
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 278e09b57560..ebd21c75ce47 100644
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
@@ -173,6 +208,26 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		fp->aux->jit_data = jit_data;
 	}
 
+	priv_stack_ptr = fp->aux->priv_stack_ptr;
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
@@ -209,6 +264,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	cgctx.is_subprog = bpf_is_subprog(fp);
 	cgctx.exception_boundary = fp->aux->exception_boundary;
 	cgctx.exception_cb = fp->aux->exception_cb;
+	cgctx.priv_sp = priv_stack_ptr;
 
 	/* Scouting faux-generate pass 0 */
 	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
@@ -306,6 +362,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		}
 		bpf_prog_fill_jited_linfo(fp, addrs);
 out_addrs:
+		if (!image && priv_stack_ptr) {
+			fp->aux->priv_stack_ptr = NULL;
+			free_percpu(priv_stack_ptr);
+		}
+out_priv_stack:
 		kfree(addrs);
 		kfree(jit_data);
 		fp->aux->jit_data = NULL;
@@ -419,6 +480,8 @@ void bpf_jit_free(struct bpf_prog *fp)
 	if (fp->jited) {
 		struct powerpc_jit_data *jit_data = fp->aux->jit_data;
 		struct bpf_binary_header *hdr;
+		void __percpu *priv_stack_ptr;
+		int priv_stack_alloc_size;
 
 		/*
 		 * If we fail the final pass of JIT (from jit_subprogs),
@@ -432,6 +495,13 @@ void bpf_jit_free(struct bpf_prog *fp)
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
 
@@ -453,6 +523,11 @@ bool bpf_jit_supports_kfunc_call(void)
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
index 640b84409687..d026cff30d1d 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -183,6 +183,22 @@ void bpf_jit_realloc_regs(struct codegen_context *ctx)
 {
 }
 
+static void emit_fp_priv_stack(u32 *image, struct codegen_context *ctx)
+{
+	/* Load percpu data offset */
+	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R13,
+			offsetof(struct paca_struct, data_offset)));
+	PPC_LI64(bpf_to_ppc(BPF_REG_FP), (__force long)ctx->priv_sp);
+	/*
+	 * Load base percpu pointer of private stack allocation.
+	 * Runtime per-cpu address = (base + data_offset) + (guard + stack_size)
+	 */
+	EMIT(PPC_RAW_ADD(bpf_to_ppc(BPF_REG_FP),
+			bpf_to_ppc(TMP_REG_1), bpf_to_ppc(BPF_REG_FP)));
+	EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), bpf_to_ppc(BPF_REG_FP),
+			PRIV_STACK_GUARD_SZ + round_up(ctx->stack_size, 16)));
+}
+
 /*
  * For exception boundary & exception_cb progs:
  *     return increased size to accommodate additional NVRs.
@@ -251,7 +267,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		}
 
 		EMIT(PPC_RAW_STDU(_R1, _R1,
-				-(bpf_jit_stack_size(ctx) + ctx->stack_size)));
+			-(bpf_jit_stack_size(ctx) + (ctx->priv_sp ? 0 : ctx->stack_size))));
 	}
 
 	/*
@@ -307,9 +323,16 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 * Exception_cb not restricted from using stack area or arena.
 	 * Setup frame pointer to point to the bpf stack area
 	 */
-	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
-		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
-			STACK_FRAME_MIN_SIZE + ctx->stack_size));
+	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP))) {
+		if (ctx->priv_sp) {
+			/* Set up fp in private stack */
+			emit_fp_priv_stack(image, ctx);
+		} else {
+			/* Setup frame pointer to point to the bpf stack area */
+			EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
+				STACK_FRAME_MIN_SIZE + ctx->stack_size));
+		}
+	}
 
 	if (ctx->arena_vm_start)
 		PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
@@ -339,7 +362,8 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 
 	/* Tear down our stack frame */
 	if (bpf_has_stack_frame(ctx)) {
-		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_jit_stack_size(ctx) + ctx->stack_size));
+		EMIT(PPC_RAW_ADDI(_R1, _R1,
+			bpf_jit_stack_size(ctx) + (ctx->priv_sp ? 0 : ctx->stack_size)));
 
 		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
 			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
-- 
2.52.0


