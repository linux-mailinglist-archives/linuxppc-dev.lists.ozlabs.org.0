Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C422441E74B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 07:51:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLK3Z5N14z3c4x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 15:51:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=XEGt7h4c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=XEGt7h4c; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLK2r0H49z2ymr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 15:50:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633067380;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=7SIB8AxntpY6yMesWH3shU0yamjQqWeCLJGlZjY1NmE=;
 b=XEGt7h4cNzN2fm27xuyGt4gS4I6q7Hjqz9/vur4cubJv+ApEyTckNOixtm95THzkTW
 hJ0SazTCWeFQXoWUwKmA+zrKwynbDPPucvWpFj0ABWcstACO/o92UzN0dnH3OoHC11Ay
 o0PG/LTi8vtv0VoNTi7j/O5OcFzBtUMTQbnA0h4SH1j0D9zyAHTsKRP+E3jKpRiU+/rA
 rtrUJ6jGyJ7N7oqGr/+nENRzn0W+3AoH1ZjdzRwn0CPdKbi5K4/j3zsPgIXcGw3YdNQe
 +rVWX4cgkho+1VoT0MfVY56NtHqv7ZzplfPUklBvgaFChIsBmgsWEw/BDzX84rKJ18pb
 941g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0mYXDB7v3tOCDfwiDBygV+JEgJrW3AbrzS96w7"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b176:dac1:b99c:1716:ba2a:6835]
 by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id I00cdex915nbbkg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 1 Oct 2021 07:49:37 +0200 (CEST)
Subject: Re: Add Apple M1 support to PASemi i2c driver
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Sven Peter <sven@svenpeter.dev>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
 <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
Message-ID: <ef6970e8-9a85-4b31-0697-91346bbf58b0@xenosoft.de>
Date: Fri, 1 Oct 2021 07:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Typo: Damian

Correct: Damien

On 01 October 2021 at 06:47 am, Christian Zigotzky wrote:
> On 27 September 2021 at 07:39 am, Sven Peter wrote:
> > Hi Christian,
> >
> > Thanks already for volunteering to test this!
> >
> Hello Sven,
>
> Damian (Hypex) has successfully tested the RC3 of kernel 5.15 with 
> your modified i2c driver on his Nemo board yesterday. [1]
>
> @Darren
> Could you also please check Sven's i2c modifications? He has also 
> modified your source code a little bit. [2]
>
> @Olof
> Are these i2c modifications OK? Do these work on your P.A. Semi board?
>
> Thanks,
> Christian
>
> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54098#p54098
> [2] 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2017-January/153195.html
> [3] Further information about the Nemo board: 
> https://en.wikipedia.org/wiki/AmigaOne_X1000
> [4] Kernel patches for the Nemo board: 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2018-January/167288.html

