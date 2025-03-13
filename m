Return-Path: <linuxppc-dev+bounces-6957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC69A5F64C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 14:50:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD85C2Xt5z30HB;
	Fri, 14 Mar 2025 00:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741873807;
	cv=none; b=oUDaxI7xpVY+YZ2Q87oM6Rp84ZaoEbKwsIbZdon+MeWqlB9zjTkSt/iOT73RRSV+qwQwDa+Gjzbp4hu46Lc60imtKi1tBWovBlVPKi9VEY+PghEw4vSdPmoLHNBH6hWWFIFMddY7muagd/tTRE3EDgOdAEOMGfdDaQ/lpl7Ki+hKOnIM5KhG5UY8nnjT3LLpLIzn04CGIi01nhGnV9TYlDJIvr+2FeC7r2Xq8BmQ2ccfJW6rCFCfIbSHjx4musZ+Iw1EHG5yTmn6/nbYUhopFN3f/r8R//oHK5Pd3PT3Tq+Njoiqp0K9UCflLjtz1clLpogLa9a//VTnKRTT0HpB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741873807; c=relaxed/relaxed;
	bh=jH8JFw6nELtAKFROSWUysqSXnynjCE92Xu7g/z/AOxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxSRf81j4YD55WohdgXLb0mdrbA6dckT2ZIP4bNOwe5G+CjKH8+l9HuS0gtFVCdzt+Wizei5Ng/10Pm5+/PGM9jyWDQl99qv3MQ5hVVv7/c9cUrmI92W/jwsdCKHhvHs1Mltydb4bGiv76oNizi821K/PDXcIjzDAJH+KxahPkij8z4iVCPqWJkX1otD1/w6ckajcr9rm8QzzKRwIh4wccmeX5McsNz0VjA4hjju1B3Xcf7dHHNqtOExrPGFX9VpFCfxXNoAQmmloHMrAhDfEVQwV9mRLz5QhvlSkkDNG7uzuvkMfuAgq05Ryv8ZtYnvl5Z78ZU6W+9RuOJPnWkDbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD85B0dZfz30CB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 00:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZD7qG0qYKz9sSY;
	Thu, 13 Mar 2025 14:38:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhtE9KRHTdsR; Thu, 13 Mar 2025 14:38:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZD7q91zC1z9sSL;
	Thu, 13 Mar 2025 14:37:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 302D58B779;
	Thu, 13 Mar 2025 14:37:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WdQEpeFRVBdp; Thu, 13 Mar 2025 14:37:57 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C86C58B770;
	Thu, 13 Mar 2025 14:37:56 +0100 (CET)
Message-ID: <362f9392-f891-4a15-9ffd-5f5a6cac41b8@csgroup.eu>
Date: Thu, 13 Mar 2025 14:37:56 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
To: "Dr. David Alan Gilbert" <linux@treblig.org>, ioana.ciornei@nxp.com,
 stuyoder@gmail.com, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241115152055.279732-1-linux@treblig.org>
 <3f9dbb7b-6527-48e1-9028-b46e5a0c58ce@csgroup.eu>
 <Z9LbwRUsHwFLpBZA@gallifrey>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Z9LbwRUsHwFLpBZA@gallifrey>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 13/03/2025 à 14:21, Dr. David Alan Gilbert a écrit :
