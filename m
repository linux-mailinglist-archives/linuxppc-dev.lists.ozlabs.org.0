Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A86C7221
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 22:09:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjHy81Dsxz3cMf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 08:08:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=XQhz4LBI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cpEQNvbE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=XQhz4LBI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cpEQNvbE;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjHx70x5pz3bgk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 08:07:54 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 12B373200928;
	Thu, 23 Mar 2023 17:07:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 23 Mar 2023 17:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1679605665; x=1679692065; bh=LXh8RcHlRytWdP5giYX5SGps2z/loe7CAU6
	6Co3XisY=; b=XQhz4LBIVZPTu92lzWNdTkm4qB9wdOsltzzZLdkPOoLlT6yYGHc
	XN+a5SM0Ihkz/5bLUHj/Orxabp2j/sV+kZH6+YdVRSJ/TB3nsiDih/6LGXOJyIut
	scSWSFuqnoAUiPGYM4GF8f5cOI3q7DvJI+n3hz4UpqfXqnCO9Z5FEI9hGxPvjHXw
	8RLhgGA9j8VwdrsvctXuQVLQi6l6NnYDqvTuAJAASSUanS0+7NT6pdPMt/D3pTbO
	IyYPK34bdbsOl0HeQFBFDzpNXH4uWPj9PuDRhce1dAPFcr0uZAbzn0LMClpfqIHZ
	n9ysRHghK6cMsQpUHYrzK1NfkDaotsHGVuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679605665; x=1679692065; bh=LXh8RcHlRytWdP5giYX5SGps2z/loe7CAU6
	6Co3XisY=; b=cpEQNvbE5hLlP++gVezAgQEgbsiuhx6dRxwW7PKr83NBB+M7pFV
	eWwmjkCMKqOuE6V0mkV4PZXhwwNBLMfSbiMGZgSvLl7Wx4Ek1yh2KGfMfvc6lgcu
	uza5xL4ZO0rb163/9UcZyhpaTHdM8mseUgFh4TLEDrwqFQH0jjNRcfgwiRpg4Kwf
	nFOEoI0fBXH8AmU8zaJvZfvA1Qa74h449BuBqH/sBi78tg5yJzS1tSG1FHq0xzyK
	oGXMGWr7CS3ZbUYBsBoRUtl/sDmiVrAl+jn54xCxRVNsjHrirMX9ls/IM1cYGBlw
	lhYHb+J+YgWbG/kuaHG+0DGtBsa1c+0hBmw==
X-ME-Sender: <xms:oL8cZN0DgW3OLroYtCxDwFYqR7FHjzuYwiKht8HgHLPt4iSzaR4Ucw>
    <xme:oL8cZEFPGQclA8D3sCjgsO36VS_L7VmSCKBos1QIQYSiIIJKeezmqrqD0z8qLMUZ4
    MWdTgQ-R8YdU5ADIAc>
X-ME-Received: <xmr:oL8cZN58RyjaUsF1u28KDWgrDi66e2-wg8EW4H5jF0MBq7igueVmfuRoGYZiElOEAz2D>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeggedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:oL8cZK0KK0apa41-Seog06lFkBh2mBy9jsHVnabkuaNzgqKbl_8_IQ>
    <xmx:oL8cZAG-qqU2-r1ZYwACu7bNCoumI1Ha6e0XWnQ5zoKsdDYXtHa1-Q>
    <xmx:oL8cZL9oOnha_c0iuCXL5YPwF-QLzMrQSR5RnR8eXNTrXPAa5PyIXw>
    <xmx:ob8cZI_SsG43gGf1L1mme11VE_CPTfEGk5dB_B0LoRHR7VXurq9SqA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Mar 2023 17:07:42 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v3 0/4] Use dma_default_coherent for devicetree default
 coherency
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230323072944.GA18524@lst.de>
Date: Thu, 23 Mar 2023 21:07:31 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <60D7FE31-D708-4495-949F-3F64DDC11377@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
 <20230323072944.GA18524@lst.de>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> 2023=E5=B9=B43=E6=9C=8823=E6=97=A5 07:29=EF=BC=8CChristoph Hellwig =
<hch@lst.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> The series looks fine to me.  How should we merge it?

Perhaps go through dma-mapping tree?

Thanks
- Jiaxun


