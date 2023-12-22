Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1AF81C6D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 09:49:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=Ap96O9+G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxLZT50dBz3cVn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 19:49:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=Ap96O9+G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=matthias.schiffer@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxLYd5b1Zz3byh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 19:48:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1703234918; x=1734770918;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=oWIp5InUGyUzaylWZZL5A5hNc9Ub4HLtupMi0ioFdMs=;
  b=Ap96O9+GdoCuf2fOkzenMPNkdGF8omUlUIXUl2kEHN6MfXAYcQvwiZ/k
   4ifTuaGkyx/vqvawGJg7i1CB0/XmOdXOHbsdUU7UHmkqgoQZp2uG37Eig
   GTfYfn0DWC1N1DpOV/JNwF3wrkxEGV23zgAHla2rcNKoKkIkhX5kS4i1x
   zuhrFTeTnE1aQlT4Oiqt8McaXUoJfQr/k+AwfCDaJZ6UY1HvbK9m5jJfs
   7Mthx2cXjAjoajMLHNR2VKRWwXopfnQMXgM3P7T71UxXsa9HVpuYzAELO
   fb7/mzx9IgYWzygGLizH//L45h0+8L/N2BxEWdr+40o/zhLMJk7rHo6LQ
   g==;
X-IronPort-AV: E=Sophos;i="6.04,294,1695679200"; 
   d="scan'208";a="34649929"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Dec 2023 09:48:32 +0100
Received: from [192.168.2.128] (SCHIFFERM-M2.tq-net.de [10.121.53.15])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id B4A8D280075;
	Fri, 22 Dec 2023 09:48:31 +0100 (CET)
Message-ID: <b4eae5a8f451a3d253521a61b9625e3d7634f430.camel@ew.tq-group.com>
Subject: Re: [PATCH] powerpc/6xx: set High BAT Enable flag on G2 cores
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Fri, 22 Dec 2023 09:48:31 +0100
In-Reply-To: <2fad9563-09ee-4017-8a67-5958475d56c8@csgroup.eu>
References: <20231221124538.159706-1-matthias.schiffer@ew.tq-group.com>
	 <2fad9563-09ee-4017-8a67-5958475d56c8@csgroup.eu>
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

On Thu, 2023-12-21 at 13:57 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 21/12/2023 =C3=A0 13:45, Matthias Schiffer a =C3=A9crit=C2=A0:
> > MMU_FTR_USE_HIGH_BATS is set for G2-based cores (G2_LE, e300cX), but th=
e
> > high BATs need to be enabled in HID2 to work. Add register definitions
> > and introduce a G2 variant of __setup_cpu_603.
>=20
> Well spotted.
>=20
> I have a mpc8321, hence e300c2. I never had the problem you had.
>=20
> But ... looks like U-boot configuration has CONFIG_HID2_HBE so that's=20
> set by U-boot indeed, that's the reason why I never had that problem.

I'll extend the commit message to mention that U-Boot setting in v2.


>=20
> >=20
> > This fixes boot on CPUs like the MPC5200B with STRICT_KERNEL_RWX enable=
d.
> >=20
> > Fixes: e4d6654ebe6e ("powerpc/mm/32s: rework mmu_mapin_ram()")
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >   arch/powerpc/include/asm/cpu_setup.h      |  1 +
> >   arch/powerpc/include/asm/reg.h            |  2 ++
> >   arch/powerpc/kernel/cpu_setup_6xx.S       | 25 ++++++++++++++++++++++=
-
> >   arch/powerpc/kernel/cpu_specs_book3s_32.h | 10 ++++-----
> >   4 files changed, 32 insertions(+), 6 deletions(-)
> >=20
> >=20
> > I have only tested this on the MPC5200B (G2_LE), but according to the
> > e300 manual, e300cX cores should behave the same.
> >=20
> > The Fixes tag is the best I could come up with - I believe that the
> > underlying issue of setting USE_HIGH_BATS without actually enabling the=
m
> > is as old as Linux's PowerPC implementation, but the specific code
> > causing the boot failure was added in the mentioned commit.
>=20
> Agreed, before that only BATs 0 to 3 were used anyway.
> There was also BAT 4 used by platforms/embedded6xx/wii.c  , but that's=
=20
> probably not a G2 ?
>=20
> >=20
> > Another issue I found in the code is that
> > arch/powerpc/platforms/52xx/lite5200_sleep.S uses the SPRN_HID2 definit=
ion
> > which does not refer to HID2 on the 5200... but that will be for someon=
e
> > else to fix, if there is still anyone left using that platform.
>=20
> Maybe file an issue for it at https://github.com/linuxppc/issues/issues=
=20
> if you don't plan to fix it ?
>=20
> By the way, it looks like the SPRN_HID2 definition we have is very=20
> specific to the IBM 750.
>=20

