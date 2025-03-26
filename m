Return-Path: <linuxppc-dev+bounces-7337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C207A7163E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Mar 2025 13:08:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZN5D64h0Cz2ykX;
	Wed, 26 Mar 2025 23:08:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742990918;
	cv=none; b=P5sM/XohOaz0Da2cDyOapvVVcfNrT0T2WPRMcphxmT+0mNIhYjGx9o7BFkv/rLq5a7pdbI3Boy4KXw92YlKuPwnN6sSMCJkiWlrIE39zB6MlkuQ1wwD7VFn7A6ppjZWOIS7CmiTMgwayJBgZhE2lYcTjOiZckYbYtRyLMvm878hwe/arvo9DtUnxmqsB1DQT2RlbxvsVMeBdPLZZTaSpTRVzOpKgjzQN9OR23ZXy4q2rc/peiEIJ9h98iFpuTGHXGFap3RCV22VjdbZxStTPbmaXx0/y4U7Kg9MkVoce/F5qHkcKK/8btRzg5h2rsqMX7rMlnqD8rXjdh5Iiji2Wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742990918; c=relaxed/relaxed;
	bh=scsnGuI4cun0Pezz+whqX+7I1f1DZvHWO46k2SNU/Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DNMzoPUkPc/SXT3jg3ZVkcYrFpXMxFJcYVqrBYiemLIDQhQrarPoWJQ3YEylwdLn4Dg09rGINFir8TgX0ro+x+Uw6h+HlC8NmoQ9nfPrOVmkJ5w/Hs55tqUdkbLwxrCVl8uyo0wGXMU82QRnxgp67sNtYlDX/D8DJEfpvPNt7JjkAFVThIOhffvyF1hn26J/gkyD91DNq+K76Uk3win+lrWWV24zDCk1+s9hUMyN9PvTNsArnxg+MHtQPZtdPUBhdDu0EbMuMw96l6X7W+H/tlhjKO3OS9aiVyoOaFXIUgJgHngC2r/wgcOv3MfD9JbWCHaIyusJ0deOwWvKo0w6aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IdpyvnCk; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IdpyvnCk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZN5D45hR0z2ygg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Mar 2025 23:08:36 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q1jDcT026988;
	Wed, 26 Mar 2025 12:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=scsnGuI4cun0Pezz+whqX+7I1f1DZvHWO46k2SNU/
	Hk=; b=IdpyvnCkf6UiB4n8i++o1byKwDuenD/Z1iXLh28PSOLPqKguaF7aqiuUT
	/txcKe1/HmhB5JzH5q7+Ha32WSQdKC/HzGI01HVcbRgiKf0WEO6wgceQ98TgOpjp
	qnQP+KvZ+2jBxbiIkPWFKPvokobOtD/L20RifJGOX7bcLCq1/8ZKNwTj2PcVtO2Q
	MJ+chcISqGTczuKoIjpo85UBAA4CNtHzym0SR2hHyRzvRz6n8C93OsPuEaaRRKfk
	zx8TKO0AV5JxDi8zWOGPtkrKwX62+jbwDGncM82/LPneq3p0YmlKwad/wio7Q02J
	7EnKPIWlswlaof9vmgAInclzet54w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kbjx2nrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 12:08:09 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52QC3hcj027642;
	Wed, 26 Mar 2025 12:08:08 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kbjx2nr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 12:08:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52QBsZYW005801;
	Wed, 26 Mar 2025 12:08:08 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45ja82fxaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 12:08:07 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52QC84Bn21954864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Mar 2025 12:08:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A1752004B;
	Wed, 26 Mar 2025 12:08:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 747CE20040;
	Wed, 26 Mar 2025 12:08:01 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.113.131])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Mar 2025 12:08:01 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>, stable@vger.kernel.org
Subject: [PATCH] powerpc64/bpf: fix JIT code size calculation of bpf trampoline
Date: Wed, 26 Mar 2025 17:38:00 +0530
Message-ID: <20250326120800.1141056-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XqlQA9WjzOD7z2NE0J22XdWUXsPLNiVH
X-Proofpoint-ORIG-GUID: 9CHHgm0--2r1Zri-QBe13F6AWbFgBKqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_04,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 clxscore=1011 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=616 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503260073
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The JIT compile of ldimm instructions can be anywhere between 1-5
instructions long depending on the value being loaded.

