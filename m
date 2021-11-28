Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060D7460A30
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2LlN5yHRz3f8N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:12:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D7axuJW5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=D7axuJW5; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2LZX53pBz2xWx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 08:04:19 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id 207so30520153ljf.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 13:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wtn5Hkee5e4Yh99ylBrB3oNbIRTQMbXx6i2LcHRuAAA=;
 b=D7axuJW5K4soTW7ePg2XEY/iNxftObXK2r+AyGGcLpSZUVVVDeOdARXPvJKsrnTiWz
 AoAXcXPY5kZDAFmNd2VORgyu8fNJK2h3Akf7Z4wOIV4j7hl4k+Lg94oWKvPyZvxvLsrU
 gHjqykqz9pVTUOOpARf13AebW7syYSoupun9EMn0XvrUZckKr/LqJa+4eSWKEzDWJLdo
 K7OPzWs09+Av5yHcfZj3Q7MZQ+BDltCGiVFFVwhBt7T15YiSiT0WAJ3uiNnPq9pF4dyU
 I8pWXsXnC3XNCL+7zY4D1T6JR7EW9moTsiVuNSfEmpW1ojxHFbjsYoYQXbcJq5XV5+Um
 iPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wtn5Hkee5e4Yh99ylBrB3oNbIRTQMbXx6i2LcHRuAAA=;
 b=V7r4n3G2DEUlYNdk0cl0gqlOf/oOiyr5vToikzqrNZKd3QWHAyzvyUy0KZspyfBwZG
 Unj9dZH5A3U2HPQmE2UtzRH6rxVnWjxiBb2MCJFnurRMKv1pZJg6R8rLFst4bev3xLTH
 s6Vk2lpgrJh7O5SsgUkcRVGY823XFwDqoN+1QzWzuyBcolh7ofkbwewyL7kPjbcIBeLV
 bZrB85CUN3KPiBEn5jjgFb+qpFRVX6A/jsPtgAiZe1ZUDdiIGHfdgWdQ3GjW9W5JGX61
 rqkcP4LBXRe8zP4UNhas+BxU/TmrxWmK8+kB+hOUDRY+WVAnTAD/aJtv93s3Yoby5rjN
 B67Q==
X-Gm-Message-State: AOAM5306/eWQvgkhlAj7KQD1JYKoxEbppyhzmsa2dc1VevDymsmZ0Gi3
 BPCWCxlctdbOiGpGkI5zsj0=
X-Google-Smtp-Source: ABdhPJxH7knkFdz7TFpFlawyIdB41srtPJMqsrOfzCPJDLK6AlWk3m8N6okcECoeJRZyDtP9PR9VhQ==
X-Received: by 2002:a05:651c:1257:: with SMTP id
 h23mr44458754ljh.17.1638133451873; 
 Sun, 28 Nov 2021 13:04:11 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id c17sm1100736lfr.235.2021.11.28.13.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:04:11 -0800 (PST)
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com> <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
Date: Mon, 29 Nov 2021 00:04:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Nov 2021 08:05:26 +1100
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

28.11.2021 03:43, Michał Mirosław пишет:
> On Fri, Nov 26, 2021 at 09:00:44PM +0300, Dmitry Osipenko wrote:
>> SoC platforms often have multiple ways of how to perform system's
>> power-off and restart operations. Meanwhile today's kernel is limited to
>> a single option. Add combined power-off+restart handler call chain API,
>> which is inspired by the restart API. The new API provides both power-off
>> and restart functionality.
>>
>> The old pm_power_off method will be kept around till all users are
>> converted to the new API.
>>
>> Current restart API will be replaced by the new unified API since
>> new API is its superset. The restart functionality of the sys-off handler
>> API is built upon the existing restart-notifier APIs.
>>
>> In order to ease conversion to the new API, convenient helpers are added
>> for the common use-cases. They will reduce amount of boilerplate code and
>> remove global variables. These helpers preserve old behaviour for cases
>> where only one power-off handler is expected, this is what all existing
>> drivers want, and thus, they could be easily converted to the new API.
>> Users of the new API should explicitly enable power-off chaining by
>> setting corresponding flag of the power_handler structure.
> [...]
> 
> Hi,
> 
> A general question: do we really need three distinct chains for this?

Hello Michał,

At minimum this makes code easier to follow.

> Can't there be only one that chain of callbacks that get a stage
> (RESTART_PREPARE, RESTART, POWER_OFF_PREPARE, POWER_OFF) and can ignore
> them at will? Calling through POWER_OFF_PREPARE would also return
> whether that POWER_OFF is possible (for kernel_can_power_off()).

I'm having trouble with parsing this comment. Could you please try to
rephrase it? I don't see how you could check whether power-off handler
is available if you'll mix all handlers together.

> I would also split this patch into preparation cleanups (like wrapping
> pm_power_off call with a function) and adding the notifier-based
> implementation.

What's the benefit of this split up will be? Are you suggesting that it
will ease reviewing of this patch or something else?
