Return-Path: <linuxppc-dev+bounces-7938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E1A98BD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Apr 2025 15:50:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjL844fqhz2ydx;
	Wed, 23 Apr 2025 23:49:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745416196;
	cv=none; b=UMg40eK1OVUKHyBlZb048ttdQsb09Ne60aOpFAgIWkU6dF1EPOZETTpiZcakCMQF52mzDX5H3hUqc8e3frBUBIlAFaqKrenIjjgsnzt+B5vyXdCm0gac03LGgQEU3O4pPz67ZR3TmsrUWtZCcZtwFAYgb/SGFvyjFaNGotSwWFv8/ad67qwFx3SbrjMWTgP/qXRYFzElYYKzm1V7m3AHYn3LgICvhPDFb43bb+tgtSqEx0x+/h+J2pYr6sESBUB47TA2Jmn6/hiG6VczCQBqKH5DKBWYrHITFU396qHy/lOEP/2WSc2dS7tvamFM5p0Rcc/HKmujVWwJYf/oQAu5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745416196; c=relaxed/relaxed;
	bh=VChUm3sRUsCqwnuWmJt8O1m8Q+AO86xNAt/YCvK6+So=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FVTWQtguTWqDbxQXuU61pZmgQ75qu4gk7KV1AIUyDqDK2CVkpodOUTKXiMwWFMsxgVukVicOu5ZqztmMs/7PenfdkZZzqWpMi9Gp7BbPCgoQDdsEeckldL+hEd503ord+09GfNysg+lxZQwgyIChzKqxzICKhF3NloDgMQI36RVBQ9PhN0VwWckoVpU2lNEICqCI3Tout8y+inWifO/hbSNY9wy1t2RBqdkOUQrCYwJ9DLyAkthr5+qpn9rAD+XoA4ckRCBHQi/y9Gnj+0olcqrnR+PmVeyRMZ3fTQn980PyI+xosfCarwj8yLU9riaxekx1Zgvewv4Xux3otj6GGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=NDs1xlyY; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=F8O7fn8c; dkim-atps=neutral; spf=pass (client-ip=103.168.172.158; helo=fhigh-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=NDs1xlyY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=F8O7fn8c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.158; helo=fhigh-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjL806F71z2yGY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 23:49:51 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4F01011402D4;
	Wed, 23 Apr 2025 09:49:48 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Wed, 23 Apr 2025 09:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745416188;
	 x=1745502588; bh=VChUm3sRUsCqwnuWmJt8O1m8Q+AO86xNAt/YCvK6+So=; b=
	NDs1xlyYyRJehS3fOwCtUCC1D1+2LSVtTp1FFfFHuWVNjm2Alq9XumBzy6iODHtC
	5QaF97O/bQEeiR6s67H2HoaqkuR6QpBsSetZ1dgY0bDrW/Aw5j+8qCh/ApE1ahA9
	R+iowUtks2Gg5CdIQHcxOTfw6pa8qPCA2FMTknPrO+C7UKl572GpRoQqAwZ0Gjmw
	fA2huRjLTjkhYEQjY6oxxoicQWqUVL7nch0XWUq99NqoVJyRHEJ8PM30bwFEAQdA
	e6sPACgwR56O5xGNDmyTAx4tZ4fleoM/mnhge2kFr9U0zQP/8PwLg6yB4T7PQC/A
	h4ON6dtBWjUzFUBib4TidA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745416188; x=
	1745502588; bh=VChUm3sRUsCqwnuWmJt8O1m8Q+AO86xNAt/YCvK6+So=; b=F
	8O7fn8clYWCSO+0d+SSifxp2KQ5eLRMJMODl3GMxcETrhuKoUOmEWgOOZw+zh5Vh
	QEL7G0KM1UBOOQAUJYRsUH/PZ/tU2lWEHhg5mBDi4b0eOaasTcBpWGlI5ihbFLRV
	JuSOc0H+6DOjFdEnQSo3FqmPeEK524RO50G1LB9VUpo3gWFkG9nsEhpHeixtNVe+
	NJWIZS5sI9hjn8sX2UxdJArl0MgM16UFgyRvAawU9rAc4Vw3ZCHboqPyLpOwrdHF
	umPH1yYcwbQKFC0ILf4raC4cznVv/yjJlALoBwJNr46UvbdgVa17MlZ0vUmT5hDs
	fyfrrzgl5wEs7Eu91qrfA==
X-ME-Sender: <xms:--8IaKJ8uwi0oISUPlSCJH1YkeYhfm0zbx_nqMG3mcTsLdWaGj5S8g>
    <xme:--8IaCK5G9PltrDsLnsGcnArlGIfGE8YyKpbwKI_H2EJINDVLhMZQA-2uq6PiHKw-
    e0FhKpM6UDslClZIFM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeijeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepgefgjedujedvieejgeelgfdthfduffeiteef
    udeghfffkeejfeehtdejfeejteefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghrmhdrtghomhdprhgtphhtthhopegs
    tgholhhlihhnsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhkohhulheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdho
    iihlrggsshdrohhrghdprhgtphhtthhopegumhgrvghnghhinhgvsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:--8IaKu32umSgzsK5FB2N-6mBhlHA0buQBz1IDRHdIUQmicKWocyrA>
    <xmx:--8IaPZBq_MT58H9OuOzQ9XapDgXq7drt8WxZTBctKTEawhF-nEs_g>
    <xmx:--8IaBbeOfyxuNJ9NnPOltD_db4EkqyxQZQ1GTTvVG6dAU_PNGnFkw>
    <xmx:--8IaLDvWbNkTuGhdQhFUJmBfieS8MFKY-7tW9-axuJpfhilogo0KA>
    <xmx:_O8IaJk8HIjtiqkGSqLBORdkagwKSQOpiccj2ax0fwtBuCni_Qf6SOuZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CDC932220073; Wed, 23 Apr 2025 09:49:47 -0400 (EDT)
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
Date: Wed, 23 Apr 2025 15:49:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ben Collins" <bcollins@kernel.org>
Cc: dmaengine@vger.kernel.org, "Vinod Koul" <vkoul@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Robin Murphy" <robin.murphy@arm.com>
Message-Id: <06765168-a36a-4229-b03b-6ea91157237a@app.fastmail.com>
In-Reply-To: <2025042216-hungry-hound-77ecae@boujee-and-buff>
References: <2025042122-bizarre-ibex-b7ed42@boujee-and-buff>
 <fb0b5293-1cf3-4fcc-be9c-b5fe83f32325@app.fastmail.com>
 <2025042202-uncovered-mongrel-aee116@boujee-and-buff>
 <ace8c85d-6dec-499f-8a8a-35d4672c181d@app.fastmail.com>
 <2025042204-apricot-tarsier-b7f5a1@boujee-and-buff>
 <29bdb7e0-6db9-445e-986f-b29af8369c69@app.fastmail.com>
 <2025042216-hungry-hound-77ecae@boujee-and-buff>
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 22, 2025, at 23:10, Ben Collins wrote:
> On Tue, Apr 22, 2025 at 11:25:40AM -0500, Arnd Bergmann wrote:
>> On Tue, Apr 22, 2025, at 10:56, Ben Collins wrote:
>>
>> >> > I'll check on this, but I think it's a seperate issue. The main thing is
>> >> > just to configure the dma hw correctly.
>> >> 
>> >> I think it's still important to check this before changing the
>> >> driver: if the larger mask doesn't actually have any effect now
>> >> because the DT caps the DMA at 4GB, then it might break later
>> >> when someone adds the correct dma-ranges properties.
>> >
>> > I'm adding dma-ranges to my dt for testing.
>> 
>> Ok. The other thing you can try is to printk() the dev->bus_dma_limit
>> to see if it even tries to use >32bit addressing.
>
> Did that. Every combination of IOMMU on/off and dma-ranges in my dt always
> showed bus_dma_limit as 0x0.

Strange, either something changed since I last looked at this code,
or there is something on Freescale SoCs that avoids the
default logic.

There was originally a hack for powerpc that allowed DMA to be
done in the absence of a dma-ranges property in the bus node, but
limit it to 32-bit addressing for backwards compatibility, while
all other architectures should require either an empty dma-ranges
to allow full addressing or a specific translation if there is
a bus specific limit and/or offset.

Looking at the current code I don't see that any more, so it's
possible that now any DMA is allowed even if there is no
dma-ranges property at all.

> As an aside, if you could give this a quick check, I can send the revised
> patch. Appreciate the feedback.
>
> https://github.com/benmcollins/linux/commit/2f2946b33294ebff2fdaae6d1eadc976147470d6

This looks correct to me, but I would change two things:

 - remove the debug message, which you probably left by accident
 - instead of the explicit of_device_is_compatible(), change it
   to use the .data field of the of_device_id table instead.

       Arnd

