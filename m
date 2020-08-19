Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24513249F73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 15:20:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWpKr232bzDqpk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 23:20:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e04yIp16; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWnxh4r60zDqsm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 23:02:32 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JD27H2178979; Wed, 19 Aug 2020 09:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jmStIjY/nUTZGbmglkLHk2L65ehibHpy/w7LeNjR340=;
 b=e04yIp16pba/uV5X0EgqoSWfsq5nhd9ykqBA1+MOkfE5Jj/uLEkhkFJqn4VwzKVqBkwe
 bubVjmepqg5gxgL1+rbDxSWKS76pU8WGhrDzXc63ANJxoQLDIeB6yU982MBvW/u2okv7
 4DBc38AdG5ww4et9vi1gH/AA4AhHp5hfI9o1knaw+J7Ju5lmTzXRX0wf6HW52drNMSlK
 z4cuSOrtNWv/aBunWtUiGOl2iyZ5IRS5DSI2CfNPutM8bkMROnGLBiC8iXmTxDMD669S
 3/5ZZ0pHmPPYMeS1dXv00Y4iSL3RwbWzJ2LaPCKdvChjgQ6JddVYKq48qQminsDYZjEY Eg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 330ucnfecp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 09:02:06 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JD0fh4026823;
 Wed, 19 Aug 2020 13:01:33 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 3304ccf3u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:01:32 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JD1WBt45351286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 13:01:32 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DF7DB2066;
 Wed, 19 Aug 2020 13:01:32 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 225A4B205F;
 Wed, 19 Aug 2020 13:01:30 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.3.58])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 13:01:29 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 03/13] mm/debug_vm_pgtable/ppc64: Avoid setting top bits in
 radom value
Date: Wed, 19 Aug 2020 18:30:57 +0530
Message-Id: <20200819130107.478414-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=896 clxscore=1015
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190110
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

ppc64 use bit 62 to indicate a pte entry (_PAGE_PTE). Avoid setting that bit in
random value.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 086309fb9b6f..57259e2dbd17 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -44,10 +44,13 @@
  * entry type. But these bits might affect the ability to clear entries with
  * pxx_clear() because of how dynamic page table folding works on s390. So
  * while loading up the entries do not change the lower 4 bits. It does not
- * have affect any other platform.
+ * have affect any other platform. Also avoid the 62nd bit on ppc64 that is
+ * used to mark a pte entry.
  */
-#define S390_MASK_BITS	4
-#define RANDOM_ORVALUE	GENMASK(BITS_PER_LONG - 1, S390_MASK_BITS)
+#define S390_SKIP_MASK		GENMASK(3, 0)
+#define PPC64_SKIP_MASK		GENMASK(62, 62)
+#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
+#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
 #define RANDOM_NZVALUE	GENMASK(7, 0)
 
 static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
-- 
2.26.2

