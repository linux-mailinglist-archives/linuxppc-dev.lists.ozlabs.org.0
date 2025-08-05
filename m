Return-Path: <linuxppc-dev+bounces-10637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A4BB1AE45
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 08:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx3RT3xhDz3bnx;
	Tue,  5 Aug 2025 16:29:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754375349;
	cv=none; b=Aecg4GA7woP5F3//dtVgXKta2GWrIGzVH20cm1J+6GCU2vc/yrr2RoGLguUt6LCC3ejXByJOwAkBjOu23ely38mnVeSvjYbi76VwLiAWa5AGUcC4KBVYjeEUQM8Lf32D0OVkHQbyHqsjprHjME7fgpocn6xLlfv39nwvqQKVeXJ4D9aIi6aLtOR3T9KsaogBu0rOqYB+AdopEOinXs2chjnb3L3Wtt7MHv2vQg4IBH+x5W0ePB5WCeNldKQF8QVNU0VctxvCXZ5YpAgJLznx+pDEASTLuTAe0bF6EmrZOulvSgt+s5BXjCoY56RHy1GAufU+cftizlfa+m54LNdI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754375349; c=relaxed/relaxed;
	bh=uhzL7P2FrLNBos/3nOcYYmspoIQ7MwiJYiElhliJago=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XePhemWPNIYK5bKdg4dOEC20a6plxxNc2cxFk9FruzEridi8Wyasv3IMc+YtYA63Hylzm763JIHZY+2KeuFqIQUOZ1K7szTFtF/KGc3k27vdLuMYMLV9HHDXf5SK60AYAXKnkHbs06yhvjh3AZ5CYNFb4+SrAJf2SF/bLX0OlUufPPBv11IRy1+6unqUvj2ZsyhbASixjOQN/4LdoOe3uxskyLLrK4cnhxfrAW86CGdxmR0LBQ65LU7kjZMxOWBwzAI7nLhlnEiAeQppK6uY9QbvCW+7THTpq6zKmvPja/tAdZRTrJG/0RlH3LjTYqxcijvwnguIA535drEWzHNMGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lhf/OAhu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lhf/OAhu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bx3RS5KBbz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 16:29:08 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5754uRhM001482;
	Tue, 5 Aug 2025 06:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=uhzL7P2FrLNBos/3n
	OcYYmspoIQ7MwiJYiElhliJago=; b=lhf/OAhusMFg1eIUk73SCGfvMFKnjH9Fz
	zDEFiORBreruzcYMioMPXc2qkA2sz+nECe/JdwOiUqgvuogNN6bWv81xk+ax2NOt
	5wF1iEg87umKEpOhD4CWMncZ8FTve2739sup/TJirQCYA+qAQxQlUDHVqGDxA3VV
	ZE+3QUfWTj26v4YmdmACDtA0VmRTi5zNsbZXk7utjDtiOA0tRL+sht7MGqRYU8v4
	9LmjSpAi8VXhc7UfAajeiumTMFuIvi5Zw7JaW0zUzRmXpjnjY2dtIwvHdJhQLlum
	ifEVl9g94chJ3KgFomcCdHD7EHltaxU1u2aPThzbtmLH/P5hSmHhw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bbbq09um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 06:28:44 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5756SiZF018116;
	Tue, 5 Aug 2025 06:28:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bbbq09uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 06:28:44 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57550Siw001508;
	Tue, 5 Aug 2025 06:28:43 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 489y7ks11j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 06:28:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5756SdCt19530024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Aug 2025 06:28:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BC2020043;
	Tue,  5 Aug 2025 06:28:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6329920040;
	Tue,  5 Aug 2025 06:28:32 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.39.141])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Aug 2025 06:28:32 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
