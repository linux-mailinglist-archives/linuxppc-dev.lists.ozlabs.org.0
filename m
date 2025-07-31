Return-Path: <linuxppc-dev+bounces-10489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B14B17510
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 18:40:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btFDz5x5dz2yF1;
	Fri,  1 Aug 2025 02:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=98.137.69.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753980019;
	cv=none; b=jblXJEnLdnpumyTrEH5vXaIMacF9Diom1Cd1v+MSes1mJdblnfTKNGM/6t6j3OhZfh+3AQ9vPU5KqzLrbYLb2Cn8R31CY7platN3ty6gthDTLEYs2Cas+SPIMgEf/gCIhxtILaBS7zGaEo0jZ8RAcfRkCnB9l0QdrytTSbAeeE4nBMwexus8nldoqrNzxjpmWbmhtOXYSdrRdTMkHPz2fjjmeptvdjB0fm3yqW189ai2yWCMmGg+vCbQfRvfx+ebqU0U67ELkGEA53YMaGIhXTE966diHNHrh4QcHFK98X9uW45Mo7Seje3q3AFnZFx61ToaTksaVSBF/l5zaU14Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753980019; c=relaxed/relaxed;
	bh=iMnATmascgGeczYNNRglDU5ZHw3NEt2KENIz1qbn3Q8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KlSC3aGIrYKRDIkV3sNBGK3yYt8h9YqNEMYtfMPZWeUrHJ9BdnCVIrL2k6P5GYziLH/kOAE/Pr+37LeErGaOO4hhya0zfFW4AguocXJE5mchowI068a75MZPGwi7fwjCM24MPfXovBUh2chxAXuPblt+ItR5Dfrsv5yvfoGalETR+HIwj017SWT3Ey/ardLZIB8kBFinZ9PiMRPXhs5ySzJkDdvmBT8QjjdJeKEhn8SMWOIRxr/22f/uBiQTKYytnC7cIWo42QMXgXg0JfBkh6Kii0p0yg44XknE/KlaHTVC+ct6zTyGys0lA/M0MivB3KlYs//l+1HVl4ZACMvgdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=aol.com; dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.a=rsa-sha256 header.s=a2048 header.b=D11bLsUO; dkim-atps=neutral; spf=pass (client-ip=98.137.69.147; helo=sonic.asd.mail.yahoo.com; envelope-from=rubenru09@aol.com; receiver=lists.ozlabs.org) smtp.mailfrom=aol.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.a=rsa-sha256 header.s=a2048 header.b=D11bLsUO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aol.com (client-ip=98.137.69.147; helo=sonic.asd.mail.yahoo.com; envelope-from=rubenru09@aol.com; receiver=lists.ozlabs.org)