IBM 750GX even - googling for IBM 750 came up with several other cores that=
 either don't have HID2,
or have it at a different SPR.


> MPC 750 has SPRN_HID2 as 1011 =3D=3D 0x3f3 like others.

> >=20
> >=20
> > diff --git a/arch/powerpc/include/asm/cpu_setup.h b/arch/powerpc/includ=
e/asm/cpu_setup.h
> > index 30e2fe3895024..68d804e74d221 100644
> > --- a/arch/powerpc/include/asm/cpu_setup.h
> > +++ b/arch/powerpc/include/asm/cpu_setup.h
> > @@ -35,6 +35,7 @@ void __setup_cpu_750fx(unsigned long offset, struct c=
pu_spec *spec);
> >   void __setup_cpu_7400(unsigned long offset, struct cpu_spec *spec);
> >   void __setup_cpu_7410(unsigned long offset, struct cpu_spec *spec);
> >   void __setup_cpu_745x(unsigned long offset, struct cpu_spec *spec);
> > +void __setup_cpu_g2(unsigned long offset, struct cpu_spec *spec);
> >=20
> >   void __setup_cpu_ppc970(unsigned long offset, struct cpu_spec *spec);
> >   void __setup_cpu_ppc970MP(unsigned long offset, struct cpu_spec *spec=
);
> > diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/=
reg.h
> > index 4ae4ab9090a2d..f5641fcd1da85 100644
> > --- a/arch/powerpc/include/asm/reg.h
> > +++ b/arch/powerpc/include/asm/reg.h
> > @@ -617,6 +617,8 @@
> >   #endif
> >   #define SPRN_HID2      0x3F8           /* Hardware Implementation Reg=
ister 2 */
>=20
> Should that HID2 be renamed to SPRN_HID2_750 to avoid confusion ?

Makes sense (should the suffix be "750GX"?). I can also add a FIXME comment=
 to lite5200_sleep.S as
part of the rename.


>
> >   #define SPRN_HID2_GEKKO        0x398           /* Gekko HID2 Register=
 */
> > +#define SPRN_HID2_G2   0x3F3           /* G2 HID2 Register */
> > +#define  HID2_HBE_G2   (1<<18)         /* High BAT Enable (G2) */
> >   #define SPRN_IABR      0x3F2   /* Instruction Address Breakpoint Regi=
ster */
> >   #define SPRN_IABR2     0x3FA           /* 83xx */
> >   #define SPRN_IBCR      0x135           /* 83xx Insn Breakpoint Contro=
l Reg */
> > diff --git a/arch/powerpc/kernel/cpu_setup_6xx.S b/arch/powerpc/kernel/=
cpu_setup_6xx.S
> > index f29ce3dd6140f..c67d32e04df9c 100644
> > --- a/arch/powerpc/kernel/cpu_setup_6xx.S
> > +++ b/arch/powerpc/kernel/cpu_setup_6xx.S
> > @@ -81,6 +81,20 @@ _GLOBAL(__setup_cpu_745x)
> >          bl      setup_745x_specifics
> >          mtlr    r5
> >          blr
> > +_GLOBAL(__setup_cpu_g2)
> > +       mflr    r5
> > +BEGIN_MMU_FTR_SECTION
> > +       li      r10,0
> > +       mtspr   SPRN_SPRG_603_LRU,r10           /* init SW LRU tracking=
 */
> > +END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
>=20
> MMU_FTR_NEED_DTLB_SW_LRU is dedicated to e300 core. You should also=20
> remove it from __setup_cpu_603

Will do, thanks.

