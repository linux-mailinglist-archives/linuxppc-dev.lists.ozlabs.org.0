Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D68200B30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 16:19:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pLXM04qXzDrHl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 00:19:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pL5N6MMTzDr3p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 23:59:20 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JDcfqb072313; Fri, 19 Jun 2020 09:59:15 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31runcnjgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 09:59:15 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JDtBhg026321;
 Fri, 19 Jun 2020 13:59:14 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 31q6c6b193-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:59:14 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JDxC7u26739160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 13:59:12 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20041BE05A;
 Fri, 19 Jun 2020 13:59:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06053BE053;
 Fri, 19 Jun 2020 13:59:10 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 13:59:10 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 03/26] powerpc/book3s64/pkeys: Move pkey related bits in
 the linux page table
Date: Fri, 19 Jun 2020 19:28:27 +0530
Message-Id: <20200619135850.47155-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_11:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=933
 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=2 phishscore=0
 clxscore=1015 bulkscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190096
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To keep things simple, all the pkey related bits are kept together
in linux page table for 64K config with hash translation. With hash-4k
kernel requires 4 bits to store slots details. This is done by overloading
some of the RPN bits for storing the slot details. Due to this PKEY_BIT0 on
the 4K config is used for storing hash slot details.

64K before

|....|RSV1| RSV2| RSV3 | RSV4 | RPN44| RPN43   |.... | RSV5|
|....| P4 |  P3 |  P2  |  P1  | Busy | HASHPTE |.... |  P0 |

after

|....|RSV1| RSV2| RSV3 | RSV4 | RPN44 | RPN43   |.... | RSV5 |
|....| P4 |  P3 |  P2  |  P1  | P0    | HASHPTE |.... | Busy |

4k before

|....| RSV1 | RSV2     | RSV3 | RSV4 | RPN44| RPN43.... | RSV5|
|....| Busy |  HASHPTE |  P2  |  P1  | F_SEC| F_GIX.... |  P0 |

after

|....| RSV1    | RSV2| RSV3 | RSV4 | Free | RPN43.... | RSV5 |
|....| HASHPTE |  P2 |  P1  |  P0  | F_SEC| F_GIX.... | BUSY |

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h  | 16 ++++++++--------
 arch/powerpc/include/asm/book3s/64/hash-64k.h | 12 ++++++------
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 17 ++++++++---------
 3 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index f889d56bf8cf..082b98808701 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -34,11 +34,11 @@
 #define H_PUD_TABLE_SIZE	(sizeof(pud_t) << H_PUD_INDEX_SIZE)
 #define H_PGD_TABLE_SIZE	(sizeof(pgd_t) << H_PGD_INDEX_SIZE)
 
-#define H_PAGE_F_GIX_SHIFT	53
-#define H_PAGE_F_SECOND	_RPAGE_RPN44	/* HPTE is in 2ndary HPTEG */
-#define H_PAGE_F_GIX	(_RPAGE_RPN43 | _RPAGE_RPN42 | _RPAGE_RPN41)
-#define H_PAGE_BUSY	_RPAGE_RSV1     /* software: PTE & hash are busy */
-#define H_PAGE_HASHPTE	_RPAGE_RSV2     /* software: PTE & hash are busy */
+#define H_PAGE_F_GIX_SHIFT	_PAGE_PA_MAX
+#define H_PAGE_F_SECOND		_RPAGE_PKEY_BIT0 /* HPTE is in 2ndary HPTEG */
+#define H_PAGE_F_GIX		(_RPAGE_RPN43 | _RPAGE_RPN42 | _RPAGE_RPN41)
+#define H_PAGE_BUSY		_RPAGE_RSV1
+#define H_PAGE_HASHPTE		_RPAGE_PKEY_BIT4
 
 /* PTE flags to conserve for HPTE identification */
 #define _PAGE_HPTEFLAGS (H_PAGE_BUSY | H_PAGE_HASHPTE | \
@@ -59,9 +59,9 @@
 /* memory key bits, only 8 keys supported */
 #define H_PTE_PKEY_BIT4	0
 #define H_PTE_PKEY_BIT3	0
