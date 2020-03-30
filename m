Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8C197AA1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 13:23:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rVSx5t03zDqD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 22:23:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rVB42J96zDqC5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 22:10:36 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UB3mEJ129625
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 07:10:33 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3021vtfjwt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 07:10:33 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Mon, 30 Mar 2020 12:10:18 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 12:10:15 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02UBAQGF63045784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 11:10:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D82EBA4062;
 Mon, 30 Mar 2020 11:10:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ABADA405F;
 Mon, 30 Mar 2020 11:10:24 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.79.185.237])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 11:10:24 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH v3 4/4] powerpc/papr_scm: Implement support for
 DSM_PAPR_SCM_HEALTH
Date: Mon, 30 Mar 2020 16:39:43 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200330110943.214097-1-vaibhav@linux.ibm.com>
References: <20200330110943.214097-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20033011-0020-0000-0000-000003BE33ED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033011-0021-0000-0000-00002216CF14
Message-Id: <20200330110943.214097-5-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300101
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
Cc: Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch implements support for papr_scm command
'DSM_PAPR_SCM_HEALTH' that returns a newly introduced 'struct
nd_papr_scm_dimm_health_stat' instance containing dimm health
information back to user space in response to ND_CMD_CALL. This
functionality is implemented in newly introduced papr_scm_get_health()
that queries the scm-dimm health information and then copies these bitmaps
to the package payload whose layout is defined by 'struct
papr_scm_ndctl_health'.

The patch also introduces a new member a new member 'struct
papr_scm_priv.health' thats an instance of 'struct
nd_papr_scm_dimm_health_stat' to cache the health information of a
scm-dimm. As a result functions drc_pmem_query_health() and
papr_flags_show() are updated to populate and use this new struct
instead of two be64 integers that we earlier used.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

---
Changelog:

v2..v3: Updated struct nd_papr_scm_dimm_health_stat_v1 to use '__xx'
	types as its exported to the userspace [Aneesh]
	Changed the constants DSM_PAPR_SCM_DIMM_XX indicating dimm
	health from enum to #defines [Aneesh]

v1..v2: New patch in the series
---
 arch/powerpc/include/uapi/asm/papr_scm_dsm.h |  40 +++++++
 arch/powerpc/platforms/pseries/papr_scm.c    | 111 ++++++++++++++++---
 2 files changed, 134 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/papr_scm_dsm.h b/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
index c039a49b41b4..8265125304ca 100644
--- a/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
@@ -132,6 +132,7 @@ struct nd_papr_scm_cmd_pkg {
  */
 enum dsm_papr_scm {
 	DSM_PAPR_SCM_MIN =  0x10000,
+	DSM_PAPR_SCM_HEALTH,
 	DSM_PAPR_SCM_MAX,
 };
 
@@ -158,4 +159,43 @@ static void *papr_scm_pcmd_to_payload(struct nd_papr_scm_cmd_pkg *pcmd)
 	else
 		return (void *)((__u8 *) pcmd + pcmd->payload_offset);
 }
+
+/* Various scm-dimm health indicators */
+#define DSM_PAPR_SCM_DIMM_HEALTHY       0
+#define DSM_PAPR_SCM_DIMM_UNHEALTHY     1
+#define DSM_PAPR_SCM_DIMM_CRITICAL      2
+#define DSM_PAPR_SCM_DIMM_FATAL         3
+
+/*
+ * Struct exchanged between kernel & ndctl in for PAPR_DSM_PAPR_SMART_HEALTH
+ * Various bitflags indicate the health status of the dimm.
+ *
+ * dimm_unarmed		: Dimm not armed. So contents wont persist.
+ * dimm_bad_shutdown	: Previous shutdown did not persist contents.
+ * dimm_bad_restore	: Contents from previous shutdown werent restored.
+ * dimm_scrubbed	: Contents of the dimm have been scrubbed.
+ * dimm_locked		: Contents of the dimm cant be modified until CEC reboot
+ * dimm_encrypted	: Contents of dimm are encrypted.
+ * dimm_health		: Dimm health indicator.
+ */
+struct nd_papr_scm_dimm_health_stat_v1 {
+	__u8 dimm_unarmed;
+	__u8 dimm_bad_shutdown;
+	__u8 dimm_bad_restore;
+	__u8 dimm_scrubbed;
+	__u8 dimm_locked;
+	__u8 dimm_encrypted;
+	__u16 dimm_health;
+};
+
+/*
+ * Typedef the current struct for dimm_health so that any application
+ * or kernel recompiled after introducing a new version automatically
+ * supports the new version.
+ */
+#define nd_papr_scm_dimm_health_stat nd_papr_scm_dimm_health_stat_v1
+
+/* Current version number for the dimm health struct */
+#define ND_PAPR_SCM_DIMM_HEALTH_VERSION 1
+
 #endif /* _UAPI_ASM_POWERPC_PAPR_SCM_DSM_H_ */
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 9a2614aaae88..16746d55f0b7 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -47,8 +47,7 @@ struct papr_scm_priv {
 	struct mutex dimm_mutex;
 
 	/* Health information for the dimm */
-	__be64 health_bitmap;
-	__be64 health_bitmap_valid;
+	struct nd_papr_scm_dimm_health_stat health;
 };
 
 static int drc_pmem_bind(struct papr_scm_priv *p)
