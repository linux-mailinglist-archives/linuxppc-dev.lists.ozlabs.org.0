Return-Path: <linuxppc-dev+bounces-13969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F374C434CB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 22:04:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3pMn3lrBz2yG3;
	Sun,  9 Nov 2025 08:04:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762635877;
	cv=none; b=KLsIcoZtfVdiju8iSPIQpeQfWhSYe8u1QnCvE4Ob2+4gp1ve/DZJywNlKX/SAJOMnqD7EtrfBx4pjUFyX9P2EILVf982dNj2Q8lXDhPqUXmrcHhLjyhx4bMuwKNyxqtPC34tWZ5nHY/lrBs59ROqIrJfGaJegU0VPWZ9YsLCzFP0OkciueOMe8am0VivozmJXtWu6rvFU4wLFyCHykOkdpOD/bn4uwtfMpXh+EW/HWM6LxS5oLMWy6IF3Wss1aPMsRedbGgSO4nHd71bbKcKNgF8/6S+TLeg/IDVGTE2Y6wyKwkZfmBOxAoff3oud0YEOkvf20IUABKBekhyWuguug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762635877; c=relaxed/relaxed;
	bh=yD5FOYcMQHWV3I1ixrjHEV4gOTTBB/wnhMvA2EERG44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJMFPSrDf6t6QGaciNQEiwmDR7b2L0AaHp6Dmu2+gBC1Qf67W9a7GZaHBq4N/oG0HbrcQYl+seMproH6ahWDdOllQs+ZWTppRjBjonVkyPQwS3GOF7XflEvAAgKX6CY3tJW5IgxSrWpXoB2nknXkvAIGe1BftnUXCJKfJALSOsuWx16lvOg/7q4tW2U8Y3ZgoQkpnsMVKDuGvIv0LE0C9mAeC+ms8sjzeAmeDmEGuw2OY6UVbBvHpepUNGNr22dxipxmbfBmvxqG3sN33msB07C1DlRIJFBVmno7qp+nzzNK5600r3wBPSuq5NSGE6r3qS3IN4mmrYs5Cw7lkPWuKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JfBzK/MM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JfBzK/MM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3pMm2mm0z2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Nov 2025 08:04:36 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8KlMnx030535;
	Sat, 8 Nov 2025 21:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=yD5FOYcMQHWV3I1ix
	rjHEV4gOTTBB/wnhMvA2EERG44=; b=JfBzK/MM4aZMGOtYwy/hV1fFjvDaw3baJ
	CShpkVfSpiW42CioYcWR3BU63CLA9XGgqnZzKEyNdo0crnqKTqcJXuP3xnK97k2v
	3O269c+G8NA7fb7tbWRWwGvhWQFkcxacUTY7dz3h5TDymrp+eu3LxgkZVBxisXEG
	AMSG57mm9tjjJ4EdjHjHQ2t07Wr2ezrsE/esncEjqWLI6L9ERoendMEmJSsgg49U
	gxsQ1dnAgyAp8w8unBO6j80CU9KZFdYH/yq8J70ElsiW7KI6DtoHPSQ4U/VqIoiR
	U84/uRpCSo+41cR7/UV/brV8OXPcr7w31GbLoNA+nw0Z1Vf8ocmWQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa3m7sc11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 21:04:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8IqhCL012872;
	Sat, 8 Nov 2025 21:04:16 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5y82g4ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 21:04:16 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A8L4CtH49152314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Nov 2025 21:04:12 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3636C20043;
	Sat,  8 Nov 2025 21:04:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAB1E20040;
	Sat,  8 Nov 2025 21:04:09 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.186])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Nov 2025 21:04:09 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-trace-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>, llvm@lists.linux.dev,
        Maryam Moghadas <maryammo@ca.ibm.com>
Subject: [PATCH 1/3] powerpc64: make clang cross-build friendly
Date: Sun,  9 Nov 2025 02:34:03 +0530
Message-ID: <20251108210405.2375472-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251108210405.2375472-1-hbathini@linux.ibm.com>
References: <20251108210405.2375472-1-hbathini@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=MtZfKmae c=1 sm=1 tr=0 ts=690fb051 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=G_DWyleSnc-e0WChyngA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: R8RaDF7NQk7DuRfqh39j0lhFdN4Ch9-w
X-Proofpoint-ORIG-GUID: R8RaDF7NQk7DuRfqh39j0lhFdN4Ch9-w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA3OSBTYWx0ZWRfX1nqKHAlZsKHm
 4kn7bJozidBb7w+Ca0WoiEeqkp7S45kAUf8HgHyDMcIQISHQKwLiRltQcQXSGT2RLFBHihWcnxZ
 aEB8kq4mKg2JunRva1g1U4d2KrM6Ll2+UcRJLE9QEngtpBsBh3O/vYkLxtBxE1zSW8jKxu6CDNi
 i0eWXPl0dOVIJaXMa6IBzKx/y1JZe9/4AtW2XWqzc0mEJuor4exjDKZ5GNLLj8Yq4/m/TaOSUFb
 GbSOBhGH9vdtCv3RfiAyyIRa/Bt33OeODrBPFyXej0ubfFTLPQgp4FVvopApuWiZc1hI8erGNY/
 yBDGFDFncb53a8+jRKpAQN9cZTt+4mgGb/P3n1kLAOMgQG/PAhFTEYL5Ahp90/lLsEEiYC4XMMa
 zsnrm5arVoXJQc0kVe/FvM1XS6BCKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080079
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

ARCH_USING_PATCHABLE_FUNCTION_ENTRY depends on toolchain support for
-fpatchable-function-entry option. The current script that checks
for this support only handles GCC. Rename the script and extend it
to detect support for -fpatchable-function-entry with Clang as well,
allowing clean cross-compilation with Clang toolchains.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/Kconfig                                         | 5 +++--
 ...-function-entry.sh => check-fpatchable-function-entry.sh} | 0
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename arch/powerpc/tools/{gcc-check-fpatchable-function-entry.sh => check-fpatchable-function-entry.sh} (100%)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 325c1171894d..dfb62e211c92 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -568,8 +568,9 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 	depends on FUNCTION_TRACER && (PPC32 || PPC64_ELF_ABI_V2)
 	depends on $(cc-option,-fpatchable-function-entry=2)
 	def_bool y if PPC32
-	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
-	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
+	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN && CC_IS_GCC
+	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) -target ppc64le -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN && CC_IS_CLANG
+	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
 
 config PPC_FTRACE_OUT_OF_LINE
 	def_bool PPC64 && ARCH_USING_PATCHABLE_FUNCTION_ENTRY
diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh b/arch/powerpc/tools/check-fpatchable-function-entry.sh
similarity index 100%
rename from arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
rename to arch/powerpc/tools/check-fpatchable-function-entry.sh
-- 
2.51.1


