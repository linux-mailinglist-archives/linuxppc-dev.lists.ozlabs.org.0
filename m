Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F222C6EEF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 06:22:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cjfy86scWzDvrM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:22:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjfwX1K54zDsQ7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 16:21:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=XHHWgToQ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CjfwR6yCVz9sRR;
 Sat, 28 Nov 2020 16:20:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1606540859;
 bh=G/77mzVGVkJ1P21yhssVEcy7P8QkwU8Fmt2CZ6ER9dU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XHHWgToQWBNQiIj5urNkvUcFWLEOEOJr7nuz7VRQ0iudZqaDy2foY5rnPmU1x7WIF
 UpApdenPnR3/MvtLskNqfM97OMZA+ugDgK1m/R5+u+vvOieWxikDpbyc5QnedfH9JX
 izmbVDvMp9XH/BesR/Y6ODaLOu/90Tm/uqgffgdO/2lmCoRW01PGniSbfEIIdCCHJg
 rYFT04geQrwr9JMJoPRpIoYuLJpA40+rZBh6xVs2S7rMk6cAPTWAaewj/gDRfyFg+1
 1pBhzOkzE9SWGlnyydGHc1Cg0HQv4GJk8xu140490yXWa1WwkMvDZGEs3dGl9ABK1v
 qQTEtn3a07sIw==
Date: Sat, 28 Nov 2020 16:20:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] powerpc: fix the allyesconfig build
Message-ID: <20201128162054.575aea29@canb.auug.org.au>
In-Reply-To: <20201127175642.45502b20@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
References: <20201128122819.32187696@canb.auug.org.au>
 <20201127175642.45502b20@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I=3tiLN0XLZrAWSSuz2Ag_u";
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
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Joel Stanley <joel@jms.id.au>, netdev@vger.kernel.org,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/I=3tiLN0XLZrAWSSuz2Ag_u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Fri, 27 Nov 2020 17:56:42 -0800 Jakub Kicinski <kuba@kernel.org> wrote:
>
> What's the offending structure in hisilicon? I'd rather have a look
> packing structs with pointers in 'em sounds questionable.
>=20
> I only see these two:
>=20
> $ git grep packed drivers/net/ethernet/hisilicon/
> drivers/net/ethernet/hisilicon/hns/hnae.h:struct __packed hnae_desc {
> drivers/net/ethernet/hisilicon/hns3/hns3_enet.h:struct __packed hns3_desc=
 {

struct hclge_dbg_reg_type_info which is 28 bytes long due to the
included struct struct hclge_dbg_reg_common_msg (which is 12 bytes
long).  They are surrounded by #pragma pack(1)/pack().

This forces the 2 pointers in each second array element of
hclge_dbg_reg_info[] to be 4 byte aligned (where pointers are 8 bytes
long on PPC64).
--=20
Cheers,
Stephen Rothwell

--Sig_/I=3tiLN0XLZrAWSSuz2Ag_u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/B3jYACgkQAVBC80lX
0GwFIgf4pkvlqKpzmRgyqk+s0V1tc9Gl8zToJYwqce1hR4QciFVaTeVkvik1MpR5
j6pW1eb5DB+1p7nDsEH9W2e/3Y8NZAH58xIuYz8DtoMhVFZC/ag/eQFeq8f7YPbG
v1166AaoNoBmBQaFYuLk+3fBc5RsedFSRik82Lpkad24U2KpjkTuTxEh19er5/3y
FKo5d37D1e2vSxwfggOJQ09Z1UsHU6RRb0V4vkLh9QI9h2bxzhiMmi6KvATA7Xg2
ecqbSb9293xx2VWSSn8I8PYyyVgkt4N6AwMvCdrJG/wIPBljcTCSqVbuh3lnGUD7
uz4kcTQF5VXbzVvq7Ph+kLFhBbnk
=fRdP
-----END PGP SIGNATURE-----

--Sig_/I=3tiLN0XLZrAWSSuz2Ag_u--
