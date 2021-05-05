Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 116DE374893
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 21:17:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb61J0jgdz30KL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 05:17:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HJlYbOBM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HJlYbOBM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb60q4dcjz2yxT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 05:17:31 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145J3hOF074384; Wed, 5 May 2021 15:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CG2al3hSqt/RfzfZJSJhkYslBqi2MkHyCpd7i0W29mo=;
 b=HJlYbOBMtxdzU3L1u27J8E10jx9Dp6C+KZWiQwpfhMOX/fAppNCakRk+C1Lp5CMI9/K5
 yVEti1HcfuKCE8Eqs3n9JyT6fULe0Sfj6l0B3Ieh/u/8UHf2cPwp86BrUwh/KKGvEXDa
 9MvGZgifcAlSbt1Y+gLJW2zutq9cb1ddtBvdPF9VYJPHJfmly7W7wYF4EqZ4k6mVduk6
 Z3hFxOA4YUZQkAnElgFC5nQnNEkU/K+xci6nK8uKuSNQT4BhrTqvKGY9q0nSBC6zYSfs
 VWcwN3DVWFyMMeE6ZWZiCbSyfyOcHIJBzJjaUncJHWeqWEnc82IDR7bHkSpkX9BY/FT4 Wg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38by55bu98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 15:17:23 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 145Is45b001829;
 Wed, 5 May 2021 19:17:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 38bedxrfj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 19:17:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 145JGq1A25887036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 19:16:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D12511C050;
 Wed,  5 May 2021 19:17:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1676E11C054;
 Wed,  5 May 2021 19:17:15 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.88.241])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  5 May 2021 19:17:14 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 06 May 2021 00:47:13 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH] powerpc/papr_scm: Make 'perf_stats' invisible if perf-stats
 unavailable
Date: Thu,  6 May 2021 00:47:08 +0530
Message-Id: <20210505191708.51939-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n8oPt03_YxPuEPOCAflDcEE40Kfwf24g
X-Proofpoint-ORIG-GUID: n8oPt03_YxPuEPOCAflDcEE40Kfwf24g
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_09:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=8
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105050130
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

In case performance stats for an nvdimm are not available, reading the
'perf_stats' sysfs file returns an -ENOENT error. A better approach is
to make the 'perf_stats' file entirely invisible to indicate that
performance stats for an nvdimm are unavailable.

So this patch updates 'papr_nd_attribute_group' to add a 'is_visible'
callback implemented as newly introduced 'papr_nd_attribute_visible()'
that returns an appropriate mode in case performance stats aren't
supported in a given nvdimm.

Also the initialization of 'papr_scm_priv.stat_buffer_len' is moved
from papr_scm_nvdimm_init() to papr_scm_probe() so that it value is
available when 'papr_nd_attribute_visible()' is called during nvdimm
initialization.

Fixes: 2d02bf835e57('powerpc/papr_scm: Fetch nvdimm performance stats from PHYP')
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 37 ++++++++++++++++-------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 12f1513f0fca..90f0af8fefe8 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -907,6 +907,20 @@ static ssize_t flags_show(struct device *dev,
 }
 DEVICE_ATTR_RO(flags);
 
+umode_t papr_nd_attribute_visible(struct kobject *kobj, struct attribute *attr,
+				  int n)
+{
+	struct device *dev = container_of(kobj, typeof(*dev), kobj);
+	struct nvdimm *nvdimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(nvdimm);
+
+	/* For if perf-stats not available remove perf_stats sysfs */
+	if (attr == &dev_attr_perf_stats.attr && p->stat_buffer_len == 0)
+		return 0;
+
+	return attr->mode;
+}
+
 /* papr_scm specific dimm attributes */
 static struct attribute *papr_nd_attributes[] = {
 	&dev_attr_flags.attr,
@@ -916,6 +930,7 @@ static struct attribute *papr_nd_attributes[] = {
 
 static struct attribute_group papr_nd_attribute_group = {
 	.name = "papr",
+	.is_visible = papr_nd_attribute_visible,
 	.attrs = papr_nd_attributes,
 };
 
@@ -931,7 +946,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	struct nd_region_desc ndr_desc;
 	unsigned long dimm_flags;
 	int target_nid, online_nid;
-	ssize_t stat_size;
 
 	p->bus_desc.ndctl = papr_scm_ndctl;
 	p->bus_desc.module = THIS_MODULE;
@@ -1016,16 +1030,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
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
@@ -1102,6 +1106,7 @@ static int papr_scm_probe(struct platform_device *pdev)
 	u64 blocks, block_size;
 	struct papr_scm_priv *p;
 	const char *uuid_str;
+	ssize_t stat_size;
 	u64 uuid[2];
 	int rc;
 
@@ -1179,6 +1184,16 @@ static int papr_scm_probe(struct platform_device *pdev)
 	p->res.name  = pdev->name;
 	p->res.flags = IORESOURCE_MEM;
 
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
 	rc = papr_scm_nvdimm_init(p);
 	if (rc)
 		goto err2;
-- 
2.31.1

