Return-Path: <linuxppc-dev+bounces-7058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DF7A61050
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 12:46:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDjHQ0dbpz3cZn;
	Fri, 14 Mar 2025 22:45:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741952754;
	cv=none; b=kNvktOb4VURHrLP5sg4Tco/BmLQRgRIMHFEs0WZTXReX/SDXVDh/GeLgbE1rKsbLV3Gd0jTYZghF+a/7eXcGmui7eEzCbozyeVvGC9S0s5CnWiIQzkusMWm+pvDHFR2RH9lgvkdOB+iRT/MG79P+UtJ1OZJ+82ICnoMGeCV4lU6xosAbbMyxdku9K/rrw3PtY8GUGExs7RfJCxMCPt5epOnkDMLkuEg8iHJpnRSstIELYE9QC4MOYVmQIae7do8jN3tfmWTkJkip51OrZxBS9FHhNy6Z2/ZlsmXtT7EVkgCExEzLEXKTa8u3fGFyz9y+2o0TplvyNJMuVjwC3YbRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741952754; c=relaxed/relaxed;
	bh=WHKm3ExNyDDNq83QqNAnyUo4+cD7TyY5b8WeyJnoQkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPCxaEIoZAidTPAd2LHRoF958g9snPhucFS17XDIkJH4T6yFoW+7xSSEDgl3p3ubqi7xPVxwQVxWL0R6lXt2P8V2UNnaAnrfqfhHtpgkALHZ/aYkrdQf1TpcPdXUKlkkFHvEAyLpfKCyckkLQV985y7cp7QxxxB7oHuc5aSFW7muD9CquD2JAFox3sxaIwbAeWXBmb/nf9yr64Nw9Kc3pxYApE6Wt4/BYeHdC6B21S3yAXUmXhO+Fc/x2xIg9+mkVAhW2RYou92/vdkRHOg+isN7NA4NGB+TTRE+wWzuckLGv5UujqdjHHl8cS77jRMoTZSw3077aSaLeftAcXDlKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FnwmlJGh; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FnwmlJGh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDjHP22Vtz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 22:45:52 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EBN1D6013877;
	Fri, 14 Mar 2025 11:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=WHKm3ExNyDDNq83Qq
	NAnyUo4+cD7TyY5b8WeyJnoQkA=; b=FnwmlJGh05XY1E7uy1yfmgmMmf4mWYv6E
	wqZbPXDB5ZR+FqcvkVw7qCdjorKyIvnKztEr9Kl9Xdx40bMjN7pMqa3DceacQF6F
	rngw1PgGPQ8m65I3F5CfMNy1UuIpOH4m377aLoxXANTrl7QgAZVIP4C/iT3FNilD
	U4MKl6ciNlYZ4sDLokoow0ebqgpFxtV5GUhvqSmQ9/x1OEPW+0L/M3ayk5YLiNzY
	9JGOEngvyUXICFzM0PTILzfvV+3rWlwZ0++/5gHXxRbE7+JzMu7s5mfjGR5n1u+f
	eYg5Glg6W0bmwgNCucKmQXdU+JmkvnZKcXt2t30a5rXl+U5MBZTkg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6k03cf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:40 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52EBhTWw027336;
	Fri, 14 Mar 2025 11:45:40 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6k03cex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:39 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E8x6BH003131;
	Fri, 14 Mar 2025 11:45:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atstxqd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:39 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EBjZxF35848936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 11:45:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A84EC20043;
	Fri, 14 Mar 2025 11:45:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E87820040;
	Fri, 14 Mar 2025 11:45:32 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.22.126])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 11:45:32 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, fbarrat@linux.ibm.com,
        ajd@linux.ibm.com, mahesh@linux.ibm.com, oohall@gmail.com,
        hbathini@linux.ibm.com, dhowells@redhat.com, haren@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] powerpc: book3s: vas: use lock guard for mutex
Date: Fri, 14 Mar 2025 17:15:00 +0530
Message-ID: <20250314114502.2083434-5-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250314114502.2083434-1-sshegde@linux.ibm.com>
References: <20250314114502.2083434-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: SGiKbM8qQBl08NH7jKOTAr6hNJKZ6cZB
X-Proofpoint-ORIG-GUID: j-QpR_LFl5mFR3pqyzQu-3Wgu00abwwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=795 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503140091
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

use lock guards for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

This shows the use of both guard and scoped_guard

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


