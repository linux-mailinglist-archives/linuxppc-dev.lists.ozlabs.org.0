Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D85A1B0287
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 09:14:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495HyS1XTDzDqB4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 17:14:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495HpC5X4SzDqng
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:07:47 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K7292C029108
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 03:07:43 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gj226gt0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 03:07:42 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Mon, 20 Apr 2020 08:07:18 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 08:07:16 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03K77aUg45744332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 07:07:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71D99AE04D;
 Mon, 20 Apr 2020 07:07:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ED25AE051;
 Mon, 20 Apr 2020 07:07:33 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.199.35.142])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 07:07:33 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH v6 2/4] powerpc/papr_scm: Fetch nvdimm health information from
 PHYP
Date: Mon, 20 Apr 2020 12:37:09 +0530
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200420070711.223545-1-vaibhav@linux.ibm.com>
References: <20200420070711.223545-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042007-0012-0000-0000-000003A7BF62
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042007-0013-0000-0000-000021E50819
Message-Id: <20200420070711.223545-3-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_02:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200058
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement support for fetching nvdimm health information via
H_SCM_HEALTH hcall as documented in Ref[1]. The hcall returns a pair
of 64-bit big-endian integers, bitwise-and of which is then stored in
'struct papr_scm_priv' and subsequently partially exposed to
user-space via newly introduced dimm specific attribute
'papr/flags'. Since the hcall is costly, the health information is
cached and only re-queried, 60s after the previous successful hcall.

The patch also adds a new asm header named 'papr_scm.h' describing the
interface between PHYP and guest kernel. A documentation text
describing flags reported by the the new sysfs attribute 'papr/flags'
is also introduced at Documentation/ABI/testing/sysfs-bus-papr-scm.

