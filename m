Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9290A622345
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 05:57:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xkn2rGCz3f2s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 15:57:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mTGGblUW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mTGGblUW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Xch2MBvz303P
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 15:51:47 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A93hqc4009291;
	Wed, 9 Nov 2022 04:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3iTsWVdBewQ6GSk1wfDs+ZRhchCLreXFIsd+U0L8Fbo=;
 b=mTGGblUW3ap+hS+f/QLZ0oskwifWwjqCuzJ9jBdC+lVk4kAw4c+0UEj2snYgCUTMcJDI
 hI0GSRQDAtMr2rVEt/ro9GuZS/P98IiOoavPH7xuGH2ixwnkdHKrohHsQmxPELxX9Hrv
 wnYvhl83K2x4UOad5CiiSZv6Ql61NZeq2tLN9SD1IY8VZxqBxUS+wY3Cpnqu5shc1Rza
 UZ9tCfPCEgO0bJkdh3lK56UQsoeh/5H7DRtT1+ip+XTuLtrL1ZsAb0qD4mQO8ADCOI7v
 1rGlqROgCNKfdrL7YtGnT0THlATDv8vKITKD36+axeh9bEbACltFttl3AJvPVXm0RtHZ 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr4j5jmwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:38 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A94oG7j004792;
	Wed, 9 Nov 2022 04:51:37 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr4j5jmuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:37 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A94oBLK031236;
	Wed, 9 Nov 2022 04:51:35 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3kngncd3cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:35 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A94pX034063828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 04:51:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C410A405C;
	Wed,  9 Nov 2022 04:51:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82C83A4054;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 030EC6083C;
	Wed,  9 Nov 2022 15:51:29 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 9/9] powerpc/code-patching: Consolidate and cache per-cpu patching context
Date: Wed,  9 Nov 2022 15:51:12 +1100
Message-Id: <20221109045112.187069-10-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109045112.187069-1-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7MMCeKG2zeviAQ62321mkvcU7TT0qf-E
X-Proofpoint-ORIG-GUID: E_uXsmLFLGS37vd9LnBia701GGEHnTmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_01,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=911 phishscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211090032
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the temp mm context support, there are CPU local variables to hold
the patch address and pte. Use these in the non-temp mm path as well
instead of adding a level of indirection through the text_poke_area
vm_struct and pointer chasing the pte.

As both paths use these fields now, there is no need to let unreferenced
variables be dropped by the compiler, so it is cleaner to merge them into
a single context struct. This has the additional benefit of removing a
redundant CPU local pointer, as only one of cpu_patching_mm /
text_poke_area is ever used, while remaining well-typed. It also groups
each CPU's data into a single cacheline.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v10:	* Mention cache benefits
v9:	* Consolidate patching context into single struct
---
 arch/powerpc/lib/code-patching.c | 49 +++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 5b0022997296..2e10df464a2b 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -48,10 +48,16 @@ int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
 
-static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
-static DEFINE_PER_CPU(struct mm_struct *, cpu_patching_mm);
-static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
-static DEFINE_PER_CPU(pte_t *, cpu_patching_pte);
+struct patch_context {
+	union {
+		struct vm_struct *text_poke_area;
+		struct mm_struct *mm;
+	};
+	unsigned long addr;
+	pte_t * pte;
+};
+
+static DEFINE_PER_CPU(struct patch_context, cpu_patching_context);
 
 static int map_patch_area(void *addr, unsigned long text_poke_addr);
 static void unmap_patch_area(unsigned long addr);
@@ -116,14 +122,19 @@ static int text_area_cpu_up(unsigned int cpu)
 
 	unmap_patch_area(addr);
 
-	this_cpu_write(text_poke_area, area);
+	this_cpu_write(cpu_patching_context.text_poke_area, area);
+	this_cpu_write(cpu_patching_context.addr, addr);
+	this_cpu_write(cpu_patching_context.pte, virt_to_kpte(addr));
 
 	return 0;
 }
 
 static int text_area_cpu_down(unsigned int cpu)
 {
-	free_vm_area(this_cpu_read(text_poke_area));
+	free_vm_area(this_cpu_read(cpu_patching_context.text_poke_area));
+	this_cpu_write(cpu_patching_context.text_poke_area, NULL);
+	this_cpu_write(cpu_patching_context.addr, 0);
+	this_cpu_write(cpu_patching_context.pte, NULL);
 	return 0;
 }
 
@@ -167,9 +178,9 @@ static int text_area_cpu_up_mm(unsigned int cpu)
 		goto fail_no_pte;
 	pte_unmap_unlock(pte, ptl);
 
-	this_cpu_write(cpu_patching_mm, mm);
-	this_cpu_write(cpu_patching_addr, addr);
-	this_cpu_write(cpu_patching_pte, pte);
+	this_cpu_write(cpu_patching_context.mm, mm);
+	this_cpu_write(cpu_patching_context.addr, addr);
+	this_cpu_write(cpu_patching_context.pte, pte);
 
 	return 0;
 
@@ -181,12 +192,12 @@ static int text_area_cpu_up_mm(unsigned int cpu)
 
 static int text_area_cpu_down_mm(unsigned int cpu)
 {
-	put_patching_mm(this_cpu_read(cpu_patching_mm),
-			this_cpu_read(cpu_patching_addr));
+	put_patching_mm(this_cpu_read(cpu_patching_context.mm),
+			this_cpu_read(cpu_patching_context.addr));
 
-	this_cpu_write(cpu_patching_mm, NULL);
-	this_cpu_write(cpu_patching_addr, 0);
-	this_cpu_write(cpu_patching_pte, NULL);
+	this_cpu_write(cpu_patching_context.mm, NULL);
+	this_cpu_write(cpu_patching_context.addr, 0);
+	this_cpu_write(cpu_patching_context.pte, NULL);
 
 	return 0;
 }
@@ -278,9 +289,9 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 	struct mm_struct *patching_mm;
 	struct mm_struct *orig_mm;
 
-	patching_mm = __this_cpu_read(cpu_patching_mm);
-	pte = __this_cpu_read(cpu_patching_pte);
-	text_poke_addr = __this_cpu_read(cpu_patching_addr);
+	patching_mm = __this_cpu_read(cpu_patching_context.mm);
+	pte = __this_cpu_read(cpu_patching_context.pte);
+	text_poke_addr = __this_cpu_read(cpu_patching_context.addr);
 	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
 
 	__set_pte_at(patching_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
@@ -320,10 +331,10 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	pte_t *pte;
 	unsigned long pfn = get_patch_pfn(addr);
 
-	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr & PAGE_MASK;
+	text_poke_addr = (unsigned long)__this_cpu_read(cpu_patching_context.addr) & PAGE_MASK;
 	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
 
-	pte = virt_to_kpte(text_poke_addr);
+	pte = __this_cpu_read(cpu_patching_context.pte);
 	__set_pte_at(&init_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
 	/* See ptesync comment in radix__set_pte_at() */
 	if (radix_enabled())
-- 
2.38.1

