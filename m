Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 604452196BA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 05:38:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2MMv0BZjzDr8r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 13:38:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2MB92cNNzDqbx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:30:09 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06934r9o070824; Wed, 8 Jul 2020 23:30:04 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325r2c4a21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:30:03 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0693FXsi025968;
 Thu, 9 Jul 2020 03:30:03 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 325k1nkxxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 03:30:03 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0693U2ZC14156486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 03:30:02 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83484B206C;
 Thu,  9 Jul 2020 03:30:02 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A6DAB2064;
 Thu,  9 Jul 2020 03:30:00 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 03:30:00 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 04/23] powerpc/book3s64/pkeys: Move pkey related bits in
 the linux page table
Date: Thu,  9 Jul 2020 08:59:27 +0530
Message-Id: <20200709032946.881753-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
References: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_19:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=949
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090019
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
index 25c3cb8272c0..495fc0ccb453 100644
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

