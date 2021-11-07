Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9685B447595
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Nov 2021 21:12:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnQQw3xXBz2yyj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 07:12:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kz4LsYWH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Kz4LsYWH; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnM5b1wV4z2xWj;
 Mon,  8 Nov 2021 04:42:41 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id bi35so30928495lfb.9;
 Sun, 07 Nov 2021 09:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yp6jZ6b/7UxZJRYtTwXk1ZheTwTRVWw2YizZoWEGBFY=;
 b=Kz4LsYWHF1VLAkkHNhWuY0M4e42sK4F6sbepl/m1LlUZc7d3ve0+PCaFGV/EW5J0Qp
 q3gOw3u9HDrcvbcy0ihsCdfp4jZucUbKQSHRkLa1MP7e5ywuxBNTRkBRVQjdXS9WYB4a
 75JZ2tni2XNEB9cE2UtRo1WCAu8alZQtGLiKAGmbi/fYYSN/XzQ2AMB855RVvlrPgYwR
 rhnxfzYw0xMwDEQtzpN4vSGSTSGsur7/4vd8RZnKhOdoVQg9OK2TefhJzCLnTq9oEqOU
 +An3rMVrqt5asX/Z17ZvVIT93/IFfnrUb7jTwuCOBo+NhYvWwEU+N1HBtnKoiVp4DFnC
 c3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yp6jZ6b/7UxZJRYtTwXk1ZheTwTRVWw2YizZoWEGBFY=;
 b=5qNJmrzP7O1Y187wGK37XLn8+6+F8hEBxI3ffwQPRCgCAo4POprSV8N5KajLuk8oQi
 XZaJz0QTut9LB9xVEVcngLHhf5qyZEHgb/T5Vt0OwNDaf/66hFgr+ENgRogP7bX3VKht
 K9W4PzWWRX2WO2SVdfhddPZ7lZdCctRGEsXrjyXzobLakiEdwf4xf2CdKeMf9/H9G/AA
 F2a46NrCRwWK4DKjLYGUway+JzCttI/P8Z7UGmh6kpjp1We0N2W1w4d6hO1wo9puyM9S
 /7Sk8Zc1fubCPC/IHBGfO3xnOKBzm17lRtyN3q+R4FYM0s7+MqDaJBh/oOg58YMeayjs
 JZDg==
X-Gm-Message-State: AOAM532eQrodXOPQXGuEkoi2CVfJNzpWR8DqrKRxcdkJW3Zys/pbNrQX
 74pQDheYBUiD9+lGZ3vGTL8=
X-Google-Smtp-Source: ABdhPJxbnSyAP7uVMoABCneWUE/0znULgGMoNtn8dVGgMW1HOHcNNIL0n14F/iW1e4ue0spHO1DEGA==
X-Received: by 2002:ac2:4c55:: with SMTP id o21mr18358331lfk.527.1636306956359; 
 Sun, 07 Nov 2021 09:42:36 -0800 (PST)
Received: from [192.168.2.145] (79-139-182-132.dynamic.spd-mgts.ru.
 [79.139.182.132])
 by smtp.googlemail.com with ESMTPSA id o1sm1351686ljg.130.2021.11.07.09.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 09:42:35 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
 <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
 <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
 <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0b52994-51f5-806b-b07e-3e70d8217ffc@gmail.com>
Date: Sun, 7 Nov 2021 20:42:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Nov 2021 07:09:47 +1100
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
 Thomas Gleixner <tglx@linutronix.de>, Tomer Maimon <tmaimon77@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-ia64@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-omap@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-pm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

07.11.2021 20:32, Guenter Roeck пишет:
> On 11/7/21 9:16 AM, Dmitry Osipenko wrote:
>> 07.11.2021 20:08, Guenter Roeck пишет:
>>> On 11/7/21 8:53 AM, Dmitry Osipenko wrote:
>>>> 06.11.2021 23:54, Jonathan Neuschäfer пишет:
>>>>> Hi,
>>>>>
>>>>> On Thu, Oct 28, 2021 at 12:16:57AM +0300, Dmitry Osipenko wrote:
>>>>>> Use devm_register_power_handler() that replaces global pm_power_off
>>>>>> variable and allows to register multiple power-off handlers. It also
>>>>>> provides restart-handler support, i.e. all in one API.
>>>>>>
>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>> ---
>>>>>
>>>>> When I boot with (most of) this patchset applied, I get the warning at
>>>>> kernel/reboot.c:187:
>>>>>
>>>>>      /*
>>>>>       * Handler must have unique priority. Otherwise call order is
>>>>>       * determined by registration order, which is unreliable.
>>>>>       */
>>>>>      WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list,
>>>>>
>>>>> nb));
>>>>>
>>>>> As the NTXEC driver doesn't specify a priority, I think this is an
>>>>> issue
>>>>> to be fixed elsewhere.
>>>>>
>>>>> Other than that, it works and looks good, as far as I can tell.
>>>>>
>>>>>
>>>>> For this patch:
>>>>>
>>>>> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>>>>> Tested-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>>>>
>>>> Thank you. You have conflicting restart handlers, apparently NTXEC
>>>> driver should have higher priority than the watchdog driver. It should
>>>> be a common problem for the watchdog drivers, I will lower watchdog's
>>>> default priority to fix it.
>>>>
>>>
>>> The watchdog subsystem already uses "0" as default priority, which was
>>> intended as priority of last resort for restart handlers. I do not see
>>> a reason to change that.
>>
>> Right, I meant that watchdog drivers which use restart handler set the
>> level to the default 128 [1]. Although, maybe it's a problem only for
>> i.MX drivers in practice, I'll take a closer look at the other drivers.
>>
> 
> They don't have to do that. The default is priority 0. It is the decision
> of the driver author to set the watchdog's restart priority. So it is wrong
> to claim that this would be "a common problem for the watchdog drivers",
> because it isn't. Presumably there was a reason for the driver author
> to select the default priority of 128. If there is a platform which has
> a better means to restart the system, it should select a priority of
> 129 or higher instead of affecting _all_ platforms using the imx watchdog
> to reset the system.
> 
> Sure, you can negotiate that with the driver author, but the default should
> really be to change the priority for less affected platforms.

Yes, looks like there is no common problem for watchdog drivers.
Initially I was recalling that watchdog core uses 128 by default and
typed the message without verifying it. I see now that it's incorrect,
my bad.

EC drivers tend to use higher priority in general. Jonathan, could you
please confirm that NTXEC driver is a more preferable restart method
than the watchdog?
