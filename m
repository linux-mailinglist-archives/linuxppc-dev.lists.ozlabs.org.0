Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E1D200C9F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 16:48:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pMBK2ZVDzDr2r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 00:48:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pL5p0TQ2zDrNL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 23:59:41 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JDcOOh164998; Fri, 19 Jun 2020 09:59:36 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31rtha7ykv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 09:59:34 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JDtqDw021022;
 Fri, 19 Jun 2020 13:59:33 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 31q8ryu7ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:59:33 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JDxUxg31064370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 13:59:30 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D510BE058;
 Fri, 19 Jun 2020 13:59:32 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 379F8BE053;
 Fri, 19 Jun 2020 13:59:30 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 13:59:29 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 10/26] powerpc/book3s64/pkeys: Convert pkey_total to
 max_pkey
Date: Fri, 19 Jun 2020 19:28:34 +0530
Message-Id: <20200619135850.47155-11-aneesh.kumar@linux.ibm.com>
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
 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006190096
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

max_pkey now represents max key value that userspace can allocate.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/pkeys.h |  7 +++++--
 arch/powerpc/mm/book3s64/pkeys.c | 14 +++++++-------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 75d2a2c19c04..652bad7334f3 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -12,7 +12,7 @@
 #include <asm/firmware.h>
 
 DECLARE_STATIC_KEY_FALSE(pkey_disabled);
-extern int pkeys_total; /* total pkeys as per device tree */
+extern int max_pkey;
 extern u32 initial_allocation_mask; /*  bits set for the initially allocated keys */
 extern u32 reserved_allocation_mask; /* bits set for reserved keys */
 
@@ -44,7 +44,10 @@ static inline int vma_pkey(struct vm_area_struct *vma)
 	return (vma->vm_flags & ARCH_VM_PKEY_FLAGS) >> VM_PKEY_SHIFT;
 }
 
-#define arch_max_pkey() pkeys_total
+static inline int arch_max_pkey(void)
+{
+	return max_pkey;
+}
 
 #define pkey_alloc_mask(pkey) (0x1 << pkey)
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 87d882a9aaf2..a4d7287082a8 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -14,7 +14,7 @@
 
 DEFINE_STATIC_KEY_FALSE(pkey_disabled);
 DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
-int  pkeys_total;		/* Total pkeys as per device tree */
+int  max_pkey;			/* Maximum key value supported */
 u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
 /*
  *  Keys marked in the reservation list cannot be allocated by  userspace
@@ -84,7 +84,7 @@ static int scan_pkey_feature(void)
 
 static int pkey_initialize(void)
 {
-	int os_reserved, i;
+	int pkeys_total, i;
 
 	/*
 	 * We define PKEY_DISABLE_EXECUTE in addition to the arch-neutral
@@ -122,12 +122,12 @@ static int pkey_initialize(void)
 	 * The OS can manage only 8 pkeys due to its inability to represent them
 	 * in the Linux 4K PTE. Mark all other keys reserved.
 	 */
-	os_reserved = pkeys_total - 8;
+	max_pkey = min(8, pkeys_total);
 #else
-	os_reserved = 0;
+	max_pkey = pkeys_total;
 #endif
 
-	if (unlikely((pkeys_total - os_reserved) <= execute_only_key)) {
+	if (unlikely(max_pkey <= execute_only_key)) {
 		/*
 		 * Insufficient number of keys to support
 		 * execute only key. Mark it unavailable.
@@ -174,10 +174,10 @@ static int pkey_initialize(void)
 	default_uamor &= ~(0x3ul << pkeyshift(1));
 
 	/*
-	 * Prevent the usage of OS reserved the keys. Update UAMOR
+	 * Prevent the usage of OS reserved keys. Update UAMOR
 	 * for those keys.
 	 */
-	for (i = (pkeys_total - os_reserved); i < pkeys_total; i++) {
+	for (i = max_pkey; i < pkeys_total; i++) {
 		reserved_allocation_mask |= (0x1 << i);
 		default_uamor &= ~(0x3ul << pkeyshift(i));
 	}
-- 
2.26.2

