Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9278A1A9245
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 07:12:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4929Tk0VZPzDr3S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 15:12:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4929S860wdzDqmX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 15:11:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4929S83wMHz8shd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 15:11:20 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4929S83TdCz9sSd; Wed, 15 Apr 2020 15:11:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=68.65.122.30;
 helo=mta-10-1.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
X-Greylist: delayed 1898 seconds by postgrey-1.36 at bilbo;
 Wed, 15 Apr 2020 15:11:19 AEST
Received: from MTA-10-1.privateemail.com (mta-10-1.privateemail.com
 [68.65.122.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4929S770xNz9s71
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Apr 2020 15:11:19 +1000 (AEST)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id E8AD360038;
 Wed, 15 Apr 2020 01:11:16 -0400 (EDT)
Received: from APP-05 (unknown [10.20.147.155])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id C9AFE60033;
 Wed, 15 Apr 2020 05:11:16 +0000 (UTC)
Date: Wed, 15 Apr 2020 00:11:16 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@ozlabs.org
Message-ID: <32766971.188162.1586927476788@privateemail.com>
In-Reply-To: <db40ec6a-1d81-91e3-00d8-cd86fd5262d5@c-s.fr>
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-4-cmr@informatik.wtf>
 <db40ec6a-1d81-91e3-00d8-cd86fd5262d5@c-s.fr>
Subject: Re: [RFC PATCH 3/3] powerpc/lib: Use a temporary mm for code patching
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev24
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Reply-To: Christopher M Riedl <cmr@informatik.wtf>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On March 24, 2020 11:25 AM Christophe Leroy <christophe.leroy@c-s.fr> wro=
te:
>=20
> =20
> Le 23/03/2020 =C3=A0 05:52, Christopher M. Riedl a =C3=A9crit=C2=A0:
> > Currently, code patching a STRICT_KERNEL_RWX exposes the temporary
> > mappings to other CPUs. These mappings should be kept local to the CPU
> > doing the patching. Use the pre-initialized temporary mm and patching
> > address for this purpose. Also add a check after patching to ensure the
> > patch succeeded.
> >=20
> > Based on x86 implementation:
> >=20
> > commit b3fd8e83ada0
> > ("x86/alternatives: Use temporary mm for text poking")
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> >   arch/powerpc/lib/code-patching.c | 128 ++++++++++++++----------------=
-
> >   1 file changed, 57 insertions(+), 71 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 18b88ecfc5a8..f156132e8975 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -19,6 +19,7 @@
> >   #include <asm/page.h>
> >   #include <asm/code-patching.h>
> >   #include <asm/setup.h>
> > +#include <asm/mmu_context.h>
> >  =20
> >   static int __patch_instruction(unsigned int *exec_addr, unsigned int =
instr,
> >   =09=09=09       unsigned int *patch_addr)
> > @@ -65,99 +66,79 @@ void __init poking_init(void)
> >   =09pte_unmap_unlock(ptep, ptl);
> >   }
> >  =20
> > -static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> > -
> > -static int text_area_cpu_up(unsigned int cpu)
> > -{
> > -=09struct vm_struct *area;
> > -
> > -=09area =3D get_vm_area(PAGE_SIZE, VM_ALLOC);
> > -=09if (!area) {
> > -=09=09WARN_ONCE(1, "Failed to create text area for cpu %d\n",
> > -=09=09=09cpu);
> > -=09=09return -1;
> > -=09}
> > -=09this_cpu_write(text_poke_area, area);
> > -
> > -=09return 0;
> > -}
> > -
> > -static int text_area_cpu_down(unsigned int cpu)
> > -{
> > -=09free_vm_area(this_cpu_read(text_poke_area));
> > -=09return 0;
> > -}
> > -
> > -/*
> > - * Run as a late init call. This allows all the boot time patching to =
be done
> > - * simply by patching the code, and then we're called here prior to
> > - * mark_rodata_ro(), which happens after all init calls are run. Altho=
ugh
> > - * BUG_ON() is rude, in this case it should only happen if ENOMEM, and=
 we judge
> > - * it as being preferable to a kernel that will crash later when someo=
ne tries
> > - * to use patch_instruction().
> > - */
> > -static int __init setup_text_poke_area(void)
> > -{
> > -=09BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > -=09=09"powerpc/text_poke:online", text_area_cpu_up,
> > -=09=09text_area_cpu_down));
> > -
> > -=09return 0;
> > -}
> > -late_initcall(setup_text_poke_area);
> > +struct patch_mapping {
> > +=09spinlock_t *ptl; /* for protecting pte table */
> > +=09struct temp_mm temp_mm;
> > +};
> >  =20
> >   /*
> >    * This can be called for kernel text or a module.
> >    */
> > -static int map_patch_area(void *addr, unsigned long text_poke_addr)
> > +static int map_patch(const void *addr, struct patch_mapping *patch_map=
ping)
>=20
> Why change the name ?
>=20

