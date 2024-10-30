Return-Path: <linuxppc-dev+bounces-2706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0B9B5C5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 08:10:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XddYG5j6Vz2yw7;
	Wed, 30 Oct 2024 18:09:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730272194;
	cv=none; b=d92QDsPE2loXfUGF5Jw34VxTh/AWjv0pC5tFWcysHhQOUcoDnSv9vKYotYc9Z5f0kAM5jzIqQyMypnQrBZ1g2Yo+ysrnOgdyyQdzdAlBKpODy3Fv2XcHlKpMadBTUgQkMVOtG+DvOD04jMRCp8ojg9JCO/i7ssykku3d0Ga5niqdO1DUr9ClVRpYSisGkUt5odfs6zl4l2E0xFD32TlZfjLqwzWDwNB1nYf0kUWElJ4/JvTe70e8Nmcn5eqde5SYYIlzIDutj+BIFtWF/eqDh9LqpvXealGLCWaV5A4WgO3lLPFoaavBE6Hw6j/4zjN+nDcVoSL6RfptgRkmeZsksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730272194; c=relaxed/relaxed;
	bh=kAoXvrxFta9cBIVUeDwH1olDJxnj60yFKDI048Sn4vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nG60fpF9ZAi3uDFNh1QGxl0ZaVXctePrDlf6umG7IrHqN0Tmof+k6stUToXdLaE0mtNRx8/bFA3SGqFHKaLxnK9lEueYsg5PGUmVAcWL07SNYKt6V+fxMYM4sX1njwuGFRhTDDPbPT9pq0sP5YWY/KxsG4AM8d7DiQ6MekNmtSOjaxAK6ZHlSPxaZmuUkDrBsRgRRmHmAOBBJl5cyYEYHk0TaJxgciB+gi/NRd8KqLOD1etVU1Ael6P1nhTvKnuUmIUaNTih2y7V1WhAe6kIhmhNN8R3cxtGBFUtZ1+Yrk0XeGBZF/yudmkTHViRA6imH1Ju5iQ3ByveO3MjlXgGdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QuIvtXby; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QuIvtXby;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XddYF5Zdnz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 18:09:53 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U2d2Q4023917;
	Wed, 30 Oct 2024 07:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=kAoXvrxFta9cBIVUe
	DwH1olDJxnj60yFKDI048Sn4vE=; b=QuIvtXbyMWIWcsEgvTxmHCu1+5+hhke5L
	AgAsKB9Dw4061/KqYpJZeY6XygPUyDq92f4YPvu86pA0LsYud5U9ZRLHfhzQwKsZ
	EhjmvT1toMxrG48slccDCuDXd4Zr2bz2cO/jvBLlr1gr4+Ti/GoBkICKVn6KOtI9
	eg2gIBq+SlEvh3QpjBF8PHIhr+PPByBuGKCx3vYKJHGeul+bNxQAiFwlTj40zeoZ
	T3Ts5twyH4CckF7P1DevvcNQOVF5KtvKUk8kvwoTlpTxUmpdvplfeaT+Sry4LbhB
	jjJJmXSuBsFP585Y6SNcyTb00MZqi4z37M1oMCvAqdc/4vm7JXCsw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42jyhbmb7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:28 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49U79SU9005297;
	Wed, 30 Oct 2024 07:09:28 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42jyhbmb7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:28 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49U3WkRc013553;
	Wed, 30 Oct 2024 07:09:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42hbrmxw5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:27 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49U79N7X57934164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2024 07:09:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A948D2004B;
	Wed, 30 Oct 2024 07:09:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1665720043;
	Wed, 30 Oct 2024 07:09:20 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.143])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Oct 2024 07:09:19 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v7 07/17] powerpc/ftrace: Skip instruction patching if the instructions are the same
Date: Wed, 30 Oct 2024 12:38:40 +0530
Message-ID: <20241030070850.1361304-8-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030070850.1361304-1-hbathini@linux.ibm.com>
References: <20241030070850.1361304-1-hbathini@linux.ibm.com>
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
X-Proofpoint-GUID: GBMiugjyLd0b8gvQjbkREbV1gGerRkzC
X-Proofpoint-ORIG-GUID: yeYOmkZEzNvk1I5Zbqc0lKadHVwZSo8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 mlxlogscore=816 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300051
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Naveen N Rao <naveen@kernel.org>

To simplify upcoming changes to ftrace, add a check to skip actual
instruction patching if the old and new instructions are the same. We
still validate that the instruction is what we expect, but don't
actually patch the same instruction again.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index fe0546fbac8e..719517265d39 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -82,7 +82,7 @@ static inline int ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_
 {
 	int ret = ftrace_validate_inst(ip, old);
 
-	if (!ret)
+	if (!ret && !ppc_inst_equal(old, new))
 		ret = patch_instruction((u32 *)ip, new);
 
 	return ret;
-- 
2.47.0


