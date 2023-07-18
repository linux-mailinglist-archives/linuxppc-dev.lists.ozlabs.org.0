Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9425C7571F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:48:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o7Zg0QEy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4k0q3JDKz3bVJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:48:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o7Zg0QEy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4jwK5K4Tz2yV0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:44:49 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I2eN5g012244;
	Tue, 18 Jul 2023 02:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iiAMzf9/JUUpzASd6edLD6T9VcF+qOXLt17LVK5cPJ4=;
 b=o7Zg0QEyZSLjn+u++72sqDO+S8idWKIWuxEFlPkiSMCBYh3sJX9PF3JCxuAp7Ov0jYiW
 d/pHaX28z1ts77SLQSuWpnoLaKBhgjcry/7Wt1VxknrvvZoMUNlqZTD8EUw+qXYVD+1g
 3HgVZBWjZ8i5PRqMxNQgBKFOnfdwR8twfG6vD9FAbehHMO2n4GBxiAC4oqFNVO/WC6xl
 Y0bqo8TbPH+dUnPjUk+mXqdsjqR43mSeNtPPynyWT/hZtI2jZ/L+Zpq9qUXJuPzh9mMC
 XO5ByAtTAdKhyBol4lS+/pJ9OsHa8xWK6y4GUxfaFl7/YjbsBxwSkYFNWjOVFbzU02au gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhwhg8vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:44:38 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36I2ibR0022406;
	Tue, 18 Jul 2023 02:44:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhwhg8vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:44:37 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36HMmEpS029129;
	Tue, 18 Jul 2023 02:44:37 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3rv6smbtw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:44:36 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36I2iaou4326056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 02:44:36 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F9C35805C;
	Tue, 18 Jul 2023 02:44:36 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2522658051;
	Tue, 18 Jul 2023 02:44:32 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.62.199])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 02:44:31 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v4 4/6] mm/hotplug: Allow pageblock alignment via altmap reservation
Date: Tue, 18 Jul 2023 08:14:07 +0530
Message-ID: <20230718024409.95742-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NYGjjbxDG3yzk0yrnkp12ax3MuX9J-Am
X-Proofpoint-ORIG-GUID: h_qhn8GUpWWyCJOSb143OV4IB6QMl6yj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180022
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

Add a new kconfig option that can be selected if we want to allow
pageblock alignment by reserving pages in the vmemmap altmap area.
This implies we will be reserving some pages for every memoryblock
This also allows the memmap on memory feature to be widely useful
with different memory block size values.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/memory_hotplug.c | 109 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 96 insertions(+), 13 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 5921c81fcb70..c409f5ff6a59 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -41,17 +41,85 @@
 #include "internal.h"
 #include "shuffle.h"
 
+enum {
+	MEMMAP_ON_MEMORY_DISABLE = 0,
+	MEMMAP_ON_MEMORY_ENABLE,
+	MEMMAP_ON_MEMORY_FORCE,
+};
+
+static int memmap_mode __read_mostly = MEMMAP_ON_MEMORY_DISABLE;
+
+static inline unsigned long memory_block_align_base(unsigned long size)
+{
+	if (memmap_mode == MEMMAP_ON_MEMORY_FORCE) {
+		unsigned long align;
+		unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
+		unsigned long vmemmap_size;
+
+		vmemmap_size = DIV_ROUND_UP(nr_vmemmap_pages * sizeof(struct page), PAGE_SIZE);
+		align = pageblock_align(vmemmap_size) - vmemmap_size;
+		return align;
+	} else
+		return 0;
+}
+
 #ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
 /*
  * memory_hotplug.memmap_on_memory parameter
  */
