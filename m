Return-Path: <linuxppc-dev+bounces-4420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F73D9FA831
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 21:50:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGYFy5141z2yNR;
	Mon, 23 Dec 2024 07:50:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734900646;
	cv=none; b=cj5FVqb1Ap0BZGbEZv+IitLZ+T10hUDN08CbikMh2yVdNpNF7BbFUYXXMWyin3YZJQ8gswxIMNb+tmSDyyzSa0zzgZt/TmdE6402ZMoj8iZg2F1+cL/4WBw7R9frgOARcZSCEodlg5Cchgby4iNUspGL3erlgIgPD+VayIS2PGY1e6UGywWTO3gvz+jKN3k/ClcSzKceZfxDfPyeYh6/7xuQXiNCY8G4DGoiYKnUL4d0MbZyR/w1T9tK7EZc1emhFzF6Vk+O90ih/Q7QwlD5kogqiIU6Sz36CyVDkVC47Xn+a71Mqz0CCaZnNhH8ws6mgDdzOa0ZODQSHRN/+mFrrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734900646; c=relaxed/relaxed;
	bh=Rf8HTC2GUZef4BinOdJ056Pi5Y0iNq0oeaX4eYK3d8g=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gRENwsDzaBaHbPKInmgU6hE8GlGYky4OqMetMIw6/N2Rcpcthy/E6TnUY43u4yzNNpb8BnpmnKPywBw1sV0UTfOaJvhHjIFRTwPdrcxuRSLcr2cbp15TwE7zTl5aww8D88S8r28O02KDozIN2lrTcZytuKe4HInQTvkSG877yuNGuqULZ3d2CGLX2JQXxHuFwsqdsNzd0VYSlDqxBn4AZRGhZeoRR2iBdZIO8D8zjbd/hRmaU1ZChz90bWjt1Icj2Lx2v+zoQr9DQmhCvMoWbk+gqz31NSicCqQvrHkzxBGa1hr0oFPO1pvt4ZNYmv/mD7BOlvZg3FE02lt3dy9lnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=lueHN3w5; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YqOPIrAV; dkim-atps=neutral; spf=pass (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=lueHN3w5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YqOPIrAV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGYFs5DJnz2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 07:50:41 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0C1502540131;
	Sun, 22 Dec 2024 15:50:37 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sun, 22 Dec 2024 15:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734900636;
	 x=1734987036; bh=Rf8HTC2GUZef4BinOdJ056Pi5Y0iNq0oeaX4eYK3d8g=; b=
	lueHN3w5sU4nX697BDhg3UFMyml6WZBxELI3lTWObVxjzcDqZMGAuXJNHmJmxrqp
	oVZo3nqrbv4ftmj4iZ2C7rFTpjn/+5V9zI+R2tMXFj8nleu0vxF49Azl6sMWEuE1
	FrfhIEQtZfzsKCcJM0+ZdE/tFF++KA856qdd8ngqWCkx3gnVRgsrn3P5ttaRrbxX
	Wkrg3mJZN1ZJLPGnXELaRsakkafMhgZdHJv0xjFF53Z5YrjxQqGemQGieK8NoAAT
	ipTpj79VIEao67wYkaXVFks05bp16KDDRBx7l8BgxsYDbNGGzC+9IrgLPuizkxS2
	RmI4V7Fdx9vukNOCqLxlLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1734900636; x=
	1734987036; bh=Rf8HTC2GUZef4BinOdJ056Pi5Y0iNq0oeaX4eYK3d8g=; b=Y
	qOPIrAVhuCGwN/LkV3KEjdd84e2LX2BKjrI0e5tCoUwn6z2J3MnT/eGnG5ofdFQg
	HAXl8XTT0Oolj8m+QO5sNdOHdBig1PuOxCoBap/NjDVd70Q8sgVn9JXHDcQ0xa4q
	2wLm9I+sMkumDDVTb6aFFjfIjRUgoBBpj+JfBcLoLW/x2WoE5yjzOXZRDdn3927w
	9TwgmMiA+EwczeCxvYrRa9soLOyB9XJdd6qqqX8zlsJdDv5PbGhyj8noVsuuJ5uo
	aPuwrhmHLGe2evy8EDoA3PyVfNz7Ua4miaHMX0KSCFJxADesQBCVLlAlJ2NJblsx
	SpuEpuW54nJYJdPkO190A==
X-ME-Sender: <xms:m3toZ8dS_XZLCmUk55mPdHigc0qKqkUym8u-2dBoTox5ue0T2TwUPw>
    <xme:m3toZ-MkpWvmVPYI51FRTznYF1AKyQjrPosrz1wd1NoRvleieU4F-vxRZG92-8EBi
    sjBWTt9Snf8A7Pe-o0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtkedgudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvg
    hrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdr
    tghhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhope
    guvghllhgvrhesghhmgidruggvpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsth
    hsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtrghg
    ihhngheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigphhptg
    dquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohepjhgrvhhivghr
    mhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:m3toZ9j-GAc9eDSisS2nN90jwMSe0HJi3uId5uR7ZS9Z5IddydD62w>
    <xmx:m3toZx_-nf5SkTyNWu_qmLDQM-lyFTPpp43QpR_9foZjLhISZxuWjA>
    <xmx:m3toZ4vRbL6twZi9odX52pMvlUkc1JpIYM9Sday2JEz-gVq8RswjwQ>
    <xmx:m3toZ4G2og-zJcvouHmHObHg7oFeaBAKdM7GsmZZn4em0-LYTf4UQQ>
    <xmx:nHtoZ5ncptZD5LrSlBDMkX0nIbiKkAuj5ABLBvBz1aWmChA3As8yDXAJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 120342220072; Sun, 22 Dec 2024 15:50:34 -0500 (EST)
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
Date: Sun, 22 Dec 2024 21:50:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Helge Deller" <deller@gmx.de>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Simona Vetter" <simona@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Message-Id: <270f8274-43e7-46fa-a6c5-a998edae1c7c@app.fastmail.com>
In-Reply-To: <83c2f489-4ef1-4b31-8fb3-50f027bebd4c@gmx.de>
References: <20241216074450.8590-1-tzimmermann@suse.de>
 <20241216074450.8590-2-tzimmermann@suse.de>
 <6ed9693e-e8f5-4786-b440-4e27c6d31da3@gmx.de>
 <4e1a06aa-3b00-45b5-a5e3-bb802e774c88@suse.de>
 <83c2f489-4ef1-4b31-8fb3-50f027bebd4c@gmx.de>
Subject: Re: [PATCH v3 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Dec 22, 2024, at 21:15, Helge Deller wrote:
> On 12/22/24 17:09, Thomas Zimmermann wrote:

>>>> +=C2=A0=C2=A0=C2=A0 depends on BACKLIGHT_CLASS_DEVICE=3Dy || BACKLI=
GHT_CLASS_DEVICE=3DFB_NVIDIA
>>>
>>> Seems wrong. BACKLIGHT_CLASS_DEVICE is of type tristate.
>>> There are more of those, please check.
>>
>> It's exactly correct. Linking would fail with FB_NVIDIA=3Dy and BACKL=
IGHT=3Dm. The above construct avoids this case. Please see Arnd's review=
 comment at [1].
>
> I'm not arguing against "depends on BACKLIGHT_CLASS_DEVICE=3Dy".
> It's the "BACKLIGHT_CLASS_DEVICE=3DFB_NVIDIA" which is wrong.
> BACKLIGHT_CLASS_DEVICE is tristate, so either "y", "n" or "m", but=20
> never "FB_NVIDIA".

There are multiple ways to express this, but that line is a correct
way to allow all of

  BACKLIGHT_CLASS_DEVICE=3Dy, FB_NVIDIA=3Dm, FB_NVIDIA_BACKLIGHT=3Dy
  BACKLIGHT_CLASS_DEVICE=3Dy, FB_NVIDIA=3Dy, FB_NVIDIA_BACKLIGHT=3Dy
  BACKLIGHT_CLASS_DEVICE=3Dm, FB_NVIDIA=3Dm, FB_NVIDIA_BACKLIGHT=3Dy

but disallow the broken

  BACKLIGHT_CLASS_DEVICE=3Dm, FB_NVIDIA=3Dy, FB_NVIDIA_BACKLIGHT=3Dy

If you find this line too confusing, can you suggest a different
expression that has the same behavior?

       Arnd

