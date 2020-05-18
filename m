Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3E1D763A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 13:10:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qbsj6rQXzDqTP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 21:10:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QbqC4B9SzDqRL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:08:39 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04IB3YFZ087371; Mon, 18 May 2020 07:08:33 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cp7n9bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 07:08:33 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04IB4GA6091230;
 Mon, 18 May 2020 07:08:32 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cp7n9ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 07:08:32 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04IB5hAj012263;
 Mon, 18 May 2020 11:08:30 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3127t5hmb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 11:08:30 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04IB8RsU41615586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 May 2020 11:08:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C53BA405B;
 Mon, 18 May 2020 11:08:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ABBEA4053;
 Mon, 18 May 2020 11:08:24 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.102.2.238])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 18 May 2020 11:08:24 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Mon, 18 May 2020 16:38:23 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [RFC PATCH 1/4] powerpc/papr_scm: Fetch nvdimm performance stats from
 PHYP
Date: Mon, 18 May 2020 16:38:11 +0530
Message-Id: <20200518110814.145644-2-vaibhav@linux.ibm.com>
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
 mlxscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 cotscore=-2147483648
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
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

Update papr_scm.c to query dimm performance statistics from PHYP via
H_SCM_PERFORMANCE_STATS hcall and export them to userspace as PAPR
specific NVDIMM attribute 'perf_stats' in sysfs. The patch also
provide a sysfs ABI documentation for the stats being reported and
their meanings.

During NVDIMM probe time in papr_scm_nvdimm_init() a special variant
of H_SCM_PERFORMANCE_STATS hcall is issued to check if collection of
performance statistics is supported or not. If yes then a per-nvdimm
performance stats buffer is of size as returned by PHYP is allocated
and stored along with its length in two newly introduced NVDIMM
private struct members 'perf_stats' and 'len_stat_buffer'.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-bus-papr-scm |  27 ++++
 arch/powerpc/platforms/pseries/papr_scm.c    | 156 +++++++++++++++++++
 2 files changed, 183 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-papr-scm b/Documentation/ABI/testing/sysfs-bus-papr-scm
index 6143d06072f1..ad06b3e9c315 100644
--- a/Documentation/ABI/testing/sysfs-bus-papr-scm
+++ b/Documentation/ABI/testing/sysfs-bus-papr-scm
@@ -25,3 +25,30 @@ Description:
 				  NVDIMM have been scrubbed.
 		* "locked"	: Indicating that NVDIMM contents cant
 				  be modified until next power cycle.
+
+What:		/sys/bus/nd/devices/nmemX/papr/perf_stats
+Date:		May, 2020
+KernelVersion:	v5.8
+Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-nvdimm@lists.01.org,
+Description:
+		(RO) Report various performance stats related to papr-scm NVDIMM
+		device.  Each stat is reported on a new line with each line
+		composed of a stat-identifier followed by it value. Below are
+		currently known dimm performance stats which are reported:
+
+		* "CtlResCt" : Controller Reset Count
+		* "CtlResTm" : Controller Reset Elapsed Time
+		* "PonSecs " : Power-on Seconds
+		* "MemLife " : Life Remaining
+		* "CritRscU" : Critical Resource Utilization
+		* "HostLCnt" : Host Load Count
+		* "HostSCnt" : Host Store Count
+		* "HostSDur" : Host Store Duration
+		* "HostLDur" : Host Load Duration
+		* "MedRCnt " : Media Read Count
+		* "MedWCnt " : Media Write Count
+		* "MedRDur " : Media Read Duration
+		* "MedWDur " : Media Write Duration
+		* "CchRHCnt" : Cache Read Hit Count
+		* "CchWHCnt" : Cache Write Hit Count
+		* "FastWCnt" : Fast Write Count
\ No newline at end of file
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index c59bf17ad054..fd9a12275315 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -62,6 +62,24 @@
 					PAPR_SCM_DIMM_HEALTH_FATAL |	\
 					PAPR_SCM_DIMM_HEALTH_UNHEALTHY)
 
+#define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
+#define PAPR_SCM_PERF_STATS_VERSION 0x1
+
+/* Struct holding a single performance metric */
+struct papr_scm_perf_stat {
+	u8 statistic_id[8];
+	u64 statistic_value;
+};
+
+/* Struct exchanged between kernel and PHYP for fetching drc perf stats */
+struct papr_scm_perf_stats {
+	u8 eye_catcher[8];
+	u32 stats_version;		/* Should be 0x01 */
+	u32 num_statistics;		/* Number of stats following */
+	/* zero or more performance matrics */
+	struct papr_scm_perf_stat scm_statistics[];
+} __packed;
+
 /* private struct associated with each region */
 struct papr_scm_priv {
 	struct platform_device *pdev;
@@ -89,6 +107,12 @@ struct papr_scm_priv {
 
 	/* Health information for the dimm */
 	struct nd_papr_pdsm_health health;
+
+	/* length of the stat buffer as expected by phyp */
+	size_t len_stat_buffer;
+
+	/* Cached version of all performance state */
+	struct papr_scm_perf_stats *perf_stats;
 };
 
 static int drc_pmem_bind(struct papr_scm_priv *p)
@@ -194,6 +218,75 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
 	return drc_pmem_bind(p);
 }
 
