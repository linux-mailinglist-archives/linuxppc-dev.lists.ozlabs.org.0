Return-Path: <linuxppc-dev+bounces-2872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8FC9BCDC2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 14:28:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjTfq0QVlz2yDH;
	Wed,  6 Nov 2024 00:28:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730813283;
	cv=none; b=dYN//upaYMv6Axsk8aavncGw/1oJZXm3sG//D08SfnGMIrSjsn67mFWOGgf9uYpOsIfl70+GgJ5UKrUnnIzF+yjeYGpmrkV3h9r6CRYCHDlWYGEwFJ2UkOvj1lyxfJreRpkapH1jpJ92qYY3NYdKczqr7BFEjPWSf3Ur4cr7sPB4ncTJ4GHO7QUToP112OEKWdBSXfyU1ANUzojN2g8bti5b1Aeijg9Ep70cG5DYqotlVyAWjKncd1XtiR5XMk0nwN0cI2GbYiL6VFUfuVUSKNkN8QT8FqLs2bLD1CVPTOoVa9tmbDreLPBZ4YvSrvMVAnlD9zSHMB8uN7delxRRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730813283; c=relaxed/relaxed;
	bh=vPqBXcY0uBpfY8Jo8sbKW8Rr/IyuuU0l82sMV1zi3zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XunHNzkMjQDHckAeBQfQ14m9229B/dL/IG6WxWAmvHX6BKysbRWEMtC/nRgPIMJ8Bp8c7hEB+YlEu7Dx0gQyY1rUpTnCSjNEG3uv7x5ObsUN/aECwRmZ2BmZbqD6yAmDFrmlyEmnVjqBzXFPT5JNhV6971+fOPqfp9bIDSQI4csXP6YwCylgVie7Yug1w3EkHCUvumUKoGrZdHIjLGD0bkeVx7tKZeRsSNARL9LD6LXjqbhm1xtrzG3o1HoDRJiGJyvgu6ALGhFwtd/WcbPRlUUZ6NVxE+RQgL5VPeNLzXDoK+BNkazNDBFS9wpcogXze1jP+vtOvDaX2E4dTAwEtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=goKDGbw2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=goKDGbw2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjTfp04nKz2xjh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 00:28:01 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5DIMbP006293;
	Tue, 5 Nov 2024 13:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=vPqBXcY0uBpfY8Jo8sbKW8Rr/IyuuU0l82sMV1zi3
	zw=; b=goKDGbw2UfTmdyUpHe6aLnSKqWzNcFTtLWbSe/lKAYYcIKPR1NzdzC+AA
	7Orloo+pvAPepVFhr3C865i+HFOaNkbDUzV2qGWePLAXJQSlZcnScDYSEswq7qoL
	6hKY3om15EpX5BLZlCbObseZbp0wEUfVwdDqLJHspWfSkluuQzTOPLRR6bhWjU6a
	U8fREZSU6N7ofV0WKGB1AgJaYxRRc4QKgjKwKddOxOkZYDwIoRtDGz43NfOYpHD+
	k7BhpIJyFgQcR9VZKwS5ygK0nhznQeO9aRaH6wAxhNvow1FjkYWjSL0Xabn0mMc1
	BNYkWikShN3cc2XU7S5PgzP5Pqjqg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42qk4h8ffv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 13:27:47 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A5DRkti030932;
	Tue, 5 Nov 2024 13:27:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42qk4h8ffq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 13:27:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5CFfQs008450;
	Tue, 5 Nov 2024 13:27:46 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nywkg785-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 13:27:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A5DRgpi56689094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Nov 2024 13:27:42 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28E4320043;
	Tue,  5 Nov 2024 13:27:42 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF39F20040;
	Tue,  5 Nov 2024 13:27:39 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.39.23.5])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Nov 2024 13:27:39 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arch/powerpc/pseries: Fix KVM guest detection for disabling hardlockup detector
Date: Tue,  5 Nov 2024 18:57:33 +0530
Message-ID: <20241105132734.499506-1-gautam@linux.ibm.com>
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
X-Proofpoint-GUID: i9nTrT1QSTXFZ1XaNLNKPpCgCpRbUpTa
X-Proofpoint-ORIG-GUID: pRvyWu1OGhTjB0PTeZg5JrhTndKmUbGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As per the kernel documentation[1], hardlockup detector should be
disabled in KVM guests as it may give false positives. On PPC, hardlockup
detector is broken inside KVM guests because disable_hardlockup_detector()
is marked as early_initcall and it uses is_kvm_guest(), which is
initialized by check_kvm_guest() later during boot as it is a
core_initcall. check_kvm_guest() is also called in pSeries_smp_probe(),
which is called before initcalls, but it is skipped if KVM guest does
not have doorbell support or if the guest is launched with SMT=1.

Move the check_kvm_guest() call in pSeries_smp_probe() to the initial
part of function before doorbell/SMT checks so that "kvm_guest" static
key is initialized by the time disable_hardlockup_detector() runs.

[1]: Documentation/admin-guide/sysctl/kernel.rst

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/smp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index c597711ef20a..516c7bfec933 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -199,6 +199,13 @@ static __init void pSeries_smp_probe(void)
 	else
 		xics_smp_probe();
 
+	/*
+	 * Make sure this is called regardless of doorbell/SMT status, as
+	 * we disable hardlockup detector in an early_initcall where we need to
+	 * know KVM status for disabling hardlockup detector in KVM guests.
+	 */
+	check_kvm_guest();
+
 	/* No doorbell facility, must use the interrupt controller for IPIs */
 	if (!cpu_has_feature(CPU_FTR_DBELL))
 		return;
@@ -207,8 +214,6 @@ static __init void pSeries_smp_probe(void)
 	if (!cpu_has_feature(CPU_FTR_SMT))
 		return;
 
-	check_kvm_guest();
-
 	if (is_kvm_guest()) {
 		/*
 		 * KVM emulates doorbells by disabling FSCR[MSGP] so msgsndp
-- 
2.47.0


