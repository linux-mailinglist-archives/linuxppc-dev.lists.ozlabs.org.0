Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C422331EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 14:21:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHTzD6WPmzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 22:21:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHTpQ2D7lzDqcm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:13:34 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UC1kBJ037321; Thu, 30 Jul 2020 08:13:28 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32krumhg7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 08:13:27 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06UC1kLF037346;
 Thu, 30 Jul 2020 08:13:27 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32krumhg6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 08:13:27 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06UC9nvO024196;
 Thu, 30 Jul 2020 12:13:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32gcpx65k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 12:13:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06UCDMm825756000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 12:13:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22F04A405B;
 Thu, 30 Jul 2020 12:13:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FCEDA405F;
 Thu, 30 Jul 2020 12:13:19 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.89.216])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 30 Jul 2020 12:13:18 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Thu, 30 Jul 2020 17:43:18 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH v3 2/2] powerpc/papr_scm: Add support for fetching nvdimm
 'fuel-gauge' metric
Date: Thu, 30 Jul 2020 17:43:03 +0530
Message-Id: <20200730121303.134230-3-vaibhav@linux.ibm.com>
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
 phishscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=2 adultscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

We add support for reporting 'fuel-gauge' NVDIMM metric via
PAPR_PDSM_HEALTH pdsm payload. 'fuel-gauge' metric indicates the usage
life remaining of a papr-scm compatible NVDIMM. PHYP exposes this
metric via the H_SCM_PERFORMANCE_STATS.

The metric value is returned from the pdsm by extending the return
payload 'struct nd_papr_pdsm_health' without breaking the ABI. A new
field 'dimm_fuel_gauge' to hold the metric value is introduced at the
end of the payload struct and its presence is indicated by by
extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID.

The patch introduces a new function papr_pdsm_fuel_gauge() that is
called from papr_pdsm_health(). If fetching NVDIMM performance stats
is supported then 'papr_pdsm_fuel_gauge()' allocated an output buffer
large enough to hold the performance stat and passes it to
drc_pmem_query_stats() that issues the HCALL to PHYP. The return value
of the stat is then populated in the 'struct
nd_papr_pdsm_health.dimm_fuel_gauge' field with extension flag
'PDSM_DIMM_HEALTH_RUN_GAUGE_VALID' set in 'struct
nd_papr_pdsm_health.extension_flags'

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

v3:
* Updated papr_pdsm_fuel_guage() to use the updated
  drc_pmem_query_stats() function.

Resend:
None

v2:
* Restructure code in papr_pdsm_fuel_gauge() to handle error case
first [ Ira ]
* Ignore the return value of papr_pdsm_fuel_gauge() in
papr_psdm_health() [ Ira ]
---
 arch/powerpc/include/uapi/asm/papr_pdsm.h |  9 ++++
 arch/powerpc/platforms/pseries/papr_scm.c | 51 ++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
index 9ccecc1d6840..50ef95e2f5b1 100644
--- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
@@ -72,6 +72,11 @@
 #define PAPR_PDSM_DIMM_CRITICAL      2
 #define PAPR_PDSM_DIMM_FATAL         3
 
+/* struct nd_papr_pdsm_health.extension_flags field flags */
+
+/* Indicate that the 'dimm_fuel_gauge' field is valid */
+#define PDSM_DIMM_HEALTH_RUN_GAUGE_VALID 1
+
 /*
  * Struct exchanged between kernel & ndctl in for PAPR_PDSM_HEALTH
  * Various flags indicate the health status of the dimm.
@@ -84,6 +89,7 @@
  * dimm_locked		: Contents of the dimm cant be modified until CEC reboot
  * dimm_encrypted	: Contents of dimm are encrypted.
  * dimm_health		: Dimm health indicator. One of PAPR_PDSM_DIMM_XXXX
+ * dimm_fuel_gauge	: Life remaining of DIMM as a percentage from 0-100
  */
 struct nd_papr_pdsm_health {
 	union {
@@ -96,6 +102,9 @@ struct nd_papr_pdsm_health {
 			__u8 dimm_locked;
 			__u8 dimm_encrypted;
 			__u16 dimm_health;
+
+			/* Extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID */
+			__u16 dimm_fuel_gauge;
 		};
 		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
 	};
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 29cab86141d8..837a21083268 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -518,6 +518,51 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 	return 0;
 }
 
+static int papr_pdsm_fuel_gauge(struct papr_scm_priv *p,
+				union nd_pdsm_payload *payload)
+{
+	int rc, size;
+	u64 statval;
+	struct papr_scm_perf_stat *stat;
+	struct papr_scm_perf_stats *stats;
+
+	/* Silently fail if fetching performance metrics isn't  supported */
+	if (!p->stat_buffer_len)
+		return 0;
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
+	memcpy(&stat->stat_id, "MemLife ", sizeof(stat->stat_id));
+	stat->stat_val = 0;
+
+	/* Fetch the fuel gauge and populate it in payload */
+	rc = drc_pmem_query_stats(p, stats, 1);
+	if (rc < 0) {
+		dev_dbg(&p->pdev->dev, "Err(%d) fetching fuel gauge\n", rc);
+		goto free_stats;
+	}
+
+	statval = be64_to_cpu(stat->stat_val);
+	dev_dbg(&p->pdev->dev,
+		"Fetched fuel-gauge %llu", statval);
+	payload->health.extension_flags |=
+		PDSM_DIMM_HEALTH_RUN_GAUGE_VALID;
+	payload->health.dimm_fuel_gauge = statval;
+
+	rc = sizeof(struct nd_papr_pdsm_health);
+
+free_stats:
+	kfree(stats);
+	return rc;
+}
+
 /* Fetch the DIMM health info and populate it in provided package. */
 static int papr_pdsm_health(struct papr_scm_priv *p,
 			    union nd_pdsm_payload *payload)
@@ -558,6 +603,10 @@ static int papr_pdsm_health(struct papr_scm_priv *p,
 
 	/* struct populated hence can release the mutex now */
 	mutex_unlock(&p->health_mutex);
+
+	/* Populate the fuel gauge meter in the payload */
+	papr_pdsm_fuel_gauge(p, payload);
+
 	rc = sizeof(struct nd_papr_pdsm_health);
 
 out:
@@ -752,7 +801,7 @@ static ssize_t perf_stats_show(struct device *dev,
 		return -ENOMEM;
 
 	/* Ask phyp to return all dimm perf stats */
-	rc = drc_pmem_query_stats(p, stats, p->stat_buffer_len, 0, NULL);
+	rc = drc_pmem_query_stats(p, stats, 0);
 	if (rc)
 		goto free_stats;
 	/*
-- 
2.26.2

