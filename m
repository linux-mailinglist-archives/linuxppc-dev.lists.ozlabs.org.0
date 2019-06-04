Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3BB3430E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 11:22:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J5zv1XBmzDqT6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 19:22:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J5qt3WZPzDqHg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 19:15:38 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5498WA0038734
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Jun 2019 05:15:36 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2swnffs192-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 05:15:35 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 4 Jun 2019 10:15:34 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 4 Jun 2019 10:15:31 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x549EG1W19136674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jun 2019 09:14:16 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30FF8AC059;
 Tue,  4 Jun 2019 09:14:16 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5B11AC06C;
 Tue,  4 Jun 2019 09:14:14 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.234])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jun 2019 09:14:14 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com
Subject: [PATCH v3 3/6] mm/nvdimm: Add page size and struct page size to pfn
 superblock
Date: Tue,  4 Jun 2019 14:43:54 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604091357.32213-1-aneesh.kumar@linux.ibm.com>
References: <20190604091357.32213-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060409-0060-0000-0000-0000034BD878
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011212; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01213038; UDB=6.00637528; IPR=6.00994105; 
 MB=3.00027178; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-04 09:15:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060409-0061-0000-0000-0000499E0CF1
Message-Id: <20190604091357.32213-3-aneesh.kumar@linux.ibm.com>
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

This is needed so that we don't wrongly initialize a namespace
which doesn't have enough space reserved for holding struct pages
with the current kernel.

We also increment PFN_MIN_VERSION to make sure that older kernel
won't initialize namespace created with newer kernel.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/nvdimm/pfn.h      |  7 +++++--
 drivers/nvdimm/pfn_devs.c | 27 ++++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/nvdimm/pfn.h b/drivers/nvdimm/pfn.h
index 5fd29242745a..ba11738ca8a2 100644
--- a/drivers/nvdimm/pfn.h
+++ b/drivers/nvdimm/pfn.h
@@ -25,7 +25,7 @@
  * kernel should fail to initialize that namespace.
  */
 
-#define PFN_MIN_VERSION 0
+#define PFN_MIN_VERSION 1
 
 struct nd_pfn_sb {
 	u8 signature[PFN_SIG_LEN];
@@ -43,7 +43,10 @@ struct nd_pfn_sb {
 	/* minor-version-2 record the base alignment of the mapping */
 	__le32 align;
 	__le16 min_version;
-	u8 padding[3998];
+	/* minor-version-3 record the page size and struct page size */
+	__le16 page_struct_size;
+	__le32 page_size;
+	u8 padding[3992];
 	__le64 checksum;
 };
 
diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
index 00c57805cad3..e01eee9efafe 100644
--- a/drivers/nvdimm/pfn_devs.c
+++ b/drivers/nvdimm/pfn_devs.c
@@ -467,6 +467,15 @@ int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
 	if (__le16_to_cpu(pfn_sb->version_minor) < 2)
 		pfn_sb->align = 0;
 
+	if (__le16_to_cpu(pfn_sb->version_minor) < 3) {
+		/*
+		 * For a large part we use PAGE_SIZE. But we
+		 * do have some accounting code using SZ_4K.
+		 */
+		pfn_sb->page_struct_size = cpu_to_le16(64);
+		pfn_sb->page_size = cpu_to_le32(SZ_4K);
+	}
+
 	switch (le32_to_cpu(pfn_sb->mode)) {
 	case PFN_MODE_RAM:
 	case PFN_MODE_PMEM:
@@ -482,6 +491,20 @@ int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
 		align = 1UL << ilog2(offset);
 	mode = le32_to_cpu(pfn_sb->mode);
 
+	if (le32_to_cpu(pfn_sb->page_size) != PAGE_SIZE) {
+		dev_err(&nd_pfn->dev,
+			"init failed, page size mismatch %d\n",
+			le32_to_cpu(pfn_sb->page_size));
+		return -EOPNOTSUPP;
+	}
+
+	if (le16_to_cpu(pfn_sb->page_struct_size) != sizeof(struct page)) {
+		dev_err(&nd_pfn->dev,
+			"init failed, struct page size mismatch %d\n",
+			le16_to_cpu(pfn_sb->page_struct_size));
+		return -EOPNOTSUPP;
+	}
+
 	if (!nd_pfn->uuid) {
 		/*
 		 * When probing a namepace via nd_pfn_probe() the uuid
@@ -776,11 +799,13 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
 	memcpy(pfn_sb->uuid, nd_pfn->uuid, 16);
 	memcpy(pfn_sb->parent_uuid, nd_dev_to_uuid(&ndns->dev), 16);
 	pfn_sb->version_major = cpu_to_le16(1);
-	pfn_sb->version_minor = cpu_to_le16(2);
+	pfn_sb->version_minor = cpu_to_le16(3);
 	pfn_sb->min_version = cpu_to_le16(PFN_MIN_VERSION);
 	pfn_sb->start_pad = cpu_to_le32(start_pad);
 	pfn_sb->end_trunc = cpu_to_le32(end_trunc);
 	pfn_sb->align = cpu_to_le32(nd_pfn->align);
+	pfn_sb->page_struct_size = cpu_to_le16(sizeof(struct page));
+	pfn_sb->page_size = cpu_to_le32(PAGE_SIZE);
 	checksum = nd_sb_checksum((struct nd_gen_sb *) pfn_sb);
 	pfn_sb->checksum = cpu_to_le64(checksum);
 
-- 
2.21.0

