Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4742817A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Oct 2021 15:18:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HS2YR4n7Bz2yZv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 00:18:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=DhNcIVMI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RzM0HPVd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=DhNcIVMI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=RzM0HPVd; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HS2Xg5w9Qz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 00:17:39 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9AA465813DF;
 Sun, 10 Oct 2021 09:17:33 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute1.internal (MEProxy); Sun, 10 Oct 2021 09:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=PZzCauLMg+BrkHj2XOFWZVMQnGqma2A
 ScnwJBV9s9iw=; b=DhNcIVMIQtKhVLEHBMdEwWrO4/yG77/WbP9bdVOJ9z+Go+z
 zDbMiSh/Ju0mi1Hf1aRekwKad5MzSe6/Py58MHcJLb/yvS7lMecNVQ6Kp0WbwddK
 mpLHD4yoGw7jP33mq5FiekMIDA5ewuq+r0NxTXo5fdOOuUfeOiaX4+G+aBjgIIAc
 ZqgTrZwdd8+q1OggoBNKHj+CbCvXFIW4Yb9iqjaf61O1fGSmwvcyrIH9g5AqgG2d
 ibaQDwZnTH6q00PrpIasQ6wLrrC9IPVJuod8Pdp24Z//QYgXpY0tQSCFFIi6xstP
 0wykkcoit6h7VJG20oa5uaNgUjl7+vlbqP+UtWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PZzCau
 LMg+BrkHj2XOFWZVMQnGqma2AScnwJBV9s9iw=; b=RzM0HPVdCNHxIVk6uoKWMj
 NEcFX/28d2QVSY+N3nXylCE49oF2/eS03fy6Xx/+zLOsPRlra++XAVg2/AGe7kll
 kfmjl8qAB0/Eo+odjTfArJMD7+GxZyAbwaAi7ng/FTYuIhD9z9zYVrlg2LwIVVo0
 v+ZK4iSR2AvcO5TwlKbLRoP54ymm4i7Q7f+1q4hRkmH0xtAOqG+DkO5446KNHI+o
 sfosM8sI5LncZLXm9wIlfwRkA2M4sX+zruOrSU3uByYM0szOdqKKel4qRV78yqha
 KugGjBv4rYbidCr8E+bQbG7DILiVgY1wCfFum24dj6Duaauz5Ay/loJAW0mglisw
 ==
X-ME-Sender: <xms:6-diYcaY8IQGFzUCnIBpN8qBrg0dr7vPQxJUMh5EBeYGS5kGZ2y-Tg>
 <xme:6-diYXYMMZbtZFw364QR8ozyRJAKx2PdI6Yxx37PFNjFPAtce4M2_IDJwUmYPFDMt
 RmRzy0PAELxw-AwGEI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtgedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
 nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
 htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
 feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:6-diYW-qPMwEgRwAKNbuMc_OZumIUo9ck5tujTpacDsSp_-5E8x4Ug>
 <xmx:6-diYWq3KxyF9GdOZk0DRP57cprlnKjRKhAA8xj1wmehIsQ5MG5W1Q>
 <xmx:6-diYXoYYoP627gKSfndkdzNDH51CZUg7ev5-hBmGREPxDpbeuB3sA>
 <xmx:7ediYda2l88nnPG6TKaSSy02F32Jms1DUEUtQyxNmmDflm2q9C-Eeg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7C5092740061; Sun, 10 Oct 2021 09:17:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1331-g5ae342296a-fm-20211005.001-g5ae34229
Mime-Version: 1.0
Message-Id: <11d8f784-c90a-4e6c-9abd-564cb5241cb7@www.fastmail.com>
In-Reply-To: <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <YWFqr4uQGlNgnT1z@ninjato> <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
Date: Sun, 10 Oct 2021 15:17:11 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Christian Zigotzky" <chzigotzky@xenosoft.de>,
 "Wolfram Sang" <wsa@kernel.org>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
 "Paul Mackerras" <paulus@samba.org>, "Olof Johansson" <olof@lixom.net>,
 "Arnd Bergmann" <arnd@arndb.de>, "Hector Martin" <marcan@marcan.st>,
 "Mohamed Mediouni" <mohamed.mediouni@caramail.com>,
 "Stan Skowronek" <stan@corellium.com>,
 "Mark Kettenis" <mark.kettenis@xs4all.nl>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, "R.T.Dickinson" <rtd@a-eon.com>,
 "Matthew Leaman" <matthew@a-eon.biz>,
 "Darren Stevens" <darren@stevens-zone.net>
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 9, 2021, at 15:57, Christian Zigotzky wrote:
> On 09 October 2021 at 12:10 pm, Wolfram Sang wrote:
>>> I still don't have access to any old PASemi hardware but the changes from
>>> v1 are pretty small and I expect them to still work. Would still be nice
>>> if someone with access to such hardware could give this a quick test.
>> Looks good to me. I will wait a few more days so that people can report
>> their tests. But it will be in the next merge window.
>>
> Series v2:
>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de> [1]

thanks a lot, glad to hear everything works on P.A Semi CPUs as well!

And regarding that git am issue you wrote about: I think I based this series on
torvald's tree instead of 5.15-rc4 and there have been some changes to at least
MAINTAINERS. It'll probably apply cleanly to 5.15-rc5 but if that happens again
in the future you can try

  git am -3 mbox

instead. It'll try to do a three way merge if the patch doesn't apply cleanly.


Sven

