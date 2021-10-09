Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4D427970
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 13:30:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRNCw1b8wz3c6B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 22:30:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=HWKeMA2z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=AtsLYlu3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=HWKeMA2z; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=AtsLYlu3; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRNCB4vwsz2yPj
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 22:30:14 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6FDF5580977;
 Sat,  9 Oct 2021 07:30:10 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute1.internal (MEProxy); Sat, 09 Oct 2021 07:30:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm2; bh=uTxGnyhkHJhSQNzCzJ23BnB9E0YY
 OsJqvk8zIcUsFNE=; b=HWKeMA2zk/SmswwAuUwtSfayXtT2QRaC6A/bksgBpP4R
 AQIDzJBMbI8H40kxQoH9FMxddeq5/aVWu6X16xkUYSuL75Ag2xiyo3XZCIL8HfCw
 KR6RfOmj+bDvSJTAsdQ9JitmydeTLAvEPgHmX2QeJDz3xEpgOTh0QgpDBKACzKj/
 Z7PxTL8UpTLz/ExT1IkSa3g68GxkjunLLNKK5W7iCRE4CRbaPJI21+Axpdq7KWcO
 4cvA43vN17PfqSYJS5XlKNSMqGooKCpuZw6ahTr1PmmHpdAcHs6Jh6fod6Efxnxl
 UBo7eJwEvuEuMWm/Qrjz+K9q/b4is/0HXH1eHHa3MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uTxGny
 hkHJhSQNzCzJ23BnB9E0YYOsJqvk8zIcUsFNE=; b=AtsLYlu3D5YC01UzMJvxjY
 X7/h7ztco+uS7Hi+74AFtUw309ecoVdJCplIaMCeJIR2FgW1RxBgSW+lcLUO0jUU
 X6Fvvxc5YBtvvL1720jwh13Nb5eNm+TXsbrBSiJq7WWJ3N67J9IqapGoMCDf5h7r
 FsH4RxQkILz5gsWd37LwO0CBOmxCvqJlp6QIq7f1Z4UUhdR0INVSBpE1Hzywir3T
 08RqhwgjkGbFOCOe/B/+Lxs4UNTmEKIp3eSGRa97Oddm9Cj1Noc0qdyt9RKKWLjp
 C2nxqNFtPrzpeTtMO8LW8rU/JbO3eDfU54Kct72WuxrE8zNQf8a6h824kcf/Z/lg
 ==
X-ME-Sender: <xms:QX1hYa7lqWLI1vXjwr6C3e9afYZY0cc3wLdMoG97PxqEbDD75_rv5Q>
 <xme:QX1hYT47D4-oQPjPpRaj09h-7lJYrhmkQO9dWxBpedMw8bBUmLzn7GmFqz1hkUSef
 tOJI5hySZsEPrdFJbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtvddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
 nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
 htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
 feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:QX1hYZdFPvGujphPZs4XiP3CvjfPRcpaIUCBlOFFEmhf1QJ5qe2BIg>
 <xmx:QX1hYXK3IAjGfM5iWV0OpMIUl6wrOtD--dv_2DALBvW6sWkCah3hAg>
 <xmx:QX1hYeJLGhCe6V-0kFUSxPAWblhISXHUGh82rDm2t9NHLXE41rwUwg>
 <xmx:Qn1hYZYEwfWBy6tacnWQ_8Z2EqoKxT3-97Eym_zIOwO1cY778nhwrg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 11C5A2740061; Sat,  9 Oct 2021 07:30:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1331-g5ae342296a-fm-20211005.001-g5ae34229
Mime-Version: 1.0
Message-Id: <7b8290ce-7ca0-4c91-a0a0-3421fc8b4983@www.fastmail.com>
In-Reply-To: <YWFqUuc7I5Dh8+w6@ninjato>
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <20211008163532.75569-11-sven@svenpeter.dev> <YWFqUuc7I5Dh8+w6@ninjato>
Date: Sat, 09 Oct 2021 13:29:48 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Wolfram Sang" <wsa@kernel.org>
Subject: Re: [PATCH v2 10/11] i2c: pasemi: Add Apple platform driver
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
 Christian Zigotzky <chzigotzky@xenosoft.de>, Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Sat, Oct 9, 2021, at 12:09, Wolfram Sang wrote:
>>  F:	arch/arm64/boot/dts/apple/
>> +F:	drivers/i2c/busses/i2c-pasemi-platform.c
>
> We have no dedicated maintainer for PASEMI. Are maybe you or your
> project interested in maintaining the pasemi-core, too? I guess not many
> patches will show up and they will likely be for M1 anyhow.
>
> If so, then no need to resend, I could add the extra line while
> applying.

Sure, feel free to add the core to the entry as well.


Best,

Sven
