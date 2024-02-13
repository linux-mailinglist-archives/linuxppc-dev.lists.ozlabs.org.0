Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ADC853ACF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 20:21:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=nWkVD6yZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=wQldVuk4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZB5w4gFsz3ddR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 06:21:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=nWkVD6yZ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=wQldVuk4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=svenpeter.dev (client-ip=64.147.123.147; helo=wfout4-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 438 seconds by postgrey-1.37 at boromir; Wed, 14 Feb 2024 06:21:11 AEDT
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZB5356ddz3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 06:21:11 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 1943A1C000C3;
	Tue, 13 Feb 2024 14:13:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 13 Feb 2024 14:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1707851627; x=1707938027; bh=aytn2t5q3qBY3VpYwP44OHJAU0vpWTVc
	TQYfF06P7ZE=; b=nWkVD6yZKBVHJeUkuz3pOdHRt/YfGoYvWf5fzbFbPag4HL8t
	w+WOBiNObAy2aNsjodlq0TbEhiJwPB8s+RmUVX7VzB4DjU9Tm7Mcip/9XIRO/YQR
	Ar/p3GHJO3ABddjjsJg6/0+K6/FLzhJDon3JZECS7xDBK36f0C8gnGaZGw5OD07R
	ZPCPGAJQP9csitbQvUK4g8NdJm+PlOIfwCCDYux3EekHs+1kMiVXgznKlTyyj7mz
	ZOGiWDz9kxYIToeynSg9EngFgCFCl/AP+ZNAwu0FnTXqGeAKRbROAwCv+wrf5pG8
	8EkjnXdGo3ainLQnb2vmB5NqmNmr9y4hn00s0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1707851627; x=
	1707938027; bh=aytn2t5q3qBY3VpYwP44OHJAU0vpWTVcTQYfF06P7ZE=; b=w
	QldVuk4gZDTWiVo3CkCgrO87kxj1Xi/JPcZwTWPldhesBT3VDOzYpEmoSbBEvRqb
	C/fpOGzXSSOOt0SQLOckT2Hx/g42Qr9R/Q4vaKXhNX9o+92TLPpsfJ3EUQzdlESm
	elnedrOPht2OV+2yQTSl8sdRVtwDMezkBvL4f4m7/PBGBzD4WLNvtjgpsqQmMHTd
	6LZgMA/OFUORl73roh5EmD+T3uIMoPrKvxr7ZMy3xk3fLdOJ9CRuo33XdFPriN8A
	Xhj7B5UUWGca+z0IKX1Wzio93aVxWf7h/3pdSx6FS2g0NOQ5rZcOQGqSfI8tCOoJ
	9285fJd3csE6+NgK7vSSA==
X-ME-Sender: <xms:ar_LZYYKEjzYw_HOqrHJbG0xttmDiBm0E0Z_F-Iqzol4STYOWrzQzw>
    <xme:ar_LZTb7oPiEdNNAGHcuBTjdoX3BmsJPzDUoeJtPjU9luPbDJ4FGOm_shhuNdZVtf
    0r6TDmff1cWJJUAZPM>
X-ME-Received: <xmr:ar_LZS_SZd8TCOD1FYzkQzd9hJbf7wtCyJeBV8akNG93gNn2PWYhZRS2M1-U6KiFwiqMaNW7JyIk4bZPGV_x1Twuy0UmwOTKZTU1hTc_7rX1iH4zNbM-PyO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptgfgggfuhfgjveffkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpefuvhgv
    nhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrth
    htvghrnhepveeugefhjeekheekfeeijeduteejhefgheefjedtveelkeekjefgveefffei
    feelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    hvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:ar_LZSokaGPe5kFD-iZABY1DQfnV6D73EbqPA1sYZCCj3pNV42VGZw>
    <xmx:ar_LZTrm0OJ4Ccmf-Wq1AyRWDTTJn9EKxR6dNhlfK4UlhVLt3DTKOQ>
    <xmx:ar_LZQS_KExk1lLwuutWczhum0it5AS3nKDksc7VVsytw1j069-7Ew>
    <xmx:a7_LZa8f_8WZdJY3DiwBe3lNvc5AFBORkQBAls1o-gDoYpn8dW8QUJQbUsA>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Feb 2024 14:13:46 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] i2c: pasemi: split driver into two separate modules
