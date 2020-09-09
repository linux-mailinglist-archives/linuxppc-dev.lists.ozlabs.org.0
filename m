Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E3A262A99
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 10:41:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmb8h2CsjzDqTV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 18:41:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bmb5f0WPJzDqQF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 18:38:42 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bmb5S0y0Yz9v0ZM;
 Wed,  9 Sep 2020 10:38:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AVJJBZqZz_Lj; Wed,  9 Sep 2020 10:38:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bmb5R6sd6z9v0ZL;
 Wed,  9 Sep 2020 10:38:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B5318B7DC;
 Wed,  9 Sep 2020 10:38:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id c2KpwQPUfYWM; Wed,  9 Sep 2020 10:38:36 +0200 (CEST)
Received: from [10.0.2.15] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5593A8B7D4;
 Wed,  9 Sep 2020 10:38:35 +0200 (CEST)
Subject: Re: [RFC PATCH v2 2/3] mm: make pXd_addr_end() functions
 page-table entry aware
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexander Gordeev <agordeev@linux.ibm.com>
In-Reply-To: <20200908141554.GA20558@oc3871087118.ibm.com>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-3-gerald.schaefer@linux.ibm.com>
 <31dfb3ed-a0cc-3024-d389-ab9bd19e881f@csgroup.eu>
 <20200908074638.GA19099@oc3871087118.ibm.com>
 <5d4f5546-afd0-0b8f-664d-700ae346b9ec@csgroup.eu>
 <20200908141554.GA20558@oc3871087118.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Organization: CS Group France
Date: Wed, 09 Sep 2020 08:38:31 +0000
Message-ID: <1599640711.14692.1.camel@po17688vm.idsi0.si.c-s.fr>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-37.el6) 
Content-Transfer-Encoding: 7bit
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

On Tue, 2020-09-08 at 16:15 +0200, Alexander Gordeev wrote:
> On Tue, Sep 08, 2020 at 10:16:49AM +0200, Christophe Leroy wrote:
> > >Yes, and also two more sources :/
> > >	arch/powerpc/mm/kasan/8xx.c
> > >	arch/powerpc/mm/kasan/kasan_init_32.c
> > >
> > >But these two are not quite obvious wrt pgd_addr_end() used
> > >while traversing pmds. Could you please clarify a bit?
> > >
> > >
> > >diff --git a/arch/powerpc/mm/kasan/8xx.c b/arch/powerpc/mm/kasan/8xx.c
> > >index 2784224..89c5053 100644
> > >--- a/arch/powerpc/mm/kasan/8xx.c
> > >+++ b/arch/powerpc/mm/kasan/8xx.c
> > >@@ -15,8 +15,8 @@
> > >  	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd += 2, block += SZ_8M) {
> > >  		pte_basic_t *new;
> > >-		k_next = pgd_addr_end(k_cur, k_end);
> > >-		k_next = pgd_addr_end(k_next, k_end);
> > >+		k_next = pmd_addr_end(k_cur, k_end);
> > >+		k_next = pmd_addr_end(k_next, k_end);
> > 
> > No, I don't think so.
> > On powerpc32 we have only two levels, so pgd and pmd are more or
> > less the same.
> > But pmd_addr_end() as defined in include/asm-generic/pgtable-nopmd.h
> > is a no-op, so I don't think it will work.
> > 
> > It is likely that this function should iterate on pgd, then you get
> > pmd = pmd_offset(pud_offset(p4d_offset(pgd)));
> 
> It looks like the code iterates over single pmd table while using
> pgd_addr_end() only to skip all the middle levels and bail out
> from the loop.
> 
> I would be wary for switching from pmds to pgds, since we are
> trying to minimize impact (especially functional) and the
> rework does not seem that obvious.
> 

I've just tested the following change, it works and should fix the
oddity:

diff --git a/arch/powerpc/mm/kasan/8xx.c b/arch/powerpc/mm/kasan/8xx.c
index 2784224054f8..8e53ddf57b84 100644
--- a/arch/powerpc/mm/kasan/8xx.c
+++ b/arch/powerpc/mm/kasan/8xx.c
@@ -9,11 +9,12 @@
 static int __init
 kasan_init_shadow_8M(unsigned long k_start, unsigned long k_end, void
*block)
 {
-	pmd_t *pmd = pmd_off_k(k_start);
+	pgd_t *pgd = pgd_offset_k(k_start);
 	unsigned long k_cur, k_next;
 
-	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd += 2, block
+= SZ_8M) {
+	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pgd += 2, block
+= SZ_8M) {
 		pte_basic_t *new;
+		pmd_t *pmd = pmd_offset(pud_offset(p4d_offset(pgd, k_cur), k_cur),
k_cur);
 
 		k_next = pgd_addr_end(k_cur, k_end);
 		k_next = pgd_addr_end(k_next, k_end);
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c
b/arch/powerpc/mm/kasan/kasan_init_32.c
index fb294046e00e..e5f524fa71a7 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -30,13 +30,12 @@ static void __init kasan_populate_pte(pte_t *ptep,
pgprot_t prot)
 
 int __init kasan_init_shadow_page_tables(unsigned long k_start,
unsigned long k_end)
 {
-	pmd_t *pmd;
+	pgd_t *pgd = pgd_offset_k(k_start);
 	unsigned long k_cur, k_next;
 
-	pmd = pmd_off_k(k_start);
-
-	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd++) {
+	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pgd++) {
 		pte_t *new;
+		pmd_t *pmd = pmd_offset(pud_offset(p4d_offset(pgd, k_cur), k_cur),
k_cur);
 
 		k_next = pgd_addr_end(k_cur, k_end);
 		if ((void *)pmd_page_vaddr(*pmd) != kasan_early_shadow_pte)
@@ -189,16 +188,18 @@ void __init kasan_early_init(void)
 	unsigned long addr = KASAN_SHADOW_START;
 	unsigned long end = KASAN_SHADOW_END;
 	unsigned long next;
-	pmd_t *pmd = pmd_off_k(addr);
+	pgd_t *pgd = pgd_offset_k(addr);
 
 	BUILD_BUG_ON(KASAN_SHADOW_START & ~PGDIR_MASK);
 
 	kasan_populate_pte(kasan_early_shadow_pte, PAGE_KERNEL);
 
 	do {
+		pmd_t *pmd = pmd_offset(pud_offset(p4d_offset(pgd, addr), addr),
addr);
+
 		next = pgd_addr_end(addr, end);
 		pmd_populate_kernel(&init_mm, pmd, kasan_early_shadow_pte);
-	} while (pmd++, addr = next, addr != end);
+	} while (pgd++, addr = next, addr != end);
 
 	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		kasan_early_hash_table();
---
Christophe

