Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 495A744D53D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 11:45:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hqdfn1Fjsz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 21:45:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UEB93Mwm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.166;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=UEB93Mwm; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hqdf526Wkz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 21:45:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636627473;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=ma0TFr7iZJMiYrb0naNb8BXA+X8CHMOl/hj+LOHXaz0=;
 b=UEB93MwmcbJ4M6NGI/0OL2V1pMjg6oE94muDBy3pH1P2sgFqrCoYLkHOtmTR+ubzhh
 36rt2Xee7oPdpxY7Q+DuPMjASW5wGCw82ftye1tWL0WOS2QocwxVYm6yQk3Ens6aQeoz
 uAup5ua6BvFtHOq8oiA4zF41opldX+ce8lJE50DFTPtXKtTNqYr1/qjE6b3OhvQatqLQ
 xoEFsFGKPr4A719EkejGENlHoAEsUi8OVSYO7bDLf977Gv47aJh5zm/sefiKJh2MEnne
 m8KgnWW1OXzO6KZmj/we4aBY6HNnXzFlLogy/Psr8p34GDPvIuRztI0rAqXdWUF5eJ8m
 pxug==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgFdUfkfTNIrYqeqUw78GttMdoRvw=="
X-RZG-CLASS-ID: mo00
Received: from cc-build-machine.a-eon.tld
 by smtp.strato.de (RZmta 47.34.5 AUTH)
 with ESMTPSA id N03801xABAiVIFG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 11 Nov 2021 11:44:31 +0100 (CET)
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
To: Marc Zyngier <maz@kernel.org>
References: <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
 <20211110184106.GA1251058@bhelgaas> <87sfw3969l.wl-maz@kernel.org>
 <8cc64c3b-b0c0-fb41-9836-2e5e6a4459d1@xenosoft.de>
 <87r1bn88rt.wl-maz@kernel.org>
 <f40294c6-a088-af53-eeea-4dfbd255c5c9@xenosoft.de>
 <87pmr7803l.wl-maz@kernel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <c93c7f72-6e46-797b-bee3-c9ae3b444f60@xenosoft.de>
Date: Thu, 11 Nov 2021 11:44:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87pmr7803l.wl-maz@kernel.org>
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
Cc: axboe@kernel.dk, Rob Herring <robh@kernel.org>, lorenzo.pieralisi@arm.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Arnd Bergmann <arnd@arndb.de>, kw@linux.com,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 damien.lemoal@opensource.wdc.com, Olof Johansson <olof@lixom.net>,
 Darren Stevens <darren@stevens-zone.net>, Bjorn Helgaas <helgaas@kernel.org>,
 mad skateman <madskateman@gmail.com>,
 "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 robert@swiecki.net, Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11 November 2021 at 11:20 am, Marc Zyngier wrote:
> On Thu, 11 Nov 2021 07:47:08 +0000,
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>> On 11 November 2021 at 08:13 am, Marc Zyngier wrote:
>>> On Thu, 11 Nov 2021 05:24:52 +0000,
>>> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>>>> Hello Marc,
>>>>
>>>> Here you are:
>>>> https://forum.hyperion-entertainment.com/viewtopic.php?p=54406#p54406
>>> This is not what I asked. I need the actual source file, or at the
>>> very least the compiled object (the /sys/firmware/fdt file, for
>>> example). Not an interpretation that I can't feed to the kernel.
>>>
>>> Without this, I can't debug your problem.
>>>
>>>> We are very happy to have the patch for reverting the bad commit
>>>> because we want to test the new PASEMI i2c driver with support for the
>>>> Apple M1 [1] on our Nemo boards.
>>> You can revert the patch on your own. At this stage, we're not blindly
>>> reverting things in the tree, but instead trying to understand what
>>> is happening on your particular system.
>>>
>>> Thanks,
>>>
>>> 	M.
>>>
>> I added a download link for the fdt file to the post [1]. Please read
>> also Darren's comments in this post.
>
> Am I right in understanding that the upstream kernel does not support
> the machine out of the box, and that you actually have to apply out of
> tree patches to make it work?
No, you aren't right. The upstream kernel supports the Nemo board out of 
the box. [1]

- Christian

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=grep&q=Darren+Stevens
