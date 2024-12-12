Return-Path: <linuxppc-dev+bounces-4060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED49EFDD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 22:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8Q2z0FM8z2xs8;
	Fri, 13 Dec 2024 08:04:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734037498;
	cv=none; b=OBajqsu0Ot80JqRV2d1Wc3pw9pyGXVcc7BbxKvfFZaTxmY0lXQHNtxvjwOLRusbJMN/m6zDcSDDwZiTBoTdd5oaYJ1dW2xYPWKcp3D2ktV9edP8PTiBcc+J1PX5UjX1Bg9bOkXs1hCK3vruKGwWwNMpj+UdXVvDBUq39S8XSxBrI8MKgJcqobCnod/6Fp1E8lIvTZCmzDbpDbkvrJh0021JG6jyJnbS9Ww64hIKqTIWMLvr4ywZ/wRD7AyFYvH8S/ca3JVK+o+AlFqsMm+zW9pC0I+HWOFi3uONruc1a66+EBWpvtGnn9tLbYHq6a55QZGxY5tWss+cEla3ZhQMp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734037498; c=relaxed/relaxed;
	bh=t2QvztPOWssUJXFYLmASJt/NSwx7RZmzOhWkYNbqO9M=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Vpff6iaVmTr1TPCBfmXWCTWgl6RHvC5j+vWWgUn+6DD00lICOTzEWyue85c7lCrhObXPX9cBdw6Q9Ll4anK8WlKZwsmW267hDBAmfzaNY8CqbF9n6KKZ/thGdsO/xq8KVLP3fa2gtsSUJJxQwnhzsIi2vOFfQw/53laYT4OIsGOMY9NyHTQSBmS2t9Om1qbKuU2zhJF84WGsEn4dlXv8NUWKEDt9myKk8tt2yLCB2SPrySCvrxAs5jPknvpDE8wItx6SMK8lLmU9gWOL/CorXq2sCk7/FU9//4Coepsm39tJIcK9ti3l5QQAdlN6qqAF5GmoS4ZmLlrlNau8qbofxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=fNSQxryP; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=kHg+Y8l9; dkim-atps=neutral; spf=pass (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=fNSQxryP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=kHg+Y8l9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8Q2s0CRXz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 08:04:52 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 9BD4113836FD;
	Thu, 12 Dec 2024 16:04:49 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 12 Dec 2024 16:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734037489;
	 x=1734123889; bh=t2QvztPOWssUJXFYLmASJt/NSwx7RZmzOhWkYNbqO9M=; b=
	fNSQxryPa+6Ryewwlh5FvVHNf4uUgijNsB6iIXkk4e4yyVFBoGnMO/zy7jiaPK53
	WI18kmBbmi6YIjgj3Oi04CoQvJ2j18ACinbCXyUoNRfjZQk3pMPbxM+f1gkYT4YX
	lcWwZemPjmvvDAO2qd8s+trMGRH+dbpzC6vzh0xJazlWbRneUOsUSncF4XkEJ2uA
	yjmNNhuK2mOHkIOMa8KhkuvYd1dhnu/U98NbSP2Uzm4Jxs5YTDrBRWeDmjauD5Zk
	9ksu9sqPy4pVzth+vItWSKZCT0Y1oh4V9K/PvqjdwiElaJslBopW6W2Np4VqASZ7
	xP/Yv3guHITF0BHJGVsY6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734037489; x=
	1734123889; bh=t2QvztPOWssUJXFYLmASJt/NSwx7RZmzOhWkYNbqO9M=; b=k
	Hg+Y8l9a/MUSIKSB5J/EWzv90L8PUrmZKCB4bsOzKzbKF3kyVFCy4Jl2b9NWZ/lC
	dp2Lt8yzl7VqzSWIDPLL6/fo25YQpb5PedcDnYqOeZB3gt0qiZZprXL8ujOOtA3s
	f6lDfnSoQAKMXgv1b7Ovz6bkpHDyiqBN+vMxYrRaTHgAQQ9Do+cDwYHDFg7e+nx3
	TCwwDwCbRAFjpqPVoqp08QMes+zodozNI8jHmqPwGcRvopE+fHc2g46rJhGrs+pD
	g2/5QEpW7+OlKvJ+e0oz8+5YmfTicqfKAKLazy7AEXVY0oySkQmLP1eHa/sT1+xe
	Vfv17q/HTQ0XgZ5g83t8w==
