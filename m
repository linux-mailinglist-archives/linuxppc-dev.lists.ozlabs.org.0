Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BD165B2E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 11:11:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NVjW3w32zDqCl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 21:11:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NVRL2JX6zDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 20:58:54 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01K9w1DH125795
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 04:58:51 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y99pfm3bm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 04:58:51 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Thu, 20 Feb 2020 09:58:49 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 09:58:47 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01K9wiib55640096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 09:58:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02AFEA4051;
 Thu, 20 Feb 2020 09:58:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89F97A4040;
 Thu, 20 Feb 2020 09:58:41 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.199.53.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 09:58:41 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/8] powerpc/papr_scm: Re-implement 'papr_flags' using
 'nd_papr_scm_dimm_health_stat'
Date: Thu, 20 Feb 2020 15:28:04 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220095805.197229-1-vaibhav@linux.ibm.com>
References: <20200220095805.197229-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022009-0020-0000-0000-000003ABDE17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022009-0021-0000-0000-00002203E2C8
Message-Id: <20200220095805.197229-8-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_02:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=873
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
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

Previous commit [1] introduced 'struct nd_papr_scm_dimm_health_stat' for
communicating health status of an nvdimm to libndctl. This struct
however can also be used to cache the nvdimm health information in
'struct papr_scm_priv' instead of two '__be64' values. Benefit of this
re-factoring will be apparent when support for libndctl being able to
request nvdimm health stats is implemented where we can simply memcpy
this struct over to the user-space provided payload envelope.

Hence this patch introduces a new member 'struct papr_scm_priv.health'
that caches the health information of a dimm. This member is populated
inside drc_pmem_query_health() which checks for the various bit flags
returned from H_SCM_HEALTH and sets them in this struct. We also
re-factor 'papr_flags' sysfs attribute show function papr_flags_show()
to use the flags in 'struct papr_scm_priv.health' to return
appropriate status strings pertaining to dimm health.

This patch shouldn't introduce any behavioral change.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 61 ++++++++++++++++-------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index d5eea2f38fa6..29f38246c59f 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -47,8 +47,7 @@ struct papr_scm_priv {
 	struct mutex dimm_mutex;
 
 	/* Health information for the dimm */
-	__be64 health_bitmap;
-	__be64 health_bitmap_valid;
+	struct nd_papr_scm_dimm_health_stat health;
 
 	/* length of the stat buffer as expected by phyp */
 	size_t len_stat_buffer;
@@ -205,6 +204,7 @@ static int drc_pmem_query_health(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
 	int64_t rc;
+	__be64 health;
 
 	rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
 	if (rc != H_SUCCESS) {
@@ -219,13 +219,41 @@ static int drc_pmem_query_health(struct papr_scm_priv *p)
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
@@ -513,7 +541,6 @@ static ssize_t papr_flags_show(struct device *dev,
 {
 	struct nvdimm *dimm = to_nvdimm(dev);
 	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
-	__be64 health;
 	int rc;
 
 	rc = drc_pmem_query_health(p);
@@ -525,26 +552,26 @@ static ssize_t papr_flags_show(struct device *dev,
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

