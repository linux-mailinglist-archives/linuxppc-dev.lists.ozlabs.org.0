Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F251765EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 22:26:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WY9G0Q1VzDqg9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 08:26:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WY7S1N7LzDqQg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 08:24:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48WY7F6ZCcz9v1hQ;
 Mon,  2 Mar 2020 22:24:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FWWL69vDJFoE; Mon,  2 Mar 2020 22:24:25 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48WY7F59jkz9ttBQ;
 Mon,  2 Mar 2020 22:24:25 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 0B1F9A0F; Mon,  2 Mar 2020 22:24:44 +0100 (CET)
Received: from rop17-1_migr-88-124-70-171.fbx.proxad.net
 (rop17-1_migr-88-124-70-171.fbx.proxad.net [88.124.70.171]) by
 messagerie.si.c-s.fr (Horde Framework) with HTTP; Mon, 02 Mar 2020 22:24:43
 +0100
Date: Mon, 02 Mar 2020 22:24:43 +0100
Message-ID: <20200302222443.Horde.3Vn7_PzcWbAADKFWloR-kw8@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] mm/debug: Add tests validating arch page table helpers
 for core features
References: <1582799637-11786-1-git-send-email-anshuman.khandual@arm.com>
 <2be41c29-500c-50af-f915-1493846ae9e5@c-s.fr>
 <4343eda9-7df2-a13c-0125-cf784c81ce14@arm.com>
In-Reply-To: <4343eda9-7df2-a13c-0125-cf784c81ce14@arm.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual <anshuman.khandual@arm.com> a =C3=A9crit=C2=A0:

