Return-Path: <linuxppc-dev+bounces-8283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF6AA8D88
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 09:54:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrYhH4YZcz2ykc;
	Mon,  5 May 2025 17:54:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746431663;
	cv=none; b=GRaZXBMnalG19t4r7cLg9npfiCNoRmkUxJ8rSbLjbVwoKUAW9j0z5HOYWESXNZMbfFhUhAemurLkUpaOmN1fR/7c6XGIf+rGcy4dDMcOJJcLu88Bu/u8bVrx9glXLRr3N0twSfrtN5vYv6NNy8i/xZUrma4+f+3cBKT+CiFnNaI2EUFbL56KpBp4WL4P5fFBI5fL3T49rSvl3TVkRzTPzT+x88LvM+gVx+usRHRE5wNFWSBEWIAVcD1R6oUI0XAF9fQVsMYNqBqmJRub6YXomlMJ+6zn+qmCHQq8/AsED/fi6+hT7g5ui0XqULDJDc0PvRHXA8zHHLCd9+fI3046FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746431663; c=relaxed/relaxed;
	bh=OK7cVIxBR3pTlvjS5NsZDFZUqX7DAWXhiplm2G+4ffg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvhkbPudZq6qZ688+na2pjtBf3zeVsHmf18GxZd0pwnJbYf0u9z4ebZKHJKR09No8q4DswhBRz2Ys1Cm4K7rzfp/LIU1rMUO0gJqq7wtI+8qJMV5HOKW7/OT13EBUzjCqH0erw0YpHWS1l64YuuUKftLUGzdVtgiZ7c8UvzOwf8nYLH3EQiTeCqH6HhLRKE1PnU9i0N1rBk1ZN8ABtJt4SMNNeFpXABvMeImHXZpE/6Pw8Uy76WOf/3kXZIoH/0EkjGqDOhl/fIFgsC6TjirIGdw5fV2lqudro7csKbGmR8ZK1Ezi6m2bdtVM8sQybTIe3PPFNkuR3Ny1snqGHKXdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iW7XEqR4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iW7XEqR4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrYhG6BWZz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 17:54:22 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NnXgK009887;
	Mon, 5 May 2025 07:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=OK7cVIxBR3pTlvjS5
	NsZDFZUqX7DAWXhiplm2G+4ffg=; b=iW7XEqR4ajEDb6lihrQ3KKbWS6xkryL+M
	tYHoHiXrUrsrsom/hqzVdfRntS4ul3Y06obOgLiyEloL0sOiRzoF6uYJvlRSrbVa
	N8euPsF6UyRNILZqnIctG3vvUjS1WQSzGHXtKpNQWu3BlyDNXXMvYTZWOXdHunyh
	stAvfStxCZ8COOlWp/EZXmMPfmnI1ccvLUibXxIbaT1WAUxmbZ7KDe9Lq5PB008t
	mMXjzZj2WBFQtnoUiTNYbOwlZ5cNULPFdnd1agVUTMvmLP3OrrEE0HqRe8LoCl/O
	w0kk+zyi8RKWrmcWYb9oaDVuStLbRChBYD9EaTSS3dVGCs5n+ME4A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6ysedf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:10 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457p51d010075;
	Mon, 5 May 2025 07:54:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6yseda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5454106u032227;
	Mon, 5 May 2025 07:54:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxymd4f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:08 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457s5Ag53084532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:54:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A0532004D;
	Mon,  5 May 2025 07:54:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E14FF20040;
	Mon,  5 May 2025 07:54:02 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:54:02 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v3 4/6] powerpc: book3s: vas: use lock guard for mutex
