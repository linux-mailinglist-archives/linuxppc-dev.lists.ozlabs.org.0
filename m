Return-Path: <linuxppc-dev+bounces-9613-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F89AE2FBA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 14:01:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQ8vf0WQLz30Tf;
	Sun, 22 Jun 2025 22:01:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750593710;
	cv=none; b=VX2oBox3tt+XbS6mK6q+yTlTKzPqwcPMQzwGw41priYO0eFjdWa5/1O7nXVjpnTOwO3ev4AAtqWpWe5mJG8nw/hhZSIPchGE7Y5F2e8idfmTtiH0uFGfMC/ScLL4MWHLVg2ZSP2oIfLUiogl8aV/xJib+XByfqwdmrFoVILoiF3gcvJ2X4NbIPi9ZB5wm8JDiFA1TmA2P0RY8nKAphB5Wl9xM3Yal2+FRLd+ojHhXsHuAp1EPlgyzhHdYokU3UW4P5taArTjZQS3FcwxAsu8ZvyJX8HddjcXylh3w7tIfNEKAqPowJuwgqSzywE0PtvBL+GzdblyykxH1DOvkHYKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750593710; c=relaxed/relaxed;
	bh=fxxkq8WjWJfHkmAF9Cy2K99ipkyuSuX2PR6bpaiFFZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlyQVK9DJk1lqEeHs6lZMJyZSSLHVYmrCYVFYH4z0nylJOSq2G54RYRMtC+54QvqCr+cTNG1ZDgVsooIUlvbt7Fi0GCBV4MJ925vXfO52vS336cCSXfB8XW0X2fSKUzZPtn/y9dR8hX2tI3WMqWXF8CqlUvkNeR4DSbq5UwEZ7HStwyC0DO5EpkiZ80IyLFexaLeUysIDUM9ZvuAMkHWxftV0YWEpSuxbAeAMlmb8hgqn7BK2dDHht3Ow37iZsI2pnwAShEEMzdN2IG3NXLqqUMVx050vGrvj8lZlrn9xDGhUaesYO/NPxATmE0YjiNfnobDf76/oN1afo76ZUA36Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UtUoQ9Sn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UtUoQ9Sn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQ8vc4Hvkz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 22:01:47 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M0XUSh030749;
	Sun, 22 Jun 2025 12:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=fxxkq8WjWJfHkmAF9
	Cy2K99ipkyuSuX2PR6bpaiFFZk=; b=UtUoQ9SnKbgeR8d7GsD8dJ+7BD4sukbBU
	13j2pS/ysUlxNlJ8waHN94fgOtB4SXnVdzXwtuaf8G9Jy65sOyqqNDkxuLUJfJJY
	Cxw5+rvdea8IVSjnOwGrHFqu6XZgAeyq4AE7gNfwPQFsseoCCNSspjLU2czH1QrU
	sYdkWRlTcon1bsthUCP85msBmWIgARIxq2BIsgc7zUrjwKsed8O36TC6f/FShgIk
	iG82k0NxMtgmiV6mRyi9q7fH+9Bj374Bl1luy6Ida62QMcMQo0xi3E7rM8Mqyp00
	zpUGbsszt1s0M8QIWxOyEQOQrxQU+xkzGg+++we3kNY4pufyy07pw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmfdvknd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:01:38 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55MC1bem009702;
	Sun, 22 Jun 2025 12:01:37 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmfdvknb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:01:37 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55M8wFrU014698;
	Sun, 22 Jun 2025 12:01:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e9s21brn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:01:36 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55MC1Xu956295844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 12:01:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3316F20049;
	Sun, 22 Jun 2025 12:01:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB50220040;
	Sun, 22 Jun 2025 12:01:31 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 22 Jun 2025 12:01:31 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v2 2/2] book3s64/radix : Optimize vmemmap start alignment
