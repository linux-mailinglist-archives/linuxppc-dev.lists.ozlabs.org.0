Return-Path: <linuxppc-dev+bounces-7484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A515A7D832
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 10:40:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWN2t5WSSz2ySX;
	Mon,  7 Apr 2025 18:40:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744015254;
	cv=none; b=cNo1b2fJtzvirhrqP5RK+BbJOwXQKu7MQcXKk/aARfQqBl9bHStN6vi8v3Yen9mqnAoJ7XAYE0az8NLbHFhUXzRQrIwd+cFH0ysxZxbHTg4QSPSqIGcFGWbYkGM/hXMfso4Yo8OEOhlbsiMUG5TbNZKQDQrlek4fAOWrRt4lw3YGV586Xhl7/ZSbuX15d9M4g6tDIySDqEZUzDQNh1fBK/uqUdQUsJb9fxWlOcn5tmxT11oUwuQpb9yjJh9XCXF2JvoVGkbFZJwunHmjbV/UuxCRRmzGN2ECr+p7EmKrtrFpBwMjK6UZIB9NpuNSQ7OwYeSuqDN4yxbpIY0pDJZ6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744015254; c=relaxed/relaxed;
	bh=W6eZuGzebKezkMLoGPSNuzO2xzCtVhdAw9EO72VFxQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1eNgIEHyUYTsGbAWsLrxwnrBhsvt+7GURTicMxDFHCkVoHfplv/oOhkYV5uZ58Q+zRmIeJTgBgnK8xOmt8tJzOIVXshF+ZINwQ5fb7u1NKEl6q9yCtzs1Elg3mKAiGwkG6ZZoGwHevYEJCUfQChRc/V6hgOHN0Vr9ozQYfLF7HcdrirYWeieLdSRgMq+4BOGxEJg8tSRlGDx23eTMvYYOB319weBNIrkQ3Of9Nm/u0iblZDiersOLORskiZAXVb1f3GAURq1U2HFa9wvVF/xU4mEXSviiP0JrU2B0e+fL4TetoJ6+nxbqLDlIHy9t+zYr9leYjRO/O8Qc6aEkGbyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SzBE/3bX; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SzBE/3bX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWN2s5gKYz2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 18:40:53 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5373lSnl009905;
	Mon, 7 Apr 2025 08:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=W6eZuGzebKezkMLoGPSNuzO2xzCtVhdAw9EO72VFx
	Qc=; b=SzBE/3bXAS9qy9tPvrCuPdaIR+NkaFq15vr7kCJ0Ar3M8Wb6vzHLXWasj
	uSOEg6JzgWeeLZaXebU4elb2awOG5o18Unr3k3YaNcIwxYTnGZAuWsRFjIN3cLuK
	7hWHGBc6HDZ25LTGJ3wanwPG0W8VWic7fAEk37R7r5BfJ/3CXCpV4v/8NxuE65RA
	Mo75tGY8suCqYBgNbwWtC5O06koeGAKaDFaoHZHCKGesfqJV/NsRezSm3gP7LqMd
	8+XPAIWVcmkx+C4zJdBQB2+xHseLENC6sIFvEXPwvIEJI54kfT5FL3nt7xpfNgd0
	6s1p5xE/pyCstjOXSh7Lyvod+2T5A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v739h6yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:40:39 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5378bcFo026764;
	Mon, 7 Apr 2025 08:40:39 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v739h6y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:40:39 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5374iwV8011077;
	Mon, 7 Apr 2025 08:40:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7yd57u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:40:37 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5378eZ9t32637646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:40:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FC2320043;
	Mon,  7 Apr 2025 08:40:35 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC60B2004E;
	Mon,  7 Apr 2025 08:40:33 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Apr 2025 08:40:33 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        paulus@ozlabs.org
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        kernel test robot <lkp@intel.com>
Subject: [RFC PATCH] powerpc: Add check to select PPC_RADIX_BROADCAST_TLBIE
Date: Mon,  7 Apr 2025 14:10:29 +0530
Message-ID: <20250407084029.357710-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-GUID: vNQU958HFnyx5ZI2vevbLaCE0cUvUibk
X-Proofpoint-ORIG-GUID: k-LFRDl_DYmcoPn1BaZ0WSWk6ERQbwFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=530 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504070060
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 3d45a3d0d2e6 ("powerpc: Define config option for processors with broadcast TLBIE")
added a config option PPC_RADIX_BROADCAST_TLBIE to support processors with
broadcast TLBIE. Since this option is relevant only for RADIX_MMU, add
a check as a dependency to enable PPC_RADIX_BROADCAST_TLBIE in both
powernv and pseries configs. This fixes the unmet config dependency
warning reported

   WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
     Depends on [n]: PPC_RADIX_MMU [=n]
     Selected by [y]:
     - PPC_PSERIES [=y] && PPC64 [=y] && PPC_BOOK3S [=y]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504051857.jRqxM60c-lkp@intel.com/
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/Kconfig | 2 +-
 arch/powerpc/platforms/pseries/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 3fbe0295ce14..95d7ba73d43d 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -17,7 +17,7 @@ config PPC_POWERNV
 	select MMU_NOTIFIER
 	select FORCE_SMP
 	select ARCH_SUPPORTS_PER_VMA_LOCK
-	select PPC_RADIX_BROADCAST_TLBIE
+	select PPC_RADIX_BROADCAST_TLBIE if PPC_RADIX_MMU
 	default y
 
 config OPAL_PRD
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index a934c2a262f6..fa3c2fff082a 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -23,7 +23,7 @@ config PPC_PSERIES
 	select FORCE_SMP
 	select SWIOTLB
 	select ARCH_SUPPORTS_PER_VMA_LOCK
-	select PPC_RADIX_BROADCAST_TLBIE
+	select PPC_RADIX_BROADCAST_TLBIE if PPC_RADIX_MMU
 	default y
 
 config PARAVIRT
-- 
2.48.1


