Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC942331D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 14:16:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHTsc30nPzDq94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 22:16:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHTpN280NzDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:13:32 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UC2GdR050572; Thu, 30 Jul 2020 08:13:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32krmea4k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 08:13:23 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06UC2jeN052789;
 Thu, 30 Jul 2020 08:13:23 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32krmea4j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 08:13:22 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06UCBpY4003090;
 Thu, 30 Jul 2020 12:13:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 32gcpwbrve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 12:13:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06UCDHn862128566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 12:13:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9858042047;
 Thu, 30 Jul 2020 12:13:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AA604203F;
 Thu, 30 Jul 2020 12:13:14 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.89.216])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 30 Jul 2020 12:13:13 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Thu, 30 Jul 2020 17:43:13 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH v3 1/2] powerpc/papr_scm: Fetch nvdimm performance stats from
 PHYP
Date: Thu, 30 Jul 2020 17:43:02 +0530
Message-Id: <20200730121303.134230-2-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200730121303.134230-1-vaibhav@linux.ibm.com>
References: <20200730121303.134230-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_09:2020-07-30,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 suspectscore=2
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300086
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
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update papr_scm.c to query dimm performance statistics from PHYP via
H_SCM_PERFORMANCE_STATS hcall and export them to user-space as PAPR
specific NVDIMM attribute 'perf_stats' in sysfs. The patch also
provide a sysfs ABI documentation for the stats being reported and
their meanings.

During NVDIMM probe time in papr_scm_nvdimm_init() a special variant
of H_SCM_PERFORMANCE_STATS hcall is issued to check if collection of
performance statistics is supported or not. If successful then a PHYP
returns a maximum possible buffer length needed to read all
performance stats. This returned value is stored in a per-nvdimm
attribute 'stat_buffer_len'.

The layout of request buffer for reading NVDIMM performance stats from
PHYP is defined in 'struct papr_scm_perf_stats' and 'struct
papr_scm_perf_stat'. These structs are used in newly introduced
drc_pmem_query_stats() that issues the H_SCM_PERFORMANCE_STATS hcall.

The sysfs access function perf_stats_show() uses value
'stat_buffer_len' to allocate a buffer large enough to hold all
possible NVDIMM performance stats and passes it to
drc_pmem_query_stats() to populate. Finally statistics reported in the
buffer are formatted into the sysfs access function output buffer.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

v3:
* Updated drc_pmem_query_stats() to not require 'buff_size' and 'out'
  args to the function. Instead 'buff_size' is calculated from
  'num_stats' and instead of populating 'R4' in arg 'out' the value is
  returned from the function in case 'R4' represents
  'max-buffer-size'. [ Aneesh ]

Resend:
None

v2:
* Updated 'struct papr_scm_perf_stats' and 'struct papr_scm_perf_stat'
to use big-endian types. [ Aneesh ]
* s/len_stat_buffer/stat_buffer_len/ [ Aneesh ]
* s/statistics_id/stat_id/ , s/statistics_val/stat_val/ [ Aneesh ]
* Conversion from Big endian to cpu endian happens later rather than
just after its fetched from PHYP.
* Changed a log statement to unambiguously report dimm performance
stats are not available for the given nvdimm [ Ira ]
* Restructed some code to handle error case first [ Ira ]
---
 Documentation/ABI/testing/sysfs-bus-papr-pmem |  27 ++++
 arch/powerpc/platforms/pseries/papr_scm.c     | 150 ++++++++++++++++++
 2 files changed, 177 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
index 5b10d036a8d4..c1a67275c43f 100644
--- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
+++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
@@ -25,3 +25,30 @@ Description:
 				  NVDIMM have been scrubbed.
 		* "locked"	: Indicating that NVDIMM contents cant
 				  be modified until next power cycle.
+
+What:		/sys/bus/nd/devices/nmemX/papr/perf_stats
+Date:		May, 2020
+KernelVersion:	v5.9
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
index 8fd441d32487..29cab86141d8 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -64,6 +64,26 @@
 				    PAPR_PMEM_HEALTH_FATAL |	\
 				    PAPR_PMEM_HEALTH_UNHEALTHY)
 
+#define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
+#define PAPR_SCM_PERF_STATS_VERSION 0x1
+
+/* Struct holding a single performance metric */
+struct papr_scm_perf_stat {
+	u8 stat_id[8];
+	__be64 stat_val;
+} __packed;
+
+/* Struct exchanged between kernel and PHYP for fetching drc perf stats */
+struct papr_scm_perf_stats {
+	u8 eye_catcher[8];
+	/* Should be PAPR_SCM_PERF_STATS_VERSION */
+	__be32 stats_version;
+	/* Number of stats following */
+	__be32 num_statistics;
+	/* zero or more performance matrics */
+	struct papr_scm_perf_stat scm_statistic[];
+} __packed;
+
 /* private struct associated with each region */
 struct papr_scm_priv {
 	struct platform_device *pdev;
@@ -92,6 +112,9 @@ struct papr_scm_priv {
 
 	/* Health information for the dimm */
 	u64 health_bitmap;
+
+	/* length of the stat buffer as expected by phyp */
+	size_t stat_buffer_len;
 };
 
 LIST_HEAD(papr_nd_regions);
@@ -200,6 +223,79 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
 	return drc_pmem_bind(p);
 }
 
