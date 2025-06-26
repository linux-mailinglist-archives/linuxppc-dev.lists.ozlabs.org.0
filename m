Return-Path: <linuxppc-dev+bounces-9810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A26AE9D71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 14:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSdJV5qgVz2xYl;
	Thu, 26 Jun 2025 22:28:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750940906;
	cv=none; b=XzaiJKofxpvQfPsPyzHUMOvb4Pi0VdGyFMPCu5BlfsGDnt9XSzEB5s5MQu++7O/javLydDBGEbdqUU1J6zayUoJGtSmjhC6WspkPU/8gPRVWPsVZ/CDcHZaIA19gNewyr/rVB78io/OaGPKGvQKeuwsx2hYejA2FdBTDvpIDaR3vEhZLMKLsgUmJZuKxnHWdj6UKZ0WdNwDgByK6uEtyvBtbdXFVULRIUPa/N02yG1MtmzcKfFZoRq2LZa54C8cimAqE2Gu6ILourzuw7sMkvsrrYHjSDqpaUvTTa1vSyWHsUVvBmd4wHyK6rN27XOsbG1K1tXEkSsAITqyebTU49A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750940906; c=relaxed/relaxed;
	bh=yhvCapA+CzAoCFu5PttVIJhSrWZvvCFVrtw0oQI/xk4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eUapacHsnkT3mcrPRScX2bKzZ3Kd5qLbbAIhyoATWWjQlum0brPTW+k/JMfIWZDlROdQLE2xtYN2TqL6eEJ4p6JzGIHjrBMHUGL3SPtDSO2nPXAaDOx/78bc1cNDg/ZBS7uTzcym3Pe/YOq3IYN5vz6s4d/D3oL02RipWT8st5ytLmnjqv9H2WHnfduYNXQyW4QZUUcamml9teDzCbF/V2fdEG9yVBu+mvdiSx8J/oCP74jdg0/qGTP0CIefFBqJA/5ne517t7Rb74fyp/VF/JUamt4kdPky3+1cdidcORTujzcnTjH90vr0a9P5PxittUIBkWUGtCScSTMHYqmc8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=TbbJ1xVu; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gxcBYFUP; dkim-atps=neutral; spf=pass (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org) smtp.mailfrom=arunraghavan.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=TbbJ1xVu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gxcBYFUP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arunraghavan.net (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSdJS2KXbz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 22:28:23 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 47B94140008E;
	Thu, 26 Jun 2025 08:28:20 -0400 (EDT)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-05.internal (MEProxy); Thu, 26 Jun 2025 08:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1750940900; x=1751027300; bh=yhvCapA+CzAoCFu5PttVI
	JhSrWZvvCFVrtw0oQI/xk4=; b=TbbJ1xVuOel5NBzm4nPMYSOuThjpyG2gbSPJy
	ROVsIUOlZ7tyCu4ZnCXGXSY6bmNlbRtyeW2SFzyp9GLPKnKip1a8JHEyT8MAXvGv
	05FVqwj+ly3gfnFi+bEQPzc1Yi/ceJ0zlzJkJtoktOSYUBYcWi8AogJoHJpAObx/
	H21gnwgQOJGPaW9zt3jvI0hAhv9Fv4rFZVzUA8aQGil201ustbWN+JsaS3ibUEBI
	lC/yU92g0PpQw9lJIeZBRkOkjGNdgPssm1eQAz4/RKAo8NkCblatKlkd65NtlrGF
	Fa+fCJJWHUp2Kybbrg1Ocn8m9FogNULKOju8G6NIuLymkj4hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750940900; x=
	1751027300; bh=yhvCapA+CzAoCFu5PttVIJhSrWZvvCFVrtw0oQI/xk4=; b=g
	xcBYFUPBVr90AAVrd33kClnU5uge/cKZ/GnL2tO2EYN9prKe2+vh/FeAfo3xmLRO
	UO/dFRBeNtzSQFxBxnjXdTg0YpUSUYnBEo+9K449DRuxFtIz2bI+FzvtNSvkmtZS
	K1X8gcpSMna++Rtm6jNcfmC51lxhdOJBKVh/gjXkZJwlv0Ze9d9teKltOqiMRn1R
	6+3NBj0rF1T/zjwTsrqexKIXAugzKCEWN8Z+EKIy2+I5kKiNNSk3JsscN4bMzr3a
	ERbBBkcCflYTlX1GqCm2HtxOPGZdXNOzyMUVJijE8egjWqBFc9ETSiQQbcBJLYwm
	ifgyCx1TFaza2qoBJfcTA==
X-ME-Sender: <xms:4zxdaJKldw4msyA2lykWx7cybRCgvuNal9hOIX0RJADW6t8MvgdQwQ>
    <xme:4zxdaFLHQC4Pt8glC_tcFMyor7ePCBYNPzhxQ74H39k6Ld1F7GY9eGFIknWoptpQR
    v9hSEUpgaXyp_YLBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhunhcutfgr
    ghhhrghvrghnfdcuoegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtqeenucggtf
    frrghtthgvrhhnpeevkeehvdetudfhlefhkeffvdeihfegffdvffdtheekvefhuddugfei
    gedtiefgleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtpdhnsggprhgtphhtthhopedu
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghruhhnsegrshihmhhpthhoth
    hitgdrihhopdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirh
    gufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrg
    hilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpd
    hrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgii
X-ME-Proxy: <xmx:4zxdaBvioLcHnJGPpA2p8Dxwhf7ZHV2nttdCgTTfKUhYnEehvRem0Q>
    <xmx:4zxdaKbza9p51z2E_JEPr29dT0w0LsdjfVZqiGcZyKVcKjmCn_UCLw>
    <xmx:4zxdaAamKcq8otUpRvuUhOw2f7NnUylhuwgHGcahzj2bN0WGTrqRnQ>
    <xmx:4zxdaOCwU0H_Bs3aRQrILB8OU6tQ8WC44co-ZqhqlYerCsXdv4oqMA>
    <xmx:5DxdaIFLZ4RAkBVav2vgksjqVV2YQuIcbPpDUD4fv1pkrqzy36ajz68E>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2BE93B60069; Thu, 26 Jun 2025 08:28:19 -0400 (EDT)
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
Precedence: list
MIME-Version: 1.0
X-ThreadId: T475c73c73170c175
Date: Thu, 26 Jun 2025 08:27:58 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Fabio Estevam" <festevam@gmail.com>
Cc: "Shengjiu Wang" <shengjiu.wang@gmail.com>,
 "Xiubo Li" <Xiubo.Lee@gmail.com>, "Nicolin Chen" <nicoleotsuka@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Pieterjan Camerlynck" <p.camerlynck@televic.com>,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Arun Raghavan" <arun@asymptotic.io>
Message-Id: <fe9956b2-4d71-4a57-ab70-6ff64c4525cf@app.fastmail.com>
In-Reply-To: 
 <CAOMZO5BgsU0ijdoaZs5e=qwb2PYZsEnx_RxfgQ+dosL8hPRKyA@mail.gmail.com>
References: <20250626115218.141874-1-arun@arunraghavan.net>
 <CAOMZO5BgsU0ijdoaZs5e=qwb2PYZsEnx_RxfgQ+dosL8hPRKyA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: fsl_sai: Force a software reset when starting in consumer
 mode
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 26 Jun 2025, at 7:58 AM, Fabio Estevam wrote:
> Hi Arun,
>
> On Thu, Jun 26, 2025 at 8:52=E2=80=AFAM Arun Raghavan
> <arun@arunraghavan.net> wrote:
>>
>> From: Arun Raghavan <arun@asymptotic.io>
>>
>> On an imx8mm platform with an external clock provider, when running
>> the receiver (arecord) and triggering an xrun with xrun_injection, we
>> see a channel swap/offset. This happens sometimes when running only
>> the receiver, but occurs reliably if a transmitter (aplay) is also
>> concurrently running.
>>
>> It seems that the SAI loses track of frame sync during the trigger
>> stop -> trigger start cycle that occurs during an xrun. Doing just a
>> FIFO reset in this case does not suffice, and only a software reset
>> seems to get it back on track.
>>
>> This looks like the same h/w bug that is already handled for the
>> producer case, so we now do the reset unconditionally on config
>> disable.
>>
>> Signed-off-by: Arun Raghavan <arun@asymptotic.io> Reported-by:
>> Pieterjan Camerlynck <p.camerlynck@televic.com>
>
> What about adding a Fixes tag and Cc stable so that it gets backported
> to the stable trees?

Sure! Will send in a v4 with both of these.

The commit that added the initial fix (3e3f8bd56955 ("ASoC: fsl_sai: fix
no frame clk in master mode")) refers to an errata, but I could find
anything in a couple of imx8* errata I checked.

I was wondering if there's any public documentation of this that I can
refer (and link) to?

Cheers,
Arun

