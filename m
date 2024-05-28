Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id AB5538D2584
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 22:11:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=cDB8OYz6;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=0GuaHbIK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vpk3t09sNz79v0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 06:03:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=cDB8OYz6;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=0GuaHbIK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.24; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vpk334rnGz3w8s
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 06:03:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1716926407; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rVzRwE1LJkGCjhkcq8W4rUukhUgukq2xMQ19MEMDS4T5pgRH2zmvwGSvR8KiPWfc5B
    vOcArihMzdEXujK5cOchuztZTgtcX+ABS8cPeZ2mt0k16XVvJ7mi6I58KAzusgWXTmKp
    q6yQ6ApImP+gU6/P3w4ibOzR1oCo0Oej6W1HCvGhbtLQSka8lSVg9YLL2Oiu7CcjItla
    tWinZ9F6ngKvKzEfBF7kFCk+EkN18wyy0qKxx9twKBteFzoqv5OMpFoydBTwH2HCp4uE
    cJcY4JivuS7pzPBbEkXAd8x/+i2rBnxzeW46LeJ+Hb8OI3GzBCV1I1pQkBP7pfGtEFTU
    BKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1716926407;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=TEA1EW9q5PkfZmVdF2MwoPiUom+leZWEgkwQGTsW4ps=;
    b=nPIxxv5p8gsyEsMnB5U6NJ9g7CcNyaCPhERMRQz7jmGGy45ro1tBF7AWt2JwgOlOJS
    q0gA7t6NCcRIQzkWSJdUe03Ud16k2htqOmrBFu6m6+Q3goqbSxSoMMUy+SHVOXG0GQPV
    pTojuA6SNykM/9ZYNEp53BKgtE0DSVHBNOp0hXW+sCqn2HxaZYz65/hypcaIizrAGM3V
    d/tCvGgKdfGijqD73ns2sgIznmQtT9zvFZeEcl+Xw2I+m47XO1LrocO+vig4rbuOYsFJ
    XCwFiChqlEVeq3o8fdk+cg94AxaLZJF7JM5HoKyfbPq1NpReWzauabipP47+RABx9RIp
    ZBNw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1716926407;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=TEA1EW9q5PkfZmVdF2MwoPiUom+leZWEgkwQGTsW4ps=;
    b=cDB8OYz64Kw2/kCh3fYu2xTdKxzKzsysF7aYRP60xU68BrlN72dAhmwEpEUec9cudW
    QbsVh5gvuUyYqyXMYCccs1ZBBnP19tlFqsA8GyXAdM0g9NM8mA4tDOHFgtc8UfJdgCj0
    vCV+kNmIpp9FI/v9n7+5RqDbeO9eww3/qLxlnd0eXvX/nHQCFtLnYrxMn9g5UVcs5y6O
    o6srvxM3jn6T9LuyVZUfgndSeyfaqK+JNgqFbpjwxriZaaPVFAVLmT6X6+F8XxSLKAs4
    B+Rx2EGVGCFWanUBMd51nsQBoASTXPdHzI2OoDVm/w/yJoQoHBUkXwEgnJDTXZ/3YRta
    jSfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1716926407;
    s=strato-dkim-0003; d=xenosoft.de;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=TEA1EW9q5PkfZmVdF2MwoPiUom+leZWEgkwQGTsW4ps=;
    b=0GuaHbIKCMBpRQSBGOdk8YZw8WsEdkLHvZIZygi/Y0jCm86qktTQYmebop38kkZZES
    v+NalEdqL0mV1BYtlhAQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43J0jbX3mI+xFkDym0uJ5XGq77oKNN8JZYXQINw=="
Received: from [IPV6:2a01:599:812:7116:d3f:4849:4ccd:c8e2]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e092ae04SK06ras
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 28 May 2024 22:00:06 +0200 (CEST)
Message-ID: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
Date: Tue, 28 May 2024 22:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Xorg doesn't start and some other issues with the RC1 of kernel 6.10
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
with the VirtIO GPU and with some Radeon cards.

Another error message: Failed to start Setup Virtual Console.

Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y

Tested with FSL P5040, FSL P5020, and PASEMI boards.

Could you please test Xorg on your PowerPC machines.

Thanks,
Christian