-#define H_PTE_PKEY_BIT2	_RPAGE_RSV3
-#define H_PTE_PKEY_BIT1	_RPAGE_RSV4
-#define H_PTE_PKEY_BIT0	_RPAGE_RSV5
+#define H_PTE_PKEY_BIT2	_RPAGE_PKEY_BIT3
+#define H_PTE_PKEY_BIT1	_RPAGE_PKEY_BIT2
+#define H_PTE_PKEY_BIT0	_RPAGE_PKEY_BIT1
 
 
 /*
diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
index 0a15fd14cf72..f20de1149ebe 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
@@ -32,15 +32,15 @@
  */
 #define H_PAGE_COMBO	_RPAGE_RPN0 /* this is a combo 4k page */
 #define H_PAGE_4K_PFN	_RPAGE_RPN1 /* PFN is for a single 4k page */
-#define H_PAGE_BUSY	_RPAGE_RPN44     /* software: PTE & hash are busy */
+#define H_PAGE_BUSY	_RPAGE_RSV1     /* software: PTE & hash are busy */
 #define H_PAGE_HASHPTE	_RPAGE_RPN43	/* PTE has associated HPTE */
 
 /* memory key bits. */
-#define H_PTE_PKEY_BIT4	_RPAGE_RSV1
-#define H_PTE_PKEY_BIT3	_RPAGE_RSV2
-#define H_PTE_PKEY_BIT2	_RPAGE_RSV3
-#define H_PTE_PKEY_BIT1	_RPAGE_RSV4
-#define H_PTE_PKEY_BIT0	_RPAGE_RSV5
+#define H_PTE_PKEY_BIT4		_RPAGE_PKEY_BIT4
+#define H_PTE_PKEY_BIT3		_RPAGE_PKEY_BIT3
+#define H_PTE_PKEY_BIT2		_RPAGE_PKEY_BIT2
+#define H_PTE_PKEY_BIT1		_RPAGE_PKEY_BIT1
+#define H_PTE_PKEY_BIT0		_RPAGE_PKEY_BIT0
 
 /*
  * We need to differentiate between explicit huge page and THP huge
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index f17442c3a092..b7c0ba977d6a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -32,11 +32,13 @@
 #define _RPAGE_SW1		0x00800
 #define _RPAGE_SW2		0x00400
 #define _RPAGE_SW3		0x00200
-#define _RPAGE_RSV1		0x1000000000000000UL
-#define _RPAGE_RSV2		0x0800000000000000UL
-#define _RPAGE_RSV3		0x0400000000000000UL
-#define _RPAGE_RSV4		0x0200000000000000UL
-#define _RPAGE_RSV5		0x00040UL
+#define _RPAGE_RSV1		0x00040UL
+
+#define _RPAGE_PKEY_BIT4	0x1000000000000000UL
+#define _RPAGE_PKEY_BIT3	0x0800000000000000UL
+#define _RPAGE_PKEY_BIT2	0x0400000000000000UL
+#define _RPAGE_PKEY_BIT1	0x0200000000000000UL
+#define _RPAGE_PKEY_BIT0	0x0100000000000000UL
 
 #define _PAGE_PTE		0x4000000000000000UL	/* distinguishes PTEs from pointers */
 #define _PAGE_PRESENT		0x8000000000000000UL	/* pte contains a translation */
@@ -58,13 +60,12 @@
  */
 #define _RPAGE_RPN0		0x01000
 #define _RPAGE_RPN1		0x02000
-#define _RPAGE_RPN44		0x0100000000000000UL
 #define _RPAGE_RPN43		0x0080000000000000UL
 #define _RPAGE_RPN42		0x0040000000000000UL
 #define _RPAGE_RPN41		0x0020000000000000UL
 
 /* Max physical address bit as per radix table */
-#define _RPAGE_PA_MAX		57
+#define _RPAGE_PA_MAX		56
 
 /*
  * Max physical address bit we will use for now.
@@ -125,8 +126,6 @@
 			 _PAGE_ACCESSED | _PAGE_SPECIAL | _PAGE_PTE |	\
 			 _PAGE_SOFT_DIRTY | _PAGE_DEVMAP)
 
-#define H_PTE_PKEY  (H_PTE_PKEY_BIT0 | H_PTE_PKEY_BIT1 | H_PTE_PKEY_BIT2 | \
-		     H_PTE_PKEY_BIT3 | H_PTE_PKEY_BIT4)
 /*
  * We define 2 sets of base prot bits, one for basic pages (ie,
  * cacheable kernel and user pages) and one for non cacheable
-- 
2.26.2

