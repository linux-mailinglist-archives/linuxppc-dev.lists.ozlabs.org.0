Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE11F1CAF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 16:55:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453LMN1SQnzDqGL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 00:55:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 453LJ42pmdzDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 00:52:20 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4EEqBvc003448
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 10:52:17 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfx6854tk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 10:52:15 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 14 May 2019 15:52:12 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 15:52:08 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4EEorHh34472056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 14:50:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9E48112062;
 Tue, 14 May 2019 14:50:52 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63F64112064;
 Tue, 14 May 2019 14:50:51 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.80.230.27])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 14:50:51 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [RFC PATCH 3/3] powerpc/mm/hugetlb: Don't enable HugeTLB if we don't
 have a page table cache
Date: Tue, 14 May 2019 20:20:41 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514145041.7836-1-aneesh.kumar@linux.ibm.com>
References: <20190514145041.7836-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19051414-0040-0000-0000-000004EF7F69
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011096; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203232; UDB=6.00631561; IPR=6.00984154; 
 MB=3.00026883; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-14 14:52:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051414-0041-0000-0000-000008FB8D80
Message-Id: <20190514145041.7836-3-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140106
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This makes sure we don't enable HugeTLB if the cache is not configured.
I am still not sure about this. IMHO hugetlb support should be a hardware
support derivative and any cache allocation failure should be handled as I did
in the earlier patch. But then if we were not able to create hugetlb page table
cache, we can as well declare hugetlb support disabled thereby avoiding calling
into allocation routines.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/hugetlbpage.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index ee16a3fb788a..4bf8bc659cc7 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -602,6 +602,7 @@ __setup("hugepagesz=", hugepage_setup_sz);
 static int __init hugetlbpage_init(void)
 {
 	int psize;
+	bool configured = false;
 
 	if (hugetlb_disabled) {
 		pr_info("HugeTLB support is disabled!\n");
@@ -651,10 +652,16 @@ static int __init hugetlbpage_init(void)
 			pgtable_cache_add(pdshift - shift);
 		else if (IS_ENABLED(CONFIG_PPC_FSL_BOOK3E) || IS_ENABLED(CONFIG_PPC_8xx))
 			pgtable_cache_add(PTE_T_ORDER);
+
+		if (!configured)
+			configured = true;
 	}
 
-	if (IS_ENABLED(CONFIG_HUGETLB_PAGE_SIZE_VARIABLE))
-		hugetlbpage_init_default();
+	if (configured) {
+		if (IS_ENABLED(CONFIG_HUGETLB_PAGE_SIZE_VARIABLE))
+			hugetlbpage_init_default();
+	} else
+		pr_info("Disabling HugeTLB");
 
 	return 0;
 }
-- 
2.21.0

