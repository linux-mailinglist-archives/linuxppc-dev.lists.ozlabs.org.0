Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1822C906A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 22:59:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClJzj5ZYBzDqwy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 08:59:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClJxj3BQHzDqv8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 08:57:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=eMjMdoHg; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ClJxg2YMkz9sRK;
 Tue,  1 Dec 2020 08:57:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1606773465;
 bh=nqVDwgyOEZiLm2s85MNpU0RJnN+/CWkXa1ePB8H74O0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eMjMdoHg1nj3aaR/ihevGuljfQKC+8k6BgWcY1goCbVsxBU0fJLF6W28Yyw2Miqnx
 rE1s2cl00rCqtgbN0YwiOyZspQBteiX7ySTPs1JXQBndGt6HzXMEoTdgyQtSmOyqFJ
 56Y/AshGjcuPsexS1vUPumZj6YvOjdB6mOqqXF9/0WDPfWDU3peL+IJ8P3gN5dro/9
 x4luHkQy3MSzkcfysb/+XYsKgSuz8wEUhwpNmuCesaRULVrwxkEmQsiIP5v6AxlD4E
 2RP4pweF2PjCnzlK/c4P0EbyhCzGxlb/6eCi4YpSHqdmviDAJPj0OUPXHHnFMGUYj5
 XgG2n1VE9BzaA==
Date: Tue, 1 Dec 2020 08:57:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] clk: renesas: r9a06g032: Drop __packed for portability
Message-ID: <20201201085741.670f30d4@canb.auug.org.au>
In-Reply-To: <20201130085743.1656317-1-geert+renesas@glider.be>
References: <20201130085743.1656317-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8CcZFUCd6vvSy81ZVtgxF0K";
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

--Sig_/8CcZFUCd6vvSy81ZVtgxF0K
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

Thanks.

I have added that to my fixes tree until it gets picked up elsewhere.

--=20
Cheers,
Stephen Rothwell

--Sig_/8CcZFUCd6vvSy81ZVtgxF0K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/FatUACgkQAVBC80lX
0Gwj4Qf7Bge2IGl5zmxh8L/d6Cxz8V2fApcuHXyQ2TF3PeQMWrF/07x4CKb6Ulka
/l8LefVGxKMNJePlyDad7ZI2j893BnUiNbZIf78vbYdCvYMze/dZy7DJHPEjnYQI
x90IS+NUTSWXI6HHZ2qDCZoCh+wrAXnKV29Gbi2tywb+F4eV9M7eu1s/XJHm80P1
zHjiAClpipnbzl4O7LhOeKEkLfDFkv+6JX788FM5oYOoXXl7JKa2Cxw0DoUVSskN
aXldweVNdjdlJWfQoDZ59So/HhcfS++W+6rrunrS+8nSCLQuK6rpop+hZzOvaaEB
rxTngm9SqYXsCwnO0hq4Slv7Y4IkbQ==
=/Pyh
-----END PGP SIGNATURE-----

--Sig_/8CcZFUCd6vvSy81ZVtgxF0K--
