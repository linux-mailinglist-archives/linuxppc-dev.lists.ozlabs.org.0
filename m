Return-Path: <linuxppc-dev+bounces-4613-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C4FA0047C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYwB24Gfz2yK7;
	Fri,  3 Jan 2025 17:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735886682;
	cv=none; b=Ej+fCIt60MxICcQH4Qs/2bP9iJHLpldalphuhNeBwuhjTZ3c122eBpvRaJ/TuZUEBRIoRZstkaxJlVfFsowyHNCW00JkolK8gc4b/OXGmHjSuElPhtLM9w2wW314LmMsYsKOycWNCowEau1/drKSGriwyqqlOXBjIw3rRYn71EPGw3tYAOlhS05kzTmDpf0G5DhLuVXopov/CItgIgfxUsoiLql9YbM0qSU1l9PJT5xRyz4ve9iGnMagZxBxM4F7PpmsqU5lPZzG48Sm4trigmTaJXBRHo13c9F/bsNqsLBNbNjsK0A06IyxcEFgOlZFe6ZmjXBPufGwfzBpSJ3LKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735886682; c=relaxed/relaxed;
	bh=ABL1p7nta/CRl8BsVQhOmjXI/HpJhPxNL3TKYtG8RXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMhMb/Ky2vcoW1624pvZ0el5itnXQstC0nHbCdCjVyWsuanxWSFV/93ISZFeZ0h1V3eygg39GOX5tQU9CachFU9VLRo7ZH597z6iOz9WKVteM5byzRaCpeYN4TnpRbLLLcDpkRFd4jOx1sZavp/VxOQn+zo95STu6EozY5720fSiV0uiARGqGcpRQ4HF87iBn9Doocw6cVYbyio4O+fxu5ZkKYjmcim5NXkB91sdTDdSLfGO0ZPD8hEknGpfIC+THwVOfLGeRx/mZDOe6ZtM/u8ako7+qeNKRhBajK4mpGSjRiws6ou3EhScnL4wgrS7ejpkxfuR6mludYzbuU0pZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d1PFPy8S; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d1PFPy8S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYw84ljfz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:44:40 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3862b364538so6837121f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2025 22:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735886676; x=1736491476; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABL1p7nta/CRl8BsVQhOmjXI/HpJhPxNL3TKYtG8RXE=;
        b=d1PFPy8SiuvgFLNKPUfpY2DWPD7zdhQV+Hmqd4FUCTBCABBQLWxM3j/R3kocHEf3h5
         GibqKVnj/6Lu2gwy0XD2Px5ZQA0eXoWCS6t8QmgO+ebPrsH5BxPhOUB6zeO7XrPDUBIJ
         xId+/AujlkmvSdZu3Rm2vk91AQBWt14a4Q88yG8jvaFwctUKmIw/OpzUHzISJJ1sQU+5
         mI8ofZTXqGxDaABE5fM2OlMu4aGwxBeqvv+pTdN9CXKDqxEZv0tvqYHQO1cWLV7ZE5Kr
         KpamsInsCvTLDQt9T/8CNTeMcamBCLd3M2h/2vbeT2I/cd/BBHnJeoeYLPeZR1uZIzqb
         jzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735886676; x=1736491476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABL1p7nta/CRl8BsVQhOmjXI/HpJhPxNL3TKYtG8RXE=;
        b=srtnOyWdY23HBzS7JlKquuf5zrL1X6pHAI+x0fK3vY7A1WpJd05WWschUb9JPvrriW
         JvzVglV8nXtqk8Xm7oX/GnZgxQzBKzyBlgqpalkBpOqOpEXGdUOSLkorEy4P5K6mbnE8
         aX41722eX4+JBfCb/A91AJZVmQLi5xRqzDCQCDqTKjwziwxW4WJ2pbzm8vDpKEFcIHVu
         ihDXMdfs8jkBsDT3os5Xhv6FQTsVQO+VnlVhe6HhBfCvzEzuuSSWuSY0S+2PIV59mmz/
         C+EeDSLJMd+a+GK6eTN09w2LcEWTd8IUZM3UQoY3U6TLht2giPHHMkwKeCRX7acIwL0S
         PZPw==
X-Forwarded-Encrypted: i=1; AJvYcCUnPqDUBKLi4gzUmgCYl1Sz6bTloNui0BxpQyJNEHCyJ1L2F1eqxCvfxFCH2kcBQ6O29JVa0CXrNCmw2FM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwYYvKZY4rTUmHtWL1WTd/pNl0Q4UEJvqJxIuOc83RyGLN4VKQw
	rqI7S9S/hfHKpgI9wazYnFy6SvufFGygHNCtsnh/TtI5HjdUPrFY
X-Gm-Gg: ASbGnct1J41urCGWWBTQDgXC5hRwYVsdvCfv+2IyMfiwexTFhRN5x37AorY3IbLHjIB
	kWVx3nqJj0b3tDbrC3GYlUjLSCNvjjUbbfaabwoxuGr7+dBXxo91AtCPo0YSIKSeNBCHIpqOb5n
	TWdTlny965vPBREgzOEAxUzr3kQFcuiNNe/lkJS9TQ2J5gGoee7oYgOHOxoVg2F5TT4acDgdQSQ
	VCw8k967mJLwwvxB5mElhi8MfYBJzIWlTnHuhmAugrr6i1W/JSI9a/e6br8Bp4/278b48Sp9tf5
	4kTa+Y2J7nTZk5EjEZY7+zFAeyg=
