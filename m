Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2C674E611
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:52:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aYdTTAn3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0T4j4l0Pz3cJ6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:52:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aYdTTAn3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0T1H02plz3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:49:22 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4jXEn021316;
	Tue, 11 Jul 2023 04:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xCc2t1OCuvmYEBqdWeIf9NwGoHZvnb8ZRoU9LAU+Spo=;
 b=aYdTTAn3Px4U7WqCq/rLeW0RDoL1Gex2HMxRR4/HHV1xgZsx/6EeffY99C5HWzeiZJ7/
 nI+5am/3LUNgP/ZIq3qbf5yD37ouWe8TrnHi1lseVddElkXYo2cJ2D+Th5ehM94id9LA
 3o4ev4TNOiSf534hTYQV3t0C0QsI2hporChKL0ewKJyRZVGojcK0/ilM+k5p69xLRhnz
 ohnrwINk8IX4Nf/6Achx+zY/2+Us+wPQvcTWLlDwMnaOwYHcKo3CXb8Scq0eLqtvO7s5
 puPhABv6eSaZgUe++KhSdnx67+RLTdwc7FI081I5iY6Yhjwzaisrtc9cRAAgRg48dqyG bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs085gdbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:10 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B4lBiX029956;
	Tue, 11 Jul 2023 04:49:08 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs085gdb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:08 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4Ak6i017144;
	Tue, 11 Jul 2023 04:49:07 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3rpye6vecr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:06 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B4n5Y446661908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 04:49:05 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 882EA5805B;
	Tue, 11 Jul 2023 04:49:05 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0E9258063;
	Tue, 11 Jul 2023 04:49:00 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.86.43])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 04:49:00 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 3/7] mm/hotplug: Allow architecture to override memmap on memory support check
Date: Tue, 11 Jul 2023 10:18:29 +0530
Message-ID: <20230711044834.72809-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JUM55NyZuqPvTG4pSPvoE0tJhOASM2k4
X-Proofpoint-GUID: F0LKoe514ZDp7c8YArMLPNObvg7X4Iys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_02,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110040
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Vishal Verma <vishal.l.verma@intel.com>, David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures would want different restrictions. Hence add an
architecture-specific override.

Both the PMD_SIZE check and pageblock alignment check are moved there.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/memory_hotplug.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 1b19462f4e72..07c99b0cc371 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1247,12 +1247,20 @@ static int online_memory_block(struct memory_block *mem, void *arg)
 	return device_online(&mem->dev);
 }
 
-static bool mhp_supports_memmap_on_memory(unsigned long size)
+#ifndef arch_supports_memmap_on_memory
+static inline bool arch_supports_memmap_on_memory(unsigned long size)
 {
-	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
+	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
 	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
 	unsigned long remaining_size = size - vmemmap_size;
 
+	return IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
+		IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
+}
+#endif
+
+static bool mhp_supports_memmap_on_memory(unsigned long size)
+{
 	/*
 	 * Besides having arch support and the feature enabled at runtime, we
 	 * need a few more assumptions to hold true:
@@ -1280,9 +1288,8 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
 	 *       populate a single PMD.
 	 */
 	return mhp_memmap_on_memory() &&
-	       size == memory_block_size_bytes() &&
-	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
-	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
+		size == memory_block_size_bytes() &&
+		arch_supports_memmap_on_memory(size);
 }
 
 /*
-- 
2.41.0

