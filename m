Return-Path: <linuxppc-dev+bounces-7942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540C4A99B9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 00:41:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjYws5wfBz2yGN;
	Thu, 24 Apr 2025 08:41:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745448061;
	cv=none; b=Rmjy5crN46K5L/T31+0qKKjyQvtmo8Q40oN+Rw+TZW0MhXwRpjBGeRyUribnfTXiFiSOmBUJ6r+OwB65QUYpUr2zgeyKRMjRf7X9zWarGoEijiFusJqI9smJ2tOM5n7QazNDUIQmH1345qYX8y46GH/dZzebsAqGX3VyvHYmQl1iFKzDlEyYNG7MSoUXNKWkBBCpXDaK+XA2qVRT2vOMlPsSWWr7prZfgA7TRLyvR2fB2ardQlxQUZ2uIFUkwmJq+qNaW5I7ulS3qvNUReoOWowFVXZtgfexfsv5x4aKwAtp6MZz6VztQ0Tm5rIik6/kSr7R4jti7/oqw/v8pNnHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745448061; c=relaxed/relaxed;
	bh=cZmhf8eVzF2VnPKL2igjl0a5SH3xvS6UeTjP3NNRkI0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EN95/h/UDYjU7Cw9iuOZBQEpziPvXpdD7ixLnEO4JJdOjwsmNE7wknwE4msVJUuYxTbDnKoPRBFSzNdNbvcp00LOY2UY7vSriCGz5oRcTYZ85oggOdh7kIOTcbJHCkVs1bLs7YSzOjxZ8Z3uJ9RKfhYVlo/BefWIyiaytx78cyPcIo+J8JKtbT20gWB11IaDMSw5j3mzC29xmSNZeNkKjwtbNXxnsz2PXVHTARSiTnvtbFcn6+sRzVQoEJCuzUzBqe1W7OulVDNzGqZ+NOzno+Dox17pdJ+8IXCjLV8IxMgC/IsmpgTQoII7C2yAL18n2/0XedCBTNm5fpv5FDw2oA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=X0yjGxI0; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=X0yjGxI0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjYwp6gCvz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 08:40:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745448056;
	bh=cZmhf8eVzF2VnPKL2igjl0a5SH3xvS6UeTjP3NNRkI0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X0yjGxI0OnmBqbnLyqdaAD+jQtmRM+UxAkr3ca+sr7dJcWhXAPRkcmKnE9ZGihfoN
	 C9AHFTqk6n7AH6dTUO5FEFeuivinQ0x1peTSaO2reKXhcA8/Of+9kMbC3917iDB1fL
	 NLQXvkhW2nT5sUa4Fj/ZNl2JW2/dgS8cknx+m4xnKkYMMt+IvpTTIf31UAWJBDoQnf
	 SW/JoScQew4QC/CejTOMBMHGs4yVf5r6mOmjgjEZX2p9/LlMpC4JHAdU6Ek3qhFo+I
	 u4u1KmYL0kaR8h+xpUoEng6evmomkJc5m5/A/eV5DN67UhwBJiTdM+l7IZJzz+vj2K
	 r0Ske/FF1+M7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZjYwl2dPGz4wcT;
	Thu, 24 Apr 2025 08:40:55 +1000 (AEST)
Date: Thu, 24 Apr 2025 08:40:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: mpe@ellerman.id.au, christophe.leroy@csgroup.eu, npiggin@gmail.com,
 naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/boot: Fix dash warning
Message-ID: <20250424084054.6c44e81a@canb.auug.org.au>
In-Reply-To: <20250423082154.30625-1-maddy@linux.ibm.com>
References: <20250423082154.30625-1-maddy@linux.ibm.com>
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
Content-Type: multipart/signed; boundary="Sig_/.ZHtxH8YidpfaiLFA0JNtv9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/.ZHtxH8YidpfaiLFA0JNtv9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Madhavan,

On Wed, 23 Apr 2025 13:51:54 +0530 Madhavan Srinivasan <maddy@linux.ibm.com=
> wrote:
>
> Commit b2accfe7ca5b '("powerpc/boot: Check for ld-option support")' suppr=
essed
> linker warnings, but the expressed used did not go well with POSIX shell =
(dash)
> resulting with this warning
>=20
> arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX p=
ermissions
>=20
> Fix the check to handle the reported warning. Patch also fixes
> couple of shellcheck reported errors for the same line.
>=20
> In arch/powerpc/boot/wrapper line 237:
> if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]=
; then
>      ^-- SC2046 (warning): Quote this to prevent word splitting.
>        ^------^ SC2086 (info): Double quote to prevent globbing and word =
splitting.
>                                             ^---------^ SC3020 (warning):=
 In POSIX sh, &> is undefined.
>=20
> Fixes: b2accfe7ca5b '("powerpc/boot: Check for ld-option support")'
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Suggested-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Changelog v1:
> - modified the check to use the command exit
>   state instead explicit checking with exit code
>  =20
> Patch applies on top of powerpc/fixes
>=20
>  arch/powerpc/boot/wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
> index 267ca6d4d9b3..3d8dc822282a 100755
> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -234,7 +234,7 @@ fi
> =20
>  # suppress some warnings in recent ld versions
>  nowarn=3D"-z noexecstack"
> -if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 =
]; then
> +if "${CROSS}ld" -v --no-warn-rwx-segments >/dev/null 2>&1; then
>  	nowarn=3D"$nowarn --no-warn-rwx-segments"
>  fi
> =20

I have applied this to linux-next today and will keep doing so until it
(or a replacement) is added to the powerpc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.ZHtxH8YidpfaiLFA0JNtv9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgJbHYACgkQAVBC80lX
0GzLqggAltMrTUQdcnRr2nZEFa7X/mr9wrSOxJldILKcC/1lyRiqGYF2pSp/YUws
TYECKheQYbyUCbIrqW6GwSe1fCxBXfQErawZj44qduL+MXfg5yvQxyECBekyj2+3
qHtr/GCVR5Rqhj9lWJPvxdDprweFPiEWttDU4Sj/WGL8H9bxVrKXkZxB6TZbafO6
r+YxApdT0JRe7h1AZr7e8l3vgIElsaucIX48z4eOdhnPFe78cHsoj4WLbOILMD9T
dA3jrcZ9sSFX7eYJdBWlgiZqy9ZOabJ9oLi996h52KcpanUTB1A+y2MMEnuIxXAE
3r0+PvcgrQqY3bfVpVJasUl0ijSFzw==
=tunF
-----END PGP SIGNATURE-----

--Sig_/.ZHtxH8YidpfaiLFA0JNtv9--

