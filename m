Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C347B3CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 20:36:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHqZh6Clyz3cDn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 06:36:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oMesST7N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oMesST7N; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHqYD6y5Cz2xCt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 06:34:56 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIh5V7003013; 
 Mon, 20 Dec 2021 19:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=joAxMmpeOsLwSPVnz1W4tqCwW9Ry5Ontd8ment9YOA8=;
 b=oMesST7NrcAcPY6PtMcS0fK8uvzKdq57kyq4EqozdLx/7fYzfFH79g5PxTNDvUGQ1/rY
 OYHAJSiAJ2HtRkfedp0+z4fF6YJpuABnRdWI53NGNHBOHxNBNARtNg9kyj2P+XSGCq8c
 GGbe4hNgZT3m7oTtYQiH+3uFC93D+nkXql5a7JPKB7YucCmkFe5PHq8trMCxqvXD6pVf
 z7IYNQtXvIkWDa1cv60eF6fDPuc4p7SVDC4iS2ygXGyibVeupBN3bG8F9VsR0SyqqDH/
 Td+bAsZwFShy7mnZ4UeS6tGnEucqbdWbuZyp1rfr47FSy5EkaejG+jXy1QhLjqeXu8Ty 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s7qbspq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 19:34:48 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKJHU6r021150;
 Mon, 20 Dec 2021 19:34:48 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s7qbsnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 19:34:47 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKJXxop027033;
 Mon, 20 Dec 2021 19:34:45 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3d179a7qup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 19:34:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BKJYgH537028114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 19:34:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ACD34C044;
 Mon, 20 Dec 2021 19:34:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B62FD4C046;
 Mon, 20 Dec 2021 19:34:37 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.211.62.204])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 19:34:37 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: akpm@linux-foundation.org, linux-mm@kvack.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] mm/cma: provide option to opt out from exposing pages on
 activation failure
Date: Tue, 21 Dec 2021 01:04:18 +0530
Message-Id: <20211220193419.104242-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220193419.104242-1-hbathini@linux.ibm.com>
References: <20211220193419.104242-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i_3HKsoo2l5g69k8oDvs5fXAyLjf1xzG
X-Proofpoint-ORIG-GUID: oHsQMNE2EIR5KbQI-OIWWS4zw1ocyYsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_09,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200109
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
Cc: david@redhat.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 osalvador@suse.de, Hari Bathini <hbathini@linux.ibm.com>,
 mike.kravetz@oracle.com
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
 include/linux/cma.h |  2 ++
 mm/cma.c            | 15 +++++++++++++--
 mm/cma.h            |  1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index bd801023504b..8c9e229e7080 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -50,4 +50,6 @@ extern bool cma_pages_valid(struct cma *cma, const struct page *pages, unsigned
 extern bool cma_release(struct cma *cma, const struct page *pages, unsigned long count);
 
 extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
+
+extern void cma_dont_free_pages_on_error(struct cma *cma);
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index bc9ca8f3c487..6dffc9b2dafe 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -131,8 +131,10 @@ static void __init cma_activate_area(struct cma *cma)
 	bitmap_free(cma->bitmap);
 out_error:
 	/* Expose all pages to the buddy, they are useless for CMA. */
-	for (pfn = base_pfn; pfn < base_pfn + cma->count; pfn++)
-		free_reserved_page(pfn_to_page(pfn));
+	if (cma->free_pages_on_error) {
+		for (pfn = base_pfn; pfn < base_pfn + cma->count; pfn++)
+			free_reserved_page(pfn_to_page(pfn));
+	}
 	totalcma_pages -= cma->count;
 	cma->count = 0;
 	pr_err("CMA area %s could not be activated\n", cma->name);
@@ -150,6 +152,14 @@ static int __init cma_init_reserved_areas(void)
 }
 core_initcall(cma_init_reserved_areas);
 
+void __init cma_dont_free_pages_on_error(struct cma *cma)
+{
+	if (!cma)
+		return;
+
+	cma->free_pages_on_error = false;
+}
+
 /**
  * cma_init_reserved_mem() - create custom contiguous area from reserved memory
  * @base: Base address of the reserved area
@@ -204,6 +214,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	cma->base_pfn = PFN_DOWN(base);
 	cma->count = size >> PAGE_SHIFT;
 	cma->order_per_bit = order_per_bit;
+	cma->free_pages_on_error = true;
 	*res_cma = cma;
 	cma_area_count++;
 	totalcma_pages += (size / PAGE_SIZE);
diff --git a/mm/cma.h b/mm/cma.h
index 2c775877eae2..9e2438f9233d 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -30,6 +30,7 @@ struct cma {
 	/* kobject requires dynamic object */
 	struct cma_kobject *cma_kobj;
 #endif
+	bool free_pages_on_error;
 };
 
 extern struct cma cma_areas[MAX_CMA_AREAS];
-- 
2.33.1

