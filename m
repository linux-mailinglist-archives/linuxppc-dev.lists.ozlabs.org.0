Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BF31EB6CE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 09:53:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bkmm2W9dzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 17:53:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bkhf1QmHzDqQn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 17:49:38 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0527WBC0091477; Tue, 2 Jun 2020 03:49:32 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dfmkn6gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 03:49:32 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0527WnqQ094790;
 Tue, 2 Jun 2020 03:49:32 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dfmkn6g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 03:49:31 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0527iZfJ005202;
 Tue, 2 Jun 2020 07:49:30 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 31bf48gwng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 07:49:30 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0527nTJe51446128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jun 2020 07:49:29 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39441C6055;
 Tue,  2 Jun 2020 07:49:29 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FDC3C605D;
 Tue,  2 Jun 2020 07:49:23 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.34.130])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jun 2020 07:49:22 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
Subject: [RFC PATCH v2 3/5] libnvdimm/dax: Make DAXDEV_SYNC_ENABLED flag
 region-specific
Date: Tue,  2 Jun 2020 13:19:07 +0530
Message-Id: <20200602074909.36738-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602074909.36738-1-aneesh.kumar@linux.ibm.com>
References: <20200602074909.36738-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_08:2020-06-01,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=797
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 cotscore=-2147483648 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020043
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
Cc: Jan Kara <jack@suse.cz>, Jeff Moyer <jmoyer@redhat.com>, msuchanek@suse.de,
 oohall@gmail.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch makes sync fault enable/disable feature more fine-grained
by allowing region-wise control of the same.

