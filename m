Return-Path: <linuxppc-dev+bounces-6902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99445A5CBC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 18:11:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC0fy2zcBz3brx;
	Wed, 12 Mar 2025 04:11:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741709455;
	cv=none; b=Vi854MLg3kHC4PXA4xMwTm53lG1HPsH5ZhW4L2VLTYr/oMDUBqArlhU6sIQQ6ax1Ni+ZU2LDZ3McsxbB5eEEhQXdwAo6eZq/r0BhqAxKMC9keBpigdVtdfNPY4ghOYPZsodNua//BCdRk4A4AaphmX7jka94TgDiZdWhr1BivVf9BfgXUuNSotT9B/7N8nk1XwzeUqsRJNxzy/QRd4u+4bLjNXXMMpsomfKIzGj18nkRxks+8/Cw4eMUomqtGUv+MnIMAMxgMpak4gqRRCLgmL0ML1b76+DkEhkg9axINzPm0AgHPOyTBRret0WAPsIKZnYSfw7Al7pzDVdmQrlFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741709455; c=relaxed/relaxed;
	bh=Eq2eYkgjMtMdXEiE7U4VNPwFdP5DbNO8T7hhzQWw4ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ja63DUzMqanZnjt/l+gSKUmDdAYgAkn7372/8r63U8f1N2ZwpEaDVNfhF7IivBzCJFcVSbg+FW7j0nidiMPlAv5ZnXEHeeTx8UlLyDrIV8/8Ow9MMCGsMYNp7ACA5Dc24u1PWrhWY1k0bgGJPMJUVky49X4ecNA6rZYP5i51BAMa+EFMRyueFzTDBj9qkOJA7seBUYbakVfTZJLm5+zhxscB2Sv6hcH1MJQH5S/12Unmy8ZPvIA4MAddkQUE9uklQbWzfBtUQdIrPrG8yBAdtBx5Ar24g3VemYqhO9ZL8bGHGqLooEQGPjFLtwtcLkJg3t6TIHLQt676FZFoQs6smQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=trZnTh8v; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=trZnTh8v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBzJZ3Yq3z3blk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 03:10:54 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BFqogK027902;
	Tue, 11 Mar 2025 16:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Eq2eYk
	gjMtMdXEiE7U4VNPwFdP5DbNO8T7hhzQWw4ek=; b=trZnTh8vLH8rw/5O0tU1i2
	I4/BBghHgYYUF9/qf5fXROZnYKapocJRZoot500i31shiGcnSqL4vsqD0nc3V+bM
	XV5SdGkMWq2J8SYxgswf+SN5/UaZeATe8+WRLYlCdYo2RvcaMKy3Tj1Jb+N/D3Ni
	x3N5ZKZkQtBVRSQLr29heOLVIJVvKIJ+Ewb7WwKk5Is6hxeBP1FELw+3S8crF5eM
	eC6YsywB2GFX88PMQ0CLWUs7EI3hW6eUBM7J7K3dE71Drl8XwWmpn9DgS4E0uurp
	A6UFbnWPYtcmArh54TovpAY4OjBGp1COpninkDxtX+Eb4+6dn81zE1MFJ84xvD4Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45a7a1cyw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 16:10:22 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52BFqQBT011483;
	Tue, 11 Mar 2025 16:10:21 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45a7a1cyvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 16:10:21 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52BD2kRH022213;
	Tue, 11 Mar 2025 16:10:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45917nd2fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 16:10:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52BGAGC934996626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 16:10:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B03EB20049;
	Tue, 11 Mar 2025 16:10:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E7DE2004D;
	Tue, 11 Mar 2025 16:10:11 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.96.240])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Mar 2025 16:10:10 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: ast@kernel.org, hbathini@linux.ibm.com, andrii@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, eddyz87@gmail.com,
        song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
        jolsa@kernel.org, christophe.leroy@csgroup.eu, naveen@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH 2/2] powerpc, bpf: Inline bpf_get_smp_processor_id()
Date: Tue, 11 Mar 2025 21:39:55 +0530
Message-ID: <20250311160955.825647-3-skb99@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250311160955.825647-1-skb99@linux.ibm.com>
References: <20250311160955.825647-1-skb99@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0Q1rkXzBFu15-t_NNyNIKB5YUHYg0Zcc
X-Proofpoint-GUID: H6X_cuOGAr15dDWrqW6bOtNhwwY76Q1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 mlxlogscore=700 malwarescore=0
 clxscore=1011 mlxscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503110101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Inline the calls to bpf_get_smp_processor_id() in the powerpc bpf jit.

powerpc saves the Logical processor number (paca_index) in paca.

Here is how the powerpc JITed assembly changes after this commit:

Before:

cpu = bpf_get_smp_processor_id();

addis 12, 2, -517
addi 12, 12, -29456
mtctr 12
bctrl
mr	8, 3

After:

cpu = bpf_get_smp_processor_id();

lhz 8, 8(13)

To evaluate the performance improvements introduced by this change,
the benchmark described in [1] was employed.

+---------------+-------------------+-------------------+--------------+
|      Name     |      Before       |        After      |   % change   |
|---------------+-------------------+-------------------+--------------|
| glob-arr-inc  | 41.580 ± 0.034M/s | 54.137 ± 0.019M/s |   + 30.20%   |
| arr-inc       | 39.592 ± 0.055M/s | 54.000 ± 0.026M/s |   + 36.39%   |
| hash-inc      | 25.873 ± 0.012M/s | 26.334 ± 0.058M/s |   + 1.78%    |
+---------------+-------------------+-------------------+--------------+

[1] https://github.com/anakryiko/linux/commit/8dec900975ef

Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c   | 10 ++++++++++
 arch/powerpc/net/bpf_jit_comp64.c |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 3d4bd45a9a22..4b79b2d95469 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -445,6 +445,16 @@ bool bpf_jit_supports_percpu_insn(void)
 	return true;
 }
 
+bool bpf_jit_inlines_helper_call(s32 imm)
+{
+	switch (imm) {
+	case BPF_FUNC_get_smp_processor_id:
+		return true;
+	default:
+		return false;
+	}
+}
+
 void *arch_alloc_bpf_trampoline(unsigned int size)
 {
 	return bpf_prog_pack_alloc(size, bpf_jit_fill_ill_insns);
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 06f06770ceea..a8de12c026da 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -1087,6 +1087,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		case BPF_JMP | BPF_CALL:
 			ctx->seen |= SEEN_FUNC;
 
+			if (insn[i].src_reg == 0 && imm == BPF_FUNC_get_smp_processor_id) {
+				EMIT(PPC_RAW_LHZ(bpf_to_ppc(BPF_REG_0), _R13, offsetof(struct paca_struct, paca_index)));
+				break;
+			}
+
 			ret = bpf_jit_get_func_addr(fp, &insn[i], extra_pass,
 						    &func_addr, &func_addr_fixed);
 			if (ret < 0)
-- 
2.43.5


