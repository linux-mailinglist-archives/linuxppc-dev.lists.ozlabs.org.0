Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28749929785
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 12:58:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=cprcw1Ql;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=v1QhUSyB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WH446602Xz3cQD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 20:58:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=cprcw1Ql;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=v1QhUSyB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=svenpeter.dev (client-ip=103.168.172.144; helo=fout1-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 400 seconds by postgrey-1.37 at boromir; Sun, 07 Jul 2024 20:57:52 AEST
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WH43N0zxgz30V2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 20:57:52 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id E8E5D138028A;
	Sun,  7 Jul 2024 06:51:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 07 Jul 2024 06:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1720349466; x=1720435866; bh=CM91Q+xk6v47NTJaf4EjRxe1prnQaEL5
	7qc/4uZC+jQ=; b=cprcw1QlsKeiNk3LZ2L3GkAaIv//2bvNKcwt88hqTRMizi2x
	y+QXCK0222ig8yo7Dqb3aFaGqf+XXOGbIa6qNbzEqsJNSeJ6PvZK2+UuKRNz7z5K
	BPgYLM1SfxCDMWU7IPtGrtG+4mWK43Tm1wW+mkif/IzzMsMoVKaX+jwXHk4v9nLU
	9fxUwF+JlQCSe+2mXznU4uL43GqaoCC5CE2D3vFFwMXg/9zyk38MiO/BGF5wEebR
	w1u/C7rrp/MJL+r5s/d4TUI3g9WpRg730oG1+3A1Xq32mise1VPdV/EcNR0sUsR9
	Pj3uhFOxou1fliH07dIRyJwx+XCKinMgiaGRUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720349466; x=
	1720435866; bh=CM91Q+xk6v47NTJaf4EjRxe1prnQaEL57qc/4uZC+jQ=; b=v
	1QhUSyBP75i4EnOm0GDFaVBq6D+IA7MkKdawMwIJdV3eOnEEUpLjaaFJ2KZWBSN5
	iNIJAJykZ/KQjd6GiuPLTFODSnLaWmRnT+aw3smHgh+CWpYvDOPAM39Lpc8LgenO
	xNlYUMgYtOiNS6N2ZXFUbvcPTLBtS7GIdQzhz4vqoLBhNZ9BTY9VPxzJF20KaNa9
	9lBCvXEqMu7aiHEnUJl3TNnfPsUiKQ8VOIm2PsqcDUykHKTIuZBIsKtTEAFhamyf
	SRhPiNDYY+6B36tlkVwi718GHN6WZF39frNZBwj45mj+c6ePzODiixcVEcEgEwBx
	oJtgOUufHESnK7IE90RRw==
X-ME-Sender: <xms:GXOKZkl_2Y_oD207xHOvrlwWM2DhpxfLpxAJBHnRCT9pgFCP6JahjQ>
    <xme:GXOKZj3kOJV1CEdX-j2K-BHv7FhbS7I2ZhvUdeCAUSwfyiZ9vWL0p0P5d3Se9j6PD
    FfvYQUbcko370WCY88>
X-ME-Received: <xmr:GXOKZipU5Otrs1RIBOYEnUM0_Zun9gSNJz6l0xH0v9b3z7P60BxkGAYdxCoHKnE_BrBU0mcNZlVbSm-BfDsDgZJq-usVNmxVp4UxA1p00hSQexoJ_5OCFnxE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehgdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpegtgffhggfufffkfhevjgfvofesthhqmhdthhdtjeenucfhrhhomhepufhvvghn
    ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpedvhfdtudduvdeujeeufffgudekvdefvefgueeiiedvledtheegieevffdtteek
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:GXOKZgn-cNueNhVzEF1lanMlyYKkFqHMPXXN--BKnWzyhaiu45OzHw>
    <xmx:GXOKZi0E6C3kKEM4hXM78hwZNcm3WXOdKqoalxcGlLu9Pvx5RDvdsQ>
    <xmx:GXOKZnvR7F_FJNEFo8rDc76qkz6TT-Q3QndKLpyy--P1HbDV6wZ7ww>
    <xmx:GXOKZuVEC9aj0iQwRazWxsL2RPSnJ2_AC2exX0cEhIzDFuRir0TsQA>
    <xmx:GnOKZoNI1i0hZHHb3KYgYjHPBsUjfKiNDprhVdoQP7aFgkRD7f_8ofEa>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 Jul 2024 06:51:05 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Sven Peter <sven@svenpeter.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 37/60] i2c: pasemi: reword according to newest specification
Date: Sun, 7 Jul 2024 12:50:53 +0200
Message-Id: <474C20FC-5A3C-473E-A0B2-A2382CE134D1@svenpeter.dev>
References: <20240706112116.24543-38-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240706112116.24543-38-wsa+renesas@sang-engineering.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: iPhone Mail (21F90)
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
Cc: Andi Shyti <andi.shyti@kernel.org>, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-i2c@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>=20
> On 6. Jul 2024, at 13:22, Wolfram Sang <wsa+renesas@sang-engineering.com> w=
rote:
>=20
> =EF=BB=BFChange the wording of this driver wrt. the newest I2C v7 and SMBu=
s 3.2
> specifications and replace "master/slave" with more appropriate terms.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>


> drivers/i2c/busses/i2c-pasemi-core.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c=
-pasemi-core.c
> index bd8becbdeeb2..dac694a9d781 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -336,9 +336,9 @@ static u32 pasemi_smb_func(struct i2c_adapter *adapter=
)
> }
>=20
> static const struct i2c_algorithm smbus_algorithm =3D {
> -    .master_xfer    =3D pasemi_i2c_xfer,
> -    .smbus_xfer    =3D pasemi_smb_xfer,
> -    .functionality    =3D pasemi_smb_func,
> +    .xfer =3D pasemi_i2c_xfer,
> +    .smbus_xfer =3D pasemi_smb_xfer,
> +    .functionality =3D pasemi_smb_func,
> };
>=20
> int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
> --
> 2.43.0
>=20

