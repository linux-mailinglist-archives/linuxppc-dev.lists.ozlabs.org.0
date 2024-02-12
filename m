Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54613850D43
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 05:51:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gQVpMyvm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYBrR1d2Zz3dTm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 15:51:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gQVpMyvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYBqk1qrVz3020
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 15:51:13 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41C2xKiZ031732;
	Mon, 12 Feb 2024 04:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=afIJC93n2mvfCPEos0LTvg1EIhSWJzEgFDpiNB/FW/w=;
 b=gQVpMyvmQjxnzFO/NXIlr9HTZZCRwqGgY9RShmumy47VO341Kv1RDdZ0xPkTYTXdlCJB
 P42kLayool2Qo9Okds+rGIcfbu8709Z1OE1aCcvtLKdkiDLd5qENaAf1gvh8S4zZOuuC
 Gxe4MOyieIwnb49IJGydq41xNzRDi9e8aHTP2QqISo2XINfT5NwishNpCxCo9smsrhZq
 OV64yjqsGH8rynBiCwTxc9nlgRTn4Q0Kp7Cmf5xwnAZRAXVDsaEt8gPgjMbbNLAdtvS1
 n2ShgYedNfQeN0LbgFc3a5lTJ+uAHdF4Va7+Sd2Y6YWbQzRlid3/bj/TUoHOUOFPHPhu vw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w74fsebux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 04:51:06 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41C1bWhh009886;
	Mon, 12 Feb 2024 04:50:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6p62e0jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 04:50:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41C4oYgi21234410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 04:50:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6494520040;
	Mon, 12 Feb 2024 04:50:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E66E220043;
	Mon, 12 Feb 2024 04:50:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Feb 2024 04:50:33 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DAA7160341;
	Mon, 12 Feb 2024 15:50:30 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc64/kasan: Pass virtual addresses to kasan_init_phys_region()
Date: Mon, 12 Feb 2024 15:50:20 +1100
Message-ID: <20240212045020.70364-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RbPz2I3UXZvc0fu7pap0dXMI-9WGEg5D
X-Proofpoint-ORIG-GUID: RbPz2I3UXZvc0fu7pap0dXMI-9WGEg5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_02,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402120035
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kasan_init_phys_region() function maps shadow pages necessary for
the ranges of the linear map backed by physical pages. Currently
kasan_init_phys_region() is being passed physical addresses, but
kasan_mem_to_shadow() expects virtual addresses.

It works right now because the lower bits (12:64) of the
kasan_mem_to_shadow() calculation are the same for the real and virtual
addresses, so the actual PTE value is the same in the end. But virtual
addresses are the intended input, so fix it.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/mm/kasan/init_book3e_64.c | 2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c b/arch/powerpc/mm/kasan/init_book3e_64.c
index 11519e88dc6b..43c03b84ff32 100644
--- a/arch/powerpc/mm/kasan/init_book3e_64.c
+++ b/arch/powerpc/mm/kasan/init_book3e_64.c
@@ -112,7 +112,7 @@ void __init kasan_init(void)
 	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL_RO);
 
 	for_each_mem_range(i, &start, &end)
-		kasan_init_phys_region((void *)start, (void *)end);
+		kasan_init_phys_region(phys_to_virt(start), phys_to_virt(end));
 
 	if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
 		kasan_remove_zero_shadow((void *)VMALLOC_START, VMALLOC_SIZE);
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index 9300d641cf9a..3fb5ce4f48f4 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -62,7 +62,7 @@ void __init kasan_init(void)
 	}
 
 	for_each_mem_range(i, &start, &end)
-		kasan_init_phys_region((void *)start, (void *)end);
+		kasan_init_phys_region(phys_to_virt(start), phys_to_virt(end));
 
 	for (i = 0; i < PTRS_PER_PTE; i++)
 		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
-- 
2.43.0

