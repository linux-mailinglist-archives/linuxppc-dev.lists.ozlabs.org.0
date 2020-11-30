Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B53602C821F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 11:28:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl1dv3qytzDrHP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:28:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl1c84m9bzDrB0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 21:26:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=XrQXDVO9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cl1c4600Mz9sT6;
 Mon, 30 Nov 2020 21:26:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1606731992;
 bh=4DHMoxKJd9BFptsqCNzPXSnHv0vKTr1Q24eGJ7q15mQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XrQXDVO9OZaGgrCEqU64avYKUIZ7ENtiTQeFZ7NvIqFB0gfxc9WjmSXK3aOTIvWsN
 PzhkaoM+4RgH17ugcofpZEVjw8t94UhEE2uSrown8NtUyTKr2dXHvV8L4Qs2g1nhcf
 85B5UgShnT64fPtkpgpwSh6PuaFx+SQK9HwGRK2VbRd/h4RPq12O1foMqkc+m9pxeN
 stVCLxCS3z793ox/Ycupmm72WDNbkh0yiTwk0kewvLOHGEv/ZguM1T2hwOzARLcg7x
 1dKCFIfcXlLBnIXiVSOu5FBgUmgQgpXoKuszbFyUX6z8SJZbSxm6mGmuGE/RFlLnSc
 TdHdiasU3FzBg==
Date: Mon, 30 Nov 2020 21:26:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] powerpc: fix the allyesconfig build
Message-ID: <20201130212627.3a20b558@canb.auug.org.au>
In-Reply-To: <CAMuHMdVJKarCRRRJq_hmvvv0NcSpREdqDbH8L5NitZmFUEbqmw@mail.gmail.com>
References: <20201128122819.32187696@canb.auug.org.au>
 <CAMuHMdVJKarCRRRJq_hmvvv0NcSpREdqDbH8L5NitZmFUEbqmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e3GNl5Sde7_nRpv_2Sg=je7";
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
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Joel Stanley <joel@jms.id.au>,
 netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/e3GNl5Sde7_nRpv_2Sg=je7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, 30 Nov 2020 09:58:23 +0100 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> Thanks for your patch!

No worries, it has been a small irritant to me for quite a while.

> I prefer to fix this in the driver instead.  The space saving by packing =
the
> structure is minimal.
> I've sent a patch
> https://lore.kernel.org/r/20201130085743.1656317-1-geert+renesas@glider.be
> (when lore is back)

Absolutely, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/e3GNl5Sde7_nRpv_2Sg=je7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/EyNQACgkQAVBC80lX
0GylCwf+JP01sreFsxom9d0ts5QMDlH3pU35scrqkVS2jWpB25zrGhgdrrneKakT
aF+kF4Mcu2ducPJwpWECkJAVvz6frXPTQ5wXZFyeWXeT37UF69LBtEQVDIATpBEe
AC2F4VA9xxAQZOWo8uRJxgVgkTLuoyvFCrEfrtM4d9o8HIDmPLc2cc5QVqSXONYn
T8fBtDqyh6+oe0DyLJuZfvmzxDX1+7jW/6XWPYyjs8fV6w/3787DvCzRhvTdOCrP
BWsdr7zt822PvhMxh5OWN7EYgo/GZTM5Tw4E2EVbnyj4l2cFo4gI1vn9AuKMjtw5
dYHmGSgw/TGtOHUd4EpGv72jecslhg==
=7W56
-----END PGP SIGNATURE-----

--Sig_/e3GNl5Sde7_nRpv_2Sg=je7--
