Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F512C9EA6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 11:07:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cld7T3KLKzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 21:07:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cld2t3ZRjzDqS8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 21:03:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=IHjAgsfE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cld2r6g3fz9sVq;
 Tue,  1 Dec 2020 21:03:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1606816997;
 bh=FjlfdSawU3ve6xceGaXc0QUrfyKru3+HxazOT6mqyKY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IHjAgsfE79WFoxv6HT962TApwskmVwbg+TFoy4P2amGUPldXPj7dEfM9nw3ZY9obF
 6mv9vDBWM37rVBi+54ouahzhn1+Q34Ksg15gbui959tLFvSVNcUPtIZlilSTAiFohj
 IcHZNSm35vYFtawWC4FXpdJMm9m3IAi63A3pchrKKhC4v9beRrKFQ+NdiNNOrR9zVN
 N2udVtB8YtgPnBPY91MYCCsEIsZnEkZu30wmmskANsb7NMk2hZn8Fx/jcb9+xjRuKR
 6Pbd0kclOvdE10i7wstCH2KKjfh5QA5TVwcWDvtaFoYMc8dIMoqAHDLF62d0twCFqI
 zKH07q16tc6oA==
Date: Tue, 1 Dec 2020 21:03:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] clk: renesas: r9a06g032: Drop __packed for portability
Message-ID: <20201201210315.45a73673@canb.auug.org.au>
In-Reply-To: <20201130085743.1656317-1-geert+renesas@glider.be>
References: <20201130085743.1656317-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x=8K5Ql==6p6MPT1Tt8f7jL";
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/x=8K5Ql==6p6MPT1Tt8f7jL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, 30 Nov 2020 09:57:43 +0100 Geert Uytterhoeven <geert+renesas@glider=
.be> wrote:
>
> The R9A06G032 clock driver uses an array of packed structures to reduce
> kernel size.  However, this array contains pointers, which are no longer
> aligned naturally, and cannot be relocated on PPC64.  Hence when
> compile-testing this driver on PPC64 with CONFIG_RELOCATABLE=3Dy (e.g.
> PowerPC allyesconfig), the following warnings are produced:
>=20
>     WARNING: 136 bad relocations
>     c000000000616be3 R_PPC64_UADDR64   .rodata+0x00000000000cf338
>     c000000000616bfe R_PPC64_UADDR64   .rodata+0x00000000000cf370
>     ...
>=20
> Fix this by dropping the __packed attribute from the r9a06g032_clkdesc
> definition, trading a small size increase for portability.
>=20
> This increases the 156-entry clock table by 1 byte per entry, but due to
> the compiler generating more efficient code for unpacked accesses, the
> net size increase is only 76 bytes (gcc 9.3.0 on arm32).
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Fix authorship.
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas=
/r9a06g032-clocks.c
> index d900f6bf53d0b944..892e91b92f2c80f5 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -55,7 +55,7 @@ struct r9a06g032_clkdesc {
>  			u16 sel, g1, r1, g2, r2;
>  		} dual;
>  	};
> -} __packed;
> +};
> =20
>  #define I_GATE(_clk, _rst, _rdy, _midle, _scon, _mirack, _mistat) \
>  	{ .gate =3D _clk, .reset =3D _rst, \
> --=20
> 2.25.1
>=20

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # PowerPC allyesconfig b=
uild

--=20
Cheers,
Stephen Rothwell

--Sig_/x=8K5Ql==6p6MPT1Tt8f7jL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/GFOQACgkQAVBC80lX
0Gx20wgAi6BiXoJObYe8V+LMkb6ZXfIlTf41CHmeVC6NHNznore2v1594BTP0Zgf
gTyOp2mkrn+sKaunxMzoZt3aEwtKkSUs0t5ksN7WIS/Ilnp6RDqtUr3hk5L+Ig0H
M6GBg+78RiPDvAgF5xjxGTaDh5SCtB1MFNqGy+Yf1pe+p6JZtpBqhaXDLv+cvHSV
45Fj1RLJ23HYERQ/PUBPHwHI3hVco5EI5eEDuaXEJWGCtsAfWXsj3AYIylx3Emyp
zYlfxgr5ZVEKsTY8DJBgVvn5K85hjFIy7ljRx+3kByQh6IyPpWWUDoPAS5TfepCj
YvgHxHtnnei5Urke1xFol0P0jasF2A==
=A+fg
-----END PGP SIGNATURE-----

--Sig_/x=8K5Ql==6p6MPT1Tt8f7jL--
