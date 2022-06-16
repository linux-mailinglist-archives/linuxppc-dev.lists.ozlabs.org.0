Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770254E84F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 19:05:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP7pw0TT7z3cB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 03:05:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=k3EDxsJJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=k3EDxsJJ;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP7pD45Cnz3bks
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 03:05:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1655399093;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=dOnid5LgnLEZig6/BAP+ZM15cNvfn4Oljqv6+9GITro=;
    b=k3EDxsJJYdbFFF0c9apahddBL2ve8F2fgOpfZf2oER54KwTp7hIoEH0GVs/euIKJic
    sRkiy/z3tCMAmScAc8XHYztXxPbMFvHG6u7nnhrBF0I5qh06KyvVSWXpozFeb2Fq3/qu
    rAtjr9F36fWUd+z5+jVvoshu2JnYGnXr1EwtGsQmtSlTZfsD+YyN0Tl7oq244OL+dtdg
    l8/o2vMxlbBq/u8T456luz5KiD0hi/TKZNrsYMYrK8L8R1OiMBqBsLHaPajBTgRhAq6G
    DB+gwEou3i90/fixh3ZhiWugczM5RoWdX+cQeEbWrzLN9q8yY7dKsGLqXHB3651BLg3P
    kMxg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjTulUE+cN0Gjw0ORZ6+68+5DfHkQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:6ca9:2fa0:b5d0:fee1]
    by smtp.strato.de (RZmta 47.46.0 AUTH)
    with ESMTPSA id Kaf65by5GH4q9Rf
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 16 Jun 2022 19:04:52 +0200 (CEST)
Message-ID: <5afffdbd-9aec-d107-105f-a0d4181b85d9@xenosoft.de>
Date: Thu, 16 Jun 2022 19:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Content-Language: de-DE
To: Rob Herring <robh@kernel.org>
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu>
 <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de>
 <OSZPR01MB7019313DCB5A79F91BE6D91CAAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <9e8dd323-4a36-abb2-568d-fe1384b1579c@xenosoft.de>
 <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
 <CAL_JsqJs17p-hw-U3WAkT69y3V4kuc_-O8tU=Sr8KWHPvbWJpA@mail.gmail.com>
 <1e5fd88f-80dc-d48a-0812-4724765db489@xenosoft.de>
 <CAL_JsqJXXGBcuO+921DNf1yYCbUX4Mv19kQds1rkFM8q8kwxSg@mail.gmail.com>
 <229b38b6-1a79-259a-e571-2551d80f334d@xenosoft.de>
 <CAL_JsqKUwFrck58vfnqOyOkQxJ1SRySj15ytMQPLvr2fg_V-uA@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CAL_JsqKUwFrck58vfnqOyOkQxJ1SRySj15ytMQPLvr2fg_V-uA@mail.gmail.com>
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13 June 2022 at 05:57 pm, Rob Herring wrote:
> On Thu, Jun 9, 2022 at 12:03 PM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>> On 06 June 2022 at 07:06 pm, Rob Herring wrote:
>>> On Mon, Jun 6, 2022 at 11:14 AM Christian Zigotzky
>>> <chzigotzky@xenosoft.de> wrote:
>>>> On 06 June 2022 at 04:58 pm, Rob Herring wrote:
>>>>> On Fri, May 27, 2022 at 9:23 AM Rob Herring <robh@kernel.org> wrote:
>>>>>> On Fri, May 27, 2022 at 3:33 AM Christian Zigotzky
>>>>>> <chzigotzky@xenosoft.de> wrote:
>>>>>>> On 27 May 2022 at 10:14 am, Prabhakar Mahadev Lad wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: Christian Zigotzky <chzigotzky@xenosoft.de>
>>>>>>>>>
>>>>>>>>> On 27 May 2022 at 09:56 am, Prabhakar Mahadev Lad wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>> [...]
>>>>>
>>>>>>>>>> Looks like the driver which you are using has not been converted to use
>>>>>>>>> platform_get_irq(), could you please check that.
>>>>>>>>>> Cheers,
>>>>>>>>>> Prabhakar
>>>>>>>>> Do you mean the mouse and keyboard driver?
>>>>>>>>>
>>>>>>>> No it could be your gpio/pinctrl driver assuming the keyboard/mouse are using GPIO's. If you are using interrupts then it might be some hierarchal irqc driver in drivers/irqchip/.
>>>>>>>>
>>>>>>>> Cheers,
>>>>>>>> Prabhakar
>>>>>>> Good to know. I only use unmodified drivers from the official Linux
>>>>>>> kernel so it's not an issue of the Cyrus+ board.
>>>>>> The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
>>>>>> resources to a child platform device. Can you try the following
>>>>>> change:
>>>>>>
>>>>>> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
>>>>>> index 44a7e58a26e3..47d9b7be60da 100644
>>>>>> --- a/drivers/usb/host/fsl-mph-dr-of.c
>>>>>> +++ b/drivers/usb/host/fsl-mph-dr-of.c
>>>>>> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
>>>>>>                                            const char *name, int id)
>>>>>>     {
>>>>>>            struct platform_device *pdev;
>>>>>> -       const struct resource *res = ofdev->resource;
>>>>>> -       unsigned int num = ofdev->num_resources;
>>>>>>            int retval;
>>>>>>
>>>>>>            pdev = platform_device_alloc(name, id);
>>>>>> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_register(
>>>>>>            if (retval)
>>>>>>                    goto error;
>>>>>>
>>>>>> -       if (num) {
>>>>>> -               retval = platform_device_add_resources(pdev, res, num);
>>>>>> -               if (retval)
>>>>>> -                       goto error;
>>>>>> -       }
>>>>>> +       pdev->dev.of_node = ofdev->dev.of_node;
>>>>> >From the log, I think you also need to add this line:
>>>>>
>>>>> pdev->dev.of_node_reused = true;
>>>>>
>>>>>>            retval = platform_device_add(pdev);
>>>>>>            if (retval)
>>>> Hello Rob,
>>>>
>>>> Thanks a lot for your answer.
>>>>
>>>> Is the following patch correct?
>>> Yes
>>>
>>>> --- a/drivers/usb/host/fsl-mph-dr-of.c    2022-05-28 09:10:26.797688422
>>>> +0200
>>>> +++ b/drivers/usb/host/fsl-mph-dr-of.c    2022-05-28 09:15:01.668594809
>>>> +0200
>>>> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_
>>>>                         const char *name, int id)
>>>>     {
>>>>         struct platform_device *pdev;
>>>> -    const struct resource *res = ofdev->resource;
>>>> -    unsigned int num = ofdev->num_resources;
>>>>         int retval;
>>>>
>>>>         pdev = platform_device_alloc(name, id);
>>>> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_
>>>>         if (retval)
>>>>             goto error;
>>>>
>>>> -    if (num) {
>>>> -        retval = platform_device_add_resources(pdev, res, num);
>>>> -        if (retval)
>>>> -            goto error;
>>>> -    }
>>>> +    pdev->dev.of_node = ofdev->dev.of_node;
>>>> +    pdev->dev.of_node_reused = true;
>>>>
>>>>         retval = platform_device_add(pdev);
>>>>         if (retval)
>>>>
>>>> ---
>>>>
>>>> Thanks,
>>>> Christian
>> Hello Rob,
>>
>> I tested this patch today and unfortunately the issue still exists.
> The log is the same?
>
> Rob
Yes, it's the same.

Link: http://www.xenosoft.de/dmesg_FSL_P5040_Void_PPC-2.txt

-- Christian

