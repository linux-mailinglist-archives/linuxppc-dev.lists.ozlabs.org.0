Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A662400B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 03:18:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPylh23vHzDqRm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 11:18:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cD48EiHK; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BPyjs4qf0zDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 11:17:04 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t11so3983026plr.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Aug 2020 18:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GKRxSAO1CESdO76PS1s8YHcqbEE81UNuCm63qCXJa7E=;
 b=cD48EiHKLuS8p9K6/Tc3KD/rDH0r2VFynL4T3Yj2U6/X8LvP+15FrM0hIhr9fdds7w
 Cot3wxR6ygAeHWml2ZGZttVWK5xTG7ERaPIv5xx5R6mnAWKJH2nAFR0UxbwuqWaWUcMG
 KXB6Hrvq9UR5ZDxlUld778hykEBJkPu5bx/zqwoPL9VgAA4iSQckiemQbZwc7U2Dq77/
 J3cgiM54nfjkaEKhaciK7dgdLMhje/bhX8Zc2pruOi1BcvyrD0gyE865s66ng1ykM2Qd
 KG+c9tSOPgfDxEXPDRDlyZ21Od+skGfvEJ7uLjhI8+e5YyUqE0HSJ7pBr9OcaxD7ETZT
 yJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GKRxSAO1CESdO76PS1s8YHcqbEE81UNuCm63qCXJa7E=;
 b=PY7G8kDgyosiYtHXsyt72bIdL9k0OawV+i+8920RKJmCeQ/LVp23f/ibTA+DV7s6nU
 o+cd3UE/mF7y4G6hs0Sh1haF7nAR7ERXt/fNBahQaIx93Nnahl4p2J5R/1cQTCKAOkmu
 PWMgo7It5ArCN61ttpslvsDi2ji5DKdC0IUJLpNlIDm6ZB4ACc3Bb04n/NzWFMYBx+c9
 OziJjK218SEDxsuX7/wWG9Pkx8jxb7hSns/WNIbJw9GsHJ2CnLL3m8v1FElVNMHrm0+o
 jQUE8XfWpuO1PsEe7MkBcDjymulRQMepBDbw48wCgU+9aTv9/IUuXOkOAUR6klOpIIUF
 EZcA==
X-Gm-Message-State: AOAM530IOOPVU/XCCUM4uAmRbZr9ZJtpf22UL+fb4Q7wpXBfjgaGKW0n
 NRLIT5yH03Mwz1q5tE4tLPc=
X-Google-Smtp-Source: ABdhPJz67FT7JWOeuhqoetUPyviqJczLQCnXxdqidlXspP/MjMWEO49wZ8aPG0CKo2Mn9GxM3XQkog==
X-Received: by 2002:a17:902:aa93:: with SMTP id
 d19mr21285241plr.272.1597022222910; 
 Sun, 09 Aug 2020 18:17:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l67sm17109291pga.41.2020.08.09.18.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2020 18:17:01 -0700 (PDT)
Subject: Re: [PATCH 2/9] macintosh/via-macii: Poll the device most likely to
 respond
To: Finn Thain <fthain@telegraphics.com.au>
References: <cover.1593318192.git.fthain@telegraphics.com.au>
 <5836f80886ebcfbe5be5fb7e0dc49feed6469712.1593318192.git.fthain@telegraphics.com.au>
 <20200809185541.GA133779@roeck-us.net>
 <alpine.LNX.2.23.453.2008100844450.8@nippy.intranet>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e3252495-2d5e-269f-6fa2-f46bbf609a53@roeck-us.net>
Date: Sun, 9 Aug 2020 18:16:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.23.453.2008100844450.8@nippy.intranet>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 8/9/20 3:58 PM, Finn Thain wrote:
> On Sun, 9 Aug 2020, Guenter Roeck wrote:
> 
>> Hi,
>>
>> On Sun, Jun 28, 2020 at 02:23:12PM +1000, Finn Thain wrote:
>>> Poll the most recently polled device by default, rather than the lowest
>>> device address that happens to be enabled in autopoll_devs. This improves
>>> input latency. Re-use macii_queue_poll() rather than duplicate that logic.
>>> This eliminates a static struct and function.
>>>
>>> Fixes: d95fd5fce88f0 ("m68k: Mac II ADB fixes") # v5.0+
>>> Tested-by: Stan Johnson <userm57@yahoo.com>
>>> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>>
>> With this patch applied, the qemu "q800" emulation no longer works and 
>> is stuck in early boot. Any idea why that might be the case, and/or how 
>> to debug it ?
>>
> 
> The problem you're seeing was mentioned in the cover letter,
> https://lore.kernel.org/linux-m68k/cover.1593318192.git.fthain@telegraphics.com.au/
> 
> Since this series was merged, Linus' tree is no longer compatible with 
> long-standing QEMU bugs.
> 
> The best way to fix this is to upgrade QEMU (latest is 5.1.0-rc3). Or use 
> the serial console instead of the framebuffer console.
> 

I have no problem with that. Actually, I had checked the qemu commit log,
 but somehow I had missed missed the commits there.

> I regret the inconvenience but the alternative was worse: adding code to 
> Linux to get compatibility with QEMU bugs (which were added to QEMU due to 
> Linux bugs).
> 
> My main concern is correct operation on actual hardware, as always. But 
> some QEMU developers are working on support for operating systems besides 
> Linux.
> 
> Therefore, I believe that both QEMU and Linux should aim for compatibility 
> with actual hardware and not bug compatibility with each other.
> 
I absolutely agree.

I repeated the test on the mainline kernel with qemu v5.1-rc3, and it works.
I also made sure that older versions of Linux still work with the qemu
v5.1.0-rc3. So everything is good, and sorry for the noise.

Thanks,
Guenter
