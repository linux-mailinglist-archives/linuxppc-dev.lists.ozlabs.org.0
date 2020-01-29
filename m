Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FEA14CDBA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:42:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48776D17m7zDqV9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 02:42:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4876pY3trFzDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 02:29:09 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TFErg1027301
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:29:07 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xtpmt5are-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:29:07 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Wed, 29 Jan 2020 15:29:04 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 15:29:02 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TFT08E39977078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 15:29:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA7F752050;
 Wed, 29 Jan 2020 15:29:00 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.195])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6AF125204E;
 Wed, 29 Jan 2020 15:28:59 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 6/6] powerpc/papr_scm: Implement support for
 DSM_PAPR_SCM_STATS
Date: Wed, 29 Jan 2020 20:58:44 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129152844.71286-1-vaibhav@linux.ibm.com>
References: <20200129152844.71286-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012915-0008-0000-0000-0000034DD43E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012915-0009-0000-0000-00004A6E519B
Message-Id: <20200129152844.71286-7-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290128
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

The DSM 'DSM_PAPR_SCM_STATS' should return the PAPR defined buffer
that holds various dimm performance attributes as defined in Ref[1]
back to user-space in response to ND_CMD_CALL.

Presently the module doesn't interpret nor consume these stat as they
are only intended to be consumer and reported by
'libndctl'[2]. PAPR sped [1] states that input buffer to be provided
to H_SCM_PERFORMANCE_HEALTH hcall should be 4KiB in size. However due
to limitations of the libnvdimm envelop (which is 256 bytes in size)
such a large buffer cannot be copied back to user-space.

Hence we do an optimization of querying the size of the output buffer
from H_SCM_PERFORMANCE_HEALTH hcall and copy only the needed portion
of the buffer to the user-space payload package.

This patch implements this DSM by implementing a new function
papr_scm_get_stats that queries the DIMM stat information and then
copies PHYP provided buffer that holds these stat attributes to the
package payload whose layout is defined by 'struct
papr_scm_perf_stats'

References:
[1]: https://patchwork.ozlabs.org/patch/1154292/
[2]: https://github.com/pmem/ndctl

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 51 +++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 6c0bc8f027db..ac50968453b0 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -34,6 +34,7 @@
 enum {
 	DSM_PAPR_MIN =  0x10000,
 	DSM_PAPR_SCM_HEALTH,
+	DSM_PAPR_SCM_STATS,
 	DSM_PAPR_MAX,
 };
 
@@ -410,6 +411,51 @@ static int papr_scm_get_health(struct papr_scm_priv *p,
 	return 0;
 }
 
+/* Fetch the DIMM stats and populate it in provided papr_scm package */
+static int papr_scm_get_stats(struct papr_scm_priv *p,
+			      struct nd_pkg_papr_scm *pkg)
+{
+	struct papr_scm_perf_stats *retbuffer;
+	int rc;
+	size_t copysize;
+
+	/* Return buffer for phyp where stats are written */
+	retbuffer = kzalloc(PAPR_SCM_MAX_PERF_STAT, GFP_KERNEL);
+
+	if (!retbuffer)
+		return -ENOMEM;
+
+	rc = drc_pmem_query_stats(p, retbuffer);
+	if (rc)
+		goto out;
+
+	/*
+	 * Parse the retbuffer, fetch the size returned and return the
+	 * first nd_size_out bytes back to userspce.
+	 */
+	pkg->hdr.nd_fw_size = be16_to_cpu(retbuffer->size);
+	copysize = min_t(__u32, pkg->hdr.nd_fw_size, pkg->hdr.nd_size_out);
+
+	memcpy(pkg->payload, retbuffer, copysize);
+
+	/* Verify if the returned buffer was copied completely */
+	if (pkg->hdr.nd_fw_size > copysize) {
+		rc = -ENOSPC;
+		goto out;
+	}
+
+out:
+	kfree(retbuffer);
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
@@ -460,6 +506,11 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
 		*cmd_rc = papr_scm_get_health(p, call_pkg);
 		break;
 
+	case DSM_PAPR_SCM_STATS:
+		call_pkg = (struct nd_pkg_papr_scm *) buf;
+		*cmd_rc = papr_scm_get_stats(p, call_pkg);
+		break;
+
 	default:
 		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd_in);
 		*cmd_rc = -EINVAL;
-- 
2.24.1