> On 02/27/2020 04:59 PM, Christophe Leroy wrote:
>>
>>
>> Le 27/02/2020 =C3=A0 11:33, Anshuman Khandual a =C3=A9crit=C2=A0:
>>> This adds new tests validating arch page table helpers for these follow=
ing
>>> core memory features. These tests create and test specific mapping type=
s at
>>> various page table levels.
>>>
>>> * SPECIAL mapping
>>> * PROTNONE mapping
>>> * DEVMAP mapping
>>> * SOFTDIRTY mapping
>>> * SWAP mapping
>>> * MIGRATION mapping
>>> * HUGETLB mapping
>>> * THP mapping
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Mike Rapoport <rppt@linux.ibm.com>
>>> Cc: Vineet Gupta <vgupta@synopsys.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Paul Mackerras <paulus@samba.org>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
>>> Cc: Vasily Gorbik <gor@linux.ibm.com>
>>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: Ingo Molnar <mingo@redhat.com>
>>> Cc: Borislav Petkov <bp@alien8.de>
>>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>>> Cc: Kirill A. Shutemov <kirill@shutemov.name>
>>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>>> Cc: linux-snps-arc@lists.infradead.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Cc: linux-s390@vger.kernel.org
>>> Cc: linux-riscv@lists.infradead.org
>>> Cc: x86@kernel.org
>>> Cc: linux-arch@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>> Tested on arm64 and x86 platforms without any test failures. But this h=
as
>>> only been built tested on several other platforms. Individual tests nee=
d
>>> to be verified on all current enabling platforms for the test i.e s390,
>>> ppc32, arc etc.
>>>
>>> This patch must be applied on v5.6-rc3 after these patches
>>>
>>> 1. https://patchwork.kernel.org/patch/11385057/
>>> 2. https://patchwork.kernel.org/patch/11407715/
>>>
>>> OR
>>>
>>> This patch must be applied on linux-next (next-20200227) after this pat=
ch
>>>
>>> 2. https://patchwork.kernel.org/patch/11407715/
>>>
>>> =C2=A0 mm/debug_vm_pgtable.c | 310 ++++++++++++++++++++++++++++++++++++=
+++++-
>>> =C2=A0 1 file changed, 309 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>>> index 96dd7d574cef..3fb90d5b604e 100644
>>> --- a/mm/debug_vm_pgtable.c
>>> +++ b/mm/debug_vm_pgtable.c
>>> @@ -41,6 +41,44 @@
>>> =C2=A0=C2=A0 * wrprotect(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D A write protected and not a write entry
>>> =C2=A0=C2=A0 * pxx_bad(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D A mapped and non-table entry
>>> =C2=A0=C2=A0 * pxx_same(entry1, entry2)=C2=A0=C2=A0=C2=A0 =3D Both entr=
ies hold the exact same value
>>> + *
>>> + * Specific feature operations
>>> + *
>>> + * pte_mkspecial(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
Creates a special entry at PTE level
>>> + * pte_special(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Te=
sts a special entry at PTE level
>>> + *
>>> + * pte_protnone(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D T=
ests a no access entry at PTE level
>>> + * pmd_protnone(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D T=
ests a no access entry at PMD level
>>> + *
>>> + * pte_mkdevmap(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D C=
reates a device entry at PTE level
>>> + * pmd_mkdevmap(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D C=
reates a device entry at PMD level
>>> + * pud_mkdevmap(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D C=
reates a device entry at PUD level
>>> + * pte_devmap(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Tes=
ts a device entry at PTE level
>>> + * pmd_devmap(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Tes=
ts a device entry at PMD level
>>> + * pud_devmap(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Tes=
ts a device entry at PUD level
>>> + *
>>> + * pte_mksoft_dirty(entry)=C2=A0=C2=A0=C2=A0 =3D Creates a soft dirty =
entry at PTE level
>>> + * pmd_mksoft_dirty(entry)=C2=A0=C2=A0=C2=A0 =3D Creates a soft dirty =
entry at PMD level
>>> + * pte_swp_mksoft_dirty(entry)=C2=A0=C2=A0=C2=A0 =3D Creates a soft di=
rty swap=20=20
>>>=20entry at PTE level
>>> + * pmd_swp_mksoft_dirty(entry)=C2=A0=C2=A0=C2=A0 =3D Creates a soft di=
rty swap=20=20
>>>=20entry at PMD level
>>> + * pte_soft_dirty(entry)=C2=A0=C2=A0=C2=A0 =3D Tests a soft dirty entr=
y at PTE level
>>> + * pmd_soft_dirty(entry)=C2=A0=C2=A0=C2=A0 =3D Tests a soft dirty entr=
y at PMD level
>>> + * pte_swp_soft_dirty(entry)=C2=A0=C2=A0=C2=A0 =3D Tests a soft dirty =
swap entry=20=20
>>>=20at PTE level
>>> + * pmd_swp_soft_dirty(entry)=C2=A0=C2=A0=C2=A0 =3D Tests a soft dirty =
swap entry=20=20
>>>=20at PMD level
>>> + * pte_clear_soft_dirty(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 Clears a soft dirty entry=20=20
>>>=20at PTE level
>>> + * pmd_clear_soft_dirty(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 Clears a soft dirty entry=20=20
>>>=20at PMD level
>>> + * pte_swp_clear_soft_dirty(entry) =3D Clears a soft dirty swap=20=20
>>>=20entry at PTE level
>>> + * pmd_swp_clear_soft_dirty(entry) =3D Clears a soft dirty swap=20=20
>>>=20entry at PMD level
>>> + *
>>> + * pte_mkhuge(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Cre=
ates a HugeTLB entry at given level
>>> + * pte_huge(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Tests=
 a HugeTLB entry at given level
>>> + *
>>> + * pmd_trans_huge(entry)=C2=A0=C2=A0=C2=A0 =3D Tests a trans huge page=
 at PMD level
>>> + * pud_trans_huge(entry)=C2=A0=C2=A0=C2=A0 =3D Tests a trans huge page=
 at PUD level
>>> + * pmd_present(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Te=
sts an entry points to memory at=20=20
>>>=20PMD level
>>> + * pud_present(entry)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Te=
sts an entry points to memory at=20=20
>>>=20PUD level
>>> + * pmd_mknotpresent(entry)=C2=A0=C2=A0=C2=A0 =3D Invalidates an PMD en=
try for MMU
>>> + * pud_mknotpresent(entry)=C2=A0=C2=A0=C2=A0 =3D Invalidates an PUD en=
try for MMU
>>> =C2=A0=C2=A0 */
>>> =C2=A0 #define VMFLAGS=C2=A0=C2=A0=C2=A0 (VM_READ|VM_WRITE|VM_EXEC)
>>> =C2=A0 @@ -287,6 +325,233 @@ static void __init=20=20
>>>=20pmd_populate_tests(struct mm_struct *mm, pmd_t *pmdp,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(pmd_bad(pmd));
>>> =C2=A0 }
>>> =C2=A0 +#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
>>
>> Can we avoid ifdefs unless necessary ?
>>
>> In mm/memory.c I see things like the following, it means=20=20
>>=20pte_special() always exist and a #ifdef is not necessary.
>
> True, #ifdef here can be dropped here, done.
>
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (likely(!pte_special(pte))=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto =
check_pfn;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vma->vm_ops && vma->vm_op=
s->find_special_page)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n vma->vm_ops->find_special_page(vma, addr);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vma->vm_flags & (VM_PFNMA=
P | VM_MIXEDMAP))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_zero_pfn(pfn))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pte_devmap(pte))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n NULL;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_bad_pte(vma, addr, pte,=
 NULL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0}
>>
>>> +static void __init pte_special_tests(unsigned long pfn, pgprot_t prot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pte_t pte =3D pfn_pte(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pte_special(pte_mkspecial(pte)));
>>> +}
>>> +#else
>>> +static void __init pte_special_tests(unsigned long pfn, pgprot_t prot)=
 { }
>>> +#endif
>>> +
>>> +#ifdef CONFIG_NUMA_BALANCING
>>
>> Same here, this ifdef shouldn't be necessary because in=20=20
>>=20/include/asm-generic/pgtable.h we have the following, so a if=20=20
>>=20(IS_ENABLED()) should be enough.
>>
>> #ifndef CONFIG_NUMA_BALANCING
>> /*
>> =C2=A0* Technically a PTE can be PROTNONE even when not doing NUMA balan=
cing but
>> =C2=A0* the only case the kernel cares is for NUMA balancing and is only=
 ever set
>> =C2=A0* when the VMA is accessible. For PROT_NONE VMAs, the PTEs are not=
 marked
>> =C2=A0* _PAGE_PROTNONE so by by default, implement the helper as "always=
 no". It
>> =C2=A0* is the responsibility of the caller to distinguish between PROT_=
NONE
>> =C2=A0* protections and NUMA hinting fault protections.
>> =C2=A0*/
>> static inline int pte_protnone(pte_t pte)
>> {
>> =C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> }
>>
>> static inline int pmd_protnone(pmd_t pmd)
>> {
>> =C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> }
>> #endif /* CONFIG_NUMA_BALANCING */
>
> True,  #ifdef here can be dropped, done. There is something I had missed
> before, pfn_pmd() requires #ifdef CONFIG_TRANSPARENT_HUGEPAGE instead. We
> need a pmd_t here with given prot. We cannot go via pfn_pte() followed by
> pte_pmd(), as the later is platform specific and not available in general=
.

As many things require CONFIG_TRANSPARENT_HUGEPAGE,  maybe it would be=20=
=20
worth=20creating an additional C file with the related functions and=20=20
build=20it conditionnaly to CONFIG_TRANSPARENT_HUGEPAGE

Christophe

>
>>
>>> +static void __init pte_protnone_tests(unsigned long pfn, pgprot_t prot=
)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pte_t pte =3D pfn_pte(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pte_protnone(pte));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pte_present(pte));
>>> +}
>>> +
>>> +static void __init pmd_protnone_tests(unsigned long pfn, pgprot_t prot=
)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pmd_t pmd =3D pfn_pmd(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pmd_protnone(pmd));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pmd_present(pmd));
>>> +}
>>> +#else
>>> +static void __init pte_protnone_tests(unsigned long pfn, pgprot_t=20=
=20
>>>=20prot) { }
>>> +static void __init pmd_protnone_tests(unsigned long pfn, pgprot_t=20=
=20
>>>=20prot) { }
>>> +#endif
>>> +
>>> +#ifdef CONFIG_ARCH_HAS_PTE_DEVMAP
>>
>> Same here, in include/linux/mm.h we have:
>>
>> #ifndef CONFIG_ARCH_HAS_PTE_DEVMAP
>> static inline int pte_devmap(pte_t pte)
>> {
>> =C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> }
>> #endif
>>
>>
>>> +static void __init pte_devmap_tests(unsigned long pfn, pgprot_t prot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pte_t pte =3D pfn_pte(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pte_devmap(pte_mkdevmap(pte)));
>>> +}
>>> +
>>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>
>> Same. In inlude/asm-generic/pgtables.h you have:
>>
>> #if !defined(CONFIG_ARCH_HAS_PTE_DEVMAP) ||=20=20
>>=20!defined(CONFIG_TRANSPARENT_HUGEPAGE)
>> static inline int pmd_devmap(pmd_t pmd)
>> {
>> =C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> }
>> static inline int pud_devmap(pud_t pud)
>> {
>> =C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> }
>> static inline int pgd_devmap(pgd_t pgd)
>> {
>> =C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> }
>> #endif
>>
>>> +static void __init pmd_devmap_tests(unsigned long pfn, pgprot_t prot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pmd_t pmd =3D pfn_pmd(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pmd_devmap(pmd_mkdevmap(pmd)));
>>> +}
>>> +
>>> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>>
>> Same, see above
>
> Even though pxx_devmap() fallback definitions are present, pxx_mkdevmap()
> ones are still missing. We will have to add them first as a pre-requisite
> patch (which might not be popular without any non-debug use case) in orde=
r
> to drop these #ifdefs here.
>
>>
>>> +static void __init pud_devmap_tests(unsigned long pfn, pgprot_t prot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pud_t pud =3D pfn_pud(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pud_devmap(pud_mkdevmap(pud)));
>>> +}
>>> +#else
>>> +static void __init pud_devmap_tests(unsigned long pfn, pgprot_t prot) =
{ }
>>> +#endif
>>> +#else
>>> +static void __init pmd_devmap_tests(unsigned long pfn, pgprot_t prot) =
{ }
>>> +static void __init pud_devmap_tests(unsigned long pfn, pgprot_t prot) =
{ }
>>> +#endif
>>> +#else
>>> +static void __init pte_devmap_tests(unsigned long pfn, pgprot_t prot) =
{ }
>>> +static void __init pmd_devmap_tests(unsigned long pfn, pgprot_t prot) =
{ }
>>> +static void __init pud_devmap_tests(unsigned long pfn, pgprot_t prot) =
{ }
>>> +#endif
>>> +
>>> +#ifdef CONFIG_MEM_SOFT_DIRTY
>>
>> Same, they always exist, see include/asm-generic/pgtable.h
>
> Yeah, this can be dropped. Though will have to again add TRANSPARENT_HUGE=
PAGE
> to protect pfn_pmd() as explained before.
>
>>
>>> +static void __init pte_soft_dirty_tests(unsigned long pfn, pgprot_t pr=
ot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pte_t pte =3D pfn_pte(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pte_soft_dirty(pte_mksoft_dirty(pte)));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(pte_soft_dirty(pte_clear_soft_dirty(pte)));
>>> +}
>>> +
>>> +static void __init pte_swap_soft_dirty_tests(unsigned long pfn,=20=20
>>>=20pgprot_t prot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pte_t pte =3D pfn_pte(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pte_swp_soft_dirty(pte_swp_mksoft_dirty(pt=
e)));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(pte_swp_soft_dirty(pte_swp_clear_soft_dirty=
(pte)));
>>> +}
>>> +
>>> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>>
>> Same
>
> True, #ifdef here can be dropped, done.
>
>>
>>> +static void __init pmd_soft_dirty_tests(unsigned long pfn, pgprot_t pr=
ot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pmd_t pmd =3D pfn_pmd(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pmd_soft_dirty(pmd_mksoft_dirty(pmd)));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(pmd_soft_dirty(pmd_clear_soft_dirty(pmd)));
>>> +}
>>> +
>>> +static void __init pmd_swap_soft_dirty_tests(unsigned long pfn,=20=20
>>>=20pgprot_t prot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pmd_t pmd =3D pfn_pmd(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pmd_swp_soft_dirty(pmd_swp_mksoft_dirty(pm=
d)));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(pmd_swp_soft_dirty(pmd_swp_clear_soft_dirty=
(pmd)));
>>> +}
>>> +#else
>>> +static void __init pmd_soft_dirty_tests(unsigned long pfn,=20=20
>>>=20pgprot_t prot) { }
>>> +static void __init pmd_swap_soft_dirty_tests(unsigned long pfn,=20=20
>>>=20pgprot_t prot)
>>> +{
>>> +}
>>> +#endif
>>> +#else
>>> +static void __init pte_soft_dirty_tests(unsigned long pfn,=20=20
>>>=20pgprot_t prot) { }
>>> +static void __init pmd_soft_dirty_tests(unsigned long pfn,=20=20
>>>=20pgprot_t prot) { }
>>> +static void __init pte_swap_soft_dirty_tests(unsigned long pfn,=20=20
>>>=20pgprot_t prot)
>>> +{
>>> +}
>>> +static void __init pmd_swap_soft_dirty_tests(unsigned long pfn,=20=20
>>>=20pgprot_t prot)
>>> +{
>>> +}
>>> +#endif
>>> +
>>> +static void __init pte_swap_tests(unsigned long pfn, pgprot_t prot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 swp_entry_t swp;
>>> +=C2=A0=C2=A0=C2=A0 pte_t pte;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 pte =3D pfn_pte(pfn, prot);
>>> +=C2=A0=C2=A0=C2=A0 swp =3D __pte_to_swp_entry(pte);
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pte_same(pte, __swp_entry_to_pte(swp)));
>>> +}
>>> +
>>> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>>> +static void __init pmd_swap_tests(unsigned long pfn, pgprot_t prot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 swp_entry_t swp;
>>> +=C2=A0=C2=A0=C2=A0 pmd_t pmd;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 pmd =3D pfn_pmd(pfn, prot);
>>> +=C2=A0=C2=A0=C2=A0 swp =3D __pmd_to_swp_entry(pmd);
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pmd_same(pmd, __swp_entry_to_pmd(swp)));
>>> +}
>>> +#else
>>> +static void __init pmd_swap_tests(unsigned long pfn, pgprot_t prot) { =
}
>>> +#endif
>>> +
>>> +#ifdef CONFIG_MIGRATION
>>
>> Same. See include/linux/swapops.h
>
> True, #ifdef here can be dropped, done. Though will have to again add
> back TRANSPARENT_HUGEPAGE to protect pfn_pmd() as explained before.
>
>>
>>> +static void __init swap_migration_tests(struct page *page)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 swp_entry_t swp;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * make_migration_entry() expects given page t=
o be
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * locked, otherwise it stumbles upon a BUG_ON=
().
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 __SetPageLocked(page);
>>> +=C2=A0=C2=A0=C2=A0 swp =3D make_migration_entry(page, 1);
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!is_migration_entry(swp));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!is_write_migration_entry(swp));
>>> +
>>> +=C2=A0=C2=A0=C2=A0 make_migration_entry_read(&swp);
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!is_migration_entry(swp));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(is_write_migration_entry(swp));
>>> +
>>> +=C2=A0=C2=A0=C2=A0 swp =3D make_migration_entry(page, 0);
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!is_migration_entry(swp));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(is_write_migration_entry(swp));
>>> +=C2=A0=C2=A0=C2=A0 __ClearPageLocked(page);
>>> +}
>>> +#else
>>> +static void __init swap_migration_tests(struct page *page) { }
>>> +#endif
>>> +
>>> +#ifdef CONFIG_HUGETLB_PAGE
>>> +static void __init hugetlb_tests(unsigned long pfn, pgprot_t prot)
>>> +{
>>> +#ifdef CONFIG_ARCH_WANT_GENERAL_HUGETLB
>>> +=C2=A0=C2=A0=C2=A0 pte_t pte =3D pfn_pte(pfn, prot);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pte_huge(pte_mkhuge(pte)));
>>
>> We also need tests on hugepd stuff
>
> Sure, but lets discuss this on the other thread.
>
>>
>>> +#endif
>>> +}
>>> +#else
>>> +static void __init hugetlb_tests(unsigned long pfn, pgprot_t prot) { }
>>> +#endif
>>> +
>>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>
>> Same, see include/asm-generic/pgtable.h
>
> This is required to protect pxx_mknotpresent() which does not have a
> fall back and pfn_pmd()/pfn_pud() helpers have similar situation as
> well.
>
>>
>>> +static void __init pmd_thp_tests(unsigned long pfn, pgprot_t prot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pmd_t pmd;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * pmd_trans_huge() and pmd_present() must ret=
urn negative
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * after MMU invalidation with pmd_mknotpresen=
t().
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 pmd =3D pfn_pmd(pfn, prot);
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pmd_trans_huge(pmd_mkhuge(pmd)));
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Though platform specific test exclusions ar=
e not ideal,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * in this case S390 does not define pmd_mknot=
present()
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * which should be tested on other platforms e=
nabling THP.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +#ifndef CONFIG_S390
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(pmd_trans_huge(pmd_mknotpresent(pmd)));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(pmd_present(pmd_mknotpresent(pmd)));
>>> +#endif
>>
>> Can we add a stub on S390 instead ?
>
> Actually we dont have to. pmd_mknotpresent() is required for platforms
> that do not have __HAVE_ARCH_PMDP_INVALIDATE. Hence can wrap this code
> with !__HAVE_ARCH_PMDP_INVALIDATE to prevent build failures on such
> platforms like s390.
>
>>
>>> +}
>>> +
>>> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>>
>> Same ?
>
> The problem is, neither pud_mknotpresent() nor pfn_pud() have a generic
> fallback definition. So will have to keep this #ifdef.
>
>>
>>> +static void __init pud_thp_tests(unsigned long pfn, pgprot_t prot)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 pud_t pud;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * pud_trans_huge() and pud_present() must ret=
urn negative
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * after MMU invalidation with pud_mknotpresen=
t().
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 pud =3D pfn_pud(pfn, prot);
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(!pud_trans_huge(pud_mkhuge(pud)));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(pud_trans_huge(pud_mknotpresent(pud)));
>>> +=C2=A0=C2=A0=C2=A0 WARN_ON(pud_present(pud_mknotpresent(pud)));
>>> +}
>>> +#else
>>> +static void __init pud_thp_tests(unsigned long pfn, pgprot_t prot) { }
>>> +#endif
>>> +#else
>>> +static void __init pmd_thp_tests(unsigned long pfn, pgprot_t prot) { }
>>> +static void __init pud_thp_tests(unsigned long pfn, pgprot_t prot) { }
>>> +#endif
>>> +
>>> =C2=A0 static unsigned long __init get_random_vaddr(void)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long random_vaddr, random_pages=
, total_user_pages;
>>> @@ -302,13 +567,14 @@ static unsigned long __init get_random_vaddr(void=
)
>>> =C2=A0 void __init debug_vm_pgtable(void)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mm_struct *mm;
>>> +=C2=A0=C2=A0=C2=A0 struct page *page;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgd_t *pgdp;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p4d_t *p4dp, *saved_p4dp;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pud_t *pudp, *saved_pudp;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmd_t *pmdp, *saved_pmdp, pmd;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t *ptep;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgtable_t saved_ptep;
>>> -=C2=A0=C2=A0=C2=A0 pgprot_t prot;
>>> +=C2=A0=C2=A0=C2=A0 pgprot_t prot, protnone;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys_addr_t paddr;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long vaddr, pte_aligned, pmd_al=
igned;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pud_aligned, p4d_aligned, =
pgd_aligned;
>>> @@ -322,6 +588,25 @@ void __init debug_vm_pgtable(void)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * swap_migration_tests() requires a dedicated=
 page as it needs to
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * be locked before creating a migration entry=
 from it. Locking the
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * page that actually maps kernel text ('start=
_kernel') can be real
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * problematic. Lets allocate a dedicated page=
 explicitly for this
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * purpose that will be freed later.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 page =3D alloc_page(GFP_KERNEL);
>>
>> Can we do the page allocation and freeing in swap_migration_tests()=20=
=20
>>=20instead ?
>
> Although all the resources used in the helpers have been allocated=20=20
>=20in the main
> function itself before being passed down and later freed. But may be just=
 an
> exception could be made for swap_migration_tests() function as the alloca=
ted
> page is being exclusively used here. Later on if we need this page for so=
me
> other future tests, then will have to move it back to debug_vm_pgtable().