-static bool memmap_on_memory __ro_after_init;
-module_param(memmap_on_memory, bool, 0444);
-MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug");
+static int set_memmap_mode(const char *val, const struct kernel_param *kp)
+{
+	int ret, mode;
+	bool enabled;
+
+	if (sysfs_streq(val, "force") ||  sysfs_streq(val, "FORCE")) {
+		mode =  MEMMAP_ON_MEMORY_FORCE;
+		goto matched;
+	}
+
+	ret = kstrtobool(val, &enabled);
+	if (ret < 0)
+		return ret;
+	if (enabled)
+		mode =  MEMMAP_ON_MEMORY_ENABLE;
+	else
+		mode =  MEMMAP_ON_MEMORY_DISABLE;
+
+matched:
+	*((int *)kp->arg) =  mode;
+	if (mode == MEMMAP_ON_MEMORY_FORCE) {
+		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
+			memory_block_align_base(memory_block_size_bytes()));
+	}
+	return 0;
+}
+
+static int get_memmap_mode(char *buffer, const struct kernel_param *kp)
+{
+	if (*((int *)kp->arg) == MEMMAP_ON_MEMORY_FORCE)
+		return sprintf(buffer,  "force\n");
+	if (*((int *)kp->arg) == MEMMAP_ON_MEMORY_ENABLE)
+		return sprintf(buffer,  "y\n");
+
+	return sprintf(buffer,  "n\n");
+}
+
+static const struct kernel_param_ops memmap_mode_ops = {
+	.set = set_memmap_mode,
+	.get = get_memmap_mode,
+};
+module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0444);
+MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
+	"With value \"force\" it could result in memory wastage due to memmap size limitations \n"
+	"For example, if the memmap for a memory block requires 1 MiB, but the pageblock \n"
+	"size is 2 MiB, 1 MiB of hotplugged memory will be wasted. Note that there are \n"
+	"still cases where the feature cannot be enforced: for example, if the memmap is \n"
+	"smaller than a single page, or if the architecture does not support the forced \n"
+	"mode in all configurations. (y/n/force)");
 
 static inline bool mhp_memmap_on_memory(void)
 {
-	return memmap_on_memory;
+	return !!memmap_mode;
 }
 #else
 static inline bool mhp_memmap_on_memory(void)
@@ -1264,7 +1332,6 @@ static inline bool arch_supports_memmap_on_memory(unsigned long size)
 
 static bool mhp_supports_memmap_on_memory(unsigned long size)
 {
-
 	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
 	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
 	unsigned long remaining_size = size - vmemmap_size;
@@ -1295,10 +1362,23 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
 	 *       altmap as an alternative source of memory, and we do not exactly
 	 *       populate a single PMD.
 	 */
-	return mhp_memmap_on_memory() &&
-	       size == memory_block_size_bytes() &&
-	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)) &&
-	       arch_supports_memmap_on_memory(size);
+	if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
+		return false;
+
+	/*
+	 * Make sure the vmemmap allocation is fully contained
+	 * so that we always allocate vmemmap memory from altmap area.
+	 */
+	if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
+		return false;
+	 /*
+	  * Without page reservation remaining pages should be pageblock aligned.
+	  */
+	if (memmap_mode != MEMMAP_ON_MEMORY_FORCE &&
+	    !IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)))
+		return false;
+
+	return arch_supports_memmap_on_memory(size);
 }
 
 /*
@@ -1311,7 +1391,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
-	struct vmem_altmap mhp_altmap = {};
+	struct vmem_altmap mhp_altmap = {
+		.base_pfn =  PHYS_PFN(res->start),
+		.end_pfn  =  PHYS_PFN(res->end),
+		.reserve  = memory_block_align_base(resource_size(res)),
+	};
 	struct memory_group *group = NULL;
 	u64 start, size;
 	bool new_node = false;
@@ -1356,8 +1440,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	 */
 	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
 		if (mhp_supports_memmap_on_memory(size)) {
-			mhp_altmap.free = PHYS_PFN(size);
-			mhp_altmap.base_pfn = PHYS_PFN(start);
+			mhp_altmap.free = PHYS_PFN(size) - mhp_altmap.reserve;
 			params.altmap = &mhp_altmap;
 		}
 		/* fallback to not using altmap  */
@@ -1369,7 +1452,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		goto error;
 
 	/* create memory block devices after memory was added */
-	ret = create_memory_block_devices(start, size, mhp_altmap.alloc,
+	ret = create_memory_block_devices(start, size, mhp_altmap.alloc + mhp_altmap.reserve,
 					  group);
 	if (ret) {
 		arch_remove_memory(start, size, NULL);
-- 
2.41.0