arch_bpf_trampoline_size() provides JIT size of the BPF trampoline
before the buffer for JIT'ing it is allocated. BPF trampoline JIT
code has ldimm instructions that need to load the value of pointer
to struct bpf_tramp_image. But this pointer value is not same while
calling arch_bpf_trampoline_size() & arch_prepare_bpf_trampoline().
So, the size arrived at using arch_bpf_trampoline_size() can vary
from the size needed in arch_prepare_bpf_trampoline(). When the
number of ldimm instructions emitted in arch_bpf_trampoline_size()
is less than the number of ldimm instructions emitted during the
actual JIT compile of trampoline, the below warning is produced:

  WARNING: CPU: 8 PID: 204190 at arch/powerpc/net/bpf_jit_comp.c:981 __arch_prepare_bpf_trampoline.isra.0+0xd2c/0xdcc

which is:

  /* Make sure the trampoline generation logic doesn't overflow */
  if (image && WARN_ON_ONCE(&image[ctx->idx] >
			(u32 *)rw_image_end - BPF_INSN_SAFETY)) {

Pass NULL as the first argument to __arch_prepare_bpf_trampoline()
call from arch_bpf_trampoline_size() function, to differentiate it
from how arch_prepare_bpf_trampoline() calls it and ensure maximum
possible instructions are emitted in arch_bpf_trampoline_size() for
ldimm instructions that load a different value during the actual JIT
compile of BPF trampoline.

Fixes: d243b62b7bd3 ("powerpc64/bpf: Add support for bpf trampolines")
Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/6168bfc8-659f-4b5a-a6fb-90a916dde3b3@linux.ibm.com/
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 2991bb171a9b..49d7e9a8d17c 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -686,7 +686,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	 *                              [                   ] --
 	 * LR save area                 [ r0 save (64-bit)  ]   | header
 	 *                              [ r0 save (32-bit)  ]   |
-	 * dummy frame for unwind       [ back chain 1      ] --
+	 /* dummy frame for unwind       [ back chain 1      ] --
 	 *                              [ padding           ] align stack frame
 	 *       r4_off                 [ r4 (tailcallcnt)  ] optional - 32-bit powerpc
 	 *       alt_lr_off             [ real lr (ool stub)] optional - actual lr
@@ -833,7 +833,12 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	EMIT(PPC_RAW_STL(_R26, _R1, nvr_off + SZL));
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
-		PPC_LI_ADDR(_R3, (unsigned long)im);
+		/*
+		 * Emit maximum possible instructions while getting the size of
+		 * bpf trampoline to ensure trampoline JIT code doesn't overflow.
+		 */
+		PPC_LI_ADDR(_R3, im ? (unsigned long)im :
+				(unsigned long)(~(1UL << (BITS_PER_LONG - 1))));
 		ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
 						 (unsigned long)__bpf_tramp_enter);
 		if (ret)
@@ -889,7 +894,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 			bpf_trampoline_restore_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
 
 		/* Reserve space to patch branch instruction to skip fexit progs */
-		im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
+		if (im)
+			im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
 		EMIT(PPC_RAW_NOP());
 	}
 
@@ -912,8 +918,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		}
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
-		im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
-		PPC_LI_ADDR(_R3, im);
+		if (im)
+			im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
+		/*
+		 * Emit maximum possible instructions while getting the size of
+		 * bpf trampoline to ensure trampoline JIT code doesn't overflow.
+		 */
+		PPC_LI_ADDR(_R3, im ? (unsigned long)im :
+				(unsigned long)(~(1UL << (BITS_PER_LONG - 1))));
 		ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
 						 (unsigned long)__bpf_tramp_exit);
 		if (ret)
@@ -972,7 +984,6 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
 			     struct bpf_tramp_links *tlinks, void *func_addr)
 {
-	struct bpf_tramp_image im;
 	void *image;
 	int ret;
 
@@ -988,7 +999,13 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
 	if (!image)
 		return -ENOMEM;
 
-	ret = __arch_prepare_bpf_trampoline(&im, image, image + PAGE_SIZE, image,
+	/*
+	 * Pass NULL as bpf_tramp_image pointer to differentiate the intent to get the
+	 * buffer size for trampoline here. This differentiation helps in accounting for
+	 * maximum possible instructions if the JIT code size is likely to vary during
+	 * the actual JIT compile of the trampoline.
+	 */
+	ret = __arch_prepare_bpf_trampoline(NULL, image, image + PAGE_SIZE, image,
 					    m, flags, tlinks, func_addr);
 	bpf_jit_free_exec(image);
 
-- 
2.48.1


