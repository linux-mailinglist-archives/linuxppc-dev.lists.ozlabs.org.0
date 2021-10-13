Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B37642B9E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 10:08:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTlXP67rGz301F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 19:08:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TZU2b0lO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=TZU2b0lO; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTlWl4hRcz2yPk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 19:07:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634112408;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
 Subject:Sender;
 bh=SIdqttAv8VY7+GPnyA9vyn4IVdFg1Dkp5cQAN7dWsbA=;
 b=TZU2b0lOnmLfKHi2inaQ528J4Rm8TEj1TfhwkuQBKmTf1uB7NhnT8yTKEsZA2ErZvB
 yPCprch6lE9F1gB27JLaStHAbV340zYe/MRN9wYqvCGgZw+W3qy2R6axfc51pp35dUh1
 WM5njfwXe8B8LKfgXSfWJHEPNAsFtJ4YCoz3+mqe3tdbqPJkcgQpu7urHH3kyjJtSuWL
 J2RjhXdaP9hCqx58oZOyvVERKr3AMANNAqmg0k0B9rJZC6Y45Ot7koo6oFgyrF3obhUk
 +WbO6sr7BoHUznPxjUYK1Nd7yQG554TzF0YWA4PIL9L0/igCESNAbZcZb08pPsx/Pcvy
 akFQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgFJ9KSk6V3+Pov4y9Nnu4lP5KR8g=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.34.1 AUTH)
 with ESMTPSA id z02498x9D86kgmG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 13 Oct 2021 10:06:46 +0200 (CEST)
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Wolfram Sang <wsa@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>, Mark Kettenis
 <mark.kettenis@xs4all.nl>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 "R.T.Dickinson" <rtd@a-eon.com>, Matthew Leaman <matthew@a-eon.biz>,
 Darren Stevens <darren@stevens-zone.net>
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <YWFqr4uQGlNgnT1z@ninjato> <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
Message-ID: <df424385-92af-3fad-f50b-c64897e991e8@xenosoft.de>
Date: Wed, 13 Oct 2021 10:06:45 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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

On 09 October 2021 at 03:57 pm, Christian Zigotzky wrote:
 > On 09 October 2021 at 12:10 pm, Wolfram Sang wrote:
 >>> I still don't have access to any old PASemi hardware but the 
changes from
 >>> v1 are pretty small and I expect them to still work. Would still be 
nice
 >>> if someone with access to such hardware could give this a quick test.
 >> Looks good to me. I will wait a few more days so that people can report
 >> their tests. But it will be in the next merge window.
 >>
 > Series v2:
 >
 > Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de> [1]
 >
 > - Christian
 >
 > [1] 
https://forum.hyperion-entertainment.com/viewtopic.php?p=54213#p54213

Series v2:

Tested-by: Damien Stewart (Hypex) [1]

- Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54217#p54217