[1] commit 58b278f568f0 ("powerpc: Provide initial documentation for
PAPR hcalls")

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog

v5..v6 :
* Change the flags sysfs attribute from 'papr_flags' to 'papr/flags'
  [Dan Williams]
* Include documentation for 'papr/flags' attr [Dan Williams]
* Change flag 'save_fail' to 'flush_fail' [Dan Williams]
* Caching of health bitmap to reduce expensive hcalls [Dan Williams]
* Removed usage of PPC_BIT from 'papr-scm.h' header [Mpe]
* Replaced two __be64 integers from papr_scm_priv to a single u64
  integer [Mpe]
* Updated patch description to reflect the changes made in this
  version.
* Removed avoidable usage of 'papr_scm_priv.dimm_mutex' from
  flags_show() [Dan Williams]

v4..v5 :
* None

v3..v4 :
* None

v2..v3 :
* Removed PAPR_SCM_DIMM_HEALTH_NON_CRITICAL as a condition for
       	 NVDIMM unarmed [Aneesh]

v1..v2 :
* New patch in the series.
---
 Documentation/ABI/testing/sysfs-bus-papr-scm |  27 ++++
 arch/powerpc/include/asm/papr_scm.h          |  49 ++++++++
 arch/powerpc/platforms/pseries/papr_scm.c    | 126 ++++++++++++++++++-
 3 files changed, 200 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-papr-scm
 create mode 100644 arch/powerpc/include/asm/papr_scm.h

diff --git a/Documentation/ABI/testing/sysfs-bus-papr-scm b/Documentation/ABI/testing/sysfs-bus-papr-scm
new file mode 100644
index 000000000000..001e4d34ab5c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-papr-scm
@@ -0,0 +1,27 @@
+What:		/sys/bus/nd/devices/nmemX/papr/flags
+Date:		Apr, 2020
+KernelVersion:	v5.8
+Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-nvdimm@lists.01.org,
+Description:
+		(RO) Report flags indicating various states of a
+		papr-scm NVDIMM device. Each flag maps to a one or
+		more bits set in the dimm-health-bitmap retrieved in
+		response to H_SCM_HEALTH hcall. The details of the bit
+		flags returned in response to this hcall is available
+		at 'Documentation/powerpc/papr_hcalls.rst' . Below are
+		the flags reported in this sysfs file:
+
+		* "not_armed"	: Indicating that nvdimm contents will not
+				  survive a power cycle.
+		* "flush_fail"	: Indicating that nvdimm contents
+				  couldn't be flushed during last
+				  shutdown event.
+		* "restore_fail": Indicating that nvdimm contents
+				  couldn't be restored during dimm
+				  initialization.
+		* "encrypted"	: Dimm contents are encrypted.
+		* "smart_notify": There is health event for the nvdimm.
+		* "scrubbed"	: Indicating that contents of the
+				  nvdimm have been scrubbed.
+		* "locked"	: Indicating that nvdimm contents cant
+				  be modified until next power cycle.
diff --git a/arch/powerpc/include/asm/papr_scm.h b/arch/powerpc/include/asm/papr_scm.h
new file mode 100644
index 000000000000..b51c048e906a
--- /dev/null
+++ b/arch/powerpc/include/asm/papr_scm.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Structures and defines needed to manage nvdimms for spapr guests.
+ */
+#ifndef _ASM_POWERPC_PAPR_SCM_H_
+#define _ASM_POWERPC_PAPR_SCM_H_
+
+#include <linux/types.h>
+#include <asm/bitsperlong.h>
+
+/* DIMM health bitmap bitmap indicators */
+
+/* SCM device is unable to persist memory contents */
+#define PAPR_SCM_DIMM_UNARMED                   (1ULL << (63 - 0))
+/* SCM device failed to persist memory contents */
+#define PAPR_SCM_DIMM_SHUTDOWN_DIRTY            (1ULL << (63 - 1))
+/* SCM device contents are persisted from previous IPL */
+#define PAPR_SCM_DIMM_SHUTDOWN_CLEAN            (1ULL << (63 - 2))
+/* SCM device contents are not persisted from previous IPL */
+#define PAPR_SCM_DIMM_EMPTY                     (1ULL << (63 - 3))
+/* SCM device memory life remaining is critically low */
+#define PAPR_SCM_DIMM_HEALTH_CRITICAL           (1ULL << (63 - 4))
+/* SCM device will be garded off next IPL due to failure */
+#define PAPR_SCM_DIMM_HEALTH_FATAL              (1ULL << (63 - 5))
+/* SCM contents cannot persist due to current platform health status */
+#define PAPR_SCM_DIMM_HEALTH_UNHEALTHY          (1ULL << (63 - 6))
+/* SCM device is unable to persist memory contents in certain conditions */
+#define PAPR_SCM_DIMM_HEALTH_NON_CRITICAL       (1ULL << (63 - 7))
+/* SCM device is encrypted */
+#define PAPR_SCM_DIMM_ENCRYPTED                 (1ULL << (63 - 8))
+/* SCM device has been scrubbed and locked */
+#define PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED       (1ULL << (63 - 9))
+
+/* Bits status indicators for health bitmap indicating unarmed dimm */
+#define PAPR_SCM_DIMM_UNARMED_MASK (PAPR_SCM_DIMM_UNARMED |	\
+					PAPR_SCM_DIMM_HEALTH_UNHEALTHY)
+
+/* Bits status indicators for health bitmap indicating unflushed dimm */
+#define PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK (PAPR_SCM_DIMM_SHUTDOWN_DIRTY)
+
+/* Bits status indicators for health bitmap indicating unrestored dimm */
+#define PAPR_SCM_DIMM_BAD_RESTORE_MASK  (PAPR_SCM_DIMM_EMPTY)
+
+/* Bit status indicators for smart event notification */
+#define PAPR_SCM_DIMM_SMART_EVENT_MASK (PAPR_SCM_DIMM_HEALTH_CRITICAL | \
+					   PAPR_SCM_DIMM_HEALTH_FATAL | \
+					   PAPR_SCM_DIMM_HEALTH_UNHEALTHY)
+
+#endif
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 0b4467e378e5..f8fe579e6f2e 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 
 #include <asm/plpar_wrappers.h>
+#include <asm/papr_scm.h>
 
 #define BIND_ANY_ADDR (~0ul)
 
@@ -39,6 +40,15 @@ struct papr_scm_priv {
 	struct resource res;
 	struct nd_region *region;
 	struct nd_interleave_set nd_set;
+
+	/* Protect dimm health data from concurrent read/writes */
+	struct mutex dimm_mutex;
+
+	/* Last time the health information of the dimm was updated */
+	unsigned long lasthealth_jiffies;
+
+	/* Health information for the dimm */
+	u64 health_bitmap;
 };
 
 static int drc_pmem_bind(struct papr_scm_priv *p)
@@ -144,6 +154,56 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
 	return drc_pmem_bind(p);
 }
 
