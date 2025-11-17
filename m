Return-Path: <linuxppc-dev+bounces-14212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B3CC6298B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 07:54:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8z4X5fx9z30VQ;
	Mon, 17 Nov 2025 17:54:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763362460;
	cv=none; b=FV9jyGX8HmO3DBmSZEHwFx6yLYUFcfbFLLC9QaA7LGAMHL1H8QmbwkABasaMaABNSJqPMRDfd9dkocxo8OAE4y2Ewu9fuy/BbCew2WvlkqR6+UqsxYGzEVHDklP0R5gD/eHA6VcTMIprCHuwed0GISEOV9+r2mLxzIZgrb+raL8WoyRvL+AAxvUZQ3+OyOOe4ZBgUaz+J8d0h+fBNlmxTUe9ZAZhNGrNVqXohfgne/RuX5MH5OhmkG88lUBnW9niRKkyjvg9Hrov3S0D79TlyX6l6J9ZZ27TjxNmvekUwMMiXoQ7JVIx8n2eEvGYPYQ0VEVjLmG3N/5CCoLVlzSjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763362460; c=relaxed/relaxed;
	bh=+alo3UbEupCj7LbLwMD2TuLDGJIyyt28uqSQUJb9iEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dctiHNFl/2yG52mNZDxAiA1zMZRb10aO8fIEpMkzATA8RCblRAn7sJ/7eIG8ZLHOUIQh2vfeX0Enw0/S1X7yjKux8at8I31MpaxzLZxZ86jfDFIG+Fq5L8hGoDtyDo0Y0HtXyKcl++drwhPeAYHarc+FIgdfZR61bREqKQz0CMtFGZDb3cuX8S3iNnOw93wlNLSVTuGEm8PTz7+tf41lrs0ojN5pfiLZY1jB89bs3ZMyqSisGUsCBgGy0qG7Chp9s7ClwyujkQDfJNIeYKc4tgGKDGP5j0Qr01CitB7mPS1W/cJkV97ctpCK1X05KTcztPkvtyjspkFmI7PYAU6BUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZUj0FO1v; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZUj0FO1v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8z4X0TGlz2ynC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 17:54:19 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AGH77er011537;
	Mon, 17 Nov 2025 06:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+alo3U
	bEupCj7LbLwMD2TuLDGJIyyt28uqSQUJb9iEA=; b=ZUj0FO1vF0bpo788xJ5nvA
	ZI9sFh+riLN+alcFWnBRLSr3CKWwJGpyjWXLEl0OsnuzIlQ1EWXfDTldYjm5qs6O
	FrlwMKVx9P2fhD5Vnz4GN0P40Ru0HCaI8T6hg9WPJhKuEI3OCQM2QChP9DUm4cgb
	eYp09mfdPwlCuxR2vB1jX+nJOgFaYZEiR2fxcOTWzVa2c9ILSWTmhmKcFGWtO6UD
	jsNMcgubzKvkyYFbaL6hADrEIKVZyCuQx47ae+ESlFLe29AVZTmaq6sZaTn7CSCf
	CDfhsKoEpKVI7Bmyh2QfceEYmB9zi8+iyr9ozZJmh1GXWK7c9rRoA7nxzwNaIohA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk14ud9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 06:52:50 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AH6dU1F009668;
	Mon, 17 Nov 2025 06:52:49 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk14ud7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 06:52:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH6PWjg010419;
	Mon, 17 Nov 2025 06:52:48 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3urvk33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 06:52:48 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AH6qjrJ39715256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 06:52:45 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F02FB20040;
	Mon, 17 Nov 2025 06:52:44 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B1FA2004B;
	Mon, 17 Nov 2025 06:52:41 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.in.ibm.com (unknown [9.109.219.153])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Nov 2025 06:52:40 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH bpf-next v2 1/2] powerpc64/bpf: Support internal-only MOV instruction to resolve per-CPU addrs
