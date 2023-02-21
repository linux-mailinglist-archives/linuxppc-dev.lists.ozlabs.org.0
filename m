Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D52A269E746
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 19:20:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLndH5NVFz3bgs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 05:20:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=D9grbHa3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TfIxj8ff;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=D9grbHa3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TfIxj8ff;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLncM0FGCz2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 05:19:15 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 77D0D32003D3;
	Tue, 21 Feb 2023 13:19:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 21 Feb 2023 13:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1677003552; x=
	1677089952; bh=x5JRWBtDBoH7NCFzzeEOrSWuCCjwV4krwVHMAbj0ALc=; b=D
	9grbHa3Xg6Oc7mQ8YwWsl24aTiDStUWWFw01wdXHEfV+RKw7HLI2hmmvGh6DRVu4
	U77XIwnJF1BxBV1kc7ivh5iGChCttNVktHfrQLN2u0zgFO9jqjK7zkWQSqwCXOEM
	GuiU0oKieb35AhTiDKhnxC37w8d9hkkiZulQe2OtHoFF0reRTbhTodpuMIGTx9Gs
	4ZuRgk9BeJF3k5CFQVWuirJfYJbXpEH6EVS2FUwyoTXoBd0Gjut6oL3uE1Q30ucc
	UzGN13NCAvnlXqEcCejEwkof6IWbwAMb/CKu3MYlxsEFHc5RUzjB11bagZCARNJQ
	Yo4US7NFNXVcfLV/+cVSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677003552; x=
	1677089952; bh=x5JRWBtDBoH7NCFzzeEOrSWuCCjwV4krwVHMAbj0ALc=; b=T
	fIxj8ffmZ0ELlz6jY1UepBsdokoajS98Ljg/gm6+YDZie4hHjVobezgG60AI9/UB
	Evun183gQpI6cQa1XFeK+hE9Nemh/GxRQAjwzY1mS4m85iajtGVOyhjpWtkgHjXm
	e9aOyCX9jEBE4lIFlEnV+hbWMlb7XpefTAGZfWzwSV6mtnpcfgPr77eOsMR+rLed
	QcUQ+g5PLI99UZqrC4CVo0WAxO2rNmIDHNG34r3HSBAFWXOTjz4pP+RLKCJSp0h9
	YBFE2kcSYUIe8SzSWIyqsudZNWvCRvTqEA4pVN7zpP9E1f0dzKCB56i90bbtaxKD
	tcUtSdFw1szIMi3ywNNlQ==
X-ME-Sender: <xms:Hwv1YxNWlPBelst1EIUZg4dmWwy0_utbtaUYKn21o4buf2e2GLjj9A>
    <xme:Hwv1Yz_U98_YlE2ECFimJ4OhQ-zraoGFDKYIIAmgxi3AnH4I2mLbFKQWp7pTheJuc
    ejbR7N-rcBNBN862uE>
X-ME-Received: <xmr:Hwv1YwRRqngVz7fWu_Q6ppBYYqDpftBpSZH9QzcX2EhsMlLrCpD-Rd2rxU967VehElUu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Hwv1Y9uC4dEnXJ2zyFGyx8qU6kBRRQCs0oQJGPdclQ-Stn4XrUWG7A>
    <xmx:Hwv1Y5c9vcDlxaszyObd77zEzimjBPb0NQ5E19s5S1W8am-4N28OAQ>
    <xmx:Hwv1Y51_A1CZy0LP3x3kLKO3rGeVB0FBDXzQGU8hT4Xgmq9HrOGfRw>
    <xmx:IAv1Y14QmZXszoAcS3cJgzuOpdUeCU2mDY9DZ_YFZ0miy1OfeVyJiw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 13:19:09 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 5/7] dma-mapping: Provide CONFIG_ARCH_DMA_DEFAULT_COHERENT
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230221175842.GD15247@lst.de>
Date: Tue, 21 Feb 2023 18:18:58 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <9AD04590-81B1-4420-979E-ACC1C7C6C8E8@flygoat.com>
References: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
 <20230221124613.2859-6-jiaxun.yang@flygoat.com>
 <20230221175842.GD15247@lst.de>
To: Christoph Hellwig <hch@lst.de>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> 2023=E5=B9=B42=E6=9C=8821=E6=97=A5 17:58=EF=BC=8CChristoph Hellwig =
<hch@lst.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Feb 21, 2023 at 12:46:11PM +0000, Jiaxun Yang wrote:
>> Provide a kconfig option to allow arches to manipulate default
>> value of dma_default_coherent in Kconfig.
>=20
> I don't see the win over just doing this by setting =
dma_default_coherent
> in the early boot code.

I just don=E2=80=99t want to dig into every archs=E2=80=99 early boot =
code to decide a good
timing for setting this variable.

Also as we do have a OF_DMA_DEFAULT_COHERENT before it makes more
sense to me.

Thanks
- Jiaxun=
