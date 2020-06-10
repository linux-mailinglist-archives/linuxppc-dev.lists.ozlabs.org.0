Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2D1F4E4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 08:36:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hchk1xfpzDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 16:36:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hcQr6MQqzDqWs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 16:24:36 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A62Eto015796; Wed, 10 Jun 2020 02:24:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31jjx0uh38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 02:24:29 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05A63kZL020503;
 Wed, 10 Jun 2020 02:24:28 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31jjx0uh32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 02:24:28 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A6K4lT003174;
 Wed, 10 Jun 2020 06:24:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 31hdb3m5dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 06:24:28 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A6ORcm46072124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 06:24:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 817C1AC060;
 Wed, 10 Jun 2020 06:24:27 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72A5FAC05B;
 Wed, 10 Jun 2020 06:24:24 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.58.158])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 06:24:24 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
Subject: [PATCH v5 08/10] libnvdimm/dax: Add a dax flag to control synchronous
 fault support
Date: Wed, 10 Jun 2020 11:53:41 +0530
Message-Id: <20200610062343.492293-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610062343.492293-1-aneesh.kumar@linux.ibm.com>
References: <20200610062343.492293-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_02:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 cotscore=-2147483648 suspectscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100041
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

With POWER10, architecture is adding new pmem flush and sync instructions.
The kernel should prevent the usage of MAP_SYNC if applications are not using
the new instructions on newer hardware

This patch adds a dax attribute (/sys/bus/nd/devices/region0/pfn0.1/block/pmem0/dax/sync_fault)
which can be used to control this flag. If the device supports synchronous flush
then userspace can update this attribute to enable/disable the synchronous
fault. The attribute is only visible if there is write cache enabled on the device.

In a followup patch on ppc64 device with compat string "ibm,pmemory-v2"
will disable the sync fault feature.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/dax/bus.c            |  2 +-
 drivers/dax/super.c          | 73 ++++++++++++++++++++++++++++++++++++
 drivers/nvdimm/pmem.c        |  4 ++
 drivers/nvdimm/region_devs.c | 16 ++++++++
 include/linux/dax.h          | 16 ++++++++
 include/linux/libnvdimm.h    |  4 ++
 mm/Kconfig                   |  3 ++
 7 files changed, 117 insertions(+), 1 deletion(-)

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
index 8e32345be0f7..f93e6649d452 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -198,6 +198,12 @@ enum dax_device_flags {
 	DAXDEV_WRITE_CACHE,
 	/* flag to check if device supports synchronous flush */
 	DAXDEV_SYNC,
+	/*
+	 * flag to indicate whether synchronous flush is enabled.
+	 * Some platform may want to disable synchronous flush support
+	 * even though device supports the same.
+	 */
+	DAXDEV_SYNC_ENABLED,
 };
 
 /**
@@ -254,6 +260,63 @@ static ssize_t write_cache_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(write_cache);
 
+bool __dax_synchronous_enabled(struct dax_device *dax_dev)
+{
+	return test_bit(DAXDEV_SYNC_ENABLED, &dax_dev->flags);
+}
+EXPORT_SYMBOL_GPL(__dax_synchronous_enabled);
+
+static void set_dax_synchronous_enable(struct dax_device *dax_dev, bool enable)
+{
+	if (!test_bit(DAXDEV_SYNC, &dax_dev->flags))
+		return;
+
+	if (enable)
+		set_bit(DAXDEV_SYNC_ENABLED, &dax_dev->flags);
+	else
+		clear_bit(DAXDEV_SYNC_ENABLED, &dax_dev->flags);
+}
+
+
+static ssize_t sync_fault_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	int enabled;
+	struct dax_device *dax_dev = dax_get_by_host(dev_name(dev));
+	ssize_t rc;
+
+	WARN_ON_ONCE(!dax_dev);
+	if (!dax_dev)
+		return -ENXIO;
+
+	enabled = (dax_synchronous(dax_dev) && dax_synchronous_enabled(dax_dev));
+	rc = sprintf(buf, "%d\n", enabled);
+	put_dax(dax_dev);
+	return rc;
+}
+
+static ssize_t sync_fault_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t len)
+{
+	bool enable_sync;
+	int rc = strtobool(buf, &enable_sync);
+	struct dax_device *dax_dev = dax_get_by_host(dev_name(dev));
+
+	WARN_ON_ONCE(!dax_dev);
+	if (!dax_dev)
+		return -ENXIO;
+
+	if (rc)
+		len = rc;
+	else
+		set_dax_synchronous_enable(dax_dev, enable_sync);
+
+	put_dax(dax_dev);
+	return len;
+}
+
+static DEVICE_ATTR_RW(sync_fault);
+
 static umode_t dax_visible(struct kobject *kobj, struct attribute *a, int n)
 {
 	struct device *dev = container_of(kobj, typeof(*dev), kobj);
@@ -267,11 +330,18 @@ static umode_t dax_visible(struct kobject *kobj, struct attribute *a, int n)
 	if (a == &dev_attr_write_cache.attr)
 		return 0;
 #endif
+	if (a == &dev_attr_sync_fault.attr) {
+		if (dax_write_cache_enabled(dax_dev))
+			return a->mode;
+		return 0;
+	}
+
 	return a->mode;
 }
 
 static struct attribute *dax_attributes[] = {
 	&dev_attr_write_cache.attr,
+	&dev_attr_sync_fault.attr,
 	NULL,
 };
 
@@ -594,6 +664,9 @@ struct dax_device *alloc_dax(void *private, const char *__host,
 	if (flags & DAXDEV_F_SYNC)
 		set_dax_synchronous(dax_dev);
 
+	if (flags & DAXDEV_F_SYNC_ENABLED)
+		set_dax_synchronous_enable(dax_dev, true);
+
 	return dax_dev;
 
  err_dev:
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 97f948f8f4e6..a738b237a3ff 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -487,6 +487,10 @@ static int pmem_attach_disk(struct device *dev,
 
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
index 88ea34a9c7fd..d60d159b812b 100644
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
index 66f6c65bd789..53d4d4b8b6b9 100644
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
diff --git a/mm/Kconfig b/mm/Kconfig
index cffc276fa19c..aebe7e9c079d 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -868,4 +868,7 @@ config ARCH_HAS_HUGEPD
 config MAPPING_DIRTY_HELPERS
         bool
 
+config ARCH_MAP_SYNC_DISABLE
+	bool
+
 endmenu
-- 
2.26.2

