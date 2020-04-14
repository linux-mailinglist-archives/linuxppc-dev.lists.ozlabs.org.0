Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B6A1A73AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 08:27:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491bBy59SfzDqCG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 16:27:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491b8S69xwzDq6q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 16:25:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=XEQBNgUU; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 491b8R6PfYz9sSt; Tue, 14 Apr 2020 16:25:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586845543;
 bh=uEH5LAwtpcdLGU0lKQ8WRrkiPMOAl5BsxGpDf7qHgGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XEQBNgUU5RcPyT3rZM0XykfCiS5hEzP5FE7uvhErC+hI649HnDdaD2b9WTox1r1Oj
 popVl5Z8csA3Sj0q9haKZre4/klW/JVngFnokTBxRjg/eIkZJXqjKJ3xJ6X2jannkt
 M0S/nSXgYMxpC6zMm+K4VooTXa62twhBw2EDwEzY=
Date: Tue, 14 Apr 2020 14:40:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: Boot flakiness with QEMU 3.1.0 and Clang built kernels
Message-ID: <20200414044010.GK48061@umbus.fritz.box>
References: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
 <1586564375.zt8lm9finh.astroid@bobo.none>
 <20200411005354.GA24145@ubuntu-s3-xlarge-x86>
 <1586597161.xyshvdbjo6.astroid@bobo.none>
 <1586612535.6kk4az03np.astroid@bobo.none>
 <20200414020553.GD48061@umbus.fritz.box>
 <20200414040515.GA22855@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9JSHP372f+2dzJ8X"
Content-Disposition: inline
In-Reply-To: <20200414040515.GA22855@ubuntu-s3-xlarge-x86>
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux@googlegroups.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--9JSHP372f+2dzJ8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2020 at 09:05:15PM -0700, Nathan Chancellor wrote:
> On Tue, Apr 14, 2020 at 12:05:53PM +1000, David Gibson wrote:
> > On Sat, Apr 11, 2020 at 11:57:23PM +1000, Nicholas Piggin wrote:
> > > Nicholas Piggin's on April 11, 2020 7:32 pm:
> > > > Nathan Chancellor's on April 11, 2020 10:53 am:
> > > >> The tt.config values are needed to reproduce but I did not verify =
that
> > > >> ONLY tt.config was needed. Other than that, no, we are just buildi=
ng
> > > >> either pseries_defconfig or powernv_defconfig with those configs a=
nd
> > > >> letting it boot up with a simple initramfs, which prints the versi=
on
> > > >> string then shuts the machine down.
> > > >>=20
> > > >> Let me know if you need any more information, cheers!
> > > >=20
> > > > Okay I can reproduce it. Sometimes it eventually recovers after a l=
ong
> > > > pause, and some keyboard input often helps it along. So that seems =
like=20
> > > > it might be a lost interrupt.
> > > >=20
> > > > POWER8 vs POWER9 might just be a timing thing if P9 is still hanging
> > > > sometimes. I wasn't able to reproduce it with defconfig+tt.config, I
> > > > needed your other config with various other debug options.
> > > >=20
> > > > Thanks for the very good report. I'll let you know what I find.
> > >=20
> > > It looks like a qemu bug. Booting with '-d int' shows the decrementer=
=20
> > > simply stops firing at the point of the hang, even though MSR[EE]=3D1=
 and=20
> > > the DEC register is wrapping. Linux appears to be doing the right thi=
ng=20
> > > as far as I can tell (not losing interrupts).
> > >=20
> > > This qemu patch fixes the boot hang for me. I don't know that qemu=20
> > > really has the right idea of "context synchronizing" as defined in the
> > > powerpc architecture -- mtmsrd L=3D1 is not context synchronizing but=
 that
