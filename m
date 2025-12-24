Return-Path: <linuxppc-dev+bounces-14990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9BCDC05A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 11:40:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbpL841bCz2yFd;
	Wed, 24 Dec 2025 21:40:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766572816;
	cv=none; b=Lv0C8T94MxypNnUYbqwe3Mc9tsBb3P9oW1Nqch16dwYwNMkxlgdl9qwKf+BtNk/yAXGbWW3haK7uqI4386Tcfmz2a6+DO+KPE/pcvKvovddPpHkSPSE7Z2nKxCpUdEe/CosVqteG8B+m2ze4mV3NMU7Kf8eveTHGt5JeYxOgOUMjiTPipY58C7f5CQzEAQUrCY8eOTjsG2GkUd7M2lVPXtWnP0NALJ1MWBnYaHzQWbtlBYRuLrQmTxefv2XsZbUImFM4CDNHsPAXYvOrPSPj9glGzTfaAOCeYZa8/whcgUmlzHQVcCvdKieUWs0tGE+D/n6nTSha7/s8O+6MzfdP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766572816; c=relaxed/relaxed;
	bh=YX0Iu63byjNVx+YuTlIdUvEoIm6dN1b2nrc/xx3b1B4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ojpp2xm8SIu9pdu/zdRx5uNk1oDg/V9Pz3FEaIVlhlX9oa/D0f6hAHZwZf+XjiNiXv7r53aq+KNEcVUILO8uvG7fATuGMemi5tU3BpjyMNbiKS7Di8NL4JVVJIt8qz2o4NAjHra63AisvxAHsZkQ8LP2CgppFJf9HE3IfayYbJR8l2LQ3Qyc5eDYkX5NncM1C2gq8bt9NLcTnPRPgvZgbH8xcV7U0GO04TUkd7XC4yZBI0NOVhBjgFEAl6XwFFnlx/anf/YRJGeWwYOVrbgRRhclpucMtYGaRUD0msQIyCRG+cg50Cwlt6Vn0lLf/H7R0OOg4rgrT7VVKos3QompMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=QeJJgFZh; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=LyacBheg; dkim-atps=neutral; spf=pass (client-ip=202.12.124.152; helo=fhigh-b1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=QeJJgFZh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=LyacBheg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.152; helo=fhigh-b1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbpL43LLlz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 21:40:11 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 16CC97A0111;
	Wed, 24 Dec 2025 05:40:07 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 24 Dec 2025 05:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766572806;
	 x=1766659206; bh=YX0Iu63byjNVx+YuTlIdUvEoIm6dN1b2nrc/xx3b1B4=; b=
	QeJJgFZhNvvg0LviLTt+Pq5z3YtzD9j7TUGykYJZMwfAX0UFf6qeDVyVIERLmj5p
	U7j/beLiLT4zFfDYY/bX9GbjBd2MkzDcWJM5CapFk/lYhsWlrLjvRsHhPArOucK+
	oM5O4fAp1pWVB50sMYoixNnD8B8mWIkErPF7ZfAchJJE8jEe9oHngj4CWWcTzurL
	UtR+OffS0D49o+dM8YZ9iDIoYxUkTRr3trBcSI+qd6I7+MRdqma44EA6FE/24IrX
	3IiZXXefHN2GRZ7XkOIhYgzFpUarW7nIQRqisVOBOoYkhoSoJDRQezI3JQUok0MD
	9Kh4HKMAAVKu6Pxb7e9xjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766572806; x=
	1766659206; bh=YX0Iu63byjNVx+YuTlIdUvEoIm6dN1b2nrc/xx3b1B4=; b=L
	yacBhegZDB19uOBTAp/wSlLXl8g6HBw0+822kqJcnJiIdEm6W+a8lHW2tr66/HJF
	oxpnd+iRDmx4rCaC9u/H8yFh09nkx538PDqIQ86KzhtVmuBR/VllurMBodF5p6iq
	vlKcjySvJq+ECORrqOCTpFi5do4v4hP3x+B8FG4uiIGoV3VJ11w41ifHkyMxpVkX
	PItiB//BWRFNF6Cz0U0TPgDDV5jRYxZfWpRzmR2q90i/hBnqbh2gYMGeVoN2OZiM
	rFWjIge4/DHxL2S3RVSBxZ5tVMR2YUdnrN9PhqjhfadJZ/cHELc8gkooejWNHcFj
	WgatZY5d/aQpBvTMtWZTA==
X-ME-Sender: <xms:BcNLaQ8_rLHVTGubTg2P5ApbiePHfRLPueQURHHYIn4yM1yRNivjNw>
    <xme:BcNLaTgnYWbussBHtYvReijMeyGzF5RDOnjwZpljyD3i3rzrX4cvRjTLXaI3xtGjs
    xFX0CfAf-Krn4xifppTrCf97cnrPk_15Du-2hfEAbYIdTHkwk1xb4E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeivdeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopegrnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtghpthhtohepfihilhhlhies
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheptghhlhgvrhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    giekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtg
    hkrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordho
    rhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:BsNLabj5Yb1efwgwyTd1LSIMoi70vcnjBOt3SFtI-jp0Z29wK1e9LA>
    <xmx:BsNLadkCZiJD4h480VwjNs-pq8OK3G1CzOk3qfrOsmNA6HAkAqeqMQ>
    <xmx:BsNLaUq0Wy6zYySKPnxsEUBzUKAr8PGSq2bXJWTVEibcouFQDC-kzA>
    <xmx:BsNLaZJ9xGBNNGmTeO_GCEZiyEqQkgoYgAA_A9A2X_-wwwkI0r4IJQ>
    <xmx:BsNLaQOG8zh3VdLD6QUVIu4Ol1HBvAQigwbEglcR8MAqbb0gtF6h8g8h>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E4F4570006D; Wed, 24 Dec 2025 05:40:05 -0500 (EST)
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
X-ThreadId: AQxZfb8dcq5J
Date: Wed, 24 Dec 2025 11:39:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, linux-mm@kvack.org,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Message-Id: <f6c49549-57af-4640-a09e-896c47bb8657@app.fastmail.com>
In-Reply-To: <aUtPRFdbpSQ20eOx@nvidia.com>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-4-arnd@kernel.org>
 <20251219171412.GG254720@nvidia.com>
 <513078d3-976a-4e6d-b311-dcfcfea99238@app.fastmail.com>
 <aUtPRFdbpSQ20eOx@nvidia.com>
Subject: Re: [PATCH 3/4] ARM: remove support for highmem on VIVT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 24, 2025, at 03:26, Jason Gunthorpe wrote:
> On Fri, Dec 19, 2025 at 09:34:33PM +0100, Arnd Bergmann wrote:
>> On Fri, Dec 19, 2025, at 18:14, Jason Gunthorpe wrote:
>> >
>> > This looks great, but do you think there should be a boot time crash
>> > if a VIVT and HIGHMEM are enabled, just incase?
>> 
>> Do you mean in the common code or just for Arm?
>> 
>> We could use the Arm specific cache_is_vivt() macro, but it feels like
>> the 'dpends on !CPU_CACHE_VIVT' Kconfig check I added is both
>> safer and simpler.
>
> Okay, so maybe I'm asking if !CPU_CACHE_VIVT then the kernel fails to
> boot on vivt systems, maybe it already does?
>

Yes, in two separate ways:

- you can build a kernel for any combination of armv4/v4t/v5 CPUs
  (all VIVT), or any combination of armv6/v6k/v7/v7ve/v8 CPUs
  (all VIPT or PIPT), but we already enforce that you cannot mix
  the two in any way. The two sets are sufficiently different in
  terms of instruction set, MMU cache and FPU that trying to boot
  the wrong one probably doesn't even get to the point of printing
  any output.

- If something changed about the assumption above, any Arm kernel
  still needs to enable support for each individual CPU model that
  you may want to boot on. Enabling a SoC family will select the
  CPUs used in that SoC, and enabling a CPU type selects
  the cache features like CPU_CACHE_VIVT. Attempting to boot
  on a CPU model that is not enabled in the kernel build makes
  it fail in setup_arch() with:

                pr_err("CPU%u: configuration botched (ID %08x), CPU halted\n",
                       smp_processor_id(), midr);
                while (1)
                        ;

     Arnd

