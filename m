Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7E87571B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:20:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jl6Q1T/U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jNb5TLSz30XP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:20:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jl6Q1T/U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2d; helo=mail-vk1-xa2d.google.com; envelope-from=rd.dunlab@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4gHK35Svz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 10:46:04 +1000 (AEST)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-48137084a66so1960494e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 17:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689641161; x=1692233161;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2l3cSyrjXW2glLWWy50xQezOhIrGHIZF9/wpOtpT3iM=;
        b=jl6Q1T/UvfyGWSh5abi6PR7NY7TwYREiUdP6upkLK1hHlbD/Q+P7uHfvl+cL42JYLx
         4MwePqDz77I0H0V5PoHao3mV8GMHSlx6Vmh4Ykpm29Fm5U5VVO7AxF4sSL3KsYzTjX4/
         mbpP9rb663wlq6gkFHbHXfaRo9BjSvsr5APM2G/8iI0xzEYa9ewYFJvFtRlFPbH5oXIJ
         HLym89l7u6iTae916D945xgsryejXFdi5+9ytbm5Vi1GAycqaN3+d4tIAhRgkLMpQ8j2
         9LtoBsTGIgBoWY0slJr6FvQYl2Fr/kYEwFiwAS5WaVcSxT4BTvt7DTG/8XJhKent0fFH
         eYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689641161; x=1692233161;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2l3cSyrjXW2glLWWy50xQezOhIrGHIZF9/wpOtpT3iM=;
        b=NDnyi5ZA8J0oC38Fk5l40uv9zZnxjF53zersasP9qvoTrFaZuhan8TGpmI54NIlKwE
         evgsOMBZQAuD/LYuC1bcbVeZvQYo8oijaApgOT46tgl65SQzfHxVzld5hzrJbtjBNqe7
         d8GL8xph5HwgAllJLfIeJEXPwktwnfWfl7VwQZK+QgwxhP+HK8JhMWmFKx3DZBVnkcHo
         i1t4MLHBQ+G+VH50lA7gevoaGDLnvs3UWJhsFdNn0m/bf61RZHFnVAULR2ovHddPUnOo
         OXQwYa2vcqFdmtDou2olblIKYvXTBBCmJmbLsRJOag07bmVJ/ZzvW78mtA4dhnO8wD92
         8qog==
X-Gm-Message-State: ABy/qLagllxp797ZlXnOiC4nfZcFDAyAmaFjfYLxft1iba9YfHuUOgUQ
	MCZO/IuqsV3IdlIAeCLlGOoYfO/rhvpA+0R5SIo=
X-Google-Smtp-Source: APBJJlHbga8/mCPPGYpoNLFPICB0dJUDdptCl+a2F2sIrBnJTs6imHkAqXAPrK0MZMc4ZXkvropP0wAxhst7rg2aS/k=
X-Received: by 2002:a1f:d184:0:b0:471:9190:fa09 with SMTP id
 i126-20020a1fd184000000b004719190fa09mr762999vkg.7.1689641160683; Mon, 17 Jul
 2023 17:46:00 -0700 (PDT)
MIME-Version: 1.0
From: Randy Dunlap <rd.dunlab@gmail.com>
Date: Mon, 17 Jul 2023 17:45:49 -0700
Message-ID: <CA+LWhsE+TUG5L9uPBiF324_madiHr86Kw27hazr88CFuPukYkg@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
To: lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 18 Jul 2023 12:20:04 +1000
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
Cc: sfr@canb.auug.org.au, linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,
On 7/14/23 13:46, Randy Dunlap wrote:
> Thomas,
>
> On 7/13/23 09:11, Randy Dunlap wrote:
>>
>>
>> On 7/12/23 19:37, Stephen Rothwell wrote:
>>> Hi all,
>>>
>
> I still see this build error on linux-next 20230714.

I still see this build error on linux-next 20230717.

>
>>> Changes since 20230712:
>>>
>>
>> on ppc64:
>>
>> In file included from ../include/linux/device.h:15,
>> from ../arch/powerpc/include/asm/io.h:22,
>> from ../include/linux/io.h:13,
>> from ../include/linux/irq.h:20,
>> from ../arch/powerpc/include/asm/hardirq.h:6,
>> from ../include/linux/hardirq.h:11,
>> from ../include/linux/interrupt.h:11,
>> from ../drivers/video/fbdev/ps3fb.c:25:
>> ../drivers/video/fbdev/ps3fb.c: In function 'ps3fb_probe':
>> ../drivers/video/fbdev/ps3fb.c:1172:40: error: 'struct fb_info' has no member named 'dev'
>> 1172 | dev_driver_string(info->dev), dev_name(info->dev),
>> | ^~
>> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>> 110 | _p_func(dev, fmt, ##__VA_ARGS__); \
>> | ^~~~~~~~~~~
>> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>> 1171 | dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>> | ^~~~~~~~
>> ../drivers/video/fbdev/ps3fb.c:1172:61: error: 'struct fb_info' has no member named 'dev'
>> 1172 | dev_driver_string(info->dev), dev_name(info->dev),
>> | ^~
>> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'

-- 
~Randy [using gmail temporarily while infradead is down]
