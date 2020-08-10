Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BF52404AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 12:28:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQBy73WHszDqGP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 20:28:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TOV/yz7l; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQBwJ2mPSzDqGP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 20:26:56 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07AA2PgO015671; Mon, 10 Aug 2020 06:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/TjjlZ2uJEGsIOBPH6P1/CQ8+hnWeZNplxilUNfzIxI=;
 b=TOV/yz7lS6Zq62WZ0U9DQEmIpSD1IxbpJy2a0MWuHTuIM/l4Rpyj3n46PXOAamKaXriA
 C2BluPRq1crDqg6xoMjk9STdv3L5xUBuX3ohXczlv2il9iePnzYnDe9iJR6UylNqZUjV
 hD7/OhxJ8OKOyedESOFhwc6tOa9XONobTgi4DGREK2xEfp9L9pUKuJiobc8cKxAjURnF
 bIINRjG7IciLimyZCI+uAkiE089xbsZAw1RKvyoXeWJ7g8iaCNMby9OfZt7tGBv2GOML
 nAPZUg76w3gI+TOmhVCeST2dLALcbN41mZIBW7akPPPrvh4Pikibyq0XfiFOp1wk0ixO 4w== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr6rg7g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 06:26:49 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07AAQAYc002450;
 Mon, 10 Aug 2020 10:26:48 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 32skp8rfh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 10:26:48 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07AAQmxW55443826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 10:26:48 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E95AC124058;
 Mon, 10 Aug 2020 10:26:47 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51674124052;
 Mon, 10 Aug 2020 10:26:46 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.68.158])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 10 Aug 2020 10:26:45 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/pkeys: Fix boot failures with Nemo board (A-EON
 AmigaOne X1000)
Date: Mon, 10 Aug 2020 15:56:23 +0530
Message-Id: <20200810102623.685083-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_03:2020-08-06,
 2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100069
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On p6 and before we should avoid updating UAMOR SPRN. This resulted
in boot failure on Nemo board.

Fixes: 269e829f48a0 ("powerpc/book3s64/pkey: Disable pkey on POWER6 and before")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c |  5 ++---
 arch/powerpc/mm/book3s64/pkeys.c      | 12 ++++++------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 1478fceeb683..1da9dbba9217 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1115,9 +1115,8 @@ void hash__early_init_mmu_secondary(void)
 			&& cpu_has_feature(CPU_FTR_HVMODE))
 		tlbiel_all();
 
-#ifdef CONFIG_PPC_MEM_KEYS
-	mtspr(SPRN_UAMOR, default_uamor);
-#endif
+	if (IS_ENABLED(CONFIG_PPC_MEM_KEYS) && mmu_has_feature(MMU_FTR_PKEY))
+		mtspr(SPRN_UAMOR, default_uamor);
 }
 #endif /* CONFIG_SMP */
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 69a6b87f2bb4..b1d091a97611 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -73,12 +73,6 @@ static int scan_pkey_feature(void)
 	if (early_radix_enabled())
 		return 0;
 
-	/*
-	 * Only P7 and above supports SPRN_AMR update with MSR[PR] = 1
-	 */
-	if (!early_cpu_has_feature(CPU_FTR_ARCH_206))
-		return 0;
-
 	ret = of_scan_flat_dt(dt_scan_storage_keys, &pkeys_total);
 	if (ret == 0) {
 		/*
@@ -124,6 +118,12 @@ void __init pkey_early_init_devtree(void)
 		     __builtin_popcountl(ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT)
 				!= (sizeof(u64) * BITS_PER_BYTE));
 
+	/*
+	 * Only P7 and above supports SPRN_AMR update with MSR[PR] = 1
+	 */
+	if (!early_cpu_has_feature(CPU_FTR_ARCH_206))
+		return;
+
 	/* scan the device tree for pkey feature */
 	pkeys_total = scan_pkey_feature();
 	if (!pkeys_total)
-- 
2.26.2