+/*
+ * Query the Dimm performance stats from PHYP and copy them (if returned) to
+ * provided struct papr_scm_perf_stats instance 'stats' that can hold atleast
+ * (num_stats + header) bytes.
+ * - If buff_stats == NULL the return value is the size in byes of the buffer
+ * needed to hold all supported performance-statistics.
+ * - If buff_stats != NULL and num_stats == 0 then we copy all known
+ * performance-statistics to 'buff_stat' and expect to be large enough to
+ * hold them.
+ * - if buff_stats != NULL and num_stats > 0 then copy the requested
+ * performance-statistics to buff_stats.
+ */
+static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
+				    struct papr_scm_perf_stats *buff_stats,
+				    unsigned int num_stats)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	size_t size;
+	s64 rc;
+
+	/* Setup the out buffer */
+	if (buff_stats) {
+		memcpy(buff_stats->eye_catcher,
+		       PAPR_SCM_PERF_STATS_EYECATCHER, 8);
+		buff_stats->stats_version =
+			cpu_to_be32(PAPR_SCM_PERF_STATS_VERSION);
+		buff_stats->num_statistics =
+			cpu_to_be32(num_stats);
+
+		/*
+		 * Calculate the buffer size based on num-stats provided
+		 * or use the prefetched max buffer length
+		 */
+		if (num_stats)
+			/* Calculate size from the num_stats */
+			size = sizeof(struct papr_scm_perf_stats) +
+				num_stats * sizeof(struct papr_scm_perf_stat);
+		else
+			size = p->stat_buffer_len;
+	} else {
+		/* In case of no out buffer ignore the size */
+		size = 0;
+	}
+
+	/* Do the HCALL asking PHYP for info */
+	rc = plpar_hcall(H_SCM_PERFORMANCE_STATS, ret, p->drc_index,
+			 buff_stats ? virt_to_phys(buff_stats) : 0,
+			 size);
+
+	/* Check if the error was due to an unknown stat-id */
+	if (rc == H_PARTIAL) {
+		dev_err(&p->pdev->dev,
+			"Unknown performance stats, Err:0x%016lX\n", ret[0]);
+		return -ENOENT;
+	} else if (rc != H_SUCCESS) {
+		dev_err(&p->pdev->dev,
+			"Failed to query performance stats, Err:%lld\n", rc);
+		return -EIO;
+
+	} else if (!size) {
+		/* Handle case where stat buffer size was requested */
+		dev_dbg(&p->pdev->dev,
+			"Performance stats size %ld\n", ret[0]);
+		return ret[0];
+	}
+
+	/* Successfully fetched the requested stats from phyp */
+	dev_dbg(&p->pdev->dev,
+			"Performance stats returned %d stats\n",
+			be32_to_cpu(buff_stats->num_statistics));
+	return 0;
+}
+
 /*
  * Issue hcall to retrieve dimm health info and populate papr_scm_priv with the
  * health information.
@@ -637,6 +733,48 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 	return 0;
 }
 
+static ssize_t perf_stats_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int index, rc;
+	struct seq_buf s;
+	struct papr_scm_perf_stat *stat;
+	struct papr_scm_perf_stats *stats;
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+
+	if (!p->stat_buffer_len)
+		return -ENOENT;
+
+	/* Allocate the buffer for phyp where stats are written */
+	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
+	if (!stats)
+		return -ENOMEM;
+
+	/* Ask phyp to return all dimm perf stats */
+	rc = drc_pmem_query_stats(p, stats, p->stat_buffer_len, 0, NULL);
+	if (rc)
+		goto free_stats;
+	/*
+	 * Go through the returned output buffer and print stats and
+	 * values. Since stat_id is essentially a char string of
+	 * 8 bytes, simply use the string format specifier to print it.
+	 */
+	seq_buf_init(&s, buf, PAGE_SIZE);
+	for (index = 0, stat = stats->scm_statistic;
+	     index < be32_to_cpu(stats->num_statistics);
+	     ++index, ++stat) {
+		seq_buf_printf(&s, "%.8s = 0x%016llX\n",
+			       stat->stat_id,
+			       be64_to_cpu(stat->stat_val));
+	}
+
+free_stats:
+	kfree(stats);
+	return rc ? rc : seq_buf_used(&s);
+}
+DEVICE_ATTR_RO(perf_stats);
+
 static ssize_t flags_show(struct device *dev,
 			  struct device_attribute *attr, char *buf)
 {
@@ -682,6 +820,7 @@ DEVICE_ATTR_RO(flags);
 /* papr_scm specific dimm attributes */
 static struct attribute *papr_nd_attributes[] = {
 	&dev_attr_flags.attr,
+	&dev_attr_perf_stats.attr,
 	NULL,
 };
 
@@ -702,6 +841,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	struct nd_region_desc ndr_desc;
 	unsigned long dimm_flags;
 	int target_nid, online_nid;
+	ssize_t stat_size;
 
 	p->bus_desc.ndctl = papr_scm_ndctl;
 	p->bus_desc.module = THIS_MODULE;
@@ -769,6 +909,16 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	list_add_tail(&p->region_list, &papr_nd_regions);
 	mutex_unlock(&papr_ndr_lock);
 
+	/* Try retriving the stat buffer and see if its supported */
+	stat_size = drc_pmem_query_stats(p, NULL, 0);
+	if (stat_size > 0) {
+		p->stat_buffer_len = stat_size;
+		dev_dbg(&p->pdev->dev, "Max perf-stat size %lu-bytes\n",
+			p->stat_buffer_len);
+	} else {
+		dev_info(&p->pdev->dev, "Dimm performance stats unavailable\n");
+	}
+
 	return 0;
 
 err:	nvdimm_bus_unregister(p->bus);
-- 
2.26.2

