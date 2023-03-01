Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5829F6A6E3D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 15:19:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRbvx1xXKz3c7X
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 01:19:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=AyJkYHBa;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=O2DMRQr+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=AyJkYHBa;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=O2DMRQr+;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRbtx42kMz3bhY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 01:18:31 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 875B45C0163;
	Wed,  1 Mar 2023 09:18:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 01 Mar 2023 09:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1677680305; x=
	1677766705; bh=IU/BrE3ixZGyLbVgFOOh2R6wZHPN5yx1P6eJFhscw+U=; b=A
	yJkYHBaTE99CfV0zEVGrqCLHzthiENTPQupgFPss0vM4CUrpWrkivXAApij0gYsT
	+xPD3Rpc/++PsYBQvrW9hn/hGp5z1kJoDTKu8esHfTpzxYVj9sjk/5h3FzsALxOv
	+quyZGu6DFBwv/POff8XjUz23+OiS94YV8ZMnxMa30GHbjgA0qdpfeDWzdFegUTF
	JjgiC69It8pIoz8XTrMim7wSiJQMJF1b4cUGUEECraqzCDqEeaP20zLliPVFQSXu
	TFPADhCVuhmaN0vJCDGwg+YI7rNie7XSDZJJWMWzxl32RfaTabum+2CLoI+WuKF2
	vmkG+p5H/Nx0Wcq/maTew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677680305; x=
	1677766705; bh=IU/BrE3ixZGyLbVgFOOh2R6wZHPN5yx1P6eJFhscw+U=; b=O
	2DMRQr+RXddOPya6ZL9/CwAlS0f67jYqs3r1/Tlci3ZUhBGuFRNTySolg0fc7Thx
	Qwacb6833WSWgprw759VX997Y1jW+3qR/bkZkoKW2rIWeamlDTJeiURTx2UoPtON
	37KjaIaMAuuf+VuEQlHeQ1/zcmzg/xbOlgtcyA1S2Prbx6J+UQJM25m5oczStOf/
	DSdt8RYBPeIGDB9mZQShW0pkEPhqjglEsNSLbjsPcIa1rQSzYHphHvExC+MV1uel
	Gl7rmQYC6i2Q33m6SdZ8SQbk9LXGoK4Cda7mixuoDB6nOELcKMRoGgJ56iG6GTQT
	WCXy1cmw5jPXa4B4W3r9g==
X-ME-Sender: <xms:r17_Y-tUFo2LL8eR0fi-GokoMXitP2n_JUf-XIy5nnStsSe6FJRj2g>
    <xme:r17_YzdmZ32m1yaGJBQRp-URupP-6PBTv_L6UVtboHOI4DESaWNr17PvtrpLA_r8d
    Yf3Wwzo8la7sbRUHjs>
X-ME-Received: <xmr:r17_Y5xH8C7zLFMosNSu7Rk8dva1PbIKD44Fj8-pO12vIfF3EwUQ2C7l9wT2zjo29ZAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:r17_Y5MRWG36jqqYcsG4mbJe5qRD3FWZkO-uj5TIkFXI7jBOennvjw>
    <xmx:r17_Y-9REZjCJ_ziFlN4x3EGZMLQymJqqL1O5OR4K6IL99QYuA_3vA>
    <xmx:r17_YxU5N5rhCyqTaH1Kivq2jpad5SoUB9zVRzgaSZZg74d7WWBPiA>
    <xmx:sV7_Y_09vA_UNMGlZu7NoezTW3ovu03S-v6NaeYyYQxNqODnkQ-mww>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Mar 2023 09:18:22 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 5/5] of: address: Always use dma_default_coherent for
 default coherency
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230301130613.GC467@lst.de>
Date: Wed, 1 Mar 2023 14:18:10 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <B43602D1-89D4-465F-83B1-CD106E07CB29@flygoat.com>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
 <20230223113644.23356-6-jiaxun.yang@flygoat.com>
 <20230301130613.GC467@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> 2023=E5=B9=B43=E6=9C=881=E6=97=A5 13:06=EF=BC=8CChristoph Hellwig =
<hch@lst.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>> - select OF_DMA_DEFAULT_COHERENT if !NOT_COHERENT_CACHE
>=20
> Doesn't powerpc need to select CONFIG_ARCH_DMA_DEFAULT_COHERENT now,
> or even better should be doing that in the patch adding that
> symbol?

If I read the code correctly for powerpc OF_DMA_DEFAULT_COHERENT is only =
selected
with !NOT_COHERENT_CACHE, which means non-coherent dma support is =
disabled=E2=80=A6.

>=20
> In fact I wonder if adding CONFIG_ARCH_DMA_DEFAULT_COHERENT and =
removing
> OF_DMA_DEFAULT_COHERENT should be one patch, as that seems to bring
> over the intent a little better I'd say.

