Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CC2AADA5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 22:19:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTn8B4bxwzDqkC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 08:19:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Bi2wIPkH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTn4420sSzDqgx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 08:16:20 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A8L0rYs193284; Sun, 8 Nov 2020 16:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UlAnYRC0cfkGeC1nfGcvQkPFukBPSB5d89mrhnAjoJs=;
 b=Bi2wIPkHR8cLcGQ0caDyhjec9RkGdvQsvDjHVy6fMbXQtbvPbGxWdHH+CnMr0gCAXu6D
 e3XJXqjKP+rBmDSPyFXMysXypQ0WAnK4KrU11WYh2IBjr35JiJ8X6hYtokBghH5zCf0L
 or1yRSKj9QekdhTYsplQW3u+Os4edDsOGxOQHr1nqvf/sCH4qoL5PctBYcF4aiL47oBk
 DWjLcJnjnC8YIpBdRNsKR+EM2OwP/zl1cKBqvgmHobfxYZAeyqZ0DlJUdCr+WTphCFNg
 h26urroGwCVL3RgM+mZl3n5fE+0RMHBPre5+vgOmorzhdB0bsyFd1F4mCzibAttnmFdV 6Q== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34p9jux2jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Nov 2020 16:16:07 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A8LD3CC005584;
 Sun, 8 Nov 2020 21:16:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 34nk788p1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Nov 2020 21:16:05 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A8LG27765732966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 8 Nov 2020 21:16:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3650A405C;
 Sun,  8 Nov 2020 21:16:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11544A4062;
 Sun,  8 Nov 2020 21:15:59 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.199.47.5])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sun,  8 Nov 2020 21:15:58 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Mon, 09 Nov 2020 02:45:57 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [RFC][PATCH 2/2] powerpc/papr_scm: Implement support for reporting
 generic nvdimm stats
Date: Mon,  9 Nov 2020 02:45:49 +0530
Message-Id: <20201108211549.122018-2-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201108211549.122018-1-vaibhav@linux.ibm.com>
References: <20201108211549.122018-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-08_10:2020-11-05,
 2020-11-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011080148
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for reporting papr-scm supported generic nvdimm stats by
implementing support for handling ND_CMD_GET_STAT in
'papr_scm_ndctl().

The mapping between libnvdimm generic nvdimm-stats and papr-scm
specific performance-stats is embedded inside 'dimm_stats_map[]'. This
array is queried by newly introduced 'papr_scm_get_stat()' that
verifies if the requested nvdimm-stat is supported and if yes does an
hcall via 'drc_pmem_query_stat()' to request the performance-stat and
return it back to libnvdimm.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 66 ++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 835163f54244..51eeab3376fd 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -25,7 +25,8 @@
 	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
 	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
 	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
-	 (1ul << ND_CMD_CALL))
+	 (1ul << ND_CMD_CALL) |		   \
+	 (1ul << ND_CMD_GET_STAT))
 
 /* DIMM health bitmap bitmap indicators */
 /* SCM device is unable to persist memory contents */
@@ -120,6 +121,16 @@ struct papr_scm_priv {
 static LIST_HEAD(papr_nd_regions);
 static DEFINE_MUTEX(papr_ndr_lock);
 
+/* Map generic nvdimm stats to papr-scm stats */
+static const char * const dimm_stat_map[] = {
+	[ND_DIMM_STAT_INVALID] = NULL,
+	[ND_DIMM_STAT_MEDIA_READS] = "MedRCnt ",
+	[ND_DIMM_STAT_MEDIA_WRITES] = "MedWCnt ",
+	[ND_DIMM_STAT_READ_REQUESTS] = "HostLCnt",
+	[ND_DIMM_STAT_WRITE_REQUESTS] = "HostSCnt",
+	[ND_DIMM_STAT_MAX] = NULL,
+};
+
 static int drc_pmem_bind(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
@@ -728,6 +739,54 @@ static int papr_scm_service_pdsm(struct papr_scm_priv *p,
 	return pdsm_pkg->cmd_status;
 }
 
+/*
+ * For a given pdsm request call an appropriate service function.
+ * Returns errors if any while handling the pdsm command package.
+ */
+static int papr_scm_get_stat(struct papr_scm_priv *p,
+			     struct nd_cmd_get_dimm_stat *dimm_stat)
+
+{
+	int rc;
+	ssize_t size;
+	struct papr_scm_perf_stat *stat;
+	struct papr_scm_perf_stats *stats;
+
+	/* Check if the requested stat-id is supported */
+	if (dimm_stat->stat_id >= ARRAY_SIZE(dimm_stat_map) ||
+	    !dimm_stat_map[dimm_stat->stat_id]) {
+		dev_dbg(&p->pdev->dev, "Invalid stat-id %lld\n", dimm_stat->stat_id);
+		return -ENOSPC;
+	}
+
+	/* Allocate request buffer enough to hold single performance stat */
+	size = sizeof(struct papr_scm_perf_stats) +
+		sizeof(struct papr_scm_perf_stat);
+
+	stats = kzalloc(size, GFP_KERNEL);
+	if (!stats)
+		return -ENOMEM;
+
+	stat = &stats->scm_statistic[0];
+	memcpy(&stat->stat_id, dimm_stat_map[dimm_stat->stat_id],
+	       sizeof(stat->stat_id));
+	stat->stat_val = 0;
+
+	/* Fetch the statistic from PHYP and copy it to provided payload */
+	rc = drc_pmem_query_stats(p, stats, 1);
+	if (rc < 0) {
+		dev_dbg(&p->pdev->dev, "Err(%d) fetching stat '%.8s'\n",
+			rc, stat->stat_id);
+		kfree(stats);
+		return rc;
+	}
+
+	dimm_stat->int_val = be64_to_cpu(stat->stat_val);
+
+	kfree(stats);
+	return 0;
+}
+
 static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 			  struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 			  unsigned int buf_len, int *cmd_rc)
@@ -772,6 +831,11 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 		*cmd_rc = papr_scm_service_pdsm(p, call_pkg);
 		break;
 
+	case ND_CMD_GET_STAT:
+		*cmd_rc = papr_scm_get_stat(p,
+					    (struct nd_cmd_get_dimm_stat *)buf);
+		break;
+
 	default:
 		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
 		return -EINVAL;
-- 
2.28.0

