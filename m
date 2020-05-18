Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E1E1D7694
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 13:17:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qc124BzZzDqSV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 21:17:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QbqP1ccczDqTX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:08:48 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04IB4YXN179667; Mon, 18 May 2020 07:08:40 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 312aar05we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 07:08:40 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04IB5bEQ188186;
 Mon, 18 May 2020 07:08:40 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 312aar05vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 07:08:39 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04IB5Ps6030496;
 Mon, 18 May 2020 11:08:38 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3127t5kyjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 11:08:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04IB8ZgU64094306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 May 2020 11:08:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A122A404D;
 Mon, 18 May 2020 11:08:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 464CCA4053;
 Mon, 18 May 2020 11:08:32 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.102.2.238])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 18 May 2020 11:08:32 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Mon, 18 May 2020 16:38:31 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [RFC PATCH 3/4] powerpc/papr_scm: Implement support for
 PAPR_SCM_PDSM_READ_PERF_STATS
Date: Mon, 18 May 2020 16:38:13 +0530
Message-Id: <20200518110814.145644-4-vaibhav@linux.ibm.com>
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
 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005180100
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

Implement support for pdsm READ_PERF_STATS to be used by libndctl to
fetch all NVDIMM performance statistics. The stats are to be exchanged
via newly introduced 'struct nd_pdsm_get_perf_stats' which is
allocated and sent by libndctl to papr_scm. The struct contains
members 'in_offset' and 'in_length' to provide incremental access to
performance statistics data buffer and workaround 'libnvdimm' limit of
256 bytes evelope size.

The patch introduces new function 'papr_scm_read_perf_stats()' to
service this pdsm and copy the requested chunk of performance stats to
the libndctl provided payload buffer for the given offset and length.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/papr_scm_pdsm.h | 35 +++++++
 arch/powerpc/platforms/pseries/papr_scm.c     | 91 +++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
index 40ec55d06f4c..2db4ffdff285 100644
--- a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
@@ -115,6 +115,7 @@ enum papr_scm_pdsm {
 	PAPR_SCM_PDSM_MIN = 0x0,
 	PAPR_SCM_PDSM_HEALTH,
 	PAPR_SCM_PDSM_FETCH_PERF_STATS,
+	PAPR_SCM_PDSM_READ_PERF_STATS,
 	PAPR_SCM_PDSM_MAX,
 };
 
@@ -183,4 +184,38 @@ struct nd_pdsm_fetch_perf_stats_v1 {
 #define nd_pdsm_fetch_perf_stats nd_pdsm_fetch_perf_stats_v1
 #define ND_PDSM_FETCH_PERF_STATS_VERSION 1
 
+/*
+ * Holds a single performance stat. papr_scm owns a buffer that holds an array
+ * of all the available stats and their values. Access to the buffer is provided
+ * via PERF_STAT_SIZE and READ_PERF_STATS psdm.
+ * id : id of the performance stat. Usually acsii encode stat name.
+ * val : Non normalized value of the id.
+ */
+
+struct nd_pdsm_perf_stat {
+	__u64 id;
+	__u64 val;
+};
+
+/*
+ * Returns a chunk of performance stats buffer data to libndctl.
+ * This is needed to overcome the 256 byte envelope size limit enforced by
+ * libnvdimm.
+ * in_offset: The starting offset to perf stats data buffer.
+ * in_length: Length of data to be copied to 'stats_data'
+ * stats_data: Holds the chunk of requested perf stats data buffer.
+ *
+ * Note: To prevent races in reading performance stats, in_offset and in_length
+ * should multiple of 16-Bytes. If they are not then papr_scm will return an
+ * -EINVAL error.
+ */
+struct nd_pdsm_read_perf_stats_v1 {
+	__u32 in_offset;
+	__u32 in_length;
+	struct nd_pdsm_perf_stat stats_data[];
+} __packed;
+
+#define nd_pdsm_read_perf_stats nd_pdsm_read_perf_stats_v1
+#define ND_PDSM_READ_PERF_STATS_VERSION 1
+
 #endif /* _UAPI_ASM_POWERPC_PAPR_SCM_PDSM_H_ */
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f8b37a830aed..06744d7fe727 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -525,6 +525,94 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 	return 0;
 }
 
