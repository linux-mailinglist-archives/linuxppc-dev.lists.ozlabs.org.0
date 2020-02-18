Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B8016250B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 11:57:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MHqL6GqZzDqBd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 21:57:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=nQZIkGPA; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MHmv0RdCzDqWk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 21:54:54 +1100 (AEDT)
Received: from hump (unknown [109.236.136.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58260207FD;
 Tue, 18 Feb 2020 10:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582023292;
 bh=CMlZZWS7PO9lkPnhA08fc6Islr+OQCEeZuheLiBfVmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nQZIkGPAmBAW2q8NANsj3kry2FjoyJoV6/tOeR6LNswBfh2J3GwBoJflFT5WH0M0E
 dfZCuTZ+znP94xdsEPbHpuBFhjabZfi5XCWgerZeTyyA+r8h1bx3I9KPRweYB3ciYM
 WYq+qWxM8vgm+Ut2efYgnUJmpLpvYONcSRjzEgV4=
Date: Tue, 18 Feb 2020 12:54:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 07/13] powerpc: add support for folded p4d page tables
Message-ID: <20200218105440.GA1698@hump>
References: <20200216081843.28670-1-rppt@kernel.org>
 <20200216081843.28670-8-rppt@kernel.org>
 <c79b363c-a111-389a-5752-51cf85fa8c44@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c79b363c-a111-389a-5752-51cf85fa8c44@c-s.fr>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Jonas Bonn <jonas@southpole.se>,
 linux-arch@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 16, 2020 at 11:41:07AM +0100, Christophe Leroy wrote:
> 
> 
> Le 16/02/2020 à 09:18, Mike Rapoport a écrit :
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Implement primitives necessary for the 4th level folding, add walks of p4d
> > level where appropriate and replace 5level-fixup.h with pgtable-nop4d.h.
> 
> I don't think it is worth adding all this additionnals walks of p4d, this
> patch could be limited to changes like:
> 
> -		pud = pud_offset(pgd, gpa);
> +		pud = pud_offset(p4d_offset(pgd, gpa), gpa);
> 
> The additionnal walks should be added through another patch the day powerpc
> need them.

Ok, I'll update the patch to reduce walking the p4d.
 
> See below for more comments.
> 
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > Tested-by: Christophe Leroy <christophe.leroy@c-s.fr> # 8xx and 83xx
> > ---

...

> > diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> > index 201a69e6a355..ddddbafff0ab 100644
> > --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> > +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> > @@ -2,7 +2,7 @@
> >   #ifndef _ASM_POWERPC_BOOK3S_64_PGTABLE_H_
> >   #define _ASM_POWERPC_BOOK3S_64_PGTABLE_H_
> > -#include <asm-generic/5level-fixup.h>
> > +#include <asm-generic/pgtable-nop4d.h>
> >   #ifndef __ASSEMBLY__
> >   #include <linux/mmdebug.h>
> > @@ -251,7 +251,7 @@ extern unsigned long __pmd_frag_size_shift;
> >   /* Bits to mask out from a PUD to get to the PMD page */
> >   #define PUD_MASKED_BITS		0xc0000000000000ffUL
> >   /* Bits to mask out from a PGD to get to the PUD page */
> > -#define PGD_MASKED_BITS		0xc0000000000000ffUL
> > +#define P4D_MASKED_BITS		0xc0000000000000ffUL
> >   /*
> >    * Used as an indicator for rcu callback functions
> > @@ -949,54 +949,60 @@ static inline bool pud_access_permitted(pud_t pud, bool write)
> >   	return pte_access_permitted(pud_pte(pud), write);
> >   }
> > -#define pgd_write(pgd)		pte_write(pgd_pte(pgd))
> > +#define __p4d_raw(x)	((p4d_t) { __pgd_raw(x) })
> > +static inline __be64 p4d_raw(p4d_t x)
> > +{
> > +	return pgd_raw(x.pgd);
> > +}
> > +
> 
> Shouldn't this be defined in asm/pgtable-be-types.h, just like other
> __pxx_raw() ?

Ideally yes, but this creates weird header file dependencies and untangling
them would generate way too much churn.
 
> > +#define p4d_write(p4d)		pte_write(p4d_pte(p4d))
> > -static inline void pgd_clear(pgd_t *pgdp)
> > +static inline void p4d_clear(p4d_t *p4dp)
> >   {
> > -	*pgdp = __pgd(0);
> > +	*p4dp = __p4d(0);
> >   }

...

> > @@ -573,9 +596,15 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
> >   	/* Traverse the guest's 2nd-level tree, allocate new levels needed */
> >   	pgd = pgtable + pgd_index(gpa);
> > -	pud = NULL;
> > +	p4d = NULL;
> >   	if (pgd_present(*pgd))
> > -		pud = pud_offset(pgd, gpa);
> > +		p4d = p4d_offset(pgd, gpa);
> > +	else
> > +		new_p4d = p4d_alloc_one(kvm->mm, gpa);
> > +
> > +	pud = NULL;
> > +	if (p4d_present(*p4d))
> > +		pud = pud_offset(p4d, gpa);
> 
> Is it worth adding all this new code ?
> 
> My understanding is that the series objective is to get rid of
> __ARCH_HAS_5LEVEL_HACK, to to add support for 5 levels to an architecture
> that not need it (at least for now).
> If we want to add support for 5 levels, it can be done later in another
> patch.
> 
> Here I think your change could be limited to:
> 
> -		pud = pud_offset(pgd, gpa);
> +		pud = pud_offset(p4d_offset(pgd, gpa), gpa);

This won't work. Without __ARCH_USE_5LEVEL_HACK defined pgd_present() is
hardwired to 1 and the actual check for the top level is performed with
p4d_present(). The 'else' clause that allocates p4d will never be taken and
it could be removed, but I prefer to keep it for consistency.
 
> >   	else
> >   		new_pud = pud_alloc_one(kvm->mm, gpa);
> > @@ -597,12 +626,18 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
> >   	/* Now traverse again under the lock and change the tree */
> >   	ret = -ENOMEM;
> >   	if (pgd_none(*pgd)) {
> > +		if (!new_p4d)
> > +			goto out_unlock;
> > +		pgd_populate(kvm->mm, pgd, new_p4d);
> > +		new_p4d = NULL;
> > +	}
> > +	if (p4d_none(*p4d)) {
> >   		if (!new_pud)
> >   			goto out_unlock;
> > -		pgd_populate(kvm->mm, pgd, new_pud);
> > +		p4d_populate(kvm->mm, p4d, new_pud);
> >   		new_pud = NULL;
> >   	}
> > -	pud = pud_offset(pgd, gpa);
> > +	pud = pud_offset(p4d, gpa);
> >   	if (pud_is_leaf(*pud)) {
> >   		unsigned long hgpa = gpa & PUD_MASK;
> > @@ -1220,6 +1255,7 @@ static ssize_t debugfs_radix_read(struct file *file, char __user *buf,
> >   	pgd_t *pgt;
> >   	struct kvm_nested_guest *nested;
> >   	pgd_t pgd, *pgdp;
> > +	p4d_t p4d, *p4dp;
> >   	pud_t pud, *pudp;
> >   	pmd_t pmd, *pmdp;
> >   	pte_t *ptep;
> > @@ -1298,7 +1334,14 @@ static ssize_t debugfs_radix_read(struct file *file, char __user *buf,
> >   			continue;
> >   		}
> > -		pudp = pud_offset(&pgd, gpa);
> > +		p4dp = p4d_offset(&pgd, gpa);
> > +		p4d = READ_ONCE(*p4dp);
> > +		if (!(p4d_val(p4d) & _PAGE_PRESENT)) {
> > +			gpa = (gpa & P4D_MASK) + P4D_SIZE;
> > +			continue;
> > +		}
> > +
> > +		pudp = pud_offset(&p4d, gpa);
> 
> Same, here you are forcing a useless read with READ_ONCE().
> 
> Your change could be limited to
> 
> -		pudp = pud_offset(&pgd, gpa);
> +		pudp = pud_offset(p4d_offset(&pgd, gpa), gpa);

Here again the actual check must be done against p4d rather than pgd. We
could skip READ_ONCE() for pgd, but since it is a debugfs method I don't
think it is more important than code consistency.
 
> This comment applies to many other places.

I'll make another pass to see where we can take the shortcut and use 

	pudp = pud_offset(p4d_offset(...))
 
> >   		pud = READ_ONCE(*pudp);
> >   		if (!(pud_val(pud) & _PAGE_PRESENT)) {
> >   			gpa = (gpa & PUD_MASK) + PUD_SIZE;
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> > index 3345f039a876..7a59f6863cec 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -107,13 +107,18 @@ static inline int unmap_patch_area(unsigned long addr)
> >   	pte_t *ptep;
> >   	pmd_t *pmdp;
> >   	pud_t *pudp;
> > +	p4d_t *p4dp;
> >   	pgd_t *pgdp;
> >   	pgdp = pgd_offset_k(addr);
> >   	if (unlikely(!pgdp))
> >   		return -EINVAL;
> > -	pudp = pud_offset(pgdp, addr);
> > +	p4dp = p4d_offset(pgdp, addr);
> > +	if (unlikely(!p4dp))
> > +		return -EINVAL;
> > +
> > +	pudp = pud_offset(p4dp, addr);
> >   	if (unlikely(!pudp))
> >   		return -EINVAL;
> > diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
> > index 0a1c65a2c565..b2fc3e71165c 100644
> > --- a/arch/powerpc/mm/book3s32/mmu.c
> > +++ b/arch/powerpc/mm/book3s32/mmu.c
> > @@ -312,7 +312,7 @@ void hash_preload(struct mm_struct *mm, unsigned long ea)
> >   	if (!Hash)
> >   		return;
> > -	pmd = pmd_offset(pud_offset(pgd_offset(mm, ea), ea), ea);
> > +	pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, ea), ea), ea), ea);
> 
> If we continue like this, in ten years this like is going to be many
> kilometers long.
> 
> I think the above would be worth a generic helper.