In a followup patch on ppc64 only device with compat string "ibm,pmemory-v2"
will disable the sync fault feature.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/dax/bus.c            |  2 +-
 drivers/dax/super.c          | 16 +++++++++-------
 drivers/nvdimm/pmem.c        |  4 ++++
 drivers/nvdimm/region_devs.c | 16 ++++++++++++++++
 include/linux/dax.h          | 16 ++++++++++++++++
 include/linux/libnvdimm.h    |  4 ++++
 6 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index df238c8b6ef2..8a825ecff49b 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -420,7 +420,7 @@ struct dev_dax *__devm_create_dev_dax(struct dax_region *dax_region, int id,
 	 * No 'host' or dax_operations since there is no access to this
 	 * device outside of mmap of the resulting character device.
 	 */
-	dax_dev = alloc_dax(dev_dax, NULL, NULL, DAXDEV_F_SYNC);
+	dax_dev = alloc_dax(dev_dax, NULL, NULL, DAXDEV_F_SYNC | DAXDEV_F_SYNC_ENABLED);
 	if (IS_ERR(dax_dev)) {
 		rc = PTR_ERR(dax_dev);
 		goto err;
diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 980f7be7e56d..f93e6649d452 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -260,10 +260,11 @@ static ssize_t write_cache_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(write_cache);
 
-static bool dax_synchronous_enabled(struct dax_device *dax_dev)
+bool __dax_synchronous_enabled(struct dax_device *dax_dev)
 {
 	return test_bit(DAXDEV_SYNC_ENABLED, &dax_dev->flags);
 }
+EXPORT_SYMBOL_GPL(__dax_synchronous_enabled);
 
 static void set_dax_synchronous_enable(struct dax_device *dax_dev, bool enable)
 {
@@ -280,6 +281,7 @@ static void set_dax_synchronous_enable(struct dax_device *dax_dev, bool enable)
 static ssize_t sync_fault_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
+	int enabled;
 	struct dax_device *dax_dev = dax_get_by_host(dev_name(dev));
 	ssize_t rc;
 
@@ -287,7 +289,8 @@ static ssize_t sync_fault_show(struct device *dev,
 	if (!dax_dev)
 		return -ENXIO;
 
-	rc = sprintf(buf, "%d\n", !!__dax_synchronous(dax_dev));
+	enabled = (dax_synchronous(dax_dev) && dax_synchronous_enabled(dax_dev));
+	rc = sprintf(buf, "%d\n", enabled);
 	put_dax(dax_dev);
 	return rc;
 }
@@ -461,17 +464,13 @@ EXPORT_SYMBOL_GPL(dax_write_cache_enabled);
 
 bool __dax_synchronous(struct dax_device *dax_dev)
 {
-	return test_bit(DAXDEV_SYNC, &dax_dev->flags) &&
-		test_bit(DAXDEV_SYNC_ENABLED, &dax_dev->flags);
+	return test_bit(DAXDEV_SYNC, &dax_dev->flags);
 }
 EXPORT_SYMBOL_GPL(__dax_synchronous);
 
 void __set_dax_synchronous(struct dax_device *dax_dev)
 {
 	set_bit(DAXDEV_SYNC, &dax_dev->flags);
-#ifndef CONFIG_ARCH_MAP_SYNC_DISABLE
-	set_bit(DAXDEV_SYNC_ENABLED, &dax_dev->flags);
-#endif
 }
 EXPORT_SYMBOL_GPL(__set_dax_synchronous);
 
@@ -665,6 +664,9 @@ struct dax_device *alloc_dax(void *private, const char *__host,
 	if (flags & DAXDEV_F_SYNC)
 		set_dax_synchronous(dax_dev);
 
+	if (flags & DAXDEV_F_SYNC_ENABLED)
+		set_dax_synchronous_enable(dax_dev, true);
+
 	return dax_dev;
 
  err_dev:
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 2df6994acf83..dc9c269eb50d 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -485,6 +485,10 @@ static int pmem_attach_disk(struct device *dev,
 
 	if (is_nvdimm_sync(nd_region))
 		flags = DAXDEV_F_SYNC;
+
+	if (is_nvdimm_sync_enabled(nd_region))
+		flags |= DAXDEV_F_SYNC_ENABLED;
+
 	dax_dev = alloc_dax(pmem, disk->disk_name, &pmem_dax_ops, flags);
 	if (IS_ERR(dax_dev)) {
 		put_disk(disk);
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index ccbb5b43b8b2..2181560cf655 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -1283,6 +1283,22 @@ bool is_nvdimm_sync(struct nd_region *nd_region)
 }
 EXPORT_SYMBOL_GPL(is_nvdimm_sync);
 
+bool is_nvdimm_sync_enabled(struct nd_region *nd_region)
+{
+#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
+	if (is_nd_volatile(&nd_region->dev))
+		return true;
+
+	return is_nd_pmem(&nd_region->dev) &&
+		test_bit(ND_REGION_SYNC_ENABLED, &nd_region->flags);
+#else
+	return true;
+#endif
+
+}
+EXPORT_SYMBOL_GPL(is_nvdimm_sync_enabled);
+
+
 struct conflict_context {
 	struct nd_region *nd_region;
 	resource_size_t start, size;
diff --git a/include/linux/dax.h b/include/linux/dax.h
index d7af5d243f24..c4a3551557de 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -10,6 +10,9 @@
 /* Flag for synchronous flush */
 #define DAXDEV_F_SYNC (1UL << 0)
 
+/* flag for platform forcing synchronous flush disable */
+#define DAXDEV_F_SYNC_ENABLED (1UL << 1)
+
 typedef unsigned long dax_entry_t;
 
 struct iomap_ops;
@@ -59,6 +62,13 @@ static inline void set_dax_synchronous(struct dax_device *dax_dev)
 {
 	__set_dax_synchronous(dax_dev);
 }
+
+bool __dax_synchronous_enabled(struct dax_device *dax_dev);
+static inline bool dax_synchronous_enabled(struct dax_device *dax_dev)
+{
+	return  __dax_synchronous_enabled(dax_dev);
+}
+
 /*
  * Check if given mapping is supported by the file / underlying device.
  */
@@ -69,6 +79,12 @@ static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
 		return true;
 	if (!IS_DAX(file_inode(vma->vm_file)))
 		return false;
+	/*
+	 * check MAP_SYNC is disabled by platform for this device.
+	 */
+	if (!dax_synchronous_enabled(dax_dev))
+		return false;
+
 	return dax_synchronous(dax_dev);
 }
 #else
diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
index 18da4059be09..cc3962c4978f 100644
--- a/include/linux/libnvdimm.h
+++ b/include/linux/libnvdimm.h
@@ -63,6 +63,9 @@ enum {
 	/* Platform provides asynchronous flush mechanism */
 	ND_REGION_ASYNC = 3,
 
+	/* Platform wants to disable synchronous flush mechanism */
+	ND_REGION_SYNC_ENABLED= 4,
+
 	/* mark newly adjusted resources as requiring a label update */
 	DPA_RESOURCE_ADJUSTED = 1 << 0,
 };
@@ -262,6 +265,7 @@ int nvdimm_has_flush(struct nd_region *nd_region);
 int nvdimm_has_cache(struct nd_region *nd_region);
 int nvdimm_in_overwrite(struct nvdimm *nvdimm);
 bool is_nvdimm_sync(struct nd_region *nd_region);
+bool is_nvdimm_sync_enabled(struct nd_region *nd_region);
 
 static inline int nvdimm_ctl(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 		unsigned int buf_len, int *cmd_rc)
-- 
2.26.2

