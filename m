Return-Path: <linuxppc-dev+bounces-10487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2927B174BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 18:10:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btDb22dSwz2yLB;
	Fri,  1 Aug 2025 02:10:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753978254;
	cv=none; b=cevmNnv5FKzOkK75e1qCbdYl5+d7Nz8ZfJLPSwFCyOwgKaGtkZTQS/gpU2hFihv/8n5LeExRzkAdVXu8k80zL5IfO9Sgqtyp6Hnbz7yE+v0oKKy35v4P6h1Ha52OYVl6o08enMY00ktply/6RDzVzM+iaZ75CMVonpBT2OKgf9kwNWACFRmUjPzSm8o9JCPy5S2Js/6+3QfclEAlNfUyJxFh0PdecBtbxEU9GB9InwczAxUIL+kvH1XF1K+0e7/7ITOJJEjZOHD7tZ1cEo/RsIQ2SH70ztaJHQnXHteaMHwUBEutLSOTKZFf8dMOdJfnm7Et8sPshvoZlrHJHRR+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753978254; c=relaxed/relaxed;
	bh=AC7F7aSZ9IffCIsiUEpNx/AhsUPUBFRG5nFMl9MhQ9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fuJsa/wFhOafuYgkgXh3RDGWzXgsLG61WRdSnqZaGqRazYs9rEN/7QrzF/yV1R3JZu9NoZDaB+eMflIzdtBQWcYcoCMO1SK7+zNNRD4pzc8ZsPl6Wk4Nun26ETAjhFouX8YNQjGGQQ0ooV3CArTrfaHUrEOS8WCZviv0yJHTng4oQrBNly/aGopskhu0+iqgqARLxFCq0j7KTJOL3LPs1nKyuSJG6bgD169eX550QVE8W0u0PSgJJ5qW1erGPpNrHbg2TOzbuHIbFyBNF/doVAe81SNq+DF5DpJHeQ0gk6ctzj5FY7p2aD3skPJtrl5VKR00EMXt6MhU3sdQ4VbZ6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PTBofRPe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PTBofRPe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btDb11PkJz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 02:10:52 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VBNhuc001913;
	Thu, 31 Jul 2025 16:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=AC7F7aSZ9IffCIsiUEpNx/AhsUPU
	BFRG5nFMl9MhQ9E=; b=PTBofRPeebA02tXMmXNTks7YHMYRipuBcN5p4RJY4TKD
	Oepdwly+TUcX4meWBQDySM3ahVdNuOqtsagxcg2cAiUsPiUWorb1MMfZbrWwZIuK
	jxzVYyQUbfz+xEAvuQeeK0S8o83rTQvlPjbQRyeXnwyi4ctZ/iVV1wy5b6rsd6I9
	rQEW+KiCzbD2LR1IebgZspSUPWziR8IJCdK+zNLZD6aJXztan0+Z8pKDh0QmZNBH
	J+LGdndzZhxXe2kaxUJevKhLv5EI65ObMRfLky3Xml6/WMQG2T6KqQWFsJdRyBEc
	X5vToNAtr7gKuRURfvasV6gKSTVgs8EOKHGb9pJ14A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 486c6j1sn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 16:10:41 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56VG1niK019275;
	Thu, 31 Jul 2025 16:10:40 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 486c6j1smu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 16:10:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56VCYKrK028728;
	Thu, 31 Jul 2025 16:10:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 485c22vwhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 16:10:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56VGAaS218940160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Jul 2025 16:10:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24E552004F;
	Thu, 31 Jul 2025 16:10:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D31382004B;
	Thu, 31 Jul 2025 16:10:32 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.39.19.108])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 31 Jul 2025 16:10:32 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-kernel@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH] powerpc/mm: Switch MMU context on hash MMU if SLB preload cache is aged
Date: Thu, 31 Jul 2025 21:40:27 +0530
Message-ID: <20250731161027.966196-1-donettom@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
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
X-Proofpoint-GUID: AQlI__8eaXMhKdwYoEHMRrMuB_H_qp-d
X-Authority-Analysis: v=2.4 cv=Mbtsu4/f c=1 sm=1 tr=0 ts=688b9581 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=FINkVeRlo5BJDc_9tkUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: qTxxwih5DL7kS9UKzzfvZAzwrcxzWN2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDEwOCBTYWx0ZWRfX26fCvGxZwzzh
 I7EzrPxxTYACk3kMHw2R3w7KCHVr01z2AIVO6WTYxkma9XK81vjHqZ3wlblz16eB4Fc9VV3405a
 wiIwDBpbVM/HmSuVCUfvvxltO1v0Ae74XSGAfu0fVx3e+WPKWPQnpz2clo7SzlwIR0nTzvViZm0
 1Uq3262jFvAsaUIsBf7fxEehAq7uFlLQTawktjK8NIRj0s8X1ShGRUSH2dfGK6fX+vASSJNGT93
 c5WCubiOKmfbFJfRTtWQKpUPekR+G6v671ngzZo2MvJsx6Mj64EThMRIcksP7Df/T+ttu6ADx3O
 QH4oheAFiVAnqRnAzRLqAowKiwlFRP2ExVjThaGyFKb8VTAOqQbESWpBhDeVbTsfEPOvZehvPza
 80G2g7+WLC7dhkxn3dG/uiwU1+aUfsROheG2W2NdQ8Upj7+UEeA6I1yKt4Xg0vUuCJX8ykQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_03,2025-07-31_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310108
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On systems using the hash MMU, there is a software SLB preload cache that
mirrors the entries loaded into the hardware SLB buffer. This preload
cache is subject to periodic eviction — typically after every 256 context
switches — to remove old entry.

Currently, the kernel skips the MMU context switch in switch_mm_irqs_off()
if the prev and next mm_struct are the same, as an optimization. However,
this behavior can lead to problems on hash MMU systems.

Consider the following scenario: a process is running on CPU A and gets
context-switched to CPU B. During this time, one of its SLB preload cache
entries is evicted. Later, the process is rescheduled on CPU A, which was
running swapper in the meantime, using the same mm_struct. Because
prev == next, the kernel skips the MMU context switch. As a result, the
hardware SLB buffer still contains the entry, but the software preload
cache does not.

The absence of the entry in the preload cache causes it to attempt to
reload the SLB. However, since the entry is already present in the hardware
SLB, this leads to a SLB multi-hit error.

To fix this issue, we add a code change to always switch the MMU context on
hash MMU if the SLB preload cache has aged. With this change, the
SLB multi-hit error no longer occurs.

Fixes: 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/slb.c | 2 +-
 arch/powerpc/mm/mmu_context.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 6b783552403c..08daac3f978c 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -509,7 +509,7 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 	 * SLB preload cache.
 	 */
 	tsk->thread.load_slb++;
-	if (!tsk->thread.load_slb) {
+	if (tsk->thread.load_slb == U8_MAX) {
 		unsigned long pc = KSTK_EIP(tsk);
 
 		preload_age(ti);
diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index 3e3af29b4523..d7b9ac8c9971 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -84,7 +84,7 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 	switch_mm_pgdir(tsk, next);
 
 	/* Nothing else to do if we aren't actually switching */
-	if (prev == next)
+	if ((prev == next) && (tsk->thread.load_slb != U8_MAX))
 		return;
 
 	/*
-- 
2.50.1