+/* Min interval in seconds between successive H_SCM_HEALTH hcalls */
+#define MIN_HEALTH_QUERY_INTERVAL 60
+
+/*
+ * Issue hcall if needed to retrieve dimm health info. Information is cached
+ * and subsequent calls may return success without issueing the hcall.
+ * Use 'force == true' to force issue of the hcall ignoring the cache
+ * timeout.
+ */
+static int drc_pmem_query_health(struct papr_scm_priv *p, bool force)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	s64 rc;
+	unsigned long cache_timeout;
+
+	/* Protect concurrent modifications to papr_scm_priv */
+	rc = mutex_lock_interruptible(&p->dimm_mutex);
+	if (rc)
+		return rc;
+
+	/* Jiffies offset for which the health data is assumed to be same */
+	cache_timeout = p->lasthealth_jiffies +
+		msecs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL * 1000);
+
+	/* Dont issue the hcall if health information is relatively new */
+	if (!force && time_after(cache_timeout, jiffies)) {
+		rc = 0;
+		goto out;
+	}
+
+	/* issue the hcall */
+	rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
+	if (rc != H_SUCCESS) {
+		dev_err(&p->pdev->dev,
+			 "Failed to query health information, Err:%lld\n", rc);
+		rc = -ENXIO;
+		goto out;
+	}
+
+	p->lasthealth_jiffies = jiffies;
+	p->health_bitmap = ret[0] & ret[1];
+
+	dev_dbg(&p->pdev->dev,
+		"Queried dimm health info. Bitmap:0x%016lx Mask:0x%016lx\n",
+		ret[0], ret[1]);
+
+out:
+	mutex_unlock(&p->dimm_mutex);
+	return rc;
+}
 
 static int papr_scm_meta_get(struct papr_scm_priv *p,
 			     struct nd_cmd_get_config_data_hdr *hdr)
@@ -304,6 +364,65 @@ static inline int papr_scm_node(int node)
 	return min_node;
 }
 
+static ssize_t flags_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+	int rc;
+	u64 health;
+
+	rc = drc_pmem_query_health(p, false);
+	if (rc)
+		return rc;
+
+	/*
+	 * Copy the LE byte-ordered health_bitmap locally, check for various
+	 * masks and update the sysfs out buffer.
+	 */
+	health = p->health_bitmap;
+
+	if (health & PAPR_SCM_DIMM_UNARMED_MASK)
+		rc += sprintf(buf, "not_armed ");
+
+	if (health & PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK)
+		rc += sprintf(buf + rc, "save_fail ");
+
+	if (health & PAPR_SCM_DIMM_BAD_RESTORE_MASK)
+		rc += sprintf(buf + rc, "restore_fail ");
+
+	if (health & PAPR_SCM_DIMM_ENCRYPTED)
+		rc += sprintf(buf + rc, "encrypted ");
+
+	if (health & PAPR_SCM_DIMM_SMART_EVENT_MASK)
+		rc += sprintf(buf + rc, "smart_notify ");
+
+	if (health & PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED)
+		rc += sprintf(buf + rc, "scrubbed locked ");
+
+	if (rc > 0)
+		rc += sprintf(buf + rc, "\n");
+
+	return rc;
+}
+DEVICE_ATTR_RO(flags);
+
+/* papr_scm specific dimm attributes */
+static struct attribute *papr_scm_nd_attributes[] = {
+	&dev_attr_flags.attr,
+	NULL,
+};
+
+static struct attribute_group papr_scm_nd_attribute_group = {
+	.name = "papr",
+	.attrs = papr_scm_nd_attributes,
+};
+
+static const struct attribute_group *papr_scm_dimm_attr_groups[] = {
+	&papr_scm_nd_attribute_group,
+	NULL,
+};
+
 static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 {
 	struct device *dev = &p->pdev->dev;
@@ -330,8 +449,8 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	dimm_flags = 0;
 	set_bit(NDD_ALIASING, &dimm_flags);
 
-	p->nvdimm = nvdimm_create(p->bus, p, NULL, dimm_flags,
-				  PAPR_SCM_DIMM_CMD_MASK, 0, NULL);
+	p->nvdimm = nvdimm_create(p->bus, p, papr_scm_dimm_attr_groups,
+				  dimm_flags, PAPR_SCM_DIMM_CMD_MASK, 0, NULL);
 	if (!p->nvdimm) {
 		dev_err(dev, "Error creating DIMM object for %pOF\n", p->dn);
 		goto err;
@@ -415,6 +534,9 @@ static int papr_scm_probe(struct platform_device *pdev)
 	if (!p)
 		return -ENOMEM;
 
+	/* Initialize the dimm mutex */
+	mutex_init(&p->dimm_mutex);
+
 	/* optional DT properties */
 	of_property_read_u32(dn, "ibm,metadata-size", &metadata_size);
 
-- 
2.25.3

