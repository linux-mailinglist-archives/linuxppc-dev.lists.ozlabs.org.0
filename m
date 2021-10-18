Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC154311CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 10:04:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXqC60tZcz2yp5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 19:04:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yb3wDHGR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Yb3wDHGR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXqBN1Lf9z2xt0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:03:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I768hi005308; 
 Mon, 18 Oct 2021 04:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=dYaN3tu//UuZqEHD/BlY46Y2GB276sz0hgONTFCSLYE=;
 b=Yb3wDHGRdEnpSNWtXrMDDT+jIOtAjKnrlX5eXlnlHvQLu5hyv+b5CzQf9HHXFKDqc4Az
 ZVbl3OelN5Diylkf9r4E5CM3i6ZxQXmC1NKwUtKdySMCRj7D6nLMT25qHHudr+pPNOYX
 PRtB7v4OM1qEklg1MxicD0QkIaaxK/e3z3mkop0bp4DZ0s3ysI9WZXWBkJTXi3+vZzHV
 EqZUn9wrmpfG576amhkXdNcDFdnTQn2B+PQa/J1mIq+TV8DOWCvIL1qvArmJId0pMs3Q
 H/rMxaHKsB0rnNVxjnLqNyoenVKGLFnlvRuja7Ox8t3qv54BvzgB+uTp/QWwyA5MnRfF JQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3brpe9wh6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 04:03:09 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19I7vk9O007107;
 Mon, 18 Oct 2021 08:03:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3bqpc9bq9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 08:03:07 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19I833nU43909376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 08:03:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D035342049;
 Mon, 18 Oct 2021 08:03:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EA164205C;
 Mon, 18 Oct 2021 08:03:02 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 08:03:02 +0000 (GMT)
Subject: [REPORT PATCH v2] powerpc/papr_scm: Implement initial support for
 injecting smart errors
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: nvdimm@lists.linux.dev
Date: Mon, 18 Oct 2021 03:03:01 -0500
Message-ID: <163454413069.430835.6744345523708914645.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/1.1+40.g1b20
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dXsWR4srgYsudivIwqBUJEzagper86zj
X-Proofpoint-ORIG-GUID: dXsWR4srgYsudivIwqBUJEzagper86zj
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1011 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180050
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
Cc: sbhat@linux.ibm.com, aneesh.kumar@linux.ibm.com, vaibhav@linux.ibm.com,
 dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vaibhav Jain <vaibhav@linux.ibm.com>

Presently PAPR doesn't support injecting smart errors on an
NVDIMM. This makes testing the NVDIMM health reporting functionality
difficult as simulating NVDIMM health related events need a hacked up
qemu version.

To solve this problem this patch proposes simulating certain set of
NVDIMM health related events in papr_scm. Specifically 'fatal' health
state and 'dirty' shutdown state. These error can be injected via the
user-space 'ndctl-inject-smart(1)' command. With the proposed patch and
corresponding ndctl patches following command flow is expected:

$ sudo ndctl list -DH -d nmem0
...
      "health_state":"ok",
      "shutdown_state":"clean",
...
 # inject unsafe shutdown and fatal health error
$ sudo ndctl inject-smart nmem0 -Uf
...
      "health_state":"fatal",
      "shutdown_state":"dirty",
...
 # uninject all errors
$ sudo ndctl inject-smart nmem0 -N
...
      "health_state":"ok",
      "shutdown_state":"clean",
...

The patch adds two members 'health_bitmap_mask' and
'health_bitmap_override' inside struct papr_scm_priv which are then
bit blt'ed to the health bitmaps fetched from the hypervisor. In case
we are not able to fetch health information from the hypervisor we
service the health bitmap from these two members. These members are
accessible from sysfs at nmemX/papr/health_bitmap_override

A new PDSM named 'SMART_INJECT' is proposed that accepts newly
introduced 'struct nd_papr_pdsm_smart_inject' as payload thats
exchanged between libndctl and papr_scm to indicate the requested
smart-error states.

