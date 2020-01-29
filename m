Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3C14CDB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:40:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4877412mrjzDqDd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 02:40:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4876pW6pcNzDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 02:29:07 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TFGb93036157
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:29:05 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xtmmxera1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:29:05 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Wed, 29 Jan 2020 15:29:03 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 15:29:00 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TFSxLi39911474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 15:28:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B1CF5204E;
 Wed, 29 Jan 2020 15:28:59 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.195])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A4C8B5204F;
 Wed, 29 Jan 2020 15:28:57 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 5/6] powerpc/papr_scm: Implement support for
 DSM_PAPR_SCM_HEALTH
Date: Wed, 29 Jan 2020 20:58:43 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129152844.71286-1-vaibhav@linux.ibm.com>
References: <20200129152844.71286-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012915-0012-0000-0000-00000381CBAB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012915-0013-0000-0000-000021BE2350
Message-Id: <20200129152844.71286-6-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=821
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1911200001 definitions=main-2001290128
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DSM 'DSM_PAPR_SCM_HEALTH' should return the health-bitmap and
health-valid-bitmap information for a dimm back to userspace in
response to ND_CMD_CALL.

This patch implements this DSM by implementing a new function
papr_scm_get_health() that queries the DIMM health information and
then copies these bitmaps to the package payload whose layout is
defined by 'struct papr_scm_ndctl_health'.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index e1a2c0e61077..6c0bc8f027db 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -33,9 +33,16 @@
  */
 enum {
 	DSM_PAPR_MIN =  0x10000,
+	DSM_PAPR_SCM_HEALTH,
 	DSM_PAPR_MAX,
 };
 
+/* Struct as returned by kernel in response to PAPR_DSM_PAPR_SMART_HEALTH */
+struct papr_scm_ndctl_health {
+	__be64 health_bitmap;
+	__be64 health_bitmap_valid;
+} __packed;
+
 /* Payload expected with ND_CMD_CALL ioctl from libnvdimm */
 struct nd_pkg_papr_scm {
 	struct nd_cmd_pkg hdr;		/* Package header containing sub-cmd */
@@ -369,6 +376,40 @@ static int cmd_to_func(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 	return pkg->hdr.nd_command;
 }
 
+/* Fetch the DIMM health info and populate it in provided papr_scm package */
+static int papr_scm_get_health(struct papr_scm_priv *p,
+			       struct nd_pkg_papr_scm *pkg)
+{
+	int rc;
+	struct papr_scm_ndctl_health *health =
+		(struct papr_scm_ndctl_health *)pkg->payload;
+
+	pkg->hdr.nd_fw_size = sizeof(struct papr_scm_ndctl_health);
+
+	if (pkg->hdr.nd_size_out < sizeof(struct papr_scm_ndctl_health)) {
+		rc = -ENOSPC;
+		goto out;
+	}
+
+	rc = drc_pmem_query_health(p);
+	if (rc)
+		goto out;
+
+	/* Copy the health data to the payload */
+	health->health_bitmap = p->health_bitmap;
+	health->health_bitmap_valid = p->health_bitmap_valid;
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
@@ -414,6 +455,11 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
 		*cmd_rc = 0;
 		break;
 
+	case DSM_PAPR_SCM_HEALTH:
+		call_pkg = (struct nd_pkg_papr_scm *) buf;
+		*cmd_rc = papr_scm_get_health(p, call_pkg);
+		break;
+
 	default:
 		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd_in);
 		*cmd_rc = -EINVAL;
-- 
2.24.1

