Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F77872C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 10:18:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xsyx4MS6zDqDt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 18:18:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xswt1J1vzDqDV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 18:17:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="KuwtfCog"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45xswr3RwKz9s3l;
 Mon, 29 Jul 2019 18:17:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1564388221;
 bh=QTGSK8b6jLhRPZsvILGhaC9+i81pGyxrPcsA6pWARvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KuwtfCoggLzAn9DYKFsM+bXE/v6CWP74qimFUg5dgIAr8+JdD+K/7r0ktzaEzCE3J
 BosHXKti9xtRlAk/vbPgy8Rcl6nXJ2ClwFsPCOzJsfQ+W/TMqdQwuaAZ/ekh66VSST
 EnlpJcbBIBX5Hk09Vf2bosLt/MZYf7LpBx5yx+SBdvbF5hpJJ2NRMPExjBksbmozTX
 OOb6xkWltTQ+EaDlpOFtdGjqcELU9Fm+ByCIBm9p+LP+fUVajgbV/4/LUx1NAJN5u5
 hYB6uyrENyzMDROCCTp0DuHEHeulZlM6sQLncEi9sRTUhvXnS0PWn1GTcNrQXRRcpF
 dcbPTt9Y/i7wg==
Date: Mon, 29 Jul 2019 18:16:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Santosh Sivaraj <santosh@fossix.org>
Subject: Re: [PATCH] powerpc/kvm: Fall through switch case explicitly
Message-ID: <20190729181651.4b9586a7@canb.auug.org.au>
In-Reply-To: <20190729055536.25591-1-santosh@fossix.org>
References: <20190729055536.25591-1-santosh@fossix.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rExPsN0GRo/hs_UJDe5wfcA";
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/rExPsN0GRo/hs_UJDe5wfcA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Santosh,

On Mon, 29 Jul 2019 11:25:36 +0530 Santosh Sivaraj <santosh@fossix.org> wro=
te:
>
> Implicit fallthrough warning was enabled globally which broke
> the build. Make it explicit with a `fall through` comment.
>=20
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>  arch/powerpc/kvm/book3s_32_mmu.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/powerpc/kvm/book3s_32_mmu.c b/arch/powerpc/kvm/book3s_3=
2_mmu.c
> index 653936177857..18f244aad7aa 100644
> --- a/arch/powerpc/kvm/book3s_32_mmu.c
> +++ b/arch/powerpc/kvm/book3s_32_mmu.c
> @@ -239,6 +239,7 @@ static int kvmppc_mmu_book3s_32_xlate_pte(struct kvm_=
vcpu *vcpu, gva_t eaddr,
>  				case 2:
>  				case 6:
>  					pte->may_write =3D true;
> +					/* fall through */
>  				case 3:
>  				case 5:
>  				case 7:
> --=20
> 2.20.1
>=20

Thanks

Reviewed-by: Stephen Rothwell <sfr@canb.auug.org.au>

This only shows up as a warning in a powerpc allyesconfig build.
--=20
Cheers,
Stephen Rothwell

--Sig_/rExPsN0GRo/hs_UJDe5wfcA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0+q3QACgkQAVBC80lX
0Gyrrwf9FAW9tfADHo7wgSxpAXk7UBrDuhWFwjx4HCs0mEppx6Ut0CYRu6gD7BBq
hly9Iik4uIGnTzlPqgyqAynHCBhfvmmV5Z0ZhKfAbozqW7hZr4vQaMAZHPCBgeOl
SSYXYioMuLEmr1oiEn1NgdYVPqKGDf60zoQZTiQtgBjlCdLHIQtN/k+uShfzvMHD
697dhHCkzVzVWHfCVM3Put15/BPlYTDXFareolLnoO74Gdf7jIp+Gokrr7ILYuR3
SXstfk0NAvDFiI1U0bU2lAIxh+KY12HQfsipj4KgtVOD9Sw9jYJU83ZLvPhpawJz
ZjgckByP5q7kdB8O6sLp1FBKC6Kaxw==
=DLbG
-----END PGP SIGNATURE-----

--Sig_/rExPsN0GRo/hs_UJDe5wfcA--
