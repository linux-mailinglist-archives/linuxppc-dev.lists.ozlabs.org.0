Return-Path: <linuxppc-dev+bounces-7490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF8A7E38D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 17:12:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWXjv3ZlMz2yrN;
	Tue,  8 Apr 2025 01:11:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744038707;
	cv=none; b=LRV6yEG5dHeZyxeO+ouUvRZGG7PfogJCwtcNbf3vBukjxk2qIpYeSWC7bW7pViKCltUMZYy9NS3WIfp0aEos4168rb99WBz+MhjEBVXG+ZMo+T/Vyoa7dKQP9FfU4TAV/syROKuNecPKb0bbNnFdCodSYp68RktVCB6wgGLvibdiRqpIteV5NDndKToi9KftWDp/ZKM/IUklFs9Bq6/BdoqoAmRn5PdxnA/rAdFFMbUlk5O8Y6/vam+ouKcbKXRaiwg4Yy1arj8UFoeWxfx7Vzkx1yc6RvkXiJjfmG9cpspijBXnLFjDrekyxoLBG3xSn7XEcZHuTPNI/9cnDALmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744038707; c=relaxed/relaxed;
	bh=pLqNtHwxdz+KjzF0o4al3IuUdgKeg437/opuwF8rOgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hF+RwSKLL1VzjhVmoHg7KqjMtxlxSaDO+zYN6u95MhQdVc2vvOJzyB7RLdBrxMr7stkUFRqmljdw1hlIxUYB/SyzjrJAcvaKRT/j/gFu3HP1QhWTsB0BxKzBJQvqLZQ6csEiRxt2LpynSxaQa2da1dP+E96nv4U72EZRZ1uWKiPuw6PzTKdnOWZlzqo1R7LIWqzXvSKYnrKZ3JZgTkYUarHznNg0n+YTrKnsku5D0fIxlGP208BHSjv3sCNvJESWpVGZpfNqUd8+6JU90gyKF9RcJXH45X6l8fsOmhBt8/AmQGJdkuasTV8GYRX/eLbcHtwC4rlT/oBnIb9MwoEyDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GG9/qRMT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GG9/qRMT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWXjr5WBKz2yr0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 01:11:44 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537E3FIb025560;
	Mon, 7 Apr 2025 15:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=pLqNtHwxdz+KjzF0o
	4al3IuUdgKeg437/opuwF8rOgY=; b=GG9/qRMTr3c234BdNbl8qcd6JICn1dr6T
	h+1CwgnJosxDoTGQHDJLnBC+r8sdfje311yGnSrC48KNz6kVG3ETEbXxkIldtS4P
	DeWcQ/wSyDFqcrEo/l5mNQ2K0Lp2iKaRYkSmtxXTFAGqSvnaN8aWIz5IKTOTOKFq
	+JDtlQ3sQxmiVDXWN/y5otPtf5J6aL25Ojv2dz/9vWnkrf3ALjS2QQAfJwUkVTgb
	dIt52+/rxwX4BWgeopjfh5rB3DIp5dxMR6YbMdiedI2eDNzrYRJVARzz4+Y3g9I/
	CxasV3YuMtzXVUxrwLXF7t0esmIiJJgRgZro+hqrnkdilacrPiCpg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45vg4q8cmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:11:34 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 537EoQ3W019216;
	Mon, 7 Apr 2025 15:11:34 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45vg4q8cmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:11:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 537EKIMr013925;
	Mon, 7 Apr 2025 15:11:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ufunecfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:11:32 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 537FBVTI19595766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 15:11:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03DF82004D;
	Mon,  7 Apr 2025 15:11:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2DFB20043;
	Mon,  7 Apr 2025 15:11:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  7 Apr 2025 15:11:30 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 88272E175F; Mon, 07 Apr 2025 17:11:30 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, kasan-dev@googlegroups.com,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: [PATCH v1 4/4] mm: Allow detection of wrong arch_enter_lazy_mmu_mode() context
Date: Mon,  7 Apr 2025 17:11:30 +0200
Message-ID: <5204eaec309f454efcb5a799c9e0ed9da1dff971.1744037648.git.agordeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: wG_AoPwbLBLy8-Y75yYVC-cpQvofPbGp
X-Proofpoint-GUID: Yijp_AWT6tzwOtSLybGJbVPGYVge3z23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=935 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070104
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The lazy MMU batching may be only be entered and left under the
protection of the page table locks for all page tables which may
be modified. Yet, there were cases arch_enter_lazy_mmu_mode()
was called without the locks taken, e.g. commit b9ef323ea168
("powerpc/64s: Disable preemption in hash lazy mmu mode").

Make default arch_enter|leave|flush_lazy_mmu_mode() callbacks
complain at least in case the preemption is enabled to detect
wrong contexts.

Most platforms do not implement the callbacks, so to aovid a
performance impact allow the complaint when CONFIG_DEBUG_VM
option is enabled only.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 include/linux/pgtable.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e2b705c14945..959590bb66da 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -232,9 +232,18 @@ static inline int pmd_dirty(pmd_t pmd)
  * and the mode cannot be used in interrupt context.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-#define arch_enter_lazy_mmu_mode()	do {} while (0)
-#define arch_leave_lazy_mmu_mode()	do {} while (0)
-#define arch_flush_lazy_mmu_mode()	do {} while (0)
+static inline void arch_enter_lazy_mmu_mode(void)
+{
+	VM_WARN_ON(preemptible());
+}
+static inline void arch_leave_lazy_mmu_mode(void)
+{
+	VM_WARN_ON(preemptible());
+}
+static inline void arch_flush_lazy_mmu_mode(void)
+{
+	VM_WARN_ON(preemptible());
+}
 #endif
 
 #ifndef pte_batch_hint
-- 
2.45.2


