Return-Path: <linuxppc-dev+bounces-9323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9CAD791B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 19:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ8pS3WV2z2xrL;
	Fri, 13 Jun 2025 03:36:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749749792;
	cv=none; b=JOhZFath1LXR1aP51MZITNMiMGMhStbTbXhhG++7R/ukCG/1BIbBcNbqemnxFSuozbk0ih295FdJPiO7D/+d+MYC0hqx2R5Zk+3bFHRjHnALEatcfc/QWURAPxr1IsQ7MfUzeku5cuPlF3302hempiboXUwAdZ9s+excBdoL8VCa9SSkmyA9FB35oT0J+qsyDIYtgiot02Gbc8bUXLAFqsYHkg59x0B1YseZy6a40v+M2HzP8vdGELkVfZX+uRhYaYQXnej0AuGPbJC8MORAAOEQKyLWueffYH7LQRifTeipVUwYUShhrHSKx1ME0XNWZctHLPt7aQpn0BfAOrMsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749749792; c=relaxed/relaxed;
	bh=l+Et7RDVrkrD3xSj+ZT9JbsfA8TCXL5kawo+d542qxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3DMaVWaNRF2mC8gApmuZlNUKIB326Gw3KjqfMMFbAanrvFmV4b8cOp7+Rbe7SOhA9oJ/OyMV88gDUEI2/BKaoJt9D+3MfaOs5BOFzNckhCCWYC09AxK4wsPesxvA2jMCyhn5KiYIuUrbdqmeAYb8IOKkd2BEz+2BWRtqMxWjXuacbB7XV0hi6Ii/XKGsNDgAhTbAsmQB0S/bGFso85uQYQiigpxXHD6A1zSnC3SqvvN2TqI6SLqDm7gXeYlQb3WoI9g37qzySSQQDh+o22vpUXAZ9sYTdtgDZELaiDFz9T4hVoTKmYVRMfpu1xyFPLeIskHu4AogQdUAp3Wj96xwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CGSHKJxp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CGSHKJxp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ8pN6Z0Nz2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 03:36:28 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CF7v0W022393;
	Thu, 12 Jun 2025 17:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=l+Et7RDVrkrD3xSj+
	ZT9JbsfA8TCXL5kawo+d542qxg=; b=CGSHKJxpAeqSz5W/a/AkSHYJFZv8lW+nh
	uxHC7vWPjJm4OsnwR6v4hz9f8/GcPwgLyA3qutjEahhsvj2zIAXR15Q620+T14It
	FHaWO/C+YYyqkGfyKNLYoZRGLnqRlAVl5LmSlHByDnbjBGpbKCvRtLprRYaEd7oh
	5J9ogX1eJllyxwgYyjA/mR4IpcpPyUjA36BA3prpqLL3/+jvrBlrXfiW9iVZJm+I
	zDSfTi4nXZF1qPYg3iaKGABx6nExrmBcci8O63LJ77BZRUe9YeZEYxl2gkpYGfKS
	I6Y6vUvsUHq1Oogn+ejN/LQkS369JvfdVqa5J6qY7W5de0VsVHpPw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769x01288-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:17 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55CHWVMp030657;
	Thu, 12 Jun 2025 17:36:17 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769x01286-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CE2lWa014912;
	Thu, 12 Jun 2025 17:36:16 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4750rpdxe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55CHaEqc33358430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 17:36:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C91920043;
	Thu, 12 Jun 2025 17:36:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC12E20040;
	Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id A4B20E19BA; Thu, 12 Jun 2025 19:36:13 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>,
        Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH 4/6] sparc/mm: Do not disable preemption in lazy MMU mode
Date: Thu, 12 Jun 2025 19:36:11 +0200
Message-ID: <db1559396c38c1dfe97a6d929412d7d6244f64b8.1749747752.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1749747752.git.agordeev@linux.ibm.com>
References: <cover.1749747752.git.agordeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 5A073cfWFciuN2b1brPTe_Vnj2ABgNor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMiBTYWx0ZWRfX3cw7ceB7JmZU d6VxfkA70ad39bsJhjQOMACDU7dhR+379Mps/nEMF5/Xm61VZKQveRqbfzXh/DVjMZ0MwShjckH OtM5ElN6pHeKhDxIDWUCD/pMglKXSvoq8imTovo//BpZ6RwUVH9+vjpOGhCFRVt8y8A/4Bl3ZF+
 v6CF8HwtyU4JDL9lKBw8F0GK0vxxj4t9XvR5rgBIuku+iqnJzzsphSBS/GReDoCb+rZTnHKWlnq RPWDwzbp3QorzE155Z++H0jAHLpMAaYFuoXsnenF/bqmgRHT1lUWRW1zbgilJ+Wn6BAjRAxFWe0 pbzA/SYKln6jnYz2VhQume3b18VSQ7InP15yZ+oOnDWlKT3nsaNQ+eIJZzYp3cBxB4kIuXOZQH0
 iVXVtP4unDNnzh/4Kk90d/VKBbvj+DoHFSQSGh/QOa32UKZrgdVGPB3bpZbuiTPpWKB+gRy+
X-Authority-Analysis: v=2.4 cv=YKGfyQGx c=1 sm=1 tr=0 ts=684b1012 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=Nsn6zn2YLSyj-wdhBosA:9
X-Proofpoint-GUID: El7oGGFj-H4_3nAMfB3G6kQ4auHJ7oeL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=711
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120132
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit a1d416bf9faf ("sparc/mm: disable preemption in lazy mmu mode")
is not necessary anymore, since the lazy MMU mode is entered with a
spinlock held and sparc does not support Real-Time. Thus, upon entering
the lazy mode the preemption is already disabled.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/sparc/include/asm/tlbflush_64.h |  2 +-
 arch/sparc/mm/tlb.c                  | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
index 8b8cdaa69272..a6d8068fb211 100644
--- a/arch/sparc/include/asm/tlbflush_64.h
+++ b/arch/sparc/include/asm/tlbflush_64.h
@@ -44,7 +44,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void flush_tlb_pending(void);
 void arch_enter_lazy_mmu_mode(void);
 void arch_leave_lazy_mmu_mode(void);
-#define arch_flush_lazy_mmu_mode()      do {} while (0)
+void arch_flush_lazy_mmu_mode(void);
 
 /* Local cpu only.  */
 void __flush_tlb_all(void);
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index a35ddcca5e76..e46dfd5f2583 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -52,10 +52,9 @@ void flush_tlb_pending(void)
 
 void arch_enter_lazy_mmu_mode(void)
 {
-	struct tlb_batch *tb;
+	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
 
-	preempt_disable();
-	tb = this_cpu_ptr(&tlb_batch);
+	VM_WARN_ON_ONCE(preemptible());
 	tb->active = 1;
 }
 
@@ -63,10 +62,15 @@ void arch_leave_lazy_mmu_mode(void)
 {
 	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
 
+	VM_WARN_ON_ONCE(preemptible());
 	if (tb->tlb_nr)
 		flush_tlb_pending();
 	tb->active = 0;
-	preempt_enable();
+}
+
+void arch_flush_lazy_mmu_mode(void)
+{
+	VM_WARN_ON_ONCE(preemptible());
 }
 
 static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
-- 
2.48.1


