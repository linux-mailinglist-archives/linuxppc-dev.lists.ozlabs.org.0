Return-Path: <linuxppc-dev+bounces-7907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B72EAA96D37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:42:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhk2D1P2Gz2ygk;
	Tue, 22 Apr 2025 23:42:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745329364;
	cv=none; b=l18wD86894/E+8B48yJAa1hDMmpqQqVge6xGjTtaBQWBF04IP7IJyMvoYgvv5mmuWjgtZMuI2WBX0cJgiLp/eX2O4XPq0PNPwbLcF3K7bfxzLjiAXaatJlngGaYMAHn1pK0b0+DSax/O//uU5cqRQ+j6ru1VGKA8aKn0ucL7DWQoYZk1xcSJxmY+7xNCsLtXz0UL8lks1WEcP/yxplO6Bbmtv1ofn/CFKQ4UnyEDrhnhvNhsqOJoL+eUfAStUDOUyUkPrVcrVuKCbq8oPTs4j7r0+IyVLPy3ZUQ2bsKQwI+01a6QxWdrpqbh1R/maaO2204tEICkxtF+1NEI4uvdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745329364; c=relaxed/relaxed;
	bh=o75BKYSuuS3/Y4oEZBse/ei+EN+d9/PNdk0zciHejYE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gGloDs7zLAGCJ2u/nY/xOWopKi6NWakz+tVlpQjTdovWJIiy25nNj1pHOW1Vqndvkf1/7M6e3okuwro5os640fTimwIrLIxkDAeZcsJO985wW+8azXTSlu4rlsd1aidKo0aCQRNUtjflxulASxI7vnSZn28hkpllhcY6mRNKGYpsB3nB3namkZvk7WfBP+7l+Q4Ut5VM3YW3e2fEAlGu9qZNKBJCWpPJtikZHCG40HMlsP6Mov85iyJNvK/z7w8yUSj7wPKuunreZbTL09swstHVjEJuK/IKIJJfEA9mmbcAiGspXDA4CiFCg5mWRh8+25U9FjwcDBgZwbyioblyLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=qlKWUkVn; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=qlKWUkVn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhk2B63YVz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:42:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745329361;
	bh=o75BKYSuuS3/Y4oEZBse/ei+EN+d9/PNdk0zciHejYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qlKWUkVnLDcl2aau4uZviji97wBWeKUG2owoLdg9+1SNzfPK3cZO59w5Q6hHnuCqa
	 aNuJXSkbO6/sGps62yUkf7S9IDCZiB53B7KNdUNIzkJcoiMkCNqwaSPpmKj93eXhVa
	 6wscqyAGh8QL+Cr8ujBFaEx+Jo2Pty4o+yGDc0TKlLAsZTRzRn26qGjFFl4pF/5dES
	 MNkQiUI3gOGzJ0XTRZCLqFwzJOZkRvJH/YGYVR/0iWfp6ol58FkfkRGHolnqTXqvVF
	 N4UKac3Ss4OQLV00Z1UxX2bLnXwRaLUI81IMVm+gwdjT7Tn615Q3qDBZr1YMaYbB0E
	 jpi+LyOuedCNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhk29245tz4x04;
	Tue, 22 Apr 2025 23:42:40 +1000 (AEST)
Date: Tue, 22 Apr 2025 23:42:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: mpe@ellerman.id.au, christophe.leroy@csgroup.eu, npiggin@gmail.com,
 naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] powerpc/prom_init: Fix shellcheck warnings
Message-ID: <20250422234239.544287d0@canb.auug.org.au>
In-Reply-To: <20250422131040.374427-6-maddy@linux.ibm.com>
References: <20250422131040.374427-1-maddy@linux.ibm.com>
	<20250422131040.374427-6-maddy@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+e1KC_RMvubVVb0L8_AE3ee";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/+e1KC_RMvubVVb0L8_AE3ee
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Madhavan,

On Tue, 22 Apr 2025 18:40:39 +0530 Madhavan Srinivasan <maddy@linux.ibm.com=
> wrote:
>
> Fix "Double quote to prevent globbing and word splitting."
> warning from shellcheck

Looks good to me.

Reviewed-by: Stephen Rothwell <sfr@cab.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/+e1KC_RMvubVVb0L8_AE3ee
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHnM8ACgkQAVBC80lX
0GwXEQf/THOs4zckqNiHV3OloQUiLDv9SrR693s1bV1Q28xTZI8gpibZ4WKFPAh+
UBnVKLqRGyeAdMKFv9jDZZ5s4U2cB95UwPLqN9Z4T/eXwe4Li5vTp4xVC2QRmmLw
HrDfAdcaUpopNHoPUHO5PGetEpCcbYIB/hqigsj/IBoss7Y9jIAPFEDmUl24WZKE
SCI8x6P4b/Dn53xGAThdOXgj6xlOaDihRU23ZhFWylj/8xy7cZPNz7fGeDmmUDE1
TZvRXCdJsdYW7H3jAJyEW8nV3ef0hQWQ6DwaEeDS0ejk3s9HENjWAapBr8ds9hkb
Q6rYwW1OZA3/Bb8vAtwBouuvdky+/Q==
=dH9u
-----END PGP SIGNATURE-----

--Sig_/+e1KC_RMvubVVb0L8_AE3ee--

