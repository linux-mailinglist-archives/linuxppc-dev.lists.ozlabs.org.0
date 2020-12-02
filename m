Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B9D2CB3F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 05:41:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm5rY4v48zDr7B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 15:41:01 +1100 (AEDT)
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
 header.s=pp1 header.b=FLtjsc6e; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm5pc2CTgzDr63
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 15:39:19 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B242eYr009936; Tue, 1 Dec 2020 23:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P9ZCIx0HyKsVH0Te4PsTY+qRU7CrD4ObUsE1O+a+YmE=;
 b=FLtjsc6euvuWsGgILL3ua/XbR6tuIl2uF2Vr1lwMOZHj5XAbqFTGnxsejGGc99fGnWos
 frJj7rMt8kNwpHqC0FSyBsGmktIjSksElFXSKZWMrkZGbf86a1vDfEnIUcFiCF8jf5aX
 B9zOMfrIzD+XS7Q4auymgaPvIjBntm0kRZnlyi3mi6PKINolppUuyb6GL15MKliYACK8
 1IipIf6KgzE6rIcA554pAHkCgzkomRyatqHudqDHM7nGMVZEmn/yeawdZNmmgNIX3Kz3
 wRTBOKgmWqV0xziMTG1j4p1EwfIGbmW22qV6VBa2Lxbrlk7wHyXQMYwnXKAjWlmE9WWr 1g== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 355j4g1d93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 23:39:09 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B24XUm7004926;
 Wed, 2 Dec 2020 04:39:09 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 355rf7de0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 04:39:09 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B24d89K53477792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 04:39:08 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 302B3AE05F;
 Wed,  2 Dec 2020 04:39:08 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D57FAE064;
 Wed,  2 Dec 2020 04:39:06 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.95.66])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 04:39:05 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 updated 21/22 ] powerpc/book3s64/kup: Check max key
 supported before enabling kup
Date: Wed,  2 Dec 2020 10:08:54 +0530
Message-Id: <20201202043854.76406-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127044424.40686-22-aneesh.kumar@linux.ibm.com>
References: <20201127044424.40686-22-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_12:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020023
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't enable KUEP/KUAP if we support less than or equal to 3 keys.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/kup.h   |  3 +++
 arch/powerpc/mm/book3s64/pkeys.c | 33 ++++++++++++++++++++------------
 arch/powerpc/mm/init-common.c    |  4 ++--
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 952be0414f43..f8ec679bd2de 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -44,6 +44,9 @@
 
 #else /* !__ASSEMBLY__ */
 
+extern bool disable_kuep;
+extern bool disable_kuap;
+
 #include <linux/pgtable.h>
 
 void setup_kup(void);
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 4a3aeddbe0c7..2b7ded396db4 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -185,6 +185,27 @@ void __init pkey_early_init_devtree(void)
 		default_uamor &= ~(0x3ul << pkeyshift(execute_only_key));
 	}
 
+	if (unlikely(num_pkey <= 3)) {
+		/*
+		 * Insufficient number of keys to support
+		 * KUAP/KUEP feature.
+		 */
+		disable_kuep = true;
+		disable_kuap = true;
+		WARN(1, "Disabling kernel user protection due to low (%d) max supported keys\n", num_pkey);
+	} else {
+		/*  handle key which is used by kernel for KAUP */
+		reserved_allocation_mask |= (0x1 << 3);
+		/*
+		 * Mark access for kup_key in default amr so that
+		 * we continue to operate with that AMR in
+		 * copy_to/from_user().
+		 */
+		default_amr   &= ~(0x3ul << pkeyshift(3));
+		default_iamr  &= ~(0x1ul << pkeyshift(3));
+		default_uamor &= ~(0x3ul << pkeyshift(3));
+	}
+
 	/*
 	 * Allow access for only key 0. And prevent any other modification.
 	 */
@@ -205,18 +226,6 @@ void __init pkey_early_init_devtree(void)
 	reserved_allocation_mask |= (0x1 << 1);
 	default_uamor &= ~(0x3ul << pkeyshift(1));
 
-	/*  handle key which is used by kernel for KAUP */
-	reserved_allocation_mask |= (0x1 << 3);
-	/*
-	 * Mark access for KUAP key in default amr so that
-	 * we continue to operate with that AMR in
-	 * copy_to/from_user().
-	 */
-	default_amr   &= ~(0x3ul << pkeyshift(3));
-	default_iamr  &= ~(0x1ul << pkeyshift(3));
-	default_uamor &= ~(0x3ul << pkeyshift(3));
-
-
 	/*
 	 * Prevent the usage of OS reserved keys. Update UAMOR
 	 * for those keys. Also mark the rest of the bits in the
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 8e0d792ac296..afdebb95bcae 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -28,8 +28,8 @@ EXPORT_SYMBOL_GPL(kernstart_addr);
 unsigned long kernstart_virt_addr __ro_after_init = KERNELBASE;
 EXPORT_SYMBOL_GPL(kernstart_virt_addr);
 
-static bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
-static bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
+bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
+bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
 
 static int __init parse_nosmep(char *p)
 {
-- 
2.28.0

