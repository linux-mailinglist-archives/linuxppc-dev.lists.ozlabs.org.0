Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D1F44C6A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 19:08:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqCWj59lSz2yNr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 05:08:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=DsfpiHC7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=DsfpiHC7; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqCVy436xz2xvs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 05:07:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636567647;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=un7NStfNwXCHmUnry87vKRBPThpeYHr68ghmBQMF70o=;
 b=DsfpiHC7UekGMzBk5FwbJLJWR0gNb23MefeqmnAPe9Tk8WRjwQSbq7clMnlQX2Vmll
 WceZZPKNlQffrTfY1s09rfgs7nUKIyBleSj8mKNQ/66vXlTqAv5086+IFT59t+xkrWB2
 mPkPgcXTYWQD3GZELHCjdmOPAXyymaCyuWOKYAC1g5N/CTYZR5WTqF1wAERykLoShYTs
 +TPEwHvb8/RxIcHP/IYiwbnQftL6gJHBsyUV9jebugBtJ4xC9BvzHMW4724egxU0vQId
 R9fSbP+rUEB0wwj9JFAcr0/qWfqA16K0XySOOVG+4DdH5R10R4nTLQ5CqWauPlg8qN/J
 qBig==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgAdSVjtJkpysql8WpJpy8CVmbv+Q=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:89c0:ebfc:ccde:9e75:e3b9:1705]
 by smtp.strato.de (RZmta 47.34.5 AUTH)
 with ESMTPSA id N03801xAAI7OAgs
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 10 Nov 2021 19:07:24 +0100 (CET)
Message-ID: <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
Date: Wed, 10 Nov 2021 19:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 maz@kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 lorenzo.pieralisi@arm.com, Rob Herring <robh@kernel.org>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <15731ad7-83ff-c7ef-e4a1-8b11814572c2@xenosoft.de>
 <17e37b22-5839-0e3a-0dbf-9c676adb0dec@xenosoft.de>
 <3b210c92-4be6-ce49-7512-bb194475eeab@xenosoft.de>
In-Reply-To: <3b210c92-4be6-ce49-7512-bb194475eeab@xenosoft.de>
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
Cc: axboe@kernel.dk, kw@linux.com, Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 damien.lemoal@opensource.wdc.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Olof Johansson <olof@lixom.net>, Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, robert@swiecki.net,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09 November 2021 at 03:45 pm, Christian Zigotzky wrote:
 > Hello,
 >
 > The Nemo board [1] doesn't recognize any ATA disks with the pci-v5.16 
updates [2].
 >
 > Error messages:
 >
 > ata4.00: gc timeout cmd 0xec
 > ata4.00: failed to IDENTIFY (I/O error, error_mask=0x4)
 > ata1.00: gc timeout cmd 0xec
 > ata1.00: failed to IDENTIFY (I/O error, error_mask=0x4)
 > ata3.00: gc timeout cmd 0xec
 > ata3.00: failed to IDENTIFY (I/O error, error_mask=0x4)
 >
 > I was able to revert the new pci-v5.16 updates [2]. After a new 
compiling, the kernel recognize all ATA disks correctly.
 >
 > Could you please check the pci-v5.16 updates [2]?
 >
 > Please find attached the kernel config.
 >
 > Thanks,
 > Christian
 >
 > [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
 > [2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c5c62ddf88c34bc83b66e4ac9beb2bb0e1887d4

Hi All,

Many thanks for your nice responses.

I bisected today [1]. 0412841812265734c306ba5ef8088bcb64d5d3bd (of/irq: 
Allow matching of an interrupt-map local to an interrupt controller) [2] 
is the first bad commit.

I was able to revert the first bad commit [1]. After a new compiling, 
the kernel detects all ATA disks without any problems.

I created a patch for an easy reverting the bad commit [1]. With this 
patch we can do further our kernel tests.

Could you please check the first bad commit [2]?

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54398#p54398
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0412841812265734c306ba5ef8088bcb64d5d3bd

[+ Marc Zyngier, Alyssa Rosenzweig, Lorenzo Pieralisi, and Rob Herring 
because of the first bad commit]


