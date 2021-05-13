Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701137F4C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 11:24:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgmT31BKKz3035
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 19:24:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c34lUQfd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=c34lUQfd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgmSW0R8Wz2y07
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 19:24:10 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14D93JUX009494; Thu, 13 May 2021 05:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ryN0cK0VEnUDDLi9cNe0YnZJElAltNa6aSauAkXvWJ8=;
 b=c34lUQfdeQwuqIy3sVDzfGdmdvg7DqjcSMPMKhLAKPEN0wKzPLVNv0tLf1vpTVXReApe
 JLXUS6n/bPye40kNBGxThHwNC/vTtenlNtkoPRDieSub2uAOZ/y2mt4u8RlmFv1Vmz9c
 aDljxo5IX85bU0XunXTzyXS6Sz2nqKJQ7aZUDOs7xn2r7RN5UYtEpQKh+VyTxgI5mCmt
 c5oRx+Rj/GepjFZeDUBSPeIe0cAClY2z5IvlcdgFMHXy37Wi0nTThKwqzJZI7tAK2NU6
 pteua86AZg3zzAnT+wC+2cX8nmvujMAPmwUMmPOxG9XMP2uRQUgMh6d10AnSwvvy7eOD fA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38gyp0jrcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 May 2021 05:23:59 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14D9D2XJ017841;
 Thu, 13 May 2021 09:23:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 38dj98amvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 May 2021 09:23:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14D9Nsne33554836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 09:23:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAD7511C050;
 Thu, 13 May 2021 09:23:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DB9511C04C;
 Thu, 13 May 2021 09:23:51 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.77.192.67])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 13 May 2021 09:23:51 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 13 May 2021 14:53:50 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH v3] powerpc/papr_scm: Make 'perf_stats' invisible if
 perf-stats unavailable
Date: Thu, 13 May 2021 14:53:49 +0530
Message-Id: <20210513092349.285021-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZictZ_Zq2c1YETdp6V0OM1XYZThyw_Vs
X-Proofpoint-ORIG-GUID: ZictZ_Zq2c1YETdp6V0OM1XYZThyw_Vs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-13_04:2021-05-12,
 2021-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105130070
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

Even though 'perf_stats' attribute is available since v5.9, there are
no known user-space tools/scripts that are dependent on presence of its
sysfs file. Hence I dont expect any user-space breakage with this
patch.

Fixes: 2d02bf835e57('powerpc/papr_scm: Fetch nvdimm performance stats from PHYP')
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

v3:
* Minor spell corrections [ Dan Williams ]
* Switched to kobj_to_dev() helper in papr_nd_attribute_visible() [
  Dan Williams ]
* Updated ABI/../sysfs-bus-papr-pmem to indicate that the attribute is
  only available for devices that support performance stats.
* Updated patch description.

v2:
* Removed a redundant dev_info() from pap_scm_nvdimm_init() [ Aneesh ]
* Marked papr_nd_attribute_visible() as static which also fixed the
  build warning reported by kernel build robot
---
 Documentation/ABI/testing/sysfs-bus-papr-pmem |  8 +++--
 arch/powerpc/platforms/pseries/papr_scm.c     | 35 +++++++++++++------
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
index 8316c33862a0..0aa02bf2bde5 100644
--- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
+++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
@@ -39,9 +39,11 @@ KernelVersion:	v5.9
 Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-nvdimm@lists.01.org,
 Description:
 		(RO) Report various performance stats related to papr-scm NVDIMM
-		device.  Each stat is reported on a new line with each line
-		composed of a stat-identifier followed by it value. Below are
-		currently known dimm performance stats which are reported:
+		device. This attribute is only available for NVDIMM devices
+		that support reporting NVDIMM performance stats. Each stat is
+		reported on a new line with each line composed of a
+		stat-identifier followed by it value. Below are currently known
+		dimm performance stats which are reported:
 
 		* "CtlResCt" : Controller Reset Count
 		* "CtlResTm" : Controller Reset Elapsed Time
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index e2b69cc3beaf..e8577e7e49ab 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -907,6 +907,20 @@ static ssize_t flags_show(struct device *dev,
 }
 DEVICE_ATTR_RO(flags);
 
+static umode_t papr_nd_attribute_visible(struct kobject *kobj,
+					 struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
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
 
@@ -1179,6 +1184,14 @@ static int papr_scm_probe(struct platform_device *pdev)
 	p->res.name  = pdev->name;
 	p->res.flags = IORESOURCE_MEM;
 
+	/* Try retrieving the stat buffer and see if its supported */
+	stat_size = drc_pmem_query_stats(p, NULL, 0);
+	if (stat_size > 0) {
+		p->stat_buffer_len = stat_size;
+		dev_dbg(&p->pdev->dev, "Max perf-stat size %lu-bytes\n",
+			p->stat_buffer_len);
+	}
+
 	rc = papr_scm_nvdimm_init(p);
 	if (rc)
 		goto err2;
-- 
2.31.1

