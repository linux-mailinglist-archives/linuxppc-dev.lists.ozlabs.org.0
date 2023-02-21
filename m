Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A67869E8A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 20:56:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLqmK0dpYz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 06:56:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=mIM2d1Sr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XRowmVbE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=mIM2d1Sr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XRowmVbE;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLqlH6Sdqz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 06:55:23 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 08A23320039A;
	Tue, 21 Feb 2023 14:55:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 21 Feb 2023 14:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1677009318; x=
	1677095718; bh=y16mUyYY2SPoAJ9bLdflgrytvoVfCX/ep0VQgXN5o5A=; b=m
	IM2d1Srzk3jwEXOtZsU0KtjDQC7KYclazQ/9X11OUF9uqhwl7hg3htlpSLNUPeF8
	fKRLP4nJ68xh+/Sm+1iOGyuleT35dp3i/2Uzkf0ldCc40StoG+t/FawpzAuwsIGQ
	zEexqCT/MMT4QNTJ4IixHg8+AxJy7v6Yb9tGJa8tnC1usbSxpTWxUTnGwO6EPs8s
	BfUKBzde4RUxxSMOfgB0UXciHueqRPij9DZT1t6HAoIxreCkhyzmc3aZAF2suh++
	aOGhUcDodJ0vCE6nJSGwrxI3nFuUaROb1ncls0ovoUQv6CD3aMEcYVy00cMtUNub
	P4iTjGYTaDpfOjUg0rC0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677009318; x=
	1677095718; bh=y16mUyYY2SPoAJ9bLdflgrytvoVfCX/ep0VQgXN5o5A=; b=X
	RowmVbE5gWK9sma5PPmAPczS/CY4vUALCT9yG/TTg5/6YTXJYYt7xXvUngHhWs/T
	pMOXlzLHVcl/MR2Mr7YJ5AASX6sXx+IdBrAvrlOcO6azxjro3Y6mnNwAn6ZPjJKF
	0Z1ZuroOmO7oE43YoCJw4gdsS54EhczHaRoKbVfvQezPgr6pP9EL2IUnpIuw0ffB
	cpau4NcvuZig8/A5iO3zisGShRZe5HEKBbQ8GALwCWIXVWJAO7TFKpMNU+/NGmMR
	LS89fWBEOIPdhhybnYYM7bMRw1c84CrKupRFynbdmpD5+zsy2yRRQ9qm/sww0Z3Y
	MDErqk3Xmp6Hj0VqXwbKw==
X-ME-Sender: <xms:pSH1Yy5rfz2qINRajm2z9_YewJ9Q9YDLpKBVxfaicG75io5ihzi73A>
    <xme:pSH1Y74S6qP1DGlBu6p3bn5f2OYwjDzx4UuRoOw1nBuRZLyhrZEKaFklHRJnvtv6A
    a9bVok57rTxVF6gWzM>
X-ME-Received: <xmr:pSH1YxcHCRpQJwCABE79MLRLdvrYpvAg20pAsQzP1lV00LX-UvBXf46gkGlV1zvfv6ET>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:pSH1Y_IaTvKu817HkRx4BUY6TtRM4SPQQBgb4Sr1Vh7pLCKHWQtWyw>
    <xmx:pSH1Y2Kp0kZTLSaQcZvJu-VI9X200qzPUKJujJ5QdNb1_hKIZagW9g>
    <xmx:pSH1YwzHHg_LKHOIJSqLIsP3taZf0Or0UkGEytMI-kY-_rov4eys-w>
    <xmx:piH1YzXcxzQeyYk5RvVeorpluWte_iVN60Z3b2TLH04us1Iaq_MbEw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 14:55:16 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 0/7] MIPS DMA coherence fixes
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <ed2d7750-786d-82a1-5e79-1f216a682b20@arm.com>
Date: Tue, 21 Feb 2023 19:55:05 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <34578218-DC7A-4C8B-A01A-AD64831CCB43@flygoat.com>
References: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
 <20230221175423.GA15247@lst.de>
 <A8AC22A0-E883-4D9B-A629-5A3721B976C5@flygoat.com>
 <ed2d7750-786d-82a1-5e79-1f216a682b20@arm.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> 2023=E5=B9=B42=E6=9C=8821=E6=97=A5 19:46=EF=BC=8CRobin Murphy =
<robin.murphy@arm.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 2023-02-21 18:15, Jiaxun Yang wrote:
>>> 2023=E5=B9=B42=E6=9C=8821=E6=97=A5 17:54=EF=BC=8CChristoph Hellwig =
<hch@lst.de> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> Can you explain the motivation here?  Also why riscv patches are at
>>> the end of a mips f=D1=96xes series?
>> Ah sorry for any confusion.
>> So the main purpose of this patch is to fix MIPS=E2=80=99s broken =
per-device coherency.
>> To be more precise, we want to be able to control the default =
coherency for all devices probed from
>> devicetree in early boot code.
>=20
> Including the patch which actually does that would be helpful. As it =
is, patches 4-7 here just appear to be moving an option around for no =
practical effect.

Well the affect is default coherency of devicetree probed devices are =
now following dma_default_coherent
instead of a static Kconfig option. For MIPS platform, =
dma_default_coherent will be determined by boot code.

Thanks
- Jiaxun

