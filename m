Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ABA15655B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 17:10:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48FHFm6zMrzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2020 03:10:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48FHD965ffzDqWT
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2020 03:09:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=GFUfvb+Z; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48FHD90pJCz8sk5
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2020 03:09:13 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48FHD9082Mz9sRR; Sun,  9 Feb 2020 03:09:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::3;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=GFUfvb+Z; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48FHD81hKXz9sRQ
 for <linuxppc-dev@ozlabs.org>; Sun,  9 Feb 2020 03:09:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581178146;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=PdihAqfeKD54YbNb2He1peHtwOFZYOu4uAedog826qA=;
 b=GFUfvb+ZwZcPLaeP/tiRtTW46ywyj5clteoyC5jXMGNDCfiCKQCKpP/dLZy67CFyik
 oDw7L9dkaOHSdZ6YfcxqF1VPbZAjX21XMi64gXgnhXLS3Lkd7YzEH6fvuzcyttYyHHF+
 PYo05pL0WY0K1ojkaPqwSq6FCVHKcpd5c6slmKigQ5dSOBFNAVQPXA2iTCxwEAWbGEO6
 OXyzShrX8y3SJ2p/k2PmIN7X3cO7BXMtx68LHX8BtJeqd9TTKFBCct44ym2Z+v9SpVly
 pkkmQ7TJapxKVibfBta24i9sffKcjxfRX0XWlGkjEOVueeXwfy9eG3wZ8GLnsdUtJMJH
 /15g==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgBLiaxlASBVL8WJv/OkCrDe9HRcQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:b8e6:ddd1:f1d2:d845]
 by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id 40bcf3w18G8eit4
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 8 Feb 2020 17:08:40 +0100 (CET)
Subject: Re: Latest Git kernel: avahi-daemon[2410]: ioctl(): Inappropriate
 ioctl for device
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Arnd Bergmann <arnd@arndb.de>
References: <CAK8P3a39L5i4aEbKe9CiW6unbioL=T8GqXC007mXxUu+_j84FA@mail.gmail.com>
 <834D35CA-F0D5-43EC-97B2-2E97B4DA7703@xenosoft.de>
Message-ID: <b8e3a03c-4aeb-5582-78df-144450b03927@xenosoft.de>
Date: Sat, 8 Feb 2020 17:08:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <834D35CA-F0D5-43EC-97B2-2E97B4DA7703@xenosoft.de>
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
 Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08 February 2020 at 07:59 am, Christian Zigotzky wrote:
>
>> On 7. Feb 2020, at 18:08, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> ﻿On Fri, Feb 7, 2020 at 3:34 PM Christian Zigotzky
>> <chzigotzky@xenosoft.de> wrote:
>>> Hello Arnd,
>>>
>>> We regularly compile and test Linux kernels every day during the merge
>>> window. Since Thursday last week we have very high CPU usage because of
>>> the avahi daemon on our desktop Linux systems (Ubuntu, Debian etc). The
>>> avahi daemon produces a lot of the following log message. This generates
>>> high CPU usage.
>>>
>>> Error message: avahi-daemon[2410]: ioctl(): Inappropriate ioctl for device
>>>
>>> strace /usr/sbin/avahi-daemon:
>>>
>> Thanks a lot for the detailed analysis, with this I immediately saw
>> what went wrong in my
>> original commit and I sent you a fix. Please test to ensure that this
>> correctly addresses
>> the problem.
>>
>>         Arnd
> Hi Arnd,
>
> Thanks a lot for your patch! I will test it as soon as possible.
>
> Cheers,
> Christian

Hi Arnd,

I successfully compiled the latest Git kernel with your patch today. The 
avahi daemon works fine now. That means your patch has solved the avahi 
issue.

Thanks for your patch and have a nice weekend!

Cheers,
Christian
