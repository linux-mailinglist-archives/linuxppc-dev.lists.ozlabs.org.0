Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9583A90E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 06:59:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Xzl1RSTz3ddS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 14:59:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O24AQVgK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O24AQVgK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Xxx6LGyz3cBZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 14:58:13 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G4XjGB053130; Wed, 16 Jun 2021 00:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=beUxHBvu6YA2GqZsB6t6JIyeJYIx6qwpctZTrVU2tVc=;
 b=O24AQVgKv14OkzJ9sUAJ1Xlfx+xpP7yxuMQq9z9O624ukn8b3pqYKQOJbiG+30cE2WJ8
 LSteKm9b9jPwAiQfDT1MXfS+8X/cnsirvLomRjSkl/nT0W06z1A5p1rV9CIg8KZyUSVk
 dwHPWxTiiYgLysoyhZHYfsXfOUGjhdzgVjKEjjFPDI3WYxljQYo3B+x+fp9N9sKyHBgR
 IWfeDlQI1fsZ5VXfESh+pDjAuCw7IgcJ+Gy8x69DwIVnUBJtXaUzFwcislarNJyTTyVw
 /EVpDUDm7b8WugJs5ejzvkgzcj41pBv/+tSuU2UykN40x9fvcL6ve8j/slHdeP73AZJM oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3979u793y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 00:57:59 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15G4YVBi057050;
 Wed, 16 Jun 2021 00:57:59 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3979u793y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 00:57:58 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G4qD38020218;
 Wed, 16 Jun 2021 04:57:58 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3965ytt5xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 04:57:58 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15G4vvMM37093754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 04:57:57 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2710BB2066;
 Wed, 16 Jun 2021 04:57:57 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 974D8B2064;
 Wed, 16 Jun 2021 04:57:53 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.33])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 04:57:53 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v8 3/3] powerpc/mm: Enable HAVE_MOVE_PMD support
Date: Wed, 16 Jun 2021 10:27:35 +0530
Message-Id: <20210616045735.374532-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616045735.374532-1-aneesh.kumar@linux.ibm.com>
References: <20210616045735.374532-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FccZW1NGEksh3dYMQratLGWz8cui7NzV
X-Proofpoint-ORIG-GUID: u6phRUs4yKdHMFDS7ZP58NMdqfjRzH11
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_09:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106160027
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
 Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mremap HAVE_MOVE_PMD/PUD optimization time comparison for 1GB region:
1GB mremap - Source PTE-aligned, Destination PTE-aligned
  mremap time:      2292772ns
1GB mremap - Source PMD-aligned, Destination PMD-aligned
  mremap time:      1158928ns
1GB mremap - Source PUD-aligned, Destination PUD-aligned
  mremap time:        63886ns

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/platforms/Kconfig.cputype | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index f998e655b570..be8ceb5bece4 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -101,6 +101,8 @@ config PPC_BOOK3S_64
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
+	select HAVE_MOVE_PMD
+	select HAVE_MOVE_PUD
 	select IRQ_WORK
 	select PPC_MM_SLICES
 	select PPC_HAVE_KUEP
-- 
2.31.1

