Return-Path: <linuxppc-dev+bounces-4634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39649A0089B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 12:29:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPhDK02RMz30TC;
	Fri,  3 Jan 2025 22:29:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735903744;
	cv=none; b=QurJywAKiCHhEcChm8C9gBvyBbL6wo+hClo1Gzp8Ulze8+Zf2GHPeSvCy2ME/ckIsGnvIj7OZfNHEJDRoJX2R3P08upxYB1fpKf4AlRW2HWGpRTa72dkfVAiWYYnOfbH1i6US4qXBXH7NdN/5lSOwh5Djslp9eGnAQGP43/eIcAYTi/oDoIuqo7KPoxlhxSGehSdOrLvdMq3rbzfDtiOp5eWZ3GFB4BHBGBzL1HVOoIDWnVrqiRUrVV114fJSI5FndC38+TVGXHPgOL4PJSVmGJgan9m7I9Rdixtbhzdn0Zsba+/VSUK06W3tGW6XVuGR6NdVx8ftVtNdDnck/6vgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735903744; c=relaxed/relaxed;
	bh=32PWNC7r6rHdSHh0MVozKUaF4TAx+dkDRht1Ruk2YR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRIAumY1/f+2QPceNt1pri0QuKmr52iWrDivg4XzfifG4PdS8vbTau1M+SlFT9HulPxZifQqdaYY8clwo9+oacjAwiWP36ob+gBH1xkOo8ia88YNkh5lvlAbc4hPfOxSFSe5w9TItn01lLaLD5JRFpIKxx4zP60sOpvv9yp4lWuPS/baHnQKm0rEA5EMRwJ1lfIt1oOz7MyGT5oRCYgnOWvHvNNiuIHq9pqrKkvk5GNq4VsGYoYzqChmdGq7uJFSC/tj7D0ZZLyygKGegVMVff9UfAMhtSdul3wIDSLfjIWIqn1PWAKw82lIV9BCc4wj2rKQqSHoepMP2c4dQjblpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W8vHOOOi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W8vHOOOi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPhDH2VG1z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 22:29:02 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so1440042a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 03:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735903732; x=1736508532; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32PWNC7r6rHdSHh0MVozKUaF4TAx+dkDRht1Ruk2YR0=;
        b=W8vHOOOiVwZY/qJ6FDZCosJ9PzxBcmufF9AvgWZ74X2Ff8tLmaX4BrGZrnNBclqEy/
         uFnGfEzMoYQJ8aVFezfg6OA4JOxfeDzBmZzj2GTbPJUQTQWggt+6pHFJnYnN6ckes5W9
         o5D/byBDQPwRJTOzz0e6HTyqFbUOJDE40MgdJno5GYhKLOVPOEEw8PQKgnvRTyO5cMJw
         BB52gnADaeoMekBYT2OjkzwdmG6E4bxw5UG5VRC9tf5T5ti8y2M9BBKbspEHUx7luYnm
         //anb0wAJEIYfmB7cH1m6/0p65/0AbdG4TRFE2psBNOSHaoCSDoqkJJUlOkye6bKFIQt
         ZH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735903732; x=1736508532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32PWNC7r6rHdSHh0MVozKUaF4TAx+dkDRht1Ruk2YR0=;
        b=k8Ta7VUkamgQvVrcD/71mR0CBCp4DqYMr2cP3wqeuFfWHSScJsIZzPxFnI5+iOCX7R
         zzsS2O007JH2rGBnBy8YsK9KSIw1WkYdsEJtipITc+ncSGlZ2ZJIFqPBqyhcft2jfJAQ
         sXmvhENMsmceeIsx0UIpol75RUAVmI/64sQK+dcGdA8lEZylEsN25Z/3XhDJgmC4DHqv
         o+3UKmPFDHaWcsgI9oi7y+xYM59kGBKqszYF0OMAP0ogoSFiNSrmr70VlA3U+CWZN+BO
         McVnHmdScAPds9GzF4UAMMHErEdw41YJ3qIC+8GOSBpRbN3XjQy5UMDAHXGWfk7wpyBO
         fiyA==
