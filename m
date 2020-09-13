Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 933D526816F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 23:23:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqMsl1lrXzDqXV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 07:23:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KLnWors+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqMr230JjzDq9k
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 07:21:38 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08DL2BGV077894; Sun, 13 Sep 2020 17:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ST1ua6HQP7yJkkPv2zrc5Kosu6N8e2rYcAN+SKlkEG4=;
 b=KLnWors+6RCEbZf2wmwXOzuJiie8Ak+ZhzkCwnLABzauDQITUkpEJrZJAFSNaNDtoqB5
 FzZdSWV639WX0ptIEvwK1Qu/0TsVO0NRVbLy32l9VhFpH3FpQPi+MkTMWOrcjMABe71P
 aXwSUAE/NgrYg8yL9Ng0M+I5d3lhevJnOT5Wj9TcXM2Dky7Fr3OIfetc313j5n26I8Uh
 KDE2elWZel0aVhp9DRAHvWuUDpUTpb2nZbfDC2XoIYV+Y2cEEqDsr99kO2Bvwss9VS0Y
 t8ujbwfIgKFMCs3lYswmOE2gwuYkJBlwMU05wWxL+jU5/vZW0QovoZM9cxkdd7hPDEqs Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33hsjuhfan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 17:21:29 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08DLK1An110982;
 Sun, 13 Sep 2020 17:21:29 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33hsjuhfa6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 17:21:29 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08DL7ioN016016;
 Sun, 13 Sep 2020 21:21:27 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 33h2r99253-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 21:21:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08DLLOrL19464542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Sep 2020 21:21:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35AEA11C050;
 Sun, 13 Sep 2020 21:21:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 097A011C04A;
 Sun, 13 Sep 2020 21:21:21 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.199.56.137])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sun, 13 Sep 2020 21:21:20 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Mon, 14 Sep 2020 02:51:19 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH] powerpc/papr_scm: Support dynamic enable/disable of
 performance statistics
Date: Mon, 14 Sep 2020 02:51:15 +0530
Message-Id: <20200913212115.24958-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-13_08:2020-09-10,
 2020-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=2 clxscore=1015
 impostorscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009130191
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

Collection of performance statistics of an NVDIMM can be dynamically
enabled/disabled from the Hypervisor Management Console even when the
guest lpar is running. The current implementation however will check if
the performance statistics collection is supported during NVDIMM probe
and if yes will assume that to be the case afterwards.

Hence we update papr_scm to remove this assumption from the code by
eliminating the 'stat_buffer_len' member from 'struct papr_scm_priv'
that was used to cache the max buffer size needed to fetch NVDIMM
performance stats from PHYP. With that struct member gone, various
functions that depended on it are updated. Specifically
perf_stats_show() is updated to query the PHYP first for the size of
buffer needed to hold all performance statistics instead of relying on
'stat_buffer_len'

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 53 +++++++++++------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 27268370dee00..6697e1c3b9ebe 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -112,9 +112,6 @@ struct papr_scm_priv {
 
 	/* Health information for the dimm */
 	u64 health_bitmap;
-
-	/* length of the stat buffer as expected by phyp */
-	size_t stat_buffer_len;
 };
 
 static LIST_HEAD(papr_nd_regions);
@@ -230,14 +227,15 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
  * - If buff_stats == NULL the return value is the size in byes of the buffer
  * needed to hold all supported performance-statistics.
  * - If buff_stats != NULL and num_stats == 0 then we copy all known
- * performance-statistics to 'buff_stat' and expect to be large enough to
- * hold them.
+ * performance-statistics to 'buff_stat' and expect it to be large enough to
+ * hold them. The 'buff_size' args contains the size of the 'buff_stats'
  * - if buff_stats != NULL and num_stats > 0 then copy the requested
  * performance-statistics to buff_stats.
  */
 static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 				    struct papr_scm_perf_stats *buff_stats,
-				    unsigned int num_stats)
+				    unsigned int num_stats,
+				    size_t buff_size)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
 	size_t size;
@@ -261,12 +259,18 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 			size = sizeof(struct papr_scm_perf_stats) +
 				num_stats * sizeof(struct papr_scm_perf_stat);
 		else
