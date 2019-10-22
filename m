Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE7DFF0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 10:08:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y5jn02gzzDqFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 19:08:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y5N41c3pzDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 18:53:07 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9M7r24Q136000
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 03:53:05 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vsurj3nqa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 03:53:04 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Tue, 22 Oct 2019 08:52:52 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 22 Oct 2019 08:52:49 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9M7qmF436307130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2019 07:52:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7F9C11C04A;
 Tue, 22 Oct 2019 07:52:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A07911C05C;
 Tue, 22 Oct 2019 07:52:48 +0000 (GMT)
Received: from lombard-w541.nice-meridia.fr.ibm.com (unknown [9.134.167.65])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Oct 2019 07:52:48 +0000 (GMT)
From: christophe lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com, groug@kaod.org
Subject: [PATCH 2/3] ocxl: Add pseries-specific code
Date: Tue, 22 Oct 2019 09:52:46 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022075247.16266-1-clombard@linux.vnet.ibm.com>
References: <20191022075247.16266-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19102207-0012-0000-0000-0000035B54F4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102207-0013-0000-0000-000021967EB6
Message-Id: <20191022075247.16266-3-clombard@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-22_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910220075
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pseries.c implements the guest-specific callbacks for the backend API.

The hypervisor calls provide an interface to configure and interact with
OpenCAPI devices. It matches the last version of the 'PAPR changes'
document.

The following hcalls are supported:
H_OCXL_CONFIG_ADAPTER   Used to configure OpenCAPI adapter characteristics.

H_OCXL_CONFIG_SPA       Used to configure the schedule process area (SPA)
                        table for an OCAPI device.

H_OCXL_GET_FAULT_STATE  Used to retrieve fault information from an
                        OpenCAPI device.

H_OCXL_HANDLE_FAULT     Used to respond to an OpenCAPI fault.

Each previous hcall supports a config flag parameter, to allows the guest
to manage the CAPI device.

The current values 0xf004 to 0xf007 have been chosen according the
available QEMU hcall values which are specific to qemu / KVM-on-POWER.

Two parameters are common to all hcalls (buid and config_addr) that will
be used to allow QEMU to recover the PCI device.

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 drivers/misc/ocxl/Makefile        |   1 +
 drivers/misc/ocxl/main.c          |   4 +
 drivers/misc/ocxl/ocxl_internal.h |   1 +
 drivers/misc/ocxl/pseries.c       | 450 ++++++++++++++++++++++++++++++
 4 files changed, 456 insertions(+)
 create mode 100644 drivers/misc/ocxl/pseries.c

diff --git a/drivers/misc/ocxl/Makefile b/drivers/misc/ocxl/Makefile
index bfdaeb232b83..3474e912c402 100644
--- a/drivers/misc/ocxl/Makefile
+++ b/drivers/misc/ocxl/Makefile
@@ -5,6 +5,7 @@ ocxl-y				+= main.o pci.o config.o file.o pasid.o mmio.o
 ocxl-y				+= link.o context.o afu_irq.o sysfs.o trace.o
 ocxl-y				+= core.o
 ocxl-$(CONFIG_PPC_POWERNV)	+= powernv.o
+ocxl-$(CONFIG_PPC_PSERIES)	+= pseries.o
 
 obj-$(CONFIG_OCXL)		+= ocxl.o
 
diff --git a/drivers/misc/ocxl/main.c b/drivers/misc/ocxl/main.c
index 95df2ba4d473..bdd9ffa7f769 100644
--- a/drivers/misc/ocxl/main.c
+++ b/drivers/misc/ocxl/main.c
@@ -16,6 +16,10 @@ static int __init init_ocxl(void)
 
 	if (cpu_has_feature(CPU_FTR_HVMODE))
 		ocxl_ops = &ocxl_powernv_ops;
