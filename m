Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370B69FA9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 18:58:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMP6R0lpHz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 04:58:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=jikmgFtp;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=F1WqK9/U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=jikmgFtp;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=F1WqK9/U;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMP5Q4Dllz3bTs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 04:58:01 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 774765C0179;
	Wed, 22 Feb 2023 12:57:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 22 Feb 2023 12:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1677088678; x=
	1677175078; bh=nwLpEjWmPs3D70+3STrydy7bvzs4kmjkM2HWhBxwqA4=; b=j
	ikmgFtpuxcvGFE3qLG9zGDa67/AhicEIaxG3nROOylRG77UraKUHrKHE4w0DkqCN
	juLgoFbkmxEUvlgTPLkhRcIfocLwQ6rYblkMYvB767KjwC2R72bJ/mntoP7Mu06U
	01SVQ7azBcy8yh8Usc3r4O9rM+5y8iSk4FjpTjK9OUET8LAT2jgNVFhkVNd2bFpG
	WtAHzyW3z+GpKcPVxYEwL6fKI3djbcCtCB+1407xPzdsqdCqpqo4JjTvWKTYZovZ
	D/ynxL5ek8xImyl1sMZv1P4tydrJoM9BGbMP6AQ+90SlNhjqGx3nkxYVSvtRJaSX
	a09azk2gcGDSrgt4qacaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677088678; x=
	1677175078; bh=nwLpEjWmPs3D70+3STrydy7bvzs4kmjkM2HWhBxwqA4=; b=F
	1WqK9/ULyFs4gxOGhyvCmiJIQB3mGUP18D7cWzo1zWxHL1pWVzaBXJQBpP2/pYVw
	mmt2W9b6KHDtXmOC7SmwehKJO4vQKLiA8J33wetjZme0BDi6w8GTTFW6YnLp8jOv
	Z5bvi7H8rtZDtMsGxQurQZMQzpbD6ysgyuJgbt5nRJKkmAPByAlbi249wFnGjk1e
	st0tyo6nbYf5TAkZXd59fuvxuOUasD7yQJyMkPlI4wyvKnu/DLCt7VFJU1b15rmE
	yzi0lZA00myG3rVP44ujENo9lFlCJMLct6pPu3EgEU84xGSdrZRPIXeeA+xnCwVC
	WRD4q2Egwg2PXv4La+Ewg==
X-ME-Sender: <xms:pVf2Yzx8OrQqCZ0sOnDXREkTOheOAE0JcfVq1ZutGu1XPMZnuzSGWw>
    <xme:pVf2Y7Tpyh8Ajut76gG4bVgfgl2kyimD5FMoTAJchnC78gsU6Avt3cN9Gy62Vsu07
    vLH7onUHnxeqj30AGo>
X-ME-Received: <xmr:pVf2Y9WRrVgvM0qGmbtV2Tdkf6Z_FgWSLNhnBkLRdSo_LxZidN0vUJQ7fb9fGL4lF-3_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:pVf2Y9jhKx6uMWMcE7nOTDP86zbRG4nuGBKhwOTVk-hAypdTn0-d7A>
    <xmx:pVf2Y1D9-gQ2sodvvOhtRVec4qTLdZ-EYxDa1iDfW1muxI-TTh9E5w>
    <xmx:pVf2Y2JXGgWxYdnIBo1a9TApluAVvgnGtcOCiKd4dMOrAK0SEp3lZg>
    <xmx:plf2Y56DW5KT5B5mFPh4C-TOYY2smqCXhc4nxf8Om2SRBXv__88Xxg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 12:57:55 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 3/3] of: address: Use dma_default_coherent to determine
 default coherency
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <e9d882f4-d57d-f6b4-7ae0-bbfea0f5aa59@arm.com>
Date: Wed, 22 Feb 2023 17:57:44 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <3E55E1F7-7A34-4165-9BF4-C2AAF6A6CFC1@flygoat.com>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
 <20230222133712.8079-4-jiaxun.yang@flygoat.com>
 <e9d882f4-d57d-f6b4-7ae0-bbfea0f5aa59@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> 2023=E5=B9=B42=E6=9C=8822=E6=97=A5 17:24=EF=BC=8CRobin Murphy =
<robin.murphy@arm.com> =E5=86=99=E9=81=93=EF=BC=9A

[...]

>=20
> AFAICS, all you should actually need is a single self-contained =
addition here, something like:
>=20
> + /*
> +  * DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
> +  * might override the system-wide default at runtime.
> +  */
> +#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
> + defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
> + defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
> + is_coherent =3D dma_default_coherent;
> +#endif

That makes more sense, thanks.
I=E2=80=99ll append CONFIG_MIPS as a condition here as well because it =
may break RISC-V whose dma_default_coherent
is not set to true from very beginning.

>=20
>>     node =3D of_node_get(np);
>> =20
>=20
> Then *after* that's fixed, we can do a more comprehensive refactoring =
to merge the two mechanisms properly. FWIW I think I'd prefer an =
approach closer to the first one, where config options control the =
initial value of dma_default_coherent rather than architectures having =
to override it unconditionally (and TBH I'd also like to have a generic =
config symbol for whether an arch supports per-device coherency or not).

Ok I=E2=80=99ll try to revert to the initial way.
Is there any reason that an arch can=E2=80=99t support per-device =
coherency?

Thanks
- Jiaxun


>=20
> Thanks,
> Robin.


