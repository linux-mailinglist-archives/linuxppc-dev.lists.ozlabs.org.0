Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC512197690
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 10:36:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rQlz6RwpzDqhY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 19:36:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rQjz3KrPzDqNB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 19:34:30 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02U8XkaY057586
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 04:34:28 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022f22xg6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 04:34:28 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Mon, 30 Mar 2020 09:34:13 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 09:34:11 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02U8XJRP46596430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 08:33:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E4A0AE051;
 Mon, 30 Mar 2020 08:34:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BA33AE04D;
 Mon, 30 Mar 2020 08:34:22 +0000 (GMT)
Received: from pic2.home (unknown [9.145.35.133])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 08:34:22 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, clombard@linux.ibm.com, ajd@linux.ibm.com, 
 alastair@au1.ibm.com
Subject: [PATCH v4] ocxl: control via sysfs whether the FPGA is reloaded on a
 link reset
Date: Mon, 30 Mar 2020 10:34:22 +0200
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20033008-0020-0000-0000-000003BE1F50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033008-0021-0000-0000-00002216B9B2
Message-Id: <20200330083422.34230-1-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=2 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300076
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
Cc: felix@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Philippe Bergheaud <felix@linux.ibm.com>

Some opencapi FPGA images allow to control if the FPGA should be reloaded
on the next adapter reset. If it is supported, the image specifies it
through a Vendor Specific DVSEC in the config space of function 0.

Signed-off-by: Philippe Bergheaud <felix@linux.ibm.com>
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---

Changelog:
v2:
  - refine ResetReload debug message
  - do not call get_function_0() if pci_dev is for function 0
v3:
  - avoid get_function_0() in ocxl_config_set_reset_reload also
v4:
  - simplify parsing of Vendor Specific DVSEC during AFU init
  - only set/unset bit 0 of the config space register
  - commonize code to fetch the right PCI function and DVSEC offset
  - use kstrtoint() when parsing the sysfs buffer


 Documentation/ABI/testing/sysfs-class-ocxl | 10 +++
 drivers/misc/ocxl/config.c                 | 81 ++++++++++++++++++++--
 drivers/misc/ocxl/ocxl_internal.h          |  6 ++
 drivers/misc/ocxl/sysfs.c                  | 35 ++++++++++
 include/misc/ocxl-config.h                 |  1 +
 5 files changed, 128 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-ocxl b/Documentation/ABI/testing/sysfs-class-ocxl
index b5b1fa197592..b9ea671d5805 100644
--- a/Documentation/ABI/testing/sysfs-class-ocxl
+++ b/Documentation/ABI/testing/sysfs-class-ocxl
@@ -33,3 +33,13 @@ Date:		January 2018
 Contact:	linuxppc-dev@lists.ozlabs.org
 Description:	read/write
 		Give access the global mmio area for the AFU
+
+What:		/sys/class/ocxl/<afu name>/reload_on_reset
+Date:		February 2020
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read/write
+		Control whether the FPGA is reloaded on a link reset
+			0	Do not reload FPGA image from flash
+			1	Reload FPGA image from flash
+			unavailable
+				The device does not support this capability
diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index c8e19bfb5ef9..42f7a1298775 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -71,6 +71,20 @@ static int find_dvsec_afu_ctrl(struct pci_dev *dev, u8 afu_idx)
 	return 0;
 }
 
