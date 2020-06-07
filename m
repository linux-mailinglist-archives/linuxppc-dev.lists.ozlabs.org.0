Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D231F0B72
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 15:32:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49fy482LzlzDqS5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 23:32:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49fxgg6f13zDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jun 2020 23:14:55 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 057D3QlV166080; Sun, 7 Jun 2020 09:14:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g5fb3h5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Jun 2020 09:14:31 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 057D4opd173320;
 Sun, 7 Jun 2020 09:14:31 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g5fb3h5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Jun 2020 09:14:30 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 057D9veO027673;
 Sun, 7 Jun 2020 13:14:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 31g2s7rw07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Jun 2020 13:14:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 057DEPVE51904620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 7 Jun 2020 13:14:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D5A4A4055;
 Sun,  7 Jun 2020 13:14:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39629A4040;
 Sun,  7 Jun 2020 13:14:21 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.68.227])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sun,  7 Jun 2020 13:14:20 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Sun, 07 Jun 2020 18:44:19 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 6/6] powerpc/papr_scm: Implement support for
 PAPR_PDSM_HEALTH
Date: Sun,  7 Jun 2020 18:43:39 +0530
Message-Id: <20200607131339.476036-7-vaibhav@linux.ibm.com>
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
 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 cotscore=-2147483648
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006070100
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

Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

v10..v11:
* Changed the definition of 'struct nd_papr_pdsm_health' to a maximal
  struct 184 bytes in size [ Dan Williams ]
* Added new field 'extension_flags' to 'struct nd_papr_pdsm_health'
  [ Dan Williams ]
* Updated papr_pdsm_health() to set field 'extension_flags' to 0.
* Introduced a define ND_PDSM_PAYLOAD_MAX_SIZE that indicates the
  maximum size of a payload.
* Fixed a suspicious conversion from u64 to u8 in papr_pdsm_health
  that was preventing correct initialization of 'struct
  nd_papr_pdsm_health'. [ Ira ]

v9..v10:
* Removed code in papr_pdsm_health that performed validation on pdsm
  payload version and corrosponding struct and defines used for
  validation of payload version.
* Dropped usage of struct papr_pdsm_health in 'struct
  papr_scm_priv'. Instead papr_psdm_health() now uses
  'papr_scm_priv.health_bitmap' to populate the pdsm payload.
* Above change also fixes the problem where this patch was removing
  the code that was previously introduced in this patch-series.
  [ Ira ]
* Introduced a new def ND_PDSM_ENVELOPE_HDR_SIZE that indicates the
  space allocated to 'struct nd_pdsm_cmd_pkg' fields except 'struct
  nd_cmd_pkg'. This def is useful in validating payload sizes.
* Reworked papr_pdsm_health() to enforce a specific payload size for
  'PAPR_PDSM_HEALTH' pdsm request.

Resend:
* Added ack from Aneesh.

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
 arch/powerpc/include/uapi/asm/papr_pdsm.h | 43 ++++++++++++++
 arch/powerpc/platforms/pseries/papr_scm.c | 71 +++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
index df2447455cfe..12c7aa5ee8bf 100644
--- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
@@ -72,13 +72,56 @@ struct nd_pdsm_cmd_pkg {
 	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
 } __packed;
 
+/* Calculate size used by the pdsm header fields minus 'struct nd_cmd_pkg' */
+#define ND_PDSM_HDR_SIZE \
+	(sizeof(struct nd_pdsm_cmd_pkg) - sizeof(struct nd_cmd_pkg))
+
+/* Max payload size that we can handle */
+#define ND_PDSM_PAYLOAD_MAX_SIZE 184
+
 /*
  * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
  * via 'nd_pdsm_cmd_pkg.hdr.nd_command' member of the ioctl struct
  */
 enum papr_pdsm {
 	PAPR_PDSM_MIN = 0x0,
+	PAPR_PDSM_HEALTH,
 	PAPR_PDSM_MAX,
 };
 
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
+ * extension_flags	: Any extension fields present in the struct.
+ * dimm_unarmed		: Dimm not armed. So contents wont persist.
+ * dimm_bad_shutdown	: Previous shutdown did not persist contents.
+ * dimm_bad_restore	: Contents from previous shutdown werent restored.
+ * dimm_scrubbed	: Contents of the dimm have been scrubbed.
+ * dimm_locked		: Contents of the dimm cant be modified until CEC reboot
+ * dimm_encrypted	: Contents of dimm are encrypted.
+ * dimm_health		: Dimm health indicator. One of PAPR_PDSM_DIMM_XXXX
+ */
+struct nd_papr_pdsm_health {
+	union {
+		struct {
+			__u32 extension_flags;
+			__u8 dimm_unarmed;
+			__u8 dimm_bad_shutdown;
+			__u8 dimm_bad_restore;
+			__u8 dimm_scrubbed;
+			__u8 dimm_locked;
+			__u8 dimm_encrypted;
+			__u16 dimm_health;
+		};
+		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
+	};
+} __packed;
+
 #endif /* _UAPI_ASM_POWERPC_PAPR_PDSM_H_ */
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 167fcf0e249d..047ca6bd26a9 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -436,6 +436,73 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 	return 0;
 }
 
