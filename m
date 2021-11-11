Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE76A44D638
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 12:55:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqgC55pwKz3bhh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 22:55:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Wbr82gBp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=Wbr82gBp; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqgBN0Pp5z2xYD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 22:54:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636631681;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=H66Rz4/hkCpg9docinRjSUMoGbcVBQdLFU0PgKDGanw=;
 b=Wbr82gBp9eVAo8wiZJlwiJ+KslcursRLh+wK+kGgXnZxO98xNhY1pnAh52D5Kjo2fz
 8AFwwRcSU5xyCn0cHmmQm4knFrA22xGPkeJCiHY8Gq/WhKQqX94HtaXAFgwrKdaWtIQz
 eQmZlAot6ksqFOax4zExLqhF03MFfHUbhHrWdQvH4GYT37JkYPpTRNjNnQ9disIvdbAt
 KDPS3bIokVt/MSlJOTY2VyRm8R+yinT6h5Il7BC2LiAciuhsheku5jPhLk/kVKiZxKWR
 TKqyZXZP7e7wTtxqQJfX3IjZw5cd2T3hM7MXgEgc3AcCuSBfhocvY6Rv7a2msF/GP7f4
 5SOA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhQJ/j+Igj1vHVSyIIKKx+xMp8bog=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:89c0:ebfc:315a:1371:b0b5:d7a5]
 by smtp.strato.de (RZmta 47.34.5 AUTH)
 with ESMTPSA id N03801xABBsdIcO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 11 Nov 2021 12:54:39 +0100 (CET)
Message-ID: <656fc68c-0bfb-0e5c-a014-32ea4b5b27c4@xenosoft.de>
Date: Thu, 11 Nov 2021 12:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
Content-Language: de-DE
To: Marc Zyngier <maz@kernel.org>
References: <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
 <20211110184106.GA1251058@bhelgaas> <87sfw3969l.wl-maz@kernel.org>
 <8cc64c3b-b0c0-fb41-9836-2e5e6a4459d1@xenosoft.de>
 <87r1bn88rt.wl-maz@kernel.org>
 <f40294c6-a088-af53-eeea-4dfbd255c5c9@xenosoft.de>
 <87pmr7803l.wl-maz@kernel.org>
 <c93c7f72-6e46-797b-bee3-c9ae3b444f60@xenosoft.de>
 <87o86r7x63.wl-maz@kernel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <87o86r7x63.wl-maz@kernel.org>
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

On 11 November 2021 at 12:24 pm, Marc Zyngier wrote:
> On Thu, 11 Nov 2021 10:44:30 +0000,
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>> On 11 November 2021 at 11:20 am, Marc Zyngier wrote:
>>> On Thu, 11 Nov 2021 07:47:08 +0000,
>>> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>>>> On 11 November 2021 at 08:13 am, Marc Zyngier wrote:
>>>>> On Thu, 11 Nov 2021 05:24:52 +0000,
>>>>> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>>>>>> Hello Marc,
>>>>>>
>>>>>> Here you are:
>>>>>> https://forum.hyperion-entertainment.com/viewtopic.php?p=54406#p54406
>>>>> This is not what I asked. I need the actual source file, or at the
>>>>> very least the compiled object (the /sys/firmware/fdt file, for
>>>>> example). Not an interpretation that I can't feed to the kernel.
>>>>>
>>>>> Without this, I can't debug your problem.
>>>>>
>>>>>> We are very happy to have the patch for reverting the bad commit
>>>>>> because we want to test the new PASEMI i2c driver with support for the
>>>>>> Apple M1 [1] on our Nemo boards.
>>>>> You can revert the patch on your own. At this stage, we're not blindly
>>>>> reverting things in the tree, but instead trying to understand what
>>>>> is happening on your particular system.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> 	M.
>>>>>
>>>> I added a download link for the fdt file to the post [1]. Please read
>>>> also Darren's comments in this post.
>>> Am I right in understanding that the upstream kernel does not support
>>> the machine out of the box, and that you actually have to apply out of
>>> tree patches to make it work?
>> No, you aren't right. The upstream kernel supports the Nemo board out
>> of the box. [1]
> That's not the way I interpret Darren's comments, but you surely know
> better than I do.
>
> I'll try to come up with something for you to test shortly.
>
> 	M.
>
Great! Thanks a lot for your help!

- Christian
