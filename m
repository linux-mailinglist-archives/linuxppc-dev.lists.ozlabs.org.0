Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 695FD5BC11C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 03:48:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MW6yW5GVHz3bry
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 11:48:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EpNl8TL2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EpNl8TL2;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MW6xr3YZqz2xJG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 11:47:44 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J1ICOm021895
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=7dKLWQ9aa7YRKWGkPrczGd1189z0pNY/L1llpCbT1Jk=;
 b=EpNl8TL2z4bKZ9yyFpxVJCPwlGbyOOKPZZkz/tQGKPAEGOWvefb3e+jjlJbgdME4lGYV
 A54WNW5OdPtUICu4mLsHNH+PXNM7RgaBxybkM2GZr4i8F/WVghFY9qfhodb3ra8koPMJ
 YAr1iT5oMZqNC1sPbGTBD6c8l4MzlwPALIRwOpq4+eObm13kzr+5SFoywmiK4uF5tCyf
 cPYv1IFEAw/KUixsQ5PFuf0uwzJSuAOxThVJ5bQTkL4rHu+WbT0Td4ZE3vp4Gu5i5CF9
 tUYPdFg765Cu7nwI/X7b/55cF+KQUkT/8DZ7n6tXPRG3Cy3cxv7SR65Ww7onFI8QqtqC /w== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpen40d74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:40 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28J1Yrvb011473
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3jn5v8h8wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28J1heLA40305120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:43:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 099334C044
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8E804C040
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:35 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3E43B602EA;
	Mon, 19 Sep 2022 11:47:31 +1000 (AEST)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
Date: Mon, 19 Sep 2022 01:44:34 +0000
Message-Id: <20220919014437.608167-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dTJ9lWTQFP9tSH_-6kF2-8FO_Vgnua5C
X-Proofpoint-ORIG-GUID: dTJ9lWTQFP9tSH_-6kF2-8FO_Vgnua5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_01,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 mlxlogscore=917 clxscore=1011 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209190009
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
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is support for DEBUG_PAGEALLOC on hash but not on radix.
Add support on radix.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index db2f3d193448..483c99bfbde5 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -30,6 +30,7 @@
 #include <asm/trace.h>
 #include <asm/uaccess.h>
 #include <asm/ultravisor.h>
+#include <asm/set_memory.h>
 
 #include <trace/events/thp.h>
 
@@ -503,6 +504,9 @@ static unsigned long __init radix_memory_block_size(void)
 {
 	unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;
 
+	if (debug_pagealloc_enabled())
+		return PAGE_SIZE;
+
 	/*
 	 * OPAL firmware feature is set by now. Hence we are ok
 	 * to test OPAL feature.
@@ -519,6 +523,9 @@ static unsigned long __init radix_memory_block_size(void)
 
 static unsigned long __init radix_memory_block_size(void)
 {
+	if (debug_pagealloc_enabled())
+		return PAGE_SIZE;
+
 	return 1UL * 1024 * 1024 * 1024;
 }
 
@@ -899,7 +906,14 @@ void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void radix__kernel_map_pages(struct page *page, int numpages, int enable)
 {
-	pr_warn_once("DEBUG_PAGEALLOC not supported in radix mode\n");
+	unsigned long addr;
+
+	addr = (unsigned long)page_address(page);
+
+	if (enable)
+		set_memory_p(addr, numpages);
+	else
+		set_memory_np(addr, numpages);
 }
 #endif
 
-- 
2.34.1

