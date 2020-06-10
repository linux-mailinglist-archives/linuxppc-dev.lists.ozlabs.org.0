Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B191F51D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 12:06:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hjLG2HzMzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 20:05:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hj323X6hzDqCH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 19:52:46 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A9VZU5000677; Wed, 10 Jun 2020 05:52:39 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31jjxdh4b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 05:52:38 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A9iqse004288;
 Wed, 10 Jun 2020 09:52:38 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 31jqykbbx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 09:52:38 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A9qbbn38601010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 09:52:37 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 860D7112063;
 Wed, 10 Jun 2020 09:52:37 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AA49112061;
 Wed, 10 Jun 2020 09:52:35 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.180.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 09:52:35 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 08/41] powerpc/book3s64/pkeys: Convert execute key support
 to static key
Date: Wed, 10 Jun 2020 15:21:31 +0530
Message-Id: <20200610095204.608183-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
References: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_04:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 cotscore=-2147483648 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 clxscore=1015 adultscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100070
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

Convert the bool to a static key like pkey_disabled.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/pkeys.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 9e68a08799ee..7d400d5a4076 100644
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
2.26.2

