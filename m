Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50F1E8AEC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 00:06:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YdvD6VPfzDqmF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 08:06:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YdVb5KMRzDqVm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 07:48:39 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04TLWYXC150886; Fri, 29 May 2020 17:48:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31awu5fbr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 17:48:06 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04TLXHK5155521;
 Fri, 29 May 2020 17:48:06 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31awu5fbp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 17:48:05 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04TLjp3E015033;
 Fri, 29 May 2020 21:48:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 316uf8n7d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 21:48:03 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04TLm0xS58458156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 21:48:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61872A404D;
 Fri, 29 May 2020 21:48:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E142A4040;
 Fri, 29 May 2020 21:47:56 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.199.34.115])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 29 May 2020 21:47:56 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Sat, 30 May 2020 03:17:55 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/5] powerpc/papr_scm: Implement support for
 PAPR_PDSM_HEALTH
Date: Sat, 30 May 2020 03:17:19 +0530
Message-Id: <20200529214719.223344-6-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529214719.223344-1-vaibhav@linux.ibm.com>
References: <20200529214719.223344-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_10:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 cotscore=-2147483648 adultscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290153
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

This patch implements support for PDSM request 'PAPR_PDSM_HEALTH'
that returns a newly introduced 'struct nd_papr_pdsm_health' instance
containing dimm health information back to user space in response to
ND_CMD_CALL. This functionality is implemented in newly introduced
papr_pdsm_health() that queries the nvdimm health information and
then copies this information to the package payload whose layout is
defined by 'struct nd_papr_pdsm_health'.

The patch also introduces a new member 'struct papr_scm_priv.health'
thats an instance of 'struct nd_papr_pdsm_health' to cache the health
information of a nvdimm. As a result functions drc_pmem_query_health()
and flags_show() are updated to populate and use this new struct
instead of a u64 integer that was earlier used.

Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

v8..v9:
* s/PAPR_SCM_PDSM_HEALTH/PAPR_PDSM_HEALTH/g  [ Dan , Aneesh ]
* s/PAPR_SCM_PSDM_DIMM_*/PAPR_PDSM_DIMM_*/g
* Renamed papr_scm_get_health() to papr_psdm_health()
* Updated patch description to replace papr-scm dimm with nvdimm.

v7..v8:
* None

Resend:
* None

v6..v7:
* Updated flags_show() to use seq_buf_printf(). [Mpe]
* Updated papr_scm_get_health() to use newly introduced
  __drc_pmem_query_health() bypassing the cache [Mpe].

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
 arch/powerpc/include/uapi/asm/papr_pdsm.h |  39 +++++++
 arch/powerpc/platforms/pseries/papr_scm.c | 125 +++++++++++++++++++---
 2 files changed, 147 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
index 6407fefcc007..411725a91591 100644
--- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
@@ -115,6 +115,7 @@ struct nd_pdsm_cmd_pkg {
  */
 enum papr_pdsm {
 	PAPR_PDSM_MIN = 0x0,
+	PAPR_PDSM_HEALTH,
 	PAPR_PDSM_MAX,
 };
 
@@ -133,4 +134,42 @@ static inline void *pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd)
 		return (void *)(pcmd->payload);
 }
 
+/* Various nvdimm health indicators */
+#define PAPR_PDSM_DIMM_HEALTHY       0
+#define PAPR_PDSM_DIMM_UNHEALTHY     1
+#define PAPR_PDSM_DIMM_CRITICAL      2
+#define PAPR_PDSM_DIMM_FATAL         3
+
+/*
+ * Struct exchanged between kernel & ndctl in for PAPR_PDSM_HEALTH
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
 #endif /* _UAPI_ASM_POWERPC_PAPR_PDSM_H_ */
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 5e2237e7ec08..c0606c0c659c 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -88,7 +88,7 @@ struct papr_scm_priv {
 	unsigned long lasthealth_jiffies;
 
 	/* Health information for the dimm */
-	u64 health_bitmap;
+	struct nd_papr_pdsm_health health;
 };
 
 static int drc_pmem_bind(struct papr_scm_priv *p)
