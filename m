Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DC01C24BD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:31:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Dn505fymzDr1D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:31:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DmjP617czDr2h
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:14:33 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 042B2HCn043058; Sat, 2 May 2020 07:14:28 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s50dua5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:14:28 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 042BE2Ps015759;
 Sat, 2 May 2020 11:14:27 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 30s0g5tax3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 11:14:27 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 042BERpF51773780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 2 May 2020 11:14:27 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3080C28064;
 Sat,  2 May 2020 11:14:27 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A168E28058;
 Sat,  2 May 2020 11:14:25 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.206])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat,  2 May 2020 11:14:25 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 09/12] powerpc/book3s64/pkeys: Simplify pkey disable branch
Date: Sat,  2 May 2020 16:43:44 +0530
Message-Id: <20200502111347.541836-10-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502111347.541836-1-aneesh.kumar@linux.ibm.com>
References: <20200502111347.541836-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-02_06:2020-05-01,
 2020-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005020095
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

Make the default value FALSE (pkey enabled) and set to TRUE when we
find the total number of keys supported to be zero.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/pkeys.h | 2 +-
 arch/powerpc/mm/book3s64/pkeys.c | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 5dd0a79d1809..75d2a2c19c04 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -11,7 +11,7 @@
 #include <linux/jump_label.h>
 #include <asm/firmware.h>
 
-DECLARE_STATIC_KEY_TRUE(pkey_disabled);
+DECLARE_STATIC_KEY_FALSE(pkey_disabled);
 extern int pkeys_total; /* total pkeys as per device tree */
 extern u32 initial_allocation_mask; /*  bits set for the initially allocated keys */
 extern u32 reserved_allocation_mask; /* bits set for reserved keys */
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 7d400d5a4076..87d882a9aaf2 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -12,7 +12,7 @@
 #include <linux/pkeys.h>
 #include <linux/of_device.h>
 
-DEFINE_STATIC_KEY_TRUE(pkey_disabled);
+DEFINE_STATIC_KEY_FALSE(pkey_disabled);
 DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
 int  pkeys_total;		/* Total pkeys as per device tree */
 u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
@@ -104,9 +104,8 @@ static int pkey_initialize(void)
 
 	/* scan the device tree for pkey feature */
 	pkeys_total = scan_pkey_feature();
-	if (pkeys_total)
-		static_branch_disable(&pkey_disabled);
-	else {
+	if (!pkeys_total) {
+		/* No support for pkey. Mark it disabled */
 		static_branch_enable(&pkey_disabled);
 		return 0;
 	}
-- 
2.26.2