Date: Sun, 22 Jun 2025 07:01:25 -0500
Message-ID: <895c4afd912c85d344a2065e348fac90529ed48f.1750593372.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <7f95fe91c827a2fb76367a58dbea724e811fb152.1750593372.git.donettom@linux.ibm.com>
References: <7f95fe91c827a2fb76367a58dbea724e811fb152.1750593372.git.donettom@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: BRuroSmTb4v8LM2ozv5DJh5jLy1-JILn
X-Proofpoint-GUID: ZWHvOwZ1p-CMSgjhV1MIPy4z--10CIk1
X-Authority-Analysis: v=2.4 cv=BpqdwZX5 c=1 sm=1 tr=0 ts=6857f0a2 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=KK6s22nVDRcosj11uTcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA3MiBTYWx0ZWRfXyUAaRK5pqt5V 08G3kghaOWKvzu/eddS+WFWvVnQuiBz0js2uUkMZcqJRS/Lekf+bZw8D1h9+dQDQHJ+1mKFjJGl pdxC0CEubigz20bxClHH10n6uIsTqvQUnrUAkGkG/4Mui95CMQQrcSixjqv2x7qUEbn7Nabzkk+
 3vnFJLj0wM75ZRXDIanjsn1Tf1fZIPGNcHm85QJXQ2KrHbezc2nPx5a/ele4hTusXewB2G7nbuI iQDJKSzuIp6zQFuWsX4KTkvfyW2rJi0Rovj47lRx2tCuvsaE9RvD9foBXUpbdSf+QCa78zSC0BV PQI0wuM30wkdS748BphgiQGtJ/zjwt1+i3Q0IlTZbbfMnKAJtCShmuXuG9e+fGB5i6zpMs0hEqE
 WQpPox+Yo6OC9UWAK/jB4ctPD4UvrkbkkIZQPH0fLVdXwp4K4pO7SEP/i+dYgr43E4o8TBaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220072
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If we always align the vmemmap start to PAGE_SIZE, there is a
chance that we may end up allocating page-sized vmemmap backing
pages in RAM in the altmap not present case, because a PAGE_SIZE
aligned address is not PMD_SIZE-aligned.

In this patch, we are aligning the vmemmap start address to
PMD_SIZE if altmap is not present. This ensures that a PMD_SIZE
page is always allocated for the vmemmap mapping if altmap is
not present.

If altmap is present, Make sure we align the start vmemmap addr to
PAGE_SIZE so that we calculate the correct start_pfn in altmap
boundary check to decide whether we should use altmap or RAM based
backing memory allocation. Also the address need to be aligned for
set_pte operation. If the start addr is already PMD_SIZE aligned
and with in the altmap boundary then we will try to use a pmd size
altmap mapping else we go for page size  mapping.

So if altmap is present, we try to use the maximum number of
altmap pages; otherwise, we allocate a PMD_SIZE RAM page.

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 29 +++++++++++++++---------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 3d67aee8c8ca..c630cece8ed4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1122,18 +1122,25 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	pte_t *pte;
 
 	/*
-	 * Make sure we align the start vmemmap addr so that we calculate
-	 * the correct start_pfn in altmap boundary check to decided whether
-	 * we should use altmap or RAM based backing memory allocation. Also
-	 * the address need to be aligned for set_pte operation.
-
-	 * If the start addr is already PMD_SIZE aligned we will try to use
-	 * a pmd mapping. We don't want to be too aggressive here beacause
-	 * that will cause more allocations in RAM. So only if the namespace
-	 * vmemmap start addr is PMD_SIZE aligned we will use PMD mapping.
+	 * If altmap is present, Make sure we align the start vmemmap addr
+	 * to PAGE_SIZE so that we calculate the correct start_pfn in
+	 * altmap boundary check to decide whether we should use altmap or
+	 * RAM based backing memory allocation. Also the address need to be
+	 * aligned for set_pte operation. If the start addr is already
+	 * PMD_SIZE aligned and with in the altmap boundary then we will
+	 * try to use a pmd size altmap mapping else we go for page size
+	 * mapping.
+	 *
+	 * If altmap is not present, align the vmemmap addr to PMD_SIZE and
+	 * always allocate a PMD size page for vmemmap backing.
+	 *
 	 */
 
-	start = ALIGN_DOWN(start, PAGE_SIZE);
+	if (altmap)
+		start = ALIGN_DOWN(start, PAGE_SIZE);
+	else
+		start = ALIGN_DOWN(start, PMD_SIZE);
+
 	for (addr = start; addr < end; addr = next) {
 		next = pmd_addr_end(addr, end);
 
@@ -1159,7 +1166,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 			 * in altmap block allocation failures, in which case
 			 * we fallback to RAM for vmemmap allocation.
 			 */
-			if (!IS_ALIGNED(addr, PMD_SIZE) || (altmap &&
+			if (altmap && (!IS_ALIGNED(addr, PMD_SIZE) ||
 			    altmap_cross_boundary(altmap, addr, PMD_SIZE))) {
 				/*
 				 * make sure we don't create altmap mappings
-- 
2.47.1