+/*
+ * Read the contents of dimm performance statistics buffer at the given
+ * 'in_offset' and copy 'in_length' number of bytes to the pkg payload.
+ * Both 'in_offset' and 'in_length' are expected to be in multiples of
+ * 16-Bytes to prevent a read/write race that may cause malformed values
+ * top be returned as performance statistics buffer content.
+ */
+static int papr_scm_read_perf_stats(struct papr_scm_priv *p,
+				    struct nd_pdsm_cmd_pkg *pkg)
+{
+	int rc;
+	struct nd_pdsm_read_perf_stats *stats =
+		(struct nd_pdsm_read_perf_stats *)pdsm_cmd_to_payload(pkg);
+	const size_t copysize = sizeof(struct nd_pdsm_read_perf_stats);
+	off_t offset;
+
+	/*
+	 * If the requested payload version is greater than one we know
+	 * about, return the payload version we know about and let
+	 * caller/userspace handle.
+	 */
+	if (pkg->payload_version > ND_PDSM_READ_PERF_STATS_VERSION)
+		pkg->payload_version = ND_PDSM_READ_PERF_STATS_VERSION;
+
+	if (pkg->hdr.nd_size_out < copysize) {
+		dev_dbg(&p->pdev->dev, "Truncated payload (%u). Expected (%lu)",
+			pkg->hdr.nd_size_out, copysize);
+		rc = -ENOSPC;
+		goto out;
+	}
+
+	/* Protect concurrent modifications to papr_scm_priv */
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		goto out;
+
+	if (!p->len_stat_buffer) {
+		dev_dbg(&p->pdev->dev, "Perf stats: req for unsupported device");
+		rc = -ENOENT;
+		goto mutex_unlock_out;
+	}
+
+	/* calculate offset skipping the perf_stats buffer header */
+	offset = stats->in_offset + sizeof(*p->perf_stats);
+	/* Cap the copy length to extend of stats buffer */
+	stats->in_length = min(stats->in_length,
+			       (__u32)(p->len_stat_buffer - offset));
+
+	/*
+	 * Ensure that offset and length are valid and multiples of 16 bytes.
+	 * PDSM FETCH_PERF_STATS can interleave in between PDSM READ_PERF_STAT.
+	 * Since this is a read/write race hence malformed performance stats
+	 * buffer contents that may be returned.
+	 * A 16-Byte read alignment constraint forces a read granularity of
+	 * same the size of each performance stat and they are guaranteed to
+	 * remain stable during 'health_mutex' lock context.
+	 */
+	if (offset >= p->len_stat_buffer || (offset % 16) ||
+	    (stats->in_length % 16)) {
+		dev_dbg(&p->pdev->dev,
+			"Perf stats: Invalid offset(0x%lx) or length(0x%x)",
+			offset, stats->in_length);
+		rc = -EINVAL;
+		goto mutex_unlock_out;
+	}
+
+	/* Put the stats buffer data in the payload buffer */
+	memcpy(stats->stats_data,
+	       (void *)p->perf_stats + offset, stats->in_length);
+
+	pkg->hdr.nd_fw_size = stats->in_length;
+
+	dev_dbg(&p->pdev->dev, "Copying payload size=%u version=0x%x\n",
+		stats->in_length, pkg->payload_version);
+
+mutex_unlock_out:
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
 /* Return the size in bytes for returning all perf stats to libndctl */
 static int papr_scm_fetch_perf_stats(struct papr_scm_priv *p,
 				     struct nd_pdsm_cmd_pkg *pkg)
@@ -664,6 +752,9 @@ static int papr_scm_service_pdsm(struct papr_scm_priv *p,
 	case PAPR_SCM_PDSM_FETCH_PERF_STATS:
 		return papr_scm_fetch_perf_stats(p, call_pkg);
 
+	case PAPR_SCM_PDSM_READ_PERF_STATS:
+		return papr_scm_read_perf_stats(p, call_pkg);
+
 	default:
 		dev_dbg(&p->pdev->dev, "Unsupported PDSM request 0x%llx\n",
 			call_pkg->hdr.nd_command);
-- 
2.26.2