X-Forwarded-Encrypted: i=1; AJvYcCUayUaB05wm1tpheesSvSd4IdcJZGNsQ3RyRluUg/raTj3bx6+/cJYguj3gipLFlVSQx/MRwIHb2YilXKo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxvXfao76Xf4vyvOyieKkGgsq6Eg2RZLsXuMlcWTRQmQR0wQU0S
	UaEaEpNcsU3ArAIvRZSx9KSYecj6+yqY52WPSPtOLH+oXkFCOQLf
X-Gm-Gg: ASbGnctmgFHBFliEecZwP4GbBxow/iu8hL0rkQDSSeHW7pSRw9u5WKGSL4766ZWEeYc
	LHwWAg3RL6wSKbUMQ2di4z09UY39nY4MjlYJm90zno3+bYW8ESCj19poy4ZXttZN1Xw1TIJNC56
	5zB89mGBcGcACsM7GZwb+rMDG9XtoKoizI/gj7/y1lG+nnEJ47McM4PSn8wlMpy30uwSmXeFUkK
	kUpHwjyGqIRu7PmweYJvrXxCZTLCNvOkPOZYn5eFwDcU1IEJM6BHS0SNhALI3EE2p5zEDsF66Vt
	yBJwGj64MmXjSXkD2a2nShqcIeOIWck9wdNpeTca
X-Google-Smtp-Source: AGHT+IHEcdLqUHL2H3ucyXJoB8McZg4PpIJmWOrwxm+YDc8ziukB1qD/VdAnjm5hkaddAJsOcvw6OA==
X-Received: by 2002:a05:6402:2809:b0:5d1:2377:5b07 with SMTP id 4fb4d7f45d1cf-5d81dd4ef8emr43942219a12.6.1735903731101;
        Fri, 03 Jan 2025 03:28:51 -0800 (PST)
Received: from ?IPV6:2a02:3033:600:7448:4613:e00c:fbb7:1d60? ([2a02:3033:600:7448:4613:e00c:fbb7:1d60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701abc6sm19336866a12.75.2025.01.03.03.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:28:50 -0800 (PST)
Message-ID: <9e7e5b13-ece0-462b-bfa9-21a395612354@gmail.com>
Date: Fri, 3 Jan 2025 12:28:48 +0100
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
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove driver
 using deprecated API wext
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geoff Levand <geoff@infradead.org>, Simon Horman <horms@kernel.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 Stanislaw Gruszka <stf_xl@wp.pl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Stefan Lippers-Hollmann <s.l-h@gmx.de>, Christoph Hellwig <hch@lst.de>
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
 <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
 <8dfe122d-ce0e-4a1d-9a2f-f7585036b989@gmail.com>
 <CAMuHMdX_P9WGBiShm6Dp64Y9GRvESH-Nn=b=rRrsGbwza81VeA@mail.gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <CAMuHMdX_P9WGBiShm6Dp64Y9GRvESH-Nn=b=rRrsGbwza81VeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 03.01.25 12:16, Geert Uytterhoeven wrote:
> Hi Philipp,
> 
> On Fri, Jan 3, 2025 at 12:02 PM Philipp Hortmann
> <philipp.g.hortmann@gmail.com> wrote:
>> On 03.01.25 09:53, Geert Uytterhoeven wrote:
>>> Care to tell us where the fix is?
>>
>> please find all patches for T2 on this page:
>> https://wiki.t2linux.org/guides/kernel/
>> More exact here:
>> git clone --depth=1 https://github.com/t2linux/linux-t2-patches patches
> 
> Thanks, but I cannot find a ps3disk fix there?
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

He Geert,

I think there are some regarding PS3 and also Sparc, not only ps3disk.
You can leave this to me. I will go through it. If anybody else is doing 
this please CC me so we do not do the work twice.

I am OOO so it will take some days.

Thanks for your support.

Bye Philipp