@@ -158,6 +157,7 @@ static int drc_pmem_query_health(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
 	int64_t rc;
+	__be64 health;
 
 	rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
 	if (rc != H_SUCCESS) {
@@ -172,13 +172,41 @@ static int drc_pmem_query_health(struct papr_scm_priv *p)
 		return rc;
 
 	/* Store the retrieved health information in dimm platform data */
-	p->health_bitmap = ret[0];
-	p->health_bitmap_valid = ret[1];
+	health = ret[0] & ret[1];
 
 	dev_dbg(&p->pdev->dev,
 		"Queried dimm health info. Bitmap:0x%016llx Mask:0x%016llx\n",
-		be64_to_cpu(p->health_bitmap),
-		be64_to_cpu(p->health_bitmap_valid));
+		be64_to_cpu(ret[0]),
+		be64_to_cpu(ret[1]));
+
+	memset(&p->health, 0, sizeof(p->health));
+
+	/* Check for various masks in bitmap and set the buffer */
+	if (health & PAPR_SCM_DIMM_UNARMED_MASK)
+		p->health.dimm_unarmed = true;
+
+	if (health & PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK)
+		p->health.dimm_bad_shutdown = true;
+
+	if (health & PAPR_SCM_DIMM_BAD_RESTORE_MASK)
+		p->health.dimm_bad_restore = true;
+
+	if (health & PAPR_SCM_DIMM_ENCRYPTED)
+		p->health.dimm_encrypted = true;
+
+	if (health & PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED) {
+		p->health.dimm_locked = true;
+		p->health.dimm_scrubbed = true;
+	}
+
+	if (health & PAPR_SCM_DIMM_HEALTH_UNHEALTHY)
+		p->health.dimm_health = DSM_PAPR_SCM_DIMM_UNHEALTHY;
+
+	if (health & PAPR_SCM_DIMM_HEALTH_CRITICAL)
+		p->health.dimm_health = DSM_PAPR_SCM_DIMM_CRITICAL;
+
+	if (health & PAPR_SCM_DIMM_HEALTH_FATAL)
+		p->health.dimm_health = DSM_PAPR_SCM_DIMM_FATAL;
 
 	mutex_unlock(&p->dimm_mutex);
 	return 0;
@@ -340,6 +368,51 @@ static int cmd_to_func(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 	return pkg->hdr.nd_command;
 }
 
+/* Fetch the DIMM health info and populate it in provided package. */
+static int papr_scm_get_health(struct papr_scm_priv *p,
+			       struct nd_papr_scm_cmd_pkg *pkg)
+{
+	int rc;
+	size_t copysize = sizeof(p->health);
+
+	rc = drc_pmem_query_health(p);
+	if (rc)
+		goto out;
+	/*
+	 * If the requested payload version is greater than one we know
+	 * about, return the payload version we know about and let
+	 * caller/userspace handle.
+	 */
+	if (pkg->payload_version > ND_PAPR_SCM_DIMM_HEALTH_VERSION)
+		pkg->payload_version = ND_PAPR_SCM_DIMM_HEALTH_VERSION;
+
+	if (pkg->hdr.nd_size_out < copysize) {
+		dev_dbg(&p->pdev->dev, "%s Payload not large enough\n",
+			__func__);
+		dev_dbg(&p->pdev->dev, "%s Expected %lu, available %u\n",
+			__func__, copysize, pkg->hdr.nd_size_out);
+		rc = -ENOSPC;
+		goto out;
+	}
+
+	dev_dbg(&p->pdev->dev, "%s Copying payload size=%lu version=0x%x\n",
+		__func__, copysize, pkg->payload_version);
+
+	/* Copy a subset of health struct based on copysize */
+	memcpy(papr_scm_pcmd_to_payload(pkg), &p->health, copysize);
+	pkg->hdr.nd_fw_size = copysize;
+
+out:
+	/*
+	 * Put the error in out package and return success from function
+	 * so that errors if any are propogated back to userspace.
+	 */
+	pkg->cmd_status = rc;
+	dev_dbg(&p->pdev->dev, "%s completion code = %d\n", __func__, rc);
+
+	return 0;
+}
+
 int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
 		unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
 {
@@ -385,6 +458,11 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
 		*cmd_rc = 0;
 		break;
 
+	case DSM_PAPR_SCM_HEALTH:
+		call_pkg = nd_to_papr_cmd_pkg(buf);
+		*cmd_rc = papr_scm_get_health(p, call_pkg);
+		break;
+
 	default:
 		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd_in);
 		*cmd_rc = -EINVAL;
@@ -419,7 +497,6 @@ static ssize_t papr_flags_show(struct device *dev,
 {
 	struct nvdimm *dimm = to_nvdimm(dev);
 	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
-	__be64 health;
 	int rc;
 
 	rc = drc_pmem_query_health(p);
@@ -431,26 +508,26 @@ static ssize_t papr_flags_show(struct device *dev,
 	if (rc)
 		return rc;
 
-	health = p->health_bitmap & p->health_bitmap_valid;
-
-	/* Check for various masks in bitmap and set the buffer */
-	if (health & PAPR_SCM_DIMM_UNARMED_MASK)
+	if (p->health.dimm_unarmed)
 		rc += sprintf(buf, "not_armed ");
 
-	if (health & PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK)
+	if (p->health.dimm_bad_shutdown)
 		rc += sprintf(buf + rc, "save_fail ");
 
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
-- 
2.24.1

