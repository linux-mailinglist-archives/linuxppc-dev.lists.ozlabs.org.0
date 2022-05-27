Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC3535B18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 10:07:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8cpY3PYxz3blV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 18:07:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AhLV5h0i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.80; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AhLV5h0i;
	dkim-atps=neutral
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8cns2YjPz2yQK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 18:06:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1653638774;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=MIaHrd8Kyg3cb6/O1JOnDpDcx4x3p8BNOQN4QwzCd1g=;
    b=AhLV5h0ixCaDjaB8oc347qiPoXNu1pKoZ5ruuhTE3EJPs0KmLxya2e53wE/7cmHtWG
    2TzMnw1oqnRRQH50rBCPCqSRth1Wy77vka/swbHdRPhdfm11jdFDz4TOt6phpoL0YAun
    tTXYKJfLBHgneddIYoJm96DNvLQJUbm8vkaQAg+APyXsMsSYioYn3JhdpUrs4sEIU1MV
    zc7E6/uA9WJxFqdi6fuRAzl3Ur2QkiRpGWZE71941syQhqrKEbiXvLyZadllOg27BYUq
    ejT7qpj4ZAt2Baqz4NS0CcPO1jFfOzqEw6Q5b0eoOBcbIQnS05JHtM2whweyuzmhllAn
    rwUA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjW6ENWaVbcdCVpgifkNbNTSisTgw=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:31d6:7769:fc09:c5bc]
    by smtp.strato.de (RZmta 47.45.0 AUTH)
    with ESMTPSA id 205ca1y4R86Ddie
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 27 May 2022 10:06:13 +0200 (CEST)
Message-ID: <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de>
Date: Fri, 27 May 2022 10:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Content-Language: de-DE
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Rob Herring <robh@kernel.org>
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu>
 <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27 May 2022 at 09:56 am, Prabhakar Mahadev Lad wrote:
> Hi,
>
>> -----Original Message-----
>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Sent: 27 May 2022 08:23
>> To: Christian Zigotzky <chzigotzky@xenosoft.de>; rob.herring@calxeda.com;
>> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> Cc: Darren Stevens <darren@stevens-zone.net>; linuxppc-dev <linuxppc-
>> dev@lists.ozlabs.org>; mad skateman <madskateman@gmail.com>; R.T.Dickinson
>> <rtd2@xtra.co.nz>; Christian Zigotzky <info@xenosoft.de>
>> Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
>> devicetree updates for 5.19
>>
>> Hi
>>
>> Le 26/05/2022 à 19:42, Christian Zigotzky a écrit :
>>> Hello,
>>>
>>> My keyboard and mouse don't work anymore with my Cyrus+ board with a
>>> FSL
>>> P50x0 PowerPC SoC [1] after the devicetree updates for 5.19 [2].
>>> After reverting the devicetree updates, my keyboard and mouse work
>>> without any problems.
>>> I figured out that the issue is in the patch for the file platform.c
>>> [3].  I created a patch for reverting the problematic code. (see
>>> attachment)
>>> After reverting the changes with the attached patch, the keyboard and
>>> mouse work again.
>>> Please check your changes in the file platform.c [3].
>>>
>>> Thanks,
>>> Christian
>>>
>>> [1]
>>> https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwiki.
>>> amiga.org%2Findex.php%3Ftitle%3DX5000&amp;data=05%7C01%7Cprabhakar.mah
>>> adev-lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d8
>>> 2571da1947e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%7C
>>> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
>>> I6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=fSABvBDi%2FYlqU1eydQB6%2F4BzxXkqRM0
>>> Ln9hdInyTp6w%3D&amp;reserved=0
>>> [2]
>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.
>>> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2
>>> Fcommit%2F%3Fid%3D86c87bea6b42100c67418af690919c44de6ede6e&amp;data=05
>>> %7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd
>>> 4208da3fb1c007%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6378923299
>>> 12063922%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
>>> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ENkjlza0J7xFiI
>>> aPUwMBxHBIkXJNkT%2BLTZ3xuPz%2B10Q%3D&amp;reserved=0
>>>
>>> [3]
>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.
>>> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2
>>> Fdiff%2Fdrivers%2Fof%2Fplatform.c%3Fid%3D86c87bea6b42100c67418af690919
>>> c44de6ede6e&amp;data=05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.c
>>> om%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d82571da1947e49cb4625a166a4a
>>> 2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
>>> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&a
>>> mp;sdata=yEJUK%2BGK2dzWARC5rfhsSSFSwD%2BLZm8aNNHqQhPYP7Y%3D&amp;reserv
>>> ed=0
>>
>> Based on your patch I would say the culprit commit is
>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.c
>> om%2Ftorvalds%2Flinux%2Fcommit%2Fa1a2b7125e1079cfcc13a116aa3af3df2f9e002b&
>> amp;data=05%7C01%7Cprabhakar.mahadev-
>> lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d82571da194
>> 7e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZsb3d8e
>> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
>> C%7C%7C&amp;sdata=ONR1CiaSID6q4%2Fo%2BI6MlPA4ij89BJphQRpEu5tQxvYQ%3D&amp;r
>> eserved=0
>>
>> commit a1a2b7125e1079cfcc13a116aa3af3df2f9e002b
>> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> Date:   Wed Mar 16 20:06:33 2022 +0000
>>
>>       of/platform: Drop static setup of IRQ resource from DT core
>>
>>       Now that all the DT drivers have switched to platform_get_irq() we
>> can now
>>       safely drop the static setup of IRQ resource from DT core code.
>>
>>       With the above change hierarchical setup of irq domains is no longer
>>       bypassed and thus allowing hierarchical interrupt domains to describe
>>       interrupts using "interrupts" DT property.
>>
>>       Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
>> lad.rj@bp.renesas.com>
>>       Acked-by: Marc Zyngier <maz@kernel.org>
>>       Tested-by: Marc Zyngier <maz@kernel.org>
>>       Signed-off-by: Rob Herring <robh@kernel.org>
>>       Link:
>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.ker
>> nel.org%2Fr%2F20220316200633.28974-1-prabhakar.mahadev-
>> lad.rj%40bp.renesas.com&amp;data=05%7C01%7Cprabhakar.mahadev-
>> lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d82571da194
>> 7e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZsb3d8e
>> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
>> C%7C%7C&amp;sdata=ri76vfLpmxe7vFDAlsBjyrSSkuTMz0ydftu3XObLGLA%3D&amp;reser
>> ved=0
>>
> Looks like the driver which you are using has not been converted to use platform_get_irq(), could you please check that.
>
> Cheers,
> Prabhakar
Do you mean the mouse and keyboard driver?

-- Christian
