Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F11A717A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 05:08:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491Vmj4nvHzDqGJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:08:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491TyR4sWyzDqPg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 12:31:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=C0o1HILR; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 491Twc1sd7z9sTS; Tue, 14 Apr 2020 12:22:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586831408;
 bh=s+h6RahcZzYYfeeXQO5SulGcL901j5evDB+gL/9pWUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C0o1HILRNbU52slNTOS7Ou5kuosrbTG0h3HLBCUime57Kk4a99mwmIwfWjOTbr50i
 pcrEom/eyxXvWTdp1LE340uZjjmwg03ANoJa0UlZNjGLY7Qj7HA402fXka//JG3QCC
 8Uqe74ZF8xKCd3yveJUwYqyGZBZmlcNkhNHGrBgw=
Date: Tue, 14 Apr 2020 12:05:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Boot flakiness with QEMU 3.1.0 and Clang built kernels
Message-ID: <20200414020553.GD48061@umbus.fritz.box>
References: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
 <1586564375.zt8lm9finh.astroid@bobo.none>
 <20200411005354.GA24145@ubuntu-s3-xlarge-x86>
 <1586597161.xyshvdbjo6.astroid@bobo.none>
 <1586612535.6kk4az03np.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Content-Disposition: inline
In-Reply-To: <1586612535.6kk4az03np.astroid@bobo.none>
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
Cc: qemu-devel@nongnu.org, clang-built-linux@googlegroups.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2020 at 11:57:23PM +1000, Nicholas Piggin wrote:
> Nicholas Piggin's on April 11, 2020 7:32 pm:
> > Nathan Chancellor's on April 11, 2020 10:53 am:
> >> The tt.config values are needed to reproduce but I did not verify that
> >> ONLY tt.config was needed. Other than that, no, we are just building
> >> either pseries_defconfig or powernv_defconfig with those configs and
> >> letting it boot up with a simple initramfs, which prints the version
> >> string then shuts the machine down.
> >>=20
> >> Let me know if you need any more information, cheers!
> >=20
> > Okay I can reproduce it. Sometimes it eventually recovers after a long
> > pause, and some keyboard input often helps it along. So that seems like=
=20
> > it might be a lost interrupt.
> >=20
> > POWER8 vs POWER9 might just be a timing thing if P9 is still hanging
> > sometimes. I wasn't able to reproduce it with defconfig+tt.config, I
> > needed your other config with various other debug options.
> >=20
> > Thanks for the very good report. I'll let you know what I find.
>=20
> It looks like a qemu bug. Booting with '-d int' shows the decrementer=20
> simply stops firing at the point of the hang, even though MSR[EE]=3D1 and=
=20
> the DEC register is wrapping. Linux appears to be doing the right thing=
=20
> as far as I can tell (not losing interrupts).
>=20
> This qemu patch fixes the boot hang for me. I don't know that qemu=20
> really has the right idea of "context synchronizing" as defined in the
> powerpc architecture -- mtmsrd L=3D1 is not context synchronizing but that
> does not mean it can avoid looking at exceptions until the next such
> event. It looks like the decrementer exception goes high but the
> execution of mtmsrd L=3D1 is ignoring it.
>=20
> Prior to the Linux patch 3282a3da25b you bisected to, interrupt replay
> code would return with an 'rfi' instruction as part of interrupt return,
> which probably helped to get things moving along a bit. However it would
> not be foolproof, and Cedric did say he encountered some mysterious
> lockups under load with qemu powernv before that patch was merged, so
> maybe it's the same issue?
>=20
> Thanks,
> Nick
>=20
> The patch is a bit of a hack, but if you can run it and verify it fixes
> your boot hang would be good.

So a bug in this handling wouldn't surprise me at all.  However a
report against QEMU 3.1 isn't particularly useful.

 * Does the problem occur with current upstream master qemu?
 * Does the problem occur with qemu-2.12 (a pretty widely deployed
   "stable" qemu, e.g. in RHEL)?

> ---
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b207fb5386..1d997f5c32 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4364,12 +4364,21 @@ static void gen_mtmsrd(DisasContext *ctx)
>      if (ctx->opcode & 0x00010000) {
>          /* Special form that does not need any synchronisation */
>          TCGv t0 =3D tcg_temp_new();
> +        TCGv t1 =3D tcg_temp_new();
>          tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
>                          (1 << MSR_RI) | (1 << MSR_EE));
> -        tcg_gen_andi_tl(cpu_msr, cpu_msr,
> +        tcg_gen_andi_tl(t1, cpu_msr,
>                          ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
> -        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
> +        tcg_gen_or_tl(t1, t1, t0);
> +
> +        gen_update_nip(ctx, ctx->base.pc_next);
> +        gen_helper_store_msr(cpu_env, t1);
>          tcg_temp_free(t0);
> +        tcg_temp_free(t1);
> +        /* Must stop the translation as machine state (may have) changed=
 */
> +        /* Note that mtmsr is not always defined as context-synchronizin=
g */
> +        gen_stop_exception(ctx);
> +
>      } else {
>          /*
>           * XXX: we need to update nip before the store if we enter
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6VGoAACgkQbDjKyiDZ
s5Lyhg//TomNgFk7I7WoNDVdWfstVP8av11YeK/MKpSxrha0zOw+CgPJJAGUeCQT
c/K0tQXzXR2joC0opPWbO8VBLms5CapY8+I11tOsOi5okidzvJTP6T/ZCff5/Guz
Oi4reP211wqoYISQhjzoNL21HB1fyzPUMLycpNYokQYagyUBROO29mVAZpVgWMfm
B7L4p89VPzTxd5FcM5/xT7rNRzpcW5ICxpOQLIm0Tbo6Ez9OLXwPHxqTVdZnekhD
+1pygEVhKwy80e+fJ1EYnAWCXKLgQBmBQ65sdA/H6y90KLLSlQireaPwroMkVWyP
tNf75J3JIzqUdaO08ZgjuV90/EoeuJ+AtJ+txqWNnQ3LAIrskL7WBmarOMVQq/3y
IRGlesv6M/dsXLwgw6cX0Hr/iSwHP9ytfZFoGlG2GNeNFphfRyIJKRaisF+jWI6w
1gUt8wy7H2zJ+ghmUJWgie8Nay7p9uWLnX4JP74JsA+qEMb5q1DTsK7BTfKyQEqL
pCZtQLNAJbW61KQT0TWOdJlv1szE5JB+Aj7QF96VWwEUZaLtmE8ZoK8uoYbQb6na
WHmlMu/VX1De4SCsZgB2iQfeOqn7BiQt4VseXOsaN843bFhap40x4o+jwYuQIsBI
vaFMm2sLBsgmzdLEqwIXy8ujgTsj5lFrVmqzNlzKb7JgjmgUF3o=
=/XSB
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--
