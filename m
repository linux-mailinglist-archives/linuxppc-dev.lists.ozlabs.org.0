Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7A74E61F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:55:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eqyS98/V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0T8s4kdzz3byX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:55:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eqyS98/V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0T1m3H4Tz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:49:48 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4kwjF016806;
	Tue, 11 Jul 2023 04:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=izAKLkGXW4KeySMlKO+lq28yrDcfXnzVthdmbn/zMFQ=;
 b=eqyS98/VjnrlSvhy86dKXl6ELjpYbS3P6rxJtEus+Fl1ZzujdgD4J6G+kakzx8KOPsTf
 b6WXDb58lua7Jk6FPTcVDQkDNrKOuWbpKq/JfSmAIIpkn96GvJlHYmIgg4BNUWreBP2j
 yCIfl4Do7J4xOPyOaXEejUaCW1HOSPjyjBbDhJGMJ/rrTHw0PT9uWIIbtlBo5S55NKtv
 2sBABPmCyIc74UoK8grOp4GDRpdTRlZsF6YshrNmsDL91ajmURzF0KGCepH1x/IZD2GM
 94FHswuBWGS/X7llC6nPFeIgcEyddqGjB++9XbWG4zbwf3JkaMKT11iPGmrIjcbTHW8D sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs0btg4g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:27 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B4kuF0016759;
	Tue, 11 Jul 2023 04:49:27 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs0btg4fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:26 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36AJnxOn026569;
	Tue, 11 Jul 2023 04:49:26 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3rpye5m6xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:26 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B4nOUs21561760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 04:49:24 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9351258067;
	Tue, 11 Jul 2023 04:49:24 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7EA25804B;
	Tue, 11 Jul 2023 04:49:17 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.86.43])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 04:49:17 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 6/7] dax/kmem: Always enroll hotplugged memory for memmap_on_memory
Date: Tue, 11 Jul 2023 10:18:32 +0530
Message-ID: <20230711044834.72809-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oa8R27GieEOayLSVPDKzsgEAIl9wm7HA
X-Proofpoint-GUID: dhygPK-lH0NzJ-5CMxb87fS1U4hSZ6Ai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_02,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Michal Hocko <mhocko@suse.com>, Dave Jiang <dave.jiang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Len Brown <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vishal Verma <vishal.l.verma@intel.com>

With DAX memory regions originating from CXL memory expanders or
NVDIMMs, the kmem driver may be hot-adding huge amounts of system memory
on a system without enough 'regular' main memory to support the memmap
for it. To avoid this, ensure that all kmem managed hotplugged memory is
added with the MHP_MEMMAP_ON_MEMORY flag to place the memmap on the
new memory region being hot added.

To do this, call add_memory() in chunks of memory_block_size_bytes() as
that is a requirement for memmap_on_memory.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Huang Ying <ying.huang@intel.com>
Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/dax/kmem.c | 81 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 59 insertions(+), 22 deletions(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index 898ca9505754..840bf7b40a44 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -12,6 +12,7 @@
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/memory-tiers.h>
+#include <linux/memory_hotplug.h>
 #include "dax-private.h"
 #include "bus.h"
 
@@ -105,6 +106,7 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 	data->mgid = rc;
 
 	for (i = 0; i < dev_dax->nr_range; i++) {
+		u64 cur_start, cur_len, remaining;
 		struct resource *res;
 		struct range range;
 
@@ -137,21 +139,42 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 		res->flags = IORESOURCE_SYSTEM_RAM;
 
 		/*
-		 * Ensure that future kexec'd kernels will not treat
-		 * this as RAM automatically.
+		 * Add memory in chunks of memory_block_size_bytes() so that
+		 * it is considered for MHP_MEMMAP_ON_MEMORY
+		 * @range has already been aligned to memory_block_size_bytes(),
+		 * so the following loop will always break it down cleanly.
 		 */
-		rc = add_memory_driver_managed(data->mgid, range.start,
-				range_len(&range), kmem_name, MHP_NID_IS_MGID);
-
-		if (rc) {
-			dev_warn(dev, "mapping%d: %#llx-%#llx memory add failed\n",
-					i, range.start, range.end);
-			remove_resource(res);
-			kfree(res);
-			data->res[i] = NULL;
-			if (mapped)
-				continue;
-			goto err_request_mem;
+		cur_start = range.start;
+		cur_len = memory_block_size_bytes();
+		remaining = range_len(&range);
+		while (remaining) {
+			/*
+			 * If alignment rules are not satisified we will
+			 * fallback normal memmap allocation.
+			 */
+			mhp_t mhp_flags = MHP_NID_IS_MGID | MHP_MEMMAP_ON_MEMORY;
+			/*
+			 * Ensure that future kexec'd kernels will not treat
+			 * this as RAM automatically.
+			 */
+			rc = add_memory_driver_managed(data->mgid, cur_start,
+						       cur_len, kmem_name,
+						       mhp_flags);
+
+			if (rc) {
+				dev_warn(dev,
+					 "mapping%d: %#llx-%#llx memory add failed\n",
+					 i, cur_start, cur_start + cur_len - 1);
+				remove_resource(res);
+				kfree(res);
+				data->res[i] = NULL;
+				if (mapped)
+					continue;
+				goto err_request_mem;
+			}
+
+			cur_start += cur_len;
+			remaining -= cur_len;
 		}
 		mapped++;
 	}
@@ -186,25 +209,39 @@ static void dev_dax_kmem_remove(struct dev_dax *dev_dax)
 	 * unbind will succeed even if we return failure.
 	 */
 	for (i = 0; i < dev_dax->nr_range; i++) {
+
+		u64 cur_start, cur_len, remaining;
 		struct range range;
+		bool resource_remove;
 		int rc;
 
 		rc = dax_kmem_range(dev_dax, i, &range);
 		if (rc)
 			continue;
 
-		rc = remove_memory(range.start, range_len(&range));
-		if (rc == 0) {
+		resource_remove = true;
+		cur_start = range.start;
+		cur_len = memory_block_size_bytes();
+		remaining = range_len(&range);
+		while (remaining) {
+
+			rc = remove_memory(cur_start, cur_len);
+			if (rc) {
+				resource_remove = false;
+				dev_err(dev,
+					"mapping%d: %#llx-%#llx cannot be hotremoved until the next reboot\n",
+					i, cur_start, cur_len);
+			}
+			cur_start += cur_len;
+			remaining -= cur_len;
+		}
+		if (resource_remove) {
 			remove_resource(data->res[i]);
 			kfree(data->res[i]);
 			data->res[i] = NULL;
 			success++;
-			continue;
-		}
-		any_hotremove_failed = true;
-		dev_err(dev,
-			"mapping%d: %#llx-%#llx cannot be hotremoved until the next reboot\n",
-				i, range.start, range.end);
+		} else
+			any_hotremove_failed = true;
 	}
 
 	if (success >= dev_dax->nr_range) {
-- 
2.41.0

