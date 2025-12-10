Return-Path: <linuxppc-dev+bounces-14710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EECACB21D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 07:51:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dR5wr4LC9z2yG7;
	Wed, 10 Dec 2025 17:51:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765349500;
	cv=none; b=HCKv/kPdbJII5VHXZEW4p9keLa0sXdkipcs6I1o8ipbXZvCd/pOk25J1ngRm3+WzTiFhu5xXx8WAGBwp5biwy7VPmic6EGFB5DQuJ8+3khMlkTCPjsMe4cIFJQaY0QwSzmKw66ogZSC6yXsZsJBecz6rN/3gE8/4lNQ2a6FOaXtUMHQSIy1zD4O7DMnsv5QRnquumWhW2n4u5BhXef+rQ89bjzFBqAXLgi0r/XdyuihS3rZuolxPJEtt7RhMTx8fsd/6gNNmIZrm/L5uvATt/VDm/0bj+NpU4hKARP+tPPmrG6vhTrrqPXEhsIQpjbgcHlPspJjUWipiYHFbMbcecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765349500; c=relaxed/relaxed;
	bh=QbLF06aoc9AEQM4U6440jWePKSqPQqSALf4CCdrTQVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gRmhJqXUwKjPe/2NREzPlGhWNlUX45UFVRxs8i0cLFvGFgTkz20MWmlREa0k2SqO8SGI/h7KNpqpMfNCh53pzGmiS5s4hm64hm0XnYnzVZ3t9w5lkPJpNkmlfXJ4lYEL/0J+CY0oWumPZc3un9guRQfYPA0reOz7pkmz3GrheO/DnHmYq+cJSLqqc29Viheec35nDFw+nZplBxzOe/m5ch+UTc6jQLPvmadqHT8nmVibG9MEHFto0LRt1kWJomhoZzLTjyRACc5erbEiHVQ7K9jao8VR73DrMaZG8EgDtl/Hco5fttBle1CNXS3QZpOTnXm8Bfv/aNxAVWA6q+zuyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rEgHVN8s; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rEgHVN8s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dR5wq52tbz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 17:51:39 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BA2rXAK017674;
	Wed, 10 Dec 2025 06:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QbLF06
	aoc9AEQM4U6440jWePKSqPQqSALf4CCdrTQVI=; b=rEgHVN8sa0JsuibDc9LrcU
	dHQ7pTURWF8ztY/crvVC3KIYUd75GhamohwkYQ6J4+T4H6MTN6yjYqwLP+iwflav
	0mVRLIVVo3yYjS20jvQ00yJ+CbjBu6+dL2gixXJ69IbD7qKFY+Z/GElpgYligR4g
	0vqdcAPzI2QA9+jWtiMTVt4y+ISefNStyEaptpGvJQtFlBLet7K+f2VLVzb36Wpy
	Tjnzc2GYU6eZjy7UnL4ggIpugf38sIV/0kP4c28o42b+HlqKhKvSYFwswMOMof7T
	IhC6nbrzM3+7kvMahuKrdrOzQWaePFZsPVHZzO2QSpciz006/f1EiQeJLfLttogw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avawv8fvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 06:50:53 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BA6mOxP005045;
	Wed, 10 Dec 2025 06:50:53 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avawv8fvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 06:50:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BA5Orrw009044;
	Wed, 10 Dec 2025 06:50:52 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4avytmy8dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 06:50:52 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BA6om0R52691440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Dec 2025 06:50:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AB972004B;
	Wed, 10 Dec 2025 06:50:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D22D20040;
	Wed, 10 Dec 2025 06:50:44 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.106.237])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Dec 2025 06:50:43 +0000 (GMT)
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
Subject: [PATCH bpf-next v4 2/2] powerpc64/bpf: Inline bpf_get_smp_processor_id() and bpf_get_current_task/_btf()
Date: Wed, 10 Dec 2025 12:20:33 +0530
Message-ID: <89abfdd6f6721fbe7897865e74f2f691e5f7824a.1765343385.git.skb99@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1765343385.git.skb99@linux.ibm.com>
References: <cover.1765343385.git.skb99@linux.ibm.com>
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
X-Proofpoint-GUID: y7vsctMC0RIf_zRLlguJP1a5Z7zJjdzg
X-Proofpoint-ORIG-GUID: 93ch5fYpdkuJsbwMfJ0peuFYBRqELjkP
X-Authority-Analysis: v=2.4 cv=aY9sXBot c=1 sm=1 tr=0 ts=6939184e cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=mFN1cuOBngCmvTvEACsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAwNyBTYWx0ZWRfX8F/dSIpgjExQ
 1j/gEPEbu6eRgjuaT/e3IVj5ZQ/lNiHnpETSvjv0OoJqc4shiT+VkOOsqmxohsZjre7vR1W/dUl
 P3BOelPJHicqr0FKxxqJsajmud1T2lbShcl0BvdI35mVrBra4m3hQqLzr1e8xPRjgIYZPNRrexB
 bE8E/B8oPnC7Rwh87fpfglIlyonqAbayDnWgB61Jz4s7ybjWx8goy0Wje6Eef3/qeWyDjehlPqv
 2tl2VRkc9O8fFSAIw8hE2yad+5aQxucLIBa0tB6gn0wj3duU8BIcJqV6FUOhypD4nPiDa9phHIn
 mEwYtHLIpN+CTjIpcwo+MLaVZtq0M4uqvM3dy03JcCjvgzp4X2KLWYO537sGS29tzxXKhPPvYFI
 hxtxDu2sdmuUjjV4qi7xHCbsQ9KDQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060007
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Inline the calls to bpf_get_smp_processor_id() and bpf_get_current_task/_btf()
in the powerpc bpf jit.