@@ -201,6 +201,7 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
 static int __drc_pmem_query_health(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	u64 health;
 	long rc;
 
 	/* issue the hcall */
@@ -208,18 +209,46 @@ static int __drc_pmem_query_health(struct papr_scm_priv *p)
 	if (rc != H_SUCCESS) {
 		dev_err(&p->pdev->dev,
 			 "Failed to query health information, Err:%ld\n", rc);
-		rc = -ENXIO;
-		goto out;
+		return -ENXIO;
 	}
 
 	p->lasthealth_jiffies = jiffies;
-	p->health_bitmap = ret[0] & ret[1];
+	health = ret[0] & ret[1];
 
 	dev_dbg(&p->pdev->dev,
 		"Queried dimm health info. Bitmap:0x%016lx Mask:0x%016lx\n",
 		ret[0], ret[1]);
-out:
-	return rc;
+
+	memset(&p->health, 0, sizeof(p->health));
+
+	/* Check for various masks in bitmap and set the buffer */
+	if (health & PAPR_PMEM_UNARMED_MASK)
+		p->health.dimm_unarmed = 1;
+
+	if (health & PAPR_PMEM_BAD_SHUTDOWN_MASK)
+		p->health.dimm_bad_shutdown = 1;
+
+	if (health & PAPR_PMEM_BAD_RESTORE_MASK)
+		p->health.dimm_bad_restore = 1;
+
+	if (health & PAPR_PMEM_ENCRYPTED)
+		p->health.dimm_encrypted = 1;
+
+	if (health & PAPR_PMEM_SCRUBBED_AND_LOCKED) {
+		p->health.dimm_locked = 1;
+		p->health.dimm_scrubbed = 1;
+	}
+
+	if (health & PAPR_PMEM_HEALTH_UNHEALTHY)
+		p->health.dimm_health = PAPR_PDSM_DIMM_UNHEALTHY;
+
+	if (health & PAPR_PMEM_HEALTH_CRITICAL)
+		p->health.dimm_health = PAPR_PDSM_DIMM_CRITICAL;
+
+	if (health & PAPR_PMEM_HEALTH_FATAL)
+		p->health.dimm_health = PAPR_PDSM_DIMM_FATAL;
+
+	return 0;
 }
 
 /* Min interval in seconds for assuming stable dimm health */
@@ -403,6 +432,58 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 	return 0;
 }
 
+/* Fetch the DIMM health info and populate it in provided package. */
+static int papr_pdsm_health(struct papr_scm_priv *p,
+			       struct nd_pdsm_cmd_pkg *pkg)
+{
+	int rc;
+	size_t copysize = sizeof(p->health);
+
+	/* Ensure dimm health mutex is taken preventing concurrent access */
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		goto out;
+
+	/* Always fetch upto date dimm health data ignoring cached values */
+	rc = __drc_pmem_query_health(p);
+	if (rc)
+		goto out_unlock;
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
+		goto out_unlock;
+	}
+
+	dev_dbg(&p->pdev->dev, "Copying payload size=%lu version=0x%x\n",
+		copysize, pkg->payload_version);
+
+	/* Copy the health struct to the payload */
+	memcpy(pdsm_cmd_to_payload(pkg), &p->health, copysize);
+	pkg->hdr.nd_fw_size = copysize;
+
+out_unlock:
+	mutex_unlock(&p->health_mutex);
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
@@ -417,6 +498,9 @@ static int papr_scm_service_pdsm(struct papr_scm_priv *p,
 
 	/* Depending on the DSM command call appropriate service routine */
 	switch (call_pkg->hdr.nd_command) {
+	case PAPR_PDSM_HEALTH:
+		return papr_pdsm_health(p, call_pkg);
+
 	default:
 		dev_dbg(&p->pdev->dev, "Unsupported PDSM request 0x%llx\n",
 			call_pkg->hdr.nd_command);
@@ -485,34 +569,41 @@ static ssize_t flags_show(struct device *dev,
 	struct nvdimm *dimm = to_nvdimm(dev);
 	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
 	struct seq_buf s;
-	u64 health;
 	int rc;
 
 	rc = drc_pmem_query_health(p);
 	if (rc)
 		return rc;
 
-	/* Copy health_bitmap locally, check masks & update out buffer */
-	health = READ_ONCE(p->health_bitmap);
-
 	seq_buf_init(&s, buf, PAGE_SIZE);
-	if (health & PAPR_PMEM_UNARMED_MASK)
+
+	/* Protect concurrent modifications to papr_scm_priv */
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		return rc;
+
+	if (p->health.dimm_unarmed)
 		seq_buf_printf(&s, "not_armed ");
 
-	if (health & PAPR_PMEM_BAD_SHUTDOWN_MASK)
+	if (p->health.dimm_bad_shutdown)
 		seq_buf_printf(&s, "flush_fail ");
 
-	if (health & PAPR_PMEM_BAD_RESTORE_MASK)
+	if (p->health.dimm_bad_restore)
 		seq_buf_printf(&s, "restore_fail ");
 
-	if (health & PAPR_PMEM_ENCRYPTED)
+	if (p->health.dimm_encrypted)
 		seq_buf_printf(&s, "encrypted ");
 
-	if (health & PAPR_PMEM_SMART_EVENT_MASK)
+	if (p->health.dimm_health)
 		seq_buf_printf(&s, "smart_notify ");
 
-	if (health & PAPR_PMEM_SCRUBBED_AND_LOCKED)
-		seq_buf_printf(&s, "scrubbed locked ");
+	if (p->health.dimm_scrubbed)
+		seq_buf_printf(&s, "scrubbed ");
+
+	if (p->health.dimm_locked)
+		seq_buf_printf(&s, "locked ");
+
+	mutex_unlock(&p->health_mutex);
 
 	if (seq_buf_used(&s))
 		seq_buf_printf(&s, "\n");
-- 
2.26.2

