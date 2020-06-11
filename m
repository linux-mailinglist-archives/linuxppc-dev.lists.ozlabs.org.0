Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 586561F606D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 05:28:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49j8TZ5rRfzDqjY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 13:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=68.65.122.27;
 helo=mta-07-4.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
X-Greylist: delayed 168045 seconds by postgrey-1.36 at bilbo;
 Thu, 11 Jun 2020 13:27:30 AEST
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49j8S22jMPzDqjW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 13:27:29 +1000 (AEST)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 05D8260045;
 Wed, 10 Jun 2020 23:27:24 -0400 (EDT)
Received: from localhost (unknown [10.20.151.233])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id B10E960043;
 Thu, 11 Jun 2020 03:27:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Originaldate: Wed Jun 3, 2020 at 9:01 AM
Originalfrom: "Christophe Leroy" <christophe.leroy@csgroup.eu>
Original: =?utf-8?q?=0D=0A=0D=0ALe_03/06/2020_
 =C3=A0_07:19,_Christopher_M._Riedl_a_?= =?utf-8?q?=C3=A9crit=C2=A0:
 =0D=0A>_When_code_patching_a_STRICT=5FKERNEL?= =?utf-8?q?
 =5FRWX_kernel_the_page_containing_the=0D=0A>_address_to_be_patc?=
 =?utf-8?q?hed_is_temporarily_mapped_with_permissive_memory=0D=0A>_protect?=
 =?utf-8?q?ions._Currently,_a_per-cpu_vmalloc_patch_area_is_used_for_this?=
 =?utf-8?q?=0D=0A>_purpose._While_the_patch_area_is_per-cpu,_the_temporary?=
 =?utf-8?q?_page_mapping_is=0D=0A>_inserted_into_the_kernel_page_tables_fo?=
 =?utf-8?q?r_the_duration_of_the_patching.=0D=0A>_The_mapping_is_exposed_t?=
 =?utf-8?q?o_CPUs_other_than_the_patching_CPU_-_this_is=0D=0A>_undesirable?=
 =?utf-8?q?_from_a_hardening_perspective.=0D=0A>_=0D=0A>_Use_the_`poking?=
 =?utf-8?q?=5Finit`_init_hook_to_prepare_a_temporary_mm_and_patching=0D=0A?=
 =?utf-8?q?>_address._Initialize_the_temporary_mm_by_copying_the_init_mm._?=
 =?utf-8?q?Choose_a=0D=0A>_randomized_patching_address_inside_the_temporar?=
 =?utf-8?q?y_mm_userspace_address=0D=0A>_portion._The_next_patch_uses_the_?=
 =?utf-8?q?temporary_mm_and_patching_address_for=0D=0A>_code_patching.=0D?=
 =?utf-8?q?=0A>_=0D=0A>_Based_on_x86_implementation:=0D=0A>_=0D=0A>_commit?=
 =?utf-8?q?_4fc19708b165=0D=0A>_("x86/alternatives:_Initialize_temporary_m?=
 =?utf-8?q?m_for_patching")=0D=0A>_=0D=0A>_Signed-off-by:_Christopher_M._R?=
 =?utf-8?q?iedl_<cmr@informatik.wtf>=0D=0A>_---=0D=0A>___arch/powerpc/lib/?=
 =?utf-8?q?code-patching.c_|_33_++++++++++++++++++++++++++++++++=0D=0A>___?=
 =?utf-8?q?1_file_changed,_33_insertions(+)=0D=0A>_=0D=0A>_diff_--git_a/ar?=
 =?utf-8?q?ch/powerpc/lib/code-patching.c_b/arch/powerpc/lib/code-patching?=
 =?utf-8?q?.c=0D=0A>_index_5ecf0d635a8d..599114f63b44_100644=0D=0A>_---_a/?=
 =?utf-8?q?arch/powerpc/lib/code-patching.c=0D=0A>_+++_b/arch/powerpc/lib/?=
 =?utf-8?q?code-patching.c=0D=0A>_@@_-11,6_+11,8_@@=0D=0A>___#include_<lin?=
 =?utf-8?q?ux/cpuhotplug.h>=0D=0A>___#include_<linux/slab.h>=0D=0A>___#inc?=
 =?utf-8?q?lude_<linux/uaccess.h>=0D=0A>_+#include_<linux/sched/task.h>=0D?=
 =?utf-8?q?=0A>_+#include_<linux/random.h>=0D=0A>___=0D=0A>___#include_<as?=
 =?utf-8?q?m/pgtable.h>=0D=0A>___#include_<asm/tlbflush.h>=0D=0A>_@@_-45,6?=
 =?utf-8?q?_+47,37_@@_int_raw=5Fpatch=5Finstruction(struct_ppc=5Finst_*add?=
 =?utf-8?q?r,_struct_ppc=5Finst_instr)=0D=0A>___}=0D=0A>___=0D=0A>___#ifde?=
 =?utf-8?q?f_CONFIG=5FSTRICT=5FKERNEL=5FRWX=0D=0A>_+=0D=0A>_+static_struct?=
 =?utf-8?q?_mm=5Fstruct_*patching=5Fmm_=5F=5Fro=5Fafter=5Finit;=0D=0A>_+st?=
 =?utf-8?q?atic_unsigned_long_patching=5Faddr_=5F=5Fro=5Fafter=5Finit;=0D?=
 =?utf-8?q?=0A>_+=0D=0A>_+void_=5F=5Finit_poking=5Finit(void)=0D=0A>_+{=0D?=
 =?utf-8?q?=0A>_+=09spinlock=5Ft_*ptl;_/*_for_protecting_pte_table_*/=0D?=
 =?utf-8?q?=0A>_+=09pte=5Ft_*ptep;=0D=0A>_+=0D=0A>_+=09/*=0D=0A>_+=09_*_So?=
 =?utf-8?q?me_parts_of_the_kernel_(static_keys_for_example)_depend_on=0D?=
 =?utf-8?q?=0A>_+=09_*_successful_code_patching._Code_patching_under_STRIC?=
 =?utf-8?q?T=5FKERNEL=5FRWX=0D=0A>_+=09_*_requires_this_setup_-_otherwise_?=
 =?utf-8?q?we_cannot_patch_at_all._We_use=0D=0A>_+=09_*_BUG=5FON()_here_an?=
 =?utf-8?q?d_later_since_an_early_failure_is_preferred_to=0D=0A>_+=09_*_bu?=
 =?utf-8?q?ggy_behavior_and/or_strange_crashes_later.=0D=0A>_+=09_*/=0D=0A?=
 =?utf-8?q?>_+=09patching=5Fmm_=3D_copy=5Finit=5Fmm();=0D=0A>_+=09BUG=5FON?=
 =?utf-8?q?(!patching=5Fmm);=0D=0A>_+=0D=0A>_+=09/*=0D=0A>_+=09_*_In_hash_?=
 =?utf-8?q?we_cannot_go_above_DEFAULT=5FMAP=5FWINDOW_easily.=0D=0A>_+=09_*?=
 =?utf-8?q?_XXX:_Do_we_want_additional_bits_of_entropy_for_radix=3F=0D=0A>?=
 =?utf-8?q?_+=09_*/=0D=0A>_+=09patching=5Faddr_=3D_(get=5Frandom=5Flong()_?=
 =?utf-8?q?&_PAGE=5FMASK)_%=0D=0A>_+=09=09(DEFAULT=5FMAP=5FWINDOW_-_PAGE?=
 =?utf-8?q?=5FSIZE);=0D=0A>_+=0D=0A>_+=09ptep_=3D_get=5Flocked=5Fpte(patch?=
 =?utf-8?q?ing=5Fmm,_patching=5Faddr,_&ptl);=0D=0A>_+=09BUG=5FON(!ptep);?=
 =?utf-8?q?=0D=0A>_+=09pte=5Funmap=5Funlock(ptep,_ptl);=0D=0A=0D=0AIs_this?=
 =?utf-8?q?_needed_=3F_What's_the_point_in_getting_the_pte_to_unmap_it_=0D?=
 =?utf-8?q?=0Aimmediatly_without_doing_anything_with_it_=3F=0D=0A=0D=0AChr?=
 =?utf-8?q?istophe=0D=0A=0D=0A>_+}=0D=0A>_+=0D=0A>___static_DEFINE=5FPER?=
 =?utf-8?q?=5FCPU(struct_vm=5Fstruct_*,_text=5Fpoke=5Farea);=0D=0A>___=0D?=
 =?utf-8?q?=0A>___static_int_text=5Farea=5Fcpu=5Fup(unsigned_int_cpu)=0D?=
 =?utf-8?q?=0A>_=0D=0A?=
