Return-Path: <linuxppc-dev+bounces-10431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB18B14A28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 10:32:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brpW12jfTz30P3;
	Tue, 29 Jul 2025 18:32:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753777949;
	cv=none; b=Lkdz+Ko4IfdFrMKX5vXCR2gS50q5UAHS1h7stMoHqk8VFP3Czr7UPEJHHh/BeyxnvFDODf09ddthbUEPrVE2iLQ9wMrnkVjkXaodKDOAUTMLbyKRphB40+3ZCD6cLZ7vW31HZvcPSsqEk0VprL+Lee8uSNgNaP3rDTGvST+Q9Es4haf/pEPZiq+P2OEO/xh59XTJ4oB+vbxlE48ubCSwGtC5gmnO1u7x/Jw7gNpG3SU03VNNVznJjPI3xm6BjPSPP1YlKAMidAWvF18PH4tnG+EUty73IOFfUg6Enxaf3O9mKSLLaltd3a/Z+pMI7pwwHOAi4FKPThFVvf6ieQzLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753777949; c=relaxed/relaxed;
	bh=/oCQkfnZGNg+YxX/6sdCLzxmljra23wrZ0p0Um3kfE4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nl3mWFxg2HmYLvNNFbPEqM0PR7skf8q+5yximhE609K38kVtpkzPpVIPSbqX5UZDHjm3YrIq+blbM5ksSSGAwaxEur7Fxs+OADkaYKEmCpWiyppJsxGnofSdCJodLns/vhVNoCZC5xmSPqmpX0D4bDjDglWHSXRW6db2TshUNaVp49CJbfRi2hp7EWyNu3WrV2XbLBj4VeWsokmb0eLc5kP2IIO8OcqPedjuWdFbzigpRGYApXU2rk4+p7ICRA4I6Z6mJ0ZgI9wI8xImxGW2KFoa+acdXaMayLWvzjGED1Xww+BHAYfiY1mfklIvqvsvGaWnkHLTKbDu9+ziWn8IZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=Ayw0qUN8; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=Ayw0qUN8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brpVy47Qxz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 18:32:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753777734;
	bh=/oCQkfnZGNg+YxX/6sdCLzxmljra23wrZ0p0Um3kfE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ayw0qUN8LlWRz6vlZ3K+1nAAJdGKf1GyqDROoCBd0VUPcM9VqA21jb86aOtN8+2Fq
	 altYdd/G4GmMU+NQawL7/1rKOPTjEl6GbRtXBc3m0pfZ07Dvg/ryHRUlh4zVGp/7F7
	 BjpJ11rizIdBidq4GIxCeDHDcu6w+tKXgXYTeOVGhTLrMVRgDtmcxvixB5Kejy+Ys8
	 /ClS1C2hM4qm0fAFFt6z97Azqp7611DwPgy3o4+PcvNrQJ46gE3/zOdjyWEPQjfxBG
	 vZ61Qg5Gcle6b/DNW+j/owyNjo/8Xxiifx5j6sEJQqBQRT2lJDYY9b+vfzGfzWvcgf
	 UT5kMTEBbE6zA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brpQt1cg4z4w2Q;
	Tue, 29 Jul 2025 18:28:54 +1000 (AEST)
Date: Tue, 29 Jul 2025 18:32:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: <linuxppc-dev@lists.ozlabs.org>, <maddy@linux.ibm.com>, Jeremy Kerr
 <jk@ozlabs.org>
Subject: Re: Ozlabs patchwork notification not working anymore
Message-ID: <20250729183222.15adbb95@canb.auug.org.au>
In-Reply-To: <8f6e5825-9468-4499-9bbd-4588a1eccc94@cs-soprasteria.com>
References: <8f6e5825-9468-4499-9bbd-4588a1eccc94@cs-soprasteria.com>
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
Content-Type: multipart/signed; boundary="Sig_/me/QMG3XsNaoN4kwqE8B.hM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/me/QMG3XsNaoN4kwqE8B.hM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

On Tue, 29 Jul 2025 07:41:40 +0000 LEROY Christophe <christophe.leroy2@cs-s=
oprasteria.com> wrote:
>
> If I remember correctly you maintain the Ozlabs patchwork aren't you ?

Actually Jeremy Kerr (cc'd) actually manages patchwork on
patchwork.ozlabs.org (I just admin the server it runs on).

> For more than one year now, patchwork for linuxppc-dev hasn't sent=20
> notifications about patches status changes. Last notification I received=
=20
> was 11 June 2024.
>=20
> Is there a reason for that change ? I recently got questions from people=
=20
> asking me why they didn't get notified when I started looking at their=20
> patches.
>=20
> Is it possible to restore previous behaviour ?

--=20
Cheers,
Stephen Rothwell

--Sig_/me/QMG3XsNaoN4kwqE8B.hM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIhxYACgkQAVBC80lX
0Gxczwf/eRylRcMsh5Fawr68lFCJTt8R0VRZ4PvlguTOhDowYeJKc/ks4sgeOQUp
ikRjcJXUOjlXoU002/ikj9adSudRCC7OLphzCRXsCpFJHTjkCu14/Dkp+QCZfLFO
IW9yuVgG8o5JSUMOzCNinT04qSQhraXdPY5bvRZzzWWpHln4YWvGo3L+R7joJFxM
gh47IaDhg6UTojZ7LyCIeIzZ7yRzk8q396AXvLQyf6NN4O/fvgZeUwFYb+r5B9t1
fYvpuZe7PASawxswfzn6q8hhFV28jv9T9D8m1BWvJ1OOD1ciGsjPESkB1EwxrBTG
khqGivvo90L7ZljYjenEZ9AlZBww2w==
=JW4h
-----END PGP SIGNATURE-----

--Sig_/me/QMG3XsNaoN4kwqE8B.hM--

