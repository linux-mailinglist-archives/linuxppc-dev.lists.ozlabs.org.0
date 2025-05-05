Return-Path: <linuxppc-dev+bounces-8285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36D6AA8D8A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 09:54:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrYhP5zgXz2yrZ;
	Mon,  5 May 2025 17:54:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746431669;
	cv=none; b=AO9ju0Pkn5tOCWa0P5ux73HqjDDY9ssCoGlZY0Yj2+qZu01tDcbKf0IMCLm3TQYSd+T3h+3tR9sqYO07jwjq7BjB8epMmJmeZxm34f3sHPBlj2ukoJgl4ogLDLu4ULhx+zKLfLCsBeCfDcXMfT1fj1so/K9gOKW4UXMp5jLymib8exZrjGCVynWJI9w8ZG8UqI9Ol8ylYe/ZJ7vcrRZOfFpCSTMe3Gx62/+1U3mImk8D+l4EaixPpK88h2++L1XFbG6YFeU1WV3hZehICmibqGNTz3apLxThJJKWPcCDqTkuVjfF9sZWAkRl/6CrFdgLc2kX7nSq2WF/+TjddbEvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746431669; c=relaxed/relaxed;
	bh=F/h88Tsd1ya9ti7j7IRQj5EYdS5TpQ9agwRHTxBlyVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJS4Xu+PxCynrq9hqqgOub7J+LbVqozRRhLPylv5YwLkZ/YgyN5GvkTap6AfXh7HOSXggdp6Ws+NcncvdS7abOOav8sTKsJFhSCAk710uLiVT3gUHqJ6mT97rKeVCbxAT5npnjTfQTTJkziiBvhtyYBKYDQ96SkAgEe48KvsQm+WrFixGxYjjTkQHi8c7xrTt4BnCGLGg7rBSVJJQVXamZYfnc4U4RHVpAOrtNacEJrB7AfWKgfmylKXL6NVQIzLcjxJbL43yxtH6nXGeyWMjDS2o7VR2JSrjAVUpuEGJwAI6rrQ853jI32BDDdCQwUQVn37g8Lnol1VtMi44pj+mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nrXHZkKL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nrXHZkKL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrYhP0T1fz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 17:54:28 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Nkf94005900;
	Mon, 5 May 2025 07:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=F/h88Tsd1ya9ti7j7
	IRQj5EYdS5TpQ9agwRHTxBlyVA=; b=nrXHZkKLGRr2YJiQpN4vbN2wF19WTEgnw
	w6P43VdrgUgi6FGhBK9AEOMR6y8iWdWMzrja01EFNmjOAWUIPDaYWDbV51gVDppt
	ulqJc/Hiz2RanKO6ZAArUS7Rt3B6mwgVnIwWdrV/Z8gDudJnykRpD3w7XYQ0KZrG
	QdjW37CTQ/w40aAjUYBp+Uj2hqbnbvF8yRb5Q+5c9RqrYoBwFUrEhlnQMqa1kJuc
	KMEXZ0NNh0HNClC4wy+8Bi+zq04VVAf7n0vxnKAgfvVcJAL3ZEdZahfX/vlOdO/t
	K3TnLfqRQlibax+0jvP2kZwom9Kcc6ncSULFDAJsk3m46dxDqDuFA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6ysedr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:16 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457p51f010075;
	Mon, 5 May 2025 07:54:16 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6ysedn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:16 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5453xo99014122;
	Mon, 5 May 2025 07:54:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypkd0c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457sBvV49545488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:54:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 947F72004B;
	Mon,  5 May 2025 07:54:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B4E820040;
	Mon,  5 May 2025 07:54:09 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:54:09 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v3 6/6] powerpc: sysdev: use lock guard for mutex
Date: Mon,  5 May 2025 13:23:33 +0530
Message-ID: <20250505075333.184463-7-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: kBQVnUnuFpLSvP7f5dZS-KQDlcBy5Da1
X-Authority-Analysis: v=2.4 cv=GKAIEvNK c=1 sm=1 tr=0 ts=68186ea8 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=CqbteBQ7vrl-IhNh9TYA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: SqF5Eq3rrK9GgJ0USVieMbIFd3QRexFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfXxeue7AZ49zOX eJ7bvxsFcreKKCvC4Cqc5nuaIUOkK0JMT4sqcJNnnUHt5BsmHbIjTwH+eWduwzTT8kyqSbO/tTw YnYsmnn4K0qhyQyS5nd9ECeCfQHTwDqH/L3v0HGUe5F4bYKTzUIXB/XwGRAzE5ksbfmgWNX0ObM
 58d0vr0igz8Z7aOtHxZ6ZEfC7bS8Bnb6nZlNs25/srGV5rF+c8SY+vkr3PJ4Es4KqdWNMlopuw2 zbYYFmL8rMMddUdxfdTqsabiF1Eaxr9dAgFk9tJY19wl54xt/SqRyGPsvCsd0Sb3/mQ2eP1mQHJ /K8BY1dWukTVrG9OMovnoNaIwvLJ3U4bFgzpOSa01mBo0JKG2R9fLXNg4Jvz8V0TxujpEiPb2By
 Z1vztvx357e/0kGSWtpcXdMOGydRFj5WoWOopP5yCvwGCmjFjWElwCZxxXpRoD1+htbLQNnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=755 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050070
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

use guard(mutex) for scope based resource management of mutex
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
index ce6c739c51e5..06d9101a5d49 100644
--- a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
+++ b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
@@ -75,7 +75,7 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
 	if (kstrtoll(buf, 0, &interval))
 		return -EINVAL;
 
-	mutex_lock(&sysfs_lock);
+	guard(mutex)(&sysfs_lock);
 
 	if (fsl_wakeup->timer) {
 		disable_irq_wake(fsl_wakeup->timer->irq);
@@ -83,31 +83,23 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
 		fsl_wakeup->timer = NULL;
 	}
 
-	if (!interval) {
-		mutex_unlock(&sysfs_lock);
+	if (!interval)
 		return count;
-	}
 
 	fsl_wakeup->timer = mpic_request_timer(fsl_mpic_timer_irq,
 						fsl_wakeup, interval);
-	if (!fsl_wakeup->timer) {
-		mutex_unlock(&sysfs_lock);
+	if (!fsl_wakeup->timer)
 		return -EINVAL;
-	}
 
 	ret = enable_irq_wake(fsl_wakeup->timer->irq);
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


