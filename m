Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE52165B1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 11:06:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NVcY163qzDqcc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 21:06:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NVR36j8VzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 20:58:39 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01K9tHPZ099083
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 04:58:37 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8ubyaja6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 04:58:36 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Thu, 20 Feb 2020 09:58:35 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 09:58:33 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01K9wUrd57868522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 09:58:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B19AA4053;
 Thu, 20 Feb 2020 09:58:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2860A4040;
 Thu, 20 Feb 2020 09:58:27 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.199.53.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 09:58:27 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/8] powerpc/papr_scm: Fetch dimm performance stats from PHYP
Date: Thu, 20 Feb 2020 15:28:00 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220095805.197229-1-vaibhav@linux.ibm.com>
References: <20200220095805.197229-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022009-0012-0000-0000-000003888D53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022009-0013-0000-0000-000021C5238C
Message-Id: <20200220095805.197229-4-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_02:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=1 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200073
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement support for fetching dimm performance metrics via
H_SCM_PERFORMANCE_HEALTH hcall as documented in Ref[1]. The hcall
returns a structure as described in Ref[1] and defined as newly
introduced 'struct papr_scm_perf_stats'. The struct has a header
followed by key-value pairs of performance attributes. The 'key' part
is a 8-byte char array naming the attribute encoded as a __be64
integer. This makes the output buffer format for the hcall self
describing and can be easily interpreted.

This patch implements functionality to fetch these performance stats
and reporting them via a nvdimm sysfs attribute named
'papr_perf_stats'.

A new function drc_pmem_query_stats() is implemented that issues hcall
H_SCM_PERFORMANCE_HEALTH ,requesting PHYP to store performance stats
in pre-allocated 'struct papr_scm_perf_stats' buffer. During nvdimm
initialization in papr_scm_nvdimm_init() this function is called with
an empty buffer to know the max buffer size needed for issuing the
H_SCM_PERFORMANCE_HEALTH hcall. The buffer size retrieved is stored in
newly introduced 'struct papc_scm_priv.len_stat_buffer' for later
retrival.

[1]: commit 58b278f568f0 ("powerpc: Provide initial documentation for
PAPR hcalls")

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 107 ++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index aaf2e4ab1f75..28143a681aa2 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -47,6 +47,9 @@ struct papr_scm_priv {
 	/* Health information for the dimm */
 	__be64 health_bitmap;
 	__be64 health_bitmap_valid;
+
+	/* length of the stat buffer as expected by phyp */
+	size_t len_stat_buffer;
 };
 
 static int drc_pmem_bind(struct papr_scm_priv *p)
@@ -152,6 +155,50 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
 	return drc_pmem_bind(p);
 }
 
+static int drc_pmem_query_stats(struct papr_scm_priv *p,
+				struct papr_scm_perf_stats *stats,
+				size_t size, uint64_t *out)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	int64_t rc;
+
+	/* In case of no out buffer ignore the size */
+	if (!stats)
+		size = 0;
+
+	/*
+	 * Do the HCALL asking PHYP for info and if R4 was requested
+	 * return its value in 'out' variable.
+	 */
+	rc = plpar_hcall(H_SCM_PERFORMANCE_STATS, ret, p->drc_index,
+			 __pa(stats), size);
+	if (out)
+		*out =  be64_to_cpu(ret[0]);
+
+	switch (rc) {
+	case H_SUCCESS:
+		/* Handle the case where size of stat buffer was requested */
+		if (size != 0)
+			dev_dbg(&p->pdev->dev,
+				"Performance stats returned %d stats\n",
+				be32_to_cpu(stats->num_statistics));
+		else
+			dev_dbg(&p->pdev->dev,
+				"Performance stats size %lld\n",
+				be64_to_cpu(ret[0]));
+		return 0;
+	case H_PARTIAL:
+		dev_err(&p->pdev->dev,
+			 "Unknown performance stats, Err:0x%016llX\n",
+			be64_to_cpu(ret[0]));
+		return -ENOENT;
+	default:
+		dev_err(&p->pdev->dev,
+			 "Failed to query performance stats, Err:%lld\n", rc);
+		return -ENXIO;
+	}
+}
+
 static int drc_pmem_query_health(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
@@ -341,6 +388,53 @@ static inline int papr_scm_node(int node)
 	return min_node;
 }
 
+static ssize_t papr_perf_stats_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+	struct papr_scm_perf_stats *retbuffer;
+	struct papr_scm_perf_stat *stat;
+	uint64_t statid, val;
+	int rc, i;
+
+	if (!p->len_stat_buffer)
+		return -ENOENT;
+
+	/* Return buffer for phyp where stats are written */
+	retbuffer = kzalloc(p->len_stat_buffer, GFP_KERNEL);
+	if (!retbuffer)
+		return -ENOMEM;
+
+	/* Setup the buffer */
+	memcpy(retbuffer->eye_catcher, PAPR_SCM_PERF_STATS_EYECATCHER,
+	       sizeof(retbuffer->eye_catcher));
+	retbuffer->stats_version = cpu_to_be32(0x1);
+	retbuffer->num_statistics = 0;
+
+	rc = drc_pmem_query_stats(p, retbuffer, p->len_stat_buffer, NULL);
+	if (rc)
+		goto out;
+
+	/*
+	 * Go through the returned output buffer and print stats and values.
+	 * Since statistic_id is essentially a char string of 8 bytes encoded
+	 * as a __be64, simply use the string format specifier to print it.
+	 */
+	for (i = 0, stat = retbuffer->scm_statistics;
+	    i < be32_to_cpu(retbuffer->num_statistics); ++i, ++stat) {
+		statid = be64_to_cpu(stat->statistic_id);
+		val = be64_to_cpu(stat->statistic_value);
+		rc += sprintf(buf + rc, "%.8s => 0x%016llX\n",
+			      (char *) &(statid), val);
+	}
+out:
+	kfree(retbuffer);
+	return rc;
+
+}
+DEVICE_ATTR_RO(papr_perf_stats);
+
 static ssize_t papr_flags_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -390,6 +484,7 @@ DEVICE_ATTR_RO(papr_flags);
 /* papr_scm specific dimm attributes */
 static struct attribute *papr_scm_nd_attributes[] = {
 	&dev_attr_papr_flags.attr,
+	&dev_attr_papr_perf_stats.attr,
 	NULL,
 };
 
@@ -409,6 +504,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	struct nd_region_desc ndr_desc;
 	unsigned long dimm_flags;
 	int target_nid, online_nid;
+	uint64_t stat_size;
 
 	p->bus_desc.ndctl = papr_scm_ndctl;
 	p->bus_desc.module = THIS_MODULE;
@@ -470,6 +566,17 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 		dev_info(dev, "Region registered with target node %d and online node %d",
 			 target_nid, online_nid);
 
+	/* Try retriving the stat buffer and see if its supported */
+	if (!drc_pmem_query_stats(p, NULL, 0, &stat_size)) {
+		p->len_stat_buffer = (size_t)stat_size;
+		dev_dbg(&p->pdev->dev, "Max dimm perf stats size %ld bytes\n",
+			p->len_stat_buffer);
+	} else {
+		p->len_stat_buffer = 0;
+		dev_dbg(&p->pdev->dev, "Unable to retrieve performace stats\n");
+		dev_info(&p->pdev->dev, "Limited dimm info available\n");
+	}
+
 	return 0;
 
 err:	nvdimm_bus_unregister(p->bus);
-- 
2.24.1