In-Reply-To: <4ffced42-ee3a-841f-2d3f-34daec11b05b@csgroup.eu>
Date: Wed, 10 Jun 2020 22:29:19 -0500
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>, <kernel-hardening@lists.openwall.com>
Subject: Re: [PATCH 2/5] powerpc/lib: Initialize a temporary mm for code
 patching
From: "Christopher M. Riedl" <cmr@informatik.wtf>
Message-Id: <C3DYDA68EJMU.FBBK8182F4QF@geist>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jun 3, 2020 at 9:01 AM, Christophe Leroy wrote:
>
>=20
>
>=20
> Le 03/06/2020 =C3=A0 07:19, Christopher M. Riedl a =C3=A9crit :
> > When code patching a STRICT_KERNEL_RWX kernel the page containing the
> > address to be patched is temporarily mapped with permissive memory
> > protections. Currently, a per-cpu vmalloc patch area is used for this
> > purpose. While the patch area is per-cpu, the temporary page mapping is
> > inserted into the kernel page tables for the duration of the patching.
> > The mapping is exposed to CPUs other than the patching CPU - this is
> > undesirable from a hardening perspective.
> >=20
> > Use the `poking_init` init hook to prepare a temporary mm and patching
> > address. Initialize the temporary mm by copying the init mm. Choose a
> > randomized patching address inside the temporary mm userspace address
> > portion. The next patch uses the temporary mm and patching address for
> > code patching.
> >=20
> > Based on x86 implementation:
> >=20
> > commit 4fc19708b165
> > ("x86/alternatives: Initialize temporary mm for patching")
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> >   arch/powerpc/lib/code-patching.c | 33 +++++++++++++++++++++++++++++++=
+
> >   1 file changed, 33 insertions(+)
> >=20
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 5ecf0d635a8d..599114f63b44 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -11,6 +11,8 @@
> >   #include <linux/cpuhotplug.h>
> >   #include <linux/slab.h>
> >   #include <linux/uaccess.h>
> > +#include <linux/sched/task.h>
> > +#include <linux/random.h>
> >  =20
> >   #include <asm/pgtable.h>
> >   #include <asm/tlbflush.h>
> > @@ -45,6 +47,37 @@ int raw_patch_instruction(struct ppc_inst *addr, str=
uct ppc_inst instr)
> >   }
> >  =20
> >   #ifdef CONFIG_STRICT_KERNEL_RWX
> > +
> > +static struct mm_struct *patching_mm __ro_after_init;
> > +static unsigned long patching_addr __ro_after_init;
> > +
> > +void __init poking_init(void)
> > +{
> > +	spinlock_t *ptl; /* for protecting pte table */
> > +	pte_t *ptep;
> > +
> > +	/*
> > +	 * Some parts of the kernel (static keys for example) depend on
> > +	 * successful code patching. Code patching under STRICT_KERNEL_RWX
> > +	 * requires this setup - otherwise we cannot patch at all. We use
> > +	 * BUG_ON() here and later since an early failure is preferred to
> > +	 * buggy behavior and/or strange crashes later.
> > +	 */
> > +	patching_mm =3D copy_init_mm();
> > +	BUG_ON(!patching_mm);
> > +
> > +	/*
> > +	 * In hash we cannot go above DEFAULT_MAP_WINDOW easily.
> > +	 * XXX: Do we want additional bits of entropy for radix?
> > +	 */
> > +	patching_addr =3D (get_random_long() & PAGE_MASK) %
> > +		(DEFAULT_MAP_WINDOW - PAGE_SIZE);
> > +
> > +	ptep =3D get_locked_pte(patching_mm, patching_addr, &ptl);
> > +	BUG_ON(!ptep);
> > +	pte_unmap_unlock(ptep, ptl);
>
>=20
> Is this needed ? What's the point in getting the pte to unmap it
> immediatly without doing anything with it ?
>

We pre-allocate the PTE here since later the allocation may fail
(GFP_KERNEL) badly when interrupts are disabled during patching.

>=20
> Christophe
>
>=20
> > +}
> > +
> >   static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> >  =20
> >   static int text_area_cpu_up(unsigned int cpu)
> >=20
>
>=20
>
>=20

