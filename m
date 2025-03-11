Return-Path: <linuxppc-dev+bounces-6904-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F41EA5CBCA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 18:12:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC0gF69Mxz3bt2;
	Wed, 12 Mar 2025 04:12:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741709448;
	cv=none; b=SgeG0Sg1OM3BGl1fVda9rxGnN4LEqeDiOB81LaQoJXOmb28HxN0haEwCkB6kVt0umyZSkF8wzx5YCBqTOxplDtvQ27mtTFLzU49Htk13dtRRivA0X0JuGj+/2sI59T3c2pMVCOV2UsW+YMyHS+LpQN9+lXtthAt44b9mMRF5cleh+Etjc1RgHJCer37A0lnKPIlmelTel7GbGzyCQ3uH0zU1h+QqCM92q/6kcmnrPMou9N5iogmcvyJnGMMNGXZJDdaX6G+Ezh7TjA8KAE0BeeQ3V2fVn6NAqWbWuQ5MCMrDWtShuABkbQvbFG4HA5ktjsjxNg8TjzEqoeU6XofhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741709448; c=relaxed/relaxed;
	bh=Jv1fGftg/uim+xZRR7VPpUsV80Qzy0jWJVMVZGFKJzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dJjLFQbcRBT8X8/sEp7GC/+woCAzvjbQXRawUmfMSRcbtWsEkLti3txEln37SpjNvOoW7hQ8ngnWA3S9PN9cSmaB4WfAnTQk4jXrL9iNxCHIydY/8hiMnbgMJB8brmO74mmN8989yWuMB8GLUnHlzcVsrcfecgDs94qc9nwOv1XVCPQco8PYyNPPWklL7q+xc1XeH1vC5QI3jWC9fSFOXcacO+L4KK8D3IpXv/ljLWoHn1egjbwbc1YimDb8ztVoH9tWjzY5M/BCJ/ifMgovxRtURzo/VDMcJWnIDYUussMbzbZfY2mkY9ohB+fc3yOJvxF4AjxRjedRz8McmUsiLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o0TCxewC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o0TCxewC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBzJR0b6Yz3blk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 03:10:46 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BC3JRk003445;
	Tue, 11 Mar 2025 16:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Jv1fGf
	tg/uim+xZRR7VPpUsV80Qzy0jWJVMVZGFKJzQ=; b=o0TCxewCVk0T6ojt5lYFNd
	5a7aVrQVGzrrhbUYpFpQcq6bMSED4K8penn4mrPwmep5l2oDGYcUu6qhIh6LJA7+
	z2mY+cD3SKy/Cv6P0kEocW8g5eTI1PKE/1SnkO8G1yA1MSMvQDHq2LVXjYBBTuaP
	exU9ShSp1FmMQ1SDW42DTEyCEfGeXKQeE0qjQJl6UbKypuiaFSPJzUCvwtD6ilBZ
	DjGV3LCo8ZBO+qrTjI8DtwC16+cGxeFVJXkpXnjGtytLA4anPEawc5nPfZiYloqI
	HcvUO9mrw7PWd4sl747d4BVLYHn+VEpzvKcR5uyBk9+kcl55Sy75bMaXoUczzaOA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45adjb3s82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 16:10:15 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52BG97xH001556;
	Tue, 11 Mar 2025 16:10:15 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45adjb3s7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 16:10:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52BFtqWJ006987;
	Tue, 11 Mar 2025 16:10:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45907t5913-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 16:10:14 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52BGAAQF56885632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 16:10:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF02E2004B;
	Tue, 11 Mar 2025 16:10:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26ED220040;
	Tue, 11 Mar 2025 16:10:05 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.96.240])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Mar 2025 16:10:04 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: ast@kernel.org, hbathini@linux.ibm.com, andrii@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, eddyz87@gmail.com,
        song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
        jolsa@kernel.org, christophe.leroy@csgroup.eu, naveen@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH 1/2] powerpc, bpf: Support internal-only MOV instruction to resolve per-CPU addrs
Date: Tue, 11 Mar 2025 21:39:54 +0530
Message-ID: <20250311160955.825647-2-skb99@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: SbObSsazE-_vAdH6ansVpz51laznm6K_
X-Proofpoint-GUID: M20SgSxcpPeqKXZm4nH5Mg0jztoWNQLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 adultscore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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

mr dst_reg, src_reg		//Move src_reg to dst_reg, if src_reg != dst_reg
ld tmp1_reg, 48(13)		//Load per-CPU data offset from paca(r13) in tmp1_reg.
add dst_reg, dst_reg, tmp1_reg	//Add the per cpu offset to the dst.

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
 arch/powerpc/net/bpf_jit_comp64.c | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 2991bb171a9b..3d4bd45a9a22 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -440,6 +440,11 @@ bool bpf_jit_supports_far_kfunc_call(void)
 	return IS_ENABLED(CONFIG_PPC64);
 }
 
+bool bpf_jit_supports_percpu_insn(void)
+{
+	return true;
+}
+
 void *arch_alloc_bpf_trampoline(unsigned int size)
 {
 	return bpf_prog_pack_alloc(size, bpf_jit_fill_ill_insns);
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 233703b06d7c..06f06770ceea 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -679,6 +679,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		 */
 		case BPF_ALU | BPF_MOV | BPF_X: /* (u32) dst = src */
 		case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
+			if (insn_is_mov_percpu_addr(&insn[i])) {
+				if (dst_reg != src_reg)
+					EMIT(PPC_RAW_MR(dst_reg, src_reg));
+#ifdef CONFIG_SMP
+				EMIT(PPC_RAW_LD(tmp1_reg, _R13, offsetof(struct paca_struct, data_offset)));
+				EMIT(PPC_RAW_ADD(dst_reg, dst_reg, tmp1_reg));
+#endif
+			}
 			if (imm == 1) {
 				/* special mov32 for zext */
 				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 0, 31));
-- 
2.43.5


