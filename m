Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC51B02D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 09:24:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495J9p11XSzDqGN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 17:24:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 495HpJ22WpzDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:07:52 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K728UJ054027
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 03:07:50 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmu6m5b4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 03:07:50 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Mon, 20 Apr 2020 08:07:25 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 08:07:22 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03K77hjF53149854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 07:07:43 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AE13AE056;
 Mon, 20 Apr 2020 07:07:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AAB1AE04D;
 Mon, 20 Apr 2020 07:07:40 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.199.35.142])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 07:07:39 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH v6 4/4] powerpc/papr_scm: Implement support for
 PAPR_SCM_PDSM_HEALTH
Date: Mon, 20 Apr 2020 12:37:11 +0530
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200420070711.223545-1-vaibhav@linux.ibm.com>
References: <20200420070711.223545-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042007-0012-0000-0000-000003A7BF64
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042007-0013-0000-0000-000021E5081B
Message-Id: <20200420070711.223545-5-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_02:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This patch implements support for PDSM request 'PAPR_SCM_PDSM_HEALTH'
that returns a newly introduced 'struct nd_papr_pdsm_health' instance
containing dimm health information back to user space in response to
ND_CMD_CALL. This functionality is implemented in newly introduced
papr_scm_get_health() that queries the scm-dimm health information and
then copies this information to the package payload whose layout is
defined by 'struct nd_papr_pdsm_health'.

The patch also introduces a new member 'struct papr_scm_priv.health'
thats an instance of 'struct nd_papr_pdsm_health' to cache the health
information of a nvdimm. As a result functions drc_pmem_query_health()
and flags_show() are updated to populate and use this new struct
instead of a u64 integer that was earlier used.

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

v5..v6:
* Added attribute '__packed' to 'struct nd_papr_pdsm_health_v1' to
  gaurd against possibility of different compilers adding different
  paddings to the struct [ Dan Williams ]

* Updated 'struct nd_papr_pdsm_health_v1' to use __u8 instead of
  'bool' and also updated drc_pmem_query_health() to take this into
  account. [ Dan Williams ]

v4..v5:
* None

v3..v4:
* Call the DSM_PAPR_SCM_HEALTH service function from
  papr_scm_service_dsm() instead of papr_scm_ndctl(). [Aneesh]

v2..v3:
* Updated struct nd_papr_scm_dimm_health_stat_v1 to use '__xx' types
  as its exported to the userspace [Aneesh]
* Changed the constants DSM_PAPR_SCM_DIMM_XX indicating dimm health
  from enum to #defines [Aneesh]

v1..v2:
* New patch in the series
---
 arch/powerpc/include/uapi/asm/papr_scm_pdsm.h |  39 ++++++
 arch/powerpc/platforms/pseries/papr_scm.c     | 122 +++++++++++++++---
 2 files changed, 145 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
index ec48b5c7fc18..f387ed3958bb 100644
--- a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
@@ -123,6 +123,7 @@ struct nd_pdsm_cmd_pkg {
  */
 enum papr_scm_pdsm {
 	PAPR_SCM_PDSM_MIN = 0x0,
+	PAPR_SCM_PDSM_HEALTH,
 	PAPR_SCM_PDSM_MAX,
 };
 
@@ -150,4 +151,42 @@ static void *pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd)
 		return (void *)((__u8 *) pcmd + pcmd->payload_offset);
 }
 
