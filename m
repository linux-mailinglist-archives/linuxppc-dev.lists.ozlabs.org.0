Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DBB8737C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 09:52:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464csw0NF8zDqT9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 17:52:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464cjl7271zDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 17:45:47 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x797haf3104333; Fri, 9 Aug 2019 03:45:44 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u91bbq0x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2019 03:45:44 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x797hcSb015938;
 Fri, 9 Aug 2019 07:45:42 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 2u51w73bur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2019 07:45:42 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x797jfIQ33292756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Aug 2019 07:45:41 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EA106A051;
 Fri,  9 Aug 2019 07:45:41 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30E5C6A047;
 Fri,  9 Aug 2019 07:45:39 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.36.73])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  9 Aug 2019 07:45:38 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com
Subject: [PATCH v5 3/4] mm/nvdimm: Use correct #defines instead of open coding
Date: Fri,  9 Aug 2019 13:15:19 +0530
Message-Id: <20190809074520.27115-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190809074520.27115-1-aneesh.kumar@linux.ibm.com>
References: <20190809074520.27115-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908090080
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use PAGE_SIZE instead of SZ_4K and sizeof(struct page) instead of 64.
If we have a kernel built with different struct page size the previous
patch should handle marking the namespace disabled.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/nvdimm/label.c          | 2 +-
 drivers/nvdimm/namespace_devs.c | 6 +++---
 drivers/nvdimm/pfn_devs.c       | 3 ++-
 drivers/nvdimm/region_devs.c    | 8 ++++----
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/nvdimm/label.c b/drivers/nvdimm/label.c
index 73e197babc2f..7ee037063be7 100644
--- a/drivers/nvdimm/label.c
+++ b/drivers/nvdimm/label.c
@@ -355,7 +355,7 @@ static bool slot_valid(struct nvdimm_drvdata *ndd,
 
 	/* check that DPA allocations are page aligned */
 	if ((__le64_to_cpu(nd_label->dpa)
-				| __le64_to_cpu(nd_label->rawsize)) % SZ_4K)
+				| __le64_to_cpu(nd_label->rawsize)) % PAGE_SIZE)
 		return false;
 
 	/* check checksum */
diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index a16e52251a30..a9c76df12cb9 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -1006,10 +1006,10 @@ static ssize_t __size_store(struct device *dev, unsigned long long val)
 		return -ENXIO;
 	}
 
-	div_u64_rem(val, SZ_4K * nd_region->ndr_mappings, &remainder);
+	div_u64_rem(val, PAGE_SIZE * nd_region->ndr_mappings, &remainder);
 	if (remainder) {
-		dev_dbg(dev, "%llu is not %dK aligned\n", val,
-				(SZ_4K * nd_region->ndr_mappings) / SZ_1K);
+		dev_dbg(dev, "%llu is not %ldK aligned\n", val,
+				(PAGE_SIZE * nd_region->ndr_mappings) / SZ_1K);
 		return -EINVAL;
 	}
 
diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
index 37e96811c2fc..c1d9be609322 100644
--- a/drivers/nvdimm/pfn_devs.c
+++ b/drivers/nvdimm/pfn_devs.c
@@ -725,7 +725,8 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
 		 * when populating the vmemmap. This *should* be equal to
 		 * PMD_SIZE for most architectures.
 		 */
-		offset = ALIGN(start + SZ_8K + 64 * npfns, align) - start;
+		offset = ALIGN(start + SZ_8K + sizeof(struct page) * npfns,
+			       align) - start;
 	} else if (nd_pfn->mode == PFN_MODE_RAM)
 		offset = ALIGN(start + SZ_8K, align) - start;
 	else
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index af30cbe7a8ea..20e265a534f8 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -992,10 +992,10 @@ static struct nd_region *nd_region_create(struct nvdimm_bus *nvdimm_bus,
 		struct nd_mapping_desc *mapping = &ndr_desc->mapping[i];
 		struct nvdimm *nvdimm = mapping->nvdimm;
 
-		if ((mapping->start | mapping->size) % SZ_4K) {
-			dev_err(&nvdimm_bus->dev, "%s: %s mapping%d is not 4K aligned\n",
-					caller, dev_name(&nvdimm->dev), i);
-
+		if ((mapping->start | mapping->size) % PAGE_SIZE) {
+			dev_err(&nvdimm_bus->dev,
+				"%s: %s mapping%d is not %ld aligned\n",
+				caller, dev_name(&nvdimm->dev), i, PAGE_SIZE);
 			return NULL;
 		}
 
-- 
2.21.0

