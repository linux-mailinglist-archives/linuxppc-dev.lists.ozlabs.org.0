Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2058E6F60
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 10:52:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471qkw2S6tzDr3X
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 20:52:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471qfj5CqFzDqxg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 20:48:45 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9S9lWOK146660; Mon, 28 Oct 2019 05:48:37 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vwt4x6dh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2019 05:48:37 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9S9jBAT013274;
 Mon, 28 Oct 2019 09:48:36 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2vvds8n21g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2019 09:48:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9S9mYvo51249518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Oct 2019 09:48:34 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6EF1C605D;
 Mon, 28 Oct 2019 09:48:34 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E450AC6055;
 Mon, 28 Oct 2019 09:48:32 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.43.125])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 28 Oct 2019 09:48:32 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com, mpe@ellerman.id.au
Subject: [RFC PATCH 2/4] libnvdimm/namespace: Disable the region if the
 namespace size is not aligned correctly
Date: Mon, 28 Oct 2019 15:18:23 +0530
Message-Id: <20191028094825.21448-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-28_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=978 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910280098
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During namespace initialization, if kernel finds the namespace size not
aligned as per arch-specific restriction, disable the region completely.

Even though kernel validates the namespace size while creating the namespace
nvdimm core still needs to make sure namespaces with wrong size are not initialized.
This can happen when users move SCM across different architectures and with
architectures like ppc64 when we use different MMU translation modes.

ppc64 allow booting systems with different translation mode based on kernel
parameter and the two translation mode (hash and radix) have different
direct-map page size restrictions.

Marking the region disabled enables the user to either re-init the namespace
using the dimm interface or boot back to the right kernel supporting the alignment.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/nvdimm/namespace_devs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index cca0a3ba1d2c..fcde9f2bf2ea 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -1912,6 +1912,7 @@ static struct device *create_namespace_pmem(struct nd_region *nd_region,
 	struct nd_label_ent *label_ent;
 	struct nd_namespace_pmem *nspm;
 	struct nd_mapping *nd_mapping;
+	unsigned long map_align_size;
 	resource_size_t size = 0;
 	struct resource *res;
 	struct device *dev;
@@ -2010,6 +2011,20 @@ static struct device *create_namespace_pmem(struct nd_region *nd_region,
 
 	}
 
+	map_align_size = arch_validate_namespace_size(nd_region->ndr_mappings, size);
+	if (map_align_size) {
+		dev_err(&nd_region->dev, "%llu is not %ldK aligned\n", size,
+				map_align_size/ SZ_1K);
+		/*
+		 * Disable this region completely. A wrongly sized namespace
+		 * size implies the start address of other namespace would also
+		 * be wrong and we would find confusing crashes w.r.t
+		 * direct-map address.
+		 */
+		rc = -EINVAL;
+		goto err;
+	}
+
 	if (!nspm->alt_name || !nspm->uuid) {
 		rc = -ENOMEM;
 		goto err;
-- 
2.21.0