From: Sven Peter <sven@svenpeter.dev>
In-Reply-To: <20240212111933.963985-1-arnd@kernel.org>
Date: Tue, 13 Feb 2024 20:13:34 +0100
Message-Id: <A4AE8C4C-C37E-4026-A3CC-E613754307D6@svenpeter.dev>
References: <20240212111933.963985-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailer: iPhone Mail (21D61)
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
Cc: linux-arm-kernel@lists.infradead.org, Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Olof Johansson <olof@lixom.net>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>=20
> On 12. Feb 2024, at 12:19, Arnd Bergmann <arnd@kernel.org> wrote:
>=20
> =EF=BB=BFFrom: Arnd Bergmann <arnd@arndb.de>
>=20
> On powerpc, it is possible to compile test both the new apple (arm) and
> old pasemi (powerpc) drivers for the i2c hardware at the same time,
> which leads to a warning about linking the same object file twice:
>=20
> scripts/Makefile.build:244: drivers/i2c/busses/Makefile: i2c-pasemi-core.o=
 is added to multiple modules: i2c-apple i2c-pasemi
>=20
> Rework the driver to have an explicit helper module, letting Kbuild
> take care of whether this should be built-in or a loadable driver.
>=20
> Fixes: 9bc5f4f660ff ("i2c: pasemi: Split pci driver to its own file")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Sven Peter <sven@svenpeter.dev>

thanks, totally forgot about this!


Sven


> drivers/i2c/busses/Makefile          | 6 ++----
> drivers/i2c/busses/i2c-pasemi-core.c | 6 ++++++
> 2 files changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 3757b9391e60..aa0ee8ecd6f2 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -90,10 +90,8 @@ obj-$(CONFIG_I2C_NPCM)        +=3D i2c-npcm7xx.o
> obj-$(CONFIG_I2C_OCORES)    +=3D i2c-ocores.o
> obj-$(CONFIG_I2C_OMAP)        +=3D i2c-omap.o
> obj-$(CONFIG_I2C_OWL)        +=3D i2c-owl.o
> -i2c-pasemi-objs :=3D i2c-pasemi-core.o i2c-pasemi-pci.o
> -obj-$(CONFIG_I2C_PASEMI)    +=3D i2c-pasemi.o
> -i2c-apple-objs :=3D i2c-pasemi-core.o i2c-pasemi-platform.o
> -obj-$(CONFIG_I2C_APPLE)    +=3D i2c-apple.o
> +obj-$(CONFIG_I2C_PASEMI)    +=3D i2c-pasemi-core.o i2c-pasemi-pci.o
> +obj-$(CONFIG_I2C_APPLE)        +=3D i2c-pasemi-core.o i2c-pasemi-platform=
.o
> obj-$(CONFIG_I2C_PCA_PLATFORM)    +=3D i2c-pca-platform.o
> obj-$(CONFIG_I2C_PNX)        +=3D i2c-pnx.o
> obj-$(CONFIG_I2C_PXA)        +=3D i2c-pxa.o
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c=
-pasemi-core.c
> index 7d54a9f34c74..bd8becbdeeb2 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -369,6 +369,7 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus=
)
>=20
>   return 0;
> }
> +EXPORT_SYMBOL_GPL(pasemi_i2c_common_probe);
>=20
> irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
> {
> @@ -378,3 +379,8 @@ irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
>   complete(&smbus->irq_completion);
>   return IRQ_HANDLED;
> }
> +EXPORT_SYMBOL_GPL(pasemi_irq_handler);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Olof Johansson <olof@lixom.net>");
> +MODULE_DESCRIPTION("PA Semi PWRficient SMBus driver");
> --
> 2.39.2

