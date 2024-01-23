Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E216838E25
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 13:06:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=DUaBTYRk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK5R36N7Cz3vcx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 23:06:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=DUaBTYRk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=matthias.schiffer@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK5QD00lhz3cWS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 23:05:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1706011540; x=1737547540;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=QyowHaKSq5r48J0lIW2adI/3JjSI0PpbZix4J7mH2Dw=;
  b=DUaBTYRk741HfPmQkf3ijXOu5IOYRIMH6/ZiN75pvXLCyE3ZsaMpJZWs
   96I/prQCJpqGj2EKWKWOE4ZWZGB6h9UsQ2kw9KR5OwrPuMHd8XQHANP2P
   l0irU3kdy64i8Zf9nOuR75e0EkSXOvYHBH8/AI3reIOYxrIIK/EB71aVe
   xMAsqmTJckCUPqsbHFLaDzGh+42BhlgTFf62IkB+oW8QEwyrJ8FVLNgf5
   zqOv3WKCNoPgCOdXHGw0+x4BQBC/U3NYOeEmFwy49MyYPc8RQrqWu48Tk
   ulZYxhVQiEzo9KG0Txn0PX3KYh+bfsdc4BdCXbDI9NV5MrqKLqZo126zt
   A==;
X-IronPort-AV: E=Sophos;i="6.05,214,1701126000"; 
   d="scan'208";a="35030276"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Jan 2024 13:05:31 +0100
Received: from [192.168.153.128] (SCHIFFERM-M3.tq-net.de [10.121.49.135])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 3CBFC280075;
	Tue, 23 Jan 2024 13:05:31 +0100 (CET)
Message-ID: <effe9e2c56baca76cbef09b0262c246478670bc2.camel@ew.tq-group.com>
Subject: Re: [PATCH] powerpc/6xx: set High BAT Enable flag on G2 cores
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Tue, 23 Jan 2024 13:05:30 +0100
In-Reply-To: <f8c2f1c8-0b43-47c6-9359-9aeeb14863eb@csgroup.eu>
References: <20231221124538.159706-1-matthias.schiffer@ew.tq-group.com>
	 <2fad9563-09ee-4017-8a67-5958475d56c8@csgroup.eu>
	 <b4eae5a8f451a3d253521a61b9625e3d7634f430.camel@ew.tq-group.com>
	 <ad3d0d4d-f63b-4704-b829-e630a69a6cf3@csgroup.eu>
	 <5610a6223b54a845185f28f54999ad72269b72f5.camel@ew.tq-group.com>
	 <f8c2f1c8-0b43-47c6-9359-9aeeb14863eb@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux@ew.tq-group.com" <linux@ew.tq-group.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2024-01-19 at 13:53 +0000, Christophe Leroy wrote:
>=20
> Le 19/01/2024 =C3=A0 14:41, Matthias Schiffer a =C3=A9crit=C2=A0:
> > >=20
> > > Thinking about it once more, can we do even more simple ?
> > >=20
> > > Why do we need that __setup_cpu_g2() at all ?
> > >=20
> > > You could just add the following into __set_cpu_603()
> > >=20
> > > diff --git a/arch/powerpc/kernel/cpu_setup_6xx.S
> > > b/arch/powerpc/kernel/cpu_setup_6xx.S
> > > index c67d32e04df9..7b41e3884866 100644
> > > --- a/arch/powerpc/kernel/cpu_setup_6xx.S
> > > +++ b/arch/powerpc/kernel/cpu_setup_6xx.S
> > > @@ -21,6 +21,11 @@ BEGIN_MMU_FTR_SECTION
> > >        li      r10,0
> > >        mtspr   SPRN_SPRG_603_LRU,r10           /* init SW LRU trackin=
g */
> > >    END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
> > > +BEGIN_MMU_FTR_SECTION
> > > +     mfspr   r11,SPRN_HID2_G2
> > > +     oris    r11,r11,HID2_HBE_G2@h
> > > +     mtspr   SPRN_HID2_G2,r11
> > > +END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
> > >=20
> > >    BEGIN_FTR_SECTION
> > >        bl      __init_fpu_registers
> > > ---
> > >=20
> > > By the way, as your register is named SPRN_HID2_G2, the bit would bet=
ter
> > > be named HID2_G2_HBE instead of HID2_HBE_G2 I think.
> >=20
> > My intention was to keep this consistent with the SPRN_HID2_GEKKO defin=
e.
>=20
> I don't understand what you mean. I can't see any bits defined for=20
> HID2_GEKKO.
>=20
> What I see which is simitar is the definition of TSC register for CELL CP=
U.
>=20
> #define SPRN_TSC_CELL	0x399	/* Thread switch control on Cell */
> #define   TSC_CELL_DEC_ENABLE_0	0x400000 /* Decrementer Interrupt */
> #define   TSC_CELL_DEC_ENABLE_1	0x200000 /* Decrementer Interrupt */
> #define   TSC_CELL_EE_ENABLE	0x100000 /* External Interrupt */
> #define   TSC_CELL_EE_BOOST	0x080000 /* External Interrupt Boost */
>=20
>=20
> They don't call it TSC_EE_BOOST_CELL or TSC_EE_ENABLE_CELL

Ah sorry, I got things mixed up. Will change the define to HID2_G2_HBE (or =
maybe HID_G2_LE_HBE?)
in v2.

Regards,
Matthias


