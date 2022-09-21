Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A1E5BF33C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 04:03:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXMC61zSmz3c7L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 12:03:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lTFyuIRn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lTFyuIRn;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXMBQ0VDpz2yX3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 12:02:53 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L1nF3a027065
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=If5hxzZg+AHcI0Nq70I629q2hZeXc9USACZsn1VWGLg=;
 b=lTFyuIRndYs4aPthmIAj1AqY2m68yiod73cmthElGyjGJ5yHP/NsCe0JAwdcw2O/clHK
 +ScIVz8HL8b2QmiFGZpE8vCNjl+OICcgZBmj5DwZNYdwceixSrT+EXZHI5JPpPZ5/Sw9
 AytKHOxBjJ9dRoCtRIZli9UfRHSzgZm4gVbzYvwe0nHpwyfseg20GgazzW2j4VRDBlhc
 zVXT3mbh4EltXHknW4vn5gVP1u0nPr2vHcE53+14Zf4YamYsWLj/DDe/2+iWnnKN73eY
 Lkv7vEQlNPf8+cZ1MSXnw1mvMVlpa/b74ojNiCJRmMHFP5xZtZ10ld66kNhfJnbD3cyP +g== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqs9p8amr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:47 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L1q6jH017747
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 3jn5v93d7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L22igM41091556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E827452050
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9420E52051
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:43 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9D900600EE;
	Wed, 21 Sep 2022 12:02:38 +1000 (AEST)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
Date: Wed, 21 Sep 2022 02:02:10 +0000
Message-Id: <20220921020213.868124-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7xpMKGRC0H3_x3G5LvmuwUmyN65Pfbu5
X-Proofpoint-ORIG-GUID: 7xpMKGRC0H3_x3G5LvmuwUmyN65Pfbu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_12,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=998 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209210008
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
v2: Revert change to radix_memory_block_size, instead set the size
in radix_init_pgtable and radix__create_section_mapping directly.
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index db2f3d193448..623455c195d8 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -30,6 +30,7 @@
 #include <asm/trace.h>
 #include <asm/uaccess.h>
 #include <asm/ultravisor.h>
+#include <asm/set_memory.h>
 
 #include <trace/events/thp.h>
 
@@ -332,6 +333,10 @@ static void __init radix_init_pgtable(void)
 	unsigned long rts_field;
 	phys_addr_t start, end;
 	u64 i;
+	unsigned long size = radix_mem_block_size;
+
+	if (debug_pagealloc_enabled())
+		size = PAGE_SIZE;
 
 	/* We don't support slb for radix */
 	slb_set_size(0);
@@ -352,7 +357,7 @@ static void __init radix_init_pgtable(void)
 		}
 
 		WARN_ON(create_physical_mapping(start, end,
-						radix_mem_block_size,
+						size,
 						-1, PAGE_KERNEL));
 	}
 
@@ -844,13 +849,18 @@ int __meminit radix__create_section_mapping(unsigned long start,
 					    unsigned long end, int nid,
 					    pgprot_t prot)
 {
+	unsigned long size = radix_mem_block_size;
+
+	if (debug_pagealloc_enabled())
+		size = PAGE_SIZE;
+
 	if (end >= RADIX_VMALLOC_START) {
 		pr_warn("Outside the supported range\n");
 		return -1;
 	}
 
 	return create_physical_mapping(__pa(start), __pa(end),
-				       radix_mem_block_size, nid, prot);
+				       size, nid, prot);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
@@ -899,7 +909,14 @@ void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long
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

