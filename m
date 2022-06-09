Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9455954539E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 20:04:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJsRK5D15z3c7q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 04:03:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MSBIMv3k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MSBIMv3k;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJsQd0mSfz3bk6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 04:03:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1654797786;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=LUwtK1q/bswU1aDL5tZB5+M5Gwg5yHnStcYrP7f9JMY=;
    b=MSBIMv3k5iReRCino04C6tZmox2vjMDqrxIzRYFKhcWibxZdAH3y5TZpDpTk8HqiK8
    YTHXbawsMukI74mjZY4GQOHhQZcTMGEpJZtvrXSnpmVZG3d5w1K/6QYEWXZGSTw/0/rB
    NjFgsZUR8uAIpAAbZUAUB5Akq3jMpzH+v9MQdT99NYHnsyGLwzKfCf2xzgOLhHpRVlS2
    mCDxeIt4ly9LViMULO8sXY5enl8Js/sD082G9V3H5+t9WJjClb8RyMXOGOUzikHfpyxr
    5Yi0wAENGNnf9yarfW39tdLuHPGN2aOYmXImce4TBdL4YPVKNFiyvgP97qXJ5sCTBCnV
    UNIw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiG7et51K+saQV+yygQ6vnWVwt64A=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:c4f2:5e5f:4e56:63d6]
    by smtp.strato.de (RZmta 47.45.0 AUTH)
    with ESMTPSA id 205ca1y59I35Lej
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 9 Jun 2022 20:03:05 +0200 (CEST)
Message-ID: <229b38b6-1a79-259a-e571-2551d80f334d@xenosoft.de>
Date: Thu, 9 Jun 2022 20:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: [FSL P50x0] Keyboard and mouse don't work anymore after the
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
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CAL_JsqJXXGBcuO+921DNf1yYCbUX4Mv19kQds1rkFM8q8kwxSg@mail.gmail.com>
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06 June 2022 at 07:06 pm, Rob Herring wrote:
> On Mon, Jun 6, 2022 at 11:14 AM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>> On 06 June 2022 at 04:58 pm, Rob Herring wrote:
>>> On Fri, May 27, 2022 at 9:23 AM Rob Herring <robh@kernel.org> wrote:
>>>> On Fri, May 27, 2022 at 3:33 AM Christian Zigotzky
>>>> <chzigotzky@xenosoft.de> wrote:
>>>>> On 27 May 2022 at 10:14 am, Prabhakar Mahadev Lad wrote:
>>>>>> Hi,
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Christian Zigotzky <chzigotzky@xenosoft.de>
>>>>>>>
>>>>>>> On 27 May 2022 at 09:56 am, Prabhakar Mahadev Lad wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> [...]
>>>
>>>>>>>> Looks like the driver which you are using has not been converted to use
>>>>>>> platform_get_irq(), could you please check that.
>>>>>>>> Cheers,
>>>>>>>> Prabhakar
>>>>>>> Do you mean the mouse and keyboard driver?
>>>>>>>
>>>>>> No it could be your gpio/pinctrl driver assuming the keyboard/mouse are using GPIO's. If you are using interrupts then it might be some hierarchal irqc driver in drivers/irqchip/.
>>>>>>
>>>>>> Cheers,
>>>>>> Prabhakar
>>>>> Good to know. I only use unmodified drivers from the official Linux
>>>>> kernel so it's not an issue of the Cyrus+ board.
>>>> The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
>>>> resources to a child platform device. Can you try the following
>>>> change:
>>>>
>>>> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
>>>> index 44a7e58a26e3..47d9b7be60da 100644
>>>> --- a/drivers/usb/host/fsl-mph-dr-of.c
>>>> +++ b/drivers/usb/host/fsl-mph-dr-of.c
>>>> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
>>>>                                           const char *name, int id)
>>>>    {
>>>>           struct platform_device *pdev;
>>>> -       const struct resource *res = ofdev->resource;
>>>> -       unsigned int num = ofdev->num_resources;
>>>>           int retval;
>>>>
>>>>           pdev = platform_device_alloc(name, id);
>>>> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_register(
>>>>           if (retval)
>>>>                   goto error;
>>>>
>>>> -       if (num) {
>>>> -               retval = platform_device_add_resources(pdev, res, num);
>>>> -               if (retval)
>>>> -                       goto error;
>>>> -       }
>>>> +       pdev->dev.of_node = ofdev->dev.of_node;
>>> >From the log, I think you also need to add this line:
>>>
>>> pdev->dev.of_node_reused = true;
>>>
>>>>           retval = platform_device_add(pdev);
>>>>           if (retval)
>> Hello Rob,
>>
>> Thanks a lot for your answer.
>>
>> Is the following patch correct?
> Yes
>
>> --- a/drivers/usb/host/fsl-mph-dr-of.c    2022-05-28 09:10:26.797688422
>> +0200
>> +++ b/drivers/usb/host/fsl-mph-dr-of.c    2022-05-28 09:15:01.668594809
>> +0200
>> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_
>>                        const char *name, int id)
>>    {
>>        struct platform_device *pdev;
>> -    const struct resource *res = ofdev->resource;
>> -    unsigned int num = ofdev->num_resources;
>>        int retval;
>>
>>        pdev = platform_device_alloc(name, id);
>> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_
>>        if (retval)
>>            goto error;
>>
>> -    if (num) {
>> -        retval = platform_device_add_resources(pdev, res, num);
>> -        if (retval)
>> -            goto error;
>> -    }
>> +    pdev->dev.of_node = ofdev->dev.of_node;
>> +    pdev->dev.of_node_reused = true;
>>
>>        retval = platform_device_add(pdev);
>>        if (retval)
>>
>> ---
>>
>> Thanks,
>> Christian
Hello Rob,

I tested this patch today and unfortunately the issue still exists.

Do you have another idea?

Thanks,
Christian

Updated patch:

--- a/drivers/usb/host/fsl-mph-dr-of.c  2022-06-06 02:18:54.000000000 +0200
+++ b/drivers/usb/host/fsl-mph-dr-of.c  2022-06-09 19:31:50.135472793 +0200
@@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_
                                         const char *name, int id)
  {
         struct platform_device *pdev;
-       const struct resource *res = ofdev->resource;
-       unsigned int num = ofdev->num_resources;
         int retval;

         pdev = platform_device_alloc(name, id);
@@ -105,12 +103,8 @@ static struct platform_device *fsl_usb2_
         retval = platform_device_add_data(pdev, pdata, sizeof(*pdata));
         if (retval)
                 goto error;
-
-       if (num) {
-               retval = platform_device_add_resources(pdev, res, num);
-               if (retval)
-                       goto error;
-       }
+        pdev->dev.of_node = ofdev->dev.of_node;
+        pdev->dev.of_node_reused = true;

         retval = platform_device_add(pdev);
         if (retval)
