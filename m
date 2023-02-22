Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE069F8E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 17:21:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMLxw1QRVz3cCn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 03:21:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=TAyHXSKk;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lvadaZEY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=TAyHXSKk;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lvadaZEY;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMLwy4SSlz3bwQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 03:20:34 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2AF9A5C018E;
	Wed, 22 Feb 2023 11:20:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 22 Feb 2023 11:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1677082830; x=
	1677169230; bh=kzskNhpptCNQhEyW8N0s/Y2SBLiuAR1hHYf0f9/K3zg=; b=T
	AyHXSKkHwSjilQaew4qRTwWHwt2jz4tbwRAl3CIfWklG/QDTOkG8OK2mamrvW479
	ww6s0xYyLbvryi3gvyI09pvLQxaiM+SZzKKUHB0rt611d58oYVHf3XzjimPmdOZS
	Ic5L3RKAGe7gPNrGBOqzS2/eVwxZTBjs3P4vZRvkx9UxW+KiE7i/bs2Vn7RleK2l
	mYHJ2a9VK1njwo7UVoHx5iRqEBMx5OmxKypLp92XIcZcRQ+vGYTwho2LzbXYqJOG
	xnaCQI3zp/AxJsf+rLr9YfTyhnq3knCQqcXvxBq67kKSCz0DshZnbVNyS0WOZy08
	nYPE2vc2wKGBwasLaFsfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677082830; x=
	1677169230; bh=kzskNhpptCNQhEyW8N0s/Y2SBLiuAR1hHYf0f9/K3zg=; b=l
	vadaZEYKHdwFf4NpbvEl6NPn5bHG9hBtNUAFCTpMIGKlZSQHbhoibHR0g9yw8NGj
	dQWpJo1Gh3a/40e0zgglspofSCbjrG1eRyyh1XPaxxlZpwEuXDY6nZE0i2Yww4pG
	hfAhXBDlfdtx1UXMSTwks1W38HqldA9FBwiiOgvq5SAw4s3RfArRwr3zviYowUUv
	zQy0i8GyuB8ji/jZL1VdeIABvMGmIihTGHw/BHKC3XSfSlsxs+KedR/ox7zGfmN1
	8LBxCq1MNVgC2Q1dlVpljhkDc0ijAZG/8GyL/BmdSmuaMmanRXKCf2jyLaJpLs6o
	Or/JqyWqcwMcAbeML4xhg==
X-ME-Sender: <xms:zUD2Yw55UP5cnyvs-u4LNCbZtuKDqYULRkSoekcS-kGnKZD94tXEag>
    <xme:zUD2Yx475JkcJHYXeFGIwFY1vcuW_syVe2q4SoVm3RI1MjZfzJWEz8LnqFG3gT7oJ
    09f8nEGihpITRrcPb4>
X-ME-Received: <xmr:zUD2Y_d3Ug5NuAJf_OC_rajz4KCYYxvCsGUZNID4Nly92bvvQ9Bk-ix5W9xYGyRJQW3p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:zUD2Y1JqfD_L-pRclDZ_TM5zhrl9hHs3YRAOLIXCKNQXLd7N2ksShw>
    <xmx:zUD2Y0K1WivTuu2FgVIR-aorE2W80V9Cr49LXcvy43mk_XeLZawPWg>
    <xmx:zUD2Y2wVN8pbmUZh5rbdxcENcsjLYdcmfu1GOSIh1pq3Vb_28Bq4vQ>
    <xmx:zkD2YyxbrTl97kGiZUHbSKXgSrqn3I1neBxGLffeQblnnguUc45NPA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 11:20:27 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 2/3] riscv: Set dma_default_coherent to true
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <Y/Y8lEndecMfD+Ur@spud>
Date: Wed, 22 Feb 2023 16:20:16 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <E46E0161-24E3-4185-B408-9357C49F1B51@flygoat.com>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
 <20230222133712.8079-3-jiaxun.yang@flygoat.com> <Y/YrvDBJcYUQt4WC@spud>
 <6BBA7BEA-8595-436D-B4BF-D7DB95069C53@flygoat.com> <Y/Y8lEndecMfD+Ur@spud>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> 2023=E5=B9=B42=E6=9C=8822=E6=97=A5 16:02=EF=BC=8CConor Dooley =
<conor@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, Feb 22, 2023 at 03:55:19PM +0000, Jiaxun Yang wrote:
>>=20
>>=20
>>> 2023=E5=B9=B42=E6=9C=8822=E6=97=A5 14:50=EF=BC=8CConor Dooley =
<conor@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Wed, Feb 22, 2023 at 01:37:11PM +0000, Jiaxun Yang wrote:
>>>> For riscv our assumption is unless a device states it is =
non-coherent,
>>>> we take it to be DMA coherent.
>>>>=20
>>>> For devicetree probed devices that have been true since very =
begining
>>>> with OF_DMA_DEFAULT_COHERENT selected.
>>>>=20
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> ---
>>>> arch/riscv/kernel/setup.c | 3 +++
>>>> 1 file changed, 3 insertions(+)
>>>>=20
>>>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>>>> index 376d2827e736..34b371180976 100644
>>>> --- a/arch/riscv/kernel/setup.c
>>>> +++ b/arch/riscv/kernel/setup.c
>>>> @@ -300,6 +300,9 @@ void __init setup_arch(char **cmdline_p)
>>>> riscv_init_cbom_blocksize();
>>>> riscv_fill_hwcap();
>>>> apply_boot_alternatives();
>>>> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
>>>> + dma_default_coherent =3D true;
>>>> +#endif
>>>=20
>>> Do we really need to add ifdeffery for this here?
>>> It's always coherent by default, so why do we need to say set it in
>>> setup_arch() when we know that, regardless of options, it is true?
>>=20
>> Because this symbol is only a variable when:
>>=20
>> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
>> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
>> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
>>=20
>> Which is only true if  CONFIG_RISCV_DMA_NONCOHERENT is selected.
>>=20
>> Otherwise this symbol is defined to true and we can=E2=80=99t make a =
assignment to it.
>=20
> Maybe I am just slow today, but I don't get why you need to add
> ifdeffery to setup_arch() to do something that is always true.
> Why can't you just set this in riscv/mm/dma-noncoherent.c? What am I
> missing?

Hmm that sounds like a good idea but I was unable to find a place for =
this.

riscv/mm/dma-noncoherent.c are just a bunch of callbacks, there is no =
initialisation
function that will always run on every boot. riscv_noncoherent_supported =
is only
called conditionally.

Perhaps I can add a initcall in dma-noncoherent.c but it seems to be a =
little bit
overkilling.

Actually I=E2=80=99d prefer to have a config option for the default =
value but it seems like
it=E2=80=99s not in Christoph=E2=80=99s flavour.

Thanks
- Jiaxun




