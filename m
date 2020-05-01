Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 611E41C1E71
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 22:31:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DP6S3LNBzDqRf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 06:31:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=198.54.118.204;
 helo=mta-13-3.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
X-Greylist: delayed 97 seconds by postgrey-1.36 at bilbo;
 Sat, 02 May 2020 06:29:12 AEST
Received: from MTA-13-3.privateemail.com (mta-13-3.privateemail.com
 [198.54.118.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DP3r1BSnzDrJC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 06:29:11 +1000 (AEST)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 8C50A80053;
 Fri,  1 May 2020 16:29:07 -0400 (EDT)
Received: from localhost (unknown [10.20.151.231])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 45B578004B;
 Fri,  1 May 2020 20:29:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Originaldate: Wed Apr 29, 2020 at 7:39 AM
Originalfrom: "Christophe Leroy" <christophe.leroy@c-s.fr>
Original: =?utf-8?q?=0D=0A=0D=0ALe_29/04/2020_
 =C3=A0_04:05,_Christopher_M._Riedl_a_?= =?utf-8?q?=C3=A9crit=C2=A0:
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
 =?utf-8?q?ext.h_|_54_++++++++++++++++++++++++++=0D=0A>___arch/powerpc/ker?=
 =?utf-8?q?nel/process.c__________|__5_+++=0D=0A>___3_files_changed,_60_in?=
 =?utf-8?q?sertions(+)=0D=0A>_=0D=0A>_diff_--git_a/arch/powerpc/include/as?=
 =?utf-8?q?m/debug.h_b/arch/powerpc/include/asm/debug.h=0D=0A>_index_77560?=
 =?utf-8?q?26b95ca..b945bc16c932_100644=0D=0A>_---_a/arch/powerpc/include/?=
 =?utf-8?q?asm/debug.h=0D=0A>_+++_b/arch/powerpc/include/asm/debug.h=0D=0A?=
 =?utf-8?q?>_@@_-45,6_+45,7_@@_static_inline_int_debugger=5Fbreak=5Fmatch(?=
 =?utf-8?q?struct_pt=5Fregs_*regs)_{_return_0;_}=0D=0A>___static_inline_in?=
 =?utf-8?q?t_debugger=5Ffault=5Fhandler(struct_pt=5Fregs_*regs)_{_return_0?=
 =?utf-8?q?;_}=0D=0A>___#endif=0D=0A>___=0D=0A>_+void_=5F=5Fget=5Fbreakpoi?=
 =?utf-8?q?nt(struct_arch=5Fhw=5Fbreakpoint_*brk);=0D=0A>___void_=5F=5Fset?=
 =?utf-8?q?=5Fbreakpoint(struct_arch=5Fhw=5Fbreakpoint_*brk);=0D=0A>___boo?=
 =?utf-8?q?l_ppc=5Fbreakpoint=5Favailable(void);=0D=0A>___#ifdef_CONFIG=5F?=
 =?utf-8?q?PPC=5FADV=5FDEBUG=5FREGS=0D=0A>_diff_--git_a/arch/powerpc/inclu?=
 =?utf-8?q?de/asm/mmu=5Fcontext.h_b/arch/powerpc/include/asm/mmu=5Fcontext?=
 =?utf-8?q?.h=0D=0A>_index_360367c579de..57a8695fe63f_100644=0D=0A>_---_a/?=
 =?utf-8?q?arch/powerpc/include/asm/mmu=5Fcontext.h=0D=0A>_+++_b/arch/powe?=
 =?utf-8?q?rpc/include/asm/mmu=5Fcontext.h=0D=0A>_@@_-10,6_+10,7_@@=0D=0A>?=
 =?utf-8?q?___#include_<asm/mmu.h>=09=0D=0A>___#include_<asm/cputable.h>?=
 =?utf-8?q?=0D=0A>___#include_<asm/cputhreads.h>=0D=0A>_+#include_<asm/deb?=
 =?utf-8?q?ug.h>=0D=0A>___=0D=0A>___/*=0D=0A>____*_Most_if_the_context_man?=
 =?utf-8?q?agement_is_out_of_line=0D=0A>_@@_-270,5_+271,58_@@_static_inlin?=
 =?utf-8?q?e_int_arch=5Fdup=5Fmmap(struct_mm=5Fstruct_*oldmm,=0D=0A>___=09?=
 =?utf-8?q?return_0;=0D=0A>___}=0D=0A>___=0D=0A>_+struct_temp=5Fmm_{=0D=0A?=
 =?utf-8?q?>_+=09struct_mm=5Fstruct_*temp;=0D=0A>_+=09struct_mm=5Fstruct_*?=
 =?utf-8?q?prev;=0D=0A>_+=09bool_is=5Fkernel=5Fthread;=0D=0A>_+=09struct_a?=
 =?utf-8?q?rch=5Fhw=5Fbreakpoint_brk;=0D=0A>_+};=0D=0A>_+=0D=0A>_+static_i?=
 =?utf-8?q?nline_void_init=5Ftemp=5Fmm(struct_temp=5Fmm_*temp=5Fmm,_struct?=
 =?utf-8?q?_mm=5Fstruct_*mm)=0D=0A>_+{=0D=0A>_+=09temp=5Fmm->temp_=3D_mm;?=
 =?utf-8?q?=0D=0A>_+=09temp=5Fmm->prev_=3D_NULL;=0D=0A>_+=09temp=5Fmm->is?=
 =?utf-8?q?=5Fkernel=5Fthread_=3D_false;=0D=0A>_+=09memset(&temp=5Fmm->brk?=
 =?utf-8?q?,_0,_sizeof(temp=5Fmm->brk));=0D=0A>_+}=0D=0A>_+=0D=0A>_+static?=
 =?utf-8?q?_inline_void_use=5Ftemporary=5Fmm(struct_temp=5Fmm_*temp=5Fmm)?=
 =?utf-8?q?=0D=0A>_+{=0D=0A>_+=09lockdep=5Fassert=5Firqs=5Fdisabled();=0D?=
 =?utf-8?q?=0A>_+=0D=0A>_+=09temp=5Fmm->is=5Fkernel=5Fthread_=3D_current->?=
 =?utf-8?q?mm_=3D=3D_NULL;=0D=0A>_+=09if_(temp=5Fmm->is=5Fkernel=5Fthread)?=
 =?utf-8?q?=0D=0A>_+=09=09temp=5Fmm->prev_=3D_current->active=5Fmm;=0D=0A>?=
 =?utf-8?q?_+=09else=0D=0A>_+=09=09temp=5Fmm->prev_=3D_current->mm;=0D=0A>?=
 =?utf-8?q?_+=0D=0A>_+=09/*=0D=0A>_+=09_*_Hash_requires_a_non-NULL_current?=
 =?utf-8?q?->mm_to_allocate_a_userspace_address=0D=0A>_+=09_*_when_handlin?=
 =?utf-8?q?g_a_page_fault._Does_not_appear_to_hurt_in_Radix_either.=0D=0A>?=
 =?utf-8?q?_+=09_*/=0D=0A>_+=09current->mm_=3D_temp=5Fmm->temp;=0D=0A>_+?=
 =?utf-8?q?=09switch=5Fmm=5Firqs=5Foff(NULL,_temp=5Fmm->temp,_current);=0D?=
 =?utf-8?q?=0A>_+=0D=0A>_+=09if_(ppc=5Fbreakpoint=5Favailable())_{=0D=0A>_?=
 =?utf-8?q?+=09=09=5F=5Fget=5Fbreakpoint(&temp=5Fmm->brk);=0D=0A>_+=09=09i?=
 =?utf-8?q?f_(temp=5Fmm->brk.type_!=3D_0)=0D=0A>_+=09=09=09hw=5Fbreakpoint?=
 =?utf-8?q?=5Fdisable();=0D=0A>_+=09}=0D=0A>_+}=0D=0A>_+=0D=0A>_+static_in?=
 =?utf-8?q?line_void_unuse=5Ftemporary=5Fmm(struct_temp=5Fmm_*temp=5Fmm)?=
 =?utf-8?q?=0D=0A=0D=0ANot_sure_"unuse"_is_a_best_naming,_allthought_I_don?=
 =?utf-8?q?'t_have_a_better_=0D=0Asuggestion_a_the_moment._If_not_using_te?=
 =?utf-8?q?mporary=5Fmm_anymore,_what_are_we_=0D=0Ausing_now_=3F=0D=0A=0D?=
 =?utf-8?q?=0A>_+{=0D=0A>_+=09lockdep=5Fassert=5Firqs=5Fdisabled();=0D=0A>?=
 =?utf-8?q?_+=0D=0A>_+=09if_(temp=5Fmm->is=5Fkernel=5Fthread)=0D=0A>_+=09?=
 =?utf-8?q?=09current->mm_=3D_NULL;=0D=0A>_+=09else=0D=0A>_+=09=09current-?=
 =?utf-8?q?>mm_=3D_temp=5Fmm->prev;=0D=0A>_+=09switch=5Fmm=5Firqs=5Foff(NU?=
 =?utf-8?q?LL,_temp=5Fmm->prev,_current);=0D=0A>_+=0D=0A>_+=09if_(ppc=5Fbr?=
 =?utf-8?q?eakpoint=5Favailable()_&&_temp=5Fmm->brk.type_!=3D_0)=0D=0A>_+?=
 =?utf-8?q?=09=09=5F=5Fset=5Fbreakpoint(&temp=5Fmm->brk);=0D=0A>_+}=0D=0A>?=
 =?utf-8?q?_+=0D=0A>___#endif_/*_=5F=5FKERNEL=5F=5F_*/=0D=0A>___#endif_/*_?=
 =?utf-8?q?=5F=5FASM=5FPOWERPC=5FMMU=5FCONTEXT=5FH_*/=0D=0A>_diff_--git_a/?=
 =?utf-8?q?arch/powerpc/kernel/process.c_b/arch/powerpc/kernel/process.c?=
 =?utf-8?q?=0D=0A>_index_9c21288f8645..ec4cf890d92c_100644=0D=0A>_---_a/ar?=
 =?utf-8?q?ch/powerpc/kernel/process.c=0D=0A>_+++_b/arch/powerpc/kernel/pr?=
 =?utf-8?q?ocess.c=0D=0A>_@@_-800,6_+800,11_@@_static_inline_int_set=5Fbre?=
 =?utf-8?q?akpoint=5F8xx(struct_arch=5Fhw=5Fbreakpoint_*brk)=0D=0A>___=09r?=
 =?utf-8?q?eturn_0;=0D=0A>___}=0D=0A>___=0D=0A>_+void_=5F=5Fget=5Fbreakpoi?=
 =?utf-8?q?nt(struct_arch=5Fhw=5Fbreakpoint_*brk)=0D=0A>_+{=0D=0A>_+=09mem?=
 =?utf-8?q?cpy(brk,_this=5Fcpu=5Fptr(&current=5Fbrk),_sizeof(*brk));=0D=0A?=
 =?utf-8?q?>_+}=0D=0A>_+=0D=0A>___void_=5F=5Fset=5Fbreakpoint(struct_arch?=
 =?utf-8?q?=5Fhw=5Fbreakpoint_*brk)=0D=0A>___{=0D=0A>___=09memcpy(this=5Fc?=
 =?utf-8?q?pu=5Fptr(&current=5Fbrk),_brk,_sizeof(*brk));=0D=0A>_=0D=0A=0D?=
 =?utf-8?q?=0AChristophe=0D=0A?=
In-Reply-To: <df3d65fe-0c13-10dc-8508-b59b6daa3fdc@c-s.fr>
Date: Fri, 01 May 2020 15:30:34 -0500
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: "Christophe Leroy" <christophe.leroy@c-s.fr>,
 <linuxppc-dev@lists.ozlabs.org>, <kernel-hardening@lists.openwall.com>
Subject: Re: [RFC PATCH v2 1/5] powerpc/mm: Introduce temporary mm
Message-Id: <C2FOEVGUAJJG.3N9U36H70SUD5@geist>
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

On Wed Apr 29, 2020 at 7:39 AM, Christophe Leroy wrote:
>
>=20
>
>=20
> Le 29/04/2020 =C3=A0 04:05, Christopher M. Riedl a =C3=A9crit :
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
> >   arch/powerpc/include/asm/mmu_context.h | 54 +++++++++++++++++++++++++=
+
> >   arch/powerpc/kernel/process.c          |  5 +++
> >   3 files changed, 60 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/as=
m/debug.h
> > index 7756026b95ca..b945bc16c932 100644
> > --- a/arch/powerpc/include/asm/debug.h
> > +++ b/arch/powerpc/include/asm/debug.h
> > @@ -45,6 +45,7 @@ static inline int debugger_break_match(struct pt_regs=
 *regs) { return 0; }
> >   static inline int debugger_fault_handler(struct pt_regs *regs) { retu=
rn 0; }
> >   #endif
> >  =20
> > +void __get_breakpoint(struct arch_hw_breakpoint *brk);
> >   void __set_breakpoint(struct arch_hw_breakpoint *brk);
> >   bool ppc_breakpoint_available(void);
> >   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/incl=
ude/asm/mmu_context.h
> > index 360367c579de..57a8695fe63f 100644
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
> > @@ -270,5 +271,58 @@ static inline int arch_dup_mmap(struct mm_struct *=
oldmm,
> >   	return 0;
> >   }
> >  =20
> > +struct temp_mm {
> > +	struct mm_struct *temp;
> > +	struct mm_struct *prev;
> > +	bool is_kernel_thread;
> > +	struct arch_hw_breakpoint brk;
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
> > +		__get_breakpoint(&temp_mm->brk);
> > +		if (temp_mm->brk.type !=3D 0)
> > +			hw_breakpoint_disable();
> > +	}
> > +}
> > +
> > +static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
>
>=20
> Not sure "unuse" is a best naming, allthought I don't have a better
> suggestion a the moment. If not using temporary_mm anymore, what are we
> using now ?
>
>=20