+#ifdef CONFIG_PPC_PSERIES
+	else
+		ocxl_ops = &ocxl_pseries_ops;
+#endif
 
 	rc = pci_register_driver(&ocxl_pci_driver);
 	if (rc) {
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index 2bdea279bdc6..c18b32df3fe5 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -104,6 +104,7 @@ struct ocxl_backend_ops {
 };
 
 extern const struct ocxl_backend_ops ocxl_powernv_ops;
+extern const struct ocxl_backend_ops ocxl_pseries_ops;
 extern const struct ocxl_backend_ops *ocxl_ops;
 
 int ocxl_create_cdev(struct ocxl_afu *afu);
diff --git a/drivers/misc/ocxl/pseries.c b/drivers/misc/ocxl/pseries.c
new file mode 100644
index 000000000000..1d4942d713f7
--- /dev/null
+++ b/drivers/misc/ocxl/pseries.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2018 IBM Corp.
+#include <misc/ocxl-config.h>
+#include "ocxl_internal.h"
+#include <asm/xive.h>
+
+#define H_OCXL_CONFIG_ADAPTER	0xf004
+#define H_OCXL_CONFIG_SPA	0xf005
+#define H_OCXL_GET_FAULT_STATE	0xf006
+#define H_OCXL_HANDLE_FAULT	0xf007
+
+#define H_CONFIG_ADAPTER_SETUP		1
+#define H_CONFIG_ADAPTER_RELEASE	2
+#define H_CONFIG_ADAPTER_GET_ACTAG	3
+#define H_CONFIG_ADAPTER_GET_PASID	4
+#define H_CONFIG_ADAPTER_SET_TL		5
+#define H_CONFIG_ADAPTER_ALLOC_IRQ	6
+#define H_CONFIG_ADAPTER_FREE_IRQ	7
+
+#define H_CONFIG_SPA_SET		1
+#define H_CONFIG_SPA_UPDATE		2
+#define H_CONFIG_SPA_REMOVE		3
+
+static char *config_adapter_names[] = {
+	"UNKNOWN_OP",		/* 0 undefined */
+	"SETUP",		/* 1 */
+	"RELEASE",		/* 2 */
+	"GET_ACTAG",		/* 3 */
+	"GET_PASID",		/* 4 */
+	"SET_TL",		/* 5 */
+	"ALLOC_IRQ",		/* 6 */
+	"FREE_IRQ",		/* 7 */
+};
+
+static char *config_spa_names[] = {
+	"UNKNOWN_OP",		/* 0 undefined */
+	"SET",			/* 1 */
+	"UPDATE",		/* 2 */
+	"REMOVE",		/* 3 */
+};
+
+static char *op_str(unsigned int op, char *names[], int len)
+{
+	if (op >= len)
+		return "UNKNOWN_OP";
+	return names[op];
+}
+
+#define OP_STR(op, names)	op_str(op, names, ARRAY_SIZE(names))
+#define OP_STR_CA(op)		OP_STR(op, config_adapter_names)
+#define OP_STR_CS(op)		OP_STR(op, config_spa_names)
+
+#define _PRINT_MSG(rc, format, ...)					\
+	{								\
+		if (rc != H_SUCCESS && rc != H_CONTINUE)		\
+			pr_err(format, __VA_ARGS__);			\
+		else							\
+			pr_debug(format, __VA_ARGS__);			\
+	}								\
+
+struct pseries_data {
+	u64 buid;
+	u32 config_addr;
+	int fault_lisn;
+	int host_irq;
+};
+
+static unsigned int busy_delay(long rc)
+{
+	unsigned int ms = 0;
+
+	if (H_IS_LONG_BUSY(rc))
+		ms = get_longbusy_msecs(rc);
+	else if (rc == H_BUSY)
+		ms = 10;
+
+	if (ms)
+		mdelay(ms);
+
+	return ms;
+}
+
+static long config_adapter(unsigned long *retbuf, u64 *params)
+{
+	long rc;
+
+	do {
+		rc = plpar_hcall9(H_OCXL_CONFIG_ADAPTER, retbuf,
+				  params[0], params[1], params[2],
+				  params[3], params[4]);
+	} while (busy_delay(rc));
+
+	_PRINT_MSG(rc, "%s - buid:%#llx, config_addr: %#llx "
+			"%s(%#llx, %#llx, "
+			"retbuf1: %#lx, retbuf2: %#lx, retbuf3: %#lx): %li\n",
+			__func__, params[0], params[1],
+			OP_STR_CA(params[2]),
+			params[3], params[4],
+			retbuf[0], retbuf[1], retbuf[2], rc);
+
+	switch (rc) {
+	case H_SUCCESS:
+		return 0;
+	case H_PARAMETER:
+	case H_FUNCTION:
+	case H_NOT_FOUND:
+	case H_NOT_AVAILABLE:
+	case H_SG_LIST:
+		return -EINVAL;
+	case H_AUTHORITY:
+	case H_RESOURCE:
+	case H_HARDWARE:
+	case H_STATE:
+	case H_BUSY:
+		return -EBUSY;
+	default:
+		WARN(1, "Unexpected return code: %lx", rc);
+		return -EINVAL;
+	}
+}
+
+static int config_spa(unsigned long *retbuf, u64 *params)
+{
+	long rc;
+
+	do {
+		rc = plpar_hcall9(H_OCXL_CONFIG_SPA, retbuf,
+				  params[0], params[1], params[2],
+				  params[3], params[4], params[5],
+				  params[6]);
+	} while (busy_delay(rc));
+
+	_PRINT_MSG(rc, "%s - buid:%#llx, config_addr: %#llx "
+			"%s(%#llx, %#llx, %#llx, %#llx, "
+			"retbuf1: %#lx, retbuf2: %#lx, retbuf3: %#lx): %li\n",
+			__func__, params[0], params[1],
+			OP_STR_CS(params[2]),
+			params[3], params[4], params[5], params[6],
+			retbuf[0], retbuf[1], retbuf[2], rc);
+
+	switch (rc) {
+	case H_SUCCESS:
+		return 0;
+	case H_PARAMETER:
+	case H_FUNCTION:
+		return -EINVAL;
+	case H_AUTHORITY:
+	case H_RESOURCE:
+	case H_HARDWARE:
+	case H_STATE:
+	case H_BUSY:
+		return -EBUSY;
+	default:
+		WARN(1, "Unexpected return code: %lx", rc);
+		return -EINVAL;
+	}
+}
+
+static u64 get_buid(struct pci_dev *dev)
+{
+	struct device_node *dn;
+	struct pci_dn *pdn;
+
+	dn = pci_device_to_OF_node(dev);
+	pdn = PCI_DN(dn);
+	return pdn->phb->buid;
+}
+
+static u32 get_config_addr(struct pci_dev *dev)
+{
+	int bus, devfn;
+	u32 config_addr;
+
+	bus = dev->bus->number;
+	devfn = dev->devfn;
+	config_addr = ((bus & 0xFF) << 16) + ((devfn & 0xFF) << 8);
+	return config_addr;
+}
+
+static void ack_irq(void *data, u64 tfc)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	struct pseries_data *pdata = data;
+	long rc;
+
+	do {
+		rc = plpar_hcall(H_OCXL_HANDLE_FAULT, retbuf,
+				 pdata->buid, pdata->config_addr, tfc);
+	} while (busy_delay(rc));
+
+	_PRINT_MSG(rc, "%s - buid:%#llx, config_addr: %#x "
+			"(tfc: %#llx): %li\n",
+			__func__, pdata->buid, pdata->config_addr,
+			tfc, rc);
+}
+
+static int alloc_xive_irq(void *data, u32 *irq,
+			  u64 *trigger_addr)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	struct pseries_data *pdata = data;
+	u64 params[PLPAR_HCALL9_BUFSIZE];
+	struct xive_irq_data *xd;
+	int virq;
+	long rc;
+
+	params[0] = pdata->buid;
+	params[1] = pdata->config_addr;
+	params[2] = H_CONFIG_ADAPTER_ALLOC_IRQ;
+
+	rc = config_adapter(retbuf, params);
+	if (rc)
+		return rc;
+
+	*irq = retbuf[0];
+
+	virq = irq_create_mapping(NULL, *irq);
+	if (!virq) {
+		pr_err("irq_create_mapping failed\n");
+		return -EINVAL;
+	}
+
+	xd = irq_get_handler_data(virq);
+	if (!xd) {
+		pr_err("irq_get_handler_data failed\n");
+		return -EINVAL;
+	}
+	/**trigger_addr = xd->trig_page;*/
+	*trigger_addr = xd->eoi_page;
+
+	pr_debug("%s - buid: %#llx, irq: %d, trigger_addr: %#llx\n",
+		 __func__, pdata->buid, *irq, *trigger_addr);
+	return rc;
+}
+
+static void free_xive_irq(void *data, u32 irq)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	struct pseries_data *pdata = data;
+	u64 params[PLPAR_HCALL9_BUFSIZE];
+
+	params[0] = pdata->buid;
+	params[1] = pdata->config_addr;
+	params[2] = H_CONFIG_ADAPTER_FREE_IRQ;
+	params[3] = irq;
+
+	config_adapter(retbuf, params);
+}
+
+static int get_actag(struct pci_dev *dev, u16 *base,
+		     u16 *enabled, u16 *supported)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	u64 params[PLPAR_HCALL9_BUFSIZE];
+	int rc = 0;
+
+	params[0] = get_buid(dev);
+	params[1] = get_config_addr(dev);
+	params[2] = H_CONFIG_ADAPTER_GET_ACTAG;
+
+	rc = config_adapter(retbuf, params);
+	if (!rc) {
+		*base = retbuf[0];
+		*enabled = retbuf[1];
+		*supported = retbuf[2];
+	}
+	return rc;
+}
+
+static void get_fault_state(void *data, u64 *dsisr, u64 *dar,
+			    u64 *pe_handle, int *pid)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	struct pseries_data *pdata = data;
+	long rc;
+
+	do {
+		rc = plpar_hcall9(H_OCXL_GET_FAULT_STATE, retbuf,
+				  pdata->buid, pdata->config_addr);
+	} while (busy_delay(rc));
+
+	_PRINT_MSG(rc, "%s - buid:%#llx, config_addr: %#x "
+			"(out1: %#lx, out2: %#lx, out3: %#lx, "
+			"out4: %#lx): %li\n",
+			__func__, pdata->buid, pdata->config_addr,
+			retbuf[0], retbuf[1], retbuf[2], retbuf[3], rc);
+
+	*dsisr = retbuf[0];
+	*dar = retbuf[1];
+	*pe_handle = retbuf[2];
+	*pid = retbuf[3];
+}
+
+static int get_pasid_count(struct pci_dev *dev, int *count)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	u64 params[PLPAR_HCALL9_BUFSIZE];
+	int rc = 0;
+
+	params[0] = get_buid(dev);
+	params[1] = get_config_addr(dev);
+	params[2] = H_CONFIG_ADAPTER_GET_PASID;
+
+	rc = config_adapter(retbuf, params);
+	if (!rc)
+		*count = retbuf[0];
+	return rc;
+}
+
+static void platform_release(void *data)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	struct pseries_data *pdata = data;
+	u64 params[PLPAR_HCALL9_BUFSIZE];
+
+	params[0] = pdata->buid;
+	params[1] = pdata->config_addr;
+	params[2] = H_CONFIG_ADAPTER_RELEASE;
+	params[3] = pdata->host_irq;
+	params[4] = pdata->fault_lisn;
+
+	config_adapter(retbuf, params);
+
+	kfree(pdata);
+}
+
+static int platform_setup(struct pci_dev *dev, int PE_mask, int *hwirq,
+			  void **data)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	u64 params[PLPAR_HCALL9_BUFSIZE];
+	struct pseries_data *pdata;
+	int rc = 0;
+
+	rc = of_property_read_u32(dev->dev.of_node, "fault-lisn", hwirq);
+	if (rc) {
+		pr_err("fault-lisn not found (%d)\n", rc);
+		return rc;
+	}
+
+	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	pdata->buid = get_buid(dev);
+	pdata->config_addr = get_config_addr(dev);
+	*data = pdata;
+
+	params[0] = pdata->buid;
+	params[1] = pdata->config_addr;
+	params[2] = H_CONFIG_ADAPTER_SETUP;
+	params[3] = PE_mask;
+	params[4] = *hwirq;
+
+	rc = config_adapter(retbuf, params);
+	if (!rc) {
+		pdata->fault_lisn = *hwirq;
+		pdata->host_irq = retbuf[0];
+	}
+	return rc;
+}
+
+static int remove_pe(void *data, int pasid, u32 *pid,
+		     u32 *tid, int *pe_handle)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	struct pseries_data *pdata = data;
+	u64 params[PLPAR_HCALL9_BUFSIZE];
+	int rc;
+
+	params[0] = pdata->buid;
+	params[1] = pdata->config_addr;
+	params[2] = H_CONFIG_SPA_REMOVE;
+	params[3] = pasid;
+
+	rc = config_spa(retbuf, params);
+	if (!rc) {
+		*pid = retbuf[0];
+		*tid = retbuf[1];
+		*pe_handle = retbuf[2];
+	}
+	return rc;
+}
+
+static int set_pe(void *data, int pasid, u32 pidr, u32 tidr,
+		  u64 amr, int *pe_handle)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	struct pseries_data *pdata = data;
+	u64 params[PLPAR_HCALL9_BUFSIZE];
+	int rc;
+
+	params[0] = pdata->buid;
+	params[1] = pdata->config_addr;
+	params[2] = H_CONFIG_SPA_SET;
+	params[3] = pasid;
+	params[4] = pidr;
+	params[5] = tidr;
+	params[6] = amr;
+
+	rc = config_spa(retbuf, params);
+	if (!rc)
+		*pe_handle = retbuf[0];
+
+	return rc;
+}
+
+static int set_tl(struct pci_dev *dev, int tl_dvsec)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	u64 params[PLPAR_HCALL9_BUFSIZE];
+
+	params[0] = get_buid(dev);
+	params[1] = get_config_addr(dev);
+	params[2] = H_CONFIG_ADAPTER_SET_TL;
+	params[3] = tl_dvsec;
+
+	return config_adapter(retbuf, params);
+}
+
+static int update_pe(void *data, int pasid, __u16 tid)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	struct pseries_data *pdata = data;
+	u64 params[PLPAR_HCALL9_BUFSIZE];
+
+	params[0] = pdata->buid;
+	params[1] = pdata->config_addr;
+	params[2] = H_CONFIG_SPA_UPDATE;
+	params[3] = pasid;
+	params[4] = tid;
+
+	return config_spa(retbuf, params);
+}
+
+const struct ocxl_backend_ops ocxl_pseries_ops = {
+	.module = THIS_MODULE,
+	.ack_irq = ack_irq,
+	.alloc_xive_irq = alloc_xive_irq,
+	.free_xive_irq = free_xive_irq,
+	.get_actag = get_actag,
+	.get_fault_state = get_fault_state,
+	.get_pasid_count = get_pasid_count,
+	.platform_release = platform_release,
+	.platform_setup = platform_setup,
+	.remove_pe = remove_pe,
+	.set_pe = set_pe,
+	.set_tl = set_tl,
+	.update_pe = update_pe,
+};
-- 
2.21.0

