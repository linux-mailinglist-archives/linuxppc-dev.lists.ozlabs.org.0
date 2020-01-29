Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A914CD73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:34:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4876wR4YCnzDqDd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 02:34:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4876pP5XtvzDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 02:29:01 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TFENHB122836
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:28:59 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xu6srbvr3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:28:59 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Wed, 29 Jan 2020 15:28:57 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 15:28:55 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TFSrUh54919416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 15:28:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97B4352052;
 Wed, 29 Jan 2020 15:28:53 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.195])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3B75352050;
 Wed, 29 Jan 2020 15:28:52 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/6] powerpc/papr_scm: Fetch dimm performance stats from
 PHYP
Date: Wed, 29 Jan 2020 20:58:40 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129152844.71286-1-vaibhav@linux.ibm.com>
References: <20200129152844.71286-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012915-0016-0000-0000-000002E1CC7F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012915-0017-0000-0000-0000334492F4
Message-Id: <20200129152844.71286-3-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Implement support for fetching dimm performance metrics via
H_SCM_PERFORMANCE_HEALTH hcall as documented in Ref[1]. The hcall
returns a structure as described in Ref[1] and defined as newly
introduced 'struct papr_scm_perf_stats'. The struct has a header
followed by key-value pairs of performance attributes.

The module 'papr_scm' however doesn't interpret or parses these
performance attributes as it will be returning this buffer as it is to
user-space for further parsing. For now we only implement a dimm
specific sysfs attribute named 'papr_stats_version' that returns the
version of the structure returned from H_SCM_PERFORMANCE_HEALTH hcall.

Hence this patch implements a new function drc_pmem_query_stats() that
issues hcall H_SCM_PERFORMANCE_HEALTH ,requesting PHYP to store
performance stats in pre-allocated 'struct papr_scm_perf_stats' buffer
'stats'.

References:
[1]: https://patchwork.ozlabs.org/patch/1154292/

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 56 +++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 1a0cc66f3dc9..deaece6e4d18 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -22,6 +22,16 @@
 	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
 	 (1ul << ND_CMD_SET_CONFIG_DATA))
 
+#define PAPR_SCM_MAX_PERF_STAT 4096
+
+/* Buffer layout returned by phyp when reporting drc perf stats */
+struct papr_scm_perf_stats {
+	uint8_t version;		/* Should be 0x01 */
+	uint8_t reserved1;
+	__be16 size;			/* Size of this struct in bytes */
+	uint8_t buffer[];		/* Performance matrics */
+} __packed;
+
 struct papr_scm_priv {
 	struct platform_device *pdev;
 	struct device_node *dn;
@@ -148,6 +158,25 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
 	return drc_pmem_bind(p);
 }
 
+static int drc_pmem_query_stats(struct papr_scm_priv *p,
+				struct papr_scm_perf_stats *stats)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	int64_t rc;
+
+	if (!stats)
+		return -EINVAL;
+
+	rc = plpar_hcall(H_SCM_PERFORMANCE_STATS, ret, p->drc_index,
+			 __pa(stats));
+	if (rc != H_SUCCESS) {
+		dev_err(&p->pdev->dev,
+			 "Failed to query performance stats, Err:%lld\n", rc);
+		return -ENXIO;
+	} else
+		return 0;
+}
+
 static int drc_pmem_query_health(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
@@ -332,6 +361,32 @@ static inline int papr_scm_node(int node)
 	return min_node;
 }
 
+static ssize_t papr_stats_version_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+	struct papr_scm_perf_stats *retbuffer;
+	int rc;
+
+	/* Return buffer for phyp where stats are written */
+	retbuffer = kzalloc(PAPR_SCM_MAX_PERF_STAT, GFP_KERNEL);
+	if (!retbuffer)
+		return -ENOMEM;
+
+	rc = drc_pmem_query_stats(p, retbuffer);
+	if (rc)
+		goto out;
+	else
+		rc = sprintf(buf, "%d\n", retbuffer->version);
+
+out:
+	kfree(retbuffer);
+	return rc;
+
+}
+DEVICE_ATTR_RO(papr_stats_version);
+
 static ssize_t papr_health_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -353,6 +408,7 @@ DEVICE_ATTR_RO(papr_health);
 /* papr_scm specific dimm attributes */
 static struct attribute *papr_scm_nd_attributes[] = {
 	&dev_attr_papr_health.attr,
+	&dev_attr_papr_stats_version.attr,
 	NULL,
 };
 
-- 
2.24.1

