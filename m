Return-Path: <linuxppc-dev+bounces-7738-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D41CA91BF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 14:26:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdcZX6XBRz3btn;
	Thu, 17 Apr 2025 22:26:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744892788;
	cv=none; b=Oz5EkjjupXtUNTmS9AhpUY274zlp8BgCgkJ8DGCTSK+H21NB3Nekog3PkELSO0y48HXy/o+1KX/D12JMs12DM1tSz8Tsqvp0hiSQJqZ1mzGF8tTILghaJmnM+Wo0+4ehHNwfzQ47ia/xmFYa5Ynmp5MvjBMvCY3I+1+Y5MZjco8HgjmtFbiEdSKFQDsra5I3Uo75MG8Rcm60GEYERrH6XwulU97NjPYWaK2bOcQ0jog9cms6gku/fNU7p1EK5drD6FjvLJCyqVZxwqis8aYcTseWKJi1/DK2FjlsaN2w0svA4m/8oy9WX4XDIzO5B84YjhQIqZADFPgVASzSAaT7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744892788; c=relaxed/relaxed;
	bh=kRxBgMG2LpqYjbVTje+9WNfR7ZeDUoJk1ySneyQlkPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGQBOaX1X5fuohGipzPcAJNuSw1a5lUS54FQKOPkpqEwvvkogYr1IbCcOXA7NlDGsEn0INxkZRJVL0+EWZL/UyOMx/kvYLnHzKkNXl8OPZgx3pykQDANIKbGQMht1ZPiRcjCv5m1Rgpm4Gke5L3HjhQnOD5tcPr6gclb/LNow2HAXAW7LaAzWXlK4ptr+8MLhTG1MEa2bWdJYAbVw5zHMcPM7wlSMxrBXy5hclvukUvgMRz+p4O7hOoBGzj/gOuPkX3sJAQga6fkT34WOWx+1yU/TwZ/EcNmLI228Pw4j5zOi3p5oEfZstfBXXuwY63sgshfcYizQge/Aty9kNGs7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=NTHucLyi; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=NTHucLyi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdcZX1bbcz3btJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 22:26:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744892787;
	bh=kRxBgMG2LpqYjbVTje+9WNfR7ZeDUoJk1ySneyQlkPQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NTHucLyiW4iNqVJ8JqmXKPoqdFnaX9JBWFojVg9O5R+GY4Y+qeZ6aCGz/y3fhMJOv
	 viTDZUBFMGsN5bhPlUF0USib8ENwikYaUMMLrUiSU2Smum+GzsNjb+4pXSWbroHgkA
	 BYJ7eOlKSkHJ9Lz4E4tFGKpWFj4aXxn4kPtAbHej13WykNUj1L0Gk4kldk9uC22ct6
	 RtGuDX5ubbVzAtJVNfawhS4yJ6EYQS8PAdLK+m5/LLLMZ7C4urzIAf6Qzmms93hCTj
	 o/+iY70+GQD/4+DW9DtMu1k8Y5imzQS5OrI+U6WnrRnsGUPpq37yTn6Vunt7slV8K5
	 BqgkcgWLgGl4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdcZV656Vz4x8b;
	Thu, 17 Apr 2025 22:26:26 +1000 (AEST)
Date: Thu, 17 Apr 2025 22:26:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: maddy@linux.ibm.com, linux-kernel@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: do not build ppc_save_regs.o always
Message-ID: <20250417222625.50a6684e@canb.auug.org.au>
In-Reply-To: <20250417105305.397128-1-jirislaby@kernel.org>
References: <20250417105305.397128-1-jirislaby@kernel.org>
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
Content-Type: multipart/signed; boundary="Sig_/AdrgyeNqwXgUiyco/PGm_Mo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/AdrgyeNqwXgUiyco/PGm_Mo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Thu, 17 Apr 2025 12:53:05 +0200 "Jiri Slaby (SUSE)" <jirislaby@kernel.or=
g> wrote:
>
> The Fixes commit below tried to add CONFIG_PPC_BOOK3S to one of the
> conditions to enable the build of ppc_save_regs.o. But it failed to do
> so, in fact. The commit omitted to add a dollar sign.
>=20
> Therefore, ppc_save_regs.o is built always these days (as
> "(CONFIG_PPC_BOOK3S)" is never an empty string).
>=20
> Fix this by adding the missing dollar sign.
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Fixes: fc2a5a6161a2 ("powerpc/64s: ppc_save_regs is now needed for all 64=
s builds")
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org

Thanks for that.

Only 7.5 years later :-)  This shows why I should not have been fixing
problems in linux-next, I should have only ever complained about them,
like I do now :-)

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/AdrgyeNqwXgUiyco/PGm_Mo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgA83EACgkQAVBC80lX
0GywEwf/WKqVgTtucvJR5XWjZC/k5Z9n+/rd2S1x/h5tDfYGPaQFOOdyooaQm7Dj
z0T8C1FvnuIDUNH9TZUKUu4vdf2y09nCtpTVerfRTZ0qgCbFdop8sUylxbkHvJ3E
J9truj4d7HyB4ZFFStPypbzO+WNULp3a+S0xAYBzsDYKDESJ9bHuRfzCbXuN/i7g
9QpXZdLg851zPi0AFnlBNkoLOCPyKmt5Fp0tpxtTBSNVgYOFqPLGxbWCONY1IGwx
f6QKRrSL1/0QMXhWqhQi+ExI+SOecVsEzeRTuK0wY3msPBb3rNIn/+lrWKZ9i8My
HrggBVKCZAiZHYhh+Xrt7QGyPvURhg==
=nL1d
-----END PGP SIGNATURE-----

--Sig_/AdrgyeNqwXgUiyco/PGm_Mo--

