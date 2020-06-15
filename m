Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 424411F8DD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 08:29:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lhJ513YCzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:29:25 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lgzg1gFKzDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:15:11 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F63Nfm063045; Mon, 15 Jun 2020 02:15:07 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31n301jm26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 02:15:07 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05F65n7r019769;
 Mon, 15 Jun 2020 06:15:06 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 31ngqtv2b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 06:15:05 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05F6F4H513894018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 06:15:04 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1C3BC6055;
 Mon, 15 Jun 2020 06:15:04 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BCE6C605B;
 Mon, 15 Jun 2020 06:15:02 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.2.91])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 06:15:02 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 08/41] powerpc/book3s64/pkeys: Convert execute key support
 to static key
Date: Mon, 15 Jun 2020 11:43:57 +0530
Message-Id: <20200615061430.770174-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
References: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_17:2020-06-12,
 2020-06-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 cotscore=-2147483648 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150050
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