+/* Various scm-dimm health indicators */
+#define PAPR_PDSM_DIMM_HEALTHY       0
+#define PAPR_PDSM_DIMM_UNHEALTHY     1
+#define PAPR_PDSM_DIMM_CRITICAL      2
+#define PAPR_PDSM_DIMM_FATAL         3
+
+/*
+ * Struct exchanged between kernel & ndctl in for PAPR_SCM_PDSM_HEALTH
+ * Various flags indicate the health status of the dimm.
+ *
+ * dimm_unarmed		: Dimm not armed. So contents wont persist.
+ * dimm_bad_shutdown	: Previous shutdown did not persist contents.
+ * dimm_bad_restore	: Contents from previous shutdown werent restored.
+ * dimm_scrubbed	: Contents of the dimm have been scrubbed.
+ * dimm_locked		: Contents of the dimm cant be modified until CEC reboot
+ * dimm_encrypted	: Contents of dimm are encrypted.
+ * dimm_health		: Dimm health indicator. One of PAPR_PDSM_DIMM_XXXX
+ */
+struct nd_papr_pdsm_health_v1 {
+	__u8 dimm_unarmed;
+	__u8 dimm_bad_shutdown;
+	__u8 dimm_bad_restore;
+	__u8 dimm_scrubbed;
+	__u8 dimm_locked;
+	__u8 dimm_encrypted;
+	__u16 dimm_health;
+} __packed;
+
+/*
+ * Typedef the current struct for dimm_health so that any application
+ * or kernel recompiled after introducing a new version automatically
+ * supports the new version.
+ */
+#define nd_papr_pdsm_health nd_papr_pdsm_health_v1
+
+/* Current version number for the dimm health struct */
+#define ND_PAPR_PDSM_HEALTH_VERSION 1
+
 #endif /* _UAPI_ASM_POWERPC_PAPR_SCM_PDSM_H_ */
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 20da1b837017..dfb02c9e3784 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -50,7 +50,7 @@ struct papr_scm_priv {
 	unsigned long lasthealth_jiffies;
 
 	/* Health information for the dimm */
-	u64 health_bitmap;
+	struct nd_papr_pdsm_health health;
 };
 
 static int drc_pmem_bind(struct papr_scm_priv *p)
@@ -170,6 +170,7 @@ static int drc_pmem_query_health(struct papr_scm_priv *p, bool force)
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
 	s64 rc;
 	unsigned long cache_timeout;
+	u64 health;
 
 	/* Protect concurrent modifications to papr_scm_priv */
 	rc = mutex_lock_interruptible(&p->dimm_mutex);
@@ -196,12 +197,41 @@ static int drc_pmem_query_health(struct papr_scm_priv *p, bool force)
 	}
 
 	p->lasthealth_jiffies = jiffies;
-	p->health_bitmap = ret[0] & ret[1];
+	health = ret[0] & ret[1];
 
 	dev_dbg(&p->pdev->dev,
 		"Queried dimm health info. Bitmap:0x%016lx Mask:0x%016lx\n",
 		ret[0], ret[1]);
 
+	memset(&p->health, 0, sizeof(p->health));
+
+	/* Check for various masks in bitmap and set the buffer */
+	if (health & PAPR_SCM_DIMM_UNARMED_MASK)
+		p->health.dimm_unarmed = 1;
+
+	if (health & PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK)
+		p->health.dimm_bad_shutdown = 1;
+
+	if (health & PAPR_SCM_DIMM_BAD_RESTORE_MASK)
+		p->health.dimm_bad_restore = 1;
+
+	if (health & PAPR_SCM_DIMM_ENCRYPTED)
+		p->health.dimm_encrypted = 1;
+
+	if (health & PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED) {
+		p->health.dimm_locked = 1;
+		p->health.dimm_scrubbed = 1;
+	}
+
+	if (health & PAPR_SCM_DIMM_HEALTH_UNHEALTHY)
+		p->health.dimm_health = PAPR_PDSM_DIMM_UNHEALTHY;
+
+	if (health & PAPR_SCM_DIMM_HEALTH_CRITICAL)
+		p->health.dimm_health = PAPR_PDSM_DIMM_CRITICAL;
+
+	if (health & PAPR_SCM_DIMM_HEALTH_FATAL)
+		p->health.dimm_health = PAPR_PDSM_DIMM_FATAL;
+
 out:
 	mutex_unlock(&p->dimm_mutex);
 	return rc;
@@ -359,6 +389,61 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 	return 0;
 }
 
