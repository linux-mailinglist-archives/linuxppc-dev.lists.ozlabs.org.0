Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8591F0B65
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 15:23:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49fxsl0lwZzDqXL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 23:23:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49fxgX0RXSzDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jun 2020 23:14:47 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 057D2S10067973; Sun, 7 Jun 2020 09:14:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g7n71mca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Jun 2020 09:14:13 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 057DCT7j114952;
 Sun, 7 Jun 2020 09:14:13 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g7n71mbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Jun 2020 09:14:13 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 057DA4u8027818;
 Sun, 7 Jun 2020 13:14:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 31g2s7rw03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Jun 2020 13:14:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 057DE79M56426600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 7 Jun 2020 13:14:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E39B42045;
 Sun,  7 Jun 2020 13:14:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 763404203F;
 Sun,  7 Jun 2020 13:14:02 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.68.227])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sun,  7 Jun 2020 13:14:02 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Sun, 07 Jun 2020 18:44:01 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 3/6] powerpc/papr_scm: Fetch nvdimm health information
 from PHYP
Date: Sun,  7 Jun 2020 18:43:36 +0530
Message-Id: <20200607131339.476036-4-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200607131339.476036-1-vaibhav@linux.ibm.com>
References: <20200607131339.476036-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-07_03:2020-06-04,
 2020-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006070096
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Steven Rostedt <rostedt@goodmis.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement support for fetching nvdimm health information via
H_SCM_HEALTH hcall as documented in Ref[1]. The hcall returns a pair
of 64-bit bitmap, bitwise-and of which is then stored in
'struct papr_scm_priv' and subsequently partially exposed to
user-space via newly introduced dimm specific attribute
'papr/flags'. Since the hcall is costly, the health information is
cached and only re-queried, 60s after the previous successful hcall.

The patch also adds a  documentation text describing flags reported by
the the new sysfs attribute 'papr/flags' is also introduced at
Documentation/ABI/testing/sysfs-bus-papr-pmem.

[1] commit 58b278f568f0 ("powerpc: Provide initial documentation for
PAPR hcalls")

Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

v10..v11:
* None

v9..v10:
* Removed an avoidable 'goto' in __drc_pmem_query_health. [ Ira ].

Resend:
* Added ack from Aneesh.

v8..v9:
* Rename some variables and defines to reduce usage of term SCM
  replacing it with PMEM [Dan Williams, Aneesh]
* s/PAPR_SCM_DIMM/PAPR_PMEM/g
* s/papr_scm_nd_attributes/papr_nd_attributes/g
* s/papr_scm_nd_attribute_group/papr_nd_attribute_group/g
* s/papr_scm_dimm_attr_groups/papr_nd_attribute_groups/g
* Renamed file sysfs-bus-papr-scm to sysfs-bus-papr-pmem

v7..v8:
* Update type of variable 'rc' in __drc_pmem_query_health() and
  drc_pmem_query_health() to long and int respectively. [ Ira ]
* Updated the patch description to s/64 bit Big Endian Number/64-bit
  bitmap/ [ Ira, Aneesh ].

Resend:
* None

v6..v7 :
* Used the exported buf_seq_printf() function to generate content for
  'papr/flags'
* Moved the PAPR_SCM_DIMM_* bit-flags macro definitions to papr_scm.c
  and removed the papr_scm.h file [Mpe]
* Some minor consistency issued in sysfs-bus-papr-scm
  documentation. [Mpe]
* s/dimm_mutex/health_mutex/g [Mpe]
* Split drc_pmem_query_health() into two function one of which takes
  care of caching and locking. [Mpe]
* Fixed a local copy creation of dimm health information using
  READ_ONCE(). [Mpe]

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
 Documentation/ABI/testing/sysfs-bus-papr-pmem |  27 +++
 arch/powerpc/platforms/pseries/papr_scm.c     | 168 +++++++++++++++++-
 2 files changed, 193 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-papr-pmem

diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
new file mode 100644
index 000000000000..5b10d036a8d4
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
@@ -0,0 +1,27 @@
+What:		/sys/bus/nd/devices/nmemX/papr/flags
+Date:		Apr, 2020
+KernelVersion:	v5.8
+Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-nvdimm@lists.01.org,
+Description:
+		(RO) Report flags indicating various states of a
+		papr-pmem NVDIMM device. Each flag maps to a one or
+		more bits set in the dimm-health-bitmap retrieved in
+		response to H_SCM_HEALTH hcall. The details of the bit
+		flags returned in response to this hcall is available
+		at 'Documentation/powerpc/papr_hcalls.rst' . Below are
+		the flags reported in this sysfs file:
+
+		* "not_armed"	: Indicates that NVDIMM contents will not
+				  survive a power cycle.
+		* "flush_fail"	: Indicates that NVDIMM contents
+				  couldn't be flushed during last
+				  shut-down event.
+		* "restore_fail": Indicates that NVDIMM contents
+				  couldn't be restored during NVDIMM
+				  initialization.
+		* "encrypted"	: NVDIMM contents are encrypted.
+		* "smart_notify": There is health event for the NVDIMM.
+		* "scrubbed"	: Indicating that contents of the
+				  NVDIMM have been scrubbed.
+		* "locked"	: Indicating that NVDIMM contents cant
+				  be modified until next power cycle.
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f35592423380..0c091622b15e 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -12,6 +12,7 @@
 #include <linux/libnvdimm.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/seq_buf.h>
 
 #include <asm/plpar_wrappers.h>
 
@@ -22,6 +23,44 @@
 	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
 	 (1ul << ND_CMD_SET_CONFIG_DATA))
 