Date: Mon,  5 May 2025 13:23:31 +0530
Message-ID: <20250505075333.184463-5-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250505075333.184463-1-sshegde@linux.ibm.com>
References: <20250505075333.184463-1-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: AHgX7C-qdgG1DTp7Wq3eVJl_X5xsqD_K
X-Authority-Analysis: v=2.4 cv=GKAIEvNK c=1 sm=1 tr=0 ts=68186ea2 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=2UBO4GguT1_OiFKDpwgA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: QqDmYpTXHRza-1ABTq5DZ8LtwC-N1KxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfX23qefl6SUD/f wWWS+cyrIWHMMuxqfKWR5sb+91iumax9aG0xXmPbpS/Nu+0O906ReaUQnvniVLAm3ormCtCHfti tpgQgAZJC1uxZghsTmpx1FGvlQU5W/1hndufsFcCgT+Fo8OMVC8/65wkXZXCXFwGRbvcr6UGYEl
 O+aTSgXIPksT8lHA4fQB8+GGmrotpwLpf/MS1ywZ0y6lQNLWTk/YkM0Ka34WLF0sP040CdRXkw5 eA0O8HY2VwEQ5PYzK0Xy7T3ipVnkS2J+FAXVH0kLCS9f4cdjG4+WAO6FOrwHK5QzC4ZYnwg6Gek yXBe84jcaWNP9/af9PNFqraaPWtgM1SwVcbbQ+JEfAaZZ1kiQ9QBrm/7QS/15Q2jVK2KPxfqPp/
 9XZEojFwF7YgUtlXm09g6ULotjTtkM2sbXPBLssv0UR8g8qdXQL8+TqDXSGOyU5bFk1DdsI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=835 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050070
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

use lock guards for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

This shows the use of both guard and scoped_guard

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 32 ++++++++++---------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 0b6365d85d11..d7462c16d828 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -425,23 +425,22 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 	}
 
-	mutex_lock(&txwin->task_ref.mmap_mutex);
 	/*
 	 * The window may be inactive due to lost credit (Ex: core
 	 * removal with DLPAR). If the window is active again when
 	 * the credit is available, map the new paste address at the
 	 * window virtual address.
 	 */
-	if (txwin->status == VAS_WIN_ACTIVE) {
-		paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
-		if (paste_addr) {
-			fault = vmf_insert_pfn(vma, vma->vm_start,
-					(paste_addr >> PAGE_SHIFT));
-			mutex_unlock(&txwin->task_ref.mmap_mutex);
-			return fault;
+	scoped_guard(mutex, &txwin->task_ref.mmap_mutex) {
+		if (txwin->status == VAS_WIN_ACTIVE) {
+			paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
+			if (paste_addr) {
+				fault = vmf_insert_pfn(vma, vma->vm_start,
+						(paste_addr >> PAGE_SHIFT));
+				return fault;
+			}
 		}
 	}
-	mutex_unlock(&txwin->task_ref.mmap_mutex);
 
 	/*
 	 * Received this fault due to closing the actual window.
@@ -494,9 +493,8 @@ static void vas_mmap_close(struct vm_area_struct *vma)
 		return;
 	}
 
-	mutex_lock(&txwin->task_ref.mmap_mutex);
-	txwin->task_ref.vma = NULL;
-	mutex_unlock(&txwin->task_ref.mmap_mutex);
+	scoped_guard(mutex, &txwin->task_ref.mmap_mutex)
+		txwin->task_ref.vma = NULL;
 }
 
 static const struct vm_operations_struct vas_vm_ops = {
@@ -543,18 +541,16 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	 * close/open event and allows mmap() only when the window is
 	 * active.
 	 */
-	mutex_lock(&txwin->task_ref.mmap_mutex);
+	guard(mutex)(&txwin->task_ref.mmap_mutex);
 	if (txwin->status != VAS_WIN_ACTIVE) {
 		pr_err("Window is not active\n");
-		rc = -EACCES;
-		goto out;
+		return -EACCES;
 	}
 
 	paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
 	if (!paste_addr) {
 		pr_err("Window paste address failed\n");
-		rc = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	pfn = paste_addr >> PAGE_SHIFT;
@@ -574,8 +570,6 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	txwin->task_ref.vma = vma;
 	vma->vm_ops = &vas_vm_ops;
 
-out:
-	mutex_unlock(&txwin->task_ref.mmap_mutex);
 	return rc;
 }
 
-- 
2.39.3


