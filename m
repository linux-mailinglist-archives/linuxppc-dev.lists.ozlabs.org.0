Return-Path: <linuxppc-dev+bounces-3909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B26FB9EB353
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 15:30:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y71P80ktVz2yjR;
	Wed, 11 Dec 2024 01:30:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733841052;
	cv=none; b=IEajH+yStA93KYcM9wKQNSxbCwPDNqrIQ0rImh65Wq5bYG9UDSlh0ImJMqoH4HdhD50f1hSfwuQFQcVEV1Uwm14+UFe+mdS2pX84f8Wi8BrDmVbnXvRDpK2iA+RfDQhib1wrYM+vamYn7DO6vMBaWuK8ZflxQK1B2r9peSAw3HNyMxGJeRbfan5uF2VSheULhfl6Ml4VQ85qylRhnaWCYRBAF89YriZE0Pu02n9dwvMNdfl9gcc4xkQN227C2n8D2NPay3Qt++4E1qdoGIwbdzKmCsNl72d+yusphKWHWOLbzKhiOLHR/r8ttqdN+tfa3N5o8vXsqEVL7vRMX2qiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733841052; c=relaxed/relaxed;
	bh=Uil3wJvR16+q+H5kSH9NNdVYOiOEWY9WIj6bzx8DuI0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZYew/zfIlA+TzPf9yfyC8EakDICxXyRjPTvkq6u1fUpXAQq5b1YvBeeWTZySdKz15XNS/QWpea73qMe7inwOIhZ3H+KTd4eUMm5EBvTysx8emnR46YyEFNRkoU0hYvngq6DKrvDKpW1ljVLQT8R/OI6HRZzsj7vdSwK2AKoyEdjTFGMpp7KxAVfBUqNSYgwT1y42jkBmG/3osf+JDzLqSOtLbmUypir846XClag+sy8voK5uhtfd2pJLxkLOYcioxnDZ+A9OexYxEts03xMxFDVYVctQA1GOYQ1wiUIYg6oJPOcFpwoKkviqMgPIQX9RgEDVuiNkyO41ysgZWoriCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=p4P9u5cg; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TDKABZQd; dkim-atps=neutral; spf=pass (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=p4P9u5cg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TDKABZQd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y71P262w8z2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 01:30:45 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 693E913841C4;
	Tue, 10 Dec 2024 09:30:42 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 10 Dec 2024 09:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733841042;
	 x=1733927442; bh=Uil3wJvR16+q+H5kSH9NNdVYOiOEWY9WIj6bzx8DuI0=; b=
	p4P9u5cgzQZrXc94sjttH74v5r8YoxKe8PwgblnL3AuFJJKVeSNQcEJ+0dx5JQ2x
	iVkB4eqIcftU/iQjmXAkflxzecpIKZYY7uhn/x3mN3edPFatfhgnVZBF/hEoh10B
	/jO/tWYXI21ycUC1jufuyVk2xhsVNHF8j3W1OTNrb31o0sNf2rcCOYKungRoLY74
	j6/YcAm1S8apWi7dJlgMYmqk1E/skBGyg6oOaPRDb0b4BhIHAkciWCRUrJoZAlWd
	QU7Oe2eNy+O28PINbv5+fFMX5ORX+FeOZr0xp1/GE2uac/ccNuvNwWA4nsky1waL
	AQO4+UhzSPxX3lR610W9sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733841042; x=
	1733927442; bh=Uil3wJvR16+q+H5kSH9NNdVYOiOEWY9WIj6bzx8DuI0=; b=T
	DKABZQd2TG6QBYP2NR+EGNebEjZC4X7gTe6Jjgvcw7vAU1VAUHhsRwSbPuq19jHT
	p9ZvtBuTbZZWuDPPJJCxALqfM6d2re8ddu6JI1SnfvKMbdyVCwrqj9Jc5A2wq5je
	P4q6zDuzdWs/M5zqpQcTnTeAYjteVWuFVAOwNJw4DUULueTuvkIukCsgbOq2nbOg
	Xr3+QoLvOo93tTj71N6FVXfU9qMJl/E/eImUPYBR1J1Fa6MeEo+V76Zk1YFuAPER
	Gw1CZNes12jmlk/QGZfdqPKGCh4iKcQL+PzTx2XvVstc5Urc+ReOjOTEXhg2Ga61
	lfd3Pz1379j4ZlSRsnZew==
X-ME-Sender: <xms:kVBYZyOMsKHLrO4eM8ytP8WyRTqF69TEBjuHj2Bn6hFphFmowOvqNQ>
    <xme:kVBYZw85TUhTy_NmHEvbaasc8hHLYosI_fwzMbtZWTo0Bw0NKWjBhq3vFQ7srix6g
    lAxlmQgD8qCxghshRs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeekgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeek
    leffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhn
    uggsrdguvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhivggusehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtth
    hopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhr
    tghpthhtoheplhhinhhugidqshhtrghgihhngheslhhishhtshdrlhhinhhugidruggvvh
    dprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdho
    rhhgpdhrtghpthhtohepjhgrvhhivghrmhesrhgvughhrghtrdgtohhmpdhrtghpthhtoh
    epthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhf
    sgguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:kVBYZ5QdWb26pSQFIynJ9MlzQ2Hr6pjzycsJ_x4lIyFc4w37G8ke0Q>
    <xmx:kVBYZyv815BiybVtAiaeOX8SEqoiQ_ygIgQFDGtsTdf2ZRpbctTbTA>
    <xmx:kVBYZ6fEbLbulUngS4l6rc4a2hxpWEWk0yzEZ1vj11F8EMNeZvYzqQ>
    <xmx:kVBYZ21h2AGddGlVoTSZ9jDpGXAhvru1B9MVvPYJpSHww1eLvkHevQ>
    <xmx:klBYZxyTmuRosqcOEQ3MF6yeDKkvrO-qf-anF9AAmBacs9trbGdxOPUq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C01EC2220072; Tue, 10 Dec 2024 09:30:41 -0500 (EST)
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
Date: Tue, 10 Dec 2024 15:30:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Helge Deller" <deller@gmx.de>, "Simona Vetter" <simona@ffwll.ch>,
 "Dave Airlie" <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Message-Id: <ba44a87e-1587-42ee-9da4-ae96e4a26c1c@app.fastmail.com>
In-Reply-To: <20241210142329.660801-2-tzimmermann@suse.de>
References: <20241210142329.660801-1-tzimmermann@suse.de>
 <20241210142329.660801-2-tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 10, 2024, at 15:09, Thomas Zimmermann wrote:
> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
> only controls backlight support within fbdev core code and data
> structures.
>
> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
> select it explicitly. Fixes warnings about recursive dependencies,
> such as
>
> error: recursive dependency detected!
> 	symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
> 	symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
> 	symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
> 	symbol FB_DEVICE depends on FB_CORE
> 	symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
> 	symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
> 	symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE
>
> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
> it is the correct approach in any case. For most drivers, backlight
> support is also configurable separately.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for revisiting this!

My patch that failed to work correctly happened to work on my
randconfig tree because I still have an old variant of this
change, see

https://lore.kernel.org/linux-fbdev/20200417155553.675905-8-arnd@arndb.de/

This is almost the same as your version, except for the
optional fbdev Kconfig bits
PERS
> @@ -660,7 +661,6 @@ config FB_ATMEL
>  config FB_NVIDIA
>  	tristate "nVidia Framebuffer Support"
>  	depends on FB && PCI
> -	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
> @@ -700,6 +700,8 @@ config FB_NVIDIA_DEBUG
>  config FB_NVIDIA_BACKLIGHT
>  	bool "Support for backlight control"
>  	depends on FB_NVIDIA
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select FB_BACKLIGHT
>  	default y
>  	help
>  	  Say Y here if you want to control the backlight of your display.

For instance here I used

@@ -702,6 +703,7 @@ config FB_NVIDIA_DEBUG
 config FB_NVIDIA_BACKLIGHT
        bool "Support for backlight control"
        depends on FB_NVIDIA
+       depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_NVIDIA
        default y
        help
          Say Y here if you want to control the backlight of your display.

while your patch causes a link failure with

CONFIG_FB_NVIDIA=y
CONFIG_FB_NVIDIA_BACKLIGHT=y
CONFIG_BACKLIGHT_CLASS_DEVICE=m

       Arnd