+/* DIMM health bitmap bitmap indicators */
+/* SCM device is unable to persist memory contents */
+#define PAPR_PMEM_UNARMED                   (1ULL << (63 - 0))
+/* SCM device failed to persist memory contents */
+#define PAPR_PMEM_SHUTDOWN_DIRTY            (1ULL << (63 - 1))
+/* SCM device contents are persisted from previous IPL */
+#define PAPR_PMEM_SHUTDOWN_CLEAN            (1ULL << (63 - 2))
+/* SCM device contents are not persisted from previous IPL */
+#define PAPR_PMEM_EMPTY                     (1ULL << (63 - 3))
+/* SCM device memory life remaining is critically low */
+#define PAPR_PMEM_HEALTH_CRITICAL           (1ULL << (63 - 4))
+/* SCM device will be garded off next IPL due to failure */
+#define PAPR_PMEM_HEALTH_FATAL              (1ULL << (63 - 5))
+/* SCM contents cannot persist due to current platform health status */
+#define PAPR_PMEM_HEALTH_UNHEALTHY          (1ULL << (63 - 6))
+/* SCM device is unable to persist memory contents in certain conditions */
+#define PAPR_PMEM_HEALTH_NON_CRITICAL       (1ULL << (63 - 7))
+/* SCM device is encrypted */
+#define PAPR_PMEM_ENCRYPTED                 (1ULL << (63 - 8))
+/* SCM device has been scrubbed and locked */
+#define PAPR_PMEM_SCRUBBED_AND_LOCKED       (1ULL << (63 - 9))
+
+/* Bits status indicators for health bitmap indicating unarmed dimm */
+#define PAPR_PMEM_UNARMED_MASK (PAPR_PMEM_UNARMED |		\
+				PAPR_PMEM_HEALTH_UNHEALTHY)
+
+/* Bits status indicators for health bitmap indicating unflushed dimm */
+#define PAPR_PMEM_BAD_SHUTDOWN_MASK (PAPR_PMEM_SHUTDOWN_DIRTY)
+
+/* Bits status indicators for health bitmap indicating unrestored dimm */
+#define PAPR_PMEM_BAD_RESTORE_MASK  (PAPR_PMEM_EMPTY)
+
+/* Bit status indicators for smart event notification */
+#define PAPR_PMEM_SMART_EVENT_MASK (PAPR_PMEM_HEALTH_CRITICAL | \
+				    PAPR_PMEM_HEALTH_FATAL |	\
+				    PAPR_PMEM_HEALTH_UNHEALTHY)
+
+/* private struct associated with each region */
 struct papr_scm_priv {
 	struct platform_device *pdev;
 	struct device_node *dn;
@@ -39,6 +78,15 @@ struct papr_scm_priv {
 	struct resource res;
 	struct nd_region *region;
 	struct nd_interleave_set nd_set;
+
+	/* Protect dimm health data from concurrent read/writes */
+	struct mutex health_mutex;
+
+	/* Last time the health information of the dimm was updated */
+	unsigned long lasthealth_jiffies;
+
+	/* Health information for the dimm */
+	u64 health_bitmap;
 };
 
 static int drc_pmem_bind(struct papr_scm_priv *p)
@@ -144,6 +192,61 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
 	return drc_pmem_bind(p);
 }
 
