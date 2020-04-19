Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A51AFB67
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 16:28:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494scg2SBYzDqH1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 00:28:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494rwL6fHGzDqxL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 23:56:34 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03JDVkV3140484; Sun, 19 Apr 2020 09:56:29 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gf5q0xtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Apr 2020 09:56:28 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03JDtMge019127;
 Sun, 19 Apr 2020 13:56:27 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 30fs661vam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Apr 2020 13:56:27 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03JDuQg315270406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 19 Apr 2020 13:56:26 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93A346A054;
 Sun, 19 Apr 2020 13:56:26 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB83A6A04D;
 Sun, 19 Apr 2020 13:56:24 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.84.210])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 19 Apr 2020 13:56:24 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 07/10] powerpc/book3s64/pkeys: Convert execute key support to
 static key
Date: Sun, 19 Apr 2020 19:25:46 +0530
Message-Id: <20200419135549.731829-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200419135549.731829-1-aneesh.kumar@linux.ibm.com>
References: <20200419135549.731829-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-19_03:2020-04-17,
 2020-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004190118
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert the bool to a static key like pkey_disabled.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/pkeys.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index fcfa67172c6a..86ea32a9e67c 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -13,13 +13,13 @@
 #include <linux/of_device.h>
 
 DEFINE_STATIC_KEY_TRUE(pkey_disabled);
+DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
 int  pkeys_total;		/* Total pkeys as per device tree */
 u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
 /*
  *  Keys marked in the reservation list cannot be allocated by  userspace
  */
 u32  reserved_allocation_mask;
-static bool pkey_execute_disable_supported;
 static u64 default_amr;
 static u64 default_iamr;
 /* Allow all keys to be modified by default */
@@ -116,9 +116,7 @@ static int pkey_initialize(void)
 	 * execute_disable support. Instead we use a PVR check.
 	 */
 	if (pvr_version_is(PVR_POWER7) || pvr_version_is(PVR_POWER7p))
-		pkey_execute_disable_supported = false;
-	else
-		pkey_execute_disable_supported = true;
+		static_branch_enable(&execute_pkey_disabled);
 
 #ifdef CONFIG_PPC_4K_PAGES
 	/*
@@ -214,7 +212,7 @@ static inline void write_amr(u64 value)
 
 static inline u64 read_iamr(void)
 {
-	if (!likely(pkey_execute_disable_supported))
+	if (static_branch_unlikely(&execute_pkey_disabled))
 		return 0x0UL;
 
 	return mfspr(SPRN_IAMR);
@@ -222,7 +220,7 @@ static inline u64 read_iamr(void)
 
 static inline void write_iamr(u64 value)
 {
-	if (!likely(pkey_execute_disable_supported))
+	if (static_branch_unlikely(&execute_pkey_disabled))
 		return;
 
 	mtspr(SPRN_IAMR, value);
@@ -282,7 +280,7 @@ int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 		return -EINVAL;
 
 	if (init_val & PKEY_DISABLE_EXECUTE) {
-		if (!pkey_execute_disable_supported)
+		if (static_branch_unlikely(&execute_pkey_disabled))
 			return -EINVAL;
 		new_iamr_bits |= IAMR_EX_BIT;
 	}
-- 
2.25.2

