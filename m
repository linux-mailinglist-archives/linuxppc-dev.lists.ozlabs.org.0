Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59857499297
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 21:23:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjLyp1mfXz3cGG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 07:23:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ccfwYCkd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ccfwYCkd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjLy22RNpz30Nd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 07:22:33 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OJGYMP004898; 
 Mon, 24 Jan 2022 20:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=L5vhJJdJ5D4lRx77Impbudl5/lRh8Gb8GkEuX5GNAJo=;
 b=ccfwYCkd/iAgoW7w6Qh5Tib1wM9ZmJ0O45EYqjLTnWmwVbGwtiX30e0jM4qZ7FLYzHQD
 ix2BSKTqDVEQzKIofjTP0VD1gqBe1pRKdnNjukMRtQUtvDrYUo8UslB6tPMjGa1I/OK9
 kJCP7Muu46qqzMBj3Ya8iH9Ji0dvg8xl6lwvhSWbp5BcBoIMoYTMSVToW34R4Ng4qDFH
 CIgYuCyXnP4OrpC4sJNoxvjSdWqAisjuYoYEy2VD6mCU09TQSPRFicLjX2dgGegEbTam
 mOaP4ZoIs6R/acqGOQp+E76f90j3QnnJxf2oTNS99fKbjSIEhbeAQtXuXSCQ7tcZvkve Rw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dt24k1a64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 20:22:19 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OKHbRj025552;
 Mon, 24 Jan 2022 20:22:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3dr9j96utm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 20:22:16 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OKMCvd41550176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 20:22:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 254B84C04A;
 Mon, 24 Jan 2022 20:22:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A2004C04E;
 Mon, 24 Jan 2022 20:22:09 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.98.202])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 24 Jan 2022 20:22:08 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 01:52:08 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: nvdimm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4] powerpc/papr_scm: Implement initial support for injecting
 smart errors
Date: Tue, 25 Jan 2022 01:52:04 +0530
Message-Id: <20220124202204.1488346-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RBAvJo4G9fLzuT6DpOJ3AHLyI0U4S7Mt
X-Proofpoint-ORIG-GUID: RBAvJo4G9fLzuT6DpOJ3AHLyI0U4S7Mt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240132
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
Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

The patch adds a new member 'health_bitmap_inject_mask' inside struct
papr_scm_priv which is then bitwise ANDed to the health bitmap fetched from the
hypervisor. The value for 'health_bitmap_inject_mask' is accessible from sysfs
at nmemX/papr/health_bitmap_inject.

A new PDSM named 'SMART_INJECT' is proposed that accepts newly
introduced 'struct nd_papr_pdsm_smart_inject' as payload thats
exchanged between libndctl and papr_scm to indicate the requested
smart-error states.

When the processing the PDSM 'SMART_INJECT', papr_pdsm_smart_inject()
constructs a pair or 'inject_mask' and 'clear_mask' bitmaps from the payload
and bit-blt it to the 'health_bitmap_inject_mask'. This ensures the after being
fetched from the hypervisor, the health_bitmap reflects requested smart-error
states.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
Changelog:

Since v3:
* Renamed the sysfs entry from 'health_bitmap_override' to
'health_bitmap_inject'.
* Simplified the variable names and removed the 'health_bitmap_{mask,override}'
members. Instead replaced them with a single 'health_bitmap_inject_mask'
member. [Aneesh]
* Updated the sysfs documentations and commit description.
* Used READ/WRITE_ONCE macros at places where 'health_bitmap_inject_mask' may be
accessed concurrently.

Since v2:
* Rebased the patch to ppc-next
* Added documentation for newly introduced sysfs attribute 'health_bitmap_override'

Since v1:
* Updated the patch description.
* Removed dependency of a header movement patch.
* Removed '__packed' attribute for 'struct nd_papr_pdsm_smart_inject' [Aneesh]
---
 Documentation/ABI/testing/sysfs-bus-papr-pmem | 12 +++
 arch/powerpc/include/uapi/asm/papr_pdsm.h     | 18 ++++
 arch/powerpc/platforms/pseries/papr_scm.c     | 90 ++++++++++++++++++-
 3 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
index 95254cec92bf..4ac0673901e7 100644
--- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
+++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
@@ -61,3 +61,15 @@ Description:
 		* "CchRHCnt" : Cache Read Hit Count
 		* "CchWHCnt" : Cache Write Hit Count
 		* "FastWCnt" : Fast Write Count