X-Google-Smtp-Source: AGHT+IGAa139yx3LH2QxpRgTHdKaVEYWhB6ijI8gOCJypp9phUqVp1ost3xXdpx7HlRS9Snm1/kE5w==
X-Received: by 2002:a05:6000:2af:b0:388:ce0c:9f19 with SMTP id ffacd0b85a97d-38a1a177e24mr44534740f8f.0.1735886675749;
        Thu, 02 Jan 2025 22:44:35 -0800 (PST)
Received: from [192.168.2.105] (p57935577.dip0.t-ipconnect.de. [87.147.85.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366128a44fsm471876805e9.43.2025.01.02.22.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 22:44:35 -0800 (PST)
Message-ID: <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
Date: Fri, 3 Jan 2025 07:44:32 +0100
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
To: Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geoff Levand <geoff@infradead.org>, Simon Horman <horms@kernel.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 Stanislaw Gruszka <stf_xl@wp.pl>,
 Gregory Greenman <gregory.greenman@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Stefan Lippers-Hollmann <s.l-h@gmx.de>
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 30.12.24 09:22, Johannes Berg wrote:
> On Tue, 2024-12-24 at 09:07 +0100, Philipp Hortmann wrote:
>> Driver was contributed in 2008.
>>
>> The following reasons lead to the removal:
>> - This driver generates maintenance workload for itself and for API wext
> 
> So I've been wondering, why are you so concerned about this? And in
> particular, more concerned about it than the people actually doing the
> maintenance? :)

One of my big fears is the hand over to the next generation maintainers 
and developers. The less code and the less exceptions due to old 
interfaces the easier it will be. We loose maintainers and developers 
for many reasons, like: retirement, burnout, embargos or simply because 
they are not paid and need to earn money. After giving some support on 
the staging subsystem I cannot see at all that we can attract so many 
talented people as required for a save future beyond 7 years...

People who evolved with the kernel development do not have a good sense 
how difficult it can be to join nowadays.

A friend just bought two servers. One with a paid OS and one planned 
with Linux as OS. The difference was over 12000 € due to licenses. What 
would be the price when we do not have a choice? Do not feel save 
because of today. We need to fight for tomorrow.

Where do you want to invest your time? Into the new technologies to keep 
up at the front edge or to keep old stuff running that is not productive 
anymore. But there might be someone who can pull the hardware once every 
two month out of the shelf and ask why this is not working. Should this 
really stop us from progress?

> 
> We got here because I removed a *staging* driver that was in the way of
> some wext cleanups, but that had a thousand other reasons to never go
> anywhere anyway.
> 

Partial, for me more important was the try to remove all wext drivers in 
October 2023 by Arnd Bergmann.
[PATCH] [RFC] wireless: move obsolete drivers to staging
https://lore.kernel.org/linux-staging/20231010155444.858483-1-arnd@kernel.org/

>> - wext is deprecated and only used by two wireless drivers in
>>    mainline kernel
> 
> true
> 
>> - no progress changing to mac80211
> 
> It fundamentally cannot be converted to mac80211, it has a whole
> different model. In fact it cannot even be converted to cfg80211 because
> some APIs it uses just never existed there, and likely never will.
> 
>> Tested a rebased version of this patch on the Playstation 3. Used
>> T2 Linux with Kernel 6.12.5 to test the Ethernet connection.
>>
> 
> Arguably that's a pretty strong argument for *not* removing it, if it's
> actually relatively simple today to bring up the latest kernel on a PS3.

I was not able to use the WLAN on T2 Linux. I just tested the Ethernet 
connection as I know that the developer of T2 is using it. The reason 
why I bought the PS3 is to see if Linux on it is really a use case. But 
all I found is that it is only a test vehicle to say T2 is working on 
Power PC architecture.

At the time the PS3 WLAN driver was added to the mainline kernel it was 
really cool stuff. But nowadays it is just a high Power consuming device 
with a noisy fan and not enough RAM to do anything (256MB). The 
powerfull GPU is not supported by the kernel.

Do I need to find out why the WLAN is not working under T2 on PS3 to 
convince you? The WLAN is working under redribbon Linux with Kernel 3.5 
on the PS3.

T2 is working but to make this happen the T2 Author has an own repo for 
patches to apply. In the following video he publishes his view on how 
well the ps3disk is maintained and tested by the linux kernel community. 
My impression of this is that ps3disk is not tested on hardware at all.
You can find this in a youtube video: “I can't believe VIP Linux kernel 
developer BROKE PS3 support” but watch out that you are in a good mood 
otherwise it is pulling you down like me...

The commit that is breaking the function is:
commit a7f18b74dbe171625afc2751942a92f71a4dd4ba

This fixes are not in Mainline up to today. So who beside T2 Linux is 
using this? You can find more of those breaking patches... and videos...

The following points are also in the list of reasons:
- This driver has a maximum 54MBit/s as it supports only 802.11 b/g.
- Using this hardware is security wise not state of the art as WPA3 is
   not supported.

Thanks for your patience.

Bye Philipp



