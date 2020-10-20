Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3155029426A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 20:44:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG2c0214fzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 05:44:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=vivier.eu
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=laurent@vivier.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivier.eu
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG2ZD6ZwJzDqHl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 05:43:16 +1100 (AEDT)
Received: from [192.168.100.1] ([82.252.146.14]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MhULz-1jzTKE2NYB-00eZ1L; Tue, 20 Oct 2020 20:42:57 +0200
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201020162303.1730562-1-laurent@vivier.eu>
 <20201020162844.GA865546@kroah.com>
 <468bbbef-4745-3b16-b6f4-30b46ebcdc33@vivier.eu>
 <20201020173745.GA882703@kroah.com>
 <387fd2aa-b181-c41f-0581-0a7e79a44e41@vivier.eu>
 <20201020183246.GA912431@kroah.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH] serial: pmac_zilog: don't init if zilog is not available
Message-ID: <b52e7fde-8874-3c53-ca13-7709656b69fb@vivier.eu>
Date: Tue, 20 Oct 2020 20:42:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201020183246.GA912431@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LVCUWwI+zZFntH1rA8fpDbRR/bSvaB+7jWvNS3VeIVPYSoK+F6m
 JuuCEfwpoYL/yZQxVJB2T2pEddNPCzJV0xjLW1xjMCUdkTG3OZyFcBmJN7PO+f4/FowZfOq
 ydyovoc921qx4v7T2Qlro5v2cR4mhaifPurXJokMNxmiJQtGUBZDAMqvm0El5oqo+/AQBQh
 h/ojDU62zlOB+wfNYnR0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QdXngQqRe+g=:SbR9BTlVBSHinTuH6lbPjh
 6TO5+RyMEFWvq9nOsq15h0WNYsVBkGjeI4ZY3lvKcajZowcVxPYlOXS/spT047i0RJa8KXlrg
 pxvVg1FJVixv+9gFj2YnUj1lTC51tL83G6Ce2wP2Pc7Qg70sEO9Wmlv03s/bVTvb3H22wFfSn
 JoYHw3xl5cJ76HP3zY8tu0hGK7vXpM/r8ynYa3upH/8KMfdl+HlF5u5eHU0h1T85q+zdvIZ6x
 ptCqYtexf36rH8RRWYOu/0WJEa1BZKH3OO+5G6ZAia6LpB5GsxyQ0WwTIoIiY2xAHK0gAhdno
 P7bc6ZmcXN18i6nYPIIJBkqGAF1Gduf7wTktbase426oWqyGhwNiGJiiuiHrb0qS7P/oHkt6m
 Kp7RRuTD6FQ6mFKdUNxst/S6r3OLKvxl0eXXrzFbeEgrXeLF/Obx7Jw2riO4J
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
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 20/10/2020 à 20:32, Greg KH a écrit :
> On Tue, Oct 20, 2020 at 08:19:26PM +0200, Laurent Vivier wrote:
>> Le 20/10/2020 à 19:37, Greg KH a écrit :
>>> On Tue, Oct 20, 2020 at 06:37:41PM +0200, Laurent Vivier wrote:
>>>> Le 20/10/2020 à 18:28, Greg KH a écrit :
>>>>> On Tue, Oct 20, 2020 at 06:23:03PM +0200, Laurent Vivier wrote:
>>>>>> We can avoid to probe for the Zilog device (and generate ugly kernel warning)
>>>>>> if kernel is built for Mac but not on a Mac.
>>>>>>
>>>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>>>> ---
>>>>>>  drivers/tty/serial/pmac_zilog.c | 11 +++++++++++
>>>>>>  1 file changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
>>>>>> index 063484b22523..d1d2e55983c3 100644
>>>>>> --- a/drivers/tty/serial/pmac_zilog.c
>>>>>> +++ b/drivers/tty/serial/pmac_zilog.c
>>>>>> @@ -1867,6 +1867,12 @@ static struct platform_driver pmz_driver = {
>>>>>>  static int __init init_pmz(void)
>>>>>>  {
>>>>>>  	int rc, i;
>>>>>> +
>>>>>> +#ifdef CONFIG_MAC
>>>>>> +	if (!MACH_IS_MAC)
>>>>>> +		return -ENODEV;
>>>>>> +#endif
>>>>>
>>>>> Why is the #ifdef needed?
>>>>>
>>>>> We don't like putting #ifdef in .c files for good reasons.  Can you make
>>>>> the api check for this work with and without that #ifdef needed?
>>>>
>>>> The #ifdef is needed because this file can be compiled for PowerMac and
>>>> m68k Mac. For PowerMac, the MACH_IS_MAC is not defined, so we need the
>>>> #ifdef.
>>>>
>>>> We need the MAC_IS_MAC because the same kernel can be used with several
>>>> m68k machines, so the init_pmz can be called on a m68k machine without
>>>> the zilog device (it's a multi-targets kernel).
>>>>
>>>> You can check it's the good way to do by looking inside:
>>>>
>>>>     drivers/video/fbdev/valkyriefb.c +317
>>>>     drivers/macintosh/adb.c +316
>>>>
>>>> That are two files used by both, mac and pmac.
>>>
>>> Why not fix it to work properly like other arch checks are done
>> I would be happy to do the same.
>>
>>> Put it in a .h file and do the #ifdef there.  Why is this "special"?
>>
>> I don't know.
>>
>> Do you mean something like:
>>
>> drivers/tty/serial/pmac_zilog.h
>> ...
>> #ifndef MACH_IS_MAC
>> #define MACH_IS_MAC (0)
>> #endif
>> ...
>>
>> drivers/tty/serial/pmac_zilog.c
>> ...
>> static int __init pmz_console_init(void)
>> {
>>         if (!MACH_IS_MAC)
>>                 return -ENODEV;
>> ...
> 
> Yup, that would be a good start, but why is the pmac_zilog.h file
> responsible for this?  Shouldn't this be in some arch-specific file
> somewhere?

For m68k, MACH_IS_MAC is defined in arch/m68k/include/asm/setup.h

If I want to define it for any other archs I don't know in which file we
can put it.

But as m68k mac is only sharing drivers with pmac perhaps we can put
this in arch/powerpc/include/asm/setup.h?

Thanks,
Laurent

