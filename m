Return-Path: <linuxppc-dev+bounces-3220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 376D89C8D66
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:56:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq3BD61Lmz3020;
	Fri, 15 Nov 2024 01:56:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731596164;
	cv=none; b=C77U0ExYLg4kWo2ptL2HAXfzzEBA3fGH+W3DUclAeI9HBfMiXhAH6yMNkXvY15xgJ5Tu+QarQ0Hn9t3JBkgLB58lrq6SzNjrLRTpWKlSaHHlQhx30Bd/jswWZxt32VpoFlAEpi8+c+JrFrk/OWg1r74JR45b3VmCAbTzJN1xolqExHXA7kLhZ26gFro/K7eK96GWcH1CQ+CUMPm5yNf4A9dGCFu0cgKFir/8Hie75H8FOsz0tbbVd5vGkLmkCzt9N47SLzqoqBBLujerxCVs2sBRu5bXMVNV/uUfM9kPVCNzfhQJQ1ZnbXXtMDKUcO+FA03ho3sJGmDOYEhoqIQ4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731596164; c=relaxed/relaxed;
	bh=LO+dEuBMcGGWi/NcKB15GLyTAiVbiyQlFbT0CMd3c8I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bGFrhGzwlzW50vjdb+9hLf8O67RhBP4LgHksvhZeAQpdxpjHDJmjGLQHIGHAsbN6JikRXQiZWqsweIWpEpE1jKbXP9wqL+B9xaMBi9KKSaL2LO429FQZ22Ty0u+/Fa4QuV2PHvKISmBiU73GRrj8gWFO49wAr7OfTqCpkZnNtKJf92o+uQX+6iKT9abY6TywE7J/ptGQG91XE3f170kGYGh50YVDnvWvOWxXjLgsi9SspwPSHd/LFVf8LsQjWefiMBBbQoxCbj6N0SdrqNFJqF18TQxMnDtktGVG5DvVfYQepKKFBZo0MwG0q8q6bJV0WzJaNe2L3SmivSOGgXGALQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=PQXQiu3g; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N1RSy0E7; dkim-atps=neutral; spf=pass (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=PQXQiu3g;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N1RSy0E7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq3BC33Nyz2yyR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:56:02 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DCEEC1140175;
	Thu, 14 Nov 2024 09:55:59 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 14 Nov 2024 09:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731596159;
	 x=1731682559; bh=LO+dEuBMcGGWi/NcKB15GLyTAiVbiyQlFbT0CMd3c8I=; b=
	PQXQiu3gQXuOTEfAcb0khgBfDDp290Po9XZ7S4536bxiU9W5UZi5PhYM+CHrviJp
	oiuWojN4Ik6VAE6/5GRmBSrJhC/JRFCv2NM/nZBjaySowF9fhnWcSzdFeZNclvrc
	xXvUIm63Zeryu1Cdgqi1TNa0601Vwd7w3o+DTXOdvl/y1MruWN5QkZji0P3IVO7l
	NvdYTFHQCsziUxrnE2ImfjeBCNQMZ3KAwbET567hLwhwHSibGk3/yA+zR9L5xoRI
	KpRziBR605SDzWx25Vshg0/ghJrmz6jgX0KaMaeTIDnq07iINma17RUmdR6OiT3J
	D0uNtHB1DLKfcIZErVlr7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731596159; x=
	1731682559; bh=LO+dEuBMcGGWi/NcKB15GLyTAiVbiyQlFbT0CMd3c8I=; b=N
	1RSy0E70eupxsUEh5AZkeVZnUf94jyKe9HqWAzi99t4aPlM/idVMLr45e7f38pnc
	rKUUyYJyxe4MIUGVDOnX5xLnOgHB4boklSNSRccMrtzBqTpaH/s7AuZq0nmn2AeH
	h22OsZET+fpVeXZvOFkAhlR8i4esBjS6fYGPyCF/TpaquiuPbCbg4qsgXqALTwWf
	ieT4OTOEpBywJthxm+nAsLuzmQu3DJS7EnBZmBCtzLZSE3Ezntpw7CyjHArI0ckn
	BHG0WRXd6mfjcfqjMWUYi5Ga2ETPNxLjLd+dUwQ7u1XiV0IAMw2l3iPhnxqWNgVR
	I6Y0PQv1dK6gJs0a4oDiQ==
X-ME-Sender: <xms:fw82Z-T-L5CbHwYciJkdtJgB61cAjfoWA4dTvVRWohbCwz36iTNEww>
    <xme:fw82Zzx7ln2Xdb4ITTTkJVv-zVI15rl7kFsmPV83SIBc5YuJLspTr6RWL3QB2cS9J
    x-oaDASnnkAh8nFIEc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddvgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurd
    gruhdprhgtphhtthhopehgvghofhhfsehinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    oheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtph
    htthhopehjkhesohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:fw82Z724ekZiOinagGYezie-83_g99xYY_4JM4ua765-xzTHVR0qpw>
    <xmx:fw82Z6DiWb1TGJvb9nbAZfmF-nbqz5ywnVS-mSOhWUTVhkYVFiF9Zw>
    <xmx:fw82Z3gCpUj2KXft-24ve5I6qnC_-pngjavWNh3h0SJEGR8IgP6nTQ>
    <xmx:fw82Z2p5AAbNW0AwIJPTJult45IQfPYyw1Vw4b9AzbxJqFEGMfNFMw>
    <xmx:fw82Z9bR7dJEyScPZb4B3QIwmrZb9_oToLfEmWv-JG9AF9rC-wr_30Pd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 827F62220071; Thu, 14 Nov 2024 09:55:59 -0500 (EST)
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
Date: Thu, 14 Nov 2024 15:55:39 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, "Jeremy Kerr" <jk@ozlabs.org>,
 "Geoff Levand" <geoff@infradead.org>, Netdev <netdev@vger.kernel.org>
Message-Id: <b7a930c8-52da-45bd-a085-7b886e2b2dcc@app.fastmail.com>
In-Reply-To: <20241114125111.599093-17-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
 <20241114125111.599093-17-mpe@ellerman.id.au>
Subject: Re: [RFC PATCH 17/20] net: spider_net: Remove powerpc Cell driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14, 2024, at 13:51, Michael Ellerman wrote:
> This driver can no longer be built since support for IBM Cell Blades was
> removed, in particular PPC_IBM_CELL_BLADE.
>
> Remove the driver and the documentation.
> Remove the MAINTAINERS entry, and add Ishizaki and Geoff to CREDITS.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

(cc netdev)

This means we can also move drivers/net/sungem_phy.c back
into drivers/net/ethernet/sun/ since it is no longer shared
infrastructure.

This was an early bit of MII/PHY library code that along the
same lines as what turned into drivers/net/phy/, but remains
incompatible with it. Moving it into the sungem driver keeps
it out of view of other drivers.

      Arnd