I'm not too fond of 'unuse' either, but it's what x86 uses and I
couldn't come up with anything better on the spot. Maybe 'undo' is
better since we're switching back to whatever mm was in use before?

> > +{
> > +	lockdep_assert_irqs_disabled();
> > +
> > +	if (temp_mm->is_kernel_thread)
> > +		current->mm =3D NULL;
> > +	else
> > +		current->mm =3D temp_mm->prev;
> > +	switch_mm_irqs_off(NULL, temp_mm->prev, current);
> > +
> > +	if (ppc_breakpoint_available() && temp_mm->brk.type !=3D 0)
> > +		__set_breakpoint(&temp_mm->brk);
> > +}
> > +
> >   #endif /* __KERNEL__ */
> >   #endif /* __ASM_POWERPC_MMU_CONTEXT_H */
> > diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/proces=
s.c
> > index 9c21288f8645..ec4cf890d92c 100644
> > --- a/arch/powerpc/kernel/process.c
> > +++ b/arch/powerpc/kernel/process.c
> > @@ -800,6 +800,11 @@ static inline int set_breakpoint_8xx(struct arch_h=
w_breakpoint *brk)
> >   	return 0;
> >   }
> >  =20
> > +void __get_breakpoint(struct arch_hw_breakpoint *brk)
> > +{
> > +	memcpy(brk, this_cpu_ptr(&current_brk), sizeof(*brk));
> > +}
> > +
> >   void __set_breakpoint(struct arch_hw_breakpoint *brk)
> >   {
> >   	memcpy(this_cpu_ptr(&current_brk), brk, sizeof(*brk));
> >=20
>
>=20
> Christophe
>
>=20
>
>=20

