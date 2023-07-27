Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6990764A46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 10:08:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ua+TPCzN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBNgh5Nwwz3cV5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 18:08:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ua+TPCzN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBNfq35zLz3dDm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 18:07:47 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R83rRc004106;
	Thu, 27 Jul 2023 08:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GB1lCglV8LwUrneFfqAgwx4CmNBI9hR7fw7cHMyn2BU=;
 b=Ua+TPCzNySzusontHeNEZQhzUF0vyQnchJNtEbxORmKY6o+JXtBQ70ZeM+E91FHlCxwK
 48YfOBDCk0g2kiTav/92RJjHjipr3OehNySdbnmv7dq2TURs5IgXvhkyf+KG8A+lObRG
 NlfrS2sPy2oP60OntfZHD1z9x0Ptm2zSEl2It7Pqf5cr76pZ4I514zleWSqqCp861NPW
 herwq9v3VQ/8VywjFGnodbMztUWvBO5aIkyjO0yplna1fCCfENqZpuJS1QHvEgei3xNC
 OZo/EtUdTDtV7STqDB9mFvCddb0ASZg/dE0B4ytt/pv43gh15ZftphWGUuXmRSuoRm7/ Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3mr9r6u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:07:35 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36R7hv5V001080;
	Thu, 27 Jul 2023 08:02:55 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3met8er8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:02:55 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36R7vdiX016610;
	Thu, 27 Jul 2023 08:02:53 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0v51k84v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:02:53 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36R82qEl3211978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jul 2023 08:02:52 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63D2858063;
	Thu, 27 Jul 2023 08:02:52 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D4D15804B;
	Thu, 27 Jul 2023 08:02:48 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jul 2023 08:02:48 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v6 2/7] mm/memory_hotplug: Allow memmap on memory hotplug request to fallback
Date: Thu, 27 Jul 2023 13:32:27 +0530
Message-ID: <20230727080232.667439-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J89v7IRe4GvETSoFT-r6rOYJi9y4du21
X-Proofpoint-GUID: 4QJ3qvsk-cMKlyaxNSWonwPYAvX0Dsaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=954 adultscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270070
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

If not supported, fallback to not using memap on memmory. This avoids
the need for callers to do the fallback.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/acpi/acpi_memhotplug.c |  3 +--
 include/linux/memory_hotplug.h |  3 ++-
 mm/memory_hotplug.c            | 13 ++++++-------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
index 24f662d8bd39..d0c1a71007d0 100644
--- a/drivers/acpi/acpi_memhotplug.c
+++ b/drivers/acpi/acpi_memhotplug.c
@@ -211,8 +211,7 @@ static int acpi_memory_enable_device(struct acpi_memory_device *mem_device)
 		if (!info->length)
 			continue;
 
-		if (mhp_supports_memmap_on_memory(info->length))
-			mhp_flags |= MHP_MEMMAP_ON_MEMORY;
+		mhp_flags |= MHP_MEMMAP_ON_MEMORY;
 		result = __add_memory(mgid, info->start_addr, info->length,
 				      mhp_flags);
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 013c69753c91..7d2076583494 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -97,6 +97,8 @@ typedef int __bitwise mhp_t;
  * To do so, we will use the beginning of the hot-added range to build
  * the page tables for the memmap array that describes the entire range.
  * Only selected architectures support it with SPARSE_VMEMMAP.
+ * This is only a hint, the core kernel can decide to not do this based on
+ * different alignment checks.
  */
 #define MHP_MEMMAP_ON_MEMORY   ((__force mhp_t)BIT(1))
 /*
@@ -354,7 +356,6 @@ extern struct zone *zone_for_pfn_range(int online_type, int nid,
 extern int arch_create_linear_mapping(int nid, u64 start, u64 size,
 				      struct mhp_params *params);
 void arch_remove_linear_mapping(u64 start, u64 size);
-extern bool mhp_supports_memmap_on_memory(unsigned long size);
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 #endif /* __LINUX_MEMORY_HOTPLUG_H */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 7cfd13c91568..eca32ccd45cc 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1247,7 +1247,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
 	return device_online(&mem->dev);
 }
 
-bool mhp_supports_memmap_on_memory(unsigned long size)
+static bool mhp_supports_memmap_on_memory(unsigned long size)
 {
 	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
 	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
@@ -1339,13 +1339,12 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	 * Self hosted memmap array
 	 */
 	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
-		if (!mhp_supports_memmap_on_memory(size)) {
-			ret = -EINVAL;
-			goto error;
+		if (mhp_supports_memmap_on_memory(size)) {
+			mhp_altmap.free = PHYS_PFN(size);
+			mhp_altmap.base_pfn = PHYS_PFN(start);
+			params.altmap = &mhp_altmap;
 		}
-		mhp_altmap.free = PHYS_PFN(size);
-		mhp_altmap.base_pfn = PHYS_PFN(start);
-		params.altmap = &mhp_altmap;
+		/* fallback to not using altmap  */
 	}
 
 	/* call arch's memory hotadd */
-- 
2.41.0

