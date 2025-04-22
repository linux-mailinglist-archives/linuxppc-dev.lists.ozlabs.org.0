Return-Path: <linuxppc-dev+bounces-7899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58EA96C0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:08:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhjGk41F3z3bjg;
	Tue, 22 Apr 2025 23:08:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745327310;
	cv=none; b=G4axTWdNYO02eN38Iy4F4VbMOGlTTHsHOwsNpNG9VzK6HYLxZsUonyYIP349R+GsAeZAv00iXA84LbX2otEXs+6rtAvWmFsTFxDKIwLz9rZNhvimxD5lvQmoUbvQv+LO3zcx0I2t4ePKS6bm6JfdADiaFb7KaB3V3yJDuKscNUf9XUGyxqUHlB6NTFYATyVYcAdnwiybC7NM6whXgiwdkMgYByt2JgRVEVxRT6GxosuitHxwzmn6jupVLmCLp/DdvG61wzS+Ryqx6pOJxaxtW8N7k8tLT1ZCZgcJuPZpuZUpAlRcUg9kF02/AHok7+H35mnxz4uNs4yz3LfePMKqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745327310; c=relaxed/relaxed;
	bh=a3orzNI64ybl8y3Gmbs9LFLjLlYqzJuNuqutXp9j00Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jD7Mavhci9O8yCGdEo2jB9MnQZZE+zzX/qAITrDtP3Ua4/SB3qLkzTmUkzFuxKVq5BQtbPoFWTNbxPN6QTNsKhDjrxucS5RIliKt8Yk0HRUqgW2//FQ2lFQ+p2QQB5Bod27i4P06yq77byQ/iVvaMrwDmDctsyZXlxcGYCi7JK+3mdXhIL3mY3H/C/vcE21dK4TnLBs5t+j6Ymz0QhqjxsWx8/vYkLYoepwFy8y5LXUdrOQVIYKDFSavF2h9Kc0j5WWTRQ8BSePo3SWYM++MoiTnaxux6zFGJS2yXw3R7g5EB4wk43OeJfVw3Ds2YZJt9aRgkLzaz0nX+gOaYjO/6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=Ptslmllo; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=Ptslmllo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhjGh6D30z304l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:08:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745327304;
	bh=a3orzNI64ybl8y3Gmbs9LFLjLlYqzJuNuqutXp9j00Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PtslmllosBpteRg/7cVVFRV1iTzBuHKpg0DQGZQarSOdKHv9oeW3iui8oCEIf03oU
	 PNS82XJ1niT4NoSAryiBrml45/JS2wO3ZzWtPjMx8jvM5sJpE1hxCZPLaueLBbzpOX
	 dCl+S7TzaMTtnjMKhEsq+T8L/0ou0109ZADN4RkZlsR1P0hY0eyl8dxT+0J2a52abx
	 4DU6MDkaMPXkzpv8S+CXLtW7le7qhLppaHvDgqeTdA7tJzrURmxkX8mkGGeLX/ag3U
	 h1BFER2yXQh6ZEmxh75sjPTCGD1k8+UWTr4HYdKTyMIO1w8zOktlBgg25Yz9bhOzz+
	 Hjxo3OJRIhD3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhjGb69HVz4x04;
	Tue, 22 Apr 2025 23:08:23 +1000 (AEST)
Date: Tue, 22 Apr 2025 23:08:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/boot: Fix dash warning
Message-ID: <20250422230822.12a81c95@canb.auug.org.au>
In-Reply-To: <20250422113023.356883-1-maddy@linux.ibm.com>
References: <20250422113023.356883-1-maddy@linux.ibm.com>
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
Content-Type: multipart/signed; boundary="Sig_/bS1mYDzUdFfGRTDoEGpTvtx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/bS1mYDzUdFfGRTDoEGpTvtx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Madhavan,

On Tue, 22 Apr 2025 17:00:23 +0530 Madhavan Srinivasan <maddy@linux.ibm.com=
> wrote:
>
>  # suppress some warnings in recent ld versions
>  nowarn=3D"-z noexecstack"
> -if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 =
]; then
> +if [ "$("${CROSS}"ld -v --no-warn-rwx-segments >/dev/null 2>&1; echo $?)=
" -eq 0 ]; then
>  	nowarn=3D"$nowarn --no-warn-rwx-segments"
>  fi

On the way to bed, it occurred to me that the above "if" line can be
written as:

if "${CROSS}ld" -v --no-warn-rwx-segments >/dev/null 2>&1; then

--=20
Cheers,
Stephen Rothwell

--Sig_/bS1mYDzUdFfGRTDoEGpTvtx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHlMYACgkQAVBC80lX
0GzD7wf+Nhbozebatxk6S5o637ZBjblGX7S5pMA7HwVRNJFXYq69QjlciFamXFrJ
C29+KScmoDZesRwvx95MsAn35GdRbVJYrCx8ZWYwKpLWkAphycINmBpVmG0DRN3X
VkyBB1Tq0BfcahLib7IQw2Ta+n62AJT0HsE0rzuo8q8p44BytUKt0GqmIuESbbbd
DruoXvbbIRuf1iM5ydAqhfzjHBfeF2ft08NGjlGD1VPNPMWqSRfkIt5X4rUUDbP3
Xj1apwof/w7JjTyiGH9iWS5AqRndhEbsUKn4bcafnIO6LcVitBLnjwNcWrTQ8Y82
In6MZMClMsEABdij8iLKisQByOEMHQ==
=0VvF
-----END PGP SIGNATURE-----

--Sig_/bS1mYDzUdFfGRTDoEGpTvtx--