+/* Fetch the DIMM health info and populate it in provided package. */
+static int papr_scm_get_health(struct papr_scm_priv *p,
+			       struct nd_pdsm_cmd_pkg *pkg)
+{
+	int rc;
+	size_t copysize = sizeof(p->health);
+
+	/* Always fetch upto date dimm health data ignoring cached values */
+	rc = drc_pmem_query_health(p, true);
+	if (rc)
+		goto out;
+	/*
+	 * If the requested payload version is greater than one we know
+	 * about, return the payload version we know about and let
+	 * caller/userspace handle.
+	 */
+	if (pkg->payload_version > ND_PAPR_PDSM_HEALTH_VERSION)
+		pkg->payload_version = ND_PAPR_PDSM_HEALTH_VERSION;
+
+	if (pkg->hdr.nd_size_out < copysize) {
+		dev_dbg(&p->pdev->dev, "Truncated payload (%u). Expected (%lu)",
+			pkg->hdr.nd_size_out, copysize);
+		rc = -ENOSPC;
+		goto out;
+	}
+
+	dev_dbg(&p->pdev->dev, "Copying payload size=%lu version=0x%x\n",
+		copysize, pkg->payload_version);
+
+	/*
+	 * Copy a subset of health struct based on copysize ensuring dimm mutex
+	 * is locked to prevent a simultaneous read/write of health data
+	 */
+	rc = mutex_lock_interruptible(&p->dimm_mutex);
+	if (rc)
+		goto out;
+
+	/* Copy the health struct to the payload */
+	memcpy(pdsm_cmd_to_payload(pkg), &p->health, copysize);
+
+	mutex_unlock(&p->dimm_mutex);
+
+	pkg->hdr.nd_fw_size = copysize;
+
+out:
+	/*
+	 * Put the error in out package and return success from function
+	 * so that errors if any are propogated back to userspace.
+	 */
+	pkg->cmd_status = rc;
+	dev_dbg(&p->pdev->dev, "completion code = %d\n", rc);
+
+	return 0;
+}
+
 static int papr_scm_service_pdsm(struct papr_scm_priv *p,
 				struct nd_pdsm_cmd_pkg *call_pkg)
 {
@@ -373,6 +458,9 @@ static int papr_scm_service_pdsm(struct papr_scm_priv *p,
 
 	/* Depending on the DSM command call appropriate service routine */
 	switch (call_pkg->hdr.nd_command) {
+	case PAPR_SCM_PDSM_HEALTH:
+		return papr_scm_get_health(p, call_pkg);
+
 	default:
 		dev_dbg(&p->pdev->dev, "Unsupported PDSM request 0x%llx\n",
 			call_pkg->hdr.nd_command);
@@ -459,39 +547,41 @@ static ssize_t flags_show(struct device *dev,
 	struct nvdimm *dimm = to_nvdimm(dev);
 	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
 	int rc;
-	u64 health;
 
 	rc = drc_pmem_query_health(p, false);
 	if (rc)
 		return rc;
 
-	/*
-	 * Copy the LE byte-ordered health_bitmap locally, check for various
-	 * masks and update the sysfs out buffer.
-	 */
-	health = p->health_bitmap;
+	/* Protect against concurrent modifications to papr_scm_priv */
+	rc = mutex_lock_interruptible(&p->dimm_mutex);
+	if (rc)
+		return rc;
 
-	if (health & PAPR_SCM_DIMM_UNARMED_MASK)
+	if (p->health.dimm_unarmed)
 		rc += sprintf(buf, "not_armed ");
 
-	if (health & PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK)
-		rc += sprintf(buf + rc, "save_fail ");
+	if (p->health.dimm_bad_shutdown)
+		rc += sprintf(buf + rc, "flush_fail ");
 
-	if (health & PAPR_SCM_DIMM_BAD_RESTORE_MASK)
+	if (p->health.dimm_bad_restore)
 		rc += sprintf(buf + rc, "restore_fail ");
 
-	if (health & PAPR_SCM_DIMM_ENCRYPTED)
+	if (p->health.dimm_encrypted)
 		rc += sprintf(buf + rc, "encrypted ");
 
-	if (health & PAPR_SCM_DIMM_SMART_EVENT_MASK)
+	if (p->health.dimm_health)
 		rc += sprintf(buf + rc, "smart_notify ");
 
-	if (health & PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED)
-		rc += sprintf(buf + rc, "scrubbed locked ");
+	if (p->health.dimm_scrubbed)
+		rc += sprintf(buf + rc, "scrubbed ");
+
+	if (p->health.dimm_locked)
+		rc += sprintf(buf + rc, "locked ");
 
 	if (rc > 0)
 		rc += sprintf(buf + rc, "\n");
 
+	mutex_unlock(&p->dimm_mutex);
 	return rc;
 }
 DEVICE_ATTR_RO(flags);
-- 
2.25.3

