Return-Path: <linuxppc-dev+bounces-5101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1CA0ABCA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 21:20:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWRbq5C91z30hY;
	Mon, 13 Jan 2025 07:20:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736713255;
	cv=none; b=imxDmZYU2N3uTY1uxUf9hwJ9giNkfzcJo96fkqCbkYvkxJ8HT+TgysFpgdLP6cAKZVwj7pmEIw/dJBUBMw/LYUNixcURbFW4aTkCva8TO2Y3XzhZUPcG3iBIX1MWgYQqq/UrIR0+VK4uax69VKySQVfLmBkMOuFBMwI/Ea7C5t0Wjuk+5MF5L2gEaV6Vcwx1XqgPPWT1j1HKgalVpdezjuR6w0ExrJx9j8BXtPp55BdCoJFlXWD6nzBKe34kKobkxo9PPH0j6dlhs+m+RgQkH0npT59tcwyM7ulbBeY23VtUE1E5buX0Tk4x8maGYGFEaqM/BkX78Ulfi7T5IkFyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736713255; c=relaxed/relaxed;
	bh=zRBJj6Vn7UPvJ0xBv3dFGCNq0c2egtRlh3KtCFimN1U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOc84YSTLmug2R2ApEOX3jN9s8M7IIxBhkLJZc1gbq0yDWz3TPUZ8TcE0Jl+X/M1wY56n8QPYhbuWsBDUv/9sB39/lKFpPo2/idO7PrvqBMOKOc7uzqPEGZ0dk1WnovVL7vVVkLM0aZI3cvFw+pLwiiSFT9wcSNvyjJoo6FFu4wY38ODmS6FHRjddHDV2s47seo2RCcpdhHh/23TtM9vdmtwjBc8B7DnncEcBR3DGymN9KOU1onpLINyKuwTWjJBCl/ZxTj/QdFQMMgm1zL+sfE+giKiYiePH4Y1UP4Pc22mQtYzPdX2pCDJoYVLwyr0FpWpQC9G+fbwJ4LC6H2JBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Q8n7dxbs; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Q8n7dxbs;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWRbj49Xxz30hG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:20:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736713233;
	bh=zRBJj6Vn7UPvJ0xBv3dFGCNq0c2egtRlh3KtCFimN1U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q8n7dxbsqI/ILmya69IFQBdYucXVteZ3Uq/rxEtdgE6jCvC0ZkADanK9Q8MIQMHuV
	 nVxO6v2b/FrG+QOx0rO4OQnrOj1RbSu4cQBLVWnmcb7YBXLamAgw6fSv63ehX2Gs7m
	 l1qWCBKL6ec7TUh/dXE1XX3dVQBp45lyIDRWFyb6MUblZG0UUqPR+25VqheZh7xHCU
	 t2AxyJRIV2ZCMyf8rht4RumhXTjpLa6R+3pLUKeu3iLsX6QJBWPvbiPITmtg0mx5t4
	 5QloNM2f2WvZgCepXYccppbd1+vrJuW/W0krEcNejis5U0dpJiKmlnOsGf0Ft5q1dz
	 SVwrIH2x49vKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWRbN1Fqzz4wcs;
	Mon, 13 Jan 2025 07:20:32 +1100 (AEDT)
Date: Mon, 13 Jan 2025 07:20:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Naveen
 N Rao <naveen@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: powerpc: Update my status
Message-ID: <20250113072037.55aff81a@canb.auug.org.au>
In-Reply-To: <8734hqkyrx.fsf@mpe.ellerman.id.au>
References: <8734hqkyrx.fsf@mpe.ellerman.id.au>
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
Content-Type: multipart/signed; boundary="Sig_/u_a_8tmP9Tur4GF4XSaG/w=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/u_a_8tmP9Tur4GF4XSaG/w=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Sat, 11 Jan 2025 10:57:38 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Maddy is taking over the day-to-day maintenance of powerpc. I will still
> be around to help, and as a backup.
>=20
> Re-order the main POWERPC list to put Maddy first to reflect that.
>=20
> KVM/powerpc patches will be handled by Maddy via the powerpc tree with
> review from Nick, so replace myself with Maddy there.

I have added Maddy as a contact on the powerpc and powerpc-fixes tree
in linux-next and replaced you with Maddy for the kvm-ppc tree.  Are
there any other changes needed?

--=20
Cheers,
Stephen Rothwell

--Sig_/u_a_8tmP9Tur4GF4XSaG/w=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEJBUACgkQAVBC80lX
0GyrcQf+K1OwOON9z3AcXXS/sI428I/dGysfYtj4Y4cD3z4l8U66N+aVVOinRI80
c8MPWah6zFGjc223NlpalU6nb3at1qgCgxl2c1jY0+1ZyapVmTAG7Skox/34ylnI
SblRqhknqc2MHyxW9+XRahmJb2xDDZ2y05tfA2WGzLEwPr7+Yl1ZlUogP6t94+8h
FfGSri7SK1pA0A53+qozIFt86jlSpNBgAiX0l7FcCRdjHDXBBV5IQaTE5hawCpeZ
7cShR8MeRRYgLik9MENz6FUGXfeTXiHfWPm09DppP4mWIDJmJc5qxdNxYjO10die
kmTVTkikqSALttBE++ZTVBWxjyON2w==
=XoiD
-----END PGP SIGNATURE-----

--Sig_/u_a_8tmP9Tur4GF4XSaG/w=--

