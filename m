Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6611F6094
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 05:34:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49j8cD49SXzDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 13:34:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=68.65.122.19;
 helo=mta-09-3.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49j8Zh4ftgzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 13:33:16 +1000 (AEST)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 4587760060;
 Wed, 10 Jun 2020 23:32:55 -0400 (EDT)
Received: from localhost (unknown [10.20.151.235])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 49A866008D;
 Thu, 11 Jun 2020 03:32:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Originaldate: Wed Jun 3, 2020 at 8:58 AM
Originalfrom: "Christophe Leroy" <christophe.leroy@csgroup.eu>
Original: =?utf-8?q?=0D=0A=0D=0ALe_03/06/2020_
 =C3=A0_07:19,_Christopher_M._Riedl_a_?= =?utf-8?q?=C3=A9crit=C2=A0:
 =0D=0A>_x86_supports_the_notion_of_a_temporary?=
 =?utf-8?q?_mm_which_restricts_access_to=0D=0A>_temporary_PTEs_to_a_single?=
 =?utf-8?q?_CPU._A_temporary_mm_is_useful_for_situations=0D=0A>_where_a_CP?=
 =?utf-8?q?U_needs_to_perform_sensitive_operations_(such_as_patching_a=0D?=
 =?utf-8?q?=0A>_STRICT=5FKERNEL=5FRWX_kernel)_requiring_temporary_mappings?=
 =?utf-8?q?_without_exposing=0D=0A>_said_mappings_to_other_CPUs._A_side_be?=
 =?utf-8?q?nefit_is_that_other_CPU_TLBs_do=0D=0A>_not_need_to_be_flushed_w?=
 =?utf-8?q?hen_the_temporary_mm_is_torn_down.=0D=0A>_=0D=0A>_Mappings_in_t?=
 =?utf-8?q?he_temporary_mm_can_be_set_in_the_userspace_portion_of_the=0D?=
 =?utf-8?q?=0A>_address-space.=0D=0A>_=0D=0A>_Interrupts_must_be_disabled_?=
 =?utf-8?q?while_the_temporary_mm_is_in_use._HW=0D=0A>_breakpoints,_which_?=
 =?utf-8?q?may_have_been_set_by_userspace_as_watchpoints_on=0D=0A>_address?=
 =?utf-8?q?es_now_within_the_temporary_mm,_are_saved_and_disabled_when=0D?=
 =?utf-8?q?=0A>_loading_the_temporary_mm._The_HW_breakpoints_are_restored_?=
 =?utf-8?q?when_unloading=0D=0A>_the_temporary_mm._All_HW_breakpoints_are_?=
 =?utf-8?q?indiscriminately_disabled_while=0D=0A>_the_temporary_mm_is_in_u?=
 =?utf-8?q?se.=0D=0A>_=0D=0A>_Based_on_x86_implementation:=0D=0A>_=0D=0A>_?=
 =?utf-8?q?commit_cefa929c034e=0D=0A>_("x86/mm:_Introduce_temporary_mm_str?=
 =?utf-8?q?ucts")=0D=0A>_=0D=0A>_Signed-off-by:_Christopher_M._Riedl_<cmr@?=
 =?utf-8?q?informatik.wtf>=0D=0A>_---=0D=0A>___arch/powerpc/include/asm/de?=
 =?utf-8?q?bug.h_______|__1_+=0D=0A>___arch/powerpc/include/asm/mmu=5Fcont?=
 =?utf-8?q?ext.h_|_64_++++++++++++++++++++++++++=0D=0A>___arch/powerpc/ker?=
 =?utf-8?q?nel/process.c__________|__5_++=0D=0A>___3_files_changed,_70_ins?=
 =?utf-8?q?ertions(+)=0D=0A>_=0D=0A>_diff_--git_a/arch/powerpc/include/asm?=
 =?utf-8?q?/debug.h_b/arch/powerpc/include/asm/debug.h=0D=0A>_index_ec57da?=
 =?utf-8?q?f87f40..827350c9bcf3_100644=0D=0A>_---_a/arch/powerpc/include/a?=
 =?utf-8?q?sm/debug.h=0D=0A>_+++_b/arch/powerpc/include/asm/debug.h=0D=0A>?=
 =?utf-8?q?_@@_-46,6_+46,7_@@_static_inline_int_debugger=5Ffault=5Fhandler?=
 =?utf-8?q?(struct_pt=5Fregs_*regs)_{_return_0;_}=0D=0A>___#endif=0D=0A>__?=
 =?utf-8?q?_=0D=0A>___void_=5F=5Fset=5Fbreakpoint(int_nr,_struct_arch=5Fhw?=
 =?utf-8?q?=5Fbreakpoint_*brk);=0D=0A>_+void_=5F=5Fget=5Fbreakpoint(int_nr?=
 =?utf-8?q?,_struct_arch=5Fhw=5Fbreakpoint_*brk);=0D=0A>___bool_ppc=5Fbrea?=
 =?utf-8?q?kpoint=5Favailable(void);=0D=0A>___#ifdef_CONFIG=5FPPC=5FADV=5F?=
 =?utf-8?q?DEBUG=5FREGS=0D=0A>___extern_void_do=5Fsend=5Ftrap(struct_pt=5F?=
 =?utf-8?q?regs_*regs,_unsigned_long_address,=0D=0A>_diff_--git_a/arch/pow?=
 =?utf-8?q?erpc/include/asm/mmu=5Fcontext.h_b/arch/powerpc/include/asm/mmu?=
 =?utf-8?q?=5Fcontext.h=0D=0A>_index_1a474f6b1992..9269c7c7b04e_100644=0D?=
 =?utf-8?q?=0A>_---_a/arch/powerpc/include/asm/mmu=5Fcontext.h=0D=0A>_+++_?=
 =?utf-8?q?b/arch/powerpc/include/asm/mmu=5Fcontext.h=0D=0A>_@@_-10,6_+10,?=
 =?utf-8?q?7_@@=0D=0A>___#include_<asm/mmu.h>=09=0D=0A>___#include_<asm/cp?=
 =?utf-8?q?utable.h>=0D=0A>___#include_<asm/cputhreads.h>=0D=0A>_+#include?=
 =?utf-8?q?_<asm/debug.h>=0D=0A>___=0D=0A>___/*=0D=0A>____*_Most_if_the_co?=
 =?utf-8?q?ntext_management_is_out_of_line=0D=0A>_@@_-300,5_+301,68_@@_sta?=
 =?utf-8?q?tic_inline_int_arch=5Fdup=5Fmmap(struct_mm=5Fstruct_*oldmm,=0D?=
 =?utf-8?q?=0A>___=09return_0;=0D=0A>___}=0D=0A>___=0D=0A>_+struct_temp=5F?=
 =?utf-8?q?mm_{=0D=0A>_+=09struct_mm=5Fstruct_*temp;=0D=0A>_+=09struct_mm?=
 =?utf-8?q?=5Fstruct_*prev;=0D=0A>_+=09bool_is=5Fkernel=5Fthread;=0D=0A>_+?=
 =?utf-8?q?=09struct_arch=5Fhw=5Fbreakpoint_brk[HBP=5FNUM=5FMAX];=0D=0A>_+?=
 =?utf-8?q?};=0D=0A>_+=0D=0A>_+static_inline_void_init=5Ftemp=5Fmm(struct_?=
 =?utf-8?q?temp=5Fmm_*temp=5Fmm,_struct_mm=5Fstruct_*mm)=0D=0A>_+{=0D=0A>_?=
 =?utf-8?q?+=09temp=5Fmm->temp_=3D_mm;=0D=0A>_+=09temp=5Fmm->prev_=3D_NULL?=
 =?utf-8?q?;=0D=0A>_+=09temp=5Fmm->is=5Fkernel=5Fthread_=3D_false;=0D=0A>_?=
 =?utf-8?q?+=09memset(&temp=5Fmm->brk,_0,_sizeof(temp=5Fmm->brk));=0D=0A>_?=
 =?utf-8?q?+}=0D=0A>_+=0D=0A>_+static_inline_void_use=5Ftemporary=5Fmm(str?=
 =?utf-8?q?uct_temp=5Fmm_*temp=5Fmm)=0D=0A>_+{=0D=0A>_+=09lockdep=5Fassert?=
 =?utf-8?q?=5Firqs=5Fdisabled();=0D=0A>_+=0D=0A>_+=09temp=5Fmm->is=5Fkerne?=
 =?utf-8?q?l=5Fthread_=3D_current->mm_=3D=3D_NULL;=0D=0A>_+=09if_(temp=5Fm?=
 =?utf-8?q?m->is=5Fkernel=5Fthread)=0D=0A>_+=09=09temp=5Fmm->prev_=3D_curr?=
 =?utf-8?q?ent->active=5Fmm;=0D=0A>_+=09else=0D=0A>_+=09=09temp=5Fmm->prev?=
 =?utf-8?q?_=3D_current->mm;=0D=0A=0D=0AIs_that_necessary_to_make_differen?=
 =?utf-8?q?t_for_kernel_threads_=3F_When_I_look_at_=0D=0Ax86_implementatio?=
 =?utf-8?q?n,_they_don't_do_such_a_thing.=0D=0A=0D=0A>_+=0D=0A>_+=09/*=0D?=
 =?utf-8?q?=0A>_+=09_*_Hash_requires_a_non-NULL_current->mm_to_allocate_a_?=
 =?utf-8?q?userspace_address=0D=0A>_+=09_*_when_handling_a_page_fault._Doe?=
 =?utf-8?q?s_not_appear_to_hurt_in_Radix_either.=0D=0A>_+=09_*/=0D=0A>_+?=
 =?utf-8?q?=09current->mm_=3D_temp=5Fmm->temp;=0D=0A>_+=09switch=5Fmm=5Fir?=
 =?utf-8?q?qs=5Foff(NULL,_temp=5Fmm->temp,_current);=0D=0A>_+=0D=0A>_+=09i?=
 =?utf-8?q?f_(ppc=5Fbreakpoint=5Favailable())_{=0D=0A>_+=09=09struct_arch?=
 =?utf-8?q?=5Fhw=5Fbreakpoint_null=5Fbrk_=3D_{0};=0D=0A>_+=09=09int_i_=3D_?=
 =?utf-8?q?0;=0D=0A>_+=0D=0A>_+=09=09for_(;_i_<_nr=5Fwp=5Fslots();_++i)_{?=
 =?utf-8?q?=0D=0A>_+=09=09=09=5F=5Fget=5Fbreakpoint(i,_&temp=5Fmm->brk[i])?=
 =?utf-8?q?;=0D=0A>_+=09=09=09if_(temp=5Fmm->brk[i].type_!=3D_0)=0D=0A>_+?=
 =?utf-8?q?=09=09=09=09=5F=5Fset=5Fbreakpoint(i,_&null=5Fbrk);=0D=0A>_+=09?=
 =?utf-8?q?=09}=0D=0A>_+=09}=0D=0A>_+}=0D=0A>_+=0D=0A>_+static_inline_void?=
 =?utf-8?q?_unuse=5Ftemporary=5Fmm(struct_temp=5Fmm_*temp=5Fmm)=0D=0A>_+{?=
 =?utf-8?q?=0D=0A>_+=09lockdep=5Fassert=5Firqs=5Fdisabled();=0D=0A>_+=0D?=
 =?utf-8?q?=0A>_+=09if_(temp=5Fmm->is=5Fkernel=5Fthread)=0D=0A>_+=09=09cur?=
 =?utf-8?q?rent->mm_=3D_NULL;=0D=0A>_+=09else=0D=0A>_+=09=09current->mm_?=
 =?utf-8?q?=3D_temp=5Fmm->prev;=0D=0A>_+=09switch=5Fmm=5Firqs=5Foff(NULL,_?=
 =?utf-8?q?temp=5Fmm->prev,_current);=0D=0A>_+=0D=0A>_+=09if_(ppc=5Fbreakp?=
 =?utf-8?q?oint=5Favailable())_{=0D=0A>_+=09=09int_i_=3D_0;=0D=0A>_+=0D=0A?=
 =?utf-8?q?>_+=09=09for_(;_i_<_nr=5Fwp=5Fslots();_++i)=0D=0A>_+=09=09=09if?=
 =?utf-8?q?_(temp=5Fmm->brk[i].type_!=3D_0)=0D=0A>_+=09=09=09=09=5F=5Fset?=
 =?utf-8?q?=5Fbreakpoint(i,_&temp=5Fmm->brk[i]);=0D=0A>_+=09}=0D=0A>_+}=0D?=
 =?utf-8?q?=0A>_+=0D=0A>___#endif_/*_=5F=5FKERNEL=5F=5F_*/=0D=0A>___#endif?=
 =?utf-8?q?_/*_=5F=5FASM=5FPOWERPC=5FMMU=5FCONTEXT=5FH_*/=0D=0A>_diff_--gi?=
 =?utf-8?q?t_a/arch/powerpc/kernel/process.c_b/arch/powerpc/kernel/process?=
 =?utf-8?q?.c=0D=0A>_index_048d64c4e115..3973144f6980_100644=0D=0A>_---_a/?=
 =?utf-8?q?arch/powerpc/kernel/process.c=0D=0A>_+++_b/arch/powerpc/kernel/?=
 =?utf-8?q?process.c=0D=0A>_@@_-825,6_+825,11_@@_static_inline_int_set=5Fb?=
 =?utf-8?q?reakpoint=5F8xx(struct_arch=5Fhw=5Fbreakpoint_*brk)=0D=0A>___?=
 =?utf-8?q?=09return_0;=0D=0A>___}=0D=0A>___=0D=0A>_+void_=5F=5Fget=5Fbrea?=
 =?utf-8?q?kpoint(int_nr,_struct_arch=5Fhw=5Fbreakpoint_*brk)=0D=0A>_+{=0D?=
 =?utf-8?q?=0A>_+=09memcpy(brk,_this=5Fcpu=5Fptr(&current=5Fbrk[nr]),_size?=
 =?utf-8?q?of(*brk));=0D=0A>_+}=0D=0A>_+=0D=0A>___void_=5F=5Fset=5Fbreakpo?=
 =?utf-8?q?int(int_nr,_struct_arch=5Fhw=5Fbreakpoint_*brk)=0D=0A>___{=0D?=
 =?utf-8?q?=0A>___=09memcpy(this=5Fcpu=5Fptr(&current=5Fbrk[nr]),_brk,_siz?=
 =?utf-8?q?eof(*brk));=0D=0A>_=0D=0A=0D=0AChristophe=0D=0A?=
In-Reply-To: <ff05b833-720e-e1e2-f43b-8285d520a563@csgroup.eu>
Date: Wed, 10 Jun 2020 22:34:42 -0500
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>, <kernel-hardening@lists.openwall.com>
Subject: Re: [PATCH 1/5] powerpc/mm: Introduce temporary mm
Message-Id: <C3DYHECUQCQV.A48HK99GLB15@geist>
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

On Wed Jun 3, 2020 at 8:58 AM, Christophe Leroy wrote:
>
>=20
>
>=20
> Le 03/06/2020 =C3=A0 07:19, Christopher M. Riedl a =C3=A9crit :
> > x86 supports the notion of a temporary mm which restricts access to
> > temporary PTEs to a single CPU. A temporary mm is useful for situations
> > where a CPU needs to perform sensitive operations (such as patching a
> > STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
> > said mappings to other CPUs. A side benefit is that other CPU TLBs do
> > not need to be flushed when the temporary mm is torn down.
> >=20
> > Mappings in the temporary mm can be set in the userspace portion of the
> > address-space.
> >=20
> > Interrupts must be disabled while the temporary mm is in use. HW
> > breakpoints, which may have been set by userspace as watchpoints on
> > addresses now within the temporary mm, are saved and disabled when
> > loading the temporary mm. The HW breakpoints are restored when unloadin=
g
> > the temporary mm. All HW breakpoints are indiscriminately disabled whil=
e
> > the temporary mm is in use.
> >=20
> > Based on x86 implementation:
> >=20
> > commit cefa929c034e
> > ("x86/mm: Introduce temporary mm structs")
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> >   arch/powerpc/include/asm/debug.h       |  1 +
> >   arch/powerpc/include/asm/mmu_context.h | 64 +++++++++++++++++++++++++=
+
> >   arch/powerpc/kernel/process.c          |  5 ++
> >   3 files changed, 70 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/as=
m/debug.h
> > index ec57daf87f40..827350c9bcf3 100644
> > --- a/arch/powerpc/include/asm/debug.h
> > +++ b/arch/powerpc/include/asm/debug.h
> > @@ -46,6 +46,7 @@ static inline int debugger_fault_handler(struct pt_re=
gs *regs) { return 0; }
> >   #endif
> >  =20
> >   void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
> > +void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk);
> >   bool ppc_breakpoint_available(void);
> >   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> >   extern void do_send_trap(struct pt_regs *regs, unsigned long address,
> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/incl=
ude/asm/mmu_context.h
> > index 1a474f6b1992..9269c7c7b04e 100644
> > --- a/arch/powerpc/include/asm/mmu_context.h
> > +++ b/arch/powerpc/include/asm/mmu_context.h
> > @@ -10,6 +10,7 @@
> >   #include <asm/mmu.h>=09
> >   #include <asm/cputable.h>
> >   #include <asm/cputhreads.h>
> > +#include <asm/debug.h>
> >  =20
> >   /*
> >    * Most if the context management is out of line
> > @@ -300,5 +301,68 @@ static inline int arch_dup_mmap(struct mm_struct *=
oldmm,
> >   	return 0;
> >   }
> >  =20
> > +struct temp_mm {
> > +	struct mm_struct *temp;
> > +	struct mm_struct *prev;
> > +	bool is_kernel_thread;
> > +	struct arch_hw_breakpoint brk[HBP_NUM_MAX];
> > +};
> > +
> > +static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_str=
uct *mm)
> > +{
> > +	temp_mm->temp =3D mm;
> > +	temp_mm->prev =3D NULL;
> > +	temp_mm->is_kernel_thread =3D false;
> > +	memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
> > +}
> > +
> > +static inline void use_temporary_mm(struct temp_mm *temp_mm)
> > +{
> > +	lockdep_assert_irqs_disabled();
> > +
> > +	temp_mm->is_kernel_thread =3D current->mm =3D=3D NULL;
> > +	if (temp_mm->is_kernel_thread)
> > +		temp_mm->prev =3D current->active_mm;
> > +	else
> > +		temp_mm->prev =3D current->mm;
>
>=20
> Is that necessary to make different for kernel threads ? When I look at
> x86 implementation, they don't do such a thing.
>

Yup, in do_slb_fault we error out if the current->mm is NULL resulting
in spectacular fails during patching w/ hash mmu.

>=20
> > +
> > +	/*
> > +	 * Hash requires a non-NULL current->mm to allocate a userspace addre=
ss
> > +	 * when handling a page fault. Does not appear to hurt in Radix eithe=
r.
> > +	 */
> > +	current->mm =3D temp_mm->temp;
> > +	switch_mm_irqs_off(NULL, temp_mm->temp, current);
> > +
> > +	if (ppc_breakpoint_available()) {
> > +		struct arch_hw_breakpoint null_brk =3D {0};
> > +		int i =3D 0;
> > +
> > +		for (; i < nr_wp_slots(); ++i) {
> > +			__get_breakpoint(i, &temp_mm->brk[i]);
> > +			if (temp_mm->brk[i].type !=3D 0)
> > +				__set_breakpoint(i, &null_brk);
> > +		}
> > +	}
> > +}
> > +
> > +static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
> > +{
> > +	lockdep_assert_irqs_disabled();
> > +
> > +	if (temp_mm->is_kernel_thread)
> > +		current->mm =3D NULL;
> > +	else
> > +		current->mm =3D temp_mm->prev;
> > +	switch_mm_irqs_off(NULL, temp_mm->prev, current);
> > +
> > +	if (ppc_breakpoint_available()) {
> > +		int i =3D 0;
> > +
> > +		for (; i < nr_wp_slots(); ++i)
> > +			if (temp_mm->brk[i].type !=3D 0)
> > +				__set_breakpoint(i, &temp_mm->brk[i]);
> > +	}
> > +}
> > +
> >   #endif /* __KERNEL__ */
> >   #endif /* __ASM_POWERPC_MMU_CONTEXT_H */
> > diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/proces=
s.c
> > index 048d64c4e115..3973144f6980 100644
> > --- a/arch/powerpc/kernel/process.c
> > +++ b/arch/powerpc/kernel/process.c
> > @@ -825,6 +825,11 @@ static inline int set_breakpoint_8xx(struct arch_h=
w_breakpoint *brk)
> >   	return 0;
> >   }
> >  =20
> > +void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk)
> > +{
> > +	memcpy(brk, this_cpu_ptr(&current_brk[nr]), sizeof(*brk));
> > +}
> > +
> >   void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
> >   {
> >   	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
> >=20
>
>=20
> Christophe
>
>=20
>
>=20

