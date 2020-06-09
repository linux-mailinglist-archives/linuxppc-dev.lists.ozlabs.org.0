Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE14D1F3329
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 06:40:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gy990qPhzDqTM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 14:40:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gy7P49D5zDqJk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 14:38:57 +1000 (AEST)
Received: from MTA-11-4.privateemail.com (mta-11.privateemail.com
 [198.54.118.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 6DE3380892
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 00:38:53 -0400 (EDT)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 79D728004A;
 Tue,  9 Jun 2020 00:38:48 -0400 (EDT)
Received: from localhost (unknown [10.20.151.231])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 3365F80046;
 Tue,  9 Jun 2020 04:38:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Originaldate: Wed Jun 3, 2020 at 9:14 AM
Originalfrom: "Christophe Leroy" <christophe.leroy@csgroup.eu>
Original: =?utf-8?q?=0D=0A=0D=0ALe_03/06/2020_
 =C3=A0_07:19,_Christopher_M._Riedl_a_?= =?utf-8?q?=C3=A9crit=C2=A0:
 =0D=0A>_When_live_patching_a_STRICT=5FRWX_kern?=
 =?utf-8?q?el,_a_mapping_is_installed_at_a=0D=0A>_"patching_address"_with_?=
 =?utf-8?q?temporary_write_permissions._Provide_a=0D=0A>_LKDTM-only_access?=
 =?utf-8?q?or_function_for_this_address_in_preparation_for_a_LKDTM=0D=0A>_?=
 =?utf-8?q?test_which_attempts_to_"hijack"_this_mapping_by_writing_to_it_f?=
 =?utf-8?q?rom=0D=0A>_another_CPU.=0D=0A>_=0D=0A>_Signed-off-by:_Christoph?=
 =?utf-8?q?er_M._Riedl_<cmr@informatik.wtf>=0D=0A>_---=0D=0A>___arch/power?=
 =?utf-8?q?pc/lib/code-patching.c_|_7_+++++++=0D=0A>___1_file_changed,_7_i?=
 =?utf-8?q?nsertions(+)=0D=0A>_=0D=0A>_diff_--git_a/arch/powerpc/lib/code-?=
 =?utf-8?q?patching.c_b/arch/powerpc/lib/code-patching.c=0D=0A>_index_df07?=
 =?utf-8?q?65845204..c23453049116_100644=0D=0A>_---_a/arch/powerpc/lib/cod?=
 =?utf-8?q?e-patching.c=0D=0A>_+++_b/arch/powerpc/lib/code-patching.c=0D?=
 =?utf-8?q?=0A>_@@_-52,6_+52,13_@@_int_raw=5Fpatch=5Finstruction(struct_pp?=
 =?utf-8?q?c=5Finst_*addr,_struct_ppc=5Finst_instr)=0D=0A>___static_struct?=
 =?utf-8?q?_mm=5Fstruct_*patching=5Fmm_=5F=5Fro=5Fafter=5Finit;=0D=0A>___s?=
 =?utf-8?q?tatic_unsigned_long_patching=5Faddr_=5F=5Fro=5Fafter=5Finit;=0D?=
 =?utf-8?q?=0A>___=0D=0A>_+#ifdef_CONFIG=5FLKDTM=0D=0A>_+unsigned_long_rea?=
 =?utf-8?q?d=5Fcpu=5Fpatching=5Faddr(unsigned_int_cpu)=0D=0A=0D=0AIf_this_?=
 =?utf-8?q?fonction_is_not_static,_it_means_it_is_intended_to_be_used_from?=
 =?utf-8?q?_=0D=0Asome_other_C_file,_so_it_should_be_declared_in_a_.h_too.?=
 =?utf-8?q?=0D=0A=0D=0AChristophe=0D=0A=0D=0A>_+{=0D=0A>_+=09return_patchi?=
 =?utf-8?q?ng=5Faddr;=0D=0A>_+}=0D=0A>_+#endif=0D=0A>_+=0D=0A>___void_=5F?=
 =?utf-8?q?=5Finit_poking=5Finit(void)=0D=0A>___{=0D=0A>___=09spinlock=5Ft?=
 =?utf-8?q?_*ptl;_/*_for_protecting_pte_table_*/=0D=0A>_=0D=0A?=
In-Reply-To: <a458667c-fb8d-a01f-130b-0fef733dd001@csgroup.eu>
Date: Mon, 08 Jun 2020 23:40:41 -0500
Subject: Re: [PATCH 4/5] powerpc/lib: Add LKDTM accessor for patching addr
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>, <kernel-hardening@lists.openwall.com>
Message-Id: <C3CAMU7CT62Z.1A5IZ7HO4BF80@geist>
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

On Wed Jun 3, 2020 at 9:14 AM, Christophe Leroy wrote:
>
>=20
>
>=20
> Le 03/06/2020 =C3=A0 07:19, Christopher M. Riedl a =C3=A9crit :
> > When live patching a STRICT_RWX kernel, a mapping is installed at a
> > "patching address" with temporary write permissions. Provide a
> > LKDTM-only accessor function for this address in preparation for a LKDT=
M
> > test which attempts to "hijack" this mapping by writing to it from
> > another CPU.
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> >   arch/powerpc/lib/code-patching.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >=20
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index df0765845204..c23453049116 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -52,6 +52,13 @@ int raw_patch_instruction(struct ppc_inst *addr, str=
uct ppc_inst instr)
> >   static struct mm_struct *patching_mm __ro_after_init;
> >   static unsigned long patching_addr __ro_after_init;
> >  =20
> > +#ifdef CONFIG_LKDTM
> > +unsigned long read_cpu_patching_addr(unsigned int cpu)
>
>=20
> If this fonction is not static, it means it is intended to be used from
> some other C file, so it should be declared in a .h too.
>
Yup agreed. This was left-over from the RFC to simplify using the LKDTM
test on a tree without this series. Will fix this in the next spin.
>=20
> Christophe
>
>=20
> > +{
> > +	return patching_addr;
> > +}
> > +#endif
> > +
> >   void __init poking_init(void)
> >   {
> >   	spinlock_t *ptl; /* for protecting pte table */
> >=20
>
>=20
>
>=20

