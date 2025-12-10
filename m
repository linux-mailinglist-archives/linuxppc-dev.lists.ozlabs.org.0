Return-Path: <linuxppc-dev+bounces-14709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F41CB21CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 07:51:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dR5wl4B7fz2y6G;
	Wed, 10 Dec 2025 17:51:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765349495;
	cv=none; b=ICkB1QQrz8ft+7E5Q3pmmrSL+4w8GbJqBKtV2NK9xAkT4OxSFsXP9P9C5piLNI5PDcHoNtYDggg7lL/rZNEU/4AL1tOU0eFpuhkLWkDm7bWC0Prb88rNP9kh5HT8Kt/FicsZdO4WlP2cjcdazg+cBbRnaOg3DAR4ja9WjmUlaqpQsK4GjPa9zzuGAkmdpES3GSO4V6lETGP3zPb8j83mVCCY54UTMkjPMQ4IxhwgOteUPN3xiChShlz2MDuy5mZaUiFxHzHAODBr9FkQMZiPYnoBOlGDJf0Wge4HmmmRAuU5ZXIh2K173DIli3j59xOOEd9E5dUW8EEEW3Fbe4FjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765349495; c=relaxed/relaxed;
	bh=0rK2IOiUGAkM/mNsYabEdDO/wutkuOM7n3/9Wiu70Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oCZrP4QBw6lZDqnI0QNclMceaMDF9tov208e8A5cy2rL19/b0uQhICVD1MjBUCLghHCZZKv1Bu2gP4nl+a+Zzxi5TFrwRIBSqgd/Nvy/aywf2v4pjxKhoLxeTXDm1GG1MrZipKqLU54VN6/+tgiMV2ipvfC4lfROtRgvuCIhDq1pdJdLvxYGwmKK6a8IsDnhdXikAoR/W5INHqlKRDNEX/AbTkiPBm6IRH0tntKaC1rf1dB7hRdQkpA+yzqjc8TrfWEintCLfKcAH3m2ZkxFNtq4tbz+IDshPoyiqKICAznHepUEZy1A/6OjIUPOcC9lzf7ddzaiaZ1+VzlkfgWhSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SlyqUnp4; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SlyqUnp4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dR5wk1FC7z2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 17:51:33 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B9Ihnxq021763;
	Wed, 10 Dec 2025 06:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0rK2IO
	iUGAkM/mNsYabEdDO/wutkuOM7n3/9Wiu70Zg=; b=SlyqUnp4axuNabQbnVfc+r
	dkFiL17uTKO5cRM4O1V7gkEQNlwDSnIF70jptWAQKSPtWs5huQLhPmayVe14k/YB
	jr7fo5kXMP8IJIgiVKip8ZbWLRWK1m8x/PXfNdztaU1ToOnEANLlxwRoMPEnW6vX
	35xqP82Ne0HiVM36vQPYxbjV5Ym1XSnNYyx9jRX/oAkbY87zY4V1sGjgPBAoEl0C
	/ATJRvQ4VFdboYgZtoT7h/KKXhchDsMP5j7YyPkMcpxvA0F8Iea3+jnDxDkM0gSd
	lybpRQdvpFuxqKmYvrkln7ubdFoZQ1h+ZYtpjb3f/eoyQAyzJFuuSXx+oS+8VPXw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc7c0ykj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 06:50:49 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BA6ehoB026297;
	Wed, 10 Dec 2025 06:50:48 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc7c0ykc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 06:50:48 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BA3JKYn026782;
	Wed, 10 Dec 2025 06:50:47 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aw1h16x8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 06:50:47 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BA6ohHo27853260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Dec 2025 06:50:43 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C180820043;
	Wed, 10 Dec 2025 06:50:43 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CC2A20040;
	Wed, 10 Dec 2025 06:50:38 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.106.237])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Dec 2025 06:50:38 +0000 (GMT)
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
Subject: [PATCH bpf-next v4 1/2] powerpc64/bpf: Support internal-only MOV instruction to resolve per-CPU addrs
Date: Wed, 10 Dec 2025 12:20:32 +0530
Message-ID: <667fdaa19c1564141f6cd82e75b2be86a42c0f96.1765343385.git.skb99@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: K7dWoI8ciPH-qciuCKJoWnC9DAa1k4n0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX42YocgbV0lCZ
 cWjGmzn3gijyYDx3Y/jmCvlE0Ligwhak6h9BpAHBq5/nIUhkFu5T/jCDqut5sKZdd9p0PfVld6X
 FCutBI6dqDONsTODaDPbS7En9xtU+E6iMlfhnpT/Tyb22Chyp2pMsT+NnGcDNDpQcYP+y6x+r3j
 BsBnSshMzPUyN9Lzn85Etq19xJDOxiG5EIaA6jkwayNmfA69/tlDCfpXyJL5oaviyGxmLw7Qmt6
 ZDpqRepebSnuWhc8GS89uYklg7IEcUDjhZW+qErePHY2NaOW1JxiqVa8UdxubC/6vXeD8IldwSS
 dAegwkVtYEI1gY51eVkEtblZEkSczTmDkstfzZvC9L3YIlYNpq+kzEcl9Q2l+mIYqEb7Cxuj24d
 RPT4JjJLgx9XwZ2X+oQDuNxtfqgUCA==
X-Proofpoint-GUID: 2k6K-rztswRo28XySV0__gw8pdpia8B_
X-Authority-Analysis: v=2.4 cv=FpwIPmrq c=1 sm=1 tr=0 ts=69391849 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=mFN1cuOBngCmvTvEACsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
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
if (IS_ENABLED(CONFIG_SMP))
ld tmp1_reg, 48(13)		//Load per-CPU data offset from paca(r13) in tmp1_reg.
add dst_reg, src_reg, tmp1_reg	//Add the per cpu offset to the dst.
else if (src_reg != dst_reg)
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

Reviewed-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c   |  5 +++++
 arch/powerpc/net/bpf_jit_comp64.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 5e976730b2f5..d53e9cd7563f 100644
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
index 1fe37128c876..37723ee9344e 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -918,6 +918,16 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		case BPF_ALU | BPF_MOV | BPF_X: /* (u32) dst = src */
 		case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
 
+			if (insn_is_mov_percpu_addr(&insn[i])) {
+				if (IS_ENABLED(CONFIG_SMP)) {
+					EMIT(PPC_RAW_LD(tmp1_reg, _R13, offsetof(struct paca_struct, data_offset)));
+					EMIT(PPC_RAW_ADD(dst_reg, src_reg, tmp1_reg));
+				} else if (src_reg != dst_reg) {
+					EMIT(PPC_RAW_MR(dst_reg, src_reg));
+				}
+				break;
+			}
+
 			if (insn_is_cast_user(&insn[i])) {
 				EMIT(PPC_RAW_RLDICL_DOT(tmp1_reg, src_reg, 0, 32));
 				PPC_LI64(dst_reg, (ctx->user_vm_start & 0xffffffff00000000UL));
-- 
2.51.0