It's not really an "area" anymore.

> >   {
> > -=09unsigned long pfn;
> > -=09int err;
> > +=09struct page *page;
> > +=09pte_t pte, *ptep;
> > +=09pgprot_t pgprot;
> >  =20
> >   =09if (is_vmalloc_addr(addr))
> > -=09=09pfn =3D vmalloc_to_pfn(addr);
> > +=09=09page =3D vmalloc_to_page(addr);
> >   =09else
> > -=09=09pfn =3D __pa_symbol(addr) >> PAGE_SHIFT;
> > +=09=09page =3D virt_to_page(addr);
> >  =20
> > -=09err =3D map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_K=
ERNEL);
> > +=09if (radix_enabled())
> > +=09=09pgprot =3D __pgprot(pgprot_val(PAGE_KERNEL));
> > +=09else
> > +=09=09pgprot =3D PAGE_SHARED;
>=20
> Can you explain the difference between radix and non radix ?
>=20
> Why PAGE_KERNEL for a page that is mapped in userspace ?
>=20
> Why do you need to do __pgprot(pgprot_val(PAGE_KERNEL)) instead of just=
=20
> using PAGE_KERNEL ?
>=20

On hash there is a manual check which prevents setting _PAGE_PRIVILEGED for
kernel to userspace access in __hash_page - hence we cannot access the mapp=
ing
if the page is mapped PAGE_KERNEL on hash. However, I would like to use
PAGE_KERNEL here as well and am working on understanding why this check is
done in hash and if this can change. On radix this works just fine.

The page is mapped PAGE_KERNEL because the address is technically a userspa=
ce
address - but only to keep the mapping local to this CPU doing the patching=
.
PAGE_KERNEL makes it clear both in intent and protection that this is a ker=
nel
mapping.

I think the correct way is pgprot_val(PAGE_KERNEL) since PAGE_KERNEL is def=
ined
as:

#define PAGE_KERNEL=09__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)

and __pgprot() is defined as:

typedef struct { unsigned long pgprot; } pgprot_t;
#define pgprot_val(x)   ((x).pgprot)
#define __pgprot(x)     ((pgprot_t) { (x) })

