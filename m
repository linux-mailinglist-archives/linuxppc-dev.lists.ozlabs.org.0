Return-Path: <linuxppc-dev+bounces-1400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C862497997A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 01:16:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6P7V0j0Jz2yGM;
	Mon, 16 Sep 2024 09:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726442198;
	cv=none; b=QMpFQ+jTrxiT8Ukfo/rRAtabHy4brvuxp1fEdZbW95zwtH0+Q98vvoh+gdj7wR9nl/PA2Ijb0cx7CclRm1tcIYDIvAjg3LIlsmeSwtdcVpIcsMcFeqOl50UZ03HR8TjMtuFWpWekASUll3a01h8LFNgdzx7LKIW10N/iqApX/SUw+90NY7Qln8hkHjik+Y9r10aiAlUFyEoJzNogZFkSGQ8+VCcb64DjeP0fi5m0UU8bbSBwQVUT5Ox2XB9I0b8bFegBcuDv84d1U/U6OJEihNUXFfeIZHp6tnKQuEohzPUfC6NQwwZbJgBnCMTSOsMI0Q/7wff3PP+8dazreT3SfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726442198; c=relaxed/relaxed;
	bh=+YkVivKQKXh9KKj1Omgtn8LMDpfsrjbXlXEgwIeN1hE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+K1FwD7SDlZewWpFh/nrTVENQr1a/sPNKQA9ARQtbO41+ynyWlUVPiyXjx5++sVV/tBe1aWy5HODqK5QhpE+lKAd+5QdfNTZTLS1208f+mYNeXRJmApXd85gIadDKXBhls3MgSb+HTh+7TkBG6EFEa3aumjImaOgAFzn4KY8y/uX6R8VBkl5HnSIrOtQvY6Gh6Pndpx70oiLO9hZNn8LTA/Oi+zNww6jGajMZUjTnbj/2wPwe8khkYYZH9nv66DNadaBgUg9QbZPdLGB7zuis6YaOaVPOPK3Kc3nX4HiMN8Hb0jF9i9MMQ9+6uK32UjUbcBpyB+Q1Qi9O31ROJTVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=fgCO3qvW; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=fgCO3qvW;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6P7R4tKzz2y8Z
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 09:16:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726442190;
	bh=+YkVivKQKXh9KKj1Omgtn8LMDpfsrjbXlXEgwIeN1hE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fgCO3qvWOlr9OTwlOusdn8iUf0yu02AoLXYOivGbuBk24bZFEixS/E+KN76lga+SC
	 2plihgbd/GqAxnBjdmR97NYPsHOZdSwYbRhO70zhneakfXKa7At3TySWusd87eNlbG
	 hojE7jDQAZvSniNMO5pw8AeRdO0RYEJxUe2/ftklWw8fcn4lZndpG4TRmwm18+bBf5
	 MbIYpYWwZ1P5rOWnNEYmG2WT5+mLw6eYesBEC6pxzMrIwt77FXYoOWLlHqdg6SZSYU
	 OJUiHTYclSOszHBKzAm6lwIKEXeyoXfAIrYJ9B7wdFj2zzrXfvdxnenm5SgOkThmNt
	 q2uoCWA22wDSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6P7H4RWKz4xCT;
	Mon, 16 Sep 2024 09:16:27 +1000 (AEST)
Date: Mon, 16 Sep 2024 09:16:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, <linuxppc-dev@lists.ozlabs.org>, Matthew
 Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <20240916091627.7517d5b1@canb.auug.org.au>
In-Reply-To: <87jzffq9ge.fsf@mail.lhotse>
References: <20240913213351.3537411-1-almasrymina@google.com>
	<87jzffq9ge.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wvWGET07=F0qHFq0Pov_C+c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wvWGET07=F0qHFq0Pov_C+c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, 14 Sep 2024 12:02:09 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Mina Almasry <almasrymina@google.com> writes:
> > Building net-next with powerpc with GCC 14 compiler results in this
> > build error:
> >
> > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> > not a multiple of 4)
> > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> > net/core/page_pool.o] Error 1
> >
> > Root caused in this thread:
> > https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-=
soprasteria.com/ =20
>=20
> Sorry I'm late to this, the original report wasn't Cc'ed to linuxppc-dev =
:D

Yeah, sorry about that.

> I think this is a bug in the arch/powerpc inline asm constraints.
>=20
> Can you try the patch below, it fixes the build error for me.
>=20
> I'll run it through some boot tests and turn it into a proper patch over
> the weekend.
>=20
> cheers
>=20
>=20
> diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm=
/atomic.h
> index 5bf6a4d49268..0e41c1da82dd 100644
> --- a/arch/powerpc/include/asm/atomic.h
> +++ b/arch/powerpc/include/asm/atomic.h
> @@ -23,6 +23,12 @@
>  #define __atomic_release_fence()					\
>  	__asm__ __volatile__(PPC_RELEASE_BARRIER "" : : : "memory")
> =20
> +#ifdef CONFIG_CC_IS_CLANG
> +#define DS_FORM_CONSTRAINT "Z<>"
> +#else
> +#define DS_FORM_CONSTRAINT "YZ<>"
> +#endif
> +
>  static __inline__ int arch_atomic_read(const atomic_t *v)
>  {
>  	int t;
> @@ -197,7 +203,7 @@ static __inline__ s64 arch_atomic64_read(const atomic=
64_t *v)
>  	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
>  		__asm__ __volatile__("ld %0,0(%1)" : "=3Dr"(t) : "b"(&v->counter));
>  	else
> -		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=3Dr"(t) : "m<>"(v->counter));
> +		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=3Dr"(t) : DS_FORM_CONSTRAINT=
 (v->counter));
> =20
>  	return t;
>  }
> @@ -208,7 +214,7 @@ static __inline__ void arch_atomic64_set(atomic64_t *=
v, s64 i)
>  	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
>  		__asm__ __volatile__("std %1,0(%2)" : "=3Dm"(v->counter) : "r"(i), "b"=
(&v->counter));
>  	else
> -		__asm__ __volatile__("std%U0%X0 %1,%0" : "=3Dm<>"(v->counter) : "r"(i)=
);
> +		__asm__ __volatile__("std%U0%X0 %1,%0" : "=3D" DS_FORM_CONSTRAINT (v->=
counter) : "r"(i));
>  }
> =20
>  #define ATOMIC64_OP(op, asm_op)						\

I have applied this by hand to my fixes branch for today and will
remove it when it (or something better) is applied somewhere appropriate.

--=20
Cheers,
Stephen Rothwell

--Sig_/wvWGET07=F0qHFq0Pov_C+c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbnassACgkQAVBC80lX
0GwtGwgAjDVCZvPbYm3Kwv1z8+t74EffqYKMdcX5DcnmbMkaPV3rLXAKXr0KVymx
/kggi6dj2sFS8NnsgSFbzQkIMF3Kh5iSCxiTzcGPpL29qOYI5S5r/qEV8SL70Ufd
mMEPuZm5/xE4dHw9QUrZfPPdCrmLCMl17cLiVl2anqeS6WO2X6MC6sH+rIq5k4x6
BpEMayzkSIoJrxSfBkj3kyWVzIrXJ2vnOzQr9/4eChhLBzt6BOqOHCyze6TIE+aV
USLfDeVtJqO0PR0B7DajAkUUaAlBv2dqSFUY8PVlmCT+2XawhvUQp0s4xFag/mUX
gVGPsrNGlnkqUmfk+nc88OS/JI4Bcg==
=GsuB
-----END PGP SIGNATURE-----

--Sig_/wvWGET07=F0qHFq0Pov_C+c--