+/* Fetch the DIMM health info and populate it in provided package. */
+static int papr_pdsm_health(struct papr_scm_priv *p,
+			    struct nd_pdsm_cmd_pkg *pkg)
+{
+	int rc;
+	struct nd_papr_pdsm_health health = { 0 };
+	u16 copysize = sizeof(struct nd_papr_pdsm_health);
+	u16 payload_size = pkg->hdr.nd_size_out - ND_PDSM_HDR_SIZE;
+
+	/* Ensure correct payload size that can hold struct nd_papr_pdsm_health */
+	if (payload_size != copysize) {
+		dev_dbg(&p->pdev->dev,
+			"Unexpected payload-size (%u). Expected (%u)",
+			pkg->hdr.nd_size_out, copysize);
+		rc = -ENOSPC;
+		goto out;
+	}
+
+	/* Ensure dimm health mutex is taken preventing concurrent access */
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		goto out;
+
+	/* Always fetch upto date dimm health data ignoring cached values */
+	rc = __drc_pmem_query_health(p);
+	if (rc) {
+		mutex_unlock(&p->health_mutex);
+		goto out;
+	}
+
+	/* update health struct with various flags derived from health bitmap */
+	health = (struct nd_papr_pdsm_health) {
+		.extension_flags = 0,
+		.dimm_unarmed = !!(p->health_bitmap & PAPR_PMEM_UNARMED_MASK),
+		.dimm_bad_shutdown = !!(p->health_bitmap & PAPR_PMEM_BAD_SHUTDOWN_MASK),
+		.dimm_bad_restore = !!(p->health_bitmap & PAPR_PMEM_BAD_RESTORE_MASK),
+		.dimm_encrypted = !!(p->health_bitmap & PAPR_PMEM_ENCRYPTED),
+		.dimm_locked = !!(p->health_bitmap & PAPR_PMEM_SCRUBBED_AND_LOCKED),
+		.dimm_scrubbed = !!(p->health_bitmap & PAPR_PMEM_SCRUBBED_AND_LOCKED),
+		.dimm_health = PAPR_PDSM_DIMM_HEALTHY,
+	};
+
+	/* Update field dimm_health based on health_bitmap flags */
+	if (p->health_bitmap & PAPR_PMEM_HEALTH_FATAL)
+		health.dimm_health = PAPR_PDSM_DIMM_FATAL;
+	else if (p->health_bitmap & PAPR_PMEM_HEALTH_CRITICAL)
+		health.dimm_health = PAPR_PDSM_DIMM_CRITICAL;
+	else if (p->health_bitmap & PAPR_PMEM_HEALTH_UNHEALTHY)
+		health.dimm_health = PAPR_PDSM_DIMM_UNHEALTHY;
+
+	/* struct populated hence can release the mutex now */
+	mutex_unlock(&p->health_mutex);
+
+	dev_dbg(&p->pdev->dev, "Copying payload size=%u\n", copysize);
+
+	/* Copy the health struct to the payload */
+	memcpy(pdsm_cmd_to_payload(pkg), &health, copysize);
+
+	/* Update fw size including size of struct nd_pdsm_cmd_pkg fields */
+	pkg->hdr.nd_fw_size = copysize + ND_PDSM_HDR_SIZE;
+
+out:
+	dev_dbg(&p->pdev->dev, "completion code = %d\n", rc);
+
+	return rc;
+}
+
 /*
  * For a given pdsm request call an appropriate service function.
  * Returns errors if any while handling the pdsm command package.
@@ -449,6 +516,10 @@ static int papr_scm_service_pdsm(struct papr_scm_priv *p,
 
 	/* Call pdsm service function */
 	switch (pdsm) {
+	case PAPR_PDSM_HEALTH:
+		pkg->cmd_status = papr_pdsm_health(p, pkg);
+		break;
+
 	default:
 		dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Unsupported PDSM request\n",
 			pdsm);
-- 
2.26.2