> >  =20
> > -=09pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, =
err);
> > -=09if (err)
> > +=09ptep =3D get_locked_pte(patching_mm, patching_addr, &patch_mapping-=
>ptl);
> > +=09if (unlikely(!ptep)) {
> > +=09=09pr_warn("map patch: failed to allocate pte for patching\n");
> >   =09=09return -1;
> > +=09}
> > +
> > +=09pte =3D mk_pte(page, pgprot);
> > +=09set_pte_at(patching_mm, patching_addr, ptep, pte);
> > +
> > +=09init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> > +=09use_temporary_mm(&patch_mapping->temp_mm);
> >  =20
> >   =09return 0;
> >   }
> >  =20
> > -static inline int unmap_patch_area(unsigned long addr)
> > +static int unmap_patch(struct patch_mapping *patch_mapping)
> >   {
> >   =09pte_t *ptep;
> >   =09pmd_t *pmdp;
> >   =09pud_t *pudp;
> >   =09pgd_t *pgdp;
> >  =20
> > -=09pgdp =3D pgd_offset_k(addr);
> > +=09pgdp =3D pgd_offset(patching_mm, patching_addr);
> >   =09if (unlikely(!pgdp))
> >   =09=09return -EINVAL;
> >  =20
> > -=09pudp =3D pud_offset(pgdp, addr);
> > +=09pudp =3D pud_offset(pgdp, patching_addr);
> >   =09if (unlikely(!pudp))
> >   =09=09return -EINVAL;
> >  =20
> > -=09pmdp =3D pmd_offset(pudp, addr);
> > +=09pmdp =3D pmd_offset(pudp, patching_addr);
> >   =09if (unlikely(!pmdp))
> >   =09=09return -EINVAL;
> >  =20
> > -=09ptep =3D pte_offset_kernel(pmdp, addr);
> > +=09ptep =3D pte_offset_kernel(pmdp, patching_addr);
>=20
> ptep should be stored in the patch_mapping struct instead of walking=20
> again the page tables.
>=20

Oh yes - this will be in the next version.

> >   =09if (unlikely(!ptep))
> >   =09=09return -EINVAL;
> >  =20
> > -=09pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr=
);
> > +=09/*
> > +=09 * In hash, pte_clear flushes the tlb
> > +=09 */
> > +=09pte_clear(patching_mm, patching_addr, ptep);
> > +=09unuse_temporary_mm(&patch_mapping->temp_mm);
> >  =20
> >   =09/*
> > -=09 * In hash, pte_clear flushes the tlb, in radix, we have to
> > +=09 * In radix, we have to explicitly flush the tlb (no-op in hash)
> >   =09 */
> > -=09pte_clear(&init_mm, addr, ptep);
> > -=09flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +=09local_flush_tlb_mm(patching_mm);
> > +=09pte_unmap_unlock(ptep, patch_mapping->ptl);
> >  =20
> >   =09return 0;
> >   }
> > @@ -167,33 +148,38 @@ static int do_patch_instruction(unsigned int *add=
r, unsigned int instr)
> >   =09int err;
> >   =09unsigned int *patch_addr =3D NULL;
> >   =09unsigned long flags;
> > -=09unsigned long text_poke_addr;
> > -=09unsigned long kaddr =3D (unsigned long)addr;
> > +=09struct patch_mapping patch_mapping;
> >  =20
> >   =09/*
> > -=09 * During early early boot patch_instruction is called
> > -=09 * when text_poke_area is not ready, but we still need
> > -=09 * to allow patching. We just do the plain old patching
> > +=09 * The patching_mm is initialized before calling mark_rodata_ro. Pr=
ior
> > +=09 * to this, patch_instruction is called when we don't have (and don=
't
> > +=09 * need) the patching_mm so just do plain old patching.
> >   =09 */
> > -=09if (!this_cpu_read(text_poke_area))
> > +=09if (!patching_mm)
> >   =09=09return raw_patch_instruction(addr, instr);
> >  =20
> >   =09local_irq_save(flags);
> >  =20
> > -=09text_poke_addr =3D (unsigned long)__this_cpu_read(text_poke_area)->=
addr;
> > -=09if (map_patch_area(addr, text_poke_addr)) {
> > -=09=09err =3D -1;
> > +=09err =3D map_patch(addr, &patch_mapping);
> > +=09if (err)
> >   =09=09goto out;
> > -=09}
> >  =20
> > -=09patch_addr =3D (unsigned int *)(text_poke_addr) +
> > -=09=09=09((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
> > +=09patch_addr =3D (unsigned int *)(patching_addr) +
> > +=09=09=09(offset_in_page((unsigned long)addr) /
> > +=09=09=09=09sizeof(unsigned int));
> >  =20
> >   =09__patch_instruction(addr, instr, patch_addr);
>=20
> The error returned by __patch_instruction() should be managed.
>=20

Agreed, will do something in the next spin.

> >  =20
> > -=09err =3D unmap_patch_area(text_poke_addr);
> > +=09err =3D unmap_patch(&patch_mapping);
> >   =09if (err)
> > -=09=09pr_warn("failed to unmap %lx\n", text_poke_addr);
> > +=09=09pr_warn("unmap patch: failed to unmap patch\n");
> > +
> > +=09/*
> > +=09 * Something is wrong if what we just wrote doesn't match what we
> > +=09 * think we just wrote.
> > +=09 * XXX: BUG_ON() instead?
>=20
> No, not a BUG_ON(). If patching fails, that's no a vital fault, we can=20
> fail gracefully. You should return a fault instead.
>=20

Yup - will make these changes in the next version.

> > +=09 */
> > +=09WARN_ON(memcmp(addr, &instr, sizeof(instr)));
>=20
> Come on. addr is an *int, instr is an int. By doing a memcmp() on=20
> &instr, you for the compiler to write instr into the stack whereas local=
=20
> vars are mainly in registers on RISC processors like powerpc. Following=
=20
> should do it:
>=20
> =09WARN_ON(*addr !=3D instr);
>=20

Oh man - I agree, that's just embarrassing.
Appreciate your feedback on this RFC series, thanks!

> >  =20
> >   out:
> >   =09local_irq_restore(flags);
> >=20
>=20
> Christophe
