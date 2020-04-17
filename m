Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA131AD3EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 03:04:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493HtL5KqmzF09x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 11:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Hp231rBzDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 11:00:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=K+nttMMp; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 493Hp21kWhz9sSG; Fri, 17 Apr 2020 11:00:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1587085242;
 bh=yoah8bflFH5+cIjZW68ZwOiWwUY28dTHfS4xBrV55Lg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K+nttMMp/QFurxERBnQtMKnndcRtzCwL2DLHLx1Hn3NSPTBUUag1ymTvHTKORXgt6
 9kX/XlyDnwx0RIjZfU8cN4t4jP3ceEBt7giarpHxcE10EsoOBekvi9awjOZhageKdt
 t4aMiN4AL4r/Gpqk4rSJK0jBdFTZiER6BKaDOzeo=
Date: Fri, 17 Apr 2020 10:40:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc: Fix mtmsr(d) L=1 variant that loses interrupts
Message-ID: <20200417004012.GA2102@umbus.fritz.box>
References: <20200414111131.465560-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20200414111131.465560-1-npiggin@gmail.com>
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 09:11:31PM +1000, Nicholas Piggin wrote:
65;5803;1c> If mtmsr L=3D1 sets MSR[EE] while there is a maskable exception=
 pending,
> it does not cause an interrupt. This causes the test case to hang:
>=20
> https://lists.gnu.org/archive/html/qemu-ppc/2019-10/msg00826.html
>=20
> More recently, Linux reduced the occurance of operations (e.g., rfi)
> which stop translation and allow pending interrupts to be processed.
> This started causing hangs in Linux boot in long-running kernel tests,
> running with '-d int' shows the decrementer stops firing despite DEC
> wrapping and MSR[EE]=3D1.
>=20
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-April/208301.html
>=20
> The cause is the broken mtmsr L=3D1 behaviour, which is contrary to the
> architecture. From Power ISA v3.0B, p.977, Move To Machine State Register,
> Programming Note states:
>=20
>     If MSR[EE]=3D0 and an External, Decrementer, or Performance Monitor
>     exception is pending, executing an mtmsrd instruction that sets
>     MSR[EE] to 1 will cause the interrupt to occur before the next
>     instruction is executed, if no higher priority exception exists
>=20
> Fix this by handling L=3D1 exactly the same way as L=3D0, modulo the MSR
> bits altered.
>=20
> The confusion arises from L=3D0 being "context synchronizing" whereas L=
=3D1
> is "execution synchronizing", which is a weaker semantic. However this
> is not a relaxation of the requirement that these exceptions cause
> interrupts when MSR[EE]=3D1 (e.g., when mtmsr executes to completion as
> TCG is doing here), rather it specifies how a pipelined processor can
> have multiple instructions in flight where one may influence how another
> behaves.
>=20
> Cc: qemu-stable@nongnu.org
> Reported-by: Anton Blanchard <anton@ozlabs.org>
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Thanks very much to Nathan for reporting and testing it, I added his
> Tested-by tag despite a more polished patch, as the the basics are=20
> still the same (and still fixes his test case here).
>=20
> This bug possibly goes back to early v2.04 / mtmsrd L=3D1 support around
> 2007, and the code has been changed several times since then so may
> require some backporting.
>=20
> 32-bit / mtmsr untested at the moment, I don't have an environment
> handy.
>=20
>  target/ppc/translate.c | 46 +++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 19 deletions(-)

Applied to ppc-for-5.0.

>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b207fb5386..9959259dba 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4361,30 +4361,34 @@ static void gen_mtmsrd(DisasContext *ctx)
>      CHK_SV;
> =20
>  #if !defined(CONFIG_USER_ONLY)
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
>      if (ctx->opcode & 0x00010000) {
> -        /* Special form that does not need any synchronisation */
> +        /* L=3D1 form only updates EE and RI */
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
> +        gen_helper_store_msr(cpu_env, t1);
>          tcg_temp_free(t0);
> +        tcg_temp_free(t1);
> +
>      } else {
>          /*
>           * XXX: we need to update nip before the store if we enter
>           *      power saving mode, we will exit the loop directly from
>           *      ppc_store_msr
>           */
> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_start();
> -        }
>          gen_update_nip(ctx, ctx->base.pc_next);
>          gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
> -        /* Must stop the translation as machine state (may have) changed=
 */
