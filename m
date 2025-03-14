Return-Path: <linuxppc-dev+bounces-7060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE8BA61053
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 12:46:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDjHc0lrZz3cb5;
	Fri, 14 Mar 2025 22:46:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741952764;
	cv=none; b=DqYaroVlG0UswPk4+HIG95LeSVdpAoE8QJ1Xcc5f+ipowwO9bNaAKfHKYTJVvsTMwSBR/9W5nPCSH3EV7+FZS0RYNMzTiy7J4JHWcShr3yeTJbxDufPA2cU8wqPDjMUgXk/T8x3L1BC5skdKVZJG1qoPWEVrWQve3mZo3DtKeTwqHnbCAzwOMtC90P81ZE830dym91nxQNzA8lOw2JdW3/oNo/NemYIy+mIPD8kvGva6S4I1jUsHQOdqhap/hOdAD+8VIPvj9QTMO2tZ8ZbaX5CvPKbDyYy7EZSYjdPcEIiTtThvx4D9dzRDDPNGNpMQ7tH2s4xd8gG0J1n7+Glh6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741952764; c=relaxed/relaxed;
	bh=rqd8nApZfIj14eDIuEBmgblnXR/j8d+uZ5j9bQDSyx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uv/yOQ3LLBF2bhur0IgyEc/Z0m6KE/pTNf/PRH05ivShae9NR+i/pvpFaDC5uznLpS/e2Isg0ErKahrdZjymuqcly250WxFNufZxLOKrIP+21j7xod9oPXmuMnalGCX4Nq7WpJd/U6iPBcKUEpjWk0HPAxS1Yj+4/X+GbEowxxgVUuFZuzTlZ5gefgKh5pC8V52c9LXTuTLGCOndj6gk9saXgZ1vs0xf0x5MOspO5Dt4BTT4oRNMP7LocZX0ptWj9F/qzvGhfK7M3rkgUU8zMRYXUIuLw9tR6xccbDqYhBIbqiD63mxzjNijllkIrBStYDh8/TROhuGIq49TZqIOfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WT1ElFHM; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WT1ElFHM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDjHb2nM3z30gC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 22:46:03 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EALlGJ031989;
	Fri, 14 Mar 2025 11:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rqd8nApZfIj14eDIu
	EBmgblnXR/j8d+uZ5j9bQDSyx8=; b=WT1ElFHMDX/7O286czrd6OaiTWHnQsAO0
	0m5xP3uJRj0YPgkdEVtOSoDm1LtR3RAAWASZwvbTbHZ0gjQl6zYAPy0GYNrf+GGC
	toQqDNjRnkeizCCxEWFX4gCunQcAGiGv/3rq2rUV3G+kwDNlFTYM5oKYJn+qnFPs
	TDTSZWQ4BxNIK3A7g/Hgp4CrebfALQiTFPLTuda95PuC5ZpzB6EpSPf+ZgFLPtz3
	UalrHDvJFA7+eLK3vZ0YUa6coclJJz3LIGlh8buA9qaiUM0pzKX9EZDNc5r08ilU
	p/2MYEBJMWttRSdZ0AqGq5JNLKdoBhzhevY+gftJUncQ04/OBGQlQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8x1ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:49 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52EBaCqa009227;
	Fri, 14 Mar 2025 11:45:49 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8x1m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:49 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E8KXtN007406;
	Fri, 14 Mar 2025 11:45:48 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsrepj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:48 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EBjiGK60096996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 11:45:44 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54D0820043;
	Fri, 14 Mar 2025 11:45:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BE3F20040;
	Fri, 14 Mar 2025 11:45:41 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.22.126])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 11:45:40 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, fbarrat@linux.ibm.com,
        ajd@linux.ibm.com, mahesh@linux.ibm.com, oohall@gmail.com,
        hbathini@linux.ibm.com, dhowells@redhat.com, haren@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] powerpc: sysdev: use lock guard for mutex
Date: Fri, 14 Mar 2025 17:15:02 +0530
Message-ID: <20250314114502.2083434-7-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: pyT2PcrcHIbI7Sw-c9Fuwi2J3WaI7oLp
X-Proofpoint-ORIG-GUID: V3gfsykiNoCverF_y5D3hAhRxSGHxm8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=771 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140091
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


