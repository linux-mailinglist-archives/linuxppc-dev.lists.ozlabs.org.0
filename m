Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB85420211
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 16:37:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMmfB09rMz305W
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 01:37:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=MTdHaifq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dVMGtFFM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=MTdHaifq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dVMGtFFM; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMmdN2727z2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 01:36:55 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1F836580ADF;
 Sun,  3 Oct 2021 10:36:51 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute1.internal (MEProxy); Sun, 03 Oct 2021 10:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm2; bh=eJp/L4J4kGWt8gl3xOU1z9Ma3M3k
 D9N4KMdCSrftlnc=; b=MTdHaifqNQT/oVcoX7O+4n2Q40y5SZo6zuSXckebMpt1
 Yfi/bf2s0NWktuvFTY9S1e95hTNbO4C5dJNS6ZPNN8p4j0deM4Cyl80mDNebpvPI
 APsDp7teKO2rjwK9850it9o/2Ab7fLopYFueIWP4ZHFfDo6+G1bdgN7k6C38kke/
 H/zSn1XG/OBIWYEePKgRIdnMNPhgA+1hZKfV3RaRbpb33ddQU4ZJc0rwzT/6YR/U
 HVNBJSAQUAAM2Jr+Ztn61CaHm1oxWVyn5nlN4sEzh3CmOY8uLMt8Y6+5UC4c8VMi
 aUB4cOwkvQhYMPsN8YB+5v10C44jeYqV1YAa8Bvnmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eJp/L4
 J4kGWt8gl3xOU1z9Ma3M3kD9N4KMdCSrftlnc=; b=dVMGtFFMA2Q6y2ckd+hiH7
 OofqPxpIRtWTeM2bzzh9N1N8/f2vBqyG0ERUFU9HGDJ0QfQmxELbBMFjkxzUKi8n
 w2USydW5vxZF6Siu+qIngSD8Kr4RZbpSlJp4P0J/zGrWGjc3M7i+80660F5R0O24
 F81gNVnfVgzSFuacqvuD9YcHolDsKKEdjf9EKEB1A527EmHD6aY6cmw6MND+6MY7
 3lhYL/3QNlKDKoQriygMUqpSm+vLKYMpdMRmnmM1scwhKo6iKphhGeqGE3l9sKuM
 rm16ae/OsAlPf5HdXO3nXON2TlqNK/htxrkZTmy1gekn7/TqA5AQ4vRI8DRSzQ2w
 ==
X-ME-Sender: <xms:_79ZYbqqY3PiRWyNh0t6rW-Xw2XucFcjvj9uYRq2z7e3MvGl3f--hg>
 <xme:_79ZYVrpQKQR1tlGww1AaTq3RCGGK6-TMD7hOzqdSdQlIWhcCsgDYVSY2zzJSfe2a
 m8TL37EOHthuH60klw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeltddgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
 nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
 htthgvrhhnpeevvdegveduvdevvdfgleefgeeivdegheeiuedtleevvdeiveevleejfeev
 tdelheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdgu
 vghv
X-ME-Proxy: <xmx:_79ZYYOPomOSeABHyzMBhZMjgodNb-hB2F13D_jg1zFb53HLmjoD0g>
 <xmx:_79ZYe44zqT5pwYcU3HJnH6YASUjokk5OXVkFhP_C-R4zAmktSIw8g>
 <xmx:_79ZYa7Vn46vwdrO7FcCaT95QgGFfOvf2pB_SRWzPnLU0caq7mMQow>
 <xmx:A8BZYWq3WfPRuszFh3wnhrookCYqYx1nf4VygGGOXFrBy_OORow7tw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A68D951C0060; Sun,  3 Oct 2021 10:36:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1322-g921842b88a-fm-20210929.001-g921842b8
Mime-Version: 1.0
Message-Id: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
In-Reply-To: <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
 <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
Date: Sun, 03 Oct 2021 16:36:26 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Christian Zigotzky" <chzigotzky@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, Arnd Bergmann <arnd@arndb.de>,
 Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Olof Johansson <olof@lixom.net>, mohamed.mediouni@caramail.com,
 Matthew Leaman <matthew@a-eon.biz>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,


On Fri, Oct 1, 2021, at 06:47, Christian Zigotzky wrote:
> On 27 September 2021 at 07:39 am, Sven Peter wrote:
>  > Hi Christian,
>  >
>  > Thanks already for volunteering to test this!
>  >
> Hello Sven,
>
> Damian (Hypex) has successfully tested the RC3 of kernel 5.15 with your 
> modified i2c driver on his Nemo board yesterday. [1]

Thanks a lot, that's great to hear!
If he wants to I can credit him with a Tested-by tag in the commit message,
see e.g. https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes.


Best,


Sven
