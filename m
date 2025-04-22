Return-Path: <linuxppc-dev+bounces-7884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E908CA96042
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 10:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhZR2030pz3brP;
	Tue, 22 Apr 2025 18:00:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745308813;
	cv=none; b=ZxXHWgSF23PphzF1oZOG24elrlPflh1RioD1qYyd65N3tQf55YaCgv28Mv6QjAV1iQ23CWbNAOtr7FyP090NnmSvVVn8BH5r9URfvKWhE4kl0NwZHuYIRO/hoYCd3/2dnVb9eq0yyZFMCLfSsgpEPkkF6rUB3ZzoeLZZQRbL5+xwiigdpkUO8m9nCTkgm1B1E5Fs/XzYEPpLDT3Sf1Xy7MVHnjpmTRcyD0XJ/hiyYboXnFBk/pOZRSho5wuA0QcxSgbeVaBHFYih8TtCCNkiEBaxWimNi92t/JXps4WK8G27mGExqxN6SxhhA2i0Df7K11g7Y9WW4gKjwTSOEof8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745308813; c=relaxed/relaxed;
	bh=ldJajFBLjqVb0Mm/KvZ1u+i8MYKis6Iur/1ZBd7hm1U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=A2HgZVgUQ2bhOHm4cBcbkUJ78E7aG9hqjJwaS/I6ZgLpUccobokldpC7f2FxZ0J+00juIHptz8KVWvC2GLVGlwQr8NwqHpub9ij9PmLouskY8zwXWDrnTIoXPyub5bn7ahb8VzostAWwX3VLKxB7AWUi2a7s8wSwPNLU/+VbclR4syjBf2lUVXPK1xt2KwcQuvdIclLAJQyp6Mxe1S/bHyLbg8WxIIo5/AYXoB7myU3P4e2JBl0mPJNt1llVsJeyV2tubowcvNnANvd5fEVUyC+wPjlCot7ybIkLzrcqtS9IaHNkIQ8Ucz6IzLGrNRmwyGuCr5lMnGR//PRt3bnDew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=H0BOx3y8; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aA1rHceS; dkim-atps=neutral; spf=pass (client-ip=202.12.124.144; helo=fout-b1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=H0BOx3y8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aA1rHceS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.144; helo=fout-b1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhZQy3sw9z3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 18:00:09 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id DA3A91140147;
	Tue, 22 Apr 2025 04:00:04 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 04:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745308804;
	 x=1745395204; bh=ldJajFBLjqVb0Mm/KvZ1u+i8MYKis6Iur/1ZBd7hm1U=; b=
	H0BOx3y8yOz1UUcohk0x4MuuW14ZiOpnBnZh5BFZHapxkupyLTDW+HlsUZ2uaBAd
	EplafPA32fiKbT91Y+0mm407TcgfFk+OoQAb2AZwbM3JbwZxSp9DDX3XWth+1Omy
	6ghVU4DoFEKCkS0KirRyH8GRhe6ajVYzM7/ZuqHrRTBDp1sIFaiipkcuhDbIRMi3
	2sJzNFfLejpEglhurZGsLg3/A8BEpozVQS5yZj6hzHlq7tzTBfVi15FKMpXwdPsw
	xlWBKsIp4aAmYGA2wvbFbXfR5qbWXRWdj3Vre6mE1qPJ+cwi4lTdMhBIdSurRn8N
	WAXng6W6P5tgEixCtJoanw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745308804; x=
	1745395204; bh=ldJajFBLjqVb0Mm/KvZ1u+i8MYKis6Iur/1ZBd7hm1U=; b=a
	A1rHceS/iX/2kSoEPN4k/SOB6PpsWzWqC9sDUtPRYCV9LEKS+HePLBH4sQhVHgXY
	POhY0iGhAkbJpB0ASFqlYHdfM25LfkDmyfuBZ9/y8i1iOUd2tohU8JwKoFPlJcgM
	sTVZgippB5z2mrho6W3besol7PtpqmFz2Xl4kivItaHyeXcTAgm02qA/SHX9DnYa
	Y7mVh0aTMmae5Lfd0Ti/LCsruafbyUqfe7J6CRC0aOfJvnRnwLk6PhKunWB6ymXs
	gdaxGlISINPhuV+lbz2B8NyAnGGkA/2kJTj/ysP1C3A+pWqAX7/QqkMrQ7i4sjtw
	vLfKZrZUosIkmKsy3HeAg==
