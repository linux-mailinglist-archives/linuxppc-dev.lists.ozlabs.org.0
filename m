Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB491F332C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 06:48:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gyL32DPKzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 14:48:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gyJS4y5szDqQw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 14:46:48 +1000 (AEST)
Received: from MTA-09-3.privateemail.com (mta-09.privateemail.com
 [198.54.127.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 2685080830
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 00:46:46 -0400 (EDT)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 67E0E60041;
 Tue,  9 Jun 2020 00:46:41 -0400 (EDT)
Received: from localhost (unknown [10.20.151.221])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 158986003F;
 Tue,  9 Jun 2020 04:46:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <6fcbff8c-fe24-f35c-ec95-84fdaa3b869c@csgroup.eu>
Originaldate: Wed Jun 3, 2020 at 9:20 AM
Originalfrom: "Christophe Leroy" <christophe.leroy@csgroup.eu>
Original: =?utf-8?q?=0D=0A=0D=0ALe_03/06/2020_
 =C3=A0_07:19,_Christopher_M._Riedl_a_?= =?utf-8?q?=C3=A9crit=C2=A0:
 =0D=0A>_When_live_patching_with_STRICT=5FKERNE?= =?utf-8?q?L
 =5FRWX,_the_CPU_doing_the_patching=0D=0A>_must_use_a_temporary?=
 =?utf-8?q?_mapping_which_allows_for_writing_to_kernel_text.=0D=0A>_During?=
 =?utf-8?q?_the_entire_window_of_time_when_this_temporary_mapping_is_in_us?=
 =?utf-8?q?e,=0D=0A>_another_CPU_could_write_to_the_same_mapping_and_malic?=
 =?utf-8?q?iously_alter_kernel=0D=0A>_text._Implement_a_LKDTM_test_to_atte?=
 =?utf-8?q?mpt_to_exploit_such_a_openings_when=0D=0A>_a_CPU_is_patching_un?=
 =?utf-8?q?der_STRICT=5FKERNEL=5FRWX._The_test_is_only_implemented=0D=0A>_?=
 =?utf-8?q?on_powerpc_for_now.=0D=0A>_=0D=0A>_The_LKDTM_"hijack"_test_work?=
 =?utf-8?q?s_as_follows:=0D=0A>_=0D=0A>_=091._A_CPU_executes_an_infinite_l?=
 =?utf-8?q?oop_to_patch_an_instruction.=0D=0A>_=09___This_is_the_"patching?=
 =?utf-8?q?"_CPU.=0D=0A>_=092._Another_CPU_attempts_to_write_to_the_addres?=
 =?utf-8?q?s_of_the_temporary=0D=0A>_=09___mapping_used_by_the_"patching"_?=
 =?utf-8?q?CPU._This_other_CPU_is_the=0D=0A>_=09___"hijacker"_CPU._The_hij?=
 =?utf-8?q?ack_either_fails_with_a_segfault_or=0D=0A>_=09___succeeds,_in_w?=
 =?utf-8?q?hich_case_some_kernel_text_is_now_overwritten.=0D=0A>_=0D=0A>_H?=
 =?utf-8?q?ow_to_run_the_test:=0D=0A>_=0D=0A>_=09mount_-t_debugfs_none_/sy?=
 =?utf-8?q?s/kernel/debug=0D=0A>_=09(echo_HIJACK=5FPATCH_>_/sys/kernel/deb?=
 =?utf-8?q?ug/provoke-crash/DIRECT)=0D=0A>_=0D=0A>_Signed-off-by:_Christop?=
 =?utf-8?q?her_M._Riedl_<cmr@informatik.wtf>=0D=0A>_---=0D=0A>___drivers/m?=
 =?utf-8?q?isc/lkdtm/core.c__|___1_+=0D=0A>___drivers/misc/lkdtm/lkdtm.h_|?=
 =?utf-8?q?___1_+=0D=0A>___drivers/misc/lkdtm/perms.c_|_101_++++++++++++++?=
 =?utf-8?q?+++++++++++++++++++++++=0D=0A>___3_files_changed,_103_insertion?=
 =?utf-8?q?s(+)=0D=0A>_=0D=0A>_diff_--git_a/drivers/misc/lkdtm/core.c_b/dr?=
 =?utf-8?q?ivers/misc/lkdtm/core.c=0D=0A>_index_a5e344df9166..482e72f6a1e1?=
 =?utf-8?q?_100644=0D=0A>_---_a/drivers/misc/lkdtm/core.c=0D=0A>_+++_b/dri?=
 =?utf-8?q?vers/misc/lkdtm/core.c=0D=0A>_@@_-145,6_+145,7_@@_static_const_?=
 =?utf-8?q?struct_crashtype_crashtypes[]_=3D_{=0D=0A>___=09CRASHTYPE(WRITE?=
 =?utf-8?q?=5FRO),=0D=0A>___=09CRASHTYPE(WRITE=5FRO=5FAFTER=5FINIT),=0D=0A?=
 =?utf-8?q?>___=09CRASHTYPE(WRITE=5FKERN),=0D=0A>_+=09CRASHTYPE(HIJACK=5FP?=
 =?utf-8?q?ATCH),=0D=0A>___=09CRASHTYPE(REFCOUNT=5FINC=5FOVERFLOW),=0D=0A>?=
 =?utf-8?q?___=09CRASHTYPE(REFCOUNT=5FADD=5FOVERFLOW),=0D=0A>___=09CRASHTY?=
 =?utf-8?q?PE(REFCOUNT=5FINC=5FNOT=5FZERO=5FOVERFLOW),=0D=0A>_diff_--git_a?=
 =?utf-8?q?/drivers/misc/lkdtm/lkdtm.h_b/drivers/misc/lkdtm/lkdtm.h=0D=0A>?=
 =?utf-8?q?_index_601a2156a0d4..bfcf3542370d_100644=0D=0A>_---_a/drivers/m?=
 =?utf-8?q?isc/lkdtm/lkdtm.h=0D=0A>_+++_b/drivers/misc/lkdtm/lkdtm.h=0D=0A?=
 =?utf-8?q?>_@@_-62,6_+62,7_@@_void_lkdtm=5FEXEC=5FUSERSPACE(void);=0D=0A>?=
 =?utf-8?q?___void_lkdtm=5FEXEC=5FNULL(void);=0D=0A>___void_lkdtm=5FACCESS?=
 =?utf-8?q?=5FUSERSPACE(void);=0D=0A>___void_lkdtm=5FACCESS=5FNULL(void);?=
 =?utf-8?q?=0D=0A>_+void_lkdtm=5FHIJACK=5FPATCH(void);=0D=0A>___=0D=0A>___?=
 =?utf-8?q?/*_lkdtm=5Frefcount.c_*/=0D=0A>___void_lkdtm=5FREFCOUNT=5FINC?=
 =?utf-8?q?=5FOVERFLOW(void);=0D=0A>_diff_--git_a/drivers/misc/lkdtm/perms?=
 =?utf-8?q?.c_b/drivers/misc/lkdtm/perms.c=0D=0A>_index_62f76d506f04..8bda?=
 =?utf-8?q?3b56bc78_100644=0D=0A>_---_a/drivers/misc/lkdtm/perms.c=0D=0A>_?=
 =?utf-8?q?+++_b/drivers/misc/lkdtm/perms.c=0D=0A>_@@_-9,6_+9,7_@@=0D=0A>_?=
 =?utf-8?q?__#include_<linux/vmalloc.h>=0D=0A>___#include_<linux/mman.h>?=
 =?utf-8?q?=0D=0A>___#include_<linux/uaccess.h>=0D=0A>_+#include_<linux/kt?=
 =?utf-8?q?hread.h>=0D=0A>___#include_<asm/cacheflush.h>=0D=0A>___=0D=0A>_?=
 =?utf-8?q?__/*_Whether_or_not_to_fill_the_target_memory_area_with_do=5Fno?=
 =?utf-8?q?thing()._*/=0D=0A>_@@_-213,6_+214,106_@@_void_lkdtm=5FACCESS=5F?=
 =?utf-8?q?NULL(void)=0D=0A>___=09*ptr_=3D_tmp;=0D=0A>___}=0D=0A>___=0D=0A?=
 =?utf-8?q?>_+#if_defined(CONFIG=5FPPC)_&&_defined(CONFIG=5FSTRICT=5FKERNE?=
 =?utf-8?q?L=5FRWX)=0D=0A=0D=0AWhy_only_PPC_=3F_I_understood_that_this_app?=
 =?utf-8?q?lies_also_to_x86._And_=0D=0Aregarless,_the_test_should_be_able_?=
 =?utf-8?q?to_run_on_other_architectures,_=0D=0Aallthought_for_sure_it_wil?=
 =?utf-8?q?l_fail._That's_the_case_for_other_tests.=0D=0A=0D=0A>_+#include?=
 =?utf-8?q?_<include/asm/code-patching.h>=0D=0A>_+=0D=0A>_+extern_unsigned?=
 =?utf-8?q?_long_read=5Fcpu=5Fpatching=5Faddr(unsigned_int_cpu);=0D=0A=0D?=
 =?utf-8?q?=0A'extern'_keyword_is_useless_for_functions_and_shall_be_banne?=
 =?utf-8?q?d.=0D=0A=0D=0AShouldn't_this_declaration_be_in_asm/code-patchin?=
 =?utf-8?q?g.h_=3F=0D=0A=0D=0A>_+=0D=0A>_+static_struct_ppc=5Finst_*_const?=
 =?utf-8?q?_patch=5Fsite_=3D_(struct_ppc=5Finst_*)&do=5Fnothing;=0D=0A>_+?=
 =?utf-8?q?=0D=0A>_+static_int_lkdtm=5Fpatching=5Fcpu(void_*data)=0D=0A>_+?=
 =?utf-8?q?{=0D=0A>_+=09int_err_=3D_0;=0D=0A>_+=09struct_ppc=5Finst_insn_?=
 =?utf-8?q?=3D_ppc=5Finst(0xdeadbeef);=0D=0A>_+=0D=0A>_+=09pr=5Finfo("star?=
 =?utf-8?q?ting_patching=5Fcpu=3D%d\n",_smp=5Fprocessor=5Fid());=0D=0A>_+?=
 =?utf-8?q?=09do_{=0D=0A>_+=09=09err_=3D_patch=5Finstruction(patch=5Fsite,?=
 =?utf-8?q?_insn);=0D=0A>_+=09}_while_(ppc=5Finst=5Fequal(ppc=5Finst=5Frea?=
 =?utf-8?q?d(READ=5FONCE(patch=5Fsite)),_insn)_&&=0D=0A>_+=09=09=09!err_&&?=
 =?utf-8?q?_!kthread=5Fshould=5Fstop());=0D=0A>_+=0D=0A>_+=09if_(err)=0D?=
 =?utf-8?q?=0A>_+=09=09pr=5Fwarn("patch=5Finstruction_returned_error:_%d\n?=
 =?utf-8?q?",_err);=0D=0A>_+=0D=0A>_+=09set=5Fcurrent=5Fstate(TASK=5FINTER?=
 =?utf-8?q?RUPTIBLE);=0D=0A>_+=09while_(!kthread=5Fshould=5Fstop())_{=0D?=
 =?utf-8?q?=0A>_+=09=09schedule();=0D=0A>_+=09=09set=5Fcurrent=5Fstate(TAS?=
 =?utf-8?q?K=5FINTERRUPTIBLE);=0D=0A>_+=09}=0D=0A>_+=0D=0A>_+=09return_err?=
 =?utf-8?q?;=0D=0A>_+}=0D=0A>_+=0D=0A>_+void_lkdtm=5FHIJACK=5FPATCH(void)?=
 =?utf-8?q?=0D=0A>_+{=0D=0A>_+=09struct_task=5Fstruct_*patching=5Fkthrd;?=
 =?utf-8?q?=0D=0A>_+=09struct_ppc=5Finst_original=5Finsn;=0D=0A>_+=09int_p?=
 =?utf-8?q?atching=5Fcpu,_hijacker=5Fcpu,_attempts;=0D=0A>_+=09unsigned_lo?=
 =?utf-8?q?ng_addr;=0D=0A>_+=09bool_hijacked;=0D=0A>_+=0D=0A>_+=09if_(num?=
 =?utf-8?q?=5Fonline=5Fcpus()_<_2)_{=0D=0A>_+=09=09pr=5Fwarn("need_at_leas?=
 =?utf-8?q?t_two_cpus\n");=0D=0A>_+=09=09return;=0D=0A>_+=09}=0D=0A>_+=0D?=
 =?utf-8?q?=0A>_+=09original=5Finsn_=3D_ppc=5Finst=5Fread(READ=5FONCE(patc?=
 =?utf-8?q?h=5Fsite));=0D=0A>_+=0D=0A>_+=09hijacker=5Fcpu_=3D_smp=5Fproces?=
 =?utf-8?q?sor=5Fid();=0D=0A>_+=09patching=5Fcpu_=3D_cpumask=5Fany=5Fbut(c?=
 =?utf-8?q?pu=5Fonline=5Fmask,_hijacker=5Fcpu);=0D=0A>_+=0D=0A>_+=09patchi?=
 =?utf-8?q?ng=5Fkthrd_=3D_kthread=5Fcreate=5Fon=5Fnode(&lkdtm=5Fpatching?=
 =?utf-8?q?=5Fcpu,_NULL,=0D=0A>_+=09=09=09=09=09=09cpu=5Fto=5Fnode(patchin?=
 =?utf-8?q?g=5Fcpu),=0D=0A>_+=09=09=09=09=09=09"lkdtm=5Fpatching=5Fcpu");?=
 =?utf-8?q?=0D=0A>_+=09kthread=5Fbind(patching=5Fkthrd,_patching=5Fcpu);?=
 =?utf-8?q?=0D=0A>_+=09wake=5Fup=5Fprocess(patching=5Fkthrd);=0D=0A>_+=0D?=
 =?utf-8?q?=0A>_+=09addr_=3D_offset=5Fin=5Fpage(patch=5Fsite)_|_read=5Fcpu?=
 =?utf-8?q?=5Fpatching=5Faddr(patching=5Fcpu);=0D=0A>_+=0D=0A>_+=09pr=5Fin?=
 =?utf-8?q?fo("starting_hijacker=5Fcpu=3D%d\n",_hijacker=5Fcpu);=0D=0A>_+?=
 =?utf-8?q?=09for_(attempts_=3D_0;_attempts_<_100000;_++attempts)_{=0D=0A>?=
 =?utf-8?q?_+=09=09/*_Use_=5F=5Fput=5Fuser_to_catch_faults_without_an_Oops?=
 =?utf-8?q?_*/=0D=0A>_+=09=09hijacked_=3D_!=5F=5Fput=5Fuser(0xbad00bad,_(u?=
 =?utf-8?q?nsigned_int_*)addr);=0D=0A>_+=0D=0A>_+=09=09if_(hijacked)_{=0D?=
 =?utf-8?q?=0A>_+=09=09=09if_(kthread=5Fstop(patching=5Fkthrd))=0D=0A>_+?=
 =?utf-8?q?=09=09=09=09goto_out;=0D=0A>_+=09=09=09break;=0D=0A>_+=09=09}?=
 =?utf-8?q?=0D=0A>_+=09}=0D=0A>_+=09pr=5Finfo("hijack_attempts:_%d\n",_att?=
 =?utf-8?q?empts);=0D=0A>_+=0D=0A>_+=09if_(hijacked)_{=0D=0A>_+=09=09if_(*?=
 =?utf-8?q?(unsigned_int_*)READ=5FONCE(patch=5Fsite)_=3D=3D_0xbad00bad)=0D?=
 =?utf-8?q?=0A>_+=09=09=09pr=5Ferr("overwrote_kernel_text\n");=0D=0A>_+=09?=
 =?utf-8?q?=09/*=0D=0A>_+=09=09_*_There_are_window_conditions_where_the_hi?=
 =?utf-8?q?jacker_cpu_manages_to=0D=0A>_+=09=09_*_write_to_the_patch_site_?=
 =?utf-8?q?but_the_site_gets_overwritten_again_by=0D=0A>_+=09=09_*_the_pat?=
 =?utf-8?q?ching_cpu._We_still_consider_that_a_"successful"_hijack=0D=0A>_?=
 =?utf-8?q?+=09=09_*_since_the_hijacker_cpu_did_not_fault_on_the_write.=0D?=
 =?utf-8?q?=0A>_+=09=09_*/=0D=0A>_+=09=09pr=5Ferr("FAIL:_wrote_to_another_?=
 =?utf-8?q?cpu's_patching_area\n");=0D=0A>_+=09}_else_{=0D=0A>_+=09=09kthr?=
 =?utf-8?q?ead=5Fstop(patching=5Fkthrd);=0D=0A>_+=09}=0D=0A>_+=0D=0A>_+out?=
 =?utf-8?q?:=0D=0A>_+=09/*_Restore_the_original_insn_for_any_future_lkdtm_?=
 =?utf-8?q?tests_*/=0D=0A>_+=09patch=5Finstruction(patch=5Fsite,_original?=
 =?utf-8?q?=5Finsn);=0D=0A>_+}=0D=0A>_+=0D=0A>_+#else=0D=0A>_+=0D=0A>_+voi?=
 =?utf-8?q?d_lkdtm=5FHIJACK=5FPATCH(void)=0D=0A>_+{=0D=0A>_+=09if_(!IS=5FE?=
 =?utf-8?q?NABLED(CONFIG=5FPPC))=0D=0A>_+=09=09pr=5Ferr("XFAIL:_this_test_?=
 =?utf-8?q?is_powerpc-only\n");=0D=0A>_+=09if_(!IS=5FENABLED(CONFIG=5FSTRI?=
 =?utf-8?q?CT=5FKERNEL=5FRWX))=0D=0A>_+=09=09pr=5Ferr("XFAIL:_this_test_re?=
 =?utf-8?q?quires_CONFIG=5FSTRICT=5FKERNEL=5FRWX\n");=0D=0A>_+}=0D=0A>_+?=
 =?utf-8?q?=0D=0A>_+#endif_/*_CONFIG=5FPPC_&&_CONFIG=5FSTRICT=5FKERNEL=5FR?=
 =?utf-8?q?WX_*/=0D=0A>_+=0D=0A>___void_=5F=5Finit_lkdtm=5Fperms=5Finit(vo?=
 =?utf-8?q?id)=0D=0A>___{=0D=0A>___=09/*_Make_sure_we_can_write_to_=5F=5Fr?=
 =?utf-8?q?o=5Fafter=5Finit_values_during_=5F=5Finit_*/=0D=0A>_=0D=0A=0D?=
 =?utf-8?q?=0AChristophe=0D=0A?=
Date: Mon, 08 Jun 2020 23:48:33 -0500
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>, <kernel-hardening@lists.openwall.com>
Subject: Re: [PATCH 5/5] powerpc: Add LKDTM test to hijack a patch mapping
Message-Id: <C3CASUZ4AV39.P3GJNYIARL4V@geist>
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

On Wed Jun 3, 2020 at 9:20 AM, Christophe Leroy wrote:
>
>=20
>
>=20
> Le 03/06/2020 =C3=A0 07:19, Christopher M. Riedl a =C3=A9crit :
> > When live patching with STRICT_KERNEL_RWX, the CPU doing the patching
> > must use a temporary mapping which allows for writing to kernel text.
> > During the entire window of time when this temporary mapping is in use,
> > another CPU could write to the same mapping and maliciously alter kerne=
l
> > text. Implement a LKDTM test to attempt to exploit such a openings when
> > a CPU is patching under STRICT_KERNEL_RWX. The test is only implemented
> > on powerpc for now.
> >=20
> > The LKDTM "hijack" test works as follows:
> >=20
> > 	1. A CPU executes an infinite loop to patch an instruction.
> > 	   This is the "patching" CPU.
> > 	2. Another CPU attempts to write to the address of the temporary
> > 	   mapping used by the "patching" CPU. This other CPU is the
> > 	   "hijacker" CPU. The hijack either fails with a segfault or
> > 	   succeeds, in which case some kernel text is now overwritten.
> >=20
> > How to run the test:
> >=20
> > 	mount -t debugfs none /sys/kernel/debug
> > 	(echo HIJACK_PATCH > /sys/kernel/debug/provoke-crash/DIRECT)
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> >   drivers/misc/lkdtm/core.c  |   1 +
> >   drivers/misc/lkdtm/lkdtm.h |   1 +
> >   drivers/misc/lkdtm/perms.c | 101 ++++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 103 insertions(+)
> >=20
> > diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> > index a5e344df9166..482e72f6a1e1 100644
> > --- a/drivers/misc/lkdtm/core.c
> > +++ b/drivers/misc/lkdtm/core.c
> > @@ -145,6 +145,7 @@ static const struct crashtype crashtypes[] =3D {
> >   	CRASHTYPE(WRITE_RO),
> >   	CRASHTYPE(WRITE_RO_AFTER_INIT),
> >   	CRASHTYPE(WRITE_KERN),
> > +	CRASHTYPE(HIJACK_PATCH),
> >   	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
> >   	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
> >   	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
> > diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
> > index 601a2156a0d4..bfcf3542370d 100644
> > --- a/drivers/misc/lkdtm/lkdtm.h
> > +++ b/drivers/misc/lkdtm/lkdtm.h
> > @@ -62,6 +62,7 @@ void lkdtm_EXEC_USERSPACE(void);
> >   void lkdtm_EXEC_NULL(void);
> >   void lkdtm_ACCESS_USERSPACE(void);
> >   void lkdtm_ACCESS_NULL(void);
> > +void lkdtm_HIJACK_PATCH(void);
> >  =20
> >   /* lkdtm_refcount.c */
> >   void lkdtm_REFCOUNT_INC_OVERFLOW(void);
> > diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> > index 62f76d506f04..8bda3b56bc78 100644
> > --- a/drivers/misc/lkdtm/perms.c
> > +++ b/drivers/misc/lkdtm/perms.c
> > @@ -9,6 +9,7 @@
> >   #include <linux/vmalloc.h>
> >   #include <linux/mman.h>
> >   #include <linux/uaccess.h>
> > +#include <linux/kthread.h>
> >   #include <asm/cacheflush.h>
> >  =20
> >   /* Whether or not to fill the target memory area with do_nothing(). *=
/
> > @@ -213,6 +214,106 @@ void lkdtm_ACCESS_NULL(void)
> >   	*ptr =3D tmp;
> >   }
> >  =20
> > +#if defined(CONFIG_PPC) && defined(CONFIG_STRICT_KERNEL_RWX)
>
>=20
> Why only PPC ? I understood that this applies also to x86. And
> regarless, the test should be able to run on other architectures,
> allthought for sure it will fail. That's the case for other tests.
>

I think the code patching details are different between architectures
and (for now) I am only comfortable enough with PPC to implement
something meaningful. The intent of the RFC versions was to try to get
some interest (hence the distribution to the hardening list) or feedback
about how this could work on other architectures.

There are a few other tests which are arch specific in LKDTM so it's not
completely unheard of :)

>=20
> > +#include <include/asm/code-patching.h>
> > +
> > +extern unsigned long read_cpu_patching_addr(unsigned int cpu);
>
>=20
> 'extern' keyword is useless for functions and shall be banned.
>
>=20
> Shouldn't this declaration be in asm/code-patching.h ?
>

Yes, left-over from the RFC version, this will be fixed in the next
spin.

>=20
> > +
> > +static struct ppc_inst * const patch_site =3D (struct ppc_inst *)&do_n=
othing;
> > +
> > +static int lkdtm_patching_cpu(void *data)
> > +{
> > +	int err =3D 0;
> > +	struct ppc_inst insn =3D ppc_inst(0xdeadbeef);
> > +
> > +	pr_info("starting patching_cpu=3D%d\n", smp_processor_id());
> > +	do {
> > +		err =3D patch_instruction(patch_site, insn);
> > +	} while (ppc_inst_equal(ppc_inst_read(READ_ONCE(patch_site)), insn) &=
&
> > +			!err && !kthread_should_stop());
> > +
> > +	if (err)
> > +		pr_warn("patch_instruction returned error: %d\n", err);
> > +
> > +	set_current_state(TASK_INTERRUPTIBLE);
> > +	while (!kthread_should_stop()) {
> > +		schedule();
> > +		set_current_state(TASK_INTERRUPTIBLE);
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +void lkdtm_HIJACK_PATCH(void)
> > +{
> > +	struct task_struct *patching_kthrd;
> > +	struct ppc_inst original_insn;
> > +	int patching_cpu, hijacker_cpu, attempts;
> > +	unsigned long addr;
> > +	bool hijacked;
> > +
> > +	if (num_online_cpus() < 2) {
> > +		pr_warn("need at least two cpus\n");
> > +		return;
> > +	}
> > +
> > +	original_insn =3D ppc_inst_read(READ_ONCE(patch_site));
> > +
> > +	hijacker_cpu =3D smp_processor_id();
> > +	patching_cpu =3D cpumask_any_but(cpu_online_mask, hijacker_cpu);
> > +
> > +	patching_kthrd =3D kthread_create_on_node(&lkdtm_patching_cpu, NULL,
> > +						cpu_to_node(patching_cpu),
> > +						"lkdtm_patching_cpu");
> > +	kthread_bind(patching_kthrd, patching_cpu);
> > +	wake_up_process(patching_kthrd);
> > +
> > +	addr =3D offset_in_page(patch_site) | read_cpu_patching_addr(patching=
_cpu);
> > +
> > +	pr_info("starting hijacker_cpu=3D%d\n", hijacker_cpu);
> > +	for (attempts =3D 0; attempts < 100000; ++attempts) {
> > +		/* Use __put_user to catch faults without an Oops */
> > +		hijacked =3D !__put_user(0xbad00bad, (unsigned int *)addr);
> > +
> > +		if (hijacked) {
> > +			if (kthread_stop(patching_kthrd))
> > +				goto out;
> > +			break;
> > +		}
> > +	}
> > +	pr_info("hijack attempts: %d\n", attempts);
> > +
> > +	if (hijacked) {
> > +		if (*(unsigned int *)READ_ONCE(patch_site) =3D=3D 0xbad00bad)
> > +			pr_err("overwrote kernel text\n");
> > +		/*
> > +		 * There are window conditions where the hijacker cpu manages to
> > +		 * write to the patch site but the site gets overwritten again by
> > +		 * the patching cpu. We still consider that a "successful" hijack
> > +		 * since the hijacker cpu did not fault on the write.
> > +		 */
> > +		pr_err("FAIL: wrote to another cpu's patching area\n");
> > +	} else {
> > +		kthread_stop(patching_kthrd);
> > +	}
> > +
> > +out:
> > +	/* Restore the original insn for any future lkdtm tests */
> > +	patch_instruction(patch_site, original_insn);
> > +}
> > +
> > +#else
> > +
> > +void lkdtm_HIJACK_PATCH(void)
> > +{
> > +	if (!IS_ENABLED(CONFIG_PPC))
> > +		pr_err("XFAIL: this test is powerpc-only\n");
> > +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> > +		pr_err("XFAIL: this test requires CONFIG_STRICT_KERNEL_RWX\n");
> > +}
> > +
> > +#endif /* CONFIG_PPC && CONFIG_STRICT_KERNEL_RWX */
> > +
> >   void __init lkdtm_perms_init(void)
> >   {
> >   	/* Make sure we can write to __ro_after_init values during __init */
> >=20
>
>=20
> Christophe
>
>=20
>
>=20

