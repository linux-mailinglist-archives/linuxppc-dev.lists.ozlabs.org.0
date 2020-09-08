Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D613C2612B8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 16:30:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm6xZ4PtrzDqHR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 00:30:10 +1000 (AEST)
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
 header.s=pp1 header.b=J7C9HIbs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm6sJ6mHczDqD7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 00:26:28 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 088E2kAB193410; Tue, 8 Sep 2020 10:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=x4Jffv0uhOxMnzQ2dJkXMe8lryLf2Vv6NR5aexBXTbM=;
 b=J7C9HIbsK9YGAOgACeooFH+UVe1aBgntuVegvy+W6cSnCeKK40/okhY6953A0WKMa2sZ
 lt2aIcurXIbtf3oxmKVDAZ/vBtwjjFE17E/v+fhZ+kStYXO6uAMz3hfkRsvq2JyaD+6a
 ONkP2+eK2PEba3urt5mzNWHUjT93A/EVyypf96uH5RPbJjWGKUFif5DuAG0YW/efMYVt
 apTJRC8h5k/l64tiI8OmZ/zVnwkdYwAwfqfOSsDXkOG7nMOQq8XV5KlZu5pgRNYiM/TH
 gTfjiwpdez5W24QPH3SvVYU2DPKK/n8Q9COlkZMKkt0UkKnbADxbJxmmUs3DxUD/wFJU 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33e9ma4fff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 10:25:41 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 088E3g1E196268;
 Tue, 8 Sep 2020 10:25:40 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33e9ma4fbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 10:25:40 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088EPaNB024340;
 Tue, 8 Sep 2020 14:25:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 33e5gmr7g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 14:25:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 088EO0HG21889504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Sep 2020 14:24:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69ADBAE053;
 Tue,  8 Sep 2020 14:25:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC167AE04D;
 Tue,  8 Sep 2020 14:25:31 +0000 (GMT)
Received: from oc3871087118.ibm.com (unknown [9.145.58.21])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  8 Sep 2020 14:25:31 +0000 (GMT)
Date: Tue, 8 Sep 2020 16:25:30 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH v2 2/3] mm: make pXd_addr_end() functions page-table
 entry aware
Message-ID: <20200908142529.GB20558@oc3871087118.ibm.com>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-3-gerald.schaefer@linux.ibm.com>
 <31dfb3ed-a0cc-3024-d389-ab9bd19e881f@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31dfb3ed-a0cc-3024-d389-ab9bd19e881f@csgroup.eu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-08_07:2020-09-08,
 2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
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

On Tue, Sep 08, 2020 at 07:14:38AM +0200, Christophe Leroy wrote:
[...]
> You forgot arch/powerpc/mm/book3s64/subpage_prot.c it seems.

If this one would be okay?

diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
index 60c6ea16..3690d22 100644
--- a/arch/powerpc/mm/book3s64/subpage_prot.c
+++ b/arch/powerpc/mm/book3s64/subpage_prot.c
@@ -88,6 +88,7 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
 static void subpage_prot_clear(unsigned long addr, unsigned long len)
 {
 	struct mm_struct *mm = current->mm;
+	pmd_t *pmd = pmd_off(mm, addr);
 	struct subpage_prot_table *spt;
 	u32 **spm, *spp;
 	unsigned long i;
@@ -103,8 +104,8 @@ static void subpage_prot_clear(unsigned long addr, unsigned long len)
 	limit = addr + len;
 	if (limit > spt->maxaddr)
 		limit = spt->maxaddr;
-	for (; addr < limit; addr = next) {
-		next = pmd_addr_end(addr, limit);
+	for (; addr < limit; addr = next, pmd++) {
+		next = pmd_addr_end(*pmd, addr, limit);
 		if (addr < 0x100000000UL) {
 			spm = spt->low_prot;
 		} else {
@@ -191,6 +192,7 @@ static void subpage_mark_vma_nohuge(struct mm_struct *mm, unsigned long addr,
 		unsigned long, len, u32 __user *, map)
 {
 	struct mm_struct *mm = current->mm;
+	pmd_t *pmd = pmd_off(mm, addr);
 	struct subpage_prot_table *spt;
 	u32 **spm, *spp;
 	unsigned long i;
@@ -236,8 +238,8 @@ static void subpage_mark_vma_nohuge(struct mm_struct *mm, unsigned long addr,
 	}
 
 	subpage_mark_vma_nohuge(mm, addr, len);
-	for (limit = addr + len; addr < limit; addr = next) {
-		next = pmd_addr_end(addr, limit);
+	for (limit = addr + len; addr < limit; addr = next, pmd++) {
+		next = pmd_addr_end(*pmd, addr, limit);
 		err = -ENOMEM;
 		if (addr < 0x100000000UL) {
 			spm = spt->low_prot;

Thanks!

> Christophe
