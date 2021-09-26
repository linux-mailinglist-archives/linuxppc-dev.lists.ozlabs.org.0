Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2264189A2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 16:57:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHTQP6yYHz2ygB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 00:57:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ooEa3XRc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=ooEa3XRc; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHTPh0vzDz2xv5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 00:56:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632668163;
 s=strato-dkim-0002; d=xenosoft.de;
 h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
 bh=KaFOSJIVV9boepqNISMUi4waYym/nvTXk7mWiUd+w+E=;
 b=ooEa3XRcGi80ORmIk0uG5WczC8WNFfENVTXuynNKu8YrCIv4DNO18sdJHSVLzgBhcD
 81wltzX70pyAZEbf/rGXKcpHhIIiK2+cxVYXocQxb7m0W+A6Dk01nHmcQ4yG/mumYNtB
 zlh2H4iU9Gj5ueOaSu4pxWgbl+uyYzzR5k5LjViC3FE0zBpnKWnuuAL/s3RWwudUyUWM
 eunFZhgApojjMU3stM5Hn4b7iqIMtjcUsCruTppD+w2/NIvPjYF8B1kIXQ7qtti8Kpl9
 Ge5bO+eyF+Puh33tlgXwGC04YjJE0/ER44gh7XzXS6Dl9u8apIqf51nTzDdaB/Hpsgy2
 nIqw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0mZ3BcIsNuXwFLsTA7sa7cyyFFkU2ERvSHsGhb"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b170:9699:595d:1b3e:7cff:9aea]
 by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id I00cdex8QEu0JNv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 26 Sep 2021 16:56:00 +0200 (CEST)
To: sven@svenpeter.dev
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Add Apple M1 support to PASemi i2c driver
Message-ID: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
Date: Sun, 26 Sep 2021 16:55:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
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
Cc: Darren Stevens <darren@stevens-zone.net>, arnd@arndb.de, marcan@marcan.st,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 alyssa@rosenzweig.io, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Olof Johansson <olof@lixom.net>, mohamed.mediouni@caramail.com,
 Matthew Leaman <matthew@a-eon.biz>, mark.kettenis@xs4all.nl,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>,
 linux-arm-kernel@lists.infradead.org, stan@corellium.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sven,

Thanks a lot for your nice explanation of the history of the PASemi i2c 
driver.

We are using Nemo boards with 64-bit dual-core PWRficient PA6T-1682M 
CPUs (A-EON AmigaOne X1000). [1]

The RC2 of kernel 5.15 works without any problems on our Nemo boards. [2]

Could you please post all your patches merged in one patch? It's easier 
for me to apply one patch.

Thanks,
Christian

[1] https://en.wikipedia.org/wiki/AmigaOne_X1000
[2] https://forum.hyperion-entertainment.com/viewtopic.php?p=54056#p54056
