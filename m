Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A682144CB57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 22:36:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqJ7v4wp4z2yfm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 08:36:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lD15/Vjq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lD15/Vjq; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq5X95bxRz2xCG;
 Thu, 11 Nov 2021 00:38:15 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id p16so6110310lfa.2;
 Wed, 10 Nov 2021 05:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WtBceGsuNkvJWXKObFPMz3/faWDyi74JI/F+pRXLbvs=;
 b=lD15/VjqUInHM3dZidzqbDMtU49DALHBS4Ay1C40nUi5lxcF7BMQ5EnHXXzG4e6Wu9
 KEtaN/+P0k1Njtg3ToWP1/KM8wIXtXfb2GMI1jVOw30JDescBKoGZyWGQkHaeFFMF1Cx
 557WfM+CudsCe0rfY4tn9Qu/fZ6FXK7hdk9Wu9dTaZ71QukQt6Mf26SjkHrJIeq+MupJ
 /vckqogxswS5UmhYqlk9vNHYa1S8ChRuc7OrOB+B+82hPJEZwrpCBIceX5S6KM+5NMWF
 FSm1MYMPHMKiWtHmf2u4gxwpqn+oAaxX8rT7fWDE5HDvTnS5+IytbAjE77fEnTdMp1QG
 4sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WtBceGsuNkvJWXKObFPMz3/faWDyi74JI/F+pRXLbvs=;
 b=vE7CEUEkioGMWDnpxnrl8ts2TtZT9gPmFxJdqsVvbPFSVAZjMxYtSMnON9Uckyh3DS
 P3Ae456fDjTsm5oxkfVCIMMngMEvHqfU+tUNIA5QciQw161CpAPrFkctQQ+XPVeT7GFS
 JcCFyH/PPGk5X4H2apxMxByFciY181j4MHsyq0MtUW8CSifEiX2pvF2xcxAwMPhoZLF9
 J19eMRePg96xaNFNIZm+HNhXNilOqXiAsuj+jokNHlVmbmI6AD0iNepPt+VBC+7kP6gk
 EtzfmE3ymbm7Ea7Uefs7AW4HP0Wh77UugMPAmeIUR6QrJAlIftg3Au6SkFNUsSqoVjEs
 /O5Q==
X-Gm-Message-State: AOAM5302G/dQOrxm23FgTwM4NDfN2E8K63Mx2xou/WO9GG/k2qIaGc4m
 su+RMRT8mea0gWOXVzOLsAg=
X-Google-Smtp-Source: ABdhPJxBHb2JNLIS70NEJi27Oqj8IHGODoK0u1oyS1uV5awJ6mpkyMTiHwL65DF0nZiuWJMJYZ6aSw==
X-Received: by 2002:a05:6512:c02:: with SMTP id
 z2mr14599668lfu.445.1636551490068; 
 Wed, 10 Nov 2021 05:38:10 -0800 (PST)
Received: from [192.168.2.145] (79-139-177-117.dynamic.spd-mgts.ru.
 [79.139.177.117])
 by smtp.googlemail.com with ESMTPSA id z25sm60391lja.99.2021.11.10.05.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 05:38:09 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
 <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
 <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
 <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
 <c0b52994-51f5-806b-b07e-3e70d8217ffc@gmail.com> <YYkIeBSCFka9yrqC@latitude>
 <04103df3-1ef4-b560-a5cb-fa51737d28ad@gmail.com> <YYuia9KFdi+ETT+I@latitude>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ceefc854-5d15-b73c-0135-c1cbbbb473b7@gmail.com>
Date: Wed, 10 Nov 2021 16:38:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYuia9KFdi+ETT+I@latitude>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Nov 2021 08:35:52 +1100
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

10.11.2021 13:43, Jonathan Neuschäfer пишет:
> On Mon, Nov 08, 2021 at 02:36:42PM +0300, Dmitry Osipenko wrote:
>> 08.11.2021 14:22, Jonathan Neuschäfer пишет:
>>> On Sun, Nov 07, 2021 at 08:42:33PM +0300, Dmitry Osipenko wrote:
>>> [...]
>>>> EC drivers tend to use higher priority in general. Jonathan, could you
>>>> please confirm that NTXEC driver is a more preferable restart method
>>>> than the watchdog?
>>>
>>> Yes. The original firmware uses the NTXEC to restart, and it works well,
>>> so I do think it's preferable.
>>
>> Thank you, then I'll update the NTXEC patch like this:
>>
>> https://github.com/grate-driver/linux/commit/22da3d91f1734d9a0ed036220ad4ea28465af988
> 
> I tested again, but sys_off_handler_reboot called a bogus pointer
> (probably reboot_prepare_cb). I think it was left uninitialized in
> ntxec_probe, which uses devm_kmalloc. I guess we could switch it to
> devm_kzalloc:
> 
> diff --git a/drivers/mfd/ntxec.c b/drivers/mfd/ntxec.c
> index 1f55dfce14308..30364beb4b1d0 100644
> --- a/drivers/mfd/ntxec.c
> +++ b/drivers/mfd/ntxec.c
> @@ -144,7 +144,7 @@ static int ntxec_probe(struct i2c_client *client)
>  	const struct mfd_cell *subdevs;
>  	size_t n_subdevs;
>  
> -	ec = devm_kmalloc(&client->dev, sizeof(*ec), GFP_KERNEL);
> +	ec = devm_kzalloc(&client->dev, sizeof(*ec), GFP_KERNEL);
>  	if (!ec)
>  		return -ENOMEM;
>  
> 
> 
> With that done, it works flawlessly.

Good catch, thank you! I'll correct this patch and add yours t-b.