+/*
+ * Query the Dimm performance stats from PHYP and copy them (if returned) to
+ * provided struct papr_scm_perf_stats instance 'stats' of 'size' in bytes.
+ * The value of R4 is copied to 'out' if the pointer is provided.
+ */
+static int drc_pmem_query_stats(struct papr_scm_priv *p,
+				struct papr_scm_perf_stats *buff_stats,
+				size_t size, unsigned int num_stats,
+				uint64_t *out)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	struct papr_scm_perf_stat *stats;
+	s64 rc, i;
+
+	/* Setup the out buffer */
+	if (buff_stats) {
+		memcpy(buff_stats->eye_catcher,
+		       PAPR_SCM_PERF_STATS_EYECATCHER, 8);
+		buff_stats->stats_version =
+			cpu_to_be32(PAPR_SCM_PERF_STATS_VERSION);
+		buff_stats->num_statistics =
+			cpu_to_be32(num_stats);
+	} else {
+		/* In case of no out buffer ignore the size */
+		size = 0;
+	}
+
+	/*
+	 * Do the HCALL asking PHYP for info and if R4 was requested
+	 * return its value in 'out' variable.
+	 */
+	rc = plpar_hcall(H_SCM_PERFORMANCE_STATS, ret, p->drc_index,
+			 __pa(buff_stats), size);
+	if (out)
+		*out =  ret[0];
+
+	if (rc == H_PARTIAL) {
+		dev_err(&p->pdev->dev,
+			"Unknown performance stats, Err:0x%016lX\n", ret[0]);
+		return -ENOENT;
+	} else if (rc != H_SUCCESS) {
+		dev_err(&p->pdev->dev,
+			"Failed to query performance stats, Err:%lld\n", rc);
+		return -ENXIO;
+	}
+
+	/* Successfully fetched the requested stats from phyp */
+	if (size != 0) {
+		buff_stats->num_statistics =
+			be32_to_cpu(buff_stats->num_statistics);
+
+		/* Transform the stats buffer values from BE to cpu native */
+		for (i = 0, stats = buff_stats->scm_statistics;
+		     i < buff_stats->num_statistics; ++i) {
+			stats[i].statistic_value =
+				be64_to_cpu(stats[i].statistic_value);
+		}
+		dev_dbg(&p->pdev->dev,
+			"Performance stats returned %d stats\n",
+			buff_stats->num_statistics);
+	} else {
+		/* Handle case where stat buffer size was requested */
+		dev_dbg(&p->pdev->dev,
+			"Performance stats size %ld\n", ret[0]);
+	}
+
+	return 0;
+}
+
 /*
  * Issue hcall to retrieve dimm health info and populate papr_scm_priv with the
  * health information.
@@ -563,6 +656,47 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 	return *cmd_rc;
 }
 
+static ssize_t perf_stats_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int index, rc;
+	struct seq_buf s;
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+	struct papr_scm_perf_stat *stats = p->perf_stats->scm_statistics;
+
+	if (!p->len_stat_buffer)
+		return -ENOENT;
+
+	seq_buf_init(&s, buf, PAGE_SIZE);
+
+	/* Protect concurrent modifications to papr_scm_priv */
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		return rc;
+
+	/* Ask phyp to return all dimm perf stats */
+	rc = drc_pmem_query_stats(p, p->perf_stats, p->len_stat_buffer, 0,
+				  NULL);
+	if (!rc) {
+		/*
+		 * Go through the returned output buffer and print stats and
+		 * values. Since statistic_id is essentially a char string of
+		 * 8 bytes, simply use the string format specifier to print it.
+		 */
+		for (index = 0; index < p->perf_stats->num_statistics;
+		     ++index) {
+			seq_buf_printf(&s, "%.8s = 0x%016llX\n",
+				       stats[index].statistic_id,
+				       stats[index].statistic_value);
+		}
+	}
+
+	mutex_unlock(&p->health_mutex);
+	return rc ? rc : seq_buf_used(&s);
+}
+DEVICE_ATTR_RO(perf_stats);
+
 static ssize_t flags_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -615,6 +749,7 @@ DEVICE_ATTR_RO(flags);
 /* papr_scm specific dimm attributes */
 static struct attribute *papr_scm_nd_attributes[] = {
 	&dev_attr_flags.attr,
+	&dev_attr_perf_stats.attr,
 	NULL,
 };
 
@@ -635,6 +770,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	struct nd_region_desc ndr_desc;
 	unsigned long dimm_flags;
 	int target_nid, online_nid;
+	u64 stat_size;
 
 	p->bus_desc.ndctl = papr_scm_ndctl;
 	p->bus_desc.module = THIS_MODULE;
@@ -698,6 +834,26 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 		dev_info(dev, "Region registered with target node %d and online node %d",
 			 target_nid, online_nid);
 
+	/* Try retriving the stat buffer and see if its supported */
+	if (!drc_pmem_query_stats(p, NULL, 0, 0, &stat_size)) {
+		/* Allocate the buffer for phyp where stats are written */
+		p->perf_stats = kzalloc(stat_size, GFP_KERNEL);
+
+		/* Failed allocation is non fatal and results in limited data */
+		if (!p->perf_stats)
+			dev_dbg(&p->pdev->dev,
+				"Unable to allocate %llu bytes for perf-state",
+				stat_size);
+		else
+			p->len_stat_buffer = (size_t)stat_size;
+	} else {
+		dev_dbg(&p->pdev->dev, "Unable to retrieve performace stats\n");
+	}
+
+	/* Check if perf-stats buffer was allocated */
+	if (!p->len_stat_buffer)
+		dev_info(&p->pdev->dev, "Limited dimm info available\n");
+
 	return 0;
 
 err:	nvdimm_bus_unregister(p->bus);
-- 
2.26.2