X-ME-Sender: <xms:8E9bZ6yIHwvcu8umaMyaXUPzPL4w-0xM4iT0NRdnrCLj_bJwHKpdKQ>
    <xme:8E9bZ2TVvX-AJRqsCgEP0cVImJRL23XDmbL61dubaZh3rNSU_1NFPDClkDVudRAQm
    25NPulR6wl-tmImQGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgddugedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
    dprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggv
    lhhlvghrsehgmhigrdguvgdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrd
    hfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtrghgihhn
    gheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigphhptgdqug
    gvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohepjhgrvhhivghrmhes
    rhgvughhrghtrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrd
    guvgdprhgtphhtthhopehlihhnuhigqdhfsgguvghvsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:8E9bZ8ULHFlGOT4VK_DizoXtV5BzyZsLVXQqhAsNYrpg42EP3ebF4w>
    <xmx:8E9bZwhtAxhrYEJrM1BiPG3MLPQZ46_PABC7Hu0m-tabbpuuAHDv5Q>
    <xmx:8E9bZ8BgDv1QOmtQqViA-CdxsOfFciFjnatF0TRwUc4DDbhLfg3C2A>
    <xmx:8E9bZxJO8tuaGOMgUYp2QMETvXTtta8gXk6mczI8AqZ7kw6yrY1cHA>
    <xmx:8U9bZ41vKUXH6g37ZjBSOKtbPFc4EngBUxTW0DA1q2Dl7jMO2sgkleOp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A6C5C2220072; Thu, 12 Dec 2024 16:04:48 -0500 (EST)
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
Date: Thu, 12 Dec 2024 22:04:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Helge Deller" <deller@gmx.de>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Message-Id: <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
In-Reply-To: <09edb59a-527a-4ddb-bfaf-ea74fb5a3023@gmx.de>
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <09edb59a-527a-4ddb-bfaf-ea74fb5a3023@gmx.de>
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Dec 12, 2024, at 19:44, Helge Deller wrote:
> On 12/12/24 11:04, Thomas Zimmermann wrote:
>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>> only controls backlight support within fbdev core code and data
>> structures.
>>
>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>> select it explicitly. Fixes warnings about recursive dependencies,
>> such as [...]
>
> I think in the fbdev drivers themselves you should do:
> 	select BACKLIGHT_CLASS_DEVICE
> instead of "depending" on it.
> This is the way as it's done in the DRM tiny and the i915/gma500 DRM drivers.
>
> So, something like:
>
> --- a/drivers/staging/fbtft/Kconfig
>         tristate "Support for small TFT LCD display modules"
>         depends on FB && SPI
>         depends on FB_DEVICE
>    +    select BACKLIGHT_DEVICE_CLASS
>         depends on GPIOLIB || COMPILE_TEST
>         select FB_BACKLIGHT
>
> config FB_BACKLIGHT
>            tristate
>            depends on FB
>    -	  select BACKLIGHT_CLASS_DEVICE
>    +       depends on BACKLIGHT_CLASS_DEVICE
>
>
> Would that fix the dependency warning?

The above is generally a mistake and the root cause of the
dependency loops. With very few exceptions, the solution in
these cases is to find the inconsistent 'select' and change
it into 'depends on'.

I actually have a few more patches like this that I've
been carrying for years now, e.g. one that changes all the
'select I2C' into appropriate dependencies.

       Arnd

