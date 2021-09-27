Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C384196AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 16:48:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJ59K1SFfz2yfm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 00:48:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lo2YMw8a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=lo2YMw8a; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJ58Z3DNmz2xfD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 00:47:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632754010;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=G44RgpYWm1lf5aJbtqvM3dEwZV68hpUjNCbqcFai2VI=;
 b=lo2YMw8aaukGvNonTLkxYqC8YyZ9zP/V7FOgY7vzij69NlHvMd1lma39cgaAftn45E
 vpQAI2pt26HCzo9wF+VIvqsq+G+RoaE7QGmWmIpVoStaNyQO0A7L6eUAvvw0M4Umhkki
 jbFqvb+y0Wa872yzsWHFeWaUzbjnQGaeEuwtMyaI7fWXowDHXlnrU64OZ5ldXHsxvFMd
 buaVRTRjVM6Vn15/UVky/jNELgDyswPJ15Ba4ed0ALb8xBevCwlSr0i9R5V3lGXOrQGr
 PL/0OV+sY3JS4oPzVJwSy4spBAMURkePSy8IDPG8IY2yq0/wqkAjgpPh7Lw8WGzP+BCu
 0SgQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0mZXC9uZstB89hq66pCQ/IzAuyWHINmLRkeRKr"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b172:60ba:4101:c483:8872:ffac]
 by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id I00cdex8REklONq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 27 Sep 2021 16:46:47 +0200 (CEST)
Subject: Re: Add Apple M1 support to PASemi i2c driver
To: Michael Ellerman <mpe@ellerman.id.au>, Wolfram Sang <wsa@kernel.org>,
 Sven Peter <sven@svenpeter.dev>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
 <YVFtrpxfUbzv4XxT@shikoro> <87mtnylaam.fsf@mpe.ellerman.id.au>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <75053ff2-7adc-178c-81cd-e80a2732c5fc@xenosoft.de>
Date: Mon, 27 Sep 2021 16:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87mtnylaam.fsf@mpe.ellerman.id.au>
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

On 27 September 2021 at 09:58 am, Michael Ellerman wrote:
> Wolfram Sang <wsa@kernel.org> writes:
>>> Sure, will do that later as well!
>> But please do it privately. For upstreaming, the patch series you sent
>> is way better than a single patch.
> Christian, the whole series is downloadable as a single mbox here:
>
> https://patchwork.ozlabs.org/series/264134/mbox/
>
> Save that to a file and apply with `git am`.
>
> eg:
>
>   $ wget -O mbox https://patchwork.ozlabs.org/series/264134/mbox/
>   $ git am mbox
>
> It applies cleanly on v5.15-rc3.
>
> cheers
I was able to patch it with the instructions above. Thanks! I will 
compile and test the RC3 as soon as possible.

-- Christian
