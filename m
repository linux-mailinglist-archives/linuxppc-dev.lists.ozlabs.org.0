Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD41D767B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 13:15:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QbyX2D0nzDqXq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 21:15:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QbqG487yzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:08:42 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04IB3Brp070327; Mon, 18 May 2020 07:08:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312btu38r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 07:08:37 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04IB3rar071619;
 Mon, 18 May 2020 07:08:36 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312btu38qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 07:08:36 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04IB5LrM030422;
 Mon, 18 May 2020 11:08:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3127t5kyj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 11:08:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04IB7J0q47186332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 May 2020 11:07:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1946F4204D;
 Mon, 18 May 2020 11:08:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 610394203F;
 Mon, 18 May 2020 11:08:28 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.102.2.238])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 18 May 2020 11:08:28 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Mon, 18 May 2020 16:38:27 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [RFC PATCH 2/4] powerpc/papr_scm: Add support for
 PAPR_SCM_PDSM_FETCH_PERF_STATS
Date: Mon, 18 May 2020 16:38:12 +0530
Message-Id: <20200518110814.145644-3-vaibhav@linux.ibm.com>
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
 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1015 cotscore=-2147483648
 lowpriorityscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005180096
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

Add support for pdsm PAPR_SCM_PDSM_FETCH_PERF_STATS that issues HCALL
H_SCM_PERFORMANCE_STATS to PHYP to fetch all the NVDIMM performance
stats and store them in per nvdimm 'struct papr_scm_priv' as member
'perf_stats'. A further PDSM request (introduced later) is needed to
read the contents of this performance stats buffer.

A new uapi struct 'nd_psdm_perf_stats_size' is introduced to be used
by libndctl to retrieve the size of buffer needed to store all NVDIMM
performance stats.

The patch updates papr_scm_service_pdsm() to route
PAPR_SCM_PDSM_FETCH_PERF_STATS to newly introduced
papr_scm_fetch_perf_stats() which then issues the HCALL and copies the
needed size to the PDSM payload.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/papr_scm_pdsm.h | 13 ++++
 arch/powerpc/platforms/pseries/papr_scm.c     | 70 +++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
index db0cf550dabe..40ec55d06f4c 100644
--- a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
@@ -114,6 +114,7 @@ struct nd_pdsm_cmd_pkg {
 enum papr_scm_pdsm {
 	PAPR_SCM_PDSM_MIN = 0x0,
 	PAPR_SCM_PDSM_HEALTH,
+	PAPR_SCM_PDSM_FETCH_PERF_STATS,
 	PAPR_SCM_PDSM_MAX,
 };
 
@@ -170,4 +171,16 @@ struct nd_papr_pdsm_health_v1 {
 /* Current version number for the dimm health struct */
 #define ND_PAPR_PDSM_HEALTH_VERSION 1
 
+/*
+ * Return the maximum buffer size needed to hold all performance state.
+ * max_stats_size: The buffer size needed to hold all stat entries
+ */
+struct nd_pdsm_fetch_perf_stats_v1 {
+	__u32 max_stats_size;
+	__u8 reserved[4];
+} __packed;
+
+#define nd_pdsm_fetch_perf_stats nd_pdsm_fetch_perf_stats_v1
+#define ND_PDSM_FETCH_PERF_STATS_VERSION 1
+
 #endif /* _UAPI_ASM_POWERPC_PAPR_SCM_PDSM_H_ */
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index fd9a12275315..f8b37a830aed 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -525,6 +525,73 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 	return 0;
 }
 
+/* Return the size in bytes for returning all perf stats to libndctl */
+static int papr_scm_fetch_perf_stats(struct papr_scm_priv *p,
+				     struct nd_pdsm_cmd_pkg *pkg)
+{
+	int rc = 0;
+	size_t copysize = sizeof(struct nd_pdsm_fetch_perf_stats);
+	struct nd_pdsm_fetch_perf_stats *sz =
+		(struct nd_pdsm_fetch_perf_stats *)pdsm_cmd_to_payload(pkg);
+
+	/*
+	 * If the requested payload version is greater than one we know
+	 * about, return the payload version we know about and let
+	 * caller/userspace handle.
+	 */
+	if (pkg->payload_version > ND_PDSM_FETCH_PERF_STATS_VERSION)
+		pkg->payload_version = ND_PDSM_FETCH_PERF_STATS_VERSION;
+
+	if (pkg->hdr.nd_size_out < copysize) {
+		dev_dbg(&p->pdev->dev, "Truncated payload (%u). Expected (%lu)",
+			pkg->hdr.nd_size_out, copysize);
+		rc = -ENOSPC;
+		goto out;
+	}
+
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		goto out;
+
+	if (!p->len_stat_buffer) {
+		rc = -ENOENT;
+		goto out_unlock;
+	}
+
+	/* Setup the buffer and request phyp for all dimm perf stats data */
+	rc = drc_pmem_query_stats(p, p->perf_stats, p->len_stat_buffer, 0,
+				  NULL);
+	if (rc)
+		goto out_unlock;
+
+	dev_dbg(&p->pdev->dev, "Copying payload size=%lu version=0x%x\n",
+		copysize, pkg->payload_version);
+
+	/*
+	 * Put the buffer size needed in the payload buffer subtracting the
+	 * perf_stat header size.
+	 */
+	if (p->len_stat_buffer > sizeof(struct papr_scm_perf_stats))
+		sz->max_stats_size = p->len_stat_buffer -
+			sizeof(struct papr_scm_perf_stats);
+	else
+		sz->max_stats_size = 0;
+
+	pkg->hdr.nd_fw_size = copysize;
+
+out_unlock:
+	mutex_unlock(&p->health_mutex);
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
 /* Fetch the DIMM health info and populate it in provided package. */
 static int papr_scm_get_health(struct papr_scm_priv *p,
 			       struct nd_pdsm_cmd_pkg *pkg)
@@ -594,6 +661,9 @@ static int papr_scm_service_pdsm(struct papr_scm_priv *p,
 	case PAPR_SCM_PDSM_HEALTH:
 		return papr_scm_get_health(p, call_pkg);
 
+	case PAPR_SCM_PDSM_FETCH_PERF_STATS:
+		return papr_scm_fetch_perf_stats(p, call_pkg);
+
 	default:
 		dev_dbg(&p->pdev->dev, "Unsupported PDSM request 0x%llx\n",
 			call_pkg->hdr.nd_command);
-- 
2.26.2

