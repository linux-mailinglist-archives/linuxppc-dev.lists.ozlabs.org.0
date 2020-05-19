Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 848211DA102
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 21:29:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RQv570LczDqbf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 05:29:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RQRR1yh6zDqnc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 05:09:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04JJ3pHp026184; Tue, 19 May 2020 15:08:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312c64sut1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 15:08:47 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04JJ7mUk040988;
 Tue, 19 May 2020 15:08:47 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312c64susc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 15:08:46 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04JJ12RG004538;
 Tue, 19 May 2020 19:01:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 313x4xgw38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 19:01:31 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04JJ1S2N64553134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2020 19:01:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B995E52057;
 Tue, 19 May 2020 19:01:28 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.89.230])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 653415204E;
 Tue, 19 May 2020 19:01:25 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Wed, 20 May 2020 00:31:24 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v7 5/5] powerpc/papr_scm: Implement support for
 PAPR_SCM_PDSM_HEALTH
Date: Wed, 20 May 2020 00:30:58 +0530
Message-Id: <20200519190058.257981-6-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519190058.257981-1-vaibhav@linux.ibm.com>
References: <20200519190058.257981-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_08:2020-05-19,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 cotscore=-2147483648
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005190157
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
 arch/powerpc/include/uapi/asm/papr_scm_pdsm.h |  39 ++++++
 arch/powerpc/platforms/pseries/papr_scm.c     | 125 +++++++++++++++---
 2 files changed, 147 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
index 671693439c1c..db0cf550dabe 100644
--- a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
@@ -113,6 +113,7 @@ struct nd_pdsm_cmd_pkg {
  */
 enum papr_scm_pdsm {
 	PAPR_SCM_PDSM_MIN = 0x0,
+	PAPR_SCM_PDSM_HEALTH,
 	PAPR_SCM_PDSM_MAX,
 };
 
@@ -131,4 +132,42 @@ static inline void *pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd)
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
index ed4b49a6f1e1..c59bf17ad054 100644
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
 	s64 rc;
 
 	/* issue the hcall */
@@ -208,18 +209,46 @@ static int __drc_pmem_query_health(struct papr_scm_priv *p)
 	if (rc != H_SUCCESS) {
 		dev_err(&p->pdev->dev,
 			 "Failed to query health information, Err:%lld\n", rc);
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
+	return 0;
 }
 
 /* Min interval in seconds for assuming stable dimm health */
@@ -403,6 +432,58 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 	return 0;
 }
 
+/* Fetch the DIMM health info and populate it in provided package. */
+static int papr_scm_get_health(struct papr_scm_priv *p,
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
+	case PAPR_SCM_PDSM_HEALTH:
+		return papr_scm_get_health(p, call_pkg);
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
-	if (health & PAPR_SCM_DIMM_UNARMED_MASK)
+
+	/* Protect concurrent modifications to papr_scm_priv */
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		return rc;
+
+	if (p->health.dimm_unarmed)
 		seq_buf_printf(&s, "not_armed ");
 
-	if (health & PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK)
+	if (p->health.dimm_bad_shutdown)
 		seq_buf_printf(&s, "flush_fail ");
 
-	if (health & PAPR_SCM_DIMM_BAD_RESTORE_MASK)
+	if (p->health.dimm_bad_restore)
 		seq_buf_printf(&s, "restore_fail ");
 
-	if (health & PAPR_SCM_DIMM_ENCRYPTED)
+	if (p->health.dimm_encrypted)
 		seq_buf_printf(&s, "encrypted ");
 
-	if (health & PAPR_SCM_DIMM_SMART_EVENT_MASK)
+	if (p->health.dimm_health)
 		seq_buf_printf(&s, "smart_notify ");
 
-	if (health & PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED)
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

