Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35D449D40
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 21:50:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hp3Ck42LDz3cQZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 07:50:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aZVzW8uI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aZVzW8uI; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hnpwy1915z2ybK;
 Mon,  8 Nov 2021 22:36:48 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id z8so6055780ljz.9;
 Mon, 08 Nov 2021 03:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X+QlLlo/0/3EVdBxA2kw9RSD+7dI68j0akmWtlfHVoc=;
 b=aZVzW8uInA8LU/x+WSDcs8GL423pa/2TbHlNFMZCd9U6UTTINhRxHwWgMG+VIGRFXX
 YHsHS1Zp8SLg7g0I8x9US08hxM80ZghlJabXZBFwbjt/NZTi8D93A6u3DdWQsriGAEMv
 bFmB7LTf3DQwVbSm6WogHRt9oYdTZJJwV6Cdja/STeDW7/10QbzkyuPD5z+/FAuGPwej
 XDOG6vFO/moWThDJAR559rbcfRfK+AgOLrilun42rQLGkujwn1pckpcm4TgSB3WIb1LP
 WWP0u+S7lmnv27N0vKhUH9Av/RJV5C0NJsxi8Lo9cU/Zh/pB4HH/qd8XqYWZNDXsqTHX
 YlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X+QlLlo/0/3EVdBxA2kw9RSD+7dI68j0akmWtlfHVoc=;
 b=S5oH82LbFn09nv2Co2uaAbMurDkHXrpDxEFontqbncndENAlRoOjAArHAGZ1yS+BqN
 E92EJP4pVfEjXoYPgVoA/ltMjT4bQ9yReGN7Rrhb1qg+u9aQy4UxnQYqIPyMBn0Iu+tZ
 1klVZ/GI8ApxTlpJhmpaSiVG1RWOoYBIkDki4PUh66jMzboVuhaPZXTzcNV0JlHdZpha
 uktSJer0uNRw2Bamo6by5KGkq8GAHW6e8NuEJJ16BisiC7uZD0r+15xpDDcoT8nIxYte
 iC3GxZRdsMecH9mR1fYoyvkhYEKqmB78G9nbRddpF0DVNrN96c6eArstz/7Srn22m8iu
 3s2w==
X-Gm-Message-State: AOAM5337BZABqXaqLf5vEBV/qsblbh6GzSGXpgcs1LCKbyhnyl/VxS5Q
 TBI8zbAo9DtQNrTMtviO9vY=
X-Google-Smtp-Source: ABdhPJzzWZ+q13ptoCU5JHKLBozyl2qyG0di7fj7GC0x6tQVXWEZ5utjk3vHuuOVClKYY3WCOwTKiw==
X-Received: by 2002:a2e:bd88:: with SMTP id o8mr69963654ljq.197.1636371404363; 
 Mon, 08 Nov 2021 03:36:44 -0800 (PST)
Received: from [192.168.2.145] (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.googlemail.com with ESMTPSA id q6sm1523591ljh.1.2021.11.08.03.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 03:36:44 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
 <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
 <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
 <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
 <c0b52994-51f5-806b-b07e-3e70d8217ffc@gmail.com> <YYkIeBSCFka9yrqC@latitude>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <04103df3-1ef4-b560-a5cb-fa51737d28ad@gmail.com>
Date: Mon, 8 Nov 2021 14:36:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYkIeBSCFka9yrqC@latitude>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Nov 2021 07:49:14 +1100
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
 linux-ia64@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-omap@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-acpi@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
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

08.11.2021 14:22, Jonathan Neuschäfer пишет:
> On Sun, Nov 07, 2021 at 08:42:33PM +0300, Dmitry Osipenko wrote:
> [...]
>> EC drivers tend to use higher priority in general. Jonathan, could you
>> please confirm that NTXEC driver is a more preferable restart method
>> than the watchdog?
> 
> Yes. The original firmware uses the NTXEC to restart, and it works well,
> so I do think it's preferable.

Thank you, then I'll update the NTXEC patch like this:

https://github.com/grate-driver/linux/commit/22da3d91f1734d9a0ed036220ad4ea28465af988

