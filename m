Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6992B15946F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 17:08:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48H7493xF5zDqFH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 03:08:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48H7201JTmzDqML
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 03:06:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SmsOnffc; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48H71z39P5z8sxq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 03:06:47 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48H71z2nhsz9s29; Wed, 12 Feb 2020 03:06:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=larry.finger@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SmsOnffc; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48H71y0YNYz9sP7
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Feb 2020 03:06:43 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id b18so13298394oie.2
 for <linuxppc-dev@ozlabs.org>; Tue, 11 Feb 2020 08:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fc57hdk19KF6TlLzw6YvFqknSq93pvb+WofciXYfE9c=;
 b=SmsOnffcgJZOHX//AXTYQ0iR4lbnxZUfRHGC2PMKqrTekGv/OjJSz6Hj+OM7IvEmDl
 ilLDjZlT/w7aBz0mQ2AqZAaxTXX+Ns7H2ertSfvagitcMWSA21g8soOYPFuZoS8CviJx
 S2PXXWOqvzklPXvDouDA4HkzVYtNoiaPShX9wneapyrAzRSrADi+Vuz/0yVD+5e3G0c1
 CsuKaHKdtHmvRhxNfXeo59Eq9xO3bgcK9Pgw2gXHcTKMvuqg/TIB25OnffhiDlJ/V7uv
 hRJN9f0yDrSWp5hpqt1lk/g2a3gF9ytZq0/7+Dgaxc5sCxvi93kh1zBXMfUm6xz68f9R
 M7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fc57hdk19KF6TlLzw6YvFqknSq93pvb+WofciXYfE9c=;
 b=tGYZB/9cQFg3z5zyo6kMBiCzIHODCPT2tQEXCV6Jk9p5aZU11AXwI5GI6+6ecZ8zmb
 fe2I6F34+XQQTMDNI9b21xdRB9N8NFY2LsHwcIJV/UNkrPOr+7hy62xQuVBZuxmLpRzJ
 N33qCONZvZAQ9qBDCZ99zOmvcDSrg1JX/JtuJIc+NAi8t6oCPenj4SRy6k17UotJsCf5
 9rx/ZVnrrqTt1dT1ibglZMSUFOgOz2DkQ7Uvb4c3sEaUfCAY3AeWqbaCCbpLRYpeRXT9
 /MbrZjujceFnjPST34OIyQvZ3j3cIdiD+6OrDFJ0QQJjcZ+ZtUgO1Mii2YrwKivJkUwC
 szHw==
X-Gm-Message-State: APjAAAUcVlow5N7zmNqpUq8bRMl1Kscsg9OCmnZTWOlrRyEyBrWwm8Cn
 MpfOCF1dvx9ICAvZBIPeBiRTmpMM
X-Google-Smtp-Source: APXvYqzSXEGnZ5wJQzMVsDevcgZGGeVIBZ9HHnMYD+wXvT1o49PvIaV3YdKZl3hiytb8jxQ2UAjfBg==
X-Received: by 2002:aca:cdd0:: with SMTP id d199mr3341925oig.49.1581437200768; 
 Tue, 11 Feb 2020 08:06:40 -0800 (PST)
Received: from [192.168.1.120] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id u18sm1330996otq.26.2020.02.11.08.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 08:06:39 -0800 (PST)
Subject: Re: Problem booting a PowerBook G4 Aluminum after commit cd08f109
 with CONFIG_VMAP_STACK=y
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <f7565b89-c8b2-d2e7-929e-4b1abf72fc63@lwfinger.net>
 <159ed5d8-376b-1642-fb4b-01406d671cf1@c-s.fr>
 <6a1802b8-c6a7-d091-1036-689e089b786f@lwfinger.net>
 <f35ea4e6-7c54-6acc-7d91-3a6eea56133c@c-s.fr>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <608a1a18-a0ed-2059-bfbc-081c9ef1bfd8@lwfinger.net>
Date: Tue, 11 Feb 2020 10:06:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <f35ea4e6-7c54-6acc-7d91-3a6eea56133c@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/11/20 12:55 AM, Christophe Leroy wrote:
> 
> 
> Le 10/02/2020 à 13:55, Larry Finger a écrit :
>> On 2/9/20 12:19 PM, Christophe Leroy wrote:
>>> Do you have CONFIG_TRACE_IRQFLAGS in your config ?
>>> If so, can you try the patch below ?
>>>
>>> https://patchwork.ozlabs.org/patch/1235081/
>>>
>>> Otherwise, can you send me your .config and tell me exactly where it stops 
>>> during the boot.
>>
>> Christophe,
>>
>> That patch did not work. My .config is attached.
>>
>> It does boot if CONFIG_VMAP_STACK is not set.
>>
>> The console display ends with the "DMA ranges" output. A screen shot is also 
>> appended.
>>
>> Larry
>>
> 
> Hi,
> 
> I tried your config under QEMU, it works.
> 
> In fact your console display is looping on itself, it ends at "printk: 
> bootconsole [udbg0] disabled".
> 
> Looks like you get stuck at the time of switching to graphic mode. Need to 
> understand why.

I'm not surprised that a real G4 differs from QEMU. For one thing, the real 
hardware uses i2c to connect to the graphics hardware.

I realized that the screen was not scrolling and output was missing. To see what 
was missed, I added a call to btext_clearscreen(). As you noted, it ends at the 
bootconsole disabled statement.

As I could not find any console output after that point, I then turned off the 
bootconsole disable. I realize this action may cause a different problem, but in 
this configuration, the computer hit a BUG Unable to handle kernel data access 
at 0x007a84fc. The faulting instruction address was 0x00013674. Those addresses 
look like physical, not virtual, addresses.

I then added pr_info statements to bracket the failure. In file 
drivers/video/fbdev/core/fb_ddc.c, the code reaches line 66, which is
	algo_data->setsda(algo_data->data, 1);
Both pointers seem OK with algo_data = 0xeedfb4bc, and algo_data->data = 
0xeedb25c. The code faults before returning. I then annotated that callback 
routine radeon_gpio_setsda(), and found that execution is OK to the end of the 
routine, but the fault happens on the return from this routine as though the 
stack were corrupted.

I will be busy for about 8 hours, but if you can think of any debugging I can do 
on this routine, please let me know.

Thanks,

Larry
