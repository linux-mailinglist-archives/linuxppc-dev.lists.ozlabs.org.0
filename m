Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30F342FF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 11:17:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J5sZ54FczDqVv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 19:17:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J5pR01pjzDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 19:14:22 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5497kog086150
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Jun 2019 05:14:20 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2swmh0uwqr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 05:14:20 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 4 Jun 2019 10:14:19 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 4 Jun 2019 10:14:15 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x549EEnU15007958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jun 2019 09:14:14 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 528DCAC05F;
 Tue,  4 Jun 2019 09:14:14 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6809AC060;
 Tue,  4 Jun 2019 09:14:12 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.234])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jun 2019 09:14:12 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com
Subject: [PATCH v3 2/6] mm/nvdimm: Add PFN_MIN_VERSION support
Date: Tue,  4 Jun 2019 14:43:53 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604091357.32213-1-aneesh.kumar@linux.ibm.com>
References: <20190604091357.32213-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060409-0052-0000-0000-000003CB0714
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011212; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01213037; UDB=6.00637527; IPR=6.00994104; 
 MB=3.00027178; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-04 09:14:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060409-0053-0000-0000-0000612A42D4
Message-Id: <20190604091357.32213-2-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906040061
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows us to make changes in a backward incompatible way. I have
kept the PFN_MIN_VERSION in this patch '0' because we are not introducing
any incompatible changes in this patch. We also may want to backport this
to older kernels.

The error looks like

  dax0.1: init failed, superblock min version 1, kernel support version 0

and the namespace is marked disabled

$ndctl list -Ni
[
  {
    "dev":"namespace0.0",
    "mode":"fsdax",
    "map":"mem",
    "size":10737418240,
    "uuid":"9605de6d-cefa-4a87-99cd-dec28b02cffe",
    "state":"disabled"
  }
]

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/nvdimm/pfn.h      |  9 ++++++++-
 drivers/nvdimm/pfn_devs.c |  9 +++++++++
 drivers/nvdimm/pmem.c     | 26 ++++++++++++++++++++++----
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/nvdimm/pfn.h b/drivers/nvdimm/pfn.h
index dde9853453d3..5fd29242745a 100644
--- a/drivers/nvdimm/pfn.h
+++ b/drivers/nvdimm/pfn.h
@@ -20,6 +20,12 @@
 #define PFN_SIG_LEN 16
 #define PFN_SIG "NVDIMM_PFN_INFO\0"
 #define DAX_SIG "NVDIMM_DAX_INFO\0"
+/*
+ * increment this when we are making changes such that older
+ * kernel should fail to initialize that namespace.
+ */
+
+#define PFN_MIN_VERSION 0
 
 struct nd_pfn_sb {
 	u8 signature[PFN_SIG_LEN];
@@ -36,7 +42,8 @@ struct nd_pfn_sb {
 	__le32 end_trunc;
 	/* minor-version-2 record the base alignment of the mapping */
 	__le32 align;
-	u8 padding[4000];
+	__le16 min_version;
+	u8 padding[3998];
 	__le64 checksum;
 };
 
diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
index 01f40672507f..00c57805cad3 100644
--- a/drivers/nvdimm/pfn_devs.c
+++ b/drivers/nvdimm/pfn_devs.c
@@ -439,6 +439,14 @@ int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
 	if (nvdimm_read_bytes(ndns, SZ_4K, pfn_sb, sizeof(*pfn_sb), 0))
 		return -ENXIO;
 
+	if (le16_to_cpu(pfn_sb->min_version) > PFN_MIN_VERSION) {
+		dev_err(&nd_pfn->dev,
+			"init failed, superblock min version %d kernel"
+			" support version %d\n",
+			le16_to_cpu(pfn_sb->min_version), PFN_MIN_VERSION);
+		return -EOPNOTSUPP;
+	}
+
 	if (memcmp(pfn_sb->signature, sig, PFN_SIG_LEN) != 0)
 		return -ENODEV;
 
@@ -769,6 +777,7 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
 	memcpy(pfn_sb->parent_uuid, nd_dev_to_uuid(&ndns->dev), 16);
 	pfn_sb->version_major = cpu_to_le16(1);
 	pfn_sb->version_minor = cpu_to_le16(2);
+	pfn_sb->min_version = cpu_to_le16(PFN_MIN_VERSION);
 	pfn_sb->start_pad = cpu_to_le32(start_pad);
 	pfn_sb->end_trunc = cpu_to_le32(end_trunc);
 	pfn_sb->align = cpu_to_le32(nd_pfn->align);
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index d9d845077b8b..eddc28e8c357 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -496,6 +496,7 @@ static int pmem_attach_disk(struct device *dev,
 
 static int nd_pmem_probe(struct device *dev)
 {
+	int ret;
 	struct nd_namespace_common *ndns;
 
 	ndns = nvdimm_namespace_common_probe(dev);
@@ -511,12 +512,29 @@ static int nd_pmem_probe(struct device *dev)
 	if (is_nd_pfn(dev))
 		return pmem_attach_disk(dev, ndns);
 
-	/* if we find a valid info-block we'll come back as that personality */
-	if (nd_btt_probe(dev, ndns) == 0 || nd_pfn_probe(dev, ndns) == 0
-			|| nd_dax_probe(dev, ndns) == 0)
+	ret = nd_btt_probe(dev, ndns);
+	if (ret == 0)
 		return -ENXIO;
+	else if (ret == -EOPNOTSUPP)
+		return ret;
 
-	/* ...otherwise we're just a raw pmem device */
+	ret = nd_pfn_probe(dev, ndns);
+	if (ret == 0)
+		return -ENXIO;
+	else if (ret == -EOPNOTSUPP)
+		return ret;
+
+	ret = nd_dax_probe(dev, ndns);
+	if (ret == 0)
+		return -ENXIO;
+	else if (ret == -EOPNOTSUPP)
+		return ret;
+	/*
+	 * We have two failure conditions here, there is no
+	 * info reserver block or we found a valid info reserve block
+	 * but failed to initialize the pfn superblock.
+	 * Don't create a raw pmem disk for the second case.
+	 */
 	return pmem_attach_disk(dev, ndns);
 }
 
-- 
2.21.0