> [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> * Christophe Leroy (christophe.leroy@csgroup.eu) wrote:
>>
>>
>> Le 15/11/2024 à 16:20, linux@treblig.org a écrit :
>>> [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>>
>>> fsl_mc_allocator_driver_exit() was added explicitly by
>>> commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
>>> but was never used.
>>>
>>> Remove it.
>>>
>>> fsl_mc_portal_reset() was added in 2015 by
>>> commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
>>> but was never used.
>>>
>>> Remove it.
>>>
>>> fsl_mc_portal_reset() was the only caller of dpmcp_reset().
>>>
>>> Remove it.
>>>
>>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>>
>> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Hi,
>    Can someone pick this old change up please?  I see the PPC patchwork says
>    'handled elsewhere' but doesn't say where.

MAINTAINERS file says where:

QORIQ DPAA2 FSL-MC BUS DRIVER
M:	Stuart Yoder <stuyoder@gmail.com>
M:	Laurentiu Tudor <laurentiu.tudor@nxp.com>
L:	linux-kernel@vger.kernel.org
S:	Maintained
F:	Documentation/ABI/stable/sysfs-bus-fsl-mc
F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
F: 
Documentation/networking/device_drivers/ethernet/freescale/dpaa2/overview.rst
F:	drivers/bus/fsl-mc/
F:	include/uapi/linux/fsl_mc.h

FREESCALE SOC DRIVERS
M:	Christophe Leroy <christophe.leroy@csgroup.eu>
L:	linuxppc-dev@lists.ozlabs.org
L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
S:	Maintained
F:	Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
F:	Documentation/devicetree/bindings/soc/fsl/
F:	drivers/soc/fsl/
F:	include/linux/fsl/
F:	include/soc/fsl/

I acked the 2 line changes in include/linux/fsl/mc.h, the main changes 
being in the C files which are not under my scope.

Stuart, Laurentiu, can you pick up the patch ?

Christophe

> 
> Thanks,
> 
> Dave
>>
>>> ---
>>>    drivers/bus/fsl-mc/dpmcp.c            | 22 ----------------------
>>>    drivers/bus/fsl-mc/fsl-mc-allocator.c |  5 -----
>>>    drivers/bus/fsl-mc/fsl-mc-private.h   |  6 ------
>>>    drivers/bus/fsl-mc/mc-io.c            | 20 --------------------
>>>    include/linux/fsl/mc.h                |  2 --
>>>    5 files changed, 55 deletions(-)
>>>
>>> diff --git a/drivers/bus/fsl-mc/dpmcp.c b/drivers/bus/fsl-mc/dpmcp.c
>>> index 5fbd0dbde24a..7816c0a728ef 100644
>>> --- a/drivers/bus/fsl-mc/dpmcp.c
>>> +++ b/drivers/bus/fsl-mc/dpmcp.c
>>> @@ -75,25 +75,3 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
>>>           /* send command to mc*/
>>>           return mc_send_command(mc_io, &cmd);
>>>    }
>>> -
>>> -/**
>>> - * dpmcp_reset() - Reset the DPMCP, returns the object to initial state.
>>> - * @mc_io:     Pointer to MC portal's I/O object
>>> - * @cmd_flags: Command flags; one or more of 'MC_CMD_FLAG_'
>>> - * @token:     Token of DPMCP object
>>> - *
>>> - * Return:     '0' on Success; Error code otherwise.
>>> - */
>>> -int dpmcp_reset(struct fsl_mc_io *mc_io,
>>> -               u32 cmd_flags,
>>> -               u16 token)
>>> -{
>>> -       struct fsl_mc_command cmd = { 0 };
>>> -
>>> -       /* prepare command */
>>> -       cmd.header = mc_encode_cmd_header(DPMCP_CMDID_RESET,
>>> -                                         cmd_flags, token);
>>> -
>>> -       /* send command to mc*/
>>> -       return mc_send_command(mc_io, &cmd);
>>> -}
>>> diff --git a/drivers/bus/fsl-mc/fsl-mc-allocator.c b/drivers/bus/fsl-mc/fsl-mc-allocator.c
>>> index b5e8c021fa1f..6c3beb82dd1b 100644
>>> --- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
>>> +++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
>>> @@ -656,8 +656,3 @@ int __init fsl_mc_allocator_driver_init(void)
>>>    {
>>>           return fsl_mc_driver_register(&fsl_mc_allocator_driver);
>>>    }
>>> -
>>> -void fsl_mc_allocator_driver_exit(void)
>>> -{
>>> -       fsl_mc_driver_unregister(&fsl_mc_allocator_driver);
>>> -}
>>> diff --git a/drivers/bus/fsl-mc/fsl-mc-private.h b/drivers/bus/fsl-mc/fsl-mc-private.h
>>> index b3520ea1b9f4..e1b7ec3ed1a7 100644
>>> --- a/drivers/bus/fsl-mc/fsl-mc-private.h
>>> +++ b/drivers/bus/fsl-mc/fsl-mc-private.h
>>> @@ -66,10 +66,6 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
>>>                   u32 cmd_flags,
>>>                   u16 token);
>>>
>>> -int dpmcp_reset(struct fsl_mc_io *mc_io,
>>> -               u32 cmd_flags,
>>> -               u16 token);
>>> -
>>>    /*
>>>     * Data Path Resource Container (DPRC) API
>>>     */
>>> @@ -631,8 +627,6 @@ int dprc_scan_objects(struct fsl_mc_device *mc_bus_dev,
>>>
>>>    int __init fsl_mc_allocator_driver_init(void);
>>>
>>> -void fsl_mc_allocator_driver_exit(void);
>>> -
>>>    void fsl_mc_init_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
>>>
>>>    void fsl_mc_cleanup_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
>>> diff --git a/drivers/bus/fsl-mc/mc-io.c b/drivers/bus/fsl-mc/mc-io.c
>>> index 95b10a6cf307..a0ad7866cbfc 100644
>>> --- a/drivers/bus/fsl-mc/mc-io.c
>>> +++ b/drivers/bus/fsl-mc/mc-io.c
>>> @@ -263,23 +263,3 @@ void fsl_mc_portal_free(struct fsl_mc_io *mc_io)
>>>           dpmcp_dev->consumer_link = NULL;
>>>    }
>>>    EXPORT_SYMBOL_GPL(fsl_mc_portal_free);
>>> -
>>> -/**
>>> - * fsl_mc_portal_reset - Resets the dpmcp object for a given fsl_mc_io object
>>> - *
>>> - * @mc_io: Pointer to the fsl_mc_io object that wraps the MC portal to free
>>> - */
>>> -int fsl_mc_portal_reset(struct fsl_mc_io *mc_io)
>>> -{
>>> -       int error;
>>> -       struct fsl_mc_device *dpmcp_dev = mc_io->dpmcp_dev;
>>> -
>>> -       error = dpmcp_reset(mc_io, 0, dpmcp_dev->mc_handle);
>>> -       if (error < 0) {
>>> -               dev_err(&dpmcp_dev->dev, "dpmcp_reset() failed: %d\n", error);
>>> -               return error;
>>> -       }
>>> -
>>> -       return 0;
>>> -}
>>> -EXPORT_SYMBOL_GPL(fsl_mc_portal_reset);
>>> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
>>> index c90ec889bfc2..37316a58d2ed 100644
>>> --- a/include/linux/fsl/mc.h
>>> +++ b/include/linux/fsl/mc.h
>>> @@ -417,8 +417,6 @@ int __must_check fsl_mc_portal_allocate(struct fsl_mc_device *mc_dev,
>>>
>>>    void fsl_mc_portal_free(struct fsl_mc_io *mc_io);
>>>
>>> -int fsl_mc_portal_reset(struct fsl_mc_io *mc_io);
>>> -
>>>    int __must_check fsl_mc_object_allocate(struct fsl_mc_device *mc_dev,
>>>                                           enum fsl_mc_pool_type pool_type,
>>>                                           struct fsl_mc_device **new_mc_adev);
>>> --
>>> 2.47.0
>>>
>>
> --
>   -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>   \ _________________________|_____ https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.treblig.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C707d35bccc9a4949428b08dd6231e98a%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638774688697894005%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ncMBG9AvSfn4mKmQkFv%2F6UfFYp%2FBMDOna7uejbavhUc%3D&reserved=0   |_______/


