Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBC2564DCA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 08:40:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lbx542tlzz3byP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 16:40:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O5uWRAae;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O5uWRAae;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lbx441gh7z3blZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 16:39:31 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2645pBsR003879;
	Mon, 4 Jul 2022 06:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=0EY35xZ64Q1BHHJupuqTJDmwq91hlb0emldA2RyhX/8=;
 b=O5uWRAaeGKUBJZnLrz0PxY8lZx7apu1RzqKAZbbzSSfEeXiadz+mP/x6YCg6h7/Jykl1
 YzFDZf3OUs4dWRbDTPI7t+4CDetsrCs1iiXQVWOu/ghQeKoZWcc5N30rDezyoYvdwtBK
 FqxrUF/ViWcKAgR7cWupfXcnd08ZiSuPitp45X46uBF40IMFE5Ps1ikdUhYncSD0Uqfu
 b5MBqu2y9iJj7dwDQF8ofhRt0FbaoVJsznrdn9DxTKeMsYA5feCDD9Ge3trythQ6imUK
 RBYef8qpaMxMdbZORhDfmNB4tJCqeh+XdvvkMi3MyGxz8C9r2vF0LA6SOWGPNqhz8I6O 7g== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h3te30ux8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Jul 2022 06:39:16 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2646K9NP015020;
	Mon, 4 Jul 2022 06:39:16 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma03dal.us.ibm.com with ESMTP id 3h2dn9h3v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Jul 2022 06:39:15 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2646dFsT43319626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Jul 2022 06:39:15 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3369BB2064;
	Mon,  4 Jul 2022 06:39:15 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27281B205F;
	Mon,  4 Jul 2022 06:39:13 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.74.198])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon,  4 Jul 2022 06:39:12 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/mm: Use is_vmalloc_addr to validate addr
Date: Mon,  4 Jul 2022 12:09:09 +0530
Message-Id: <20220704063909.295546-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YcVB7crSUnxz6fFwQl1dNT3Qnvvxs0sF
X-Proofpoint-ORIG-GUID: YcVB7crSUnxz6fFwQl1dNT3Qnvvxs0sF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_05,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207040027
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of high_memory use is_vmalloc_addr to validate that the address is
not in the vmalloc range.

Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
-
---
 arch/powerpc/include/asm/page.h | 10 ++++------
 arch/powerpc/mm/mem.c           | 11 +++++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index e5f75c70eda8..977835570db3 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -131,12 +131,10 @@ static inline bool pfn_valid(unsigned long pfn)
 #define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
 #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
 #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
-
-#define virt_addr_valid(vaddr)	({					\
-	unsigned long _addr = (unsigned long)vaddr;			\
-	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
-	pfn_valid(virt_to_pfn(_addr));					\
-})
+#ifndef __ASSEMBLY__
+extern bool __virt_addr_valid(unsigned long kaddr);
+#endif
+#define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long) (kaddr))
 
 /*
  * On Book-E parts we need __va to parse the device tree and we can't
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 7b0d286bf9ba..622f8bac808b 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -406,3 +406,14 @@ int devmem_is_allowed(unsigned long pfn)
  * the EHEA driver. Drop this when drivers/net/ethernet/ibm/ehea is removed.
  */
 EXPORT_SYMBOL_GPL(walk_system_ram_range);
+
+bool __virt_addr_valid(unsigned long kaddr)
+{
+	if (kaddr < PAGE_OFFSET)
+		return false;
+	if (is_vmalloc_addr((void *) kaddr))
+		return false;
+	return pfn_valid(virt_to_pfn(kaddr));
+}
+EXPORT_SYMBOL(__virt_addr_valid);
+
-- 
2.36.1

