Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AFC420263
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 17:46:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMpB22Vxcz305H
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 02:46:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jHCVuR3x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=jHCVuR3x; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMp9H6xgwz2xXC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 02:46:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633275917;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=n2U0PeCsRntS+jp/SpPVszJZtYbXqemerUZ0qpTMk3Y=;
 b=jHCVuR3xGifKlofLLmuBTrzVjBk/X/XTWXVFrjZJBVrGpJDUzUodQFRCUY63HjTqOm
 MCDgwgKMqJsUmlw/ZBESOwt54n9riq0Kp/02jNPE/l50GRe3TxIh4FJ5ThroT0e+JkGS
 QZZnKrVyQX6Ns1gWtfwmfnK0bAgJxk3FQb5PZ+vTF5b+cTu3Clo2K/D2fWLCyGp6Ij08
 +B089K9+ZpQz6FUtqhpaz+h5yJRFdeDXN217EbLZbQ98c3zJI5ycsvLrUCIL9cZ4u767
 cSweAdnV2Loq9VtqUlwxf7kn/GWKi7LPdoGUHAwWgPi7lgMHOfTOfbAyid2dSgP2zSKL
 UdDg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0mZXDvscF/B540qv0BQZVZQLfrrxE4ejuGDN89"
X-RZG-CLASS-ID: mo00
Received: from cc-build-machine.a-eon.tld
 by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id I00cdex93FjDhap
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 3 Oct 2021 17:45:13 +0200 (CEST)
Subject: Re: Add Apple M1 support to PASemi i2c driver
To: Sven Peter <sven@svenpeter.dev>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
 <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
 <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <d4aa72da-cb0b-45b9-1a20-08f183cde421@xenosoft.de>
Date: Sun, 3 Oct 2021 17:45:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 03 October 2021 at 04:36 pm, Sven Peter wrote:
 > Hi,
 >
 >
 > On Fri, Oct 1, 2021, at 06:47, Christian Zigotzky wrote:
 >> On 27 September 2021 at 07:39 am, Sven Peter wrote:
 >>  > Hi Christian,
 >>  >
 >>  > Thanks already for volunteering to test this!
 >>  >
 >> Hello Sven,
 >>
 >> Damian (Hypex) has successfully tested the RC3 of kernel 5.15 with your
 >> modified i2c driver on his Nemo board yesterday. [1]
 >
 > Thanks a lot, that's great to hear!
 > If he wants to I can credit him with a Tested-by tag in the commit 
message,
 > see e.g. 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes.
 >
 >
 > Best,
 >
 >
 > Sven

Hello Sven,

We are still testing your i2c modifications. [1]
Please wait a litte bit till we finished our tests.

@Darren
Could you also please check Sven's i2c modifications? He has also 
modified your source code a little bit. [2]

@Olof
Are these i2c modifications OK? Do these work on your P.A. Semi board?

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54138#p54138
[2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2017-January/153195.html
