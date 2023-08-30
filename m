Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7414D78DEAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 21:52:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=DoI3vSr5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=L/Jph3j1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbZh820Pvz3c2Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 05:52:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=DoI3vSr5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=L/Jph3j1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbZg80hBKz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 05:51:31 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 473173200681;
	Wed, 30 Aug 2023 15:51:26 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 30 Aug 2023 15:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1693425085; x=1693511485; bh=EA
	AokXkBZ1oabmHLEd4xI3A+ZO14oLciXrp5+OaR49E=; b=DoI3vSr5VzKvXd7sPf
	vRiV8hH4rK6fXmpdJRGIVz1xGTgPKfqxxjxs24kmW6FihHX3N0yEKJ8qik6UEGYb
	95CHQ6ljd4jxgRKFewqaAnNDL0JPJm3B5SGXKL9Evt0PvSK8XunFWlPJ7q8dC1pX
	f+XJHFZYW51CKc9uWzF73aumHv/iTm1jzTDMeosWM5Q17KXBxjKMqIqnv1n+wSUH
	eyTyuY85ZMSBpy5vJvMmZECuzaz9Ma/NHSiqsHNdwnq0d1aZBNpnNOI9utHoOU9J
	gwqUgdnaYkRQK5DO47QZ7WJrVANHCPMtolWnf/7GcrtDYnTcSw9i+Q6PzcM7p+NS
	0Qlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1693425085; x=1693511485; bh=EAAokXkBZ1oab
	mHLEd4xI3A+ZO14oLciXrp5+OaR49E=; b=L/Jph3j1eWucO0jOVPQwlTO5pQs0i
	Oa6lNnCSl1I4DN3KB5hNWbqv8JQBp2j7r9d8DsVoc/W3GZj0ZvbfWcpXxFkOJT0/
	xrftvIs7dkBf5CCzG8MHY3sdizv0DjtM4PnyiPV/GX1JFSlltO6gZZ35IBDQAp+e
	g6tgTurFihzq0RQPk09i9wb7+nTsfRAslfqOG14Kj4TblbyOQ81FSpT0g/KDW7tJ
	Narg1/ORjjTOz/4gd+j1jRc6EtJ6Tv94/lXXzWqMz0ik2H8ND5yfHmEW8AgglMJ9
	/2sbZLr8idRZcbpl98+PxcUqsvtEh7084D3d1gVXzLD02/wRY1Eg8lLqg==
X-ME-Sender: <xms:vJ3vZMv0SI2oeOcUO_qrvCHdVfncwt-xTicrG-Hh0D-D8L8vWYXFPA>
    <xme:vJ3vZJe4GLF3uWbGnIuBaz6fW_SjcddvKynT3EAfcKAOQVIbpsyE8vKuXKuoVIqwR
    OvBpwAEHswci-5M468>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefkedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:vJ3vZHya8rFzM3ZWaUkc_0L78fMJGWsuFavX5429EJzhI_YZIzrgCA>
    <xmx:vJ3vZPOaSvJN-gwiqYhVSY4bWeTHvX9b7yuvVLoQPViDqBFSvqktDg>
    <xmx:vJ3vZM8PQv_XjkHXjy4_uFZIB8s_CT2nvs7nPBEhf097Lr6-wNjw_g>
    <xmx:vZ3vZNjSLyi2FUZobnkLrgMlbC0JTdK73QaaP7HMVy6rBf63jdmuEg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3B057B6008D; Wed, 30 Aug 2023 15:51:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-701-g9b2f44d3ee-fm-20230823.001-g9b2f44d3
Mime-Version: 1.0
Message-Id: <0036d0ee-4329-4fd8-9317-95818f576e98@app.fastmail.com>
In-Reply-To:  <e53f0f8da1607856028d941e7ac8646aa2abc555.1692288018.git.geert@linux-m68k.org>
References: <cover.1692288018.git.geert@linux-m68k.org>
 <e53f0f8da1607856028d941e7ac8646aa2abc555.1692288018.git.geert@linux-m68k.org>
Date: Wed, 30 Aug 2023 15:51:03 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "David S . Miller" <davem@davemloft.net>,
 "Sergey Shtylyov" <s.shtylyov@omp.ru>, "Damien Le Moal" <dlemoal@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>, "Jens Axboe" <axboe@kernel.dk>
Subject: Re: [PATCH 1/9] ARM: Remove <asm/ide.h>
Content-Type: text/plain
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 17, 2023, at 12:07, Geert Uytterhoeven wrote:
> As of commit b7fb14d3ac63117e ("ide: remove the legacy ide driver") in
> v5.14, there are no more generic users of <asm/ide.h>.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>
