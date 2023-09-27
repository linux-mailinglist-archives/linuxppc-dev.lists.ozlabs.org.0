Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1806C7AFED7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 10:44:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ADzfipzn;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=T05vfZWD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwVXp5z9Dz3c5J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 18:44:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ADzfipzn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=T05vfZWD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.18; helo=wnew4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwVWp2LVgz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 18:43:49 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id AD2CB2B00190;
	Wed, 27 Sep 2023 04:43:40 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 27 Sep 2023 04:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1695804220; x=1695811420; bh=o7VjoUAbmEtRJA+8mE/ljFlKqx4X7034jZT
	pRVdZN6U=; b=ADzfipzn1H6nvZj6IPUSg2e6bCMhLYRmEs66usghC3Y3gx5303Q
	aTTmtJG0A0L9CHLezJhajL9yKQwYfnfAFiXMKhwusvHW50CG5uI5iEl7tt3E5O/c
	109Prl9v1WY5Dz5zbA1UlVJNeFc9OyrqpbnS2acBLHAax7mj4JSazShKhZ2AKtL5
	Kb+sO9zLKfRG70g6mMx2NTtBQwA5XqhQTr1ML37jliO1pEZ8oPvMjAfQWzjpeRwp
	P93tKMWDgbtYnrHOA50hnF/3YZr7ca8sSU/zKOdnxmfL7uNzchYn4fxuizIz9Uwo
	wSMlNWEE93us8pOvJ6bXAOtzDZ3Y1r8Dkqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1695804220; x=1695811420; bh=o7VjoUAbmEtRJA+8mE/ljFlKqx4X7034jZT
	pRVdZN6U=; b=T05vfZWD4SeZP01Wx6kQneLrsFr8U69yAe1OGWDRowa7yugQwJ3
	94K12SDEFGNefEiYGYpscPNiz8fBtJOZO5fFMXK84Cq+DLpoiisAlVL+RurIMkNt
	Nb2Kj7pvRYINg5vwBm6juNHbkdHU+vbRdM25KS0/MoCFoR7dMv4jNuYUJK728O7n
	iuONNqsQxEpFoNEgNZeMqcSx2GySa1Mo1t3OXUYum79164XAx8pAzMB2VEr5DM4K
	l2fTK2Za9USzPDJVwoXHD61JS9bNxlIY3Zqu64JfZbZVGMo1Hh9jhGdTq1v3tyYS
	fgvfYIMPcx51AjviWxI9VX5zh0EwxD/MAaA==
X-ME-Sender: <xms:OusTZTxl4DMJTP59c2KJ3iAewQQWbzZvdalDvbWGKOLzv2EzLdBGuA>
    <xme:OusTZbQexVSnj58RtwR8RCEaMhCEDqGXO2BE_Mcdl6H_L2Irne_1ea8tvqBCQSDTq
    Rq5c7228oHf_xSqDlE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtddvgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:OusTZdUi1I6Gdh1mDxeBlJHg-Yno8M5T2KHxAbUCNM4lr_pKsVlrxA>
    <xmx:OusTZdie3X4oFed4rWhvAe5IK10Jrbz1ltYCRBKW4lbI9_Q9epjx-A>
    <xmx:OusTZVB2dhx1vK4otJlVYTjXkXX07gEQS0rDAla7iUQqudzIuChogw>
    <xmx:POsTZXqlhNzvo9JMY5-8GSCqucFjQ1YuFjO0FqgTBEXKd9KEj2fANC8DefA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 30D92B60089; Wed, 27 Sep 2023 04:43:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <1b2fddf8-c0a6-4afa-8ad0-f280dea1607f@app.fastmail.com>
In-Reply-To:  <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
Date: Wed, 27 Sep 2023 10:43:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/40] soc: Convert to platform remove callback returning void
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
Cc: Nishanth Menon <nm@ti.com>, Herve Codina <herve.codina@bootlin.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Mateusz Holenko <mholenko@antmicro.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-tegra@vger.kernel.org, "Conor.Dooley" <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, linux-riscv@lists.infradead.org, Karol Gugala <kgugala@antmicro.com>, Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Ruan Jinjie <ruanjinjie@huawei.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Jon Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Gabriel Somlo <gsomlo@gmail.com>, Andy Gross <agross@kernel.org>, Huisong Li <lihuisong@huawei.com>, Yang Yingliang <yangyingliang@huawei.com>, Sumit Gupta <sumitg@nvidia.com>, "zhang.songyi" <zhang.songyi@zte.com.cn>, Zev Weiss <zev@bewil
 derbeest.net>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Krzysztof Halasa <khalasa@piap.pl>, loongarch@lists.linux.dev, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Shang XiaoJing <shangxiaojing@huawei.com>, Leo Li <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, Nick Alcock <nick.alcock@oracle.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 27, 2023, at 04:25, Joel Stanley wrote:
> On Mon, 25 Sept 2023 at 09:55, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@=
pengutronix.de> wrote:
>>
>> this series converts all platform drivers below drivers/soc to use
>> .remove_new(). The motivation is to get rid of an integer return code
>> that is (mostly) ignored by the platform driver core and error prone =
on
>> the driver side.
>>
>> See commit 5c5a7680e67b ("platform: Provide a remove callback that
>> returns no value") for an extended explanation and the eventual goal.
>>
>> As there is no single maintainer team for drivers/soc, I suggest the
>> individual maintainers to pick up "their" patches.
>
> I'd be happy if Arnd merged the lot at once. Arnd, what do you think?
>
> If that will be too messy then I understand. I have queued the aspeed
> ones locally and will push that out if we decide that's the best way
> to go.

The main downside of merging it all at once through the soc tree
is that there may be patches that conflict with other work going on
in individual drivers.

What I'd suggest doing here is:

- have platform maintainers pick up patches for their drivers
  if that is their preference for any reason

- get a pull request from Uwe for the soc tree for anything that has
  not been picked up in one or two weeks from now

      Arnd