+/**
+ * get_function_0() - Find a related PCI device (function 0)
+ * @device: PCI device to match
+ *
+ * Returns a pointer to the related device, or null if not found
+ */
+static struct pci_dev *get_function_0(struct pci_dev *dev)
+{
+	unsigned int devfn = PCI_DEVFN(PCI_SLOT(dev->devfn), 0);
+
+	return pci_get_domain_bus_and_slot(pci_domain_nr(dev->bus),
+					   dev->bus->number, devfn);
+}
+
 static void read_pasid(struct pci_dev *dev, struct ocxl_fn_config *fn)
 {
 	u16 val;
@@ -159,14 +173,15 @@ static int read_dvsec_afu_info(struct pci_dev *dev, struct ocxl_fn_config *fn)
 static int read_dvsec_vendor(struct pci_dev *dev)
 {
 	int pos;
-	u32 cfg, tlx, dlx;
+	u32 cfg, tlx, dlx, reset_reload;
 
 	/*
-	 * vendor specific DVSEC is optional
+	 * vendor specific DVSEC, for IBM images only. Some older
+	 * images may not have it
 	 *
-	 * It's currently only used on function 0 to specify the
-	 * version of some logic blocks. Some older images may not
-	 * even have it so we ignore any errors
+	 * It's only used on function 0 to specify the version of some
+	 * logic blocks and to give access to special registers to
+	 * enable host-based flashing.
 	 */
 	if (PCI_FUNC(dev->devfn) != 0)
 		return 0;
@@ -178,11 +193,67 @@ static int read_dvsec_vendor(struct pci_dev *dev)
 	pci_read_config_dword(dev, pos + OCXL_DVSEC_VENDOR_CFG_VERS, &cfg);
 	pci_read_config_dword(dev, pos + OCXL_DVSEC_VENDOR_TLX_VERS, &tlx);
 	pci_read_config_dword(dev, pos + OCXL_DVSEC_VENDOR_DLX_VERS, &dlx);
+	pci_read_config_dword(dev, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
+			      &reset_reload);
 
 	dev_dbg(&dev->dev, "Vendor specific DVSEC:\n");
 	dev_dbg(&dev->dev, "  CFG version = 0x%x\n", cfg);
 	dev_dbg(&dev->dev, "  TLX version = 0x%x\n", tlx);
 	dev_dbg(&dev->dev, "  DLX version = 0x%x\n", dlx);
+	dev_dbg(&dev->dev, "  ResetReload = 0x%x\n", reset_reload);
+	return 0;
+}
+
+static int get_dvsec_vendor0(struct pci_dev *dev, struct pci_dev **dev0,
+			     int *out_pos)
+{
+	int pos;
+
+	if (PCI_FUNC(dev->devfn) != 0) {
+		dev = get_function_0(dev);
+		if (!dev)
+			return -1;
+	}
+	pos = find_dvsec(dev, OCXL_DVSEC_VENDOR_ID);
+	if (!pos)
+		return -1;
+	*dev0 = dev;
+	*out_pos = pos;
+	return 0;
+}
+
+int ocxl_config_get_reset_reload(struct pci_dev *dev, int *val)
+{
+	struct pci_dev *dev0;
+	u32 reset_reload;
+	int pos;
+
+	if (get_dvsec_vendor0(dev, &dev0, &pos))
+		return -1;
+
+	pci_read_config_dword(dev0, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
+			      &reset_reload);
+	*val = !!(reset_reload & BIT(0));
+	return 0;
+}
+
+int ocxl_config_set_reset_reload(struct pci_dev *dev, int val)
+{
+	struct pci_dev *dev0;
+	u32 reset_reload;
+	int pos;
+
+	if (get_dvsec_vendor0(dev, &dev0, &pos))
+		return -1;
+
+	pci_read_config_dword(dev0, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
+			      &reset_reload);
+	if (val)
+		reset_reload |= BIT(0);
+	else
+		reset_reload &= ~BIT(0);
+	pci_write_config_dword(dev0, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
+			       reset_reload);
 	return 0;
 }
 
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index 345bf843a38e..af9a84aeee6f 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -112,6 +112,12 @@ void ocxl_actag_afu_free(struct ocxl_fn *fn, u32 start, u32 size);
  */
 int ocxl_config_get_pasid_info(struct pci_dev *dev, int *count);
 
+/*
+ * Control whether the FPGA is reloaded on a link reset
+ */
+int ocxl_config_get_reset_reload(struct pci_dev *dev, int *val);
+int ocxl_config_set_reset_reload(struct pci_dev *dev, int val);
+
 /*
  * Check if an AFU index is valid for the given function.
  *
diff --git a/drivers/misc/ocxl/sysfs.c b/drivers/misc/ocxl/sysfs.c
index 58f1ba264206..25c78df8055d 100644
--- a/drivers/misc/ocxl/sysfs.c
+++ b/drivers/misc/ocxl/sysfs.c
@@ -51,11 +51,46 @@ static ssize_t contexts_show(struct device *device,
 			afu->pasid_count, afu->pasid_max);
 }
 
+static ssize_t reload_on_reset_show(struct device *device,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct ocxl_afu *afu = to_afu(device);
+	struct ocxl_fn *fn = afu->fn;
+	struct pci_dev *pci_dev = to_pci_dev(fn->dev.parent);
+	int val;
+
+	if (ocxl_config_get_reset_reload(pci_dev, &val))
+		return scnprintf(buf, PAGE_SIZE, "unavailable\n");
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+}
+
+static ssize_t reload_on_reset_store(struct device *device,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct ocxl_afu *afu = to_afu(device);
+	struct ocxl_fn *fn = afu->fn;
+	struct pci_dev *pci_dev = to_pci_dev(fn->dev.parent);
+	int rc, val;
+
+	rc = kstrtoint(buf, 0, &val);
+	if (rc || (val != 0 && val != 1))
+		return -EINVAL;
+
+	if (ocxl_config_set_reset_reload(pci_dev, val))
+		return -ENODEV;
+
+	return count;
+}
+
 static struct device_attribute afu_attrs[] = {
 	__ATTR_RO(global_mmio_size),
 	__ATTR_RO(pp_mmio_size),
 	__ATTR_RO(afu_version),
 	__ATTR_RO(contexts),
+	__ATTR_RW(reload_on_reset),
 };
 
 static ssize_t global_mmio_read(struct file *filp, struct kobject *kobj,
diff --git a/include/misc/ocxl-config.h b/include/misc/ocxl-config.h
index 3526fa996a22..ccfd3b463517 100644
--- a/include/misc/ocxl-config.h
+++ b/include/misc/ocxl-config.h
@@ -41,5 +41,6 @@
 #define   OCXL_DVSEC_VENDOR_CFG_VERS            0x0C
 #define   OCXL_DVSEC_VENDOR_TLX_VERS            0x10
 #define   OCXL_DVSEC_VENDOR_DLX_VERS            0x20
+#define   OCXL_DVSEC_VENDOR_RESET_RELOAD        0x38
 
 #endif /* _OCXL_CONFIG_H_ */
-- 
2.25.1

