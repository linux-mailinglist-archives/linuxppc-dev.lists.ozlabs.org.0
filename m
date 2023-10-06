Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 657507BB75A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 14:10:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cpc0vdWj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S26hP1VDGz3vXr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 23:10:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cpc0vdWj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S26gS700nz3c58
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 23:09:56 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396C1btB006558;
	Fri, 6 Oct 2023 12:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=huqyDy1Ks8AOqZMStcuuSfVWwhhvyNT+ig+tqSuQQIY=;
 b=cpc0vdWjAYQiZW3YbzqFMo3lwTaRTH2v/YcWQsJCrFXGMw/iG0PPGUsu63iIGalhjU3A
 TBkG4W1RsD150tnnqbAjji/leIXMMphqOvxGkjA6qvhj+GITUG/LvRoMopRcMTM7Rwky
 jogNuqvKaa+0liV2lClpMIemRbLUC/ivxHDXV94zu8I5HXbPh2jK829lcEhP0suJiKAV
 97VvhD7fx6fLxbeOFQHMrNG1WB6EMbVd+QXBLnxt2p+9uO6sp0oRxh1fJo1UKYnLbLZ2
 m7m9YiKez4X9/ytrwwwcZKk+G7G5s13f0XSQRGCGkDm6mo+NfuxfKe2AHkN0K7xRc01y ow== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjhnyrhvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 12:09:47 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396BRiC4025047;
	Fri, 6 Oct 2023 12:09:45 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3texd0jp15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 12:09:45 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396C8Ooc29426312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 12:08:24 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 443D058066;
	Fri,  6 Oct 2023 12:08:24 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DE1458055;
	Fri,  6 Oct 2023 12:08:22 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.21.56])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 12:08:22 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG:
 Unable to handle kernel data access at 0xfeffbb62ffec65fe)
In-Reply-To: <20231006124548.54d4b7a8@yea>
References: <20230929132750.3cd98452@yea> <87sf6onwko.fsf@linux.ibm.com>
 <20231006124548.54d4b7a8@yea>
Date: Fri, 06 Oct 2023 17:38:14 +0530
Message-ID: <87mswwnec1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hJ6S0hsuHqj6ZBLMQhbOnzsqFCU5WcaW
X-Proofpoint-GUID: hJ6S0hsuHqj6ZBLMQhbOnzsqFCU5WcaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_09,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=791 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060089
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
Cc: linuxppc-dev@lists.ozlabs.org, willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard Furtner <erhard_f@mailbox.org> writes:

> On Fri, 06 Oct 2023 11:04:15 +0530
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
>
>> Can you check this change?
>> 
>> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
>> index 3ba9fe411604..6d144fedd557 100644
>

...

>>  void unmap_kernel_page(unsigned long va)
>
> Thanks for having a look into the issue! Your patch applies but I got a build failure:
>
>  # make
>   CALL    scripts/checksyscalls.sh
>   CC      arch/powerpc/mm/pgtable.o
> In file included from ./include/linux/mm.h:29,
>                  from arch/powerpc/mm/pgtable.c:22:
> ./include/linux/pgtable.h:247:71: error: expected declaration specifiers or '...' before numeric constant
>   247 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
>       |                                                                       ^
> arch/powerpc/mm/pgtable.c:190:13: note: in expansion of macro 'set_pte_at'
>   190 | static void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>       |             ^~~~~~~~~~

Sorry that I shared a change without build testing.  Here is the updated change

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 3ba9fe411604..e563e13ffd88 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -190,29 +190,28 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		pte_t pte, unsigned int nr)
 {
-	/*
-	 * Make sure hardware valid bit is not set. We don't do
-	 * tlb flush for this update.
-	 */
-	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
-
-	/* Note: mm->context.id might not yet have been assigned as
-	 * this context might not have been activated yet when this
-	 * is called.
-	 */
-	pte = set_pte_filter(pte);
-
 	/* Perform the setting of the PTE */
-	arch_enter_lazy_mmu_mode();
 	for (;;) {
+
+		/*
+		 * Make sure hardware valid bit is not set. We don't do
+		 * tlb flush for this update.
+		 */
+		VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+
+		/* Note: mm->context.id might not yet have been assigned as
+		 * this context might not have been activated yet when this
+		 * is called.
+		 */
+		pte = set_pte_filter(pte);
+
+		/* Perform the setting of the PTE */
 		__set_pte_at(mm, addr, ptep, pte, 0);
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte = __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
 		addr += PAGE_SIZE;
 	}
-	arch_leave_lazy_mmu_mode();
 }
 
 void unmap_kernel_page(unsigned long va)
