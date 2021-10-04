Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FE1420A05
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 13:23:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNJHc3YGyz2yV6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 22:23:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=FVMajL3l;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=k2cptf8T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=FVMajL3l; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=k2cptf8T; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNJGr4pJvz2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 22:22:43 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 26DFD580865;
 Mon,  4 Oct 2021 07:22:40 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute1.internal (MEProxy); Mon, 04 Oct 2021 07:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=k4eiDbO0S0GhIIy1Ulz4BubSgS8pg11
 RI+l3/cVsvRw=; b=FVMajL3lBrk3yevNtB/+RlBjXU38ww0iW9Aut7eCmNXwzk/
 3CCMgVJkarHg9wrCUY9FNeAQhA2Gr4yEiGk5aV9aQp2bZ6iUOPKmcinG8i48xwxx
 a0+WpS7yLnZQSS5Qu7hxXQ5QSXe7ts4lKpeCVaLDD5Vj0VAtH/qlaX4eTGRNTeI1
 gpOPKw6LOO9YOb4Y3kttlqmBf7WpggzozTFl6DGkHwDwXx9/pDPfRmnslJPd/zhH
 doBnV+b6G6rXyxLlRIphsqG6bl4KsXKObtv+qLcojY8NH57QJvmlVUV9E0UJ3RL5
 ZE6pate8E4spyEfqfY2aknqaCRmWbUSzH3vkeMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=k4eiDb
 O0S0GhIIy1Ulz4BubSgS8pg11RI+l3/cVsvRw=; b=k2cptf8TqB4+1ARafPyM/x
 AobSopKb+S3F2nYZ3rA2Vj1HiLSnQ82uU+Ilcnl3s4+l6KipS3raruEKTTcX3+IX
 si4phykkN40eZe8zM5inMzJkz7Xi1bv40z13Oe0fCHawoIQNs3nzm9jcgmypGJWr
 SHT+/CKJzsv1bGyFBZ69aoNpX31PL+pvvXcUgGX27eQB47nzJnRghhUU8L/RBScx
 z2Td0KAIPo0h+0j2jXnouRXRYw9MHL2U2MNmUAtcABTxolR95H3qPK0EHrgcSA+r
 mGPYNgjqMhsg5YFFEwkXLdRBu6r89jYQvr/jqaOlBQso6XhfvVIBv4a3R7G3LEIA
 ==
X-ME-Sender: <xms:_uNaYeeIloEZiV5tPLSJcj-1PrtmfPA6geWWDB531Z0sfw4_cZTj1Q>
 <xme:_uNaYYPwATvFmpOj4JtGacmNJj5A4J-4TIW-FxHPIeoQGakvIfz5Bo9_1qFGmyY8Y
 JDUe-DoP8ucGBh91Dk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
 nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
 htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
 feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:_uNaYfhxDSjkyTqgJBKRZDmhso2zVEqE0GneAQfVlieAnXlZy2kxmg>
 <xmx:_uNaYb_CoYdj4ozDQa58TAmJDFwZTT3-gRkzsIFPhQN2PUHpJHTgZQ>
 <xmx:_uNaYatJL3tEG5Y8EaYI-xCZU5YTUJaHd0L6yXbuopD87WR1hJHupQ>
 <xmx:AORaYSSTr6C6ox_bOktGQhj7oubkMBu4s087EhGDZGGlSvsom_g94Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 84C0C2740061; Mon,  4 Oct 2021 07:22:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1322-g921842b88a-fm-20210929.001-g921842b8
Mime-Version: 1.0
Message-Id: <afd4c1a8-4230-4757-a373-027812ec0ca6@www.fastmail.com>
In-Reply-To: <CAK8P3a2760x4OYbNBuFCv32Tgt7K3MdJna4qXvPchdKhV8-8vQ@mail.gmail.com>
References: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
 <1B71F6A3-6467-46EF-858F-82E93D54365D@xenosoft.de> <YVrPf4yVFm184LEG@shikoro>
 <CAK8P3a2760x4OYbNBuFCv32Tgt7K3MdJna4qXvPchdKhV8-8vQ@mail.gmail.com>
Date: Mon, 04 Oct 2021 13:22:18 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Arnd Bergmann" <arnd@arndb.de>, "Wolfram Sang" <wsa@kernel.org>,
 "Christian Zigotzky" <chzigotzky@xenosoft.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
 "Paul Mackerras" <paulus@samba.org>, "Olof Johansson" <olof@lixom.net>,
 "Hector Martin" <marcan@marcan.st>,
 "Mohamed Mediouni" <mohamed.mediouni@caramail.com>,
 "Stan Skowronek" <stan@corellium.com>,
 "Mark Kettenis" <mark.kettenis@xs4all.nl>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Linux I2C" <linux-i2c@vger.kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "Darren Stevens" <darren@stevens-zone.net>,
 "Matthew Leaman" <matthew@a-eon.biz>, "R.T.Dickinson" <rtd@a-eon.com>
Subject: Re: Add Apple M1 support to PASemi i2c driver
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



On Mon, Oct 4, 2021, at 13:20, Arnd Bergmann wrote:
> On Mon, Oct 4, 2021 at 11:55 AM Wolfram Sang <wsa@kernel.org> wrote:
>>
>>
>> > i2c-8 i2c             PA Semi SMBus adapter at 0x(____ptrval____)     I2C adapter
>> > i2c-9 i2c             PA Semi SMBus adapter at 0x(____ptrval____)     I2C adapter
>> > i2c-10        i2c             PA Semi SMBus adapter at 0x(____ptrval____)     I2C adapter
>>
>> As Sven correctly switched from %lx to %p, this is intended behaviour.
>> Run 'i2cdetect' as root to see the values again.
>
> I think the address could just get removed here, as this is clearly not helpful.
> port number, which is somewhat useful for identifying the device, now
> it's either the pointless string, or the virtual address that the
> device is mapped
> to, which is not helpful either and potentially leaks information about kernel
> internal structures.

Yeah, now that I'm looking at it again it doesn't make much sense to
include it there. Maybe just dev_name(smbus->dev) instead of the address?


Sven