> > > does not mean it can avoid looking at exceptions until the next such
> > > event. It looks like the decrementer exception goes high but the
> > > execution of mtmsrd L=3D1 is ignoring it.
> > >=20
> > > Prior to the Linux patch 3282a3da25b you bisected to, interrupt replay
> > > code would return with an 'rfi' instruction as part of interrupt retu=
rn,
> > > which probably helped to get things moving along a bit. However it wo=
uld
> > > not be foolproof, and Cedric did say he encountered some mysterious
> > > lockups under load with qemu powernv before that patch was merged, so
> > > maybe it's the same issue?
> > >=20
> > > Thanks,
> > > Nick
> > >=20
> > > The patch is a bit of a hack, but if you can run it and verify it fix=
es
> > > your boot hang would be good.
> >=20
> > So a bug in this handling wouldn't surprise me at all.  However a
> > report against QEMU 3.1 isn't particularly useful.
> >=20
> >  * Does the problem occur with current upstream master qemu?
>=20
> Yes, I can reproduce the hang on 5.0.0-rc2.

Ok.

Nick, can you polish up your fix shortly and submit upstream in the
usual fashion?

> >  * Does the problem occur with qemu-2.12 (a pretty widely deployed
> >    "stable" qemu, e.g. in RHEL)?
>=20
> No idea but I would assume so. I might have time later this week to test
> but I assume it is kind of irrelevant if it is reproducible at ToT.
>=20
> > > ---
> > >=20
> > > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > > index b207fb5386..1d997f5c32 100644
> > > --- a/target/ppc/translate.c
> > > +++ b/target/ppc/translate.c
> > > @@ -4364,12 +4364,21 @@ static void gen_mtmsrd(DisasContext *ctx)
> > >      if (ctx->opcode & 0x00010000) {
> > >          /* Special form that does not need any synchronisation */
> > >          TCGv t0 =3D tcg_temp_new();
> > > +        TCGv t1 =3D tcg_temp_new();
> > >          tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
> > >                          (1 << MSR_RI) | (1 << MSR_EE));
> > > -        tcg_gen_andi_tl(cpu_msr, cpu_msr,
> > > +        tcg_gen_andi_tl(t1, cpu_msr,
> > >                          ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE=
)));
> > > -        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
> > > +        tcg_gen_or_tl(t1, t1, t0);
> > > +
> > > +        gen_update_nip(ctx, ctx->base.pc_next);
> > > +        gen_helper_store_msr(cpu_env, t1);
> > >          tcg_temp_free(t0);
> > > +        tcg_temp_free(t1);
> > > +        /* Must stop the translation as machine state (may have) cha=
nged */
> > > +        /* Note that mtmsr is not always defined as context-synchron=
izing */
> > > +        gen_stop_exception(ctx);
> > > +
> > >      } else {
> > >          /*
> > >           * XXX: we need to update nip before the store if we enter
> > >=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9JSHP372f+2dzJ8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6VPqgACgkQbDjKyiDZ
s5LQ4hAAiszktfJyjf69flxQVUji0VqWbKOgdXpQ56ydhV2HwU5FdLYGC6qyMqjc
5YGxQ94hXsS3q85Dp6ebQ/YRY0yGWXer1v3vUEbD/Lfb1CNSvGr5fahNiD3hTYxt
PXa4yyghf0EFaYKOLrbnLKPPYNZoN91gavyFeNRfmYoksOYOesltyT3pEX8bZHdl
0P50v+DVn/PBir9t3/nAxD4u+Z7uCs0IJAkB8cFQq0G5FMSiAbz7usABiQkQDgJq
IwzErIPPmjYGZxUTHKorxM0d6Ozcd1wdn27abdkj80N9e6g+MB4oXsRpNlnbEly/
E2715dEWIZju8PDCO3n/vxJiImPV2OEosAhJUormJbKw/n6B1Ie97tt/zwGP0ghr
9hJBQXx/MLxQqwPd8Qnp1Fc5FNMKs0iLQ5hI3KvmiHOKPWEYmr+qBCPBxadifD9p
XdX6Ugfy64WRB1hDEMK44s5NPEx0QXhr1mwb5iaQhgFiw2X12FUJxFUZsQ1ItScT
Sx9lAziVQZPIgIhmO26vmLG8Y0r64gleKDom/0dAyHYJI+J8aGiXnSBaGC+OYj2W
DdzQ8X6/DngnkhjB1UrFEgusweBnoKX/V/Fc501cut17ls3ARjdaKBpt0WRzO0iA
QJWdq27miCREtqphebPNTNAiJYD78OFkRn3mONj6krOEIXPWKHI=
=0KPK
-----END PGP SIGNATURE-----

--9JSHP372f+2dzJ8X--
