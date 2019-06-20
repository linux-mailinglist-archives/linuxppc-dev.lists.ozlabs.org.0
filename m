Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D764CA9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 11:21:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TxC31tHBzDrCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 19:21:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tx6Q3FK1zDr5l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 19:17:18 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5K9692V122435; Thu, 20 Jun 2019 05:17:13 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t871xrs45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2019 05:17:13 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5K94k2x024184;
 Thu, 20 Jun 2019 09:17:12 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 2t75r12xet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2019 09:17:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5K9HBam33227140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2019 09:17:11 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9925AAE060;
 Thu, 20 Jun 2019 09:17:11 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18769AE05C;
 Thu, 20 Jun 2019 09:17:10 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.143])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 20 Jun 2019 09:17:09 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com
Subject: [PATCH v4 1/6] nvdimm: Consider probe return -EOPNOTSUPP as success
Date: Thu, 20 Jun 2019 14:46:21 +0530
Message-Id: <20190620091626.31824-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620091626.31824-1-aneesh.kumar@linux.ibm.com>
References: <20190620091626.31824-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200068
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

This patch add -EOPNOTSUPP as return from probe callback to
indicate we were not able to initialize a namespace due to pfn superblock
feature/version mismatch. We want to consider this a probe success so that
we can create new namesapce seed and there by avoid marking the failed
namespace as the seed namespace.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/nvdimm/bus.c         |  4 ++--
 drivers/nvdimm/nd-core.h     |  3 ++-
 drivers/nvdimm/pmem.c        | 26 ++++++++++++++++++++++----
 drivers/nvdimm/region_devs.c | 19 +++++++++++++++----
 4 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
index 2dca3034fee0..3b8ffb3966ab 100644
--- a/drivers/nvdimm/bus.c
+++ b/drivers/nvdimm/bus.c
@@ -92,8 +92,8 @@ static int nvdimm_bus_probe(struct device *dev)
 
 	nvdimm_bus_probe_start(nvdimm_bus);
 	rc = nd_drv->probe(dev);
-	if (rc == 0)
-		nd_region_probe_success(nvdimm_bus, dev);
+	if (rc == 0 || rc == -EOPNOTSUPP)
+		nd_region_probe_success(nvdimm_bus, dev, rc);
 	else
 		nd_region_disable(nvdimm_bus, dev);
 	nvdimm_bus_probe_end(nvdimm_bus);
diff --git a/drivers/nvdimm/nd-core.h b/drivers/nvdimm/nd-core.h
index 391e88de3a29..4e6ffa0d89bb 100644
--- a/drivers/nvdimm/nd-core.h
+++ b/drivers/nvdimm/nd-core.h
@@ -126,7 +126,8 @@ int __init nvdimm_bus_init(void);
 void nvdimm_bus_exit(void);
 void nvdimm_devs_exit(void);
 void nd_region_devs_exit(void);
-void nd_region_probe_success(struct nvdimm_bus *nvdimm_bus, struct device *dev);
+void nd_region_probe_success(struct nvdimm_bus *nvdimm_bus,
+			     struct device *dev, int ret);
 struct nd_region;
 void nd_region_create_ns_seed(struct nd_region *nd_region);
 void nd_region_create_btt_seed(struct nd_region *nd_region);
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 24d7fe7c74ed..422b11c01301 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -497,6 +497,7 @@ static int pmem_attach_disk(struct device *dev,
 
 static int nd_pmem_probe(struct device *dev)
 {
+	int ret;
 	struct nd_namespace_common *ndns;
 
 	ndns = nvdimm_namespace_common_probe(dev);
@@ -512,12 +513,29 @@ static int nd_pmem_probe(struct device *dev)
 	if (is_nd_pfn(dev))
 		return pmem_attach_disk(dev, ndns);
 
-	/* if we find a valid info-block we'll come back as that personality */
-	if (nd_btt_probe(dev, ndns) == 0 || nd_pfn_probe(dev, ndns) == 0
-			|| nd_dax_probe(dev, ndns) == 0)
+	ret = nd_btt_probe(dev, ndns);
+	if (ret == 0)
 		return -ENXIO;
+	else if (ret == -EOPNOTSUPP)
+		return ret;
 
-	/* ...otherwise we're just a raw pmem device */
+	ret = nd_pfn_probe(dev, ndns);
+	if (ret == 0)
+		return -ENXIO;
+	else if (ret == -EOPNOTSUPP)
+		return ret;
+
+	ret = nd_dax_probe(dev, ndns);
+	if (ret == 0)
+		return -ENXIO;
+	else if (ret == -EOPNOTSUPP)
+		return ret;
+	/*
+	 * We have two failure conditions here, there is no
+	 * info reserver block or we found a valid info reserve block
+	 * but failed to initialize the pfn superblock.
+	 * Don't create a raw pmem disk for the second case.
+	 */
 	return pmem_attach_disk(dev, ndns);
 }
 
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index 4fed9ce9c2fe..1e74a1c9fdac 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -715,7 +715,7 @@ void nd_mapping_free_labels(struct nd_mapping *nd_mapping)
  * disable the region.
  */
 static void nd_region_notify_driver_action(struct nvdimm_bus *nvdimm_bus,
-		struct device *dev, bool probe)
+					   struct device *dev, bool probe, int ret)
 {
 	struct nd_region *nd_region;
 
@@ -745,6 +745,16 @@ static void nd_region_notify_driver_action(struct nvdimm_bus *nvdimm_bus,
 			nd_region_create_ns_seed(nd_region);
 		nvdimm_bus_unlock(dev);
 	}
+
+	if (dev->parent && is_nd_region(dev->parent) &&
+	    !probe && (ret == -EOPNOTSUPP)) {
+		nd_region = to_nd_region(dev->parent);
+		nvdimm_bus_lock(dev);
+		if (nd_region->ns_seed == dev)
+			nd_region_create_ns_seed(nd_region);
+		nvdimm_bus_unlock(dev);
+	}
+
 	if (is_nd_btt(dev) && probe) {
 		struct nd_btt *nd_btt = to_nd_btt(dev);
 
@@ -780,14 +790,15 @@ static void nd_region_notify_driver_action(struct nvdimm_bus *nvdimm_bus,
 	}
 }
 
-void nd_region_probe_success(struct nvdimm_bus *nvdimm_bus, struct device *dev)
+void nd_region_probe_success(struct nvdimm_bus *nvdimm_bus,
+			     struct device *dev, int ret)
 {
-	nd_region_notify_driver_action(nvdimm_bus, dev, true);
+	nd_region_notify_driver_action(nvdimm_bus, dev, true, ret);
 }
 
 void nd_region_disable(struct nvdimm_bus *nvdimm_bus, struct device *dev)
 {
-	nd_region_notify_driver_action(nvdimm_bus, dev, false);
+	nd_region_notify_driver_action(nvdimm_bus, dev, false, 0);
 }
 
 static ssize_t mappingN(struct device *dev, char *buf, int n)
-- 
2.21.0