When the processing the PDSM 'SMART_INJECT', papr_pdsm_smart_inject()
constructs a pair or 'mask' and 'override' bitmaps from the payload
and bit-blt it to the 'health_bitmap_{mask, override}' members. This
ensures the after being fetched from the hypervisor, the health_bitmap
reflects requested smart-error states.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
Changelog:

Since v1:
Link: https://patchwork.kernel.org/project/linux-nvdimm/list/?series=513881
* Updated the patch description.
* Removed dependency of a header movement patch.
* Removed '__packed' attribute for 'struct nd_papr_pdsm_smart_inject' [Aneesh]

 arch/powerpc/include/uapi/asm/papr_pdsm.h |   18 ++++++
 arch/powerpc/platforms/pseries/papr_scm.c |   94 ++++++++++++++++++++++++++++-
 2 files changed, 109 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
index 82488b1e7276e..17439925045cf 100644
--- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
@@ -116,6 +116,22 @@ struct nd_papr_pdsm_health {
 	};
 };
 
+/* Flags for injecting specific smart errors */
+#define PDSM_SMART_INJECT_HEALTH_FATAL		(1 << 0)
+#define PDSM_SMART_INJECT_BAD_SHUTDOWN		(1 << 1)
+
+struct nd_papr_pdsm_smart_inject {
+	union {
+		struct {
+			/* One or more of PDSM_SMART_INJECT_ */
+			__u32 flags;
+			__u8 fatal_enable;
+			__u8 unsafe_shutdown_enable;
+		};
+		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
+	};
+};
+
 /*
  * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
  * via 'nd_cmd_pkg.nd_command' member of the ioctl struct
@@ -123,12 +139,14 @@ struct nd_papr_pdsm_health {
 enum papr_pdsm {
 	PAPR_PDSM_MIN = 0x0,
 	PAPR_PDSM_HEALTH,
+	PAPR_PDSM_SMART_INJECT,
 	PAPR_PDSM_MAX,
 };
 
 /* Maximal union that can hold all possible payload types */
 union nd_pdsm_payload {
 	struct nd_papr_pdsm_health health;
+	struct nd_papr_pdsm_smart_inject smart_inject;
 	__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
 } __packed;
 
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f48e87ac89c9b..de4cf329cfb3b 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -68,6 +68,10 @@
 #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
 #define PAPR_SCM_PERF_STATS_VERSION 0x1
 
