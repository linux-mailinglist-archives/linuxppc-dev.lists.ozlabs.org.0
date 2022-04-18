Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF41504B71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 05:56:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhY4z3Skwz3bcj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 13:56:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=efVzmGFj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=efVzmGFj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhY4D36hvz2xSN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 13:55:23 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23I10qHQ002530; 
 Mon, 18 Apr 2022 03:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=SlDrnwNzn68eRrRjkncFbXlNdKvQzdsDZZIqRdV+i4U=;
 b=efVzmGFjyNGa/DG89wvuhlaayEyyBxRoaTbkBCMw76mgUZo5DJE71aU3TMPcvRNLx3fa
 BtIEWqPQ46BXzSUg/hI7WRKHvI/SCOI2J2xvpDVgZ8uPDoXMObb+j9TsnEcYU2Z54Ma7
 C5RYlN+lnaKXefeZA5mRjtHBUf2XDP0UUFJJluKFw1ZKY3aE34HPjFLgCBZPdIswFzhZ
 3uGtaAnyx+JMfAfbmNhhdGnkADvd7YOdJJL9REAsE3ciPTGPZ8RfQGgexyYzXRKxdRoe
 5qC6x2oJil3a5iKL6ALkQdMQ4hrjpKpaWGwC9wWdzGtEoAEg66VrjLg5ZXpdxEhR1maz MA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg79w330k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 03:55:08 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23I3r1fF014236;
 Mon, 18 Apr 2022 03:55:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3ffne925vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 03:55:06 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23I3t3x342467738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 03:55:03 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14110A4060;
 Mon, 18 Apr 2022 03:55:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4A30A4067;
 Mon, 18 Apr 2022 03:55:01 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 03:55:01 +0000 (GMT)
Subject: [PATCH] ndtest: Cleanup all of blk namespace specific code
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: nvdimm@lists.linux.dev
Date: Sun, 17 Apr 2022 22:55:00 -0500
Message-ID: <165025395730.2821159.14794984437851867426.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/1.1+40.g1b20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n9Gw6zysOMAxu2YikPzSvln8lcd4NPmE
X-Proofpoint-ORIG-GUID: n9Gw6zysOMAxu2YikPzSvln8lcd4NPmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_01,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 mlxlogscore=954 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204180019
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
Cc: sbhat@linux.ibm.com, ira.weiny@intel.com, aneesh.kumar@linux.ibm.com,
 vaibhav@linux.ibm.com, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the nd_namespace_blk and nd_blk_region infrastructures being removed,
the ndtest still has some references to the old code. So the
compilation fails as below,

../tools/testing/nvdimm/test/ndtest.c:204:25: error: ‘ND_DEVICE_NAMESPACE_BLK’ undeclared here (not in a function); did you mean ‘ND_DEVICE_NAMESPACE_IO’?
  204 |                 .type = ND_DEVICE_NAMESPACE_BLK,
      |                         ^~~~~~~~~~~~~~~~~~~~~~~
      |                         ND_DEVICE_NAMESPACE_IO
../tools/testing/nvdimm/test/ndtest.c: In function ‘ndtest_create_region’:
../tools/testing/nvdimm/test/ndtest.c:630:17: error: ‘ndbr_desc’ undeclared (first use in this function); did you mean ‘ndr_desc’?
  630 |                 ndbr_desc.enable = ndtest_blk_region_enable;
      |                 ^~~~~~~~~
      |                 ndr_desc
../tools/testing/nvdimm/test/ndtest.c:630:17: note: each undeclared identifier is reported only once for each function it appears in
../tools/testing/nvdimm/test/ndtest.c:630:36: error: ‘ndtest_blk_region_enable’ undeclared (first use in this function)
  630 |                 ndbr_desc.enable = ndtest_blk_region_enable;
      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
../tools/testing/nvdimm/test/ndtest.c:631:35: error: ‘ndtest_blk_do_io’ undeclared (first use in this function); did you mean ‘ndtest_blk_mmio’?
  631 |                 ndbr_desc.do_io = ndtest_blk_do_io;
      |                                   ^~~~~~~~~~~~~~~~
      |                                   ndtest_blk_mmio

