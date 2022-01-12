Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7FA48CC0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 20:35:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYyTM1K5vz3bTn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 06:35:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iVDYBubO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iVDYBubO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYyRs30thz2xsG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 06:34:17 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CGXOcZ015855; 
 Wed, 12 Jan 2022 19:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oas9nURx9mrw3sMaf4yGeIy+sl5jZmQKl36HckwO2Ls=;
 b=iVDYBubOIkBLS5B6hGlih4LExncsSl3mBN2zesRzAxfH7y6Zs21AqcAkJlh8fXzhQbPX
 Y4uqOakSZikrwDY8ZMDn43u+uFnxjxUO1bTqXIW/LQdE6KDVtMTNYDiOEqpefzI/t1D3
 S9bq0ZK0ARXjhYHpmlle8vzznA0jhGI6JPiZ1COWL9inZZtyVavHAoizMty095yLN4i8
 09o0gIB1fZ8NIOamqrHLLwLgYr4946IjTTVNLoAhOOPktDMq0U/Bn0VtL4sBBSRqnyMe
 YFKMRDByo9BlkZ369sCaUdx+soyNIH/575dnYAb6A0xh6oicXyOBM177aRA3pMJwZrJ6 Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhych0dbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 19:34:10 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CJXd4J027842;
 Wed, 12 Jan 2022 19:34:10 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhych0dap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 19:34:10 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CJMIKG015213;
 Wed, 12 Jan 2022 19:34:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3df289mvfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 19:34:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CJY50r37486898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 19:34:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30C2AAE057;
 Wed, 12 Jan 2022 19:34:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7208AAE051;
 Wed, 12 Jan 2022 19:34:00 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.163.19.140])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 19:34:00 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] mm/cma: provide option to opt out from exposing pages
 on activation failure
Date: Thu, 13 Jan 2022 01:03:39 +0530
Message-Id: <20220112193340.149020-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112193340.149020-1-hbathini@linux.ibm.com>
References: <20220112193340.149020-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5htQmDfqZMyBqv5wcIg-3V9k4cei346D
X-Proofpoint-ORIG-GUID: w6YXUPYwBi5gaPa3cmOGc0DpG73YBR06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_05,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120114
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, mike.kravetz@oracle.com,
 mahesh@linux.ibm.com, sourabhjain@linux.ibm.com, osalvador@suse.de
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
---

Changes in v2:
* Changed cma->free_pages_on_error to cma->reserve_pages_on_error and
  cma_dont_free_pages_on_error() to cma_reserve_pages_on_error() to
  avoid cofusion.


 include/linux/cma.h |  2 ++
 mm/cma.c            | 15 +++++++++++++--
 mm/cma.h            |  1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

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
index bc9ca8f3c487..20626321f87f 100644
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
@@ -150,6 +152,14 @@ static int __init cma_init_reserved_areas(void)
 }
 core_initcall(cma_init_reserved_areas);
 
+void __init cma_reserve_pages_on_error(struct cma *cma)
+{
+	if (!cma)
+		return;
+
+	cma->reserve_pages_on_error = true;
+}
+
 /**
  * cma_init_reserved_mem() - create custom contiguous area from reserved memory
  * @base: Base address of the reserved area
@@ -204,6 +214,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	cma->base_pfn = PFN_DOWN(base);
 	cma->count = size >> PAGE_SHIFT;
 	cma->order_per_bit = order_per_bit;
+	cma->reserve_pages_on_error = false;
 	*res_cma = cma;
 	cma_area_count++;
 	totalcma_pages += (size / PAGE_SIZE);
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

