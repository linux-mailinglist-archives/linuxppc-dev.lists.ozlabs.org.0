Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE5761031
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 12:05:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P3Z4AZh7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9CMG5hw1z3d7t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:05:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P3Z4AZh7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9CJQ3XHHz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 20:02:46 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P9tNPK022247;
	Tue, 25 Jul 2023 10:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GB1lCglV8LwUrneFfqAgwx4CmNBI9hR7fw7cHMyn2BU=;
 b=P3Z4AZh7vl56a3I1bDgkMQ1mJsguRpdiGdQ0OSatyBM55Mf4NIpdPWRtFQwa3E2lDiF4
 2FNqw5rjLBc1UHRD1k0KQtjoDqH1Uwi87mF8vPbUTYZEn2RXDeBOacbd7pGoCVe5bZaY
 y4RG0RPSZNeC8Z0l6TxEZx7dPlmHmYxGJDlm7EW/tGvYpnvD4jLsuMvTPiSimcl/rYV5
 jHKVv+5MCI5yJ7u1b2G3w1y8dICquEucOvIPR0A8580LwPZVkgz8/W57ifTzHOAiPIva
 1512HxgaPhTXm+eWv0cfIiViXJMdhKgXUI7rKUo/r0L9oyPvOo89fiJlEm2UniE3PpA/ rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s2bpqguqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:32 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36P9ebbx002191;
	Tue, 25 Jul 2023 10:02:32 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s2bpqguqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:32 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36PA2D4r014387;
	Tue, 25 Jul 2023 10:02:31 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0stxu8yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:31 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36PA2UXE6226446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jul 2023 10:02:30 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 667F95805A;
	Tue, 25 Jul 2023 10:02:30 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E1B458051;
	Tue, 25 Jul 2023 10:02:26 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Jul 2023 10:02:26 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 2/7] mm/hotplug: Allow memmap on memory hotplug request to fallback
Date: Tue, 25 Jul 2023 15:32:07 +0530
Message-ID: <20230725100212.531277-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oeXic4QMWbD_ylfj6OlL41jfzQQL1IrO
X-Proofpoint-ORIG-GUID: -E0t8eMXrLlWSN02ujcXTrk5D4u0dxYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_04,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 spamscore=0 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=953
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250082
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