+
+What:		/sys/bus/nd/devices/nmemX/papr/health_bitmap_inject
+Date:		Jan, 2022
+KernelVersion:	v5.17
+Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
+Description:
+		(RO) Reports the health bitmap inject bitmap that is applied to
+		bitmap received from PowerVM via the H_SCM_HEALTH. This is used
+		to forcibly set specific bits returned from Hcall. These is then
+		used to simulate various health or shutdown states for an nvdimm
+		and are set by user-space tools like ndctl by issuing a PAPR DSM.
+
diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
index 82488b1e7276..17439925045c 100644
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
index f48e87ac89c9..20aafd387840 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -120,6 +120,10 @@ struct papr_scm_priv {
 
 	/* length of the stat buffer as expected by phyp */
 	size_t stat_buffer_len;
+
+	/* The bits which needs to be overridden */
+	u64 health_bitmap_inject_mask;
+
 };
 
 static int papr_scm_pmem_flush(struct nd_region *nd_region,
@@ -347,19 +351,29 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
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
+	/* Allow injecting specific health bits via inject mask. */
+	if (p->health_bitmap_inject_mask)
+		bitmap = (bitmap & ~p->health_bitmap_inject_mask) |
+			p->health_bitmap_inject_mask;
+	WRITE_ONCE(p->health_bitmap, bitmap);
 	dev_dbg(&p->pdev->dev,
 		"Queried dimm health info. Bitmap:0x%016lx Mask:0x%016lx\n",
 		ret[0], ret[1]);
@@ -669,6 +683,56 @@ static int papr_pdsm_health(struct papr_scm_priv *p,
 	return rc;
 }
 
+/* Inject a smart error Add the dirty-shutdown-counter value to the pdsm */
+static int papr_pdsm_smart_inject(struct papr_scm_priv *p,
+				  union nd_pdsm_payload *payload)
+{
+	int rc;
+	u32 supported_flags = 0;
+	u64 inject_mask = 0, clear_mask = 0;
+	u64 mask;
+
+	/* Check for individual smart error flags and update inject/clear masks */
+	if (payload->smart_inject.flags & PDSM_SMART_INJECT_HEALTH_FATAL) {
+		supported_flags |= PDSM_SMART_INJECT_HEALTH_FATAL;
+		if (payload->smart_inject.fatal_enable)
+			inject_mask |= PAPR_PMEM_HEALTH_FATAL;
+		else
+			clear_mask |= PAPR_PMEM_HEALTH_FATAL;
+	}
+
+	if (payload->smart_inject.flags & PDSM_SMART_INJECT_BAD_SHUTDOWN) {
+		supported_flags |= PDSM_SMART_INJECT_BAD_SHUTDOWN;
+		if (payload->smart_inject.unsafe_shutdown_enable)
+			inject_mask |= PAPR_PMEM_SHUTDOWN_DIRTY;
+		else
+			clear_mask |= PAPR_PMEM_SHUTDOWN_DIRTY;
+	}
+
+	dev_dbg(&p->pdev->dev, "[Smart-inject] inject_mask=%#llx clear_mask=%#llx\n",
+		inject_mask, clear_mask);
+
+	/* Prevent concurrent access to dimm health bitmap related members */
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		return rc;
+
+	/* Use inject/clear masks to set health_bitmap_inject_mask */
+	mask = READ_ONCE(p->health_bitmap_inject_mask);
+	mask = (mask & ~clear_mask) | inject_mask;
+	WRITE_ONCE(p->health_bitmap_inject_mask, mask);
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
@@ -702,6 +766,12 @@ static const struct pdsm_cmd_desc __pdsm_cmd_descriptors[] = {
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
@@ -838,6 +908,19 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 	return 0;
 }
 
+static ssize_t health_bitmap_inject_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+
+	return sprintf(buf, "%#llx\n",
+		       READ_ONCE(p->health_bitmap_inject_mask));
+}
+
+static DEVICE_ATTR_ADMIN_RO(health_bitmap_inject);
+
 static ssize_t perf_stats_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
@@ -952,6 +1035,7 @@ static struct attribute *papr_nd_attributes[] = {
 	&dev_attr_flags.attr,
 	&dev_attr_perf_stats.attr,
 	&dev_attr_dirty_shutdown.attr,
+	&dev_attr_health_bitmap_inject.attr,
 	NULL,
 };
 
-- 
2.34.1

