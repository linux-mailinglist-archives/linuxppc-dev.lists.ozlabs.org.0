Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E27261283
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 16:19:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm6jG5jyszDqSm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 00:19:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NJ3URzpd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm6f72Vx7zDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 00:16:46 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 088E5HaY155667; Tue, 8 Sep 2020 10:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=JMbH8samJLb5sy2XzpgZzo3gwfoR4Or5sHtVMIqHhLs=;
 b=NJ3URzpdswVooPaI2LHOaXu6ju+Ngmf2INx7IYktjmTAF583iqpKuti7BeOKDXf5dvjb
 DFU6oNAIttt5W97m8sP5q85mhtK8i+n1ItawNxhKl5O2wjjq4k9mXoPw5SqlXxavUX61
 DbY/EivnZmwZCJBJpbRxTSf59ig7WVFjsDjsZEQGKPiRyE8MJKsL2Z3Am3we93opJ+Lg
 jn3JNhFff4CDPtZ//sFEUOiYHH8m3x+zIMXGVLVBJKTIpwCGjvScInnPzqoa6ADDieUI
 XzPpVgnJ/wbqjo+1fcfB9iO+uJ5ZVGEMnbTIksPgteUtaZ/IE90vq4p07FXbR5xH1s/v Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33eb5wh4vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 10:16:06 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 088E5rqF157526;
 Tue, 8 Sep 2020 10:16:06 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33eb5wh4sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 10:16:06 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088EDg8b007449;
 Tue, 8 Sep 2020 14:16:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 33cm5hhqvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 14:16:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 088EFwKF37814660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Sep 2020 14:15:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FB7CA4069;
 Tue,  8 Sep 2020 14:15:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DB9EA406D;
 Tue,  8 Sep 2020 14:15:56 +0000 (GMT)
Received: from oc3871087118.ibm.com (unknown [9.145.58.21])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  8 Sep 2020 14:15:56 +0000 (GMT)
Date: Tue, 8 Sep 2020 16:15:55 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 2/3] mm: make pXd_addr_end() functions page-table
 entry aware
Message-ID: <20200908141554.GA20558@oc3871087118.ibm.com>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-3-gerald.schaefer@linux.ibm.com>
 <31dfb3ed-a0cc-3024-d389-ab9bd19e881f@csgroup.eu>
 <20200908074638.GA19099@oc3871087118.ibm.com>
 <5d4f5546-afd0-0b8f-664d-700ae346b9ec@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d4f5546-afd0-0b8f-664d-700ae346b9ec@csgroup.eu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-08_07:2020-09-08,
 2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080133
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 Vasily Gorbik <gor@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um <linux-um@lists.infradead.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 08, 2020 at 10:16:49AM +0200, Christophe Leroy wrote:
> >Yes, and also two more sources :/
> >	arch/powerpc/mm/kasan/8xx.c
> >	arch/powerpc/mm/kasan/kasan_init_32.c
> >
> >But these two are not quite obvious wrt pgd_addr_end() used
> >while traversing pmds. Could you please clarify a bit?
> >
> >
> >diff --git a/arch/powerpc/mm/kasan/8xx.c b/arch/powerpc/mm/kasan/8xx.c
> >index 2784224..89c5053 100644
> >--- a/arch/powerpc/mm/kasan/8xx.c
> >+++ b/arch/powerpc/mm/kasan/8xx.c
> >@@ -15,8 +15,8 @@
> >  	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd += 2, block += SZ_8M) {
> >  		pte_basic_t *new;
> >-		k_next = pgd_addr_end(k_cur, k_end);
> >-		k_next = pgd_addr_end(k_next, k_end);
> >+		k_next = pmd_addr_end(k_cur, k_end);
> >+		k_next = pmd_addr_end(k_next, k_end);
> 
> No, I don't think so.
> On powerpc32 we have only two levels, so pgd and pmd are more or
> less the same.
> But pmd_addr_end() as defined in include/asm-generic/pgtable-nopmd.h
> is a no-op, so I don't think it will work.
> 
> It is likely that this function should iterate on pgd, then you get
> pmd = pmd_offset(pud_offset(p4d_offset(pgd)));

It looks like the code iterates over single pmd table while using
pgd_addr_end() only to skip all the middle levels and bail out
from the loop.

I would be wary for switching from pmds to pgds, since we are
trying to minimize impact (especially functional) and the
rework does not seem that obvious.

Assuming pmd and pgd are the same would actually such approach
work for now?

diff --git a/arch/powerpc/mm/kasan/8xx.c b/arch/powerpc/mm/kasan/8xx.c
index 2784224..94466cc 100644
--- a/arch/powerpc/mm/kasan/8xx.c
+++ b/arch/powerpc/mm/kasan/8xx.c
@@ -15,8 +15,8 @@
 	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd += 2, block += SZ_8M) {
 		pte_basic_t *new;
 
-		k_next = pgd_addr_end(k_cur, k_end);
-		k_next = pgd_addr_end(k_next, k_end);
+		k_next = pgd_addr_end(__pgd(pmd_val(*pmd)), k_cur, k_end);
+		k_next = pgd_addr_end(__pgd(pmd_val(*(pmd + 1))), k_next, k_end);
 		if ((void *)pmd_page_vaddr(*pmd) != kasan_early_shadow_pte)
 			continue;
 
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index fb29404..c0bcd64 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -38,7 +38,7 @@ int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_
 	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd++) {
 		pte_t *new;
 
-		k_next = pgd_addr_end(k_cur, k_end);
+		k_next = pgd_addr_end(__pgd(pmd_val(*pmd)), k_cur, k_end);
 		if ((void *)pmd_page_vaddr(*pmd) != kasan_early_shadow_pte)
 			continue;
 
@@ -196,7 +196,7 @@ void __init kasan_early_init(void)
 	kasan_populate_pte(kasan_early_shadow_pte, PAGE_KERNEL);
 
 	do {
-		next = pgd_addr_end(addr, end);
+		next = pgd_addr_end(__pgd(pmd_val(*pmd)), addr, end);
 		pmd_populate_kernel(&init_mm, pmd, kasan_early_shadow_pte);
 	} while (pmd++, addr = next, addr != end);
 

Alternatively we could pass invalid pgd to keep the code structure
intact, but that of course is less nice.

Thanks!

> Christophe