> -        /* Note that mtmsr is not always defined as context-synchronizin=
g */
> -        gen_stop_exception(ctx);
>      }
> +    /* Must stop the translation as machine state (may have) changed */
> +    gen_stop_exception(ctx);
>  #endif /* !defined(CONFIG_USER_ONLY) */
>  }
>  #endif /* defined(TARGET_PPC64) */
> @@ -4394,15 +4398,23 @@ static void gen_mtmsr(DisasContext *ctx)
>      CHK_SV;
> =20
>  #if !defined(CONFIG_USER_ONLY)
> -   if (ctx->opcode & 0x00010000) {
> -        /* Special form that does not need any synchronisation */
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    if (ctx->opcode & 0x00010000) {
> +        /* L=3D1 form only updates EE and RI */
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
> +        gen_helper_store_msr(cpu_env, t1);
>          tcg_temp_free(t0);
> +        tcg_temp_free(t1);
> +
>      } else {
>          TCGv msr =3D tcg_temp_new();
> =20
> @@ -4411,9 +4423,6 @@ static void gen_mtmsr(DisasContext *ctx)
>           *      power saving mode, we will exit the loop directly from
>           *      ppc_store_msr
>           */
> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_start();
> -        }
>          gen_update_nip(ctx, ctx->base.pc_next);
>  #if defined(TARGET_PPC64)
>          tcg_gen_deposit_tl(msr, cpu_msr, cpu_gpr[rS(ctx->opcode)], 0, 32=
);
> @@ -4422,10 +4431,9 @@ static void gen_mtmsr(DisasContext *ctx)
>  #endif
>          gen_helper_store_msr(cpu_env, msr);
>          tcg_temp_free(msr);
> -        /* Must stop the translation as machine state (may have) changed=
 */
> -        /* Note that mtmsr is not always defined as context-synchronizin=
g */
> -        gen_stop_exception(ctx);
>      }
> +    /* Must stop the translation as machine state (may have) changed */
> +    gen_stop_exception(ctx);
>  #endif
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6Y+uoACgkQbDjKyiDZ
s5IfvQ/7B95w2bN1JzPlxMZJbbl/6U1RSYX643qSwxmHp3qmmWV4okUgaNzsVscC
mBl17DQbHuvl8YJduL5G6qNwfnkcEq+OIfX3k60QyQ+bf7ETK5UlmUq3c4Ao/E7e
H9O44iv5RSBZ41TQoYUVC+1IU11Mx0GXMsKiGkHOCCB3aK9no22rY4Um9LoEhHLB
Kue9WvNLlOcUm78BJ/00K70UffTgnbyR6q/CzUY81Lq1vuohZ1SdJWb6z8DeJLLe
XQ9Thne+6Z48MN/tPc0gLg6MF/NSaXzC4jeuI6Ht6WHe2P1USIgB+CrRpUmU/eK2
cpeHUZjg1oZgvno8v9uoKyQloTdaNczVJ4HmdMjt0+FmEhUFyZqx6o5aW4V93BV7
tPUc0TxNORcc31ol2gjBVWzQRTHbF5dq3rCBJzVellzUg6hA+H/AXudVRR1Z/Szk
CzbvVhLCpbJXmx5e/g0MZJnvejOjOTM1WLi0VwibH/ZIGVBbFP0wwG5GfAkP7D9+
/8YX1vb+5E8a10ThMP01hyQFJjjFbhkLilT6IMwJAzf5rv3josFj+QI5wKmt9b6n
zI2f0xkb15zX4aMAwTj05ReDQ7qA3ICwcu4As2N32PqO9j+jJ08sAzpkH6e2zXDE
Jb0Ew1oM/n0XkPQHIRIE4pjGhpgafPyOaK5PLokVaSpm1D/2hfU=
=Qw8M
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