>=20
> > +
> > +BEGIN_FTR_SECTION
> > +       bl      __init_fpu_registers
> > +END_FTR_SECTION_IFCLR(CPU_FTR_FPU_UNAVAILABLE)
> > +       bl      setup_common_caches
> > +       bl      setup_g2_hid2
> > +       mtlr    r5
> > +       blr
> >=20
> >   /* Enable caches for 603's, 604, 750 & 7400 */
> >   SYM_FUNC_START_LOCAL(setup_common_caches)
> > @@ -115,6 +129,16 @@ SYM_FUNC_START_LOCAL(setup_604_hid0)
> >          blr
> >   SYM_FUNC_END(setup_604_hid0)
> >=20
> > +/* Enable high BATs for G2 (G2_LE, e300cX) */
> > +SYM_FUNC_START_LOCAL(setup_g2_hid2)
> > +       mfspr   r11,SPRN_HID2_G2
> > +       oris    r11,r11,HID2_HBE_G2@h
> > +       mtspr   SPRN_HID2_G2,r11
> > +       sync
> > +       isync
> > +       blr
> > +SYM_FUNC_END(setup_g2_hid2)
> > +
> >   /* 7400 <=3D rev 2.7 and 7410 rev =3D 1.0 suffer from some
> >    * erratas we work around here.
> >    * Moto MPC710CE.pdf describes them, those are errata
> > @@ -495,4 +519,3 @@ _GLOBAL(__restore_cpu_setup)
> >          mtcr    r7
> >          blr
> >   _ASM_NOKPROBE_SYMBOL(__restore_cpu_setup)
> > -
> > diff --git a/arch/powerpc/kernel/cpu_specs_book3s_32.h b/arch/powerpc/k=
ernel/cpu_specs_book3s_32.h
> > index 3714634d194a1..83f054fcf837c 100644
> > --- a/arch/powerpc/kernel/cpu_specs_book3s_32.h
> > +++ b/arch/powerpc/kernel/cpu_specs_book3s_32.h
> > @@ -69,7 +69,7 @@ static struct cpu_spec cpu_specs[] __initdata =3D {
> >                  .mmu_features           =3D MMU_FTR_USE_HIGH_BATS,
> >                  .icache_bsize           =3D 32,
> >                  .dcache_bsize           =3D 32,
> > -               .cpu_setup              =3D __setup_cpu_603,
> > +               .cpu_setup              =3D __setup_cpu_g2,
> >                  .machine_check          =3D machine_check_generic,
> >                  .platform               =3D "ppc603",
> >          },
> > @@ -83,7 +83,7 @@ static struct cpu_spec cpu_specs[] __initdata =3D {
> >                  .mmu_features           =3D MMU_FTR_USE_HIGH_BATS,
> >                  .icache_bsize           =3D 32,
> >                  .dcache_bsize           =3D 32,
> > -               .cpu_setup              =3D __setup_cpu_603,
> > +               .cpu_setup              =3D __setup_cpu_g2,
> >                  .machine_check          =3D machine_check_83xx,
> >                  .platform               =3D "ppc603",
> >          },
> > @@ -96,7 +96,7 @@ static struct cpu_spec cpu_specs[] __initdata =3D {
> >                  .mmu_features           =3D MMU_FTR_USE_HIGH_BATS | MM=
U_FTR_NEED_DTLB_SW_LRU,
> >                  .icache_bsize           =3D 32,
> >                  .dcache_bsize           =3D 32,
> > -               .cpu_setup              =3D __setup_cpu_603,
> > +               .cpu_setup              =3D __setup_cpu_g2,
> >                  .machine_check          =3D machine_check_83xx,
> >                  .platform               =3D "ppc603",
> >          },
> > @@ -109,7 +109,7 @@ static struct cpu_spec cpu_specs[] __initdata =3D {
> >                  .mmu_features           =3D MMU_FTR_USE_HIGH_BATS | MM=
U_FTR_NEED_DTLB_SW_LRU,
> >                  .icache_bsize           =3D 32,
> >                  .dcache_bsize           =3D 32,
> > -               .cpu_setup              =3D __setup_cpu_603,
> > +               .cpu_setup              =3D __setup_cpu_g2,
> >                  .machine_check          =3D machine_check_83xx,
> >                  .num_pmcs               =3D 4,
> >                  .platform               =3D "ppc603",
> > @@ -123,7 +123,7 @@ static struct cpu_spec cpu_specs[] __initdata =3D {
> >                  .mmu_features           =3D MMU_FTR_USE_HIGH_BATS | MM=
U_FTR_NEED_DTLB_SW_LRU,
> >                  .icache_bsize           =3D 32,
> >                  .dcache_bsize           =3D 32,
> > -               .cpu_setup              =3D __setup_cpu_603,
> > +               .cpu_setup              =3D __setup_cpu_g2,
> >                  .machine_check          =3D machine_check_83xx,
> >                  .num_pmcs               =3D 4,
> >                  .platform               =3D "ppc603",
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
