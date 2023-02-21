Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 263CD69E757
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 19:21:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLnfS6p29z3cGR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 05:21:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=kfip2uhU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Xecedj8k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=kfip2uhU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Xecedj8k;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLndY2zffz2xGL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 05:20:17 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id B1BAB3200958;
	Tue, 21 Feb 2023 13:20:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 21 Feb 2023 13:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1677003614; x=
	1677090014; bh=x2IZQ+iphsmwSFnvkuw3nDG85xAlx0RpbPygo2Hs1nI=; b=k
	fip2uhUowqaQVQpqKlxJ4klntl+O/E0mnKFL0V2lzkkGa2KLDPb3EFGzjfy6HD0Y
	C/W3ardDqnIQGdp/2nPaXuR+//kX5v+ZA0nojwTl6aa35YM/baaQA17Wfvmd1Eb2
	XPFjVkv1ASQIZhrZr9GI/S2DbJs8hc/lWO3gsEDfNo/B4U7KEuR4TcMTg+EHRQxj
	VE16jQvpxpK+bYEGa7cQGw1PLr85Kv5gBZw/xzzO9HEXmGNaHxsZzuXnUfnYymqL
	ii+i8OjMxguvYn/hMdyovWzQqbEPeUVnhKuRaRL3Oqqas90hOFddlW9adLnzvNSt
	GGjTrYJyA64s6f7Xr+DXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677003614; x=
	1677090014; bh=x2IZQ+iphsmwSFnvkuw3nDG85xAlx0RpbPygo2Hs1nI=; b=X
	ecedj8kC48nTR9PQDLmfBEaBjtTdMKaBtVI5hZ72gnyzsDlM+00kfsXuzKNW7GSg
	BkmjNo+9bSD41/T/tgtEEg8aqgR9FHYzcgMIIRBu8kLkIwfDuMmYiUGqFjnOw8UB
	vo0z9r2NEjOU/dY+63PJB3q4oSlOdZvlgNQec9CJQrE4IpmBOoKd4j8/FcimC0zf
	g853qwjU4/YhuN+kqZBiQqFS73zG1WKlsFxTtwiAwkntoOJiy2M8F4RxT0oMTYed
	E34kaVeRARaAAmu9uPymDu0UtywMXxw1xldabiEQ85wlNlZY6BTMZm55MLBjQ1If
	ZZ8htlj43UMZNkV2b34/g==
X-ME-Sender: <xms:XQv1Y4RW2spWLG0Xc7eypjwdxLuDQNYt7kyqPpSWuFQBw4TuIrL5Vg>
    <xme:XQv1Y1yKVwpOsbcR6dqUWjpfoex8rG2VnWTR5RY7joh9aP1oLEvu3lhQ_F9LCUfNm
    1DXpBEM625VM0IkeUU>
X-ME-Received: <xmr:XQv1Y13pxFlK7oW505HZNNdKYvqKotApswUXpZAWN8PUITFWvASaKJRSAATq9NWQcBUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:XQv1Y8BWIC9oJWjZnidV3FHpDdZb7y1S1NGe6p51LCsck8BdFhS4gg>
    <xmx:XQv1Yxg0-dOMKc-8lZ1heAFamYnd0-cEXunsAKSscIpDW6und-9udA>
    <xmx:XQv1Y4pa73wgZC4_5cyD-51T8Z4bQ7eWTQH6wAF6VQ4zOVNRmb45EA>
    <xmx:Xgv1Y2b89O_QxDtqKtNdsouEzKG2XDT32iSg5RiMLTzloE-weJAgtw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 13:20:12 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 6/7] riscv: Select ARCH_DMA_DEFAULT_COHERENT
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <Y/UJ9HowQdsNN+Cz@spud>
Date: Tue, 21 Feb 2023 18:20:02 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <D9DE553D-07F7-46EA-96E6-AA2A6ED5F6C6@flygoat.com>
References: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
 <20230221124613.2859-7-jiaxun.yang@flygoat.com> <Y/UJ9HowQdsNN+Cz@spud>
To: Conor Dooley <conor@kernel.org>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> 2023=E5=B9=B42=E6=9C=8821=E6=97=A5 18:14=EF=BC=8CConor Dooley =
<conor@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Feb 21, 2023 at 12:46:12PM +0000, Jiaxun Yang wrote:
>> For RISCV we always assume devices are DMA coherent.
>=20
> "Always assume", I'm not keen on that wording as it is unclear as to
> whether you are suggesting that a) we always take devices to be DMA
> coherent, or b) unless a device states it is non-coherent, we take it =
to
> be DMA coherent.
> I think you mean b, but being exact would be appreciated, thanks.

Yep I meant option b, thanks for the point.

>=20
>> Select ARCH_DMA_DEFAULT_COHERENT to ensure dev->dma_conherent
>> is always initialized to true.
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>=20
> Why was this not sent to the riscv list?
> When (or if) you send v2, can you please make sure that you do cc it?
Will do.

Thanks
- Jiaxun

>=20
> Thanks,
> Conor.

