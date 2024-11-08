Return-Path: <linuxppc-dev+bounces-3039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CACEF9C1980
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 10:49:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlDfv3KTjz3btY;
	Fri,  8 Nov 2024 20:49:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731059351;
	cv=none; b=cUEcNMn+yGC9c0BOKWNZzEv9/5GdozuZ6IBF4k+Szry9TRWYRwv41l78dqM5nud4HIs2mAr/VnlWCnjbeC+OyVClZWrGfvPP/kLJeLJfuv2qEmZeQ9xfBds544BBJlyeaejAdu9UXXcYXCrYsGLf1D2CYGVlhQS++nWY6uE5yw3AQm+fvYI6eFLKeRaP6bBWimM7jI2rwzt3WhTHf6zv6xlvJ+jm0Bdm9Wr/da7ayCN1xKWVHYngSHbS0hp/1xfT2697zP1NLzFtLcpf4Mh9IOMPK14SFlg+NJscBnSPMVczVEkZWHgF+SA5Q0AQ/KJokI+vWbCIFCZpPgOG7LiepA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731059351; c=relaxed/relaxed;
	bh=y/p3P3mwMqo3YL4RmYx19kAvOKcnUNWKfwWqWgLH9gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bAGVRAvp2Af9q/fSXCbzIs2BdgxvMWzjgFM0mCVnNvTWfTepM8blIlLen9W6mS8C2F0Qq7oVY7lqEIiiTiUnWBWgFt9RthaZ4NfWscemCQjeedpMttsjCwzk+QEW4989pSwCgEx587ZtA8l+q9NSR4au4rJLFL/aIrrzo7XFzSTJkhmmXM7j5/TpFGEMGosYYyVk1F2iT3G8n9PL5aW5PMmq9hekLvhgUIUJZBYu8rdYSSyk2s8YI6WDMT/Q4oRkIJYO6BJKcxwIJbmUXD/6OmKc8d7zcRKurG1PrvWSXknN2jFPnXv2adm0UDifRb3pGQsRq+J2KOK413zdTsKhvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CHSGivyi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CHSGivyi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlDfs3bCLz2yMv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 20:49:09 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A89e7A7001975;
	Fri, 8 Nov 2024 09:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=y/p3P3mwMqo3YL4RmYx19kAvOKcnUNWKfwWqWgLH9
	gg=; b=CHSGivyiSbXf0+3jn7j3b/u8JmezvUYfuJrprnuO70k9XFcjA58IDOr7e
	uH1vFr1fGWIMNaMB2m4n18230T7dyqvB3Nhu4QMxU/yBtBPs871DIp+MHE16P2+2
	2DEUOv5IYsG9uc7UlyWr0qMfV0GdKEiIH9kNIfSEy5jjeWygrDIN4In2bJBMyFw1
	kceIDA94wGCEdxy/JxkVAPhy7p5z8ipYsGfsi09cG705CNG9v7gnZKoKhQ4NcgZN
	tVq8TuOXy8yEpbfP0EjVrISUQ6fLmI7QhyPp7Pc/ili0w+CpN8YOPMxwUaZL4miG
	c9VwDxkMbZ/SfmiOh47R+Zt73q/HQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42sg75819q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 09:48:49 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A89mn3A020305;
	Fri, 8 Nov 2024 09:48:49 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42sg75819j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 09:48:49 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Nm7hp012243;
	Fri, 8 Nov 2024 09:48:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p1411wpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 09:48:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A89miwC23003758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Nov 2024 09:48:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 743FE20043;
	Fri,  8 Nov 2024 09:48:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 735F320040;
	Fri,  8 Nov 2024 09:48:42 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.124.214.45])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Nov 2024 09:48:42 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com, vaibhav@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] arch/powerpc/pseries: Fix KVM guest detection for disabling hardlockup detector
Date: Fri,  8 Nov 2024 15:18:37 +0530
Message-ID: <20241108094839.33084-1-gautam@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: TqaLWbICowCfrMa8p4l-NLqSb7OTJbhA
X-Proofpoint-GUID: 3heSwDM0UHwUDkhfVkZZM3-R6wXFLhnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080077
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As per the kernel documentation[1], hardlockup detector should be
disabled in KVM guests as it may give false positives. On PPC, hardlockup
detector is enabled inside KVM guests because disable_hardlockup_detector()
is marked as early_initcall and it relies on kvm_guest static key 
(is_kvm_guest()) which is initialized later during boot by 
check_kvm_guest(), which is a core_initcall. check_kvm_guest() is also 
called in pSeries_smp_probe(), which is called before initcalls, but it is
skipped if KVM guest does not have doorbell support or if the guest is 
launched with SMT=1.

Call check_kvm_guest() in disable_hardlockup_detector() so that
is_kvm_guest() check goes through fine and hardlockup detector can be
disabled inside the KVM guest.

[1]: Documentation/admin-guide/sysctl/kernel.rst

Fixes: 633c8e9800f3 ("powerpc/pseries: Enable hardlockup watchdog for PowerVM partitions")
Cc: stable@vger.kernel.org # v5.14+
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
v1 -> v2:
1. Call check_kvm_guest() call in disable_hardlockup_detector() instead
of relying on pSeries_smp_probe()
2. Add the fixes and stable tags
3. Some changes in patch description

 arch/powerpc/kernel/setup_64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 22f83fbbc762..1edc7cd68c10 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -920,6 +920,7 @@ static int __init disable_hardlockup_detector(void)
 	hardlockup_detector_disable();
 #else
 	if (firmware_has_feature(FW_FEATURE_LPAR)) {
+		check_kvm_guest();
 		if (is_kvm_guest())
 			hardlockup_detector_disable();
 	}
-- 
2.47.0


