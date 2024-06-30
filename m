Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8891D113
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2024 12:23:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=rrNyYJtj;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Fx7TSSIK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WBlcY2QnWz3dBd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2024 20:23:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=rrNyYJtj;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Fx7TSSIK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WBlbn0GyBz30Ty
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2024 20:22:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1719742917; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DM7U0nYhlpqhcR7998gBwwIeNC4vzlyVQxbMCYAxIgLpE18CE7BOFt7dN5u64JPmuk
    0da9wlnU3NtkQZSzDT/8OtKBo+mXyHQ8NCWrAWg7mHHvwr76AuU5WAekWaLq2A4sRopt
    BRHuqy8zAXGxq6SqSTCeA9eEUguNFkkwmBLwtT0n716VehnHmpoI/3utoFHmr/wepAun
    fUvjBYP9SHUNyX+HD2MT8h57vbYsxoFnsoLNinFB97z031a6qbe6Mk55fdNMxHU2ds0i
    X6ymRjaHETIEZVzIF/jOXRaMkWGmI4Y5eYNSb6tTjKluNo7Df7GMAq6BQX9hAqi4fGon
    Aobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1719742917;
    s=strato-dkim-0002; d=strato.com;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=koImhGjb7REMlZ/XmgRbFgMfDWJDeMGzhBpOSppcQCg=;
    b=Kyq5TvX6BUoJ+sS67S5L4oCBtwxb6qdAAlNGZDb3gNYWT0ScvEPStFU6Na+xZ5WBSc
    RfRMlC6ALkkUZw1W2NGXe6uBhj/0Q80EJC8Fv/A5FpL3+rpUckiB2MzhlRg5FwZ07+7V
    MocptiXQD9sngtWwVkMrFlR8ElsfIem/tyVLL3Ef97UAQ0nxaOobgAPPG+P1U9fdMGCe
    hk3N6/BID/u+xXf6HKryCDZApEIjzFRT/jDtRlVbLLMp3oTv6Xa4ViZ4ZJqnWZ8QLexy
    8WjV/delbr2TtGKtS0bWqKA1+NqgxM147ek1fuftuLIPpfmSFfBKuFbtAEtbK0lVzSBm
    JatQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1719742917;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=koImhGjb7REMlZ/XmgRbFgMfDWJDeMGzhBpOSppcQCg=;
    b=rrNyYJtjpkKmA0QcxDXpASOq7JUYgYpK8eqvuabSrMY/XKau9q0jf+L3f/to4GshVo
    PWOFU9qtStMYJocl73DgMLrfJDeoYah/I47xyL83JIbZIRE0hPVr7j9hiiKiDedT7LpN
    DV54Ozm0w+GtdsHZhVYwbZ2rfEUPn7DqvOgD4PAyRywdPnnqvXQRyt2hmzz1Xo9wMUO4
    0pPT0nU8PpmIGwRgwUZii7y1bksB+l3Hn7RjWitQp5UBgOV9KUwYk/nTcECZAoc5udIW
    FINdRvAm9wsQhvVi7HbhIUDhZp6zoP+Ge7mDFdFs05lg4HIfmpS4I60HEIAiLLq5Z1RG
    NyUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1719742917;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=koImhGjb7REMlZ/XmgRbFgMfDWJDeMGzhBpOSppcQCg=;
    b=Fx7TSSIKx2lKyTwirMmbPOP29OkpoRezklgZkMUFwV5mrLnJQRHNxIxnD5Ya6KyCyY
    aSGF+2gGrFWywueMpqCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY17nMJxMU7SicerhpVThcASu2X0Ag=="
Received: from [IPV6:2a02:8109:8984:5d00:8535:f3a7:32a7:65f9]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e0838905UALuCbd
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 30 Jun 2024 12:21:56 +0200 (CEST)
Message-ID: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de>
Date: Sun, 30 Jun 2024 12:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PowerPC] [PASEMI] Issue with the identification of ATA drives after
 the of/irq updates 2024-05-29
To: Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 apatel@ventanamicro.com, DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Matthew Leaman <matthew@a-eon.biz>, Darren Stevens
 <darren@stevens-zone.net>, Christian Zigotzky <info@xenosoft.de>
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

Hello,

There is an issue with the identification of ATA drives with our P.A. 
Semi Nemo boards [1] after the
commit "of/irq: Factor out parsing of interrupt-map parent phandle+args 
from of_irq_parse_raw()" [2].

Error messages:

ata2.00: failed to IDENTIFY (I/O error, err_mask=0x4)
ata2.00: qc timeout after 10000 mssecs (cmd 0xec)

Screenshots [3]

I bisected yesterday [4] and "of/irq: Factor out parsing of 
interrupt-map parent phandle+args from of_irq_parse_raw()" [2] is the 
first bad commit.

Then I created a patch for reverting this first bad commit. I also 
reverted the changes in drivers/of/property.c. [5]

The patched kernel boots with successful detection of the ATA devices.

Please check the of/irq updates.

Thanks,
Christian


[1] https://en.wikipedia.org/wiki/AmigaOne_X1000
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.10-rc5&id=935df1bd40d43c4ee91838c42a20e9af751885cc
[3]
- https://i.ibb.co/WcH8g4K/20240626-095132.jpg
- https://i.ibb.co/K7KnDxx/panic2.jpg
- https://i.ibb.co/frnbJfb/panic3.jpg

[4] https://forum.hyperion-entertainment.com/viewtopic.php?p=58585#p58585
[5] 
https://github.com/chzigotzky/kernels/blob/main/patches/X1000/of_irq_v2.patch
