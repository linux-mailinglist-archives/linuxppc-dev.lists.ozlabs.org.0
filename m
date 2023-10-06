Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B17BB139
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 07:35:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AKCq96jC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1xwY1vFdz3cVS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 16:35:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AKCq96jC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1xvb5Shvz3c58
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 16:34:51 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3965XtuF005554;
	Fri, 6 Oct 2023 05:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Tw5C56G0CAwvn7fcT/tI202NgGESronWuxtFcr7fsdY=;
 b=AKCq96jChBKWRpmGduB1musrFfUNi5w/P402B0iDKgE0+odL4/jPHLdxL7hEI4SmPqpE
 Gfr1CptwM1sJNxVxsV5Rb/w6SkNGKodrmPoB8nHap8g+I5a0sLSCZrxHO4dy4AYLEHyq
 nRlzWp6xM2vrv0kpsL1W3eARgZAVawbT7PNHG6kM474PnIR0owE0x5tkhFeFx0As3/fu
 BzG14YEfBIRb0vdn2828UU7/+wczRwo8YNLLUnac4qOXnMHnb2w1ito3lIq/kWEdI9s/
 nD+8UURwq/lk6SLDpZYNDCxEQp9GNo6qnk89HddRC1twbjS4oiYXu/E2kcvQWVcrusaC EA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjbxcga6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 05:34:37 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3964q0dV005909;
	Fri, 6 Oct 2023 05:34:20 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tex0tujk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 05:34:20 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3965YJkD48497130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 05:34:19 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C96E58058;
	Fri,  6 Oct 2023 05:34:19 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2171D58059;
	Fri,  6 Oct 2023 05:34:18 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.212.144])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 05:34:17 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG:
 Unable to handle kernel data access at 0xfeffbb62ffec65fe)
In-Reply-To: <20230929132750.3cd98452@yea>
References: <20230929132750.3cd98452@yea>
Date: Fri, 06 Oct 2023 11:04:15 +0530
Message-ID: <87sf6onwko.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mlDrlj6WC3NDX9YpUu497fm-Bdqmc4YT
X-Proofpoint-ORIG-GUID: mlDrlj6WC3NDX9YpUu497fm-Bdqmc4YT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_02,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 clxscore=1011 adultscore=0
 mlxlogscore=749 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060041
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
Cc: willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi,

Erhard Furtner <erhard_f@mailbox.org> writes:

> Greetings!
>
> Kernel 6.5.5 boots fine on my PowerMac G5 11,2 but kernel 6.6-rc3 fails to boot with following dmesg shown on the OpenFirmware console (transcribed screenshot):

> I bisected the issue and got 9fee28baa601f4dbf869b1373183b312d2d5ef3d as 1st bad commit:
>

Can you check this change?

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 3ba9fe411604..6d144fedd557 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -187,8 +187,8 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 /*
  * set_pte stores a linux PTE into the linux page table.
  */
-void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
-		pte_t pte, unsigned int nr)
+static void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		pte_t pte)
 {
 	/*
 	 * Make sure hardware valid bit is not set. We don't do
@@ -203,16 +203,23 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	pte = set_pte_filter(pte);
 
 	/* Perform the setting of the PTE */
-	arch_enter_lazy_mmu_mode();
+	__set_pte_at(mm, addr, ptep, pte, 0);
+}
+
+/*
+ * set_pte stores a linux PTE into the linux page table.
+ */
+void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		pte_t pte, unsigned int nr)
+{
+	/* Perform the setting of the PTE */
 	for (;;) {
-		__set_pte_at(mm, addr, ptep, pte, 0);
+		set_pte_at(mm, addr, ptep, pte);
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte = __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
 		addr += PAGE_SIZE;
 	}
-	arch_leave_lazy_mmu_mode();
 }
 
 void unmap_kernel_page(unsigned long va)
