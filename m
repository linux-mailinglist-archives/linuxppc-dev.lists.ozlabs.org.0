Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 969027497BD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 10:53:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XKTorbcR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxVgm15vdz3bwJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 18:53:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XKTorbcR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxVcx3HnZz3brb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 18:51:29 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3668nPGP028370;
	Thu, 6 Jul 2023 08:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zRrEFgiSl06WoUYA5FcS/votWh66pvHCGT+x7OFE9+4=;
 b=XKTorbcRyTFa6V3KgIyEIHDN/thGM7XGgRd6YsselrDXBlkJ3qHpoar5Abx6YDvHLR10
 ONdvK0nkbwneFKAisiZMr/6U6vnecn1iIXBo97I75yeyyFO5zlgd4qomLelP70rvnbG1
 ZwovbYI9Kng8abqtSI5JRLGlsu6X4uP748kSEKMUYUyYja1V7Z/DRiURtiDFquZau0BT
 IpXSa57wgUDpELkoxKRgZ5Lb3LrC0AOJDMUBPB0pRgnjksChCjM5XJXp68hiXJDfWMD1
 32aWbBd5ECGGs4FC7GrnS3KxHF6N9gujFz7lfDjWblzqKg7gw+fWIexW+nlx7ZWZMhZq IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnted01m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:51:15 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3668nTLb029060;
	Thu, 6 Jul 2023 08:51:15 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnted01kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:51:15 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3667UGWs017150;
	Thu, 6 Jul 2023 08:51:14 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3rjbs5yws0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:51:14 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3668pDdx36700650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 08:51:13 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7ADC58057;
	Thu,  6 Jul 2023 08:51:12 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2107658059;
	Thu,  6 Jul 2023 08:51:09 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 08:51:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 3/5] mm/hotplug: Simplify the handling of MHP_MEMMAP_ON_MEMORY flag
Date: Thu,  6 Jul 2023 14:20:39 +0530
Message-ID: <20230706085041.826340-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OBfvSS76-ZExmrH3IUCz5uTxGrTB_QG1
X-Proofpoint-ORIG-GUID: SIf33BvggDc3tU4p00BbAqDomYrgthXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_05,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Instead of checking for memmap on memory feature enablement within the
functions checking for alignment, use the kernel parameter to control the
memory hotplug flags. The generic kernel now enables memmap on memory
feature if the hotplug flag request for the same.

The ACPI code now can pass the flag unconditionally because the kernel will
fallback to not using the feature if the alignment rules are not met.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/acpi/acpi_memhotplug.c |  3 +--
 include/linux/memory_hotplug.h | 14 ++++++++++++++
 mm/memory_hotplug.c            | 35 +++++++++++-----------------------
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
index 24f662d8bd39..4d0096fc4cc2 100644
--- a/drivers/acpi/acpi_memhotplug.c
+++ b/drivers/acpi/acpi_memhotplug.c
@@ -211,8 +211,7 @@ static int acpi_memory_enable_device(struct acpi_memory_device *mem_device)
 		if (!info->length)
 			continue;
 
-		if (mhp_supports_memmap_on_memory(info->length))
-			mhp_flags |= MHP_MEMMAP_ON_MEMORY;
+		mhp_flags |= get_memmap_on_memory_flags();
 		result = __add_memory(mgid, info->start_addr, info->length,
 				      mhp_flags);
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index a769f44b8368..af7017122506 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -358,4 +358,18 @@ bool mhp_supports_memmap_on_memory(unsigned long size);
 bool __mhp_supports_memmap_on_memory(unsigned long size);
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
+#ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
+extern bool memmap_on_memory;
+static inline unsigned long get_memmap_on_memory_flags(void)
+{
+	if (memmap_on_memory)
+		return MHP_MEMMAP_ON_MEMORY;
+	return 0;
+}
+#else
+static inline unsigned long get_memmap_on_memory_flags(void)
+{
+	return 0;
+}
+#endif
 #endif /* __LINUX_MEMORY_HOTPLUG_H */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 423f96dd5481..a1542b8f64e6 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -45,19 +45,9 @@
 /*
  * memory_hotplug.memmap_on_memory parameter
  */
-static bool memmap_on_memory __ro_after_init;
+bool memmap_on_memory __ro_after_init;
 module_param(memmap_on_memory, bool, 0444);
 MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug");
-
-static inline bool mhp_memmap_on_memory(void)
-{
-	return memmap_on_memory;
-}
-#else
-static inline bool mhp_memmap_on_memory(void)
-{
-	return false;
-}
 #endif
 
 enum {
@@ -1280,10 +1270,9 @@ bool __mhp_supports_memmap_on_memory(unsigned long size)
 	 *       altmap as an alternative source of memory, and we do not exactly
 	 *       populate a single PMD.
 	 */
-	return mhp_memmap_on_memory() &&
-	       size == memory_block_size_bytes() &&
-	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
-	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
+	return size == memory_block_size_bytes() &&
+		IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
+		IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
 }
 
 bool __weak mhp_supports_memmap_on_memory(unsigned long size)
@@ -2082,15 +2071,13 @@ static int __ref try_remove_memory(u64 start, u64 size)
 	 * the same granularity it was added - a single memory block.
 	 */
 
-	if (mhp_memmap_on_memory()) {
-		ret = walk_memory_blocks(start, size, &altmap, get_vmemmap_altmap_cb);
-		if (ret) {
-			if (size != memory_block_size_bytes()) {
-				pr_warn("Refuse to remove %#llx - %#llx,"
-					"wrong granularity\n",
-					start, start + size);
-				return -EINVAL;
-			}
+	ret = walk_memory_blocks(start, size, &altmap, get_vmemmap_altmap_cb);
+	if (ret) {
+		if (size != memory_block_size_bytes()) {
+			pr_warn("Refuse to remove %#llx - %#llx,"
+				"wrong granularity\n",
+				start, start + size);
+			return -EINVAL;
 		}
 	}
 
-- 
2.41.0