>=20
>=20
> Christophe
>=20
> >=20
> > Regards,
> > Matthias
> >=20
> >=20
> >=20
> >=20
> > >=20
> > > Christophe
> > >=20
> > > >=20
> > > > >=20
> > > > > > +
> > > > > > +BEGIN_FTR_SECTION
> > > > > > +       bl      __init_fpu_registers
> > > > > > +END_FTR_SECTION_IFCLR(CPU_FTR_FPU_UNAVAILABLE)
> > > > > > +       bl      setup_common_caches
> > > > > > +       bl      setup_g2_hid2
> > > > > > +       mtlr    r5
> > > > > > +       blr
> > > > > >=20
> > > > > >     /* Enable caches for 603's, 604, 750 & 7400 */
> > > > > >     SYM_FUNC_START_LOCAL(setup_common_caches)
> > > > > > @@ -115,6 +129,16 @@ SYM_FUNC_START_LOCAL(setup_604_hid0)
> > > > > >            blr
> > > > > >     SYM_FUNC_END(setup_604_hid0)
> > > > > >=20
> > > > > > +/* Enable high BATs for G2 (G2_LE, e300cX) */
> > > > > > +SYM_FUNC_START_LOCAL(setup_g2_hid2)
> > > > > > +       mfspr   r11,SPRN_HID2_G2
> > > > > > +       oris    r11,r11,HID2_HBE_G2@h
> > > > > > +       mtspr   SPRN_HID2_G2,r11
> > > > > > +       sync
> > > > > > +       isync
> > > > > > +       blr
> > > > > > +SYM_FUNC_END(setup_g2_hid2)
> > > > > > +
> > > > > >     /* 7400 <=3D rev 2.7 and 7410 rev =3D 1.0 suffer from some
> > > > > >      * erratas we work around here.
> > > > > >      * Moto MPC710CE.pdf describes them, those are errata
> > > > > > @@ -495,4 +519,3 @@ _GLOBAL(__restore_cpu_setup)
> > > > > >            mtcr    r7
> > > > > >            blr
> > > > > >     _ASM_NOKPROBE_SYMBOL(__restore_cpu_setup)
> > > > > > -
> > > > > > diff --git a/arch/powerpc/kernel/cpu_specs_book3s_32.h b/arch/p=
owerpc/kernel/cpu_specs_book3s_32.h
> > > > > > index 3714634d194a1..83f054fcf837c 100644
> > > > > > --- a/arch/powerpc/kernel/cpu_specs_book3s_32.h
> > > > > > +++ b/arch/powerpc/kernel/cpu_specs_book3s_32.h
> > > > > > @@ -69,7 +69,7 @@ static struct cpu_spec cpu_specs[] __initdata=
 =3D {
> > > > > >                    .mmu_features           =3D MMU_FTR_USE_HIGH=
_BATS,
> > > > > >                    .icache_bsize           =3D 32,
> > > > > >                    .dcache_bsize           =3D 32,
> > > > > > -               .cpu_setup              =3D __setup_cpu_603,
> > > > > > +               .cpu_setup              =3D __setup_cpu_g2,
> > > > > >                    .machine_check          =3D machine_check_ge=
neric,
> > > > > >                    .platform               =3D "ppc603",
> > > > > >            },
> > > > > > @@ -83,7 +83,7 @@ static struct cpu_spec cpu_specs[] __initdata=
 =3D {
> > > > > >                    .mmu_features           =3D MMU_FTR_USE_HIGH=
_BATS,
> > > > > >                    .icache_bsize           =3D 32,
> > > > > >                    .dcache_bsize           =3D 32,
> > > > > > -               .cpu_setup              =3D __setup_cpu_603,
> > > > > > +               .cpu_setup              =3D __setup_cpu_g2,
> > > > > >                    .machine_check          =3D machine_check_83=
xx,
> > > > > >                    .platform               =3D "ppc603",
> > > > > >            },
> > > > > > @@ -96,7 +96,7 @@ static struct cpu_spec cpu_specs[] __initdata=
 =3D {
> > > > > >                    .mmu_features           =3D MMU_FTR_USE_HIGH=
_BATS | MMU_FTR_NEED_DTLB_SW_LRU,
> > > > > >                    .icache_bsize           =3D 32,
> > > > > >                    .dcache_bsize           =3D 32,
> > > > > > -               .cpu_setup              =3D __setup_cpu_603,
> > > > > > +               .cpu_setup              =3D __setup_cpu_g2,
> > > > > >                    .machine_check          =3D machine_check_83=
xx,
> > > > > >                    .platform               =3D "ppc603",
> > > > > >            },
> > > > > > @@ -109,7 +109,7 @@ static struct cpu_spec cpu_specs[] __initda=
ta =3D {
> > > > > >                    .mmu_features           =3D MMU_FTR_USE_HIGH=
_BATS | MMU_FTR_NEED_DTLB_SW_LRU,
> > > > > >                    .icache_bsize           =3D 32,
> > > > > >                    .dcache_bsize           =3D 32,
> > > > > > -               .cpu_setup              =3D __setup_cpu_603,
> > > > > > +               .cpu_setup              =3D __setup_cpu_g2,
> > > > > >                    .machine_check          =3D machine_check_83=
xx,
> > > > > >                    .num_pmcs               =3D 4,
> > > > > >                    .platform               =3D "ppc603",
> > > > > > @@ -123,7 +123,7 @@ static struct cpu_spec cpu_specs[] __initda=
ta =3D {
> > > > > >                    .mmu_features           =3D MMU_FTR_USE_HIGH=
_BATS | MMU_FTR_NEED_DTLB_SW_LRU,
> > > > > >                    .icache_bsize           =3D 32,
> > > > > >                    .dcache_bsize           =3D 32,
> > > > > > -               .cpu_setup              =3D __setup_cpu_603,
> > > > > > +               .cpu_setup              =3D __setup_cpu_g2,
> > > > > >                    .machine_check          =3D machine_check_83=
xx,
> > > > > >                    .num_pmcs               =3D 4,
> > > > > >                    .platform               =3D "ppc603",
> > > > > > --
> > > > > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 S=
eefeld, Germany
> > > > > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > > > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl=
, Stefan Schneider
> > > > > > https://www.tq-group.com/
> > > >=20
> > > > --
> > > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefe=
ld, Germany
> > > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, St=
efan Schneider
> > > > https://www.tq-group.com/
> >=20
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
