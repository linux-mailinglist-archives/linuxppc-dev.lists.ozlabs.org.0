Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C57D73DC2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 12:25:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EyIl6BQH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqP9l3GNyz3brp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 20:25:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EyIl6BQH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqP6s70pwz30fn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:22:45 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QAHAlQ003467;
	Mon, 26 Jun 2023 10:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RKhqFCmvYDi80QG/8OWPoapj/fHMV2IUE0lhLM4968Y=;
 b=EyIl6BQHlGdQM5dRMJ/k7+r4fTSupX7uSuNqUzxg9tPxAKpcIWM/OKp4SDuNMqFWlW2e
 HR7arcBr1I6fqXxQuU5liMa2CMFMvVDwKD9RGSdRvRB1xY+AYO2TcXcDSUBq2m9ppumx
 8h7XrC3q5UlLcCEadqVQOqzLhDJaZ1jnMH6YHR6WtiiYt0j1dlu0LO0G2Vumx+GOwhTn
 QW/jxU68AlKFrkxWq2N847VV9eykVQPSJuR2eOWKzIHiZBEFypUGbx8CLe96H59V5/HM
 TYYgvG5TPl7xRGQNVmdot9J56mIzPvtwlE5DNhzDdZ5tJ6Bt02hNuyGRKcF89aTRQDTS Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rf8ss03ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:32 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35QAIrf2007638;
	Mon, 26 Jun 2023 10:22:31 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rf8ss03wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:31 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35Q88WVM027941;
	Mon, 26 Jun 2023 10:22:30 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3rdr45ae3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:30 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35QAMTVf852548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 10:22:29 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C5A358058;
	Mon, 26 Jun 2023 10:22:29 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D18858057;
	Mon, 26 Jun 2023 10:22:25 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.116.175])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Jun 2023 10:22:24 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH 2/5] mm/hotplug: Allow architecture override for memmap on memory feature
Date: Mon, 26 Jun 2023 15:52:09 +0530
Message-ID: <20230626102212.119919-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626102212.119919-1-aneesh.kumar@linux.ibm.com>
References: <20230626102212.119919-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: klXlrt_l9oXRg38XaWWRznA0rci86H-e
X-Proofpoint-ORIG-GUID: 6YjO-SOwCluy-1G8xCLozjQdVBrDHCzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_06,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 spamscore=0 mlxscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260091
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

Some architectures like ppc64 wants to enable this feature only with radix
translation and their vemmap mappings have different alignment
requirements. Add overrider for mhp_supports_memmap_on_memory() and also
use altmap.reserve feature to adjust the pageblock alignment requirement.

The patch also fallback to allocation of memmap outside memblock if the
alignment rules are not met for memmap on memory allocation. This allows to
use the feature more widely allocating memmap as much as possible within
the memory block getting added.

A follow patch to enable memmap on memory for ppc64 will use this.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/arm64/mm/mmu.c            |  5 +++++
 arch/x86/mm/init_64.c          |  6 ++++++
 include/linux/memory_hotplug.h |  3 ++-
 mm/memory_hotplug.c            | 36 ++++++++++++++++++++++++----------
 4 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index af6bc8403ee4..a5165897ea58 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1335,6 +1335,11 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 	__remove_pgd_mapping(swapper_pg_dir, __phys_to_virt(start), size);
 }
 
+bool mhp_supports_memmap_on_memory(unsigned long size)
+{
+	return __mhp_supports_memmap_on_memory(size);
+}
+
 /*
  * This memory hotplug notifier helps prevent boot memory from being
  * inadvertently removed as it blocks pfn range offlining process in
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index a190aae8ceaf..b318d26a70d4 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1264,6 +1264,12 @@ void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 	__remove_pages(start_pfn, nr_pages, altmap);
 	kernel_physical_mapping_remove(start, start + size);
 }
+
+bool mhp_supports_memmap_on_memory(unsigned long size)
+{
+	return __mhp_supports_memmap_on_memory(size);
+}
+
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 static struct kcore_list kcore_vsyscall;
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 9fcbf5706595..2387391ee93a 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -358,7 +358,8 @@ extern struct zone *zone_for_pfn_range(int online_type, int nid,
 extern int arch_create_linear_mapping(int nid, u64 start, u64 size,
 				      struct mhp_params *params);
 void arch_remove_linear_mapping(u64 start, u64 size);
-extern bool mhp_supports_memmap_on_memory(unsigned long size);
+bool mhp_supports_memmap_on_memory(unsigned long size);
+bool __mhp_supports_memmap_on_memory(unsigned long size);
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 #endif /* __LINUX_MEMORY_HOTPLUG_H */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 88a9c4443fc0..7cb112fb4996 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1284,7 +1284,8 @@ static int online_memory_block(struct memory_block *mem, void *arg)
 	return device_online(&mem->dev);
 }
 
-bool mhp_supports_memmap_on_memory(unsigned long size)
+/* Helper function for architecture to use. */
+bool __mhp_supports_memmap_on_memory(unsigned long size)
 {
 	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
 	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
@@ -1322,6 +1323,20 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
 	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
 }
 
+bool __weak mhp_supports_memmap_on_memory(unsigned long size)
+{
+	return false;
+}
+
+/*
+ * Architectures may want to override the altmap reserve details based
+ * on the alignment requirement for vmemmap mapping.
+ */
+unsigned __weak long memory_block_align_base(struct resource *res)
+{
+	return 0;
+}
+
 /*
  * NOTE: The caller must call lock_device_hotplug() to serialize hotplug
  * and online/offline operations (triggered e.g. by sysfs).
@@ -1332,7 +1347,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
-	struct vmem_altmap mhp_altmap = {};
+	struct vmem_altmap mhp_altmap = {
+		.base_pfn =  PHYS_PFN(res->start),
+		.end_pfn  =  PHYS_PFN(res->end),
+		.reserve  = memory_block_align_base(res),
+	};
 	struct memory_group *group = NULL;
 	u64 start, size;
 	bool new_node = false;
@@ -1376,13 +1395,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	 * Self hosted memmap array
 	 */
 	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
-		if (!mhp_supports_memmap_on_memory(size)) {
-			ret = -EINVAL;
-			goto error;
+		if (mhp_supports_memmap_on_memory(size)) {
+			mhp_altmap.free	= PHYS_PFN(size) - mhp_altmap.reserve;
+			params.altmap = &mhp_altmap;
 		}
-		mhp_altmap.free = PHYS_PFN(size);
-		mhp_altmap.base_pfn = PHYS_PFN(start);
-		params.altmap = &mhp_altmap;
+		/* if not supported don't use altmap */
 	}
 
 	/* call arch's memory hotadd */
@@ -1391,8 +1408,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		goto error;
 
 	/* create memory block devices after memory was added */
-	ret = create_memory_block_devices(start, size, &mhp_altmap,
-					  group);
+	ret = create_memory_block_devices(start, size, &mhp_altmap, group);
 	if (ret) {
 		arch_remove_memory(start, size, NULL);
 		goto error;
-- 
2.41.0

