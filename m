Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DED764A02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 10:05:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R1sBpylW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBNc816hbz3dBt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 18:05:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R1sBpylW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBNYW2HMHz30gy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 18:03:11 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R7cY0x013762;
	Thu, 27 Jul 2023 08:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fwaoNkaypaNUy2xOWUXUJIe/5DhknF9d766otjQ/UDk=;
 b=R1sBpylWwpz+8DKzU+v8KoGZ8LwLpBDPgCE1bm4lcDCKA/qBwVac0pDNm3V6cTroG1sj
 +bjf06Y/l83KODD1VDkXnb7pUfDp+GRJGx1R5wDSz9RUT63TTi0bybKeFbyYuNsLYYZP
 Hyd8VuPfIKk6izJxC8yWpZQaVQKXR4g/9N+dXAY3A0D3/iUGXo+UUMEpmgk8qcdyAlYf
 bo7QZC9sNMsOXf3qu21EmF3eJxmYXa7MXCLFhj/VDtrBqEuiVRuwVXFtxiRugxx5ZKKs
 B1QSKId8ZDzepPqhC+PZLmjuqWpHavxYp4CtJs6r06H9NJIB0Ev1vMmRC5pqbd95Oif6 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3k83je2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:02:59 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36R7cka5015256;
	Thu, 27 Jul 2023 08:02:58 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3k83je23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:02:58 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36R7qvoZ026197;
	Thu, 27 Jul 2023 08:02:57 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0sesc80f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:02:57 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36R82vDd44827098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jul 2023 08:02:57 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06E135805B;
	Thu, 27 Jul 2023 08:02:57 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BAB05804B;
	Thu, 27 Jul 2023 08:02:53 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jul 2023 08:02:52 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v6 3/7] mm/memory_hotplug: Allow architecture to override memmap on memory support check
Date: Thu, 27 Jul 2023 13:32:28 +0530
Message-ID: <20230727080232.667439-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: azA2QzQLvEzycei_fynRUEET_6I1Ptos
X-Proofpoint-GUID: g6uawDR3OktpApgEvvaAU4yv256cT2sB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270066
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

The PMD_SIZE check is moved there.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/memory_hotplug.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index eca32ccd45cc..746cb7c08c64 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1247,10 +1247,26 @@ static int online_memory_block(struct memory_block *mem, void *arg)
 	return device_online(&mem->dev);
 }
 
+static inline unsigned long memory_block_memmap_size(void)
+{
+	return PHYS_PFN(memory_block_size_bytes()) * sizeof(struct page);
+}
+
+#ifndef arch_supports_memmap_on_memory
+static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
+{
+	/*
+	 * As default, we want the vmemmap to span a complete PMD such that we
+	 * can map the vmemmap using a single PMD if supported by the
+	 * architecture.
+	 */
+	return IS_ALIGNED(vmemmap_size, PMD_SIZE);
+}
+#endif
+
 static bool mhp_supports_memmap_on_memory(unsigned long size)
 {
-	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
-	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
+	unsigned long vmemmap_size = memory_block_memmap_size();
 	unsigned long remaining_size = size - vmemmap_size;
 
 	/*
@@ -1281,8 +1297,8 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
 	 */
 	return mhp_memmap_on_memory() &&
 	       size == memory_block_size_bytes() &&
-	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
-	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
+	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)) &&
+	       arch_supports_memmap_on_memory(vmemmap_size);
 }
 
 /*
-- 
2.41.0

