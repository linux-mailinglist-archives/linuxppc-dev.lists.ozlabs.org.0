Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7374E1B1D56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 06:23:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495r5d4jhqzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 14:23:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495r434nTzzDqsy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 14:21:39 +1000 (AEST)
Received: from MTA-06-3.privateemail.com (mta-06.privateemail.com
 [68.65.122.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id D524E805F2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 00:21:35 -0400 (EDT)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id F2D816003F;
 Tue, 21 Apr 2020 00:21:30 -0400 (EDT)
Received: from localhost (unknown [10.20.151.212])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id 970956003D;
 Tue, 21 Apr 2020 04:21:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <3a37ab41-ab0e-6fae-9fbe-710f83a945f2@c-s.fr>
Originaldate: Sat Apr 18, 2020 at 12:27 PM
Originalfrom: "Christophe Leroy" <christophe.leroy@c-s.fr>
Original: =?utf-8?q?=0D=0A=0D=0ALe_15/04/2020_
 =C3=A0_18:22,_Christopher_M_Riedl_a_?= =?utf-8?q?=C3=A9crit=C2=A0:
 =0D=0A>>_On_April_15,_2020_4:12_AM_Christophe_?=
 =?utf-8?q?Leroy_<christophe.leroy@c-s.fr>_wrote:=0D=0A>>=0D=0A>>___=0D=0A?=
 =?utf-8?q?>>_Le_15/04/2020_=C3=A0_07:16,_Christopher_M_Riedl_a_=C3=A9crit?=
 =?utf-8?q?=C2=A0:=0D=0A>>>>_On_March_26,_2020_9:42_AM_Christophe_Leroy_<c?=
 =?utf-8?q?hristophe.leroy@c-s.fr>_wrote:=0D=0A>>>>=0D=0A>>>>____=0D=0A>>>?=
 =?utf-8?q?>_This_patch_fixes_the_RFC_series_identified_below.=0D=0A>>>>_I?=
 =?utf-8?q?t_fixes_three_points:=0D=0A>>>>_-_Failure_with_CONFIG=5FPPC=5FK?=
 =?utf-8?q?UAP=0D=0A>>>>_-_Failure_to_write_do_to_lack_of_DIRTY_bit_set_on?=
 =?utf-8?q?_the_8xx=0D=0A>>>>_-_Inadequaly_complex_WARN_post_verification?=
 =?utf-8?q?=0D=0A>>>>=0D=0A>>>>_However,_it_has_an_impact_on_the_CPU_load.?=
 =?utf-8?q?_Here_is_the_time=0D=0A>>>>_needed_on_an_8xx_to_run_the_ftrace_?=
 =?utf-8?q?selftests_without_and=0D=0A>>>>_with_this_series:=0D=0A>>>>_-_W?=
 =?utf-8?q?ithout_CONFIG=5FSTRICT=5FKERNEL=5FRWX=09=09=3D=3D>_38_seconds?=
 =?utf-8?q?=0D=0A>>>>_-_With_CONFIG=5FSTRICT=5FKERNEL=5FRWX=09=09=09=3D=3D?=
 =?utf-8?q?>_40_seconds=0D=0A>>>>_-_With_CONFIG=5FSTRICT=5FKERNEL=5FRWX_+_?=
 =?utf-8?q?this_series=09=3D=3D>_43_seconds=0D=0A>>>>=0D=0A>>>>_Link:_http?=
 =?utf-8?q?s://patchwork.ozlabs.org/project/linuxppc-dev/list/=3Fseries=3D?=
 =?utf-8?q?166003=0D=0A>>>>_Signed-off-by:_Christophe_Leroy_<christophe.le?=
 =?utf-8?q?roy@c-s.fr>=0D=0A>>>>_---=0D=0A>>>>____arch/powerpc/lib/code-pa?=
 =?utf-8?q?tching.c_|_5_++++-=0D=0A>>>>____1_file_changed,_4_insertions(+)?=
 =?utf-8?q?,_1_deletion(-)=0D=0A>>>>=0D=0A>>>>_diff_--git_a/arch/powerpc/l?=
 =?utf-8?q?ib/code-patching.c_b/arch/powerpc/lib/code-patching.c=0D=0A>>>>?=
 =?utf-8?q?_index_f156132e8975..4ccff427592e_100644=0D=0A>>>>_---_a/arch/p?=
 =?utf-8?q?owerpc/lib/code-patching.c=0D=0A>>>>_+++_b/arch/powerpc/lib/cod?=
 =?utf-8?q?e-patching.c=0D=0A>>>>_@@_-97,6_+97,7_@@_static_int_map=5Fpatch?=
 =?utf-8?q?(const_void_*addr,_struct_patch=5Fmapping_*patch=5Fmapping)=0D?=
 =?utf-8?q?=0A>>>>____=09}=0D=0A>>>>____=0D=0A>>>>____=09pte_=3D_mk=5Fpte(?=
 =?utf-8?q?page,_pgprot);=0D=0A>>>>_+=09pte_=3D_pte=5Fmkdirty(pte);=0D=0A>?=
 =?utf-8?q?>>>____=09set=5Fpte=5Fat(patching=5Fmm,_patching=5Faddr,_ptep,_?=
 =?utf-8?q?pte);=0D=0A>>>>____=0D=0A>>>>____=09init=5Ftemp=5Fmm(&patch=5Fm?=
 =?utf-8?q?apping->temp=5Fmm,_patching=5Fmm);=0D=0A>>>>_@@_-168,7_+169,9_@?=
 =?utf-8?q?@_static_int_do=5Fpatch=5Finstruction(unsigned_int_*addr,_unsig?=
 =?utf-8?q?ned_int_instr)=0D=0A>>>>____=09=09=09(offset=5Fin=5Fpage((unsig?=
 =?utf-8?q?ned_long)addr)_/=0D=0A>>>>____=09=09=09=09sizeof(unsigned_int))?=
 =?utf-8?q?;=0D=0A>>>>____=0D=0A>>>>_+=09allow=5Fwrite=5Fto=5Fuser(patch?=
 =?utf-8?q?=5Faddr,_sizeof(instr));=0D=0A>>>>____=09=5F=5Fpatch=5Finstruct?=
 =?utf-8?q?ion(addr,_instr,_patch=5Faddr);=0D=0A>>>>_+=09prevent=5Fwrite?=
 =?utf-8?q?=5Fto=5Fuser(patch=5Faddr,_sizeof(instr));=0D=0A>>>>=0D=0A>>>?=
 =?utf-8?q?=0D=0A>>>_On_radix_we_can_map_the_page_with_PAGE=5FKERNEL_prote?=
 =?utf-8?q?ction_which_ends_up=0D=0A>>>_setting_EAA[0]_in_the_radix_PTE._T?=
 =?utf-8?q?his_means_the_KUAP_(AMR)_protection_is=0D=0A>>>_ignored_(ISA_v3?=
 =?utf-8?q?.0b_Fig._35)_since_we_are_accessing_the_page_from_MSR[PR]=3D0.?=
 =?utf-8?q?=0D=0A>>>=0D=0A>>>_Can_we_employ_a_similar_approach_on_the_8xx?=
 =?utf-8?q?=3F_I_would_prefer_*not*_to_wrap=0D=0A>>>_the_=5F=5Fpatch=5Fins?=
 =?utf-8?q?truction()_with_the_allow=5F/prevent=5Fwrite=5Fto=5Fuser()_KUAP?=
 =?utf-8?q?_things=0D=0A>>>_because_this_is_a_temporary_kernel_mapping_whi?=
 =?utf-8?q?ch_really_isn't_userspace_in=0D=0A>>>_the_usual_sense.=0D=0A>>?=
 =?utf-8?q?=0D=0A>>_On_the_8xx,_that's_pretty_different.=0D=0A>>=0D=0A>>_T?=
 =?utf-8?q?he_PTE_doesn't_control_whether_a_page_is_user_page_or_a_kernel_?=
 =?utf-8?q?page.=0D=0A>>_The_only_thing_that_is_set_in_the_PTE_is_whether_?=
 =?utf-8?q?a_page_is_linked_to_a=0D=0A>>_given_PID_or_not.=0D=0A>>_PAGE=5F?=
 =?utf-8?q?KERNEL_tells_that_the_page_can_be_addressed_with_any_PID.=0D=0A?=
 =?utf-8?q?>>=0D=0A>>_The_user_access_right_is_given_by_a_kind_of_zone,_wh?=
 =?utf-8?q?ich_is_in_the_PGD=0D=0A>>_entry._Every_pages_above_PAGE=5FOFFSE?=
 =?utf-8?q?T_are_defined_as_belonging_to_zone_0.=0D=0A>>_Every_pages_below?=
 =?utf-8?q?_PAGE=5FOFFSET_are_defined_as_belonging_to_zone_1.=0D=0A>>=0D?=
 =?utf-8?q?=0A>>_By_default,_zone_0_can_only_be_accessed_by_kernel,_and_zo?=
 =?utf-8?q?ne_1_can_only=0D=0A>>_be_accessed_by_user._When_kernel_wants_to?=
 =?utf-8?q?_access_zone_1,_it_temporarily=0D=0A>>_changes_properties_of_zo?=
 =?utf-8?q?ne_1_to_allow_both_kernel_and_user_accesses.=0D=0A>>=0D=0A>>_So?=
 =?utf-8?q?,_if_your_mapping_is_below_PAGE=5FOFFSET,_it_is_in_zone_1_and_k?=
 =?utf-8?q?ernel=0D=0A>>_must_unlock_it_to_access_it.=0D=0A>>=0D=0A>>=0D?=
 =?utf-8?q?=0A>>_And_this_is_more_or_less_the_same_on_hash/32._This_is_man?=
 =?utf-8?q?aged_by_segment=0D=0A>>_registers._One_segment_register_corresp?=
 =?utf-8?q?onds_to_a_256Mbytes_area._Every=0D=0A>>_pages_below_PAGE=5FOFFS?=
 =?utf-8?q?ET_can_only_be_read_by_default_by_kernel._Only_user=0D=0A>>_can?=
 =?utf-8?q?_write_if_the_PTE_allows_it._When_the_kernel_needs_to_write_at_?=
 =?utf-8?q?an=0D=0A>>_address_below_PAGE=5FOFFSET,_it_must_change_the_segm?=
 =?utf-8?q?ent_properties_in_the=0D=0A>>_corresponding_segment_register.?=
 =?utf-8?q?=0D=0A>>=0D=0A>>_So,_for_both_cases,_if_we_want_to_have_it_loca?=
 =?utf-8?q?l_to_a_task_while_still=0D=0A>>_allowing_kernel_access,_it_mean?=
 =?utf-8?q?s_we_have_to_define_a_new_special_area=0D=0A>>_between_TASK=5FS?=
 =?utf-8?q?IZE_and_PAGE=5FOFFSET_which_belongs_to_kernel_zone.=0D=0A>>=0D?=
 =?utf-8?q?=0A>>_That_looks_complex_to_me_for_a_small_benefit,_especially_?=
 =?utf-8?q?as_8xx_is_not=0D=0A>>_SMP_and_neither_are_most_of_the_hash/32_t?=
 =?utf-8?q?argets.=0D=0A>>=0D=0A>_=0D=0A>_Agreed._So_I_guess_the_solution_?=
 =?utf-8?q?is_to_differentiate_between_radix/non-radix=0D=0A>_and_use_PAGE?=
 =?utf-8?q?=5FSHARED_for_non-radix_along_with_the_KUAP_functions_when_KUAP?=
 =?utf-8?q?=0D=0A>_is_enabled._Hmm,_I_need_to_think_about_this_some_more,_?=
 =?utf-8?q?especially_if_it's=0D=0A>_acceptable_to_temporarily_map_kernel_?=
 =?utf-8?q?text_as_PAGE=5FSHARED_for_patching._Do=0D=0A>_you_see_any_obvio?=
 =?utf-8?q?us_problems_on_8xx_and_hash/32_w/_using_PAGE=5FSHARED=3F=0D=0A?=
 =?utf-8?q?=0D=0ANo_it_shouldn't_be_a_problem_AFAICS,_except_maybe_the_CPU?=
 =?utf-8?q?_overhead_it_=0D=0Abrings_as_I_mentioned_previously_(ftrace_sel?=
 =?utf-8?q?ftests_going_from_40_to_43_=0D=0Aseconds_ie_8%_overhead.=0D=0A?=
 =?utf-8?q?=0D=0A>_=0D=0A>_I_don't_necessarily_want_to_drop_the_local_mm_p?=
 =?utf-8?q?atching_idea_for_non-radix=0D=0A>_platforms_since_that_means_we?=
 =?utf-8?q?_would_have_to_maintain_two_implementations.=0D=0A>_=0D=0A=0D?=
 =?utf-8?q?=0AWhat's_the_problem_with_RADIX,_why_can't_PAGE=5FSHARED_be_us?=
 =?utf-8?q?ed_on_radix_=3F=0D=0A=0D=0AChristophe=0D=0A?=
Date: Mon, 20 Apr 2020 23:22:49 -0500
Subject: Re: [RFC PATCH] powerpc/lib: Fixing use a temporary mm for code
 patching
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: "Christophe Leroy" <christophe.leroy@c-s.fr>
Message-Id: <C26LKGPLFN9C.57CFF2U7I7X0@geist>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Apr 18, 2020 at 12:27 PM, Christophe Leroy wrote:
>
>=20
>
>=20
> Le 15/04/2020 =C3=A0 18:22, Christopher M Riedl a =C3=A9crit :
> >> On April 15, 2020 4:12 AM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
> >>
> >>  =20
> >> Le 15/04/2020 =C3=A0 07:16, Christopher M Riedl a =C3=A9crit=C2=A0:
> >>>> On March 26, 2020 9:42 AM Christophe Leroy <christophe.leroy@c-s.fr>=
 wrote:
> >>>>
> >>>>   =20
> >>>> This patch fixes the RFC series identified below.
> >>>> It fixes three points:
> >>>> - Failure with CONFIG_PPC_KUAP
> >>>> - Failure to write do to lack of DIRTY bit set on the 8xx
> >>>> - Inadequaly complex WARN post verification
> >>>>
> >>>> However, it has an impact on the CPU load. Here is the time
> >>>> needed on an 8xx to run the ftrace selftests without and
> >>>> with this series:
> >>>> - Without CONFIG_STRICT_KERNEL_RWX		=3D=3D> 38 seconds
> >>>> - With CONFIG_STRICT_KERNEL_RWX			=3D=3D> 40 seconds
> >>>> - With CONFIG_STRICT_KERNEL_RWX + this series	=3D=3D> 43 seconds
> >>>>
> >>>> Link: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=
=3D166003
> >>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >>>> ---
> >>>>    arch/powerpc/lib/code-patching.c | 5 ++++-
> >>>>    1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/cod=
e-patching.c
> >>>> index f156132e8975..4ccff427592e 100644
> >>>> --- a/arch/powerpc/lib/code-patching.c
> >>>> +++ b/arch/powerpc/lib/code-patching.c
> >>>> @@ -97,6 +97,7 @@ static int map_patch(const void *addr, struct patc=
h_mapping *patch_mapping)
> >>>>    	}
> >>>>   =20
> >>>>    	pte =3D mk_pte(page, pgprot);
> >>>> +	pte =3D pte_mkdirty(pte);
> >>>>    	set_pte_at(patching_mm, patching_addr, ptep, pte);
> >>>>   =20
> >>>>    	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> >>>> @@ -168,7 +169,9 @@ static int do_patch_instruction(unsigned int *ad=
dr, unsigned int instr)
> >>>>    			(offset_in_page((unsigned long)addr) /
> >>>>    				sizeof(unsigned int));
> >>>>   =20
> >>>> +	allow_write_to_user(patch_addr, sizeof(instr));
> >>>>    	__patch_instruction(addr, instr, patch_addr);
> >>>> +	prevent_write_to_user(patch_addr, sizeof(instr));
> >>>>
> >>>
> >>> On radix we can map the page with PAGE_KERNEL protection which ends u=
p
> >>> setting EAA[0] in the radix PTE. This means the KUAP (AMR) protection=
 is
> >>> ignored (ISA v3.0b Fig. 35) since we are accessing the page from MSR[=
PR]=3D0.
> >>>
> >>> Can we employ a similar approach on the 8xx? I would prefer *not* to =
wrap
> >>> the __patch_instruction() with the allow_/prevent_write_to_user() KUA=
P things
> >>> because this is a temporary kernel mapping which really isn't userspa=
ce in
> >>> the usual sense.
> >>
> >> On the 8xx, that's pretty different.
> >>
> >> The PTE doesn't control whether a page is user page or a kernel page.
> >> The only thing that is set in the PTE is whether a page is linked to a
> >> given PID or not.
> >> PAGE_KERNEL tells that the page can be addressed with any PID.
> >>
> >> The user access right is given by a kind of zone, which is in the PGD
> >> entry. Every pages above PAGE_OFFSET are defined as belonging to zone =
0.
> >> Every pages below PAGE_OFFSET are defined as belonging to zone 1.
> >>
> >> By default, zone 0 can only be accessed by kernel, and zone 1 can only
> >> be accessed by user. When kernel wants to access zone 1, it temporaril=
y
> >> changes properties of zone 1 to allow both kernel and user accesses.
> >>
> >> So, if your mapping is below PAGE_OFFSET, it is in zone 1 and kernel
> >> must unlock it to access it.
> >>
> >>
> >> And this is more or less the same on hash/32. This is managed by segme=
nt
> >> registers. One segment register corresponds to a 256Mbytes area. Every
> >> pages below PAGE_OFFSET can only be read by default by kernel. Only us=
er
> >> can write if the PTE allows it. When the kernel needs to write at an
> >> address below PAGE_OFFSET, it must change the segment properties in th=
e
> >> corresponding segment register.
> >>
> >> So, for both cases, if we want to have it local to a task while still
> >> allowing kernel access, it means we have to define a new special area
> >> between TASK_SIZE and PAGE_OFFSET which belongs to kernel zone.
> >>
> >> That looks complex to me for a small benefit, especially as 8xx is not
> >> SMP and neither are most of the hash/32 targets.
> >>
> >=20
> > Agreed. So I guess the solution is to differentiate between radix/non-r=
adix
> > and use PAGE_SHARED for non-radix along with the KUAP functions when KU=
AP
> > is enabled. Hmm, I need to think about this some more, especially if it=
's
> > acceptable to temporarily map kernel text as PAGE_SHARED for patching. =
Do
> > you see any obvious problems on 8xx and hash/32 w/ using PAGE_SHARED?
>
>=20
> No it shouldn't be a problem AFAICS, except maybe the CPU overhead it
> brings as I mentioned previously (ftrace selftests going from 40 to 43
> seconds ie 8% overhead.
>
Ok great. I will have some performance numbers for POWER8 and POWER9 with
the next spin of the RFC
>=20
> >=20
> > I don't necessarily want to drop the local mm patching idea for non-rad=
ix
> > platforms since that means we would have to maintain two implementation=
s.
> >=20
>
>=20
> What's the problem with RADIX, why can't PAGE_SHARED be used on radix ?
>
It's not a problem. I would actually prefer to use PAGE_KERNEL since the
mapping is really for a kernel page. On radix using PAGE_KERNEL allows us
to avoid the KUAP functions due to the HW implementation (AMR and EAA).
>=20
> Christophe
>
>=20
>
>=20

