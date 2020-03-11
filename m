Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 158E31818EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 13:59:29 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48csVM3LGBzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 23:59:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=felix@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48csLX31ntzDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 23:52:33 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BBpbMH102625
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:53:09 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ypxwfaa7x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:53:02 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <felix@linux.ibm.com>;
 Wed, 11 Mar 2020 11:52:55 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Mar 2020 11:52:53 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02BBpqqf44695860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 11:51:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E91252050;
 Wed, 11 Mar 2020 11:52:52 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id ECB425204E;
 Wed, 11 Mar 2020 11:52:51 +0000 (GMT)
Received: from w541.tlslab.ibm.com (t42p.tlslab.ibm.com [9.101.4.37])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id ABC1A2201CF;
 Wed, 11 Mar 2020 12:52:51 +0100 (CET)
From: Philippe Bergheaud <felix@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] ocxl: control via sysfs whether the FPGA is reloaded on a
 link reset
Date: Wed, 11 Mar 2020 12:52:16 +0100
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20031111-0016-0000-0000-000002EF60FB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031111-0017-0000-0000-00003352C9EA
Message-Id: <20200311115216.532-1-felix@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_05:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=3 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=922
 clxscore=1011 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110077
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
Cc: fbarrat@linux.ibm.com, clombard@linux.ibm.com,
 Philippe Bergheaud <felix@linux.ibm.com>, ajd@linux.ibm.com,
 alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some opencapi FPGA images allow to control if the FPGA should be reloaded
on the next adapter reset. If it is supported, the image specifies it
through a Vendor Specific DVSEC in the config space of function 0.

This patch adds an interface to sysfs to control that behavior, if possib=
le.

Signed-off-by: Philippe Bergheaud <felix@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-class-ocxl | 10 ++++
 drivers/misc/ocxl/config.c                 | 59 +++++++++++++++++++++-
 drivers/misc/ocxl/ocxl_internal.h          |  6 +++
 drivers/misc/ocxl/sysfs.c                  | 35 +++++++++++++
 include/misc/ocxl-config.h                 |  1 +
 5 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-ocxl b/Documentation/A=
BI/testing/sysfs-class-ocxl
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
index c8e19bfb5ef9..3488463c1640 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -71,6 +71,20 @@ static int find_dvsec_afu_ctrl(struct pci_dev *dev, u8=
 afu_idx)
 	return 0;
 }
