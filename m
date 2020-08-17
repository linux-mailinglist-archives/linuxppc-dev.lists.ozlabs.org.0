Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C1F2464C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 12:46:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVW234cMCzDqW3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 20:46:51 +1000 (AEST)
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
 header.s=pp1 header.b=LHpOsUOa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVVkH3bLLzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 20:33:11 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07H9XYoP048911; Mon, 17 Aug 2020 06:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=2Euh7Rgbmp1MMkBsWcSBcSeXl8dMu9rIMgkYovco/Y4=;
 b=LHpOsUOau7c5Bl7MKD631HaPu/9JtvSWLE0Y7J0z7LCXEkDuiBeLthimNKG/OxekoLbl
 YanRyIqLOWAXjheSHHD9JtWvqK84PG11jyb3jTQX0M+9jaLQouh+reulnEIdzSIAbIUG
 ub02KHitfOTr+mrOOGYWKljuPS0R+CmOOvgfWoaBjTqy2MnjAUu3RUxOPq1ag8SOGU7f
 9oA7GRPjq+BIbfvkBY/S2mAIp6buCft8gJ2aZVeJ9Am1id5/V5yuRZWGRqQ6T8wvNcF9
 OlXVD3w/bSXNeIxCRyU5AJRpLiVIz7cayZtphmdVX9tDcuy+Z2fIg4dhmL8gcLAPsSsC TA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y80hcwkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:33:07 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HATgjP018062;
 Mon, 17 Aug 2020 10:33:06 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 32x7b8v3bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 10:33:06 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HAX5Uf15073660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 10:33:05 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68EADAE066;
 Mon, 17 Aug 2020 10:33:05 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00905AE060;
 Mon, 17 Aug 2020 10:33:03 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.2.56])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 10:33:03 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/pkeys: Fix build error with PPC_MEM_KEYS disabled
Date: Mon, 17 Aug 2020 16:03:01 +0530
Message-Id: <20200817103301.158836-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_02:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008170071
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

IS_ENABLED() instead of #ifdef still requires variable declaration.
In this specific case, default_uamor is declared in asm/pkeys.h which
is only included if PPC_MEM_KEYS is enabled.

arch/powerpc/mm/book3s64/hash_utils.c: In function ‘hash__early_init_mmu_secondary’:
arch/powerpc/mm/book3s64/hash_utils.c:1119:21: error: ‘default_uamor’ undeclared (first use in this function)
 1119 |   mtspr(SPRN_UAMOR, default_uamor);
      |                     ^~~~~~~~~~~~~

Fixes: 6553fb799f60 ("powerpc/pkeys: Fix boot failures with Nemo board (A-EON AmigaOne X1000)")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 1da9dbba9217..890a71c5293e 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1115,8 +1115,10 @@ void hash__early_init_mmu_secondary(void)
 			&& cpu_has_feature(CPU_FTR_HVMODE))
 		tlbiel_all();
 
-	if (IS_ENABLED(CONFIG_PPC_MEM_KEYS) && mmu_has_feature(MMU_FTR_PKEY))
+#ifdef CONFIG_PPC_MEM_KEYS
+	if (mmu_has_feature(MMU_FTR_PKEY))
 		mtspr(SPRN_UAMOR, default_uamor);
+#endif
 }
 #endif /* CONFIG_SMP */
 
-- 
2.26.2

