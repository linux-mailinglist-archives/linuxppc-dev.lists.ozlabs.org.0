Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8819316511
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 12:22:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbHRz4gVRzDvX9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 22:22:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbHLc4FVczDr6c
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 22:18:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=ZI1am5Is; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DbHLb1h0Lz9sS8;
 Wed, 10 Feb 2021 22:18:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1612955895;
 bh=oBO5OiuYs+2sa+05/4gDmvfXPteEllUKO90Wa7brXDw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZI1am5IssN6OKcV5bRcGLem9S6LTb3ViSdEUR49FjsjyV1o83/PCTwKFbESf87lwu
 It7t6EmuYs9zjM73sJjEnBgiHKKcda0cKu4pXwmmhZ7FdJVDN/zxpGtO8jfJKBqTmD
 TQyNzLkJzZtcaqvychS8NtCsYwr8/OJfsB2oeMPqBSngoImuoHiXazvWCczQWvgbfr
 pTw+4WrW6fNXFhFuOd8dnTlwsnnw4BiNmfh0gg8xTi9z7wJ96mtvpHE0wAUxjRXYKD
 F+98iiFTs7BvwIH6e7mPj99cCmEP6JS2iyA9yRyJrREBhiQVE0x/B7ulYdSlYSKBRd
 McrSUDoyF+wiQ==
Date: Wed, 10 Feb 2021 22:18:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Message-ID: <20210210221814.22c3ab52@canb.auug.org.au>
In-Reply-To: <1612945076.ng7h3tp2jn.astroid@bobo.none>
References: <20210209211921.777e3053@canb.auug.org.au>
 <1612945076.ng7h3tp2jn.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DQzo9u+quVcAVqwzkONhjpI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/DQzo9u+quVcAVqwzkONhjpI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nick,

On Wed, 10 Feb 2021 18:20:54 +1000 Nicholas Piggin <npiggin@gmail.com> wrot=
e:
>
> Thanks for that, it's due to .noinstr section being put on the other=20
> side of .text, so all our interrupt handler asm code can't reach them=20
> directly anymore since the ppc interrupt wrappers patch added noinstr
> attribute.
>=20
> That's not strictly required though, we've used NOKPROBE_SYMBOL okay
> until now. If you can take this patch for now, it should get=20
> allyesconfig to build again. I'll fix it in the powerpc tree before the=20
> merge window.
>=20
> --
>=20
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/=
asm/interrupt.h
> index 4badb3e51c19..fee1e4dd1e84 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -172,6 +172,8 @@ static inline void interrupt_nmi_exit_prepare(struct =
pt_regs *regs, struct inter
>  #define DECLARE_INTERRUPT_HANDLER_RAW(func)				\
>  	__visible long func(struct pt_regs *regs)
> =20
> +#define ppc_noinstr         noinline notrace __no_kcsan __no_sanitize_ad=
dress
> +
>  /**
>   * DEFINE_INTERRUPT_HANDLER_RAW - Define raw interrupt handler function
>   * @func:	Function name of the entry point
> @@ -198,7 +200,7 @@ static inline void interrupt_nmi_exit_prepare(struct =
pt_regs *regs, struct inter
>  #define DEFINE_INTERRUPT_HANDLER_RAW(func)				\
>  static __always_inline long ____##func(struct pt_regs *regs);		\
>  									\
> -__visible noinstr long func(struct pt_regs *regs)			\
> +__visible ppc_noinstr long func(struct pt_regs *regs)			\
>  {									\
>  	long ret;							\
>  									\
> @@ -228,7 +230,7 @@ static __always_inline long ____##func(struct pt_regs=
 *regs)
>  #define DEFINE_INTERRUPT_HANDLER(func)					\
>  static __always_inline void ____##func(struct pt_regs *regs);		\
>  									\
> -__visible noinstr void func(struct pt_regs *regs)			\
> +__visible ppc_noinstr void func(struct pt_regs *regs)			\
>  {									\
>  	struct interrupt_state state;					\
>  									\
> @@ -262,7 +264,7 @@ static __always_inline void ____##func(struct pt_regs=
 *regs)
>  #define DEFINE_INTERRUPT_HANDLER_RET(func)				\
>  static __always_inline long ____##func(struct pt_regs *regs);		\
>  									\
> -__visible noinstr long func(struct pt_regs *regs)			\
> +__visible ppc_noinstr long func(struct pt_regs *regs)			\
>  {									\
>  	struct interrupt_state state;					\
>  	long ret;							\
> @@ -297,7 +299,7 @@ static __always_inline long ____##func(struct pt_regs=
 *regs)
>  #define DEFINE_INTERRUPT_HANDLER_ASYNC(func)				\
>  static __always_inline void ____##func(struct pt_regs *regs);		\
>  									\
> -__visible noinstr void func(struct pt_regs *regs)			\
> +__visible ppc_noinstr void func(struct pt_regs *regs)			\
>  {									\
>  	struct interrupt_state state;					\
>  									\
> @@ -331,7 +333,7 @@ static __always_inline void ____##func(struct pt_regs=
 *regs)
>  #define DEFINE_INTERRUPT_HANDLER_NMI(func)				\
>  static __always_inline long ____##func(struct pt_regs *regs);		\
>  									\
> -__visible noinstr long func(struct pt_regs *regs)			\
> +__visible ppc_noinstr long func(struct pt_regs *regs)			\
>  {									\
>  	struct interrupt_nmi_state state;				\
>  	long ret;							\

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>  # allyesconfig build

--=20
Cheers,
Stephen Rothwell

--Sig_/DQzo9u+quVcAVqwzkONhjpI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAjwPYACgkQAVBC80lX
0GyJ2wf/R6r3VqXBfy1DrsHhX6qAJjS3H4IdvG8McdGJg3R7BEKTzhYjsJTE/Gjd
Wxzyx43pbVCow5FirOr7EHX91682ST4Jgwm+DTTe2q5A7TroV71YgmSW+ll4h7k0
xyxUW/qvTqzcuxlRnR3q1EVKNRijWXxSr1uQyOzPMTLumnsEHxEcCE+ZA5EkzAJ0
uRHNgvoA41/y8rVto97ci5JoJ1QU2ICztCou1/upA74kVb3eWCZH4GE1juUxYLgm
b8j0xmilQK453L4cYFQuETCEQ72XAm5n4UJR3G+4/dUL+nOWLaD5ule87+dcrHMk
de4IsPE4bxg9TPOpid3XqiVRLfPYCA==
=XdXn
-----END PGP SIGNATURE-----

--Sig_/DQzo9u+quVcAVqwzkONhjpI--