Agree. My plan was to first unify all the architectures and then start
introducing the generic helpers, like e.g. pmd_offset_mm().
 
> >   	if (!pmd_none(*pmd))
> >   		add_hash_page(mm->context.id, ea, pmd_val(*pmd));
> >   }
> > diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
> > index 2fcd321040ff..175bc33b41b7 100644
> > --- a/arch/powerpc/mm/book3s32/tlb.c
> > +++ b/arch/powerpc/mm/book3s32/tlb.c
> > @@ -87,7 +87,7 @@ static void flush_range(struct mm_struct *mm, unsigned long start,
> >   	if (start >= end)
> >   		return;
> >   	end = (end - 1) | ~PAGE_MASK;
> > -	pmd = pmd_offset(pud_offset(pgd_offset(mm, start), start), start);
> > +	pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, start), start), start), start);
> >   	for (;;) {
> >   		pmd_end = ((start + PGDIR_SIZE) & PGDIR_MASK) - 1;
> >   		if (pmd_end > end)
> > @@ -145,7 +145,7 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
> >   		return;
> >   	}
> >   	mm = (vmaddr < TASK_SIZE)? vma->vm_mm: &init_mm;
> > -	pmd = pmd_offset(pud_offset(pgd_offset(mm, vmaddr), vmaddr), vmaddr);
> > +	pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, vmaddr), vmaddr), vmaddr), vmaddr);
> >   	if (!pmd_none(*pmd))
> >   		flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
> >   }
> > diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
> > index 64733b9cb20a..9cd15937e88a 100644
> > --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
> > @@ -148,6 +148,7 @@ void hash__vmemmap_remove_mapping(unsigned long start,
> >   int hash__map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot)
> >   {
> >   	pgd_t *pgdp;
> > +	p4d_t *p4dp;
> >   	pud_t *pudp;
> >   	pmd_t *pmdp;
> >   	pte_t *ptep;
> > @@ -155,7 +156,8 @@ int hash__map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot)
> >   	BUILD_BUG_ON(TASK_SIZE_USER64 > H_PGTABLE_RANGE);
> >   	if (slab_is_available()) {
> >   		pgdp = pgd_offset_k(ea);
> > -		pudp = pud_alloc(&init_mm, pgdp, ea);
> > +		p4dp = p4d_offset(pgdp, ea);
> > +		pudp = pud_alloc(&init_mm, p4dp, ea);
> 
> Could be a single line, without a new var.
> 
> -		pudp = pud_alloc(&init_mm, pgdp, ea);
> +		pudp = pud_alloc(&init_mm, p4d_offset(pgdp, ea), ea);
> 
> 
> Same kind of comments as already done apply to the rest.
> 
> Christophe

-- 
Sincerely yours,
Mike.
