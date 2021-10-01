Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD5141E6EA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 06:49:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLHh12vLGz3c5N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 14:49:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oTBbAEdL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=oTBbAEdL; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLHgG2Rwgz2ymZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 14:48:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633063650;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=b06yQyLAekyW6lwakwOLyFVuHuaO/jkcVt4ChJMYpRg=;
 b=oTBbAEdLtpos1INdEzfUjPNhbT7xu/qzW24ms8sTPFtyhiDpjOmQ/hszJ8Heu3H7bF
 9aZ4vbygDRIFAyMaASItaiC9xNwm2gaIQIYuuLFNs61cvUakjzekGJSog1kk1PgFXLd5
 m/V5tjrMjxM/maXTaakpPW+jJu8beQWnoPIr0XNTyEejryK9GxHK/Y0/CB0zgihV+hQB
 cifxOMEBd9qLdIfS2mnC+IB0relXoHMoQ9XdYRisQIidCY7R0hN6EWcpC4MSWzFiKPyF
 MtdCNQVJQeXu9XDxj98jT1mwmJn0vv7N4JN1WkjXIOvsPvk9PROOjFzIuncIbvizZ5qr
 ckng==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0mYXDB7v3tOCDfwiDBygV+JEgJrW3AbrzS96w7"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b176:dac1:b99c:1716:ba2a:6835]
 by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id I00cdex914lSbcN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 1 Oct 2021 06:47:28 +0200 (CEST)
Subject: Re: Add Apple M1 support to PASemi i2c driver
To: Sven Peter <sven@svenpeter.dev>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
Date: Fri, 1 Oct 2021 06:47:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
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

On 27 September 2021 at 07:39 am, Sven Peter wrote:
 > Hi Christian,
 >
 > Thanks already for volunteering to test this!
 >
Hello Sven,

Damian (Hypex) has successfully tested the RC3 of kernel 5.15 with your 
modified i2c driver on his Nemo board yesterday. [1]

@Darren
Could you also please check Sven's i2c modifications? He has also 
modified your source code a little bit. [2]

@Olof
Are these i2c modifications OK? Do these work on your P.A. Semi board?

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54098#p54098
[2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2017-January/153195.html
[3] Further information about the Nemo board: 
https://en.wikipedia.org/wiki/AmigaOne_X1000
[4] Kernel patches for the Nemo board: 
https://lists.ozlabs.org/pipermail/linuxppc-dev/2018-January/167288.html
