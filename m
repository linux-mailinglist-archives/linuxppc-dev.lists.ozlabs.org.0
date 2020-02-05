Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B5D153166
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 14:06:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CMJy360dzDqDp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 00:06:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CMFQ1XKNzDqBS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 00:03:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=YlfW+eUh; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48CMFP3cLXz8swW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 00:03:37 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48CMFP1y47z9sPK; Thu,  6 Feb 2020 00:03:37 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::12;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=YlfW+eUh; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48CMFN2x8qz9sSN
 for <linuxppc-dev@ozlabs.org>; Thu,  6 Feb 2020 00:03:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580907808;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=dwjvS9FXh1/cXQFUFHEemRNp/pWSu7llCgXCEceWZkA=;
 b=YlfW+eUheRhLEy6TuuApo08Cy39DxLthGl8d7QwV96MuDCvj+G3rsmyH6B/+scawT/
 /OfME/FynEP9502haneuElx1GTIlAHgZ1xNRx/lpVn8kkle0TG1uBX0ZA7uHZ730oq8r
 WpXJ8wUV2FHIMO3iodZx+zv3J0eh5QMwsAGX8Dgj8/71iOIQRvPc55lky8fzO6ze/oqQ
 bvzgfXLXN/0usyDJROvt72bDgrBezOsdZqKOeRiCNB8lQMb6mlsnfIGxXddVoZ27l2/4
 L+5n3rHj85i/tn/iJa0EmYRh6CsVft+6KRHoPrSmxeOvzmAue27qytvBcPRmqlmZdX6Y
 3SQw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgCJiNZqEvQCx8J7A62dOQ0Bdog4A=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:a0ce:11c4:aa5a:809c]
 by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id 40bcf3w15D34TLJ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 5 Feb 2020 14:03:04 +0100 (CET)
Subject: Re: Latest Git kernel: avahi-daemon[2410]: ioctl(): Inappropriate
 ioctl for device
To: Jakub Kicinski <kuba@kernel.org>
References: <20200126115247.13402-1-mpe@ellerman.id.au>
 <CAPDyKFrbYmV6_nV6psVLq6VRKMXf0PXpemBbj48yjOr3P130BA@mail.gmail.com>
 <58a6d45c-0712-18df-1b14-2f04cf12a1cb@xenosoft.de>
 <75aab3c9-1cb6-33bf-5de1-e05bbd98b6fb@c-s.fr>
 <9624aebf-edb9-a3b0-1a29-b61df6b7ba2f@xenosoft.de>
 <20200203095325.24c3ab1c@cakuba.hsd1.ca.comcast.net>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <8b0b8f6c-5389-50cf-d3e4-8315103ff317@xenosoft.de>
Date: Wed, 5 Feb 2020 14:03:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203095325.24c3ab1c@cakuba.hsd1.ca.comcast.net>
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
Cc: DTML <devicetree@vger.kernel.org>, Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@ozlabs.org, "contact@a-eon.com" <contact@a-eon.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03 February 2020 at 6:53 pm, Jakub Kicinski wrote:
> On Sun, 2 Feb 2020 16:02:18 +0100, Christian Zigotzky wrote:
>> On 02 February 2020 at 09:19 am, Christophe Leroy wrote:
>>> Hello,
>>>
>>> Le 02/02/2020 à 01:08, Christian Zigotzky a écrit :
>>>> Hello,
>>>>
>>>> We regularly compile and test Linux kernels every day during the
>>>> merge window. Since Thursday we have very high CPU loads because of
>>>> the avahi daemon on our desktop Linux systems (Ubuntu, Debian etc).
>>>>
>>>> Error message: avahi-daemon[2410]: ioctl(): Inappropriate ioctl for
>>>> device
>>> Do you know which ioctl, on which device ?
>>> Can you take a trace of running avahi-daemon with 'strace' ?
>>>
>>> Can you bisect ?
>>>
>>> Christophe
>> Hi Christophe,
>> Hi All,
>>
>> I figured out that the avahi-daemon has a problem with the IPv6 address
>> of a network interface since the Git kernel from Thursday. (Log attached)
>> This generates high CPU usage because the avahi-daemon tries to access
>> the IPv6 address again and again and thereby it produces a lot of log
>> messages.
>>
>> We figured out that the networking updates aren't responsible for this
>> issue because we created a test kernel on Wednesday. The issue is
>> somewhere in the commits from Wednesday night to Thursday (CET).
> FWIW Thursday is when the latest networking pull came in, so could well
> be networking related..
>
>> Please compile the latest Git kernel and test it with a desktop linux
>> distribution for example Ubuntu. In my point of view there are many
>> desktop machines affected. Many server systems don't use the avahi
>> daemon so they aren't affected.
>>
>> It's possible to deactivate the access to the IPv6 address with the
>> following line in the file "/etc/avahi/avahi-daemon.conf":
>>
>> use-ipv6=no
>>
>> After a reboot the CPU usage is normal again. This is only a temporary
>> solution.
>>
>> Unfortunately I don't have the time for bisecting next week. I have a
>> lot of other work to do. In my point of view it is very important that
>> you also compile the latest Git kernels. Then you will see the issue and
>> then you have a better possibility to fix the issue.
Hi All,

The issue still exist in the latest Git kernel. It's a PowerPC issue. I 
compiled the latest Git kernel on a PC today and there aren't any issues 
with the avahi daemon. Another Power Mac user reported the same issue on 
his G5. I tested with the AmigaOne X1000 and X5000 in the last days.

I bisected today but I think the result isn't correct because it founds 
the other problem with ordering of PCSCSI definition in esp_rev enum. I 
don't know how to bisect if there is another issue at the same time. 
Maybe "git bisect skip"?

2086faae3c55a652cfbd369e18ecdb703aacc493 is the first bad commit
commit 2086faae3c55a652cfbd369e18ecdb703aacc493
Author: Kars de Jong <jongk@linux-m68k.org>
Date:   Tue Nov 19 21:20:20 2019 +0100

     scsi: esp_scsi: Correct ordering of PCSCSI definition in esp_rev enum

     The order of the definitions in the esp_rev enum is important. The 
values
     are used in comparisons for chip features.

     Add a comment to the enum explaining this.

     Also, the actual values for the enum fields are irrelevant, so 
remove the
     explicit values (suggested by Geert Uytterhoeven). This makes 
adding a new
     field in the middle of the enum easier.

     Finally, move the PCSCSI definition to the right place in the enum. 
In its
     previous location, at the end of the enum, the wrong values are 
written to
     the CONFIG3 register when used with FAST-SCSI targets.

     Link: 
https://lore.kernel.org/r/20191119202021.28720-2-jongk@linux-m68k.org
     Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
     Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

:040000 040000 cdc128596e33fb60406b5de9b17b79623c187c1a 
48ceab06439f95285e8b30181e75f9a68c25fcb5 M    drivers

Cheers,
Christian


