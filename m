Return-Path: <linuxppc-dev+bounces-7890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49104A96433
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 11:26:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhcLB5l7Kz300B;
	Tue, 22 Apr 2025 19:26:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745313970;
	cv=none; b=gkDZ5vs00smKUfzWAtNX9VOYRX950P+eMRnnfeZ9v7ogATEMy6gy85icdkeik6lB25JpUfS1w8sUfz5ME0tmN/JF2AoTJdhTAaM392xmaRLDmaH94SBzWX8dL+mgRSnRB5bM8SJrqjaU1COx8M3M7tVpQ9DITnCe4+UcZJ5vr8ry08XxgnshxnOhN0Quc0XY1tMb5Hte2xksUTxx7tgmqFw2EeuMP6jznCXJiw/hJ4RxFlsg8Dyd3IWpRKRcqT/kqa+6czNL/+O0Zf4h3ap4sEWeo0f8iZP8Mexh5Qx715l7e4t47Up1s4OmD2Tn/RJFFheosTQXjqcQmapr2DdUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745313970; c=relaxed/relaxed;
	bh=1/+0YVTUvXTj7AvVeAYrj06s3CToZPPnPcHrNo0HQwA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=T+ZvjUcaph83hdPjTQ135plpMiL4IMGtptmQZchVTJizkqrq8++Qo8MB82pEuil8zD5GwlPaqW2QTMP+btVfg4XDI0dHg+ZcGb5+YuK14uu/6+02MXqyh6GYaacrryiENGEZ43Nuy272i1jOurroMebW45iZ6Pee2z91Mw8Rx6AA9ygjP6fRUC9VCKhw29rIxbkGgIeryFHE21pKSNglZJQvFLXWKM17fxfYXny6EvUupyyJpE7Ak3vb3FskGlpjCujSWlZ/Rs8xk1CmE8kihz517AmCZqGt2GH9fq5FhfvuVLn3F6XwbUv+y/eVA6xI0u0ZzfNfSOjxCkfo/6UeIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=3CI0aNne; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HUuQOuaM; dkim-atps=neutral; spf=pass (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=3CI0aNne;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HUuQOuaM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhcL65kz9z2yqT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 19:26:06 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 236CD254016E;
	Tue, 22 Apr 2025 05:26:03 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 05:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745313962;
	 x=1745400362; bh=1/+0YVTUvXTj7AvVeAYrj06s3CToZPPnPcHrNo0HQwA=; b=
	3CI0aNneHYAVSeaMa04aK7khsdUCytYTXWMqLjXvptLWdEdiuhsngS3z+CyNSXs2
	ShJC85FEH5QPTcCyKMD4bk6f9pLYhKZGcI0jbVMC1y7xVtH3EsP1QQaS+rsSRN6b
	aNt742LCKcQBSJIQaj2wVfth2YVX5sPDKjflfSL6bEEfTeZc3sEzAxaXONjeDwxE
	ESF5+NVzF1d9hCMkS0ABBnftJ1cEyez1ukbTc9FUsgwJlVGPNiHu9CiDtXdhKm3b
	lspXRDl8NNdvmovyZaGirRYzc+y4GEcPbpHtkOkxeyR3ELUdB/U1l7NnjkYwZMnO
	lbEmDiTjmQ5eWinETqn24g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745313962; x=
	1745400362; bh=1/+0YVTUvXTj7AvVeAYrj06s3CToZPPnPcHrNo0HQwA=; b=H
	UuQOuaMKbtJzpCIfZmWV+gYDfTnBHQJaYWXoVeNIFlFv70/kSMa/2Im0PbapCPrH
	SnhdnVdW6aNl+aeqUGUI279NWzrQMdpwFeXgSxvn/8PbRdzvgzcIIKKcB73zRE/5
	vq7//tvMEJtrCcqKIj/weV5wkGn360rJPGlMhsxFFOgbEKDrp/oDCUFi2hpcbWTx
	YyrbgTixma8fhgLz48cy2gZgyhje0wGJYMZzqVKmpi7+AaXIfSUFCN8A7y1kc9mA
	QZ4av96q62HpL//+AgPKnoug5dsqpKMDQkhDp+fl76yhHTOVotcStQQQMIMZoEY2
	Lvqvgg/w/tiRkIGAnX+kQ==
X-ME-Sender: <xms:qmAHaFNR0X0b4egu_tnuKLWqQgqv03-YG9SqHayrII8pRJaN5yIhUg>
    <xme:qmAHaH9Oqtsi__sG5JpeZ12gpTVo6QIJ7HzQxf8jp36dFeK-Gl_O6SsP5lPUfr0My
    dG97OOg1PjvcjTfyzk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeffeeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:qmAHaETefQDELZAy3qwtvFTJy62gjJmNz063VTFsm8XqipYnX6fGAg>
    <xmx:qmAHaBsn3G4ckJzKk-H_T0K65dQ-7sNKobWy0xyT6GQzrOPIypkgEg>
    <xmx:qmAHaNesBrKIYh1wNpw1f1NaaFosHIIciyoHATzlgdDcqn0Loe5v6w>
    <xmx:qmAHaN1dOxWES_oyUS2pwvAckyzrL4QX9KIdfZInhG7IuDJWNiL35w>
    <xmx:qmAHaFaf_Cy045B3uzzvlC2Bc64HbuymKtz1TKHvS1k02Th8kYjPJ-yA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 92CE32220073; Tue, 22 Apr 2025 05:26:02 -0400 (EDT)
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
Date: Tue, 22 Apr 2025 11:25:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ben Collins" <bcollins@kernel.org>
Cc: dmaengine@vger.kernel.org, "Zhang Wei" <zw@zh-kernel.org>,
 "Vinod Koul" <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Message-Id: <29bdb7e0-6db9-445e-986f-b29af8369c69@app.fastmail.com>
In-Reply-To: <2025042204-apricot-tarsier-b7f5a1@boujee-and-buff>
References: <2025042122-bizarre-ibex-b7ed42@boujee-and-buff>
 <fb0b5293-1cf3-4fcc-be9c-b5fe83f32325@app.fastmail.com>
 <2025042202-uncovered-mongrel-aee116@boujee-and-buff>
 <ace8c85d-6dec-499f-8a8a-35d4672c181d@app.fastmail.com>
 <2025042204-apricot-tarsier-b7f5a1@boujee-and-buff>
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 22, 2025, at 10:56, Ben Collins wrote:
> On Tue, Apr 22, 2025 at 09:59:42AM -0500, Arnd Bergmann wrote:
>> 
>> Right, but this could just mean that they end up using SWIOTLB
>> to bounce the high DMA pages or use an IOMMU rather than actually
>> translating the physical address to a dma address.
>
> There's a few things going on. The Local Address Window can shift
> anywhere in the 64-bit address space and be as wide as the physical
> address (40-bit on T4240, 36-bit on P4080). I think this is mainly for
> IO to PCIe and RapidIO, though.

There are usually two sets of registers, not sure which one the Local
Address Window refers to:

- Translation of MMIO addresses (PCI BAR and device registers) when
  accessed from CPU and possibly from P2P DMA, these are represented
  by the 'ranges' property in DT.

- Translation of physical memory when accessed from a DMA bus master,
  represented by the 'dma-ranges' property.

The latter is what the dma-mapping API needs. This code has changed
a lot over the years, but in the current version the idea is that
the limit enforced by the driver through dma_set_mask() is independent
of the limit enforced by the platform bus based on the dma-ranges
property. 

The bit that matters in the end is the intersection of both,
so dma_map_single() etc only maps a page that is addressable
by both the device and the bus.

>> > I'll check on this, but I think it's a seperate issue. The main thing is
>> > just to configure the dma hw correctly.
>> 
>> I think it's still important to check this before changing the
>> driver: if the larger mask doesn't actually have any effect now
>> because the DT caps the DMA at 4GB, then it might break later
>> when someone adds the correct dma-ranges properties.
>
> I'm adding dma-ranges to my dt for testing.

Ok. The other thing you can try is to printk() the dev->bus_dma_limit
to see if it even tries to use >32bit addressing.

>> > So a little research shows that these 3 compatible strings in
>> > the fsldma are:
>> >
>> > fsl,elo3-dma:		40-bit
>> > fsl,eloplus-dma:	36-bit
>> > fsl,elo-dma:		32-bit
>> >
>> > I'll rework it so addressing is based on the compatible string.
>> 
>> Sounds good, yes. Just to clarify: where did you find those
>> limits? Are you sure those are not just the maximum addressable
>> amounts of physical RAM on the chips that use the respective
>> controllers?
>
> This is where things might be more interesting. The P4080RM and T4240RM
> is where I got this information. Register "cdar" in the fsldma code. This
> makes up 0x08 and 0x0c registers.

> In the RM 0x08 is the extended address register. On P4080 it says this
> holds the top 4 bits of the 36-bit address, and on T4240 it says the top
> 8 bits of the 40-bit address. So the asynx_tx physical address needs to
> be masked to the 36-bit or 40-bit.

Ok, makes sense.

       Arnd

