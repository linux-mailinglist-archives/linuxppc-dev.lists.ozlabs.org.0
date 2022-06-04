Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C6E53D6F8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 15:13:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFgDn38SFz3bmC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 23:13:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=qtvE5+DA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.23; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=qtvE5+DA;
	dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LFgD50FcFz2yxj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jun 2022 23:13:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1654348378;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=/aBckhXSZJD9104WlOgsTblHM8bwzT1c/+U6g7y7jgI=;
    b=qtvE5+DAO5Hnuh47XhDmS4uErXZ7ovchqvyGWeovLAf3YmhEtlh0AobIYdt4zaM9+k
    XqWnBKwHZrirN46rpUow5hF33agaUUWUoxy0d4H+ISFuM37rhDE9AMSklB6ld26/6oZA
    wiOXf/6Yc0OMtqKQZltajczDG1TOjC6ZZcbenmP9EnGxOuaQ9qYP051C7FpIL8ymLGn5
    rxXinlk2QG5vABwOrKzQqcshXtphYGx+9e7Q4xypyTEvBD+CF4KcGoQrDgVjOmzbYxzE
    /g/mQLCaaA2KWr7vGHvKyZbEh1q8xiqSOdTmsVVsPLtVhv/gAkgC85YI+DYd0eQDjifa
    eMWw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiD7XOPeR2TNUlxH5Su18hX0FMzaA=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:f48b:5c3c:cd2b:8001]
    by smtp.strato.de (RZmta 47.45.0 AUTH)
    with ESMTPSA id 205ca1y54DCu5Vv
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 4 Jun 2022 15:12:56 +0200 (CEST)
Message-ID: <97d1cb1c-b19b-c5ef-dba6-33d92b2e0744@xenosoft.de>
Date: Sat, 4 Jun 2022 15:12:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Content-Language: de-DE
To: Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>
References: <CAL_JsqK+OqML54Dfs_JNeM1_od9EBGf-eMH_4sXgpjqs2R-iYQ@mail.gmail.com>
 <87A6751F-9F21-4D06-A664-910F27459D5C@xenosoft.de>
 <20220601123529.GA3760306-robh@kernel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <20220601123529.GA3760306-robh@kernel.org>
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
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27 May 2022 at 03:40 pm, Darren Stevens wrote:
 > Hi Christian,
 >
 > Can you send me the full dmesg output from this failed boot? I looked 
but can't seem to find which component is at fault here
 >
 > Thanks
 > Darren

On 01 June 2022 at 02:35 pm, Rob Herring wrote:
> On Tue, May 31, 2022 at 06:29:38PM +0200, Christian Zigotzky wrote:
>>
>>> On 31. May 2022, at 15:46, Rob Herring <robh@kernel.org> wrote:
>>>
>>> ﻿On Mon, May 30, 2022 at 12:26 AM Christian Zigotzky
>>> <chzigotzky@xenosoft.de> wrote:
>>>>> On 27 May 2022 at 04:23 pm, Rob Herring wrote:
>>>>> The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
>>>>> resources to a child platform device. Can you try the following
>>>>> change:
>>>>>
>>>>> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
>>>>> index 44a7e58a26e3..47d9b7be60da 100644
>>>>> --- a/drivers/usb/host/fsl-mph-dr-of.c
>>>>> +++ b/drivers/usb/host/fsl-mph-dr-of.c
>>>>> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
>>>>>                                          const char *name, int id)
>>>>>   {
>>>>>          struct platform_device *pdev;
>>>>> -       const struct resource *res = ofdev->resource;
>>>>> -       unsigned int num = ofdev->num_resources;
>>>>>          int retval;
>>>>>
>>>>>          pdev = platform_device_alloc(name, id);
>>>>> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_register(
>>>>>          if (retval)
>>>>>                  goto error;
>>>>>
>>>>> -       if (num) {
>>>>> -               retval = platform_device_add_resources(pdev, res, num);
>>>>> -               if (retval)
>>>>> -                       goto error;
>>>>> -       }
>>>>> +       pdev->dev.of_node = ofdev->dev.of_node;
>>>>>
>>>>>          retval = platform_device_add(pdev);
>>>>>          if (retval)
>>>> Hello Rob,
>>>>
>>>> Thanks a lot for your patch! Unfortunately, this leads to a boot loop.
>>>> Do you have another idea?
>>> Do you have a dmesg log?
>>  From the boot loop?
> Yes.
>
>>> The other way to fix is creating a IRQ resource and adding it to the
>>> child device resources.
>> Good idea.
> Not really. I'd rather have the child device just point to the DT node,
> but that doesn't seem to work for some drivers and I want to understand
> why.
>
> Rob

Hello Rob,
Hello Darren,

The keyboard and mouse issue still exists in the latest git kernel.

Here are the logs:

- http://www.xenosoft.de/dmesg_FSL_P5040_Void_PPC.txt
- http://www.xenosoft.de/dmesg_FSL_P5040_MintPPC.txt
- http://www.xenosoft.de/dmesg_FSL_P5040_Void_PPC_with_Robs_patch.txt

Thanks,
Christian
