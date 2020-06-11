Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 194701F6090
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 05:31:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49j8Xk2YL8zDqkp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 13:31:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=68.65.122.27;
 helo=mta-07-4.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49j8VZ4H3SzDqFJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 13:29:42 +1000 (AEST)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id C056A60034;
 Wed, 10 Jun 2020 23:29:38 -0400 (EDT)
Received: from localhost (unknown [10.20.151.221])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 535DB60049;
 Thu, 11 Jun 2020 03:29:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Originalfrom: "Christophe Leroy" <christophe.leroy@csgroup.eu>
Original: =?utf-8?q?=0D=0A=0D=0ALe_03/06/2020_
 =C3=A0_07:19,_Christopher_M._Riedl_a_?= =?utf-8?q?=C3=A9crit=C2=A0:
 =0D=0A>_Currently,_code_patching_a_STRICT=5FKE?= =?utf-8?q?RNEL
 =5FRWX_exposes_the_temporary=0D=0A>_mappings_to_other_CPUs.?=
 =?utf-8?q?_These_mappings_should_be_kept_local_to_the_CPU=0D=0A>_doing_th?=
 =?utf-8?q?e_patching._Use_the_pre-initialized_temporary_mm_and_patching?=
 =?utf-8?q?=0D=0A>_address_for_this_purpose._Also_add_a_check_after_patchi?=
 =?utf-8?q?ng_to_ensure_the=0D=0A>_patch_succeeded.=0D=0A>_=0D=0A>_Use_the?=
 =?utf-8?q?_KUAP_functions_on_non-BOOKS3=5F64_platforms_since_the_temporar?=
 =?utf-8?q?y=0D=0A>_mapping_for_patching_uses_a_userspace_address_(to_keep?=
 =?utf-8?q?_the_mapping=0D=0A>_local)._On_BOOKS3=5F64_platforms_hash_does_?=
 =?utf-8?q?not_implement_KUAP_and_on_radix=0D=0A>_the_use_of_PAGE=5FKERNEL?=
 =?utf-8?q?_sets_EAA[0]_for_the_PTE_which_means_the_AMR=0D=0A>_(KUAP)_prot?=
 =?utf-8?q?ection_is_ignored_(see_PowerISA_v3.0b,_Fig,_35).=0D=0A>_=0D=0A>?=
 =?utf-8?q?_Based_on_x86_implementation:=0D=0A>_=0D=0A>_commit_b3fd8e83ada?=
 =?utf-8?q?0=0D=0A>_("x86/alternatives:_Use_temporary_mm_for_text_poking")?=
 =?utf-8?q?=0D=0A>_=0D=0A>_Signed-off-by:_Christopher_M._Riedl_<cmr@inform?=
 =?utf-8?q?atik.wtf>=0D=0A>_---=0D=0A>___arch/powerpc/lib/code-patching.c_?=
 =?utf-8?q?|_148_++++++++++++-------------------=0D=0A>___1_file_changed,_?=
 =?utf-8?q?55_insertions(+),_93_deletions(-)=0D=0A>_=0D=0A>_diff_--git_a/a?=
 =?utf-8?q?rch/powerpc/lib/code-patching.c_b/arch/powerpc/lib/code-patchin?=
 =?utf-8?q?g.c=0D=0A>_index_599114f63b44..df0765845204_100644=0D=0A>_---_a?=
 =?utf-8?q?/arch/powerpc/lib/code-patching.c=0D=0A>_+++_b/arch/powerpc/lib?=
 =?utf-8?q?/code-patching.c=0D=0A>_@@_-20,6_+20,7_@@=0D=0A>___#include_<as?=
 =?utf-8?q?m/code-patching.h>=0D=0A>___#include_<asm/setup.h>=0D=0A>___#in?=
 =?utf-8?q?clude_<asm/inst.h>=0D=0A>_+#include_<asm/mmu=5Fcontext.h>=0D=0A?=
 =?utf-8?q?>___=0D=0A>___static_int_=5F=5Fpatch=5Finstruction(struct_ppc?=
 =?utf-8?q?=5Finst_*exec=5Faddr,_struct_ppc=5Finst_instr,=0D=0A>___=09=09?=
 =?utf-8?q?=09_______struct_ppc=5Finst_*patch=5Faddr)=0D=0A>_@@_-78,101_+7?=
 =?utf-8?q?9,58_@@_void_=5F=5Finit_poking=5Finit(void)=0D=0A>___=09pte=5Fu?=
 =?utf-8?q?nmap=5Funlock(ptep,_ptl);=0D=0A>___}=0D=0A>___=0D=0A>_-static_D?=
 =?utf-8?q?EFINE=5FPER=5FCPU(struct_vm=5Fstruct_*,_text=5Fpoke=5Farea);=0D?=
 =?utf-8?q?=0A>_-=0D=0A>_-static_int_text=5Farea=5Fcpu=5Fup(unsigned_int_c?=
 =?utf-8?q?pu)=0D=0A>_-{=0D=0A>_-=09struct_vm=5Fstruct_*area;=0D=0A>_-=0D?=
 =?utf-8?q?=0A>_-=09area_=3D_get=5Fvm=5Farea(PAGE=5FSIZE,_VM=5FALLOC);=0D?=
 =?utf-8?q?=0A>_-=09if_(!area)_{=0D=0A>_-=09=09WARN=5FONCE(1,_"Failed_to_c?=
 =?utf-8?q?reate_text_area_for_cpu_%d\n",=0D=0A>_-=09=09=09cpu);=0D=0A>_-?=
 =?utf-8?q?=09=09return_-1;=0D=0A>_-=09}=0D=0A>_-=09this=5Fcpu=5Fwrite(tex?=
 =?utf-8?q?t=5Fpoke=5Farea,_area);=0D=0A>_-=0D=0A>_-=09return_0;=0D=0A>_-}?=
 =?utf-8?q?=0D=0A>_-=0D=0A>_-static_int_text=5Farea=5Fcpu=5Fdown(unsigned_?=
 =?utf-8?q?int_cpu)=0D=0A>_-{=0D=0A>_-=09free=5Fvm=5Farea(this=5Fcpu=5Frea?=
 =?utf-8?q?d(text=5Fpoke=5Farea));=0D=0A>_-=09return_0;=0D=0A>_-}=0D=0A>_-?=
 =?utf-8?q?=0D=0A>_-/*=0D=0A>_-_*_Run_as_a_late_init_call._This_allows_all?=
 =?utf-8?q?_the_boot_time_patching_to_be_done=0D=0A>_-_*_simply_by_patchin?=
 =?utf-8?q?g_the_code,_and_then_we're_called_here_prior_to=0D=0A>_-_*_mark?=
 =?utf-8?q?=5Frodata=5Fro(),_which_happens_after_all_init_calls_are_run._A?=
 =?utf-8?q?lthough=0D=0A>_-_*_BUG=5FON()_is_rude,_in_this_case_it_should_o?=
 =?utf-8?q?nly_happen_if_ENOMEM,_and_we_judge=0D=0A>_-_*_it_as_being_prefe?=
 =?utf-8?q?rable_to_a_kernel_that_will_crash_later_when_someone_tries=0D?=
 =?utf-8?q?=0A>_-_*_to_use_patch=5Finstruction().=0D=0A>_-_*/=0D=0A>_-stat?=
 =?utf-8?q?ic_int_=5F=5Finit_setup=5Ftext=5Fpoke=5Farea(void)=0D=0A>_-{=0D?=
 =?utf-8?q?=0A>_-=09BUG=5FON(!cpuhp=5Fsetup=5Fstate(CPUHP=5FAP=5FONLINE=5F?=
 =?utf-8?q?DYN,=0D=0A>_-=09=09"powerpc/text=5Fpoke:online",_text=5Farea=5F?=
 =?utf-8?q?cpu=5Fup,=0D=0A>_-=09=09text=5Farea=5Fcpu=5Fdown));=0D=0A>_-=0D?=
 =?utf-8?q?=0A>_-=09return_0;=0D=0A>_-}=0D=0A>_-late=5Finitcall(setup=5Fte?=
 =?utf-8?q?xt=5Fpoke=5Farea);=0D=0A>_+struct_patch=5Fmapping_{=0D=0A>_+=09?=
 =?utf-8?q?spinlock=5Ft_*ptl;_/*_for_protecting_pte_table_*/=0D=0A>_+=09pt?=
 =?utf-8?q?e=5Ft_*ptep;=0D=0A>_+=09struct_temp=5Fmm_temp=5Fmm;=0D=0A>_+};?=
 =?utf-8?q?=0D=0A>___=0D=0A>___/*=0D=0A>____*_This_can_be_called_for_kerne?=
 =?utf-8?q?l_text_or_a_module.=0D=0A>____*/=0D=0A>_-static_int_map=5Fpatch?=
 =?utf-8?q?=5Farea(void_*addr,_unsigned_long_text=5Fpoke=5Faddr)=0D=0A>_+s?=
 =?utf-8?q?tatic_int_map=5Fpatch(const_void_*addr,_struct_patch=5Fmapping_?=
 =?utf-8?q?*patch=5Fmapping)=0D=0A>___{=0D=0A>_-=09unsigned_long_pfn;=0D?=
 =?utf-8?q?=0A>_-=09int_err;=0D=0A>_+=09struct_page_*page;=0D=0A>_+=09pte?=
 =?utf-8?q?=5Ft_pte;=0D=0A>_+=09pgprot=5Ft_pgprot;=0D=0A>___=0D=0A>___=09i?=
 =?utf-8?q?f_(is=5Fvmalloc=5Faddr(addr))=0D=0A>_-=09=09pfn_=3D_vmalloc=5Ft?=
 =?utf-8?q?o=5Fpfn(addr);=0D=0A>_+=09=09page_=3D_vmalloc=5Fto=5Fpage(addr)?=
 =?utf-8?q?;=0D=0A>___=09else=0D=0A>_-=09=09pfn_=3D_=5F=5Fpa=5Fsymbol(addr?=
 =?utf-8?q?)_>>_PAGE=5FSHIFT;=0D=0A>_+=09=09page_=3D_virt=5Fto=5Fpage(addr?=
 =?utf-8?q?);=0D=0A>___=0D=0A>_-=09err_=3D_map=5Fkernel=5Fpage(text=5Fpoke?=
 =?utf-8?q?=5Faddr,_(pfn_<<_PAGE=5FSHIFT),_PAGE=5FKERNEL);=0D=0A>_+=09if_(?=
 =?utf-8?q?radix=5Fenabled())=0D=0A>_+=09=09pgprot_=3D_PAGE=5FKERNEL;=0D?=
 =?utf-8?q?=0A>_+=09else=0D=0A>_+=09=09pgprot_=3D_PAGE=5FSHARED;=0D=0A>___?=
 =?utf-8?q?=0D=0A>_-=09pr=5Fdevel("Mapped_addr_%lx_with_pfn_%lx:%d\n",_tex?=
 =?utf-8?q?t=5Fpoke=5Faddr,_pfn,_err);=0D=0A>_-=09if_(err)=0D=0A>_+=09patc?=
 =?utf-8?q?h=5Fmapping->ptep_=3D_get=5Flocked=5Fpte(patching=5Fmm,_patchin?=
 =?utf-8?q?g=5Faddr,=0D=0A>_+=09=09=09=09=09_____&patch=5Fmapping->ptl);?=
 =?utf-8?q?=0D=0A>_+=09if_(unlikely(!patch=5Fmapping->ptep))_{=0D=0A>_+=09?=
 =?utf-8?q?=09pr=5Fwarn("map_patch:_failed_to_allocate_pte_for_patching\n"?=
 =?utf-8?q?);=0D=0A>___=09=09return_-1;=0D=0A>_+=09}=0D=0A>_+=0D=0A>_+=09p?=
 =?utf-8?q?te_=3D_mk=5Fpte(page,_pgprot);=0D=0A>_+=09if_(!IS=5FENABLED(CON?=
 =?utf-8?q?FIG=5FPPC=5FBOOK3S=5F64))=0D=0A>_+=09=09pte_=3D_pte=5Fmkdirty(p?=
 =?utf-8?q?te);=0D=0A=0D=0AAre_you_should_you_don't_need_the_DIRTY_bit_for?=
 =?utf-8?q?_BOOK3S/64_non_radix_=3F=0D=0A=0D=0AI_think_the_DIRTY_bit_is_ne?=
 =?utf-8?q?eded_always,_and_adding_it_when_it_is_already_=0D=0Athere_is_ha?=
 =?utf-8?q?rmless,_so_it_should_be_done_inconditionnnaly.=0D=0A=0D=0A>_+?=
 =?utf-8?q?=09set=5Fpte=5Fat(patching=5Fmm,_patching=5Faddr,_patch=5Fmappi?=
 =?utf-8?q?ng->ptep,_pte);=0D=0A>_+=0D=0A>_+=09init=5Ftemp=5Fmm(&patch=5Fm?=
 =?utf-8?q?apping->temp=5Fmm,_patching=5Fmm);=0D=0A>_+=09use=5Ftemporary?=
 =?utf-8?q?=5Fmm(&patch=5Fmapping->temp=5Fmm);=0D=0A>___=0D=0A>___=09retur?=
 =?utf-8?q?n_0;=0D=0A>___}=0D=0A>___=0D=0A>_-static_inline_int_unmap=5Fpat?=
 =?utf-8?q?ch=5Farea(unsigned_long_addr)=0D=0A>_+static_void_unmap=5Fpatch?=
 =?utf-8?q?(struct_patch=5Fmapping_*patch=5Fmapping)=0D=0A>___{=0D=0A>_-?=
 =?utf-8?q?=09pte=5Ft_*ptep;=0D=0A>_-=09pmd=5Ft_*pmdp;=0D=0A>_-=09pud=5Ft_?=
 =?utf-8?q?*pudp;=0D=0A>_-=09pgd=5Ft_*pgdp;=0D=0A>_-=0D=0A>_-=09pgdp_=3D_p?=
 =?utf-8?q?gd=5Foffset=5Fk(addr);=0D=0A>_-=09if_(unlikely(!pgdp))=0D=0A>_-?=
 =?utf-8?q?=09=09return_-EINVAL;=0D=0A>_-=0D=0A>_-=09pudp_=3D_pud=5Foffset?=
 =?utf-8?q?(pgdp,_addr);=0D=0A>_-=09if_(unlikely(!pudp))=0D=0A>_-=09=09ret?=
 =?utf-8?q?urn_-EINVAL;=0D=0A>_-=0D=0A>_-=09pmdp_=3D_pmd=5Foffset(pudp,_ad?=
 =?utf-8?q?dr);=0D=0A>_-=09if_(unlikely(!pmdp))=0D=0A>_-=09=09return_-EINV?=
 =?utf-8?q?AL;=0D=0A>_-=0D=0A>_-=09ptep_=3D_pte=5Foffset=5Fkernel(pmdp,_ad?=
 =?utf-8?q?dr);=0D=0A>_-=09if_(unlikely(!ptep))=0D=0A>_-=09=09return_-EINV?=
 =?utf-8?q?AL;=0D=0A>_+=09/*_In_hash,_pte=5Fclear_flushes_the_tlb_*/=0D=0A?=
 =?utf-8?q?>_+=09pte=5Fclear(patching=5Fmm,_patching=5Faddr,_patch=5Fmappi?=
 =?utf-8?q?ng->ptep);=0D=0A>_+=09unuse=5Ftemporary=5Fmm(&patch=5Fmapping->?=
 =?utf-8?q?temp=5Fmm);=0D=0A>___=0D=0A>_-=09pr=5Fdevel("clearing_mm_%p,_pt?=
 =?utf-8?q?e_%p,_addr_%lx\n",_&init=5Fmm,_ptep,_addr);=0D=0A>_-=0D=0A>_-?=
 =?utf-8?q?=09/*=0D=0A>_-=09_*_In_hash,_pte=5Fclear_flushes_the_tlb,_in_ra?=
 =?utf-8?q?dix,_we_have_to=0D=0A>_-=09_*/=0D=0A>_-=09pte=5Fclear(&init=5Fm?=
 =?utf-8?q?m,_addr,_ptep);=0D=0A>_-=09flush=5Ftlb=5Fkernel=5Frange(addr,_a?=
 =?utf-8?q?ddr_+_PAGE=5FSIZE);=0D=0A>_-=0D=0A>_-=09return_0;=0D=0A>_+=09/*?=
 =?utf-8?q?_In_radix,_we_have_to_explicitly_flush_the_tlb_(no-op_in_hash)_?=
 =?utf-8?q?*/=0D=0A>_+=09local=5Fflush=5Ftlb=5Fmm(patching=5Fmm);=0D=0A>_+?=
 =?utf-8?q?=09pte=5Funmap=5Funlock(patch=5Fmapping->ptep,_patch=5Fmapping-?=
 =?utf-8?q?>ptl);=0D=0A>___}=0D=0A>___=0D=0A>___static_int_do=5Fpatch=5Fin?=
 =?utf-8?q?struction(struct_ppc=5Finst_*addr,_struct_ppc=5Finst_instr)=0D?=
 =?utf-8?q?=0A>_@@_-180,32_+138,36_@@_static_int_do=5Fpatch=5Finstruction(?=
 =?utf-8?q?struct_ppc=5Finst_*addr,_struct_ppc=5Finst_instr)=0D=0A>___=09i?=
 =?utf-8?q?nt_err;=0D=0A>___=09struct_ppc=5Finst_*patch=5Faddr_=3D_NULL;?=
 =?utf-8?q?=0D=0A>___=09unsigned_long_flags;=0D=0A>_-=09unsigned_long_text?=
 =?utf-8?q?=5Fpoke=5Faddr;=0D=0A>_-=09unsigned_long_kaddr_=3D_(unsigned_lo?=
 =?utf-8?q?ng)addr;=0D=0A>_+=09struct_patch=5Fmapping_patch=5Fmapping;=0D?=
 =?utf-8?q?=0A>___=0D=0A>___=09/*=0D=0A>_-=09_*_During_early_early_boot_pa?=
 =?utf-8?q?tch=5Finstruction_is_called=0D=0A>_-=09_*_when_text=5Fpoke=5Far?=
 =?utf-8?q?ea_is_not_ready,_but_we_still_need=0D=0A>_-=09_*_to_allow_patch?=
 =?utf-8?q?ing._We_just_do_the_plain_old_patching=0D=0A>_+=09_*_The_patchi?=
 =?utf-8?q?ng=5Fmm_is_initialized_before_calling_mark=5Frodata=5Fro._Prior?=
 =?utf-8?q?=0D=0A>_+=09_*_to_this,_patch=5Finstruction_is_called_when_we_d?=
 =?utf-8?q?on't_have_(and_don't=0D=0A>_+=09_*_need)_the_patching=5Fmm_so_j?=
 =?utf-8?q?ust_do_plain_old_patching.=0D=0A>___=09_*/=0D=0A>_-=09if_(!this?=
 =?utf-8?q?=5Fcpu=5Fread(text=5Fpoke=5Farea))=0D=0A>_+=09if_(!patching=5Fm?=
 =?utf-8?q?m)=0D=0A>___=09=09return_raw=5Fpatch=5Finstruction(addr,_instr)?=
 =?utf-8?q?;=0D=0A>___=0D=0A>___=09local=5Firq=5Fsave(flags);=0D=0A>___=0D?=
 =?utf-8?q?=0A>_-=09text=5Fpoke=5Faddr_=3D_(unsigned_long)=5F=5Fthis=5Fcpu?=
 =?utf-8?q?=5Fread(text=5Fpoke=5Farea)->addr;=0D=0A>_-=09if_(map=5Fpatch?=
 =?utf-8?q?=5Farea(addr,_text=5Fpoke=5Faddr))_{=0D=0A>_-=09=09err_=3D_-1;?=
 =?utf-8?q?=0D=0A>_+=09err_=3D_map=5Fpatch(addr,_&patch=5Fmapping);=0D=0A>?=
 =?utf-8?q?_+=09if_(err)=0D=0A>___=09=09goto_out;=0D=0A>_-=09}=0D=0A>___?=
 =?utf-8?q?=0D=0A>_-=09patch=5Faddr_=3D_(struct_ppc=5Finst_*)(text=5Fpoke?=
 =?utf-8?q?=5Faddr_+_(kaddr_&_~PAGE=5FMASK));=0D=0A>_+=09patch=5Faddr_=3D_?=
 =?utf-8?q?(struct_ppc=5Finst_*)(patching=5Faddr_|_offset=5Fin=5Fpage(addr?=
 =?utf-8?q?));=0D=0A>___=0D=0A>_-=09=5F=5Fpatch=5Finstruction(addr,_instr,?=
 =?utf-8?q?_patch=5Faddr);=0D=0A>_+=09if_(!radix=5Fenabled())=0D=0A>_+=09?=
 =?utf-8?q?=09allow=5Fwrite=5Fto=5Fuser(patch=5Faddr,_sizeof(instr));=0D?=
 =?utf-8?q?=0A=0D=0ACan't_use_sizeof(instr),_you_have_to_use_ppc=5Finst=5F?=
 =?utf-8?q?size()=0D=0A=0D=0A>_+=09err_=3D_=5F=5Fpatch=5Finstruction(addr,?=
 =?utf-8?q?_instr,_patch=5Faddr);=0D=0A>_+=09if_(!radix=5Fenabled())=0D=0A?=
 =?utf-8?q?>_+=09=09prevent=5Fwrite=5Fto=5Fuser(patch=5Faddr,_sizeof(instr?=
 =?utf-8?q?));=0D=0A=0D=0ASame=0D=0A=0D=0A>___=0D=0A>_-=09err_=3D_unmap=5F?=
 =?utf-8?q?patch=5Farea(text=5Fpoke=5Faddr);=0D=0A>_-=09if_(err)=0D=0A>_-?=
 =?utf-8?q?=09=09pr=5Fwarn("failed_to_unmap_%lx\n",_text=5Fpoke=5Faddr);?=
 =?utf-8?q?=0D=0A>_+=09unmap=5Fpatch(&patch=5Fmapping);=0D=0A>_+=09/*=0D?=
 =?utf-8?q?=0A>_+=09_*_Something_is_wrong_if_what_we_just_wrote_doesn't_ma?=
 =?utf-8?q?tch_what_we=0D=0A>_+=09_*_think_we_just_wrote.=0D=0A>_+=09_*/?=
 =?utf-8?q?=0D=0A>_+=09WARN=5FON(!ppc=5Finst=5Fequal(ppc=5Finst=5Fread(add?=
 =?utf-8?q?r),_instr));=0D=0A>___=0D=0A>___out:=0D=0A>___=09local=5Firq=5F?=
 =?utf-8?q?restore(flags);=0D=0A>_=0D=0A=0D=0AChristophe=0D=0A?=
In-Reply-To: <7c72a249-dff1-ca22-393b-dabe35665375@csgroup.eu>
Originaldate: Wed Jun 3, 2020 at 9:12 AM
Date: Wed, 10 Jun 2020 22:31:34 -0500
Subject: Re: [PATCH 3/5] powerpc/lib: Use a temporary mm for code patching
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>, <kernel-hardening@lists.openwall.com>
Message-Id: <C3DYF0101J78.20JNRTHWY94LN@geist>
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

On Wed Jun 3, 2020 at 9:12 AM, Christophe Leroy wrote:
>
>=20
>
>=20
> Le 03/06/2020 =C3=A0 07:19, Christopher M. Riedl a =C3=A9crit :
> > Currently, code patching a STRICT_KERNEL_RWX exposes the temporary
> > mappings to other CPUs. These mappings should be kept local to the CPU
> > doing the patching. Use the pre-initialized temporary mm and patching
> > address for this purpose. Also add a check after patching to ensure the
> > patch succeeded.
> >=20
> > Use the KUAP functions on non-BOOKS3_64 platforms since the temporary
> > mapping for patching uses a userspace address (to keep the mapping
> > local). On BOOKS3_64 platforms hash does not implement KUAP and on radi=
x
> > the use of PAGE_KERNEL sets EAA[0] for the PTE which means the AMR
> > (KUAP) protection is ignored (see PowerISA v3.0b, Fig, 35).
> >=20
> > Based on x86 implementation:
> >=20
> > commit b3fd8e83ada0
> > ("x86/alternatives: Use temporary mm for text poking")
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> >   arch/powerpc/lib/code-patching.c | 148 ++++++++++++------------------=
-
> >   1 file changed, 55 insertions(+), 93 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 599114f63b44..df0765845204 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -20,6 +20,7 @@
> >   #include <asm/code-patching.h>
> >   #include <asm/setup.h>
> >   #include <asm/inst.h>
> > +#include <asm/mmu_context.h>
> >  =20
> >   static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc=
_inst instr,
> >   			       struct ppc_inst *patch_addr)
> > @@ -78,101 +79,58 @@ void __init poking_init(void)
> >   	pte_unmap_unlock(ptep, ptl);
> >   }
> >  =20
> > -static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> > -
> > -static int text_area_cpu_up(unsigned int cpu)
> > -{
> > -	struct vm_struct *area;
> > -
> > -	area =3D get_vm_area(PAGE_SIZE, VM_ALLOC);
> > -	if (!area) {
> > -		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
> > -			cpu);
> > -		return -1;
> > -	}
> > -	this_cpu_write(text_poke_area, area);
> > -
> > -	return 0;
> > -}
> > -
> > -static int text_area_cpu_down(unsigned int cpu)
> > -{
> > -	free_vm_area(this_cpu_read(text_poke_area));
> > -	return 0;
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
> > -	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > -		"powerpc/text_poke:online", text_area_cpu_up,
> > -		text_area_cpu_down));
> > -
> > -	return 0;
> > -}
> > -late_initcall(setup_text_poke_area);
> > +struct patch_mapping {
> > +	spinlock_t *ptl; /* for protecting pte table */
> > +	pte_t *ptep;
> > +	struct temp_mm temp_mm;
> > +};
> >  =20
> >   /*
> >    * This can be called for kernel text or a module.
> >    */
> > -static int map_patch_area(void *addr, unsigned long text_poke_addr)
> > +static int map_patch(const void *addr, struct patch_mapping *patch_map=
ping)
> >   {
> > -	unsigned long pfn;
> > -	int err;
> > +	struct page *page;
> > +	pte_t pte;
> > +	pgprot_t pgprot;
> >  =20
> >   	if (is_vmalloc_addr(addr))
> > -		pfn =3D vmalloc_to_pfn(addr);
> > +		page =3D vmalloc_to_page(addr);
> >   	else
> > -		pfn =3D __pa_symbol(addr) >> PAGE_SHIFT;
> > +		page =3D virt_to_page(addr);
> >  =20
> > -	err =3D map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KER=
NEL);
> > +	if (radix_enabled())
> > +		pgprot =3D PAGE_KERNEL;
> > +	else
> > +		pgprot =3D PAGE_SHARED;
> >  =20
> > -	pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, er=
r);
> > -	if (err)
> > +	patch_mapping->ptep =3D get_locked_pte(patching_mm, patching_addr,
> > +					     &patch_mapping->ptl);
> > +	if (unlikely(!patch_mapping->ptep)) {
> > +		pr_warn("map patch: failed to allocate pte for patching\n");
> >   		return -1;
> > +	}
> > +
> > +	pte =3D mk_pte(page, pgprot);
> > +	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
> > +		pte =3D pte_mkdirty(pte);
>
>=20
> Are you should you don't need the DIRTY bit for BOOK3S/64 non radix ?
>
>=20
> I think the DIRTY bit is needed always, and adding it when it is already
> there is harmless, so it should be done inconditionnnaly.
>

