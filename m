Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8665260D95
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 10:32:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blz0v1BRszDqRG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 18:32:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Blygd45PqzDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 18:17:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BlygQ2VM3z9tyfZ;
 Tue,  8 Sep 2020 10:17:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8E9ZAY1YbiyQ; Tue,  8 Sep 2020 10:17:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BlygQ1YKJz9tyfY;
 Tue,  8 Sep 2020 10:17:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B1BE8B7A1;
 Tue,  8 Sep 2020 10:17:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id k9FC2ZI-dL_g; Tue,  8 Sep 2020 10:17:23 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D4E3E8B768;
 Tue,  8 Sep 2020 10:17:20 +0200 (CEST)
Subject: Re: [RFC PATCH v2 2/3] mm: make pXd_addr_end() functions page-table
 entry aware
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-3-gerald.schaefer@linux.ibm.com>
 <31dfb3ed-a0cc-3024-d389-ab9bd19e881f@csgroup.eu>
 <20200908074638.GA19099@oc3871087118.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5d4f5546-afd0-0b8f-664d-700ae346b9ec@csgroup.eu>
Date: Tue, 8 Sep 2020 10:16:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908074638.GA19099@oc3871087118.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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



Le 08/09/2020 à 09:46, Alexander Gordeev a écrit :
> On Tue, Sep 08, 2020 at 07:14:38AM +0200, Christophe Leroy wrote:
>> You forgot arch/powerpc/mm/book3s64/subpage_prot.c it seems.
> 
> Yes, and also two more sources :/
> 	arch/powerpc/mm/kasan/8xx.c
> 	arch/powerpc/mm/kasan/kasan_init_32.c
> 
> But these two are not quite obvious wrt pgd_addr_end() used
> while traversing pmds. Could you please clarify a bit?
> 
> 
> diff --git a/arch/powerpc/mm/kasan/8xx.c b/arch/powerpc/mm/kasan/8xx.c
> index 2784224..89c5053 100644
> --- a/arch/powerpc/mm/kasan/8xx.c
> +++ b/arch/powerpc/mm/kasan/8xx.c
> @@ -15,8 +15,8 @@
>   	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd += 2, block += SZ_8M) {
>   		pte_basic_t *new;
>   
> -		k_next = pgd_addr_end(k_cur, k_end);
> -		k_next = pgd_addr_end(k_next, k_end);
> +		k_next = pmd_addr_end(k_cur, k_end);
> +		k_next = pmd_addr_end(k_next, k_end);

No, I don't think so.
On powerpc32 we have only two levels, so pgd and pmd are more or less 
the same.
But pmd_addr_end() as defined in include/asm-generic/pgtable-nopmd.h is 
a no-op, so I don't think it will work.

It is likely that this function should iterate on pgd, then you get pmd 
= pmd_offset(pud_offset(p4d_offset(pgd)));

>   		if ((void *)pmd_page_vaddr(*pmd) != kasan_early_shadow_pte)
>   			continue;
>   
> diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
> index fb29404..3f7d6dc6 100644
> --- a/arch/powerpc/mm/kasan/kasan_init_32.c
> +++ b/arch/powerpc/mm/kasan/kasan_init_32.c
> @@ -38,7 +38,7 @@ int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_
>   	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd++) {
>   		pte_t *new;
>   
> -		k_next = pgd_addr_end(k_cur, k_end);
> +		k_next = pmd_addr_end(k_cur, k_end);

Same here I get, iterate on pgd then get pmd = 
pmd_offset(pud_offset(p4d_offset(pgd)));

>   		if ((void *)pmd_page_vaddr(*pmd) != kasan_early_shadow_pte)
>   			continue;
>   
> @@ -196,7 +196,7 @@ void __init kasan_early_init(void)
>   	kasan_populate_pte(kasan_early_shadow_pte, PAGE_KERNEL);
>   
>   	do {
> -		next = pgd_addr_end(addr, end);
> +		next = pmd_addr_end(addr, end);
>   		pmd_populate_kernel(&init_mm, pmd, kasan_early_shadow_pte);
>   	} while (pmd++, addr = next, addr != end);
>   
> 

Christophe
