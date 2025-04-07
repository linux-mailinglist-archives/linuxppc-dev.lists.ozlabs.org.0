Return-Path: <linuxppc-dev+bounces-7491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5CDA7E38E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 17:12:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWXjv4GqCz2yrV;
	Tue,  8 Apr 2025 01:11:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744038707;
	cv=none; b=SypVTSf45H6+iQe8+5C+x0Pj6ajHVBxIT+bdaOBeSggNbpu66JEFOqH9vyhGq25RJbTxTbnLy9NZizxZ5jcMV2BVmJ/bF3uHzobXTQ10tDDtlYTSbvYagbgSb00j5tUQSwn7C5rfo6U8UyImkVN0Ia6YhIzB02up+wP0qMp1QGvFFPfLb3NUWrxFfNDjsavzPP8K/VkGWXm5Itm/zqAEq9++WxVXbfwHnAT8j3o6XGyBb1/s4B4cWpT6ZtSMYbxyvAasCxuAuLs7SU09Rhai0OhpUnp6TC4FbzNWXzAuJM6Rxb+ouiGy1MXxpvJD+KUbsoRLEFbtal3GrCf6SsVCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744038707; c=relaxed/relaxed;
	bh=OcNsdUXLajTS6Up4yb87KBBXCRng/iRPfXkDho493IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cj8vCpZ7Jm7tM2brMTCV4+d6JdydOAOc9pG4Jc3OCxg71SQSnAFbzcOpwXdYcfZngVMK9A0gdvLM9Qbo0QtGCjDH5KdVsOCNSJ2WFBpTxu+SN36Ueydka+ZYZRlAy+sceI37Bo2KDTQ8o/MnvAREpGGuaWEjuWgNiW6igjdNbrg2XuQu16QXomV0vp7kypL4e8ipKKdXQIMTnnW8gMW44I6qiDgs5v4HYiUwlWES+CwkxDV9VYr58Fp7MElIR7GonkHELAfmwc9kiKU3wQ0rdvZSPa9yOGR95n05Sno2du/0SfTWS/ANtbgkFuARsMGtuJXjx/O9bqT2cTmxoGF47g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WOoAcnFv; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WOoAcnFv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWXjq3qyqz2yqy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 01:11:42 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378IrTc029651;
	Mon, 7 Apr 2025 15:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=OcNsdUXLajTS6Up4y
	b87KBBXCRng/iRPfXkDho493IU=; b=WOoAcnFvpuNxNEiTrGC3QZIq5o+jYBCOb
	LyLvBIz0pxghOpRjonhLcZeU5GpFEhaJUVrjW4lEjOfClydMsoxIlT1tdJfSYTrD
	w4ni3gxfKYkXD7bD8soBquTEt6UrKrs12uA2MgZo7ShPARvXziKp6H/vG/OR0j4l
	xZ01w6SQLYfrZApqIj7cCKLpACusgLuv8O/JsHOSLcLihXpk7kQfCZv5I8mWLAkI
	jB3Jm3YdqkahCDJoZ3Dg5tjezoL+c8gFXxALeoX8dMZALeFXSQU3kyz0vIaTpzdk
	0hozKrK7Ar8LywsJy5kov8c0Zzsq4KVBjV6jp2caOQi+tFMaWRfCQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uwswvt35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:11:34 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 537F41Wv022508;
	Mon, 7 Apr 2025 15:11:33 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uwswvt30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:11:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 537DrCNJ011062;
	Mon, 7 Apr 2025 15:11:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7yege2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:11:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 537FBVtw16122324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 15:11:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10E992004E;
	Mon,  7 Apr 2025 15:11:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDA652004B;
	Mon,  7 Apr 2025 15:11:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  7 Apr 2025 15:11:30 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 823D8E15AF; Mon, 07 Apr 2025 17:11:30 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, kasan-dev@googlegroups.com,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: [PATCH v1 2/4] mm: Cleanup apply_to_pte_range() routine
Date: Mon,  7 Apr 2025 17:11:28 +0200
Message-ID: <93102722541b1daf541fce9fb316a1a2614d8c86.1744037648.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1744037648.git.agordeev@linux.ibm.com>
References: <cover.1744037648.git.agordeev@linux.ibm.com>
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
X-Proofpoint-GUID: ZjXrqfzVuI4O6PuB71DztWSnTeaDAz2F
X-Proofpoint-ORIG-GUID: B8AxCnBSacob3HedwAwYgmrsIk7eP_GG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=912 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070104
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reverse 'create' vs 'mm == &init_mm' conditions and move
page table mask modification out of the atomic context.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 mm/memory.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 2d8c265fc7d6..f0201c8ec1ce 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2915,24 +2915,28 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 				     pte_fn_t fn, void *data, bool create,
 				     pgtbl_mod_mask *mask)
 {
+	int err = create ? -ENOMEM : -EINVAL;
 	pte_t *pte, *mapped_pte;
-	int err = 0;
 	spinlock_t *ptl;
 
-	if (create) {
-		mapped_pte = pte = (mm == &init_mm) ?
-			pte_alloc_kernel_track(pmd, addr, mask) :
-			pte_alloc_map_lock(mm, pmd, addr, &ptl);
+	if (mm == &init_mm) {
+		if (create)
+			pte = pte_alloc_kernel_track(pmd, addr, mask);
+		else
+			pte = pte_offset_kernel(pmd, addr);
 		if (!pte)
-			return -ENOMEM;
+			return err;
 	} else {
-		mapped_pte = pte = (mm == &init_mm) ?
-			pte_offset_kernel(pmd, addr) :
-			pte_offset_map_lock(mm, pmd, addr, &ptl);
+		if (create)
+			pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
+		else
+			pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
 		if (!pte)
-			return -EINVAL;
+			return err;
+		mapped_pte = pte;
 	}
 
+	err = 0;
 	arch_enter_lazy_mmu_mode();
 
 	if (fn) {
@@ -2944,12 +2948,14 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			}
 		} while (addr += PAGE_SIZE, addr != end);
 	}
-	*mask |= PGTBL_PTE_MODIFIED;
 
 	arch_leave_lazy_mmu_mode();
 
 	if (mm != &init_mm)
 		pte_unmap_unlock(mapped_pte, ptl);
+
+	*mask |= PGTBL_PTE_MODIFIED;
+
 	return err;
 }
 
-- 
2.45.2


