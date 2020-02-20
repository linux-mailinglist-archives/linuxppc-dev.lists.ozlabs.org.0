Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC8165B16
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 11:05:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NVZl0JTFzDqVL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 21:05:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NVR13RHpzDqQk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 20:58:37 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01K9t4hZ002394
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 04:58:34 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8ubwjdv8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 04:58:34 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Thu, 20 Feb 2020 09:58:33 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 09:58:30 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01K9wRNs33947692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 09:58:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D0E7A4055;
 Thu, 20 Feb 2020 09:58:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4F2FA4040;
 Thu, 20 Feb 2020 09:58:24 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.199.53.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 09:58:24 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/8] powerpc/papr_scm: Provide support for fetching dimm
 health information
Date: Thu, 20 Feb 2020 15:27:59 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220095805.197229-1-vaibhav@linux.ibm.com>
References: <20200220095805.197229-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022009-0008-0000-0000-00000354B1B7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022009-0009-0000-0000-00004A75C10F
Message-Id: <20200220095805.197229-3-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_02:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=1 mlxlogscore=999
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200073
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement support for fetching dimm health information via
H_SCM_HEALTH hcall as documented in Ref[1]. The hcall returns a pair of
64-bit big-endian integers which are then stored in 'struct
papr_scm_priv' and subsequently exposed to userspace via dimm
attribute 'papr_flags'.

'papr_flags' sysfs attribute reports space separated string flags
indicating various health state an nvdimm can be. These are:

* "not_armed" 	: Indicating that nvdimm contents wont survive a power
  		  cycle.
* "save_fail" 	: Indicating that nvdimm contents couldn't be flushed
		  during last shutdown event.
* "restore_fail": Indicating that nvdimm contents couldn't be restored
		  during dimm initialization.
* "encrypted" 	: Dimm contents are encrypted.
* "smart_notify": There is health event for the nvdimm.
* "scrubbed" 	: Indicating that contents of the nvdimm have been
  		  scrubbed.
* "locked"	: Indicating that nvdimm contents cant be modified
  		  until next power cycle.

[1]: commit 58b278f568f0 ("powerpc: Provide initial documentation for
PAPR hcalls")

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 105 +++++++++++++++++++++-
 1 file changed, 103 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 0b4467e378e5..aaf2e4ab1f75 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 
 #include <asm/plpar_wrappers.h>
+#include <asm/papr_scm.h>
 
 #define BIND_ANY_ADDR (~0ul)
 
@@ -39,6 +40,13 @@ struct papr_scm_priv {
 	struct resource res;
 	struct nd_region *region;
 	struct nd_interleave_set nd_set;
+
+	/* Protect dimm data from concurrent access */
+	struct mutex dimm_mutex;
+
+	/* Health information for the dimm */
+	__be64 health_bitmap;
+	__be64 health_bitmap_valid;
 };
 
 static int drc_pmem_bind(struct papr_scm_priv *p)
@@ -144,6 +152,35 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
 	return drc_pmem_bind(p);
 }
 
+static int drc_pmem_query_health(struct papr_scm_priv *p)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	int64_t rc;
+
+	rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
+	if (rc != H_SUCCESS) {
+		dev_err(&p->pdev->dev,
+			 "Failed to query health information, Err:%lld\n", rc);
+		return -ENXIO;
+	}
+
+	/* Protect modifications to papr_scm_priv with the mutex */
+	rc = mutex_lock_interruptible(&p->dimm_mutex);
+	if (rc)
+		return rc;
+
+	/* Store the retrieved health information in dimm platform data */
+	p->health_bitmap = ret[0];
+	p->health_bitmap_valid = ret[1];
+
+	dev_dbg(&p->pdev->dev,
+		"Queried dimm health info. Bitmap:0x%016llx Mask:0x%016llx\n",
+		be64_to_cpu(p->health_bitmap),
+		be64_to_cpu(p->health_bitmap_valid));
+
+	mutex_unlock(&p->dimm_mutex);
+	return 0;
+}
 
 static int papr_scm_meta_get(struct papr_scm_priv *p,
 			     struct nd_cmd_get_config_data_hdr *hdr)
@@ -304,6 +341,67 @@ static inline int papr_scm_node(int node)
 	return min_node;
 }
 
+static ssize_t papr_flags_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+	__be64 health;
+	int rc;
+
+	rc = drc_pmem_query_health(p);
+	if (rc)
+		return rc;
+
+	/* Protect against modifications to papr_scm_priv with the mutex */
+	rc = mutex_lock_interruptible(&p->dimm_mutex);
+	if (rc)
+		return rc;
+
+	health = p->health_bitmap & p->health_bitmap_valid;
+
+	/* Check for various masks in bitmap and set the buffer */
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
+	mutex_unlock(&p->dimm_mutex);
+	return rc;
+}
+DEVICE_ATTR_RO(papr_flags);
+
+/* papr_scm specific dimm attributes */
+static struct attribute *papr_scm_nd_attributes[] = {
+	&dev_attr_papr_flags.attr,
+	NULL,
+};
+
+static struct attribute_group papr_scm_nd_attribute_group = {
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
@@ -330,8 +428,8 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	dimm_flags = 0;
 	set_bit(NDD_ALIASING, &dimm_flags);
 
-	p->nvdimm = nvdimm_create(p->bus, p, NULL, dimm_flags,
-				  PAPR_SCM_DIMM_CMD_MASK, 0, NULL);
+	p->nvdimm = nvdimm_create(p->bus, p, papr_scm_dimm_attr_groups,
+				  dimm_flags, PAPR_SCM_DIMM_CMD_MASK, 0, NULL);
 	if (!p->nvdimm) {
 		dev_err(dev, "Error creating DIMM object for %pOF\n", p->dn);
 		goto err;
@@ -415,6 +513,9 @@ static int papr_scm_probe(struct platform_device *pdev)
 	if (!p)
 		return -ENOMEM;
 
+	/* Initialize the dimm mutex */
+	mutex_init(&p->dimm_mutex);
+
 	/* optional DT properties */
 	of_property_read_u32(dn, "ibm,metadata-size", &metadata_size);
 
-- 
2.24.1

