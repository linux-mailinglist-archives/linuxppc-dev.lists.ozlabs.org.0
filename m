Return-Path: <linuxppc-dev+bounces-7340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B267A71894
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Mar 2025 15:35:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZN8Sx6S4fz2yr4;
	Thu, 27 Mar 2025 01:34:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742999697;
	cv=none; b=QASur5PwPNrK0u783WpHA3/0cqcYoP9cib+uOwXX+QpkM756aCyCdH5XrnVGkvlnmsHKxFVTnnW35mzomO/Wjck95TIp4Tamt4dI957DIv/KZ9tZe+rCxXozV59i3L3FtS6mPhVYzqez0NUJYChXhw6wmjtlQ4JIUHqKaca+TN+P5/djMTMwsfjLvoKJ5GIAsPxD3q1eNqfDJskHPHfBrzmyQ88+OgSfyUG4Z1dbngHVCadGQSZ4wuPws6Kj3s35+cNR/xxjJ4ZwqCehPXmCThsnir48x2WiAtVRoOmpdxu/nB17rzo+nNz2CRRyNZz3LhWFNnE1zyQVAhXErc21kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742999697; c=relaxed/relaxed;
	bh=vjZptpcOlbNxynv6rWgAxMAwmUdnew2ACRJ/iVP4Irg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cTWcuiZR8g6D1IqFXQ/ssg20aQO86i6Ja1ECMLjY5WGIrZlpxah7IcX6XCftOZNXdYcIWiQyy0rhGvWGQ1a9izWyaXeu9y/PZQi3apya/n+WU2pZ7M99GcqR0wS3i+0wJrpPoek2cHIPA9hL1vP6WCL3D4WzypODEqmURBsnsLjqSkmCataJ6mRAdsmJSgDWgN+yGgSFnoNMz/0sTpj+qpCLv6JmVxvuAiiDSVsLp//sY4+D1URsTbVtQibmDNn+pNqawEm9X7G1NEdqQ1dXudyTUf49rMYVsTACCULXORYZv0cXB/pjDeoDNayHR9zL4iM/BaTbEx0kZh0QpePiqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NBgC+P97; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NBgC+P97;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZN8Sx0GNcz2yr3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 01:34:56 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QCSApW003206;
	Wed, 26 Mar 2025 14:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=vjZptpcOlbNxynv6rWgAxMAwmUdnew2ACRJ/iVP4I
	rg=; b=NBgC+P97M+mDcKrLp60iImH7yWt18CCbQNQbjstc50caLXifrnNlUT5qU
	OkKKWqLQmeLjS6H3eWxiJkuyqvj2nVXQW4CNkgp8tOwlwTslLJIhPqXYi6j0cOex
	L2LU0XevMURJzD/7TtgKwU7gxLgt76+lLIOjayzjZhFsimgIB96dETE5A2u+dOwu
	JmDwd8Ts3ffIRChdKMSSc8feYZ8M9xz6RckcyXu6spQqRTBFzaiS0JAB5McLiITU
	Spa061dAZVQSQhlPGCl7w88SstfhIe3KW1Uhg0d5I7MCtO9xeZA5oaaySxlfhLQb
	EQpH8UHX9cjDbRdSUPnBT1XAbbbRw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mhm3rnnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:34:31 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52QEW94V026482;
	Wed, 26 Mar 2025 14:34:31 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mhm3rnnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:34:31 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52QAtqZ1009718;
	Wed, 26 Mar 2025 14:34:30 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45j9rkrhq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:34:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52QEYPgj49086956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Mar 2025 14:34:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCAE82004E;
	Wed, 26 Mar 2025 14:34:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 226DF2004B;
	Wed, 26 Mar 2025 14:34:23 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.113.131])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Mar 2025 14:34:22 +0000 (GMT)
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
Subject: [RESEND PATCH] powerpc64/bpf: fix JIT code size calculation of bpf trampoline
Date: Wed, 26 Mar 2025 20:04:22 +0530
Message-ID: <20250326143422.1158383-1-hbathini@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 84Bcj8CB_tgd0ZFQE6odoc1Chgl4awTZ
X-Proofpoint-GUID: aSupdVLRRnHCDMUp7Pi7SrliP4XM7WrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=750
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503260088
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

* Removed a redundant '/' accidently added in a comment and resending.

 arch/powerpc/net/bpf_jit_comp.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 2991bb171a9b..c94717ccb2bd 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
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


