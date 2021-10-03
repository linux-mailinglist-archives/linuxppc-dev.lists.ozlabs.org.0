Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB47420213
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 16:38:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMmfw5zkMz305T
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 01:38:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=rlvzb2vC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=nkgefiqJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=rlvzb2vC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=nkgefiqJ; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMmfB28Ppz305d
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 01:37:38 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 369FF580ADF;
 Sun,  3 Oct 2021 10:37:36 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute1.internal (MEProxy); Sun, 03 Oct 2021 10:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm2; bh=5Oua/xYcZ8sUdKkZ+WL2Y13bonyO
 X558R4+E8eOjPK0=; b=rlvzb2vCrzSz6CHr3TI2OaG5/Z8mFul9dCvhpRkOg0fT
 QUoSLH6jjBzOO7fPBSlAD3cbQrOnYwDpSqL7ianjL87WJ07+gs9Qv458OpIEKXrF
 e39spiACDRsEvVS6qnYKOHxVHOcnZXkha1ry12C2xXGE4vJp5WNDplmzxkYbStGV
 zu8SZxD7NhhyJ8rtIXntB50MQvuqeS7Nl+D1BTpg9HMHCn7LeCwBKJY+sJYJn3Ka
 vuKYTRJfOtidGF+c1F8EgiceVz2pG6YsHYL+ABNavQhFWF7/Rk05r4tn92OiufXj
 djZv9cwCd1Lw/xKL9NrrjfB0+mhqI2rKPYc7CNpEjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5Oua/x
 YcZ8sUdKkZ+WL2Y13bonyOX558R4+E8eOjPK0=; b=nkgefiqJ5l2kC+bTcXTrJi
 l+xhq45qU0uVOALdU/XK9Dxn0r7rkx+xzr89VLHQjq8lGTDYhFrgqKxomrLKUfPS
 1vkk3JvxCbAlOz7a8/Yfg9aWxcWhShynBkXiIOowT0DeX90bqcIAGCR83JfMKrvv
 FEf7rybxB6L32eyR6nsj0K3Rhyn29KPcBYB6P5SKXbr81sKgQZV/bDUhbIHnb8AD
 mqg6BwrPIxc8xJAzeuxjw/giofT+g68fu9oUN0I0eOhmvtOZDt7U3YPphUGOD4fG
 cjXr2yvd03I1cF6KQnaMJBzwYnSIEMSNdEEZQAswZsz4ceEmBekMeLzzTEss2/4g
 ==
X-ME-Sender: <xms:MMBZYZRr_AzCfIj0Ps92D784AB3B0gNag8E5RNFhiKQvjAOHPHcYcw>
 <xme:MMBZYSzihhz9G1J6eUkFEQL0LlmNxrS0sgCQeQb0vqUkrMxTkh_f-55fzZTcNVxfQ
 U4SzuRP_oAgB_VdzSY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeltddgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
 nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
 htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
 feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:MMBZYe0skvR09teY6kd_z8tbmZ_sCqLG0mzC8gkgUkkd4oFqdPsSUA>
 <xmx:MMBZYRB7-asYWIzXyh3Czni4-O5z0-BC_M2_KOQzPHDVERC2r-9ouQ>
 <xmx:MMBZYSiKzewZZfx7YeDH9Mk3Y7xm0wJnoh3ZdC_0aXY7nDvI__LItA>
 <xmx:MMBZYTZt5ozJJDb30AzEiRAH-L4KaZqLoeGZm_E3I5Pa_T9kSOtYPQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 074A551C0060; Sun,  3 Oct 2021 10:37:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1322-g921842b88a-fm-20210929.001-g921842b8
Mime-Version: 1.0
Message-Id: <acbacba2-b239-4268-8acf-6596ab0dfded@www.fastmail.com>
In-Reply-To: <YVTNpt/vOeZI5P+L@kunai>
References: <20210926095847.38261-1-sven@svenpeter.dev>
 <20210926095847.38261-10-sven@svenpeter.dev> <YVTNpt/vOeZI5P+L@kunai>
Date: Sun, 03 Oct 2021 16:37:15 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Wolfram Sang" <wsa@kernel.org>
Subject: Re: [PATCH 09/10] i2c: pasemi: Add Apple platform driver
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
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-arm-kernel@lists.infradead.org,
 Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 29, 2021, at 22:33, Wolfram Sang wrote:
>>  drivers/i2c/busses/i2c-pasemi-apple.c | 122 ++++++++++++++++++++++++++
>
> Can't we name it 'i2c-pasemi-platform.c' instead? Makes more sense to me
> because the other instance is named -pci.

Sure, that's more consistent. I'll change the filename for v2.


Thanks,


Sven
