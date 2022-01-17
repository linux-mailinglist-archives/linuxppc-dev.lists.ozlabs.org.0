Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D6F490334
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:54:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JckhB6Tv0z3bVG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:54:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DgyEXjza;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DgyEXjza; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jckfh0chyz2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 18:53:15 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20H4RZ03030942; 
 Mon, 17 Jan 2022 07:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bacBQqAGH1CKRY/5OkaixhhdhelhxIK2RzSgl2sntyo=;
 b=DgyEXjzauJp2HliVypQn5cSMASDvOfzy7CKs7EDQ3TtEVU2LYXRLqYmMmvK98JD/xyeS
 dm0SwkaCaPz7n9mT6HVPQjkrIJbYv8Nkb4D7hyhkFe676Tr3qKuL1Mw6xMbQu41+5pfK
 IMOlAq5Ov5PemDrLV43kzpinfglMVonViM8sas/5oLnvzCu1fb+h6ZaLzGHYrcj6Isgn
 elLYaMSBQ7k/EnBOUJiTdiCTQ/c6/MsD1E8C3Y1Lpk0Qhw1ae+3c135P/IvIkOuYnPCT
 +eOg1VMhtecZPSLbWe4Etg/GZs0kXxfxPT0ZbcrvxyXWPLNFHCIUJUPrwb80CCvb1mFc XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn1evk6x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:53:09 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20H7fO2u029055;
 Mon, 17 Jan 2022 07:53:08 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn1evk6wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:53:08 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20H7qDas027845;
 Mon, 17 Jan 2022 07:53:06 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3dknw90k2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:53:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20H7r2AD44237244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 07:53:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE4DDA4040;
 Mon, 17 Jan 2022 07:53:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3434AA4051;
 Mon, 17 Jan 2022 07:52:58 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.163.1.44])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 07:52:57 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/2] mm/cma: provide option to opt out from exposing pages
 on activation failure
Date: Mon, 17 Jan 2022 13:22:45 +0530
Message-Id: <20220117075246.36072-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117075246.36072-1-hbathini@linux.ibm.com>
References: <20220117075246.36072-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k5UGfhUTyg3excLJG4mJOhklUn_8tli2
X-Proofpoint-ORIG-GUID: bOQnaOb_w-IiibZx-gnXyqdxr1F60N9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_02,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170048
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
Cc: mike.kravetz@oracle.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 osalvador@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
activation of an area fails") started exposing all pages to buddy
allocator on CMA activation failure. But there can be CMA users that
want to handle the reserved memory differently on CMA allocation
failure. Provide an option to opt out from exposing pages to buddy
for such cases.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---

Changes in v3:
* Dropped NULL check in cma_reserve_pages_on_error().
* Dropped explicit initialization of cma->reserve_pages_on_error to
  'false' in cma_init_reserved_mem().
* Added Reviewed-by tag from David.

Changes in v2:
* Changed cma->free_pages_on_error to cma->reserve_pages_on_error and
  cma_dont_free_pages_on_error() to cma_reserve_pages_on_error() to
  avoid confusion.


 include/linux/cma.h |  2 ++
 mm/cma.c            | 11 +++++++++--
 mm/cma.h            |  1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index bd801023504b..51d540eee18a 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -50,4 +50,6 @@ extern bool cma_pages_valid(struct cma *cma, const struct page *pages, unsigned
 extern bool cma_release(struct cma *cma, const struct page *pages, unsigned long count);
 
 extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
+
+extern void cma_reserve_pages_on_error(struct cma *cma);
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index bc9ca8f3c487..766f1b82b532 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -131,8 +131,10 @@ static void __init cma_activate_area(struct cma *cma)
 	bitmap_free(cma->bitmap);
 out_error:
 	/* Expose all pages to the buddy, they are useless for CMA. */
-	for (pfn = base_pfn; pfn < base_pfn + cma->count; pfn++)
-		free_reserved_page(pfn_to_page(pfn));
+	if (!cma->reserve_pages_on_error) {
+		for (pfn = base_pfn; pfn < base_pfn + cma->count; pfn++)
+			free_reserved_page(pfn_to_page(pfn));
+	}
 	totalcma_pages -= cma->count;
 	cma->count = 0;
 	pr_err("CMA area %s could not be activated\n", cma->name);
@@ -150,6 +152,11 @@ static int __init cma_init_reserved_areas(void)
 }
 core_initcall(cma_init_reserved_areas);
 
+void __init cma_reserve_pages_on_error(struct cma *cma)
+{
+	cma->reserve_pages_on_error = true;
+}
+
 /**
  * cma_init_reserved_mem() - create custom contiguous area from reserved memory
  * @base: Base address of the reserved area
diff --git a/mm/cma.h b/mm/cma.h
index 2c775877eae2..88a0595670b7 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -30,6 +30,7 @@ struct cma {
 	/* kobject requires dynamic object */
 	struct cma_kobject *cma_kobj;
 #endif
+	bool reserve_pages_on_error;
 };
 
 extern struct cma cma_areas[MAX_CMA_AREAS];
-- 
2.34.1