+/*
+ * Issue hcall to retrieve dimm health info and populate papr_scm_priv with the
+ * health information.
+ */
+static int __drc_pmem_query_health(struct papr_scm_priv *p)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	long rc;
+
+	/* issue the hcall */
+	rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
+	if (rc != H_SUCCESS) {
+		dev_err(&p->pdev->dev,
+			"Failed to query health information, Err:%ld\n", rc);
+		return -ENXIO;
+	}
+
+	p->lasthealth_jiffies = jiffies;
+	p->health_bitmap = ret[0] & ret[1];
+
+	dev_dbg(&p->pdev->dev,
+		"Queried dimm health info. Bitmap:0x%016lx Mask:0x%016lx\n",
+		ret[0], ret[1]);
+
+	return 0;
+}
+
+/* Min interval in seconds for assuming stable dimm health */
+#define MIN_HEALTH_QUERY_INTERVAL 60
+
+/* Query cached health info and if needed call drc_pmem_query_health */
+static int drc_pmem_query_health(struct papr_scm_priv *p)
+{
+	unsigned long cache_timeout;
+	int rc;
+
+	/* Protect concurrent modifications to papr_scm_priv */
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		return rc;
+
+	/* Jiffies offset for which the health data is assumed to be same */
+	cache_timeout = p->lasthealth_jiffies +
+		msecs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL * 1000);
+
+	/* Fetch new health info is its older than MIN_HEALTH_QUERY_INTERVAL */
+	if (time_after(jiffies, cache_timeout))
+		rc = __drc_pmem_query_health(p);
+	else
+		/* Assume cached health data is valid */
+		rc = 0;
+
+	mutex_unlock(&p->health_mutex);
+	return rc;
+}
 
 static int papr_scm_meta_get(struct papr_scm_priv *p,
 			     struct nd_cmd_get_config_data_hdr *hdr)
@@ -286,6 +389,64 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 	return 0;
 }
 
+static ssize_t flags_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+	struct seq_buf s;
+	u64 health;
+	int rc;
+
+	rc = drc_pmem_query_health(p);
+	if (rc)
+		return rc;
+
+	/* Copy health_bitmap locally, check masks & update out buffer */
+	health = READ_ONCE(p->health_bitmap);
+
+	seq_buf_init(&s, buf, PAGE_SIZE);
+	if (health & PAPR_PMEM_UNARMED_MASK)
+		seq_buf_printf(&s, "not_armed ");
+
+	if (health & PAPR_PMEM_BAD_SHUTDOWN_MASK)
+		seq_buf_printf(&s, "flush_fail ");
+
+	if (health & PAPR_PMEM_BAD_RESTORE_MASK)
+		seq_buf_printf(&s, "restore_fail ");
+
+	if (health & PAPR_PMEM_ENCRYPTED)
+		seq_buf_printf(&s, "encrypted ");
+
+	if (health & PAPR_PMEM_SMART_EVENT_MASK)
+		seq_buf_printf(&s, "smart_notify ");
+
+	if (health & PAPR_PMEM_SCRUBBED_AND_LOCKED)
+		seq_buf_printf(&s, "scrubbed locked ");
+
+	if (seq_buf_used(&s))
+		seq_buf_printf(&s, "\n");
+
+	return seq_buf_used(&s);
+}
+DEVICE_ATTR_RO(flags);
+
+/* papr_scm specific dimm attributes */
+static struct attribute *papr_nd_attributes[] = {
+	&dev_attr_flags.attr,
+	NULL,
+};
+
+static struct attribute_group papr_nd_attribute_group = {
+	.name = "papr",
+	.attrs = papr_nd_attributes,
+};
+
+static const struct attribute_group *papr_nd_attr_groups[] = {
+	&papr_nd_attribute_group,
+	NULL,
+};
+
 static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 {
 	struct device *dev = &p->pdev->dev;
@@ -312,8 +473,8 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	dimm_flags = 0;
 	set_bit(NDD_LABELING, &dimm_flags);
 
-	p->nvdimm = nvdimm_create(p->bus, p, NULL, dimm_flags,
-				  PAPR_SCM_DIMM_CMD_MASK, 0, NULL);
+	p->nvdimm = nvdimm_create(p->bus, p, papr_nd_attr_groups,
+				  dimm_flags, PAPR_SCM_DIMM_CMD_MASK, 0, NULL);
 	if (!p->nvdimm) {
 		dev_err(dev, "Error creating DIMM object for %pOF\n", p->dn);
 		goto err;
@@ -399,6 +560,9 @@ static int papr_scm_probe(struct platform_device *pdev)
 	if (!p)
 		return -ENOMEM;
 
+	/* Initialize the dimm mutex */
+	mutex_init(&p->health_mutex);
+
 	/* optional DT properties */
 	of_property_read_u32(dn, "ibm,metadata-size", &metadata_size);
 
-- 
2.26.2