Date: Mon, 17 Nov 2025 12:22:34 +0530
Message-ID: <e58dc8bfd5be16f95684d35fd68919ea83c7e322.1762422548.git.skb99@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1762422548.git.skb99@linux.ibm.com>
References: <cover.1762422548.git.skb99@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691ac642 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8 a=9ieA5zyVNCi_1SjJAlMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: tCJP1Y9VwZFQNgXULkF-3Z_VQtLbbkcV
X-Proofpoint-ORIG-GUID: 8Pwe9b7X5a-OSzI9xeEndQmbr_ki4epO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX4sNlqtGEEzo0
 HCD0L4pkM2CtYgmrPNKBUCaLkUTjlDmSvn8DtKPzBjBKoctzukLS7PALtCjLwqK6gwox4xwPiDJ
 /BfpiZK+RtmE/8g3RuxVQhyFgS3y8UCYKzvY+1x3D/+tVWE3z1AwgHfqVT3Bpw2D1aCuLnGuC8k
 Y4OPTYoapUGAnTALVnVI0oQtXDD4jwOQJKaXSDu+W8tLZ3FMk7cgpOK0YkCGusBL0IAYCoLirc/
 HX/ybD0p77OJTIjCjsrmI4W+JteGYNBMNJ5o+IjlkMXRZGTlGEEMqw5kp0u3zyD6BNxF44C6Q8V
 3qWs34AjhK7G9+69suavhKvbS7+HwUitG6qk92OrGF74GAqjI96+Esw/SczUYucGTXgA3KTzZFL
 +Yy+ODNG2yZqF5Rimy9M+aN5v34K7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With the introduction of commit 7bdbf7446305 ("bpf: add special
internal-only MOV instruction to resolve per-CPU addrs"),
a new BPF instruction BPF_MOV64_PERCPU_REG has been added to
resolve absolute addresses of per-CPU data from their per-CPU
offsets. This update requires enabling support for this
instruction in the powerpc JIT compiler.

As of commit 7a0268fa1a36 ("[PATCH] powerpc/64: per cpu data
optimisations"), the per-CPU data offset for the CPU is stored in
the paca.

To support this BPF instruction in the powerpc JIT, the following
powerpc instructions are emitted:

ld tmp1_reg, 48(13)		//Load per-CPU data offset from paca(r13) in tmp1_reg.
add dst_reg, src_reg, tmp1_reg	//Add the per cpu offset to the dst.
mr dst_reg, src_reg		//Move src_reg to dst_reg, if src_reg != dst_reg

To evaluate the performance improvements introduced by this change,
the benchmark described in [1] was employed.

Before Change:
glob-arr-inc   :   41.580 ± 0.034M/s
arr-inc        :   39.592 ± 0.055M/s
hash-inc       :   25.873 ± 0.012M/s

After Change:
glob-arr-inc   :   42.024 ± 0.049M/s
arr-inc        :   55.447 ± 0.031M/s
hash-inc       :   26.565 ± 0.014M/s

[1] https://github.com/anakryiko/linux/commit/8dec900975ef

Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c   | 5 +++++
 arch/powerpc/net/bpf_jit_comp64.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 88ad5ba7b87f..2f2230ae2145 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -466,6 +466,11 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 	return true;
 }
 
+bool bpf_jit_supports_percpu_insn(void)
+{
+	return IS_ENABLED(CONFIG_PPC64);
+}
+
 void *arch_alloc_bpf_trampoline(unsigned int size)
 {
 	return bpf_prog_pack_alloc(size, bpf_jit_fill_ill_insns);
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 1fe37128c876..21486706b5ea 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -918,6 +918,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		case BPF_ALU | BPF_MOV | BPF_X: /* (u32) dst = src */
 		case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
 
+			if (insn_is_mov_percpu_addr(&insn[i])) {
+				if (IS_ENABLED(CONFIG_SMP)) {
+					EMIT(PPC_RAW_LD(tmp1_reg, _R13, offsetof(struct paca_struct, data_offset)));
+					EMIT(PPC_RAW_ADD(dst_reg, src_reg, tmp1_reg));
+				} else {
+					EMIT(PPC_RAW_MR(dst_reg, src_reg));
+				}
+			}
+
 			if (insn_is_cast_user(&insn[i])) {
 				EMIT(PPC_RAW_RLDICL_DOT(tmp1_reg, src_reg, 0, 32));
 				PPC_LI64(dst_reg, (ctx->user_vm_start & 0xffffffff00000000UL));
-- 
2.51.0


