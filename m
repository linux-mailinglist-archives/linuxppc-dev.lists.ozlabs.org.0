Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7007497B9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 10:53:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hYv908OY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxVfd6MsZz3bnQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 18:52:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hYv908OY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxVcq1cBlz30Py
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 18:51:23 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3668lbmk029799;
	Thu, 6 Jul 2023 08:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yWDKE2KFAvzWi+hJBYCHJUQfyTQYR3nDK4Q3JajXxqE=;
 b=hYv908OYurQWZrLWNCIPYbiqhyFONEKpfN0poxftJXMdsLDDHoHqPhcjhwRe2TBLAG1u
 M0BL/iN4Smf/i2g0IkZwgv1s9JEXah6qcd8b+BMkwJrev+hqsgTQIyhle2I6kA5iWwhg
 E9pLiS5XWX5P+ujYof5PdA4EqZFR3JFZgR0P3S+AvNUlFE8sqGsQlZ5EEQsXbicyhwt/
 zhWZrIG8TUIXl0yaJn/EoiLaCOphDp+jiZGNJQ4IYx0hH4a7fMY4JZUgAdpHPyI0/Eq6
 XOh/YwgG/TSO1v8YooNAajq2HW8y1OdanOW2jaKBKQenQDwjRDrFPT51Bq/+T9b5zEmR eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntdq023f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:51:11 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3668m2EQ031779;
	Thu, 6 Jul 2023 08:51:10 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntdq0232-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:51:10 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3667Kkk5001938;
	Thu, 6 Jul 2023 08:51:09 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3rjbs5yx2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:51:09 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3668p8kn36831860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 08:51:08 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CCBB58057;
	Thu,  6 Jul 2023 08:51:08 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C520858059;
	Thu,  6 Jul 2023 08:51:04 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 08:51:04 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 2/5] mm/hotplug: Allow architecture override for memmap on memory feature
Date: Thu,  6 Jul 2023 14:20:38 +0530
Message-ID: <20230706085041.826340-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: msxFzy6ToDq7gnEnmM3EuYtvcQ7vtZvM
X-Proofpoint-ORIG-GUID: Te27x1c0_0o9MN28xfEeUwof_0E19SQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_05,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060075
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
index 95d360805f8a..0ff2ec634a58 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1340,6 +1340,11 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
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
index 013c69753c91..a769f44b8368 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -354,7 +354,8 @@ extern struct zone *zone_for_pfn_range(int online_type, int nid,
 extern int arch_create_linear_mapping(int nid, u64 start, u64 size,
 				      struct mhp_params *params);
 void arch_remove_linear_mapping(u64 start, u64 size);
-extern bool mhp_supports_memmap_on_memory(unsigned long size);
+bool mhp_supports_memmap_on_memory(unsigned long size);
+bool __mhp_supports_memmap_on_memory(unsigned long size);
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 #endif /* __LINUX_MEMORY_HOTPLUG_H */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index c4bac38cc147..423f96dd5481 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1247,7 +1247,8 @@ static int online_memory_block(struct memory_block *mem, void *arg)
 	return device_online(&mem->dev);
 }
 
-bool mhp_supports_memmap_on_memory(unsigned long size)
+/* Helper function for architecture to use. */
+bool __mhp_supports_memmap_on_memory(unsigned long size)
 {
 	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
 	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
@@ -1285,6 +1286,20 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
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
@@ -1295,7 +1310,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
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
@@ -1339,13 +1358,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
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
@@ -1354,8 +1371,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
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

