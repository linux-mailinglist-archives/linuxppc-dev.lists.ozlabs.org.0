Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF477FE5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 21:13:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=oTPX8wzx;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=tIM48M6K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRZRk5q3qz3cQ4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 05:13:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=oTPX8wzx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=tIM48M6K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.26; helo=wnew1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRZQk6yqyz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 05:13:02 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id DA0272B000A7;
	Thu, 17 Aug 2023 15:12:55 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 17 Aug 2023 15:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692299575; x=1692306775; bh=8N
	3fcRqMeYpQORi75idt9jBtxUIXfyeGBjXy4rU5wEI=; b=oTPX8wzxeeUGvdQBkH
	TOWq0EE9ZJQ/gbiTTA07cTQ5aW+H+/LR2GfQY0Zzvd2yvQc5mGDA/WGoeHBUdAYB
	aNLex+ylJmJ0k6AAPXTcpFKxJEqBZPlCrAJ1ZfbchQROZwyRcbhPAmiURBIGFsUg
	g/0wh5mSx7sOO82zVnbhAmr/a7QIjLYJdOW6WFLMjXQ394wBSnTMkbpgg/K9l9I+
	MLaLtO+DqfafeDx71PWBMiIAgpXhtZd0d+K/14h7Sb8h6ZrafjexxOGoZyyStxoq
	Aip0sN31pr5IoOrVDknP8jo8iQDyZ+TtJx0sAzB1qy4QZ2z/vKqSv+FWzEhuL+Gj
	KT/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692299575; x=1692306775; bh=8N3fcRqMeYpQO
	Ri75idt9jBtxUIXfyeGBjXy4rU5wEI=; b=tIM48M6KwL+tfQhbTRSjUjcNo/QmK
	hE6PFnORPOFkxVv7SbWUkErsmQdG3iQGx264JOJCnyeJfBJtYf2oiVm+nn76sjE4
	d3GJwAXieL+aqdrxNfTAGFp3nENheSThWscv3633rgs5KLRbl3H/DfuPD67vPfcx
	NTch6b9VIZg92ywHlpCKq+NmII7vbSdnpJJi4NXgj5zxHu/xZ6A+HXlaF61jk6dc
	kr+zOu+c8mnjmC/kQGdFM1ToCeuEB1R2NOXVVRib9vFxyunIKDxr5z50kGXy8r3G
	YYS0KEH1RjCh81pK7GstlpzP/VBI/RQER2yl6JIsk4cLrckgo7l+W5y9Q==
X-ME-Sender: <xms:NXHeZFc8-Ax3IMEGl3SAyI7MyHUFDUd9ixXFRgLimap5hS35HQBHBQ>
    <xme:NXHeZDP3EearUjW2fmHb67P7QVxyMfjUo7U0DavzJ0ufcFpq-Icq-JT2OypqJmNcr
    7BkbeJp_BehuRUVJwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:NXHeZOhqIi7cDYyjgiTPFGy-_XqUoD5g9LFygaxN20Pbo3kKWyLfZA>
    <xmx:NXHeZO9gd5Oc3tX5P2R47ZPFshKL_cdiXIDUQju4g83DOvRhceXOGg>
    <xmx:NXHeZBvEguU7eNsbYe7VH-0iJMmFZJC-arBOGQhz4vgCXSKEqQ7q4w>
    <xmx:N3HeZFQz3sdsz0yQF_5zqYLvqsK3SpOKDPNn7797K3_g0Wyk8TdlA_VpqoQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 63B99B60089; Thu, 17 Aug 2023 15:12:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <5242d72c-78ce-42e2-bc7e-8c0195aaf769@app.fastmail.com>
In-Reply-To:  <54ed1ce4b29346803bd732aac560a74896d1ecfe.1692288018.git.geert@linux-m68k.org>
References: <cover.1692288018.git.geert@linux-m68k.org>
 <54ed1ce4b29346803bd732aac560a74896d1ecfe.1692288018.git.geert@linux-m68k.org>
Date: Thu, 17 Aug 2023 21:12:31 +0200
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
Subject: Re: [PATCH 5/9] asm-generic: Remove ide_iops.h
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

On Thu, Aug 17, 2023, at 18:07, Geert Uytterhoeven wrote:
> The last user of ide_iops.h was removed in commit b7fb14d3ac63117e
> ("ide: remove the legacy ide driver") in v5.14.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  include/asm-generic/ide_iops.h | 39 ----------------------------------
>  1 file changed, 39 deletions(-)

Acked-by: Arnd Bergmann <arnd@arndb.de>
