Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ACB1D76B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 13:19:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qc3g2nphzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 21:19:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QbqY0lm0zDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:08:56 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04IB4rdQ059632; Mon, 18 May 2020 07:08:44 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312c21xrhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 07:08:44 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04IB59BT061341;
 Mon, 18 May 2020 07:08:44 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312c21xrgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 07:08:44 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04IB5a9Q003978;
 Mon, 18 May 2020 11:08:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3127t5sm46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 11:08:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04IB8dQl60817914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 May 2020 11:08:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AD9711C052;
 Mon, 18 May 2020 11:08:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ECAF11C050;
 Mon, 18 May 2020 11:08:36 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.102.2.238])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 18 May 2020 11:08:36 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Mon, 18 May 2020 16:38:35 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [RFC PATCH 4/4] powerpc/papr_scm: Add support for PDSM GET_PERF_STAT
Date: Mon, 18 May 2020 16:38:14 +0530
Message-Id: <20200518110814.145644-5-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518110814.145644-1-vaibhav@linux.ibm.com>
References: <20200518110814.145644-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-18_04:2020-05-15,
 2020-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 cotscore=-2147483648 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005180096
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

This patch adds support for retrieving a singled NVDIMM performance
stat from PHYP via PDSM GET_PERF_STAT_VERSION. A new uapi 'struct
nd_pdsm_get_perf_stat' is introduced that holds a single performance
stat and is populated by newly introduced papr_scm_get_perf_stat() by
issuing an H_SCM_PERFORMANCE_STATS to PHYP.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/papr_scm_pdsm.h | 12 +++
 arch/powerpc/platforms/pseries/papr_scm.c     | 74 +++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
index 2db4ffdff285..473c4bbddb2f 100644
--- a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
@@ -116,6 +116,7 @@ enum papr_scm_pdsm {
 	PAPR_SCM_PDSM_HEALTH,
 	PAPR_SCM_PDSM_FETCH_PERF_STATS,
 	PAPR_SCM_PDSM_READ_PERF_STATS,
+	PAPR_SCM_PDSM_GET_PERF_STAT,
 	PAPR_SCM_PDSM_MAX,
 };
 
@@ -218,4 +219,15 @@ struct nd_pdsm_read_perf_stats_v1 {
 #define nd_pdsm_read_perf_stats nd_pdsm_read_perf_stats_v1
 #define ND_PDSM_READ_PERF_STATS_VERSION 1
 
+/*
+ * Fetch the value of single nvdimm performance stat id of which is
+ * stored in 'stat.id'
+ */
+struct nd_pdsm_get_perf_stat_v1 {
+	struct nd_pdsm_perf_stat stat;
+} __packed;
+
+#define nd_pdsm_get_perf_stat nd_pdsm_get_perf_stat_v1
+#define ND_PDSM_GET_PERF_STAT_VERSION 1
+
 #endif /* _UAPI_ASM_POWERPC_PAPR_SCM_PDSM_H_ */
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 06744d7fe727..284d04f0a094 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -525,6 +525,77 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 	return 0;
 }
 
+static int papr_scm_get_perf_stat(struct papr_scm_priv *p,
+				  struct nd_pdsm_cmd_pkg *pkg)
+{
+	int rc;
+	struct nd_pdsm_get_perf_stat *stat =
+		(struct nd_pdsm_get_perf_stat *)pdsm_cmd_to_payload(pkg);
+	const size_t copysize = sizeof(struct nd_pdsm_get_perf_stat);
+	struct papr_scm_perf_stats *stats_req;
+	ssize_t stat_size;
+
+	/*
+	 * If the requested payload version is greater than one we know
+	 * about, return the payload version we know about and let
+	 * caller/userspace handle.
+	 */
+	if (pkg->payload_version > ND_PDSM_GET_PERF_STAT_VERSION)
+		pkg->payload_version = ND_PDSM_GET_PERF_STAT_VERSION;
+
+	if (pkg->hdr.nd_size_out < copysize) {
+		dev_dbg(&p->pdev->dev, "Truncated payload (%u). Expected (%lu)",
+			pkg->hdr.nd_size_out, copysize);
+		rc = -ENOSPC;
+		goto out;
+	}
+
+	if (!READ_ONCE(p->len_stat_buffer)) {
+		dev_dbg(&p->pdev->dev, "Perf stat: req for unsupported device");
+		rc = -ENOENT;
+		goto out;
+	}
+
+	/* Allocate and setup a PERFORMANCE_STATS request buffer */
+	stat_size = sizeof(struct papr_scm_perf_stats) +
+		sizeof(struct papr_scm_perf_stat);
+	stats_req = kzalloc(stat_size, GFP_KERNEL);
+	if (!stats_req) {
+		dev_err(&p->pdev->dev, "Perf stat: Unable to allocate memory\n");
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	/* Copy the single request statistic_id into the request buffer */
+	memcpy(&stats_req->scm_statistics[0].statistic_id, &stat->stat.id,
+	       sizeof(stats_req->scm_statistics[0].statistic_id));
+
+	/* Fetch the stat from PHYP */
+	rc = drc_pmem_query_stats(p, stats_req, stat_size, 1, NULL);
+	if (rc)
+		goto out;
+
+	/* Copy the value of stat to the return payload */
+	memcpy(&stat->stat.id, &stats_req->scm_statistics[0].statistic_id,
+	       sizeof(stat->stat.id));
+	stat->stat.val = stats_req->scm_statistics[0].statistic_value;
+
+	pkg->hdr.nd_fw_size = copysize;
+
+	dev_dbg(&p->pdev->dev, "Copying payload size=%u version=0x%x\n",
+		pkg->hdr.nd_fw_size, pkg->payload_version);
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
 /*
  * Read the contents of dimm performance statistics buffer at the given
  * 'in_offset' and copy 'in_length' number of bytes to the pkg payload.
@@ -755,6 +826,9 @@ static int papr_scm_service_pdsm(struct papr_scm_priv *p,
 	case PAPR_SCM_PDSM_READ_PERF_STATS:
 		return papr_scm_read_perf_stats(p, call_pkg);
 
+	case PAPR_SCM_PDSM_GET_PERF_STAT:
+		return papr_scm_get_perf_stat(p, call_pkg);
+
 	default:
 		dev_dbg(&p->pdev->dev, "Unsupported PDSM request 0x%llx\n",
 			call_pkg->hdr.nd_command);
-- 
2.26.2

