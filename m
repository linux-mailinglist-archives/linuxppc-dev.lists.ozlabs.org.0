Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E0E34304
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 11:19:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J5wp63lQzDqcR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 19:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J5pW2xX2zDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 19:14:27 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5498O4J190954
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Jun 2019 05:14:25 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2swkqk5jpn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 05:14:24 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 4 Jun 2019 10:14:24 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 4 Jun 2019 10:14:22 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x549ELax33816652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jun 2019 09:14:22 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD6FEAC060;
 Tue,  4 Jun 2019 09:14:21 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54B54AC05F;
 Tue,  4 Jun 2019 09:14:20 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.234])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jun 2019 09:14:20 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com
Subject: [PATCH v3 6/6] mm/nvdimm: Use correct alignment when looking at first
 pfn from a region
Date: Tue,  4 Jun 2019 14:43:57 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604091357.32213-1-aneesh.kumar@linux.ibm.com>
References: <20190604091357.32213-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060409-0060-0000-0000-0000034BD868
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011212; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01213037; UDB=6.00637528; IPR=6.00994104; 
 MB=3.00027178; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-04 09:14:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060409-0061-0000-0000-0000499E0C1E
Message-Id: <20190604091357.32213-6-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=734 adultscore=0 classifier=spam adjust=0 reason=mlx
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

We already add the start_pad to the resource->start but fails to section
align the start. This make sure with altmap we compute the right first
pfn when start_pad is zero and we are doing an align down of start address.

vmem_altmap_offset() adjust the section aligned base_pfn offset.
So we need to make sure we account for the same when computing base_pfn.

ie, for altmap_valid case, our pfn_first should be:

pfn_first = altmap->base_pfn + vmem_altmap_offset(altmap);

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 kernel/memremap.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/memremap.c b/kernel/memremap.c
index 1490e63f69a9..bf488b8658e7 100644
--- a/kernel/memremap.c
+++ b/kernel/memremap.c
@@ -60,9 +60,11 @@ static unsigned long pfn_first(struct dev_pagemap *pgmap)
 	struct vmem_altmap *altmap = &pgmap->altmap;
 	unsigned long pfn;
 
-	pfn = res->start >> PAGE_SHIFT;
-	if (pgmap->altmap_valid)
-		pfn += vmem_altmap_offset(altmap);
+	if (pgmap->altmap_valid) {
+		pfn = altmap->base_pfn + vmem_altmap_offset(altmap);
+	} else
+		pfn = PHYS_PFN(res->start);
+
 	return pfn;
 }
 
-- 
2.21.0

