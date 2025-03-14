Return-Path: <linuxppc-dev+bounces-7039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED53FA60872
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 06:47:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDYK539Q1z3cWw;
	Fri, 14 Mar 2025 16:46:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741931209;
	cv=none; b=Bhoxym+l+CP+A/xgm7GKoBoLVVLsasJNPBPsY04iA9Y5y/qvrHYRSwnF+3obl3T9ONT0nr6nV+ZepFVQGGWu4Gl1RJd7z9cpOgBiFejuTc8Q/K+YK/gvzClEsD224JPTGyzpZ2HvN7lO/Ujml0oHGk1NbPtxBH8DTXHZc1Nbct7rld1mjz1EvCu3SoVGOEjMyqcF3wyN5J4t4V2kFlTkiax5jlA96oLsQlHLJLa9kw08zL/gQot5r0Av5ZC6ORLPsH9vk1T8/igXLQQRoyYK8fsLbYgEf66a1EiczKS0p5ceMLors62vf9JfJ2zK87wN/rkMs+Lo5lhuL++e+vng9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741931209; c=relaxed/relaxed;
	bh=rqd8nApZfIj14eDIuEBmgblnXR/j8d+uZ5j9bQDSyx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqP7GpKC9DLZzFRI8lgrJTBcwz7MwUfIwTfW5clI1LqWON3JRAarG8+kTWQw0uMLdTb3+6IXKwZPKoMB+/pTyIqmtYUVbPR/FuFDd/xb7SV0+1ExYt18cmRWgFCMqLQAzSNToQGbvceJsXsV3JD2yVEfQyXN+eXooModNW/TwSpVUVwlTMU2diAzC5Zzfp6szunBmXOwra2uWhFYtmkbf6Q30yMXpDGXD3MsoOUHv9acjkCB3xjQQL3EZN0pa8W3RbxVgC6u6K8KfykAQYl/fWpxi/9ejnEbC1QX+jAjk2eZBl44DZLVu/sseH6wdwnzXGRmBNQ3W79Tynyjf88yRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ub5YRin5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ub5YRin5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDYK455pKz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 16:46:48 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E3kYJs020652;
	Fri, 14 Mar 2025 05:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rqd8nApZfIj14eDIu
	EBmgblnXR/j8d+uZ5j9bQDSyx8=; b=Ub5YRin5iuB8xFzqhpxqN4VbPZliMOqCM
	mT18O5IjqYz6XhNUtS3FLippc17f+MHyJB/1qtJa6A+dqeq+6FPC9oVa3fXN8kUf
	q+KKp5kbN7X9Cr/figTuyh0SJn7Pwg87y02P63mSeMaNcAwfvuFIW9g8+xE5XbY9
	d4qtjhdxsH8PiSj7tENgozT90p3pP2craHVg9b1uMYn1ueak2hsClaywI3V7hM4V
	QcWGrTQwT4Ij6nlVZRb3Fz4/8Xx1EQHZHsVjSrwD8Xvj0ngWZ9aoAvrnb/TUOd+w
	rElAJ8bXdKuzsK3t9NJh8QUiRWxcrvekcHoiMHSat8rYn8mrLXYRQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ccu98dju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:38 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E5kbdN000397;
	Fri, 14 Mar 2025 05:46:37 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ccu98djs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:37 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E5F8jq007555;
	Fri, 14 Mar 2025 05:46:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsrddk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E5kWw032440906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 05:46:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70E792004E;
	Fri, 14 Mar 2025 05:46:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D82A20043;
	Fri, 14 Mar 2025 05:46:29 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.22.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 05:46:28 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, fbarrat@linux.ibm.com,
        ajd@linux.ibm.com, mahesh@linux.ibm.com, oohall@gmail.com,
        hbathini@linux.ibm.com, dhowells@redhat.com, haren@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] powerpc: sysdev: use lock guard for mutex
Date: Fri, 14 Mar 2025 11:15:44 +0530
Message-ID: <20250314054544.1998928-7-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250314054544.1998928-1-sshegde@linux.ibm.com>
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: yCsldXnCv7_YVnev3G0b_MmgmNzp_kTS
X-Proofpoint-GUID: 8SNQeekt3qQUZWAbThuHNs6g_5hcctUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=771 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140041
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

use guard(mutex) for scope based resource management of mutex
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
index ce6c739c51e5..bbfc7c39b957 100644
--- a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
+++ b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
@@ -75,7 +75,7 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
 	if (kstrtoll(buf, 0, &interval))
 		return -EINVAL;
 
-	mutex_lock(&sysfs_lock);
+	guard(mutex)(&sysfs_lock);
 
 	if (fsl_wakeup->timer) {
 		disable_irq_wake(fsl_wakeup->timer->irq);
@@ -84,14 +84,12 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
 	}
 
 	if (!interval) {
-		mutex_unlock(&sysfs_lock);
 		return count;
 	}
 
 	fsl_wakeup->timer = mpic_request_timer(fsl_mpic_timer_irq,
 						fsl_wakeup, interval);
 	if (!fsl_wakeup->timer) {
-		mutex_unlock(&sysfs_lock);
 		return -EINVAL;
 	}
 
@@ -99,15 +97,11 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
 	if (ret) {
 		mpic_free_timer(fsl_wakeup->timer);
 		fsl_wakeup->timer = NULL;
-		mutex_unlock(&sysfs_lock);
-
 		return ret;
 	}
 
 	mpic_start_timer(fsl_wakeup->timer);
 
-	mutex_unlock(&sysfs_lock);
-
 	return count;
 }
 
-- 
2.39.3