Subject: [bpf-next 5/6] bpf,powerpc: Implement PROBE_ATOMIC instructions
Date: Tue,  5 Aug 2025 11:57:46 +0530
Message-ID: <20250805062747.3479221-6-skb99@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250805062747.3479221-1-skb99@linux.ibm.com>
References: <20250805062747.3479221-1-skb99@linux.ibm.com>
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
X-Proofpoint-GUID: cMapiujoCaDYWPc6M9nlonA3aMn4IR7W
X-Authority-Analysis: v=2.4 cv=M65NKzws c=1 sm=1 tr=0 ts=6891a49c cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=I9DJoMOgBESJXZyRRMQA:9
X-Proofpoint-ORIG-GUID: DOHj20Ewu0d5mY2NQXm-zlLvBjAbqg4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NSBTYWx0ZWRfX2QrxuUck/E//
 pm7s8+xq1uWVnBtf9t2bH3Kneh1Bb63rmsIOD95BH3gxQM+Pc985+bb4HndNDkwTmGoqgOrPYxG
 d8qMdGKj9ZW8g5LayUOuDwk+aH+9CgBlhMnGAoQJdC3APy0CEx9TDnCZUMX892mP0ttHd2Anw/Y
 q8pRZZNbXMXxGCpvx5L4f49ZitFtvg8O68weQmLnQG35tXVqRC5i+Ee8mgKpwtvPKm/ynXAP1yD
 k1k9m8Qzzof2ScW/OKUK5b3jse/IA1yan1hMezltVPHRfnfJu0YAHjxw2J/fdiLacrS8k3B3tq7
 voPGUfbsFyf753FSWqkC+282qbFYnRDi5p8lMhbnXd0PHmNEl9nrix1kuA2UYVtLVs7psBpSXIz
 eKn5+1b8ZzjWGndjbnWLt3xTLqo341TKynpYzdomYdeFDVSkF6OlFdODY8qpy6MY2HKcte0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=896 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050045
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

powerpc supports BPF atomic operations using a loop around
Load-And-Reserve(LDARX/LWARX) and Store-Conditional(STDCX/STWCX)
instructions gated by sync instructions to enforce full ordering.

To implement arena_atomics, arena vm start address is added to the
dst_reg to be used for both the LDARX/LWARX and STDCX/STWCX instructions.
Further, an exception table entry is added for LDARX/LWARX
instruction to land after the loop on fault. At the end of sequence,
dst_reg is restored by subtracting arena vm start address.

bpf_jit_supports_insn() is introduced to selectively enable instruction
support as in other architectures like x86 and arm64.

Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c   | 16 ++++++++++++++++
 arch/powerpc/net/bpf_jit_comp64.c | 26 ++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 2b3f90930c27..69232ee56c6a 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -452,6 +452,22 @@ bool bpf_jit_supports_far_kfunc_call(void)
 	return IS_ENABLED(CONFIG_PPC64);
 }
 
+bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
+{
+	if (!in_arena)
+		return true;
+	switch (insn->code) {
+	case BPF_STX | BPF_ATOMIC | BPF_H:
+	case BPF_STX | BPF_ATOMIC | BPF_B:
+	case BPF_STX | BPF_ATOMIC | BPF_W:
+	case BPF_STX | BPF_ATOMIC | BPF_DW:
+		if (bpf_atomic_is_load_store(insn))
+			return false;
+		return IS_ENABLED(CONFIG_PPC64);
+	}
+	return true;
+}
+
 void *arch_alloc_bpf_trampoline(unsigned int size)
 {
 	return bpf_prog_pack_alloc(size, bpf_jit_fill_ill_insns);
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 6a85cd847075..8931bded97f4 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -1164,6 +1164,32 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 
 			break;
 
+		/*
+		 * BPF_STX PROBE_ATOMIC (arena atomic ops)
+		 */
+		case BPF_STX | BPF_PROBE_ATOMIC | BPF_W:
+		case BPF_STX | BPF_PROBE_ATOMIC | BPF_DW:
+			EMIT(PPC_RAW_ADD(dst_reg, dst_reg, bpf_to_ppc(ARENA_VM_START)));
+			ret = bpf_jit_emit_atomic_ops(image, ctx, &insn[i],
+						      &jmp_off, &tmp_idx, &addrs[i + 1]);
+			if (ret) {
+				if (ret == -EOPNOTSUPP) {
+					pr_err_ratelimited(
+						"eBPF filter atomic op code %02x (@%d) unsupported\n",
+						code, i);
+				}
+				return ret;
+			}
+			/* LDARX/LWARX should land here on exception. */
+			ret = bpf_add_extable_entry(fp, image, fimage, pass, ctx,
+						    tmp_idx, jmp_off, dst_reg, code);
+			if (ret)
+				return ret;
+
+			/* Retrieve the dst_reg */
+			EMIT(PPC_RAW_SUB(dst_reg, dst_reg, bpf_to_ppc(ARENA_VM_START)));
+			break;
+
 		/*
 		 * BPF_STX ATOMIC (atomic ops)
 		 */
-- 
2.43.5


