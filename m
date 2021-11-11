Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B0244D2AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 08:48:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqYk85t5wz3c4n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 18:48:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sr5PccJo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=sr5PccJo; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqYjP3q03z2yP5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 18:47:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636616830;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=dCmpd2O/lGDrnDqSWWki/3bwgrWmS+xqwxY6BMuXy6s=;
 b=sr5PccJoWnb4Rw2L9QcLOJKHdMfBGKrx2uRQ4xWCx5ymmA9SzDZlt/LjTKnwjTWXf+
 mj1tso+ghtaMBeCGHLjECJihzfLBk56O4CAH7AiZ3235IP5BbDnWQs091RN0rtekKfHg
 q/5ZEc22ClJJVD05ks4vcKEcUzENnAvBxHriR/OPgeHVrfnqwRDJ5jifrlqWVZUlRwtN
 DeiP/WoOuXepqYRvgxuXlk/IqnI0TrwKRU+gdyB4oHoJL0gtgth9SKm6CZ+Zk/8Irljs
 ThSD9HlXQYeN+F+wTYF2uHI+TfHJoNNR1mEhIbnah2ILbYk9xdZGbN5lzK31RngbzWLt
 bfZQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhWI9Q+uux5TZjyZDAcEWxCgiq/uQ=="
X-RZG-CLASS-ID: mo00
Received: from cc-build-machine.a-eon.tld
 by smtp.strato.de (RZmta 47.34.5 AUTH)
 with ESMTPSA id N03801xAB7l8H1o
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 11 Nov 2021 08:47:08 +0100 (CET)
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
To: Marc Zyngier <maz@kernel.org>
References: <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
 <20211110184106.GA1251058@bhelgaas> <87sfw3969l.wl-maz@kernel.org>
 <8cc64c3b-b0c0-fb41-9836-2e5e6a4459d1@xenosoft.de>
 <87r1bn88rt.wl-maz@kernel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <f40294c6-a088-af53-eeea-4dfbd255c5c9@xenosoft.de>
Date: Thu, 11 Nov 2021 08:47:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87r1bn88rt.wl-maz@kernel.org>
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

On 11 November 2021 at 08:13 am, Marc Zyngier wrote:
> On Thu, 11 Nov 2021 05:24:52 +0000,
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>> On 10 November 2021 at 08:09 pm, Marc Zyngier wrote:
>>> HI all,
>>>
>>> On Wed, 10 Nov 2021 18:41:06 +0000,
>>> Bjorn Helgaas <helgaas@kernel.org> wrote:
>>>> On Wed, Nov 10, 2021 at 07:07:24PM +0100, Christian Zigotzky wrote:
>>>>> On 09 November 2021 at 03:45 pm, Christian Zigotzky wrote:
>>>>>> Hello,
>>>>>>
>>>>>> The Nemo board [1] doesn't recognize any ATA disks with the pci-v5.16
>>>>> updates [2].
>>>>>> Error messages:
>>>>>>
>>>>>> ata4.00: gc timeout cmd 0xec
>>>>>> ata4.00: failed to IDENTIFY (I/O error, error_mask=0x4)
>>>>>> ata1.00: gc timeout cmd 0xec
>>>>>> ata1.00: failed to IDENTIFY (I/O error, error_mask=0x4)
>>>>>> ata3.00: gc timeout cmd 0xec
>>>>>> ata3.00: failed to IDENTIFY (I/O error, error_mask=0x4)
>>>>>>
>>>>>> I was able to revert the new pci-v5.16 updates [2]. After a new
>>>>> compiling, the kernel recognize all ATA disks correctly.
>>>>>> Could you please check the pci-v5.16 updates [2]?
>>>>>>
>>>>>> Please find attached the kernel config.
>>>>>>
>>>>>> Thanks,
>>>>>> Christian
>>>>>>
>>>>>> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
>>>>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c5c62ddf88c34bc83b66e4ac9beb2bb0e1887d4
>>>>> Hi All,
>>>>>
>>>>> Many thanks for your nice responses.
>>>>>
>>>>> I bisected today [1]. 0412841812265734c306ba5ef8088bcb64d5d3bd (of/irq:
>>>>> Allow matching of an interrupt-map local to an interrupt controller) [2] is
>>>>> the first bad commit.
>>>>>
>>>>> I was able to revert the first bad commit [1]. After a new compiling, the
>>>>> kernel detects all ATA disks without any problems.
>>>>>
>>>>> I created a patch for an easy reverting the bad commit [1]. With this patch
>>>>> we can do further our kernel tests.
>>>>>
>>>>> Could you please check the first bad commit [2]?
>>>>>
>>>>> Thanks,
>>>>> Christian
>>>>>
>>>>> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54398#p54398
>>>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0412841812265734c306ba5ef8088bcb64d5d3bd
>>>>>
>>>>> [+ Marc Zyngier, Alyssa Rosenzweig, Lorenzo Pieralisi, and Rob Herring
>>>>> because of the first bad commit]
>>>> Thank you very much for the bisection and for also testing the revert!
>>>>
>>>> It's easy enough to revert 041284181226 ("of/irq: Allow matching of an
>>>> interrupt-map local to an interrupt controller"), and it seems like
>>>> that's what we need to do.  I have it tentatively queued up.
>>>>
>>>> That commit was part of the new support for the Apple M1 PCIe
>>>> interface, and I don't know what effect a revert will have on that
>>>> support.  Marc, Alyssa?
>>> It is going to badly break the M1 support, as we won't be able to take
>>> interrupts to detect that the PCIe link is up.
>>>
>>> Before we apply a full blown revert and decide that this isn't
>>> workable (and revert the whole M1 PCIe series, because they are
>>> otherwise somewhat pointless), I'd like to understand *what* breaks
>>> exactly.
>>>
>>> Christian, could you point me to the full DT that this machine uses?
>>> This would help understanding what goes wrong, and cook something for
>>> you to test.
>>>
>>> Thanks,
>>>
>>> 	M.
>>>
>> Hello Marc,
>>
>> Here you are:
>> https://forum.hyperion-entertainment.com/viewtopic.php?p=54406#p54406
> This is not what I asked. I need the actual source file, or at the
> very least the compiled object (the /sys/firmware/fdt file, for
> example). Not an interpretation that I can't feed to the kernel.
>
> Without this, I can't debug your problem.
>
>> We are very happy to have the patch for reverting the bad commit
>> because we want to test the new PASEMI i2c driver with support for the
>> Apple M1 [1] on our Nemo boards.
> You can revert the patch on your own. At this stage, we're not blindly
> reverting things in the tree, but instead trying to understand what
> is happening on your particular system.
>
> Thanks,
>
> 	M.
>
I added a download link for the fdt file to the post [1]. Please read 
also Darren's comments in this post.

Thanks

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54406#p54406