+/* Use bitblt method to override specific bits in the '_bitmap_' */
+#define BITBLT_BITMAP(_bitmap_, _mask_, _override_)		\
+	(((_bitmap_) & ~(_mask_)) | ((_mask_) & (_override_)))
+
 /* Struct holding a single performance metric */
 struct papr_scm_perf_stat {
 	u8 stat_id[8];
@@ -120,6 +124,12 @@ struct papr_scm_priv {
 
 	/* length of the stat buffer as expected by phyp */
 	size_t stat_buffer_len;
+
+	/* The bits which needs to be overridden */
+	u64 health_bitmap_mask;
+
+	/* The overridden values for the bits having the masks set */
+	u64 health_bitmap_override;
 };
 
 static int papr_scm_pmem_flush(struct nd_region *nd_region,
@@ -347,19 +357,28 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 static int __drc_pmem_query_health(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	u64 bitmap = 0;
 	long rc;
 
 	/* issue the hcall */
 	rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
-	if (rc != H_SUCCESS) {
+	if (rc == H_SUCCESS)
+		bitmap = ret[0] & ret[1];
+	else if (rc == H_FUNCTION)
+		dev_info_once(&p->pdev->dev,
+			      "Hcall H_SCM_HEALTH not implemented, assuming empty health bitmap");
+	else {
+
 		dev_err(&p->pdev->dev,
 			"Failed to query health information, Err:%ld\n", rc);
 		return -ENXIO;
 	}
 
 	p->lasthealth_jiffies = jiffies;
-	p->health_bitmap = ret[0] & ret[1];
-
+	/* Allow overriding specific health bits via bit blt. */
+	bitmap = BITBLT_BITMAP(bitmap, p->health_bitmap_mask,
+			       p->health_bitmap_override);
+	WRITE_ONCE(p->health_bitmap, bitmap);
 	dev_dbg(&p->pdev->dev,
 		"Queried dimm health info. Bitmap:0x%016lx Mask:0x%016lx\n",
 		ret[0], ret[1]);
@@ -669,6 +688,54 @@ static int papr_pdsm_health(struct papr_scm_priv *p,
 	return rc;
 }
 
+/* Inject a smart error Add the dirty-shutdown-counter value to the pdsm */
+static int papr_pdsm_smart_inject(struct papr_scm_priv *p,
+				  union nd_pdsm_payload *payload)
+{
+	int rc;
+	u32 supported_flags = 0;
+	u64 mask = 0, override = 0;
+
+	/* Check for individual smart error flags and update mask and override */
+	if (payload->smart_inject.flags & PDSM_SMART_INJECT_HEALTH_FATAL) {
+		supported_flags |= PDSM_SMART_INJECT_HEALTH_FATAL;
+		mask |= PAPR_PMEM_HEALTH_FATAL;
+		override |= payload->smart_inject.fatal_enable ?
+			PAPR_PMEM_HEALTH_FATAL : 0;
+	}
+
+	if (payload->smart_inject.flags & PDSM_SMART_INJECT_BAD_SHUTDOWN) {
+		supported_flags |= PDSM_SMART_INJECT_BAD_SHUTDOWN;
+		mask |= PAPR_PMEM_SHUTDOWN_DIRTY;
+		override |= payload->smart_inject.unsafe_shutdown_enable ?
+			PAPR_PMEM_SHUTDOWN_DIRTY : 0;
+	}
+
+	dev_dbg(&p->pdev->dev, "[Smart-inject] Mask=%#llx override=%#llx\n",
+		mask, override);
+
+	/* Prevent concurrent access to dimm health bitmap related members */
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		return rc;
+
+	/* Bitblt mask/override to corrosponding health_bitmap couterparts */
+	p->health_bitmap_mask = BITBLT_BITMAP(p->health_bitmap_mask,
+					      mask, override);
+	p->health_bitmap_override = BITBLT_BITMAP(p->health_bitmap_override,
+						  mask, override);
+
+	/* Invalidate cached health bitmap */
+	p->lasthealth_jiffies = 0;
+
+	mutex_unlock(&p->health_mutex);
+
+	/* Return the supported flags back to userspace */
+	payload->smart_inject.flags = supported_flags;
+
+	return sizeof(struct nd_papr_pdsm_health);
+}
+
 /*
  * 'struct pdsm_cmd_desc'
  * Identifies supported PDSMs' expected length of in/out payloads
@@ -702,6 +769,12 @@ static const struct pdsm_cmd_desc __pdsm_cmd_descriptors[] = {
 		.size_out = sizeof(struct nd_papr_pdsm_health),
 		.service = papr_pdsm_health,
 	},
+
+	[PAPR_PDSM_SMART_INJECT] = {
+		.size_in = sizeof(struct nd_papr_pdsm_smart_inject),
+		.size_out = sizeof(struct nd_papr_pdsm_smart_inject),
+		.service = papr_pdsm_smart_inject,
+	},
 	/* Empty */
 	[PAPR_PDSM_MAX] = {
 		.size_in = 0,
@@ -838,6 +911,20 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 	return 0;
 }
 
+static ssize_t health_bitmap_override_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+
+	return sprintf(buf, "mask=%#llx override=%#llx\n",
+		       READ_ONCE(p->health_bitmap_mask),
+		       READ_ONCE(p->health_bitmap_override));
+}
+
+static DEVICE_ATTR_ADMIN_RO(health_bitmap_override);
+
 static ssize_t perf_stats_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
@@ -952,6 +1039,7 @@ static struct attribute *papr_nd_attributes[] = {
 	&dev_attr_flags.attr,
 	&dev_attr_perf_stats.attr,
 	&dev_attr_dirty_shutdown.attr,
+	&dev_attr_health_bitmap_override.attr,
 	NULL,
 };
 