X-ME-Sender: <xms:hEwHaBTmK-MDZAx_XAitRI9LFGNJ2mTxy-W3NKttzTie1aDdocfiBA>
    <xme:hEwHaKwKzeQrfd8TMAQja6mgkVXt8kBeXh0ziojnGcVR4pPiBvNzqzfm2SrAGiAb_
    ua1_1KN3d_54TDMB8o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsggtohhllhhinhhssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtg
    hpthhtohepughmrggvnhhgihhnvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopeiifiesiihhqdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:hEwHaG1r1Jjz_VO77jJ-BKeYnVbqBWF89Q6_9-jIgB7Q9NBoYxFhOQ>
    <xmx:hEwHaJAXVb4rAXj8556mf4MFzAppIHuEOytkkeGMA3frOabzx8sCMA>
    <xmx:hEwHaKgsalIKHjjdtqnqowpgFTDDiqzrOW1DhzYmHgQn8ppb8Ixp_w>
    <xmx:hEwHaNqPGtfJwFcRD0OscP1KjXDdcEWye8w_Y97C5nIPPeyuURupZA>
    <xmx:hEwHaBOtX7h5MWFIpNhFiMYlR1OSNDNrqtVCIDBWTzJ7vX6-ZDud4LfA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2B03E2220074; Tue, 22 Apr 2025 04:00:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-ThreadId: T8f64d9338f7a15a8
Date: Tue, 22 Apr 2025 09:59:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ben Collins" <bcollins@kernel.org>
Cc: dmaengine@vger.kernel.org, "Zhang Wei" <zw@zh-kernel.org>,
 "Vinod Koul" <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Message-Id: <ace8c85d-6dec-499f-8a8a-35d4672c181d@app.fastmail.com>
In-Reply-To: <2025042202-uncovered-mongrel-aee116@boujee-and-buff>
References: <2025042122-bizarre-ibex-b7ed42@boujee-and-buff>
 <fb0b5293-1cf3-4fcc-be9c-b5fe83f32325@app.fastmail.com>
 <2025042202-uncovered-mongrel-aee116@boujee-and-buff>
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 22, 2025, at 09:12, Ben Collins wrote:
> On Tue, Apr 22, 2025 at 08:34:55AM -0500, Arnd Bergmann wrote:
>> 
>> - SoCs that don't set a dma-ranges property in the parent bus
>>   are normally still capped to 32 bit DMA. I don't see those
>>   properties, so unless there is a special hack on those chips,
>>   you get 32 bit DMA regardless of what DMA mask the driver
>>   requests
>
> I've yet to see a dma-ranges property in any of the Freescale PowerPC
> device trees.

Right, but this could just mean that they end up using SWIOTLB
to bounce the high DMA pages or use an IOMMU rather than actually
translating the physical address to a dma address.

The only special case I see for freescale powerpc chips is the
PCI dma_set_mask() handler that does

static void fsl_pci_dma_set_mask(struct device *dev, u64 dma_mask)
{
        /*
         * Fix up PCI devices that are able to DMA to the large inbound
         * mapping that allows addressing any RAM address from across PCI.
         */
        if (dev_is_pci(dev) && dma_mask >= pci64_dma_offset * 2 - 1) {
                dev->bus_dma_limit = 0;
                dev->archdata.dma_offset = pci64_dma_offset;
        }
}

but that should not apply here because this is not a PCI device.

> I'll check on this, but I think it's a seperate issue. The main thing is
> just to configure the dma hw correctly.

I think it's still important to check this before changing the
driver: if the larger mask doesn't actually have any effect now
because the DT caps the DMA at 4GB, then it might break later
when someone adds the correct dma-ranges properties.

> So a little research shows that these 3 compatible strings in
> the fsldma are:
>
> fsl,elo3-dma:		40-bit
> fsl,eloplus-dma:	36-bit
> fsl,elo-dma:		32-bit
>
> I'll rework it so addressing is based on the compatible string.

Sounds good, yes. Just to clarify: where did you find those
limits? Are you sure those are not just the maximum addressable
amounts of physical RAM on the chips that use the respective
controllers?

      Arnd