I tested this and it doesn't seem to make a differnce so I can make this
common in the next spin.

>=20
> > +	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, pte);
> > +
> > +	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> > +	use_temporary_mm(&patch_mapping->temp_mm);
> >  =20
> >   	return 0;
> >   }
> >  =20
> > -static inline int unmap_patch_area(unsigned long addr)
> > +static void unmap_patch(struct patch_mapping *patch_mapping)
> >   {
> > -	pte_t *ptep;
> > -	pmd_t *pmdp;
> > -	pud_t *pudp;
> > -	pgd_t *pgdp;
> > -
> > -	pgdp =3D pgd_offset_k(addr);
> > -	if (unlikely(!pgdp))
> > -		return -EINVAL;
> > -
> > -	pudp =3D pud_offset(pgdp, addr);
> > -	if (unlikely(!pudp))
> > -		return -EINVAL;
> > -
> > -	pmdp =3D pmd_offset(pudp, addr);
> > -	if (unlikely(!pmdp))
> > -		return -EINVAL;
> > -
> > -	ptep =3D pte_offset_kernel(pmdp, addr);
> > -	if (unlikely(!ptep))
> > -		return -EINVAL;
> > +	/* In hash, pte_clear flushes the tlb */
> > +	pte_clear(patching_mm, patching_addr, patch_mapping->ptep);
> > +	unuse_temporary_mm(&patch_mapping->temp_mm);
> >  =20
> > -	pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr);
> > -
> > -	/*
> > -	 * In hash, pte_clear flushes the tlb, in radix, we have to
> > -	 */
> > -	pte_clear(&init_mm, addr, ptep);
> > -	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > -
> > -	return 0;
> > +	/* In radix, we have to explicitly flush the tlb (no-op in hash) */
> > +	local_flush_tlb_mm(patching_mm);
> > +	pte_unmap_unlock(patch_mapping->ptep, patch_mapping->ptl);
> >   }
> >  =20
> >   static int do_patch_instruction(struct ppc_inst *addr, struct ppc_ins=
t instr)
> > @@ -180,32 +138,36 @@ static int do_patch_instruction(struct ppc_inst *=
addr, struct ppc_inst instr)
> >   	int err;
> >   	struct ppc_inst *patch_addr =3D NULL;
> >   	unsigned long flags;
> > -	unsigned long text_poke_addr;
> > -	unsigned long kaddr =3D (unsigned long)addr;
> > +	struct patch_mapping patch_mapping;
> >  =20
> >   	/*
> > -	 * During early early boot patch_instruction is called
> > -	 * when text_poke_area is not ready, but we still need
> > -	 * to allow patching. We just do the plain old patching
> > +	 * The patching_mm is initialized before calling mark_rodata_ro. Prio=
r
> > +	 * to this, patch_instruction is called when we don't have (and don't
> > +	 * need) the patching_mm so just do plain old patching.
> >   	 */
> > -	if (!this_cpu_read(text_poke_area))
> > +	if (!patching_mm)
> >   		return raw_patch_instruction(addr, instr);
> >  =20
> >   	local_irq_save(flags);
> >  =20
> > -	text_poke_addr =3D (unsigned long)__this_cpu_read(text_poke_area)->ad=
dr;
> > -	if (map_patch_area(addr, text_poke_addr)) {
> > -		err =3D -1;
> > +	err =3D map_patch(addr, &patch_mapping);
> > +	if (err)
> >   		goto out;
> > -	}
> >  =20
> > -	patch_addr =3D (struct ppc_inst *)(text_poke_addr + (kaddr & ~PAGE_MA=
SK));
> > +	patch_addr =3D (struct ppc_inst *)(patching_addr | offset_in_page(add=
r));
> >  =20
> > -	__patch_instruction(addr, instr, patch_addr);
> > +	if (!radix_enabled())
> > +		allow_write_to_user(patch_addr, sizeof(instr));
>
>=20
> Can't use sizeof(instr), you have to use ppc_inst_size()
>

Good catch, will fix this in the next spin (the other one below too).

>=20
> > +	err =3D __patch_instruction(addr, instr, patch_addr);
> > +	if (!radix_enabled())
> > +		prevent_write_to_user(patch_addr, sizeof(instr));
>
>=20
> Same
>
>=20
> >  =20
> > -	err =3D unmap_patch_area(text_poke_addr);
> > -	if (err)
> > -		pr_warn("failed to unmap %lx\n", text_poke_addr);
> > +	unmap_patch(&patch_mapping);
> > +	/*
> > +	 * Something is wrong if what we just wrote doesn't match what we
> > +	 * think we just wrote.
> > +	 */
> > +	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
> >  =20
> >   out:
> >   	local_irq_restore(flags);
> >=20
>
>=20
> Christophe
>
>=20
>
>=20