=20
+/**
+ * get_function_0() - Find a related PCI device (function 0)
+ * @device: PCI device to match
+ *
+ * Returns a pointer to the related device, or null if not found
+ */
+static struct pci_dev *get_function_0(struct pci_dev *dev)
+{
+	unsigned int devfn =3D PCI_DEVFN(PCI_SLOT(dev->devfn), 0);
+
+	return pci_get_domain_bus_and_slot(pci_domain_nr(dev->bus),
+					   dev->bus->number, devfn);
+}
+
 static void read_pasid(struct pci_dev *dev, struct ocxl_fn_config *fn)
 {
 	u16 val;
@@ -159,7 +173,7 @@ static int read_dvsec_afu_info(struct pci_dev *dev, s=
truct ocxl_fn_config *fn)
 static int read_dvsec_vendor(struct pci_dev *dev)
 {
 	int pos;
-	u32 cfg, tlx, dlx;
+	u32 cfg, tlx, dlx, reset_reload;
=20
 	/*
 	 * vendor specific DVSEC is optional
@@ -178,11 +192,54 @@ static int read_dvsec_vendor(struct pci_dev *dev)
 	pci_read_config_dword(dev, pos + OCXL_DVSEC_VENDOR_CFG_VERS, &cfg);
 	pci_read_config_dword(dev, pos + OCXL_DVSEC_VENDOR_TLX_VERS, &tlx);
 	pci_read_config_dword(dev, pos + OCXL_DVSEC_VENDOR_DLX_VERS, &dlx);
+	pci_read_config_dword(dev, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD, &reset=
_reload);
=20
 	dev_dbg(&dev->dev, "Vendor specific DVSEC:\n");
 	dev_dbg(&dev->dev, "  CFG version =3D 0x%x\n", cfg);
 	dev_dbg(&dev->dev, "  TLX version =3D 0x%x\n", tlx);
 	dev_dbg(&dev->dev, "  DLX version =3D 0x%x\n", dlx);
+	dev_dbg(&dev->dev, "  ResetReload =3D 0x%x\n", reset_reload);
+	return 0;
+}
+
+int ocxl_config_get_reset_reload(struct pci_dev *dev, int *val)
+{
+	int reset_reload =3D -1;
+	int pos =3D 0;
+	struct pci_dev *dev0 =3D get_function_0(dev);
+
+	if (dev0)
+		pos =3D find_dvsec(dev0, OCXL_DVSEC_VENDOR_ID);
+
+	if (pos)
+		pci_read_config_dword(dev0,
+				      pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
+				      &reset_reload);
+	if (reset_reload =3D=3D -1)
+		return reset_reload;
+
+	*val =3D reset_reload & BIT(0);
+	return 0;
+}
+
+int ocxl_config_set_reset_reload(struct pci_dev *dev, int val)
+{
+	int reset_reload =3D -1;
+	int pos =3D 0;
+	struct pci_dev *dev0 =3D get_function_0(dev);
+
+	if (dev0)
+		pos =3D find_dvsec(dev0, OCXL_DVSEC_VENDOR_ID);
+
+	if (pos)
+		pci_read_config_dword(dev0,
+				      pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
+				      &reset_reload);
+	if (reset_reload =3D=3D -1)
+		return reset_reload;
+
+	val &=3D BIT(0);
+	pci_write_config_dword(dev0, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD, val)=
;
 	return 0;
 }
=20
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_i=
nternal.h
index 345bf843a38e..af9a84aeee6f 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -112,6 +112,12 @@ void ocxl_actag_afu_free(struct ocxl_fn *fn, u32 sta=
rt, u32 size);
  */
 int ocxl_config_get_pasid_info(struct pci_dev *dev, int *count);
=20
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
index 58f1ba264206..8f69f7311343 100644
--- a/drivers/misc/ocxl/sysfs.c
+++ b/drivers/misc/ocxl/sysfs.c
@@ -51,11 +51,46 @@ static ssize_t contexts_show(struct device *device,
 			afu->pasid_count, afu->pasid_max);
 }
=20
+static ssize_t reload_on_reset_show(struct device *device,
+		struct device_attribute *attr,
+		char *buf)
+{
+	struct ocxl_afu *afu =3D to_afu(device);
+	struct ocxl_fn *fn =3D afu->fn;
+	struct pci_dev *pci_dev =3D to_pci_dev(fn->dev.parent);
+	int val;
+
+	if (ocxl_config_get_reset_reload(pci_dev, &val))
+		return scnprintf(buf, PAGE_SIZE, "unavailable\n");
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+}
+
+static ssize_t reload_on_reset_store(struct device *device,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct ocxl_afu *afu =3D to_afu(device);
+	struct ocxl_fn *fn =3D afu->fn;
+	struct pci_dev *pci_dev =3D to_pci_dev(fn->dev.parent);
+	int rc, val;
+
+	rc =3D sscanf(buf, "%i", &val);
+	if ((rc !=3D 1) || !(val =3D=3D 1 || val =3D=3D 0))
+		return -EINVAL;
+
+	if (ocxl_config_set_reset_reload(pci_dev, val))
+		return -ENODEV;
+
+	return count;
+}
+
 static struct device_attribute afu_attrs[] =3D {
 	__ATTR_RO(global_mmio_size),
 	__ATTR_RO(pp_mmio_size),
 	__ATTR_RO(afu_version),
 	__ATTR_RO(contexts),
+	__ATTR_RW(reload_on_reset),
 };
=20
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
=20
 #endif /* _OCXL_CONFIG_H_ */
--=20
2.25.1

