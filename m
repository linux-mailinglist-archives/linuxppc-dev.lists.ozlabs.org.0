Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE981AAE5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 18:34:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492ScZ1C03zDqyk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 02:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492SP24tYszDqsZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 02:24:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 492SP12ZfSz8sXg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 02:24:37 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 492SP109QPz9sTS; Thu, 16 Apr 2020 02:24:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.42;
 helo=h1.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h1.fbrelay.privateemail.com (h1.fbrelay.privateemail.com
 [131.153.2.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 492SP02C8Zz9sT4
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 02:24:35 +1000 (AEST)
Received: from MTA-13-3.privateemail.com (mta-13.privateemail.com
 [198.54.118.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 2E1D880961
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Apr 2020 12:24:33 -0400 (EDT)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 07DAA8005B;
 Wed, 15 Apr 2020 12:24:29 -0400 (EDT)
Received: from APP-02 (unknown [10.20.147.152])
 by mta-13.privateemail.com (Postfix) with ESMTPA id DF4B080055;
 Wed, 15 Apr 2020 16:24:28 +0000 (UTC)
Date: Wed, 15 Apr 2020 11:24:28 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@ozlabs.org
Message-ID: <447823307.198296.1586967868877@privateemail.com>
In-Reply-To: <ee1c177c-a751-29c3-2a36-0d35aa891741@c-s.fr>
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-4-cmr@informatik.wtf>
 <db40ec6a-1d81-91e3-00d8-cd86fd5262d5@c-s.fr>
 <32766971.188162.1586927476788@privateemail.com>
 <ee1c177c-a751-29c3-2a36-0d35aa891741@c-s.fr>
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

> On April 15, 2020 3:45 AM Christophe Leroy <christophe.leroy@c-s.fr> wrot=
e:
>=20
> =20
> Le 15/04/2020 =C3=A0 07:11, Christopher M Riedl a =C3=A9crit=C2=A0:
> >> On March 24, 2020 11:25 AM Christophe Leroy <christophe.leroy@c-s.fr> =
wrote:
> >>
> >>  =20
> >> Le 23/03/2020 =C3=A0 05:52, Christopher M. Riedl a =C3=A9crit=C2=A0:
> >>> Currently, code patching a STRICT_KERNEL_RWX exposes the temporary
> >>> mappings to other CPUs. These mappings should be kept local to the CP=
U
> >>> doing the patching. Use the pre-initialized temporary mm and patching
> >>> address for this purpose. Also add a check after patching to ensure t=
he
> >>> patch succeeded.
> >>>
> >>> Based on x86 implementation:
> >>>
> >>> commit b3fd8e83ada0
> >>> ("x86/alternatives: Use temporary mm for text poking")
> >>>
> >>> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> >>> ---
> >>>    arch/powerpc/lib/code-patching.c | 128 ++++++++++++++-------------=
----
> >>>    1 file changed, 57 insertions(+), 71 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code=
-patching.c
> >>> index 18b88ecfc5a8..f156132e8975 100644
> >>> --- a/arch/powerpc/lib/code-patching.c
> >>> +++ b/arch/powerpc/lib/code-patching.c
> >>> @@ -19,6 +19,7 @@
> >>>    #include <asm/page.h>
> >>>    #include <asm/code-patching.h>
> >>>    #include <asm/setup.h>
> >>> +#include <asm/mmu_context.h>
> >>>   =20
> >>>    static int __patch_instruction(unsigned int *exec_addr, unsigned i=
nt instr,
> >>>    =09=09=09       unsigned int *patch_addr)
> >>> @@ -65,99 +66,79 @@ void __init poking_init(void)
> >>>    =09pte_unmap_unlock(ptep, ptl);
> >>>    }
> >>>   =20
> >>> -static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> >>> -
> >>> -static int text_area_cpu_up(unsigned int cpu)
> >>> -{
> >>> -=09struct vm_struct *area;
> >>> -
> >>> -=09area =3D get_vm_area(PAGE_SIZE, VM_ALLOC);
> >>> -=09if (!area) {
> >>> -=09=09WARN_ONCE(1, "Failed to create text area for cpu %d\n",
> >>> -=09=09=09cpu);
> >>> -=09=09return -1;
> >>> -=09}
> >>> -=09this_cpu_write(text_poke_area, area);
> >>> -
> >>> -=09return 0;
> >>> -}
> >>> -
> >>> -static int text_area_cpu_down(unsigned int cpu)
> >>> -{
> >>> -=09free_vm_area(this_cpu_read(text_poke_area));
> >>> -=09return 0;
> >>> -}
> >>> -
> >>> -/*
> >>> - * Run as a late init call. This allows all the boot time patching t=
o be done
> >>> - * simply by patching the code, and then we're called here prior to
> >>> - * mark_rodata_ro(), which happens after all init calls are run. Alt=
hough
> >>> - * BUG_ON() is rude, in this case it should only happen if ENOMEM, a=
nd we judge
> >>> - * it as being preferable to a kernel that will crash later when som=
eone tries
> >>> - * to use patch_instruction().
> >>> - */
> >>> -static int __init setup_text_poke_area(void)
> >>> -{
> >>> -=09BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> >>> -=09=09"powerpc/text_poke:online", text_area_cpu_up,
> >>> -=09=09text_area_cpu_down));
> >>> -
> >>> -=09return 0;
> >>> -}
> >>> -late_initcall(setup_text_poke_area);
> >>> +struct patch_mapping {
> >>> +=09spinlock_t *ptl; /* for protecting pte table */
> >>> +=09struct temp_mm temp_mm;
> >>> +};
> >>>   =20
> >>>    /*
> >>>     * This can be called for kernel text or a module.
> >>>     */
> >>> -static int map_patch_area(void *addr, unsigned long text_poke_addr)
> >>> +static int map_patch(const void *addr, struct patch_mapping *patch_m=
apping)
> >>
> >> Why change the name ?
> >>
> >=20
> > It's not really an "area" anymore.
> >=20
> >>>    {
> >>> -=09unsigned long pfn;
> >>> -=09int err;
> >>> +=09struct page *page;
> >>> +=09pte_t pte, *ptep;
> >>> +=09pgprot_t pgprot;
> >>>   =20
> >>>    =09if (is_vmalloc_addr(addr))
> >>> -=09=09pfn =3D vmalloc_to_pfn(addr);
> >>> +=09=09page =3D vmalloc_to_page(addr);
> >>>    =09else
> >>> -=09=09pfn =3D __pa_symbol(addr) >> PAGE_SHIFT;
> >>> +=09=09page =3D virt_to_page(addr);
> >>>   =20
> >>> -=09err =3D map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE=
_KERNEL);
> >>> +=09if (radix_enabled())
> >>> +=09=09pgprot =3D __pgprot(pgprot_val(PAGE_KERNEL));
> >>> +=09else
> >>> +=09=09pgprot =3D PAGE_SHARED;
> >>
> >> Can you explain the difference between radix and non radix ?
> >>
> >> Why PAGE_KERNEL for a page that is mapped in userspace ?
> >>
> >> Why do you need to do __pgprot(pgprot_val(PAGE_KERNEL)) instead of jus=
t
> >> using PAGE_KERNEL ?
> >>
> >=20
> > On hash there is a manual check which prevents setting _PAGE_PRIVILEGED=
 for
> > kernel to userspace access in __hash_page - hence we cannot access the =
mapping
> > if the page is mapped PAGE_KERNEL on hash. However, I would like to use
> > PAGE_KERNEL here as well and am working on understanding why this check=
 is
> > done in hash and if this can change. On radix this works just fine.
> >=20
> > The page is mapped PAGE_KERNEL because the address is technically a use=
rspace
> > address - but only to keep the mapping local to this CPU doing the patc=
hing.
> > PAGE_KERNEL makes it clear both in intent and protection that this is a=
 kernel
> > mapping.
> >=20
> > I think the correct way is pgprot_val(PAGE_KERNEL) since PAGE_KERNEL is=
 defined
> > as:
> >=20
> > #define PAGE_KERNEL=09__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)
> >=20
> > and __pgprot() is defined as:
> >=20
> > typedef struct { unsigned long pgprot; } pgprot_t;
> > #define pgprot_val(x)   ((x).pgprot)
> > #define __pgprot(x)     ((pgprot_t) { (x) })
>=20
>=20
> Yes, so:
> =09pgprot_val(__pgprot(x)) =3D=3D x
>=20
>=20
> You do:
>=20
> =09pgprot =3D __pgprot(pgprot_val(PAGE_KERNEL));
>=20
> Which is:
>=20
> =09pgprot =3D __pgprot(pgprot_val(__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW))=
);
>=20
> Which is equivalent to:
>=20
> =09pgprot =3D __pgprot(_PAGE_BASE | _PAGE_KERNEL_RW);
>=20
> So at the end it should simply be:
>=20
> =09pgprot =3D PAGE_KERNEL;
>=20

Yes you're correct. Picking this up in the next spin.

>=20
>=20
>=20
> Christophe