The current patch removes the specific code to cleanup all obsolete
references.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 tools/testing/nvdimm/test/ndtest.c |   77 ------------------------------------
 1 file changed, 77 deletions(-)

diff --git a/tools/testing/nvdimm/test/ndtest.c b/tools/testing/nvdimm/test/ndtest.c
index 4d1a947367f9..01ceb98c15a0 100644
--- a/tools/testing/nvdimm/test/ndtest.c
+++ b/tools/testing/nvdimm/test/ndtest.c
@@ -134,39 +134,6 @@ static struct ndtest_mapping region1_mapping[] = {
 	},
 };
 
-static struct ndtest_mapping region2_mapping[] = {
-	{
-		.dimm = 0,
-		.position = 0,
-		.start = 0,
-		.size = DIMM_SIZE,
-	},
-};
-
-static struct ndtest_mapping region3_mapping[] = {
-	{
-		.dimm = 1,
-		.start = 0,
-		.size = DIMM_SIZE,
-	}
-};
-
-static struct ndtest_mapping region4_mapping[] = {
-	{
-		.dimm = 2,
-		.start = 0,
-		.size = DIMM_SIZE,
-	}
-};
-
-static struct ndtest_mapping region5_mapping[] = {
-	{
-		.dimm = 3,
-		.start = 0,
-		.size = DIMM_SIZE,
-	}
-};
-
 static struct ndtest_region bus0_regions[] = {
 	{
 		.type = ND_DEVICE_NAMESPACE_PMEM,
@@ -182,34 +149,6 @@ static struct ndtest_region bus0_regions[] = {
 		.size = DIMM_SIZE * 2,
 		.range_index = 2,
 	},
-	{
-		.type = ND_DEVICE_NAMESPACE_BLK,
-		.num_mappings = ARRAY_SIZE(region2_mapping),
-		.mapping = region2_mapping,
-		.size = DIMM_SIZE,
-		.range_index = 3,
-	},
-	{
-		.type = ND_DEVICE_NAMESPACE_BLK,
-		.num_mappings = ARRAY_SIZE(region3_mapping),
-		.mapping = region3_mapping,
-		.size = DIMM_SIZE,
-		.range_index = 4,
-	},
-	{
-		.type = ND_DEVICE_NAMESPACE_BLK,
-		.num_mappings = ARRAY_SIZE(region4_mapping),
-		.mapping = region4_mapping,
-		.size = DIMM_SIZE,
-		.range_index = 5,
-	},
-	{
-		.type = ND_DEVICE_NAMESPACE_BLK,
-		.num_mappings = ARRAY_SIZE(region5_mapping),
-		.mapping = region5_mapping,
-		.size = DIMM_SIZE,
-		.range_index = 6,
-	},
 };
 
 static struct ndtest_mapping region6_mapping[] = {
@@ -501,21 +440,6 @@ static int ndtest_create_region(struct ndtest_priv *p,
 	nd_set->altcookie = nd_set->cookie1;
 	ndr_desc->nd_set = nd_set;
 
-	if (region->type == ND_DEVICE_NAMESPACE_BLK) {
-		mappings[0].start = 0;
-		mappings[0].size = DIMM_SIZE;
-		mappings[0].nvdimm = p->config->dimms[ndimm].nvdimm;
-
-		ndr_desc->mapping = &mappings[0];
-		ndr_desc->num_mappings = 1;
-		ndr_desc->num_lanes = 1;
-		ndbr_desc.enable = ndtest_blk_region_enable;
-		ndbr_desc.do_io = ndtest_blk_do_io;
-		region->region = nvdimm_blk_region_create(p->bus, ndr_desc);
-
-		goto done;
-	}
-
 	for (i = 0; i < region->num_mappings; i++) {
 		ndimm = region->mapping[i].dimm;
 		mappings[i].start = region->mapping[i].start;
@@ -527,7 +451,6 @@ static int ndtest_create_region(struct ndtest_priv *p,
 	ndr_desc->num_mappings = region->num_mappings;
 	region->region = nvdimm_pmem_region_create(p->bus, ndr_desc);
 
-done:
 	if (!region->region) {
 		dev_err(&p->pdev.dev, "Error registering region %pR\n",
 			ndr_desc->res);


