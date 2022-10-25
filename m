Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719F60C2C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 06:50:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxKJV06CRz3f4Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 15:50:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C+qcV2oY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C+qcV2oY;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxK9N4TFxz3bjl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 15:44:40 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P4ftti014614;
	Tue, 25 Oct 2022 04:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=E577yCX0s6MnDeLZ1JMoGSlhRc9lVKWanuVmXlniy9I=;
 b=C+qcV2oY4daRFvYHd9LulS5D84SOHG5rzOCHrN97ZVYMkXcKWwTpS+e6wTm+5oCwl2L8
 Qj/R9HvR3gLxsGamOwvGI0BOWj57iiFbveDwPz0I8HTFZcsoWPjFB2x1SNY2JTD/P/7L
 7UClwSINUeSbA33Ui3Ovv8jFEx4Ah+x+7Lg7vRmBqOYqPkPUSIvttRhC5dFS/4FKebvZ
 LoWHl/nZ187RiIz6X6sNMPqamA32YnZjQxDNAMGy2KRuqRTWetGByJCsfbvl4McEevgF
 8V+NtNcXsH+Az8cF4hRFKK3IJ/I40p+fiieF5F8/O0X6Y0SUxgILdYCJOUVZVQwi2RZe 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke90fg1um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:30 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29P4hYHr025310;
	Tue, 25 Oct 2022 04:44:30 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke90fg1tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:29 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29P4KsCw011983;
	Tue, 25 Oct 2022 04:44:27 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3kdugas0e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29P4iPZt60948794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 04:44:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4ABA8AE056;
	Tue, 25 Oct 2022 04:44:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EE4CAE045;
	Tue, 25 Oct 2022 04:44:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 25 Oct 2022 04:44:24 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 62D846083B;
	Tue, 25 Oct 2022 15:44:21 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 7/7] powerpc/code-patching: Consolidate and cache per-cpu patching context
Date: Tue, 25 Oct 2022 15:44:09 +1100
Message-Id: <20221025044409.448755-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025044409.448755-1-bgray@linux.ibm.com>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SQCLNu6Haocly-OG_lvVxQ8g5nlaToma
X-Proofpoint-ORIG-GUID: 1xRUvnuCMjiy01Xd5tW-zsFZOQpLFx6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_09,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=753 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250024
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
text_poke_area is ever used, while remaining well-typed.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v9:	* Consolidate patching context into single struct
---
 arch/powerpc/lib/code-patching.c | 58 ++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 3fe99d0086fc..cefb938f7217 100644
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
@@ -116,15 +122,19 @@ static int text_area_cpu_up(unsigned int cpu)
 
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
-	this_cpu_write(text_poke_area, NULL);
+	free_vm_area(this_cpu_read(cpu_patching_context.text_poke_area));
+	this_cpu_write(cpu_patching_context.text_poke_area, NULL);
+	this_cpu_write(cpu_patching_context.addr, 0);
+	this_cpu_write(cpu_patching_context.pte, NULL);
 	return 0;
 }
 
@@ -172,9 +182,9 @@ static int text_area_cpu_up_mm(unsigned int cpu)
 	if (WARN_ON(!ptep))
 		goto fail_no_pte;
 
-	this_cpu_write(cpu_patching_mm, mm);
-	this_cpu_write(cpu_patching_addr, addr);
-	this_cpu_write(cpu_patching_pte, ptep);
+	this_cpu_write(cpu_patching_context.mm, mm);
+	this_cpu_write(cpu_patching_context.addr, addr);
+	this_cpu_write(cpu_patching_context.pte, ptep);
 
 	return 0;
 
@@ -202,8 +212,8 @@ static int text_area_cpu_down_mm(unsigned int cpu)
 	p4d_t *p4dp;
 	pgd_t *pgdp;
 
-	mm = this_cpu_read(cpu_patching_mm);
-	addr = this_cpu_read(cpu_patching_addr);
+	mm = this_cpu_read(cpu_patching_context.mm);
+	addr = this_cpu_read(cpu_patching_context.addr);
 
 	pgdp = pgd_offset(mm, addr);
 	p4dp = p4d_offset(pgdp, addr);
@@ -223,9 +233,9 @@ static int text_area_cpu_down_mm(unsigned int cpu)
 
 	mmput(mm);
 
-	this_cpu_write(cpu_patching_mm, NULL);
-	this_cpu_write(cpu_patching_addr, 0);
-	this_cpu_write(cpu_patching_pte, NULL);
+	this_cpu_write(cpu_patching_context.mm, NULL);
+	this_cpu_write(cpu_patching_context.addr, 0);
+	this_cpu_write(cpu_patching_context.pte, NULL);
 
 	return 0;
 }
@@ -316,9 +326,9 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 	struct mm_struct *patching_mm;
 	struct mm_struct *orig_mm;
 
-	patching_mm = __this_cpu_read(cpu_patching_mm);
-	pte = __this_cpu_read(cpu_patching_pte);
-	text_poke_addr = __this_cpu_read(cpu_patching_addr);
+	patching_mm = __this_cpu_read(cpu_patching_context.mm);
+	pte = __this_cpu_read(cpu_patching_context.pte);
+	text_poke_addr = __this_cpu_read(cpu_patching_context.addr);
 	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
 
 	if (unlikely(!patching_mm))
@@ -357,19 +367,17 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
 	int err;
 	u32 *patch_addr;
-	struct vm_struct *area;
 	unsigned long text_poke_addr;
 	pte_t *pte;
 	unsigned long pfn = get_patch_pfn(addr);
 
-	area = __this_cpu_read(text_poke_area);
-	if (unlikely(!area))
-		return -ENOMEM;
-
-	text_poke_addr = (unsigned long)area->addr & PAGE_MASK;
+	text_poke_addr = (unsigned long)__this_cpu_read(cpu_patching_context.addr) & PAGE_MASK;
 	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
 
-	pte = virt_to_kpte(text_poke_addr);
+	if (unlikely(!text_poke_addr))
+		return -ENOMEM;
+
+	pte = __this_cpu_read(cpu_patching_context.pte);
 	__set_pte_at(&init_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
 	/* See ptesync comment in radix__set_pte_at() */
 	if (radix_enabled())
-- 
2.37.3

