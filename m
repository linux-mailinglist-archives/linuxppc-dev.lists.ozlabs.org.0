Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF0E2425BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 09:02:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRLHm0kmqzDqYW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 17:02:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a2yDuK6t; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRKgz1nd6zDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 16:35:11 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07C6WARD011127; Wed, 12 Aug 2020 02:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m8zBaf2lrZAVhsnROuCm2W0WawpDqGOkNemkR562PmU=;
 b=a2yDuK6t0HFs+pBmZ0T9xnLRrxOveF3zGSS33szhBAIr/Y8lxZDxLY1gNsP9iDiortpU
 A8hGUd+Ljim/pjxASDIFeFfdDQHuhiD27CUmI+yAg2zHPW5qQzG/sjARxQAUFNfHDOFe
 ikp7lf2yItdTnYLMLzMvpJD8N9jdbeK5aNlts8+g1cn8UhNnryqJvIXFz/A6qxWgsz7U
 JAcUFe/ff3SXAlR1/rT/KCHVT651yMeeGgN0ryCgrqFkjUsl9ZI/falWWfU98xSM2m3H
 6EppBKvEuKyvkOC28/sUO65L2LA3pa/WtESSzIhwlYC9wu/7Wc8v0YTRUuRNHhjWXkhA zg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32v6r7dudh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 02:35:01 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07C6YPGR007246;
 Wed, 12 Aug 2020 06:35:01 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 32skp97aca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 06:35:01 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07C6Z0j462783862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 06:35:00 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C0CA136051;
 Wed, 12 Aug 2020 06:35:00 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC3F1136053;
 Wed, 12 Aug 2020 06:34:57 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.109])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 06:34:57 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH 15/16] debug_vm_pgtable/savedwrite: Use savedwrite test with
 protnone ptes
Date: Wed, 12 Aug 2020 12:03:57 +0530
Message-Id: <20200812063358.369514-15-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_19:2020-08-11,
 2020-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=785 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120044
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Saved write support was added to track the write bit of a pte after marking the
pte protnone. This was done so that AUTONUMA can convert a write pte to protnone
and still track the old write bit. When converting it back we set the pte write
bit correctly thereby avoiding a write fault again.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 3e112d0ba1b2..eea62d5e503b 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -1006,8 +1006,8 @@ static int __init debug_vm_pgtable(void)
 	pud_leaf_tests(pud_aligned, prot);
 
 #ifdef CONFIG_NUMA_BALANCING
-	pte_savedwrite_tests(pte_aligned, prot);
-	pmd_savedwrite_tests(pmd_aligned, prot);
+	pte_savedwrite_tests(pte_aligned, protnone);
+	pmd_savedwrite_tests(pmd_aligned, protnone);
 #endif
 	pte_special_tests(pte_aligned, prot);
 	pte_protnone_tests(pte_aligned, protnone);
-- 
2.26.2