powerpc saves the Logical processor number (paca_index) and pointer
to current task (__current) in paca.

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
| glob-arr-inc  | 40.701 ± 0.008M/s | 55.207 ± 0.021M/s |   + 35.64%   |
| arr-inc       | 39.401 ± 0.007M/s | 56.275 ± 0.023M/s |   + 42.42%   |
| hash-inc      | 24.944 ± 0.004M/s | 26.212 ± 0.003M/s |   +  5.08%   |
+---------------+-------------------+-------------------+--------------+

[1] https://github.com/anakryiko/linux/commit/8dec900975ef

Reviewed-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c   | 12 ++++++++++++
 arch/powerpc/net/bpf_jit_comp64.c | 11 +++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index d53e9cd7563f..b243ee205885 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -471,6 +471,18 @@ bool bpf_jit_supports_percpu_insn(void)
 	return IS_ENABLED(CONFIG_PPC64);
 }
 
+bool bpf_jit_inlines_helper_call(s32 imm)
+{
+	switch (imm) {
+	case BPF_FUNC_get_smp_processor_id:
+	case BPF_FUNC_get_current_task:
+	case BPF_FUNC_get_current_task_btf:
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
index 37723ee9344e..6c827e7aa691 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -1400,6 +1400,17 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		case BPF_JMP | BPF_CALL:
 			ctx->seen |= SEEN_FUNC;
 
+			if (src_reg == bpf_to_ppc(BPF_REG_0)) {
+				if (imm == BPF_FUNC_get_smp_processor_id) {
+					EMIT(PPC_RAW_LHZ(src_reg, _R13, offsetof(struct paca_struct, paca_index)));
+					break;
+				} else if (imm == BPF_FUNC_get_current_task ||
+					   imm == BPF_FUNC_get_current_task_btf) {
+					EMIT(PPC_RAW_LD(src_reg, _R13, offsetof(struct paca_struct, __current)));
+					break;
+				}
+			}
+
 			ret = bpf_jit_get_func_addr(fp, &insn[i], extra_pass,
 						    &func_addr, &func_addr_fixed);
 			if (ret < 0)
-- 
2.51.0


