Return-Path: <linuxppc-dev+bounces-3663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4849DFA40
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 06:43:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1t4g4jHRz30Bx;
	Mon,  2 Dec 2024 16:43:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733118227;
	cv=none; b=TbC1WPiqY15f5ldSck1aqBUn9Df5ZKDpWPgp7wgU5kP2inp8geMPigik8GCqbBXvNyAIZ6g9hQJXMQsEIqwL3NqSZaQknjn3dZzZ+7YcaHN4s74i8Zc3lSW/nkx8DQIjGRiNuDutWhyVjJ2/LVbGOkT6VGtsgrrHE4bNqttDTrekodQLHxwSQ4Zcbzy3lyPgUJZL1vQtCiyE5lSo3tvRl50VMh8SkBHY957/WjOnGjMrgvqMp94WL2rcgbCBLPkKcLZMQVKrEzGVPfUupKphYNikQXAxjlixx4iVlBfpgkWJiubWJsvlxxnCSIjdOOExUSAHvieO+83NRRqRJCT+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733118227; c=relaxed/relaxed;
	bh=0Edvv8bbZcyI5nIN4M95zf0a1IbvXx/BnUc8jKIZ0bY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOac5MjOaL76ZrcNkorMGT5Gyx7aCbGD7KYDOdIiAMUkmRjPvRznLIxWhLyj/qhi0ySFFk7lMpH0jY60OLhOfe+hJU95zP/KTUIlF48jFSPZ04J0iUGNkbrDS2SrT1SDIht4aZylnU0orxLcNLfZLwDbERe1g5ssd7C9x0RS881w5KAWcC7jbCoYucujLDXbLWZg3C5h2wHe4kQbEn2lOX3pSjJLE0BVhSHxhmrJHipkehQrWX/+WVrQx1YuKURVVaJcHpJy57LOv26DkyM+8FmT5lF39Cnw2N1QXV8HiZG9dlmbuzvPllCMkIDOjBrLmSES32JNblpungGPahanjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EZPVHNby; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EZPVHNby;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1t4f1PDTz2yhn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 16:43:45 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1IptPM021884;
	Mon, 2 Dec 2024 05:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=0Edvv8bbZcyI5nIN4M95zf0a1IbvXx/BnUc8jKIZ0
	bY=; b=EZPVHNbyuixKA6jnHyRdZNpaRwB6VrcRHTkksiy4NoXcPV3LPjF6sDMlN
	Ohk4GhtKW/U0l2xhVJEYu8AaW+z0KG+UAbq+/VecmXch1+X4RfAmDATO4CrhO+Dz
	5m+reOF74LpLhxapVm0tr05rm0PWJ2ToaH03SGhxh7H8hOxuOqx8xPMWj8WhaNT+
	LnQ9ZfWEgm78SsYCyhgyCzhHQtRUXFVcvJe8aUQnBcJDjAo738o+dQndtSpmf8sN
	so3JrDPnZpoxv7Jdq3+v3+EDbkbSIbm4PSGjMQi6xaqMcBm3uCSSi45D192DvuSy
	9emHH/CUNhxUSeJhAhhS0WBS1z7Ew==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437s4hpw3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 05:43:25 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B25TFfR001892;
	Mon, 2 Dec 2024 05:43:25 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437s4hpw3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 05:43:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1GtWV2023015;
	Mon, 2 Dec 2024 05:43:24 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438e1msr2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 05:43:24 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B25hKtF64815382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 05:43:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3FEA2004B;
	Mon,  2 Dec 2024 05:43:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39C4120040;
	Mon,  2 Dec 2024 05:43:19 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Dec 2024 05:43:18 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH] powerpc/book3s64/hugetlb: Fix disabling hugetlb when fadump is active
Date: Mon,  2 Dec 2024 11:13:10 +0530
Message-ID: <20241202054310.928610-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
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
X-Proofpoint-GUID: EIXUc0dFYQfxhdhfCMFzSSxYlvP3Z_T3
X-Proofpoint-ORIG-GUID: i4WEmlQ6KrOTqEDMKyVlwnofAEtcBIrR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412020047
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 8597538712eb ("powerpc/fadump: Do not use hugepages when fadump
is active") disabled hugetlb support when fadump is active by returning
early from hugetlbpage_init():arch/powerpc/mm/hugetlbpage.c and not
populating hpage_shift/HPAGE_SHIFT.

Later, commit 2354ad252b66 ("powerpc/mm: Update default hugetlb size
early") moved the allocation of hpage_shift/HPAGE_SHIFT to early boot,
which inadvertently re-enabled hugetlb support when fadump is active.

Fix this by implementing hugepages_supported() on powerpc. This ensures
that disabling hugetlb for the fadump kernel is independent of
hpage_shift/HPAGE_SHIFT.

Fixes: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")
CC: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
CC: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
CC: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Note: Even with this fix included, it is possible to enable gigantic
pages in the fadump kernel. IIUC, gigantic pages were never disabled
for the fadump kernel.

Currently, gigantic pages are allocated during early boot as long as
the respective hstate is supported by the architecture.

I will introduce some changes in the generic hugetlb code to allow the
architecture to decide on supporting gigantic pages on the go. Bringing
gigantic page allocation under hugepages_supported() does work for
powerpc but I need verify the impact on other architectures.

Regarding the Fixes tag: This patch fixes a bug inadvertently introduced
by the commit mentioned under Fixes tag in the commit message. Feel free
to remove the tag if it is unnecessary.

---
 arch/powerpc/include/asm/hugetlb.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 18a3028ac3b6..f294e57663b0 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -15,6 +15,15 @@
 
 extern bool hugetlb_disabled;
 
+static inline int hugepages_supported(void)
+{
+	if (hugetlb_disabled)
+		return 0;
+
+	return HPAGE_SHIFT != 0;
+}
+#define hugepages_supported hugepages_supported
+
 void __init hugetlbpage_init_defaultsize(void);
 
 int slice_is_hugepage_only_range(struct mm_struct *mm, unsigned long addr,
-- 
2.47.0


