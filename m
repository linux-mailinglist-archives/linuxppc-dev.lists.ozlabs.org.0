Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E867A518
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 22:38:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1gMN31Jtz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 08:38:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Qu9kwRBh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Fval1w2U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Qu9kwRBh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Fval1w2U;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1gLM6KJLz30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 08:37:46 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 7B6D03200033;
	Tue, 24 Jan 2023 16:37:41 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 24 Jan 2023 16:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674596261; x=1674682661; bh=MkvJpaIoWi
	Y2nfRzftcUt2rDwhUJg4hoUzHTirY6S/I=; b=Qu9kwRBh2VFDOJEnh2TIWnu/dg
	EJeHcrndgpg5GPAHfS9vjrVQLiEUUuV1JL9ErKZGB+vNooqNSQodD0OAdVErhVY1
	VrekgA60btAghP4MdgR8OiJDlpgL5BNpEapmSnLwGnB9Tb3f2fqeKKEOaB0gTjqB
	xA+spq7rU7reybytaL4unmPdlZUGe8Dwtacjw95uDYqO7omcw+/HdSbyWawH5e0Q
	m1Uh3Iw9jcS+b/xRAAW3IsV9O4v+OkxCMCBWJIPqiQTUGANx0VoaOzOEfWPSxOXC
	ARCXbazO3IekSWnZBdh2gycspiMS9DZROnN9xpwS4xR6crIV2DN9Hwmtk4XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674596261; x=1674682661; bh=MkvJpaIoWiY2nfRzftcUt2rDwhUJ
	g4hoUzHTirY6S/I=; b=Fval1w2UY74WJLSDcjr0LF1kFnvcvmMh7NZKYSXdT5nh
	4s6KQYN5NADKDOGSdr8oVVMbFdnImnnKMvX5zRyQJecjnzL9+m4vOMMX9xp5lXSg
	/FqPyOQBtnBZK+EUXbIdaB1DTyoZoBSkeexf8LHf+7v4lhx38trOPGhVgQWfba8z
	DNX39PBg/sYYqr/8ow7+rqhbC03f8CMG3RIbbYXxk2aFlQ1NmKihbmmjgwvPCCyJ
	k7VnTu4VTbG4krw1rQJTEq4rj/zDTNz8+i/5TJmO3CiCPD5m+Xe5LlyUELgqU1Td
	Ej6YYdHHO63tS17w8MqXPSKsoWYi91+xvERVHo8lgA==
X-ME-Sender: <xms:pE_QY2WVgV6qfhCzfqFQFVghixOstecb9fvTYxCQRg-zkfot62I4GA>
    <xme:pE_QYyl2d0BQaw9w6RCvUqkPgzJJOml5H8h_QuXy1Misue_2-fpmKAXHt1VQfC5WS
    PMqMgO-vw6nhO3RWnc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvtddgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:pE_QY6Z9Mjrf7RGnpdQ4GBn_iBXD7YEUn70vVeNCFMYqlAYJGuxhMQ>
    <xmx:pE_QY9UPTjIm1d9na8nvMeoVg-AmWNzskEsSPj1W2jhaujlHRCRYEQ>
    <xmx:pE_QYwngFRg-OfvGGZb_Gamp8gJggzeX-BQvj0dIWDn4rzhG2k9IwA>
    <xmx:pU_QY_cTCaA0Fvpl8fimDafUFyeW7caF8uIjq3MUK9JnZXoWGF0kDA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 29C83B60086; Tue, 24 Jan 2023 16:37:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <5fd66e0f-410c-4198-bede-394d05bb0952@app.fastmail.com>
In-Reply-To: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
Date: Tue, 24 Jan 2023 22:37:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Olof Johansson" <olof@lixom.net>, "Shawn Guo" <shawnguo@kernel.org>,
 "Li Yang" <leoyang.li@nxp.com>, "Russell King" <linux@armlinux.org.uk>,
 "Marek Vasut" <marex@denx.de>,
 "Marcel Ziswiler" <marcel.ziswiler@toradex.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Nicolas Schier" <nicolas@fjasle.eu>
Subject: Re: [PATCH v3 00/10] TQMLS1021A support
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, soc@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 24, 2023, at 12:02, Alexander Stein wrote:
>
> thanks everyone for the feedback. This is the third round of this series to
> add support for the TQMLS1021A using the MBLS1021A mainboard.
> The changelog is included in the individual patches.
>
> Best regards,
> Alexander
>
> Alexander Stein (7):
>   ARM: dts: ls1021a: add TQ-Systems MBLS102xA device tree
>   ARM: dts: ls1021a: add TQMLS1021A flash partition layout
>   ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS TM070JVHG33 overlay
>   ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA HDMI overlay
>   ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH DC44 overlay
>   ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH FC21 overlay
>   ARM: multi_v7_defconfig: Add options to support TQMLS102xA series
>
> Matthias Schiffer (1):
>   dt-bindings: arm: fsl: add TQ-Systems LS1021A board
>
> Nicolas Saenz Julienne (2):
>   kbuild: Add config fragment merge functionality
>   ARM: add multi_v7_lpae_defconfig

I have applied the last three patches in the defconfig branch
to make things easier here. The dts patches should go through
the layerscape tree, so I'll wait for Shawn Guo or Li Yang
to pick those up once everyone is happy with them.

     Arnd
