Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC752196DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 05:49:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Mbw365hzDrRc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 13:49:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2MBR2cnrzDqZW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:30:23 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06931bl4132722; Wed, 8 Jul 2020 23:30:18 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325s23u55h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:30:18 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0693FubJ031393;
 Thu, 9 Jul 2020 03:30:17 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 325k1vb5sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 03:30:17 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0693UG3m12452378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 03:30:17 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFC8DB2066;
 Thu,  9 Jul 2020 03:30:16 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D331DB205F;
 Thu,  9 Jul 2020 03:30:14 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 03:30:14 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 10/23] powerpc/book3s64/pkeys: Convert pkey_total to
 num_pkey
Date: Thu,  9 Jul 2020 08:59:33 +0530
Message-Id: <20200709032946.881753-11-aneesh.kumar@linux.ibm.com>
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
 clxscore=1015 mlxlogscore=999
 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007090019
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

num_pkey now represents max number of keys supported such that we return
to userspace 0 - num_pkey - 1.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/pkeys.h |  7 +++++--
 arch/powerpc/mm/book3s64/pkeys.c | 14 +++++++-------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index f984bfac814a..26b20061512f 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -12,7 +12,7 @@
 #include <asm/firmware.h>
 
 DECLARE_STATIC_KEY_FALSE(pkey_disabled);
-extern int pkeys_total; /* total pkeys as per device tree */
+extern int num_pkey;
 extern u32 initial_allocation_mask; /*  bits set for the initially allocated keys */
 extern u32 reserved_allocation_mask; /* bits set for reserved keys */
 
@@ -44,7 +44,10 @@ static inline int vma_pkey(struct vm_area_struct *vma)
 	return (vma->vm_flags & ARCH_VM_PKEY_FLAGS) >> VM_PKEY_SHIFT;
 }
 
-#define arch_max_pkey() pkeys_total
+static inline int arch_max_pkey(void)
+{
+	return num_pkey;
+}
 
 #define pkey_alloc_mask(pkey) (0x1 << pkey)
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index c95fb0280cd9..42c236bd725f 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -13,7 +13,7 @@
 #include <linux/of_device.h>
 
 DEFINE_STATIC_KEY_FALSE(pkey_disabled);
-int  pkeys_total;		/* Total pkeys as per device tree */
+int  num_pkey;		/* Max number of pkeys supported */
 u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
 /*
  *  Keys marked in the reservation list cannot be allocated by  userspace
@@ -93,7 +93,7 @@ static int scan_pkey_feature(void)
 
 static int pkey_initialize(void)
 {
-	int os_reserved, i;
+	int pkeys_total, i;
 
 	/*
 	 * We define PKEY_DISABLE_EXECUTE in addition to the arch-neutral
@@ -133,12 +133,12 @@ static int pkey_initialize(void)
 	 * The OS can manage only 8 pkeys due to its inability to represent them
 	 * in the Linux 4K PTE. Mark all other keys reserved.
 	 */
-	os_reserved = pkeys_total - 8;
+	num_pkey = min(8, pkeys_total);
 #else
-	os_reserved = 0;
+	num_pkey = pkeys_total;
 #endif
 
-	if (unlikely((pkeys_total - os_reserved) <= execute_only_key)) {
+	if (unlikely(num_pkey <= execute_only_key)) {
 		/*
 		 * Insufficient number of keys to support
 		 * execute only key. Mark it unavailable.
@@ -185,10 +185,10 @@ static int pkey_initialize(void)
 	default_uamor &= ~(0x3ul << pkeyshift(1));
 
 	/*
-	 * Prevent the usage of OS reserved the keys. Update UAMOR
+	 * Prevent the usage of OS reserved keys. Update UAMOR
 	 * for those keys.
 	 */
-	for (i = (pkeys_total - os_reserved); i < pkeys_total; i++) {
+	for (i = num_pkey; i < pkeys_total; i++) {
 		reserved_allocation_mask |= (0x1 << i);
 		default_uamor &= ~(0x3ul << pkeyshift(i));
 	}
-- 
2.26.2