-			size = p->stat_buffer_len;
+			size = buff_size;
 	} else {
 		/* In case of no out buffer ignore the size */
 		size = 0;
 	}
 
+	/* verify that the buffer size needed is sufficient */
+	if (size > buff_size) {
+		__WARN();
+		return -EINVAL;
+	}
+
 	/* Do the HCALL asking PHYP for info */
 	rc = plpar_hcall(H_SCM_PERFORMANCE_STATS, ret, p->drc_index,
 			 buff_stats ? virt_to_phys(buff_stats) : 0,
@@ -277,6 +281,10 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 		dev_err(&p->pdev->dev,
 			"Unknown performance stats, Err:0x%016lX\n", ret[0]);
 		return -ENOENT;
+	} else if (rc == H_AUTHORITY) {
+		dev_dbg(&p->pdev->dev,
+			"Performance stats in-accessible\n");
+		return -EPERM;
 	} else if (rc != H_SUCCESS) {
 		dev_err(&p->pdev->dev,
 			"Failed to query performance stats, Err:%lld\n", rc);
@@ -526,10 +534,6 @@ static int papr_pdsm_fuel_gauge(struct papr_scm_priv *p,
 	struct papr_scm_perf_stat *stat;
 	struct papr_scm_perf_stats *stats;
 
-	/* Silently fail if fetching performance metrics isn't  supported */
-	if (!p->stat_buffer_len)
-		return 0;
-
 	/* Allocate request buffer enough to hold single performance stat */
 	size = sizeof(struct papr_scm_perf_stats) +
 		sizeof(struct papr_scm_perf_stat);
@@ -543,9 +547,11 @@ static int papr_pdsm_fuel_gauge(struct papr_scm_priv *p,
 	stat->stat_val = 0;
 
 	/* Fetch the fuel gauge and populate it in payload */
-	rc = drc_pmem_query_stats(p, stats, 1);
+	rc = drc_pmem_query_stats(p, stats, 1, size);
 	if (rc < 0) {
 		dev_dbg(&p->pdev->dev, "Err(%d) fetching fuel gauge\n", rc);
+		/* Silently fail if unable to fetch performance metric */
+		rc = 0;
 		goto free_stats;
 	}
 
@@ -786,23 +792,25 @@ static ssize_t perf_stats_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	int index;
-	ssize_t rc;
+	ssize_t rc, buff_len;
 	struct seq_buf s;
 	struct papr_scm_perf_stat *stat;
 	struct papr_scm_perf_stats *stats;
 	struct nvdimm *dimm = to_nvdimm(dev);
 	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
 
-	if (!p->stat_buffer_len)
-		return -ENOENT;
+	/* fetch the length of buffer needed to get all stats */
+	buff_len = drc_pmem_query_stats(p, NULL, 0, 0);
+	if (buff_len <= 0)
+		return buff_len;
 
 	/* Allocate the buffer for phyp where stats are written */
-	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
+	stats = kzalloc(buff_len, GFP_KERNEL);
 	if (!stats)
 		return -ENOMEM;
 
 	/* Ask phyp to return all dimm perf stats */
-	rc = drc_pmem_query_stats(p, stats, 0);
+	rc = drc_pmem_query_stats(p, stats, 0, buff_len);
 	if (rc)
 		goto free_stats;
 	/*
@@ -891,7 +899,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	struct nd_region_desc ndr_desc;
 	unsigned long dimm_flags;
 	int target_nid, online_nid;
-	ssize_t stat_size;
 
 	p->bus_desc.ndctl = papr_scm_ndctl;
 	p->bus_desc.module = THIS_MODULE;
@@ -962,16 +969,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	list_add_tail(&p->region_list, &papr_nd_regions);
 	mutex_unlock(&papr_ndr_lock);
 
-	/* Try retriving the stat buffer and see if its supported */
-	stat_size = drc_pmem_query_stats(p, NULL, 0);
-	if (stat_size > 0) {
-		p->stat_buffer_len = stat_size;
-		dev_dbg(&p->pdev->dev, "Max perf-stat size %lu-bytes\n",
-			p->stat_buffer_len);
-	} else {
-		dev_info(&p->pdev->dev, "Dimm performance stats unavailable\n");
-	}
-
 	return 0;
 
 err:	nvdimm_bus_unregister(p->bus);
-- 
2.26.2

