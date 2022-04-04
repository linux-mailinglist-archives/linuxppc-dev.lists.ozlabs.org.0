Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C6C4F1308
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 12:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX6JB43mKz3bcR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 20:21:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=Kab/PA7k;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DC7CF18K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm2 header.b=Kab/PA7k; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=DC7CF18K; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX6HX18hmz2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 20:20:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F5125C00B2;
 Mon,  4 Apr 2022 06:11:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 04 Apr 2022 06:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=wRznwEHucFDONc
 /kDuqRJqbkzM/SZZFsgTO46A84rJE=; b=Kab/PA7kxI+rTjY3MYdaO+4OSx5y8X
 9F2S7HwTr3V1s2KvZvy7EfSjMMSplOu4wI5Uh2n+yccgthWs2hixkmHN4co6FsGi
 eAn3PANOEgd7Ga7NJZhmAyeSrNdrs+4g6AmZ8AcczLh6POFeOro4KrY8H0DZa0YB
 xoGSbffwQB/tAywROLOt8B427LJI4WdXcXhXZBJFtcXZxmWcms+oiZVUwhkBWBmI
 yenXM3/dfa/b5aGwvqr3DwjpOV3ipH3JbbyR8UN03ZA+F8UiOB6IFdxvgzdJsDTw
 1bqXPqh83iMogLdJGDV8Eh85KhrIvfzQqvQDyDJVaADm21YX/ZecQEcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=wRznwEHucFDONc/kDuqRJqbkzM/SZZFsgTO46A84r
 JE=; b=DC7CF18KCo/OEmZJHmvHANxsW803LOORD1WXy/2UA53hVsaY5E0JInKXN
 pXhnabZJqJU/xAuA9KnU9C1oG/FPKtXMiTlSw4BAkHFFCIn2U3OHRPOAIArim9b+
 +DiwqiqVQUHoqektoK962Jffgew1dsKHxD3dz3tEmBd0rVNQ/32mZduzxukh8fZV
 g/vLdz3L01sHnReypSWS0JzbLmM4U7d4K4ho6injf3ZfculzZ26xDgvuc0xlf13q
 s6pLP8xUOrnr8kBWqJBrbutNXNXXYfpqI8TVwnBbNxfjHWxhImY180YMb/kzyDJW
 RRY7LkLLiHlRuwM0FT1wrwQ/5L+GA==
X-ME-Sender: <xms:YsRKYvAvH4ay_1lIhJc8yiPs7pwXOqtsMJrgcqM_TqsJ5j210oGyIw>
 <xme:YsRKYlglj7l0utHbEhDXIEJ2lruS2DOfcljdq0tOJ-UkepLvbE9ZLMXCf5gzS8C3X
 TG3aDfH8d3G_pJcUA>
X-ME-Received: <xmr:YsRKYqlOAFLVg7uipCRGwM5O2g3ynFBY3MlGgT_lSypyDeTB5pqRKINaKjVFjANfuaZkHr59CSTkyNOmhUljWtEiZYUjP2LGn3PqEo1SvP7_pJqSr7aA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejvddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfedtmdenucfjughrpefkuffhvfgjfhgtffggfgfgsehtkeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeffveffueevleeivedvveeugeehueeh
 hefgtefhvefhudeitdduieffveejudevvdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:YsRKYhzAfIdxgnCtZFudhtfJKf5OoZXzHVTBIuutS-5gTOxkFfMEcg>
 <xmx:YsRKYkS4ymLlCH2ClwJWiZ2McKNnM1h8mZFNLjmXAiU_ju-cAf2qAQ>
 <xmx:YsRKYkYpdIliGVAYmLthEihPDwSsh8xt9tDLzlgA6NJVASYuxmK_Cg>
 <xmx:Y8RKYvcJMz9MiFWBM0RzVhhiaTZBwrE_9r3AvHXrthn7yLcPs1cjfQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 06:11:45 -0400 (EDT)
Message-ID: <0c9c0f9e2030abfe60f24a7050437f7bd1c76e19.camel@russell.cc>
Subject: Re: [PATCH] powerpc/powernv: Get more flushing requirements from
 device-tree
From: Russell Currey <ruscur@russell.cc>
To: Murilo Opsfelder =?ISO-8859-1?Q?Ara=FAjo?= <mopsfelder@gmail.com>, 
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <bbbd59a9-c93a-0bb4-6131-1b769f257094@gmail.com>
References: <20220322074734.107721-1-ruscur@russell.cc>
 <bbbd59a9-c93a-0bb4-6131-1b769f257094@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2022 20:11:40 +1000
MIME-Version: 1.0
User-Agent: Evolution 3.42.4 
Content-Transfer-Encoding: 8bit
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
Cc: joel@jms.id.au, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-03-23 at 16:26 -0300, Murilo Opsfelder Araújo wrote:
> Hi, Russell.
> 
> I think this patch could have been split in half with their
> corresponding Fixes: tag.
> 
> This may sound nitpicking but doing this would certainly help distros
> doing their backports.

Hi Murilo,

I didn't use the Fixes: tag originally since as far as I'm aware this
issue doesn't impact any systems "out in the wild" - so I didn't think
there would be interest in any backports.  I should have split and
tagged the commits anyway though, in case others wanted to make that
decision.

Will resend.


