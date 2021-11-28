Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED621460A6C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:52:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Mdz5yz5z3cXT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:52:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MXJpk4bH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MXJpk4bH; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Ldp3Tvjz3dcm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 08:07:10 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id b1so39085749lfs.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 13:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kep6H8+bfVZ1xeLjsaS2A7zU/qUFFdJhuzBNEKDyf18=;
 b=MXJpk4bHJWHUsXnttmXJmMehCMhy9keZTcA7B/bYgzynu+fs9AEzA0zWS1didKGcXM
 ufZY1nIVOAfP0n1FcIj/YQO+JHOspxllH7lEwqxum4orCJ0HB2fsnMEDGJmWeH/qyrsf
 tBfKAbmns7/1QIwfCwYfnwageJ9+iaZP7wrA89IK5FuGsmtz3WgnEbf4CfOtVYKh+y1P
 P/ivsGXGLfJ8qk+PLiIxuT1vyrHF2S+SyEG3Jc+cuHLep64IrIJ92EMzFal/KsyKC+gQ
 ETMGdua/dzs6IwN9uDl7VCnKUva5ihWYK7VOkSKYM4fVdcc0cO/WridgO5+laEgsd2tU
 tz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kep6H8+bfVZ1xeLjsaS2A7zU/qUFFdJhuzBNEKDyf18=;
 b=R93ru6igD5mv+BwNAzrWkXTo21aqAbxi29/kCkBDmmrgx9zUwsM73urN33v9Xh87qr
 XDxr38eu/fj2oCrXj07L2sNwhgK6N64KXe/b9zeJwQdRnW7pj0pMZORozOn59a4+EcNi
 K6zY90O2NF2bRr8ZqqCmFmoOoCtCYWikIi8Uw/qYgCThVl7O5ZJxx+Mj8pNXtc+pJEOj
 ZKl7VPcvUGiZArx+yLuIlfOU1Vho1K9COYXGfYvYXBfEE1gIIbiZxGDVwyfIri0XbyTu
 G4AH3TKLpsRDoAIP90TGLfYIKV8MwRo0yfR3T6C74KSBXWh8Xj0ow0QPSpUFHqQCIyCJ
 /aXg==
X-Gm-Message-State: AOAM533t0Q8oGgaOAfai+LvgX/0z2+eGrS7pUeoBfAVIpCUGhlfYD9cv
 VFDYurePFt6ZpHkvpiONpaI=
X-Google-Smtp-Source: ABdhPJy4zl/AZzFPwJNVkHu3GSDT6aqXWQbZeWCJLgVwlcbzfRDN23rTDTUYoWjDb/oPahZVEVnA9Q==
X-Received: by 2002:a19:5e59:: with SMTP id z25mr43385851lfi.686.1638133626682; 
 Sun, 28 Nov 2021 13:07:06 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id s13sm1104272lfg.126.2021.11.28.13.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:07:06 -0800 (PST)
Subject: Re: [PATCH v4 18/25] x86: Use do_kernel_power_off()
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-19-digetx@gmail.com> <YaLYR24XRijSmBq3@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3082ba7a-f8f6-b2d9-5ae3-ec639b1a6bee@gmail.com>
Date: Mon, 29 Nov 2021 00:06:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLYR24XRijSmBq3@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Nov 2021 08:51:06 +1100
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>, alankao@andestech.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Lee Jones <lee.jones@linaro.org>, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org,
 linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

28.11.2021 04:15, Michał Mirosław пишет:
> On Fri, Nov 26, 2021 at 09:00:54PM +0300, Dmitry Osipenko wrote:
>> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
>> that invokes chained power-off handlers. It also invokes legacy
>> pm_power_off() for now, which will be removed once all drivers will
>> be converted to the new power-off API.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  arch/x86/kernel/reboot.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
>> index 0a40df66a40d..cd7d9416d81a 100644
>> --- a/arch/x86/kernel/reboot.c
>> +++ b/arch/x86/kernel/reboot.c
>> @@ -747,10 +747,10 @@ static void native_machine_halt(void)
>>  
>>  static void native_machine_power_off(void)
>>  {
>> -	if (pm_power_off) {
>> +	if (kernel_can_power_off()) {
>>  		if (!reboot_force)
>>  			machine_shutdown();
>> -		pm_power_off();
>> +		do_kernel_power_off();
>>  	}
> 
> Judging from an old commit from 2006 [1], this can be rewritten as:
> 
> if (!reboot_force && kernel_can_power_off())
> 	machine_shutdown();
> do_kernel_power_off();
> 
> And maybe later reworked so it doesn't need kernel_can_power_off().
> 
> [1] http://lkml.iu.edu/hypermail//linux/kernel/0511.3/0681.html

It could be rewritten like you're suggesting, but I'd prefer to keep the
old variant, for clarity.
