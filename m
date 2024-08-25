Return-Path: <linuxppc-dev+bounces-488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD42995E591
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 00:41:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsTLm16kcz2xcs;
	Mon, 26 Aug 2024 08:41:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724625696;
	cv=none; b=GUrIIivab9lldZ1dG8/PkHWHTdSLY3zRHtyv9C6OUbg+l3lmts98bIunHNC0zsiv3jncXk4SzDTchhtl4MDR/C4okXJf2d9ZN3VKdIoq7gLOnKGUf9yJeLxNZV8Q0BG78jjmU+R1OFMHJhcavAYnq838MdV0HTcWIn1LgNFLyqstoRLG+vmDjQ1WD1xrs+UmVTl6Q9HGHHd54hjV+siPFv2Nvj0zVOd2mKabVCdLh82mioWi8l5CoQZBjCxr6qmd6ZjuLaElAzbANSNX8Ir/D0z2dvfkBy5pDrfdSQ4SrzswtKKSTSRK5SWP27EnivoSeNw6hv6nQil5Vb0Uw2fWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724625696; c=relaxed/relaxed;
	bh=NOJQ9z785FI7UG0ZnbDri5DB5hq577GRnP3LYdhVte8=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type; b=OaujSJSl8+T1sE1Mv0dBvncs7OirS72AqeoS7tazYQU93Wm51UwMd1TBH+ZhHXYOIk+va2HIuQX7TFhmJmX1aiXri+XcEacQktMLLmTgEgyDbDdmE/lMJtTLlbKqcHoftF2sNj45r/QEiemwIcGTB7S1IqDQukh6BcVH+FXbjd4So0al5Z0xCQ9YGiNPFuubIhaqGeI3g1MZfNXjdrPnI+5w0eRBYQf/qrzFZEUN/LUCvqqHz9GkhDgoymNHGxOJJ9UUnGFmRhI9uo0LUX06GJMbVwBHoKiGOrlcJ5p8lIhDxUa//e+WTYYdSvKDDFkc9g2qnFmos51txxoaLDk1yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=hCYuF5Q+; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=hCYuF5Q+;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsTLm0vHpz2xbd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 08:41:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724625695;
	bh=NOJQ9z785FI7UG0ZnbDri5DB5hq577GRnP3LYdhVte8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hCYuF5Q+tFRaGUFdjbiYnN+lSAjcPi2QhU/eLxgblbbOau/LME6nMb2RssyFDUBjH
	 sfK7LauX4U/Y/cumyGW5pcSgtXsDEdjmpzVSF3yZF8v0ccXTYIEW+MRs+my6B3k1vX
	 9J+8KABTl/spK/ohCZHguocikSLN+5jZg7osBPAoxQx/3Wvbp8yzbMYAo8RpXorlZt
	 gRv/xZDkqAtFcwUmvNHNtWBOTrOr3Cmpi4PURsygl5KY6m8MQyA7wzzMOnCVY2zmQ6
	 dOO7jT0Kxx7tPb1EjBVdUHcJdAXyWyLsYqrBVPFgecErKJykem2tByfPtEHm/HKiVN
	 ELfgUTslnCkow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WsTLl5qVCz4x3d;
	Mon, 26 Aug 2024 08:41:35 +1000 (AEST)
Date: Mon, 26 Aug 2024 08:41:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: ppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: List change - munging for From addresses
Message-ID: <20240826084134.20607560@canb.auug.org.au>
In-Reply-To: <20240812-big-truthful-boar-cbfbb1@lemur>
References: <20240802130347.383a1b49@canb.auug.org.au>
	<20240802-agile-manipulative-dog-df4487@lemur>
	<20240805124204.49ed65df@canb.auug.org.au>
	<20240805-honored-weightless-kangaroo-71e79e@lemur>
	<20240812155427.14dc2281@canb.auug.org.au>
	<20240812161913.082cd5ca@canb.auug.org.au>
	<20240812-big-truthful-boar-cbfbb1@lemur>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+aGS_5n=R6iOXwtKGQm7ziB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+aGS_5n=R6iOXwtKGQm7ziB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Mon, 12 Aug 2024 09:53:43 -0400 Konstantin Ryabitsev <konstantin@linuxfo=
undation.org> wrote:
>
> Headers look good! One thing you'll also want to set up is OpenARC to add
> ARC signatures, which are now required by Google once your mail server re=
aches
> certain thresholds. OpenARC isn't too hard to set up.

Done.  Does that look better?

The mail does seem to be flowing into Google a bit smoother.
--=20
Cheers,
Stephen Rothwell

--Sig_/+aGS_5n=R6iOXwtKGQm7ziB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbLsx8ACgkQAVBC80lX
0Gxs+wf/Qz0gV9fluYo8j+NnX3fyzoGPoLAMOtacwioDlXyBv+gr+pyplwv/wBm+
1Bo4RuetnPfqKyw884nUSQO8y4AhroLILzcAfHehiXVhtgFxXSQ8I12hugEDLoB2
7zUg42G+ylFhsPM8BoPkSIALsvqkjVKeW4r3H/mdy2niWM3UaPoST9wUz6sU0/bR
q696TKlwiZB/qafAvL9pG8OZUm78WQBw6WfAOMOG8bS6fJte8PYYYbUxoyErMOKz
F9KeQTMcE0LZBKI83sVH+l1NWQU/8Iaav4KwrJLjEWUjAmn5Ay+lX1JKdVB9gHO2
sQMfaOw591fo/HaX/VGaQNFDt2Yl+A==
=8ERs
-----END PGP SIGNATURE-----

--Sig_/+aGS_5n=R6iOXwtKGQm7ziB--

