Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 782D9427AB9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 15:59:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRRWC32lgz30gd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Oct 2021 00:59:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=GmCi6l4P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=GmCi6l4P; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRRVW3kj4z2yQB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Oct 2021 00:58:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633787850;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:To:Subject:Cc:Date:From:
 Subject:Sender;
 bh=CGQhnIEavNCbTVNxzDlkm2hVi0qKWPHcqboBc9funzg=;
 b=GmCi6l4P3bp2z/55flV1Z5xTX/L1TTqRhVc4UMDQ+toy+jpX3YS5Gwl6j4gYhH/fAj
 053sVW+8KXDBfmaHb8AY3tISywsnElewx2kCjDguYl8ZUHcjtJVJLm/LkpNDFhfF6EtJ
 d2KScfIpLPwPtRiXQQj27dij+9Sikue3K17jBDGfwGsXjAYsSdPa1TRqTs6kstg+G3X5
 ny8++OitQ2CbJMXt5GTtxvO2EcMMbeWTlFpvvH04MRxPbIOvaiMGgfnucrk0IGkBEUoK
 FAtiF4UHWb5hHZOVLugPtHNCKP4RSyjscK4CHeFAejYqPh26dEDAB581EpyRk0gyZety
 PRGg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhUcg2bZEYgV1fluZdSCNb3F86w"
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id I00cdex99DvR5Iu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 9 Oct 2021 15:57:27 +0200 (CEST)
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
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
 <YWFqr4uQGlNgnT1z@ninjato>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
Date: Sat, 9 Oct 2021 15:57:26 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWFqr4uQGlNgnT1z@ninjato>
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

On 09 October 2021 at 12:10 pm, Wolfram Sang wrote:
>> I still don't have access to any old PASemi hardware but the changes from
>> v1 are pretty small and I expect them to still work. Would still be nice
>> if someone with access to such hardware could give this a quick test.
> Looks good to me. I will wait a few more days so that people can report
> their tests. But it will be in the next merge window.
>
Series v2:

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de> [1]

- Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54213#p54213
