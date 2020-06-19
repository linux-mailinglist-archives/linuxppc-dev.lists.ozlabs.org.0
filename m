Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 909B4200F49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 17:21:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pMwc1TLBzDrD0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 01:21:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pL635QwMzDrMT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 23:59:55 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JDcJtS027882; Fri, 19 Jun 2020 09:59:49 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rmmf1fge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 09:59:49 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JDspAJ008980;
 Fri, 19 Jun 2020 13:59:48 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 31rd95fvet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:59:48 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JDxlEY27525580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 13:59:47 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04867BE056;
 Fri, 19 Jun 2020 13:59:47 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EDA5BE04F;
 Fri, 19 Jun 2020 13:59:44 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 13:59:43 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 15/26] powerpc/book3s64/pkeys: Use execute_pkey_disable
 static key
Date: Fri, 19 Jun 2020 19:28:39 +0530
Message-Id: <20200619135850.47155-16-aneesh.kumar@linux.ibm.com>
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
 priorityscore=1501 suspectscore=2 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 cotscore=-2147483648
 impostorscore=0 mlxscore=0 mlxlogscore=835 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190096
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

Use execute_pkey_disabled static key to check for execute key support instead
of pkey_disabled.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/pkeys.h | 10 +---------
 arch/powerpc/mm/book3s64/pkeys.c |  5 ++++-
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 47c81d41ea9a..09fbaa409ac4 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -126,15 +126,7 @@ static inline int mm_pkey_free(struct mm_struct *mm, int pkey)
  * Try to dedicate one of the protection keys to be used as an
  * execute-only protection key.
  */
-extern int __execute_only_pkey(struct mm_struct *mm);
-static inline int execute_only_pkey(struct mm_struct *mm)
-{
-	if (static_branch_likely(&pkey_disabled))
-		return -1;
-
-	return __execute_only_pkey(mm);
-}
-
+extern int execute_only_pkey(struct mm_struct *mm);
 extern int __arch_override_mprotect_pkey(struct vm_area_struct *vma,
 					 int prot, int pkey);
 static inline int arch_override_mprotect_pkey(struct vm_area_struct *vma,
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index bbba9c601e14..fed4f159011b 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -345,8 +345,11 @@ void thread_pkey_regs_init(struct thread_struct *thread)
 	write_uamor(default_uamor);
 }
 
-int __execute_only_pkey(struct mm_struct *mm)
+int execute_only_pkey(struct mm_struct *mm)
 {
+	if (static_branch_likely(&execute_pkey_disabled))
+		return -1;
+
 	return mm->context.execute_only_pkey;
 }
 
-- 
2.26.2

