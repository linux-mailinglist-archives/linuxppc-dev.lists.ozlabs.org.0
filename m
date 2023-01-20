Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 998D0675A7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 17:52:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz5Bh3bzNz3fKD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 03:52:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Ixlujya0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WN31tjJO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Ixlujya0;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WN31tjJO;
	dkim-atps=neutral
X-Greylist: delayed 514 seconds by postgrey-1.36 at boromir; Sat, 21 Jan 2023 03:50:52 AEDT
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz5985wC4z3fGm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 03:50:52 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 52D4732009D6;
	Fri, 20 Jan 2023 11:42:12 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 20 Jan 2023 11:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1674232931; x=
	1674319331; bh=jw1dFTHWMbTPBEwBqLzDuqZE83d4cDbrYgrQVPokymE=; b=I
	xlujya0wwTfcg7T0ltt1vAZXBUi6YP1ORWY270uyIrJRztQ7RbySZ4/UN6Pm3BS9
	DCvKn/ctohEezybyGX5TtcmXKEOvZ5RUGhgysQwoiJ7W48NbaCuH8sCyRJZ5P/IH
	0suffZHvWW6naDkULYR6+VCtYxQZh5b0GcyohIv+xu2CimghgaQo4P0+kx3HRKG0
	5kJukeGsB1m9+T/nwq57DfxUi6wDke/qNkq19H9oUu3vE+rz0l5gGbsTwg9PbP0j
	+LNxUqEjF1O1MKMVlZAsT7CyNw3A2c+2dC8uqW4yA+hSodr7l8V+cDEZ+rRnzyut
	GTbq3Vymeb11ARBl0kM+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674232931; x=
	1674319331; bh=jw1dFTHWMbTPBEwBqLzDuqZE83d4cDbrYgrQVPokymE=; b=W
	N31tjJO0T85FTAmeCSRP+eO3+w+yjH/0sNfIs+SPGPNLdE7x28aAbUH5mQh4aA3p
	RiUK88wlwdq2ZFGriV4XvG8eILpj8BAR8VGJzRM6P7F6Bp0YIe5pNzDtX2Y8DVfv
	Jz0mcG4NWCGg/mOK8pyGUM/wM8r7BoWnHAmcduv3H1GANIGEvNCcygSTm8jkZLX9
	nhPPU0VYO6+W2E9iBVuX8Oxa99k2PEjZdpZH/jIr7e1ZuOdblF9PRw878NN5G4Zu
	EphPuuWvnJ80IMwmPIiJ8jK/XowlDphm10cwZF9eNnMa1GMv6pXI/vB2kVocUVZA
	Ny9rbV934cuEvIPww6PJQ==
X-ME-Sender: <xms:YsTKY2mZEDhH6N3SoijCV4KsKDyPrsasvSbqKmSdXQ3ejR_QkKzO7w>
    <xme:YsTKY93Dp4ucdrXU0SYjvrQzXAWV1xewOSstGszrT7HwHxKHP6dAAZZCJpeZyBXHW
    V8uuxVcmvAODYVjRhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Y8TKY0pLg12qXpNZ0_kJX3Ht6oXkCuYo7xVsWB1oSzlU43GArvILkw>
    <xmx:Y8TKY6n2pp9EEmaQC20WdZ_lD1C_43tsaXF4X0mKvabz5-ER_MC5YA>
    <xmx:Y8TKY02gwinU6prhvny08obDwVyISuzg7W1B1DTqSKCljaEKJwd-Nw>
    <xmx:Y8TKY1KaI9opBZYIbl0NfxBm8UqscM6m_IRFlfofpiyr78uu5MF1IA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E896EB60086; Fri, 20 Jan 2023 11:42:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <db008af4-2918-4458-aa68-2392674475c8@app.fastmail.com>
In-Reply-To: <20221226123630.6515-1-pali@kernel.org>
References: <20221226123630.6515-1-pali@kernel.org>
Date: Fri, 20 Jan 2023 17:41:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND 0/8] Resend LED patches
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, soc@kernel.org, Pavel Machek <pavel@ucw.cz>, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 26, 2022, at 13:36, Pali Roh=C3=A1r wrote:
> Linus Walleij suggested me to send these patches to SoC tree [1]
> instead. So I'm doing it.
>
> This patch series contains LED patches which are on the linux-leds
> mailing list for a long time without any future movement. Could you
> please handle them here via SoC tree? Thanks.
>
> [1] -=20
> https://lore.kernel.org/linux-leds/CACRpkdad6WDo7rGfa4MW8zz0mLXmcPHo+S=
EC-yLQnRz_kdrryA@mail.gmail.com/

I'm going through the backlog of patches sent to soc@kernel.org
and came across this series. While I don't mind taking these
patches through the soc tree in principle, it is important
that this is only done as an exception, and with all the
relevant parties on Cc.

In particular, the original series that you got no
feedback for did not include the arch/powerpc/ changes,
and I would assume those should go through the powerpc
tree anyway. We have recently decided to take
risc-v and loongarch dts changes through the soc
tree, and I don't mind doing it for powerpc as well
if the powerpc maintainers prefer that, but this is
not something we have even discussed so far.

I've added everyone to Cc on this mail, but please
resend the series once more so everyone has the patches,
and then we can decide who will pick up what.

    Arnd

>
> Marek Beh=C3=BAn (3):
>   leds: turris-omnia: support HW controlled mode via private trigger
>   leds: turris-omnia: initialize multi-intensity to full
>   leds: turris-omnia: change max brightness from 255 to 1
>
> Pali Roh=C3=A1r (5):
>   dt-bindings: leds: register-bit-led: Add active-low property
>   leds: syscon: Implement support for active-low property
>   powerpc/85xx: DTS: Add CPLD definitions for P1021RDB Combo Board CPL
>     Design
>   dt-bindings: leds: Add cznic,turris1x-leds.yaml binding
>   leds: Add support for Turris 1.x LEDs
>
>  .../testing/sysfs-class-led-driver-turris1x   |  31 ++
>  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 +++++
>  .../bindings/leds/register-bit-led.yaml       |   5 +
>  arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi    |  92 ++++
>  arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts |   6 +-
>  arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts |   6 +-
>  arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts     |  44 +-
>  arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi    |  37 ++
>  arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts |   4 +-
>  arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts |   4 +-
>  arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi    |  37 ++
>  arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts |   5 +-
>  arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts |   5 +-
>  arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi    |  33 +-
>  drivers/leds/Kconfig                          |  10 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-syscon.c                    |  14 +-
>  drivers/leds/leds-turris-1x.c                 | 474 ++++++++++++++++++
>  drivers/leds/leds-turris-omnia.c              |  46 +-
>  19 files changed, 945 insertions(+), 27 deletions(-)
>  create mode 100644=20
> Documentation/ABI/testing/sysfs-class-led-driver-turris1x
>  create mode 100644=20
> Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
>  create mode 100644 drivers/leds/leds-turris-1x.c
>
> --=20
> 2.20.1