Received: from sonic.asd.mail.yahoo.com (sonic310-21.consmr.mail.gq1.yahoo.com [98.137.69.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btFDy0N2Kz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 02:40:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1753980012; bh=iMnATmascgGeczYNNRglDU5ZHw3NEt2KENIz1qbn3Q8=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=D11bLsUOcXzdbmqmQTJL24barx+C0ZWNKBeaF0MjqQh+k5HOL0K+BPuImqCBBZuLBiNYEuQcfUV5F7S5O7GIUlWdzN6dNS8rSkh2oG9ylBlUb/JOyxm9GuGXY8hI8OUssEXdBDG/LKcJYJq6n1rvWXvYnpE7hJw2jhw3Cb1xeU/xepKBuxldEkHI/Zz/lq5byAYnB6kuqZPGIWYOpCIVZPJITqv4glpwZy3ZufNr4XZqCPhH8v4XiYkBhR62X3PDFx12BLIfZGSiFjrw79BdIQfbdEhg6UODfjkcKf09MCc6/UV/+XTJ5n4pwatTaVsEXIqdbWwec0phkJVP7ofMTA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1753980012; bh=5tfK7uKjkP6OZjE61iZ1Bar60GWySvK55PYPcs9YDED=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=Vlj2mJm+paBXz6d+Ta2vD0uncuPsnsofi38CoXGK+hs6ozMNLFTlXbczTv4XlXrDMpV+rsANgS39bdTwfHceBL9pb03p/HBuUNtuLq1sZo2Jm7PTB7F1FKngv69t3GJ8e5qiqoC2LGXUTOHcBabJN9CKqZ/8vFyGDypfS1hP0EWvVYjr0LnuKmPE/Np86rGw+Rj9853AmQF+q+ikx9H1gTNQAcua5WtkYS7lWjM7SBY8HZ3CoJW2WrM6yhmkjZJlBrE2i+YqdpaXIEK9176biN5sWwL/tuMC8xPI6mYlTkHg/e8rcBAffR515iCqq/4tbktYlfX43GBxFFB+FjUfNg==
X-YMail-OSG: kgh7gwoVM1mpHEWZyKNv4B1NlwMuyOdzYnZ_JwFzjWZSiMB17vhDp6mtFO8wFN6
 WMTJUHOy_ff.JHpBVkJZVde2bEHN13vcHLVUQKJdT0TUYMHpcK3Hb7MTZAd0z6KcHN5p5UGUM0zL
 Yjqn3yLr0hdjZde3DCJhvru8LcPWYuFHF6eQNaBkDTH2dKDMj_aiRgbNFDPFS2.NXBQluAnrmbcv
 Q.M2p5lo0WnR3XRCibcpQRCTfs3MFwVM0_oUZqXUfB8qx0oiwXcZx4oDCzSFTGrYBZIpR_vldHog
 t_jXoNXavHumW7hnzcqrT_85.4zi1w7VI4DeDJAd9fJB75z.1jpXDft6JyhTxsi.fqh6lAPD1GP6
 2wLfbQDY9u2.pHosAlWe5HxHgdtCbs__SkPzIrtDjRJfPm5TUaQpRkWRjCMnijx5sdE4wzzx.jb8
 eWstmqXhK1lyxzBPGgkl9.CbhnnF_P12Tf0FuudSLgzPBzeNT7JFXV7rLY_qzYN7vAolo0CbCCns
 rJ3cU5cADUS9UzwWiGY3QlvIdCBNJjYaqgubFQnV3wX.7rTgox0odb2BawxtGt5MN4X2j9sRU77w
 MOg1eqVQgbdECT170xP.ADMqKuOF_pXOVCq2EJErTtiVKUvwzc28kfTkfkDO4su19QEQGrkbdTub
 .FMap440sxalHO0un_aBw7rA0rjorJC6bNvJF0V24QLMZnGUNXRz0or.UtbKeI5DwcGyLMoaL_q6
 Il0FoPboefWQOyqSUFH65wmndOinMcpU1J2oQFUv0_dl39sb8G0eWE5Kx6DrBUrbvQkTCcEMVfyf
 jFaKKvkfCUCCsDvmiRWyTEEgqqegErDtLx84VEK5yvtqCDRqaZtkdoM_KauT0h2psunAk7T_LAlH
 XLGEZIeFSprEEwSi4_i_vwjLAFwaCQFYdcI6AKRn92TrX.T1x5lSp8Q6UVtOnDEXkLE3UIdDecmM
 n.gscNeUocgs3jwJhnEx3dHU8tccUaQ9Jg_ytKz2s0ONXGGe0MHtnuToIi2Wh7x5meyldQZ.f1ol
 WYT17EP5fS4sZzXLz6Wb1lqPI9b31ZH2qKCj6UMU4mrA4KGYk5f6WBtj4ZO.C4bqpY8X22vFp852
 E4XCFpBNPCZXbYwNR5bWT3VbQwO5JiZ_JSczhg3OPQTnOOJLTgL0fp.slr1r5zQhN4a5SchIdOK4
 dSwKZu5Kldn8JPkJVLsR2EVgdB9iAEDn7yIQooXD3flAzszVGekAK_tqA8Myn.uUWEJdWrnKvVzv
 nPVrKehQum9StSfi28EToAn1t6yg_SKteeIt91weRB0lb4mWo_CkK3UG2R3r1rfckZe9MidwO1gR
 0QbOwKqNXLEI9S8IQcwdlo8FnnrdYzGJ7j3jWfdYK.qXrLTiOOPgU5U.0zGK_qigBFyYeXNJOvl9
 yHkivzncKKPCCbZpa2I4Lw1vyiO89fa.wIEhB76TJhRUSyutA4XBzts.qa8WpdXOdiDODYhccEZQ
 q2E.3dXRzuS2IcY7CS8oyZdQMr8g4Aj87avPUPLAidieRTzVIYgRDMWv18BVotJhIP2dKSJaYSeP
 6UZ5iyNZ.azRdUruMKKYXYK4lNKXqLWUQ2ZLB7WPrzW_KBiY1ZrvHUQNsIsxh9pY6GjHz21aoftY
 oNg6pS3.fUD0lClTGx9sT0bD4x81bz343nXw1XuwWvKxWXScr9xQv8_Q5.wLXzBXTHcL2h_Sfb3z
 fenT67eAfbZoMwBXcAUGSzsJWoCIfoOo9mJ4EgKWCADtLgeNycidHpThuKpMMpwh6Pc8t.zo5_Sq
 XLC5ZRA3Zax3rKLsnsrSUWK4CKDRDGt2hCm0IAjEiJbgX0EbTUvKXMhrZqdReWfppYbvr74oJXl0
 AB52SWm5l3Mh9gONy0UCShJb2g3cMgoJ8P2NBnVH5GR8Xe0T4dZ9aE714SejPkKm872YjkOMc9Yv
 GKFCFe_2ZK8ot.C_Qox6A7xYSBDiQPbK_QeBmSzxqtcpKAjGhIx6sOkZtSyuqLUOICvS8SAdz4cj
 Rp3nwnlAdd03ovvagD.XDVsJXm2lDQ8mOq.mSiHzUK5RbgxHUmbn6Dd5VY0kNiteJ6wIRY0aDvvl
 aDjMdmGElPFqtB713.rZjkEaRBgMbkcY58VriDskVAnzuIrZlxRvj3R0uH7iLN2cr6qXyBPIl8wz
 K3q6JCMHRPRVrc69QMJSTtuqtduxzcNUKKMCzZeSikDhKbLeLmwfVabuihqOYedY9s5RnhOW8wIl
 d_7kx6A--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: a36ced8b-cb9a-42a8-bef4-8460bcebc97d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.gq1.yahoo.com with HTTP; Thu, 31 Jul 2025 16:40:12 +0000
Received: by hermes--production-ir2-858bd4ff7b-9r9sx (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d00c2078b76ee3e43b9910e86da44ded;
          Thu, 31 Jul 2025 16:40:07 +0000 (UTC)
Message-ID: <8381a142d72f3cd0e92de4dac6acfc0241a87365.camel@aol.com>
Subject: Re: [PATCH] powerpc/xmon: replace sizeof calculations with
 ARRAY_SIZE macro
From: Ruben Wauters <rubenru09@aol.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan Srinivasan	
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin	 <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Date: Thu, 31 Jul 2025 17:40:05 +0100
In-Reply-To: <62aa5231-ed31-43e2-84b7-d6b6ec86e78d@csgroup.eu>
References: <20250719225225.2132-2-rubenru09.ref@aol.com>
	 <20250719225225.2132-2-rubenru09@aol.com>
	 <62aa5231-ed31-43e2-84b7-d6b6ec86e78d@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Mailer: WebService/1.1.24260 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-07-30 at 08:14 +0200, Christophe Leroy wrote:
>=20
>=20
> Le 20/07/2025 =C3=A0 00:43, Ruben Wauters a =C3=A9crit=C2=A0:
> > [Vous ne recevez pas souvent de courriers de rubenru09@aol.com.
> > D=C3=A9couvrez pourquoi ceci est important =C3=A0
> > https://aka.ms/LearnAboutSenderIdentification=C2=A0]
> >=20
> > The calculations for operand/opcode/macro numbers are done in an
> > identical manner to the already existing ARRAY_SIZE macro in
> > linux/array_size.h
> >=20
> > This patch replaces the sizeof calculations with the macro to make
> > the
> > code cleaner and more immediately obvious what it is doing.
> >=20
> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > ---
> > =C2=A0 arch/powerpc/xmon/ppc-opc.c | 16 ++++++----------
>=20
> This file is mostly taken from binutils, refer commit 08d96e0b127e=20
> ("powerpc/xmon: Apply binutils changes to upgrade disassembly").
>=20
> I think your change should be done in binutils then backported to the
> kernel. The more we diverge from binutils the worse it is

While this is somewhat reasonable, the header (linux/array_size.h) is
linux specific, and is included through kernel.h

I can probably see if binutils has a similar header, or if they would
accept an equivalent header to make the file equivalent, but I'm unsure
if they would

Ruben

> Christophe
>=20
>=20
> > =C2=A0 1 file changed, 6 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-
> > opc.c
> > index 0774d711453e..de9b4236728c 100644
> > --- a/arch/powerpc/xmon/ppc-opc.c
> > +++ b/arch/powerpc/xmon/ppc-opc.c
> > @@ -954,8 +954,7 @@ const struct powerpc_operand powerpc_operands[]
> > =3D
> > =C2=A0=C2=A0=C2=A0 { 0xff, 11, NULL, NULL, PPC_OPERAND_SIGNOPT },
> > =C2=A0 };
> >=20
> > -const unsigned int num_powerpc_operands =3D (sizeof
> > (powerpc_operands)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 / sizeof
> > (powerpc_operands[0]));
> > +const unsigned int num_powerpc_operands =3D
> > ARRAY_SIZE(powerpc_operands);
> >=20
> > =C2=A0 /* The functions used to insert and extract complicated
> > operands.=C2=A0 */
> >=20
> > @@ -6968,9 +6967,8 @@ const struct powerpc_opcode powerpc_opcodes[]
> > =3D {
> > =C2=A0 {"fcfidu.",=C2=A0=C2=A0=C2=A0 XRC(63,974,1),=C2=A0 XRA_MASK, POW=
ER7|PPCA2,
> > PPCVLE,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {FRT, FRB}},
> > =C2=A0 };
> >=20
> > -const int powerpc_num_opcodes =3D
> > -=C2=A0 sizeof (powerpc_opcodes) / sizeof (powerpc_opcodes[0]);
> > -
> > +const int powerpc_num_opcodes =3D ARRAY_SIZE(powerpc_opcodes);
> > +
> > =C2=A0 /* The VLE opcode table.
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 The format of this opcode table is the same as=
 the main opcode
> > table.=C2=A0 */
> > @@ -7207,9 +7205,8 @@ const struct powerpc_opcode vle_opcodes[] =3D {
> > =C2=A0 {"se_bl",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BD8(58,0,1),=C2=A0=C2=A0=
=C2=A0 BD8_MASK,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PPCVLE,
> > 0,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 {B8}},
> > =C2=A0 };
> >=20
> > -const int vle_num_opcodes =3D
> > -=C2=A0 sizeof (vle_opcodes) / sizeof (vle_opcodes[0]);
> > -
> > +const int vle_num_opcodes =3D ARRAY_SIZE(vle_opcodes);
> > +
> > =C2=A0 /* The macro table.=C2=A0 This is only used by the assembler.=C2=
=A0 */
> >=20
> > =C2=A0 /* The expressions of the form (-x ! 31) & (x | 31) have the
> > value 0
> > @@ -7276,5 +7273,4 @@ const struct powerpc_macro powerpc_macros[] =3D
> > {
> > =C2=A0 {"e_clrlslwi",4, PPCVLE, "e_rlwinm %0,%1,%3,(%2)-(%3),31-(%3)"},
> > =C2=A0 };
> >=20
> > -const int powerpc_num_macros =3D
> > -=C2=A0 sizeof (powerpc_macros) / sizeof (powerpc_macros[0]);
> > +const int powerpc_num_macros =3D ARRAY_SIZE(powerpc_macros);
> > --
> > 2.49.1
> >=20

