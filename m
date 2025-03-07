Return-Path: <linuxppc-dev+bounces-6804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11368A56D3B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 17:11:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8WVp20bNz30LS;
	Sat,  8 Mar 2025 03:11:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741363874;
	cv=none; b=R+frjah3FyyKAJVTRX2CSOQc1/lRPhZoigP9M74tNKD1IRVrYWEookcO+P20SPeQelhNWkT4TvWDa4f3V3UYPmFxZLsWHqD5Oxe5Q4ZH6n3Z6gk7nBy4I4bXOr3BhNL+Hca6iHw87hOp9appvfQ3lyFzpYpzzyuIWYIUnEu+JDvkOzZ0LhjjlidmmMIOEiAvKG7BWzKWMzo7B9yILjNYqVOCb7iKUGUZDiBinY7hRepKkT8kpYR1BPffM3Nts7YdxGCd/Ucq8+EY85c+xADYQekwTXKFv0Mm2rLey3iFHB2kwUZVj+Wie95eNfiKZWiCmx9N0wDxj0Ez/D9uQf1lZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741363874; c=relaxed/relaxed;
	bh=klJsLymPMc04xnEdPRc0l/MJfXbZqUAJfHS12YwZ6tw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hDLBe+8HBEpByCPY352GpeSXSFXBDFB8w/FKb18TSOGprZqhXydYgbVGmDGIvUF/reYlFlHBzcgPt2HWI56CPgO3xSJVAWU9wOTaAJihzcQqkX4e4YGoncbMNjGpoyqPBR1EmqtF0gbjeb8ZavPISwEzj+KDTqqkxa4gBy4W3qtc2nKS3gU74zkTTnwa0yj7Moo8EbbRu4bGOpL3gQNiT7KjTevLKwMFLS+A6kBfnFOcm4gFKp08Y0Gy1QUnSZ5fteRs77S4zh4qejyhBCGeOkEYQHdDZXsddVPAmlZb5zp0tsqGXDF4Kh6fOTNauUcsboigPpeIS5ERCL2/Yb9rfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Na8j3e5C; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Na8j3e5C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8WVl0pLvz301n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 03:11:10 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527CSHMm009808;
	Fri, 7 Mar 2025 16:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=klJsLymPMc04xnEdPRc0l/MJfXbZqUAJfHS12YwZ6
	tw=; b=Na8j3e5CaXjOJkO17rc7lW9IaAymIeRLpOEMS3Bl4C60YwdpfvEPe75Fd
	0i7uEiQA2S8fMZk0zNY8/Ad1PRFVTyevSZ0PiJYa5jHihsA5F8G06P4AQKYgZ+1m
	xjY3GQ6grhl1Aez5nNH8EuCDM3HRlygYQkeqdmPm3UyRGRCHgh6xsRX/xw9TtCUb
	wHb/kv4Faio2MiJhH/It1NHF2DhDc2vQuUDD5FuuuM4yvpVVusJnOKV+tRd0HZoH
	PdWK5FC9upFWq1jTzYgwwQAMazd0j8kW4hRP6nvdZrs+4yL5dSQn9sbfYxJdQyoi
	jMFPL1Lxg3Qa4Iqo+NnEw+0EWMOYg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4580u2s5ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 16:11:00 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 527Fkgc8026168;
	Fri, 7 Mar 2025 16:10:59 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4580u2s5fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 16:10:59 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 527Diu0L020788;
	Fri, 7 Mar 2025 16:10:58 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 454eskfd0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 16:10:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 527GAt3423134496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 16:10:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A25D2004B;
	Fri,  7 Mar 2025 16:10:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4097520043;
	Fri,  7 Mar 2025 16:10:54 +0000 (GMT)
Received: from ltcden14-lp2.aus.stglabs.ibm.com (unknown [9.53.174.194])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Mar 2025 16:10:54 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v2 1/2] book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
Date: Fri,  7 Mar 2025 10:10:35 -0600
Message-ID: <8231763344223c193e3452eab0ae8ea966aff466.1741363120.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
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
X-Proofpoint-ORIG-GUID: w8ytE_AiIkfflPk6p3FXPjZZ_o-PprJQ
X-Proofpoint-GUID: hHNG7cmHnWnbgYsZw9MEy0nv-Bmhyoz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 mlxlogscore=962
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503070118
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>

Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 311e2112d782..bd6916419472 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -976,7 +976,7 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
-
+#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 {
 	if (radix_enabled())
@@ -984,6 +984,7 @@ bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 
 	return false;
 }
+#endif
 
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
-- 
2.47.1


