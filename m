Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD219460A31
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:12:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Lm857vvz3fBK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:12:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Tdth5Mz9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Tdth5Mz9; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2LbD0chFz2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 08:04:55 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id k23so30650999lje.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 13:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n+c+fNjlqpkODMNA/7ywsu2Xpxn181Yex3QT1BC7YkM=;
 b=Tdth5Mz95ILIP2wZ5DYmwGwqL/g2a8NQfIdIuxgXXVVg6RH3yDMvHbIjMPlUPQ+Kfi
 e7TNCwLl7gW+gWhWCzY5kWF31Q6d3MXbcfyHlK5mTJBCO9B0yoazspZoQ9QauZAg4VOZ
 GU1Du/NMRetIl1HCPpoZ/wmPwFcTZx09G+/z/T3SmJwaMw6FiTLYrkBEti6ebPBTNx4P
 ztESfCaJHpZ8ANbOeJv7E8GcPhKYp2JvSlX4AwC23x/kyRaPVi2WsI1lt1XYwZg48qKe
 Ljtqv2XVdBLjgOpaFjZQzH+Idsti2zOEBowM2JGqBDzv5KQCJSPSnTBTLx3XoGX8clP3
 1rSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n+c+fNjlqpkODMNA/7ywsu2Xpxn181Yex3QT1BC7YkM=;
 b=aQnrvyRzBebv7JoHA+/wFpl7NC+kRhL4PSFQ9wgvmYvPX6jUuMOhVQNt+LU8SmqmqT
 YO//1zTNy6D4wz9egiYWBPXcK9vwrUxSlZ944Lkl/fv0b0JFEDm9IQFKXhbBKjbG19y9
 YFozDKmzT9DYDmnnx+vcuO9WPz6xjB7oE/A62T90LlmyMI6kKfNPIMv+/OxO4pTS+lQM
 N/u546EJlc94Ml7wSDpttoMWXKG1+VkqlFF629VU6gH85crv2KTll5AKcr0XHz5WpH0G
 Mw8S3r90k6V9p/w9bNwQdgZZpe+rzyA6jHRhztvghpVNtvdKeeJw1T48VMUI6JrhS3io
 bTag==
X-Gm-Message-State: AOAM5307s5yQApdZf/GNDW5SbsLlULRAGL4fDyxZ8TqtbVRi90nloiST
 Dt9HZEf9GSQTd8sumogOD+Y=
X-Google-Smtp-Source: ABdhPJyuVlGCEG84pwfg6BbsVNdI4G/2tvLYelnsvUn7CQTQlf25Ym3pMWyWhlfLoQNWZ9AePptWxg==
X-Received: by 2002:a2e:97cb:: with SMTP id m11mr45829799ljj.324.1638133492517; 
 Sun, 28 Nov 2021 13:04:52 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id d30sm1105908lfv.58.2021.11.28.13.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:04:52 -0800 (PST)
Subject: Re: [PATCH v4 22/25] memory: emif: Use kernel_can_power_off()
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-23-digetx@gmail.com> <YaLaH3Yt2M/Gko//@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <98c5c3d3-1635-3a06-b57f-8facd409796a@gmail.com>
Date: Mon, 29 Nov 2021 00:04:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLaH3Yt2M/Gko//@qmqm.qmqm.pl>
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

28.11.2021 04:23, Michał Mirosław пишет:
> On Fri, Nov 26, 2021 at 09:00:58PM +0300, Dmitry Osipenko wrote:
>> Replace legacy pm_power_off with kernel_can_power_off() helper that
>> is aware about chained power-off handlers.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/memory/emif.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
>> index 762d0c0f0716..cab10d5274a0 100644
>> --- a/drivers/memory/emif.c
>> +++ b/drivers/memory/emif.c
>> @@ -630,7 +630,7 @@ static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
>>  		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");
>>  
>>  		/* If we have Power OFF ability, use it, else try restarting */
>> -		if (pm_power_off) {
>> +		if (kernel_can_power_off()) {
>>  			kernel_power_off();
>>  		} else {
>>  			WARN(1, "FIXME: NO pm_power_off!!! trying restart\n");
> 
> BTW, this part of the code seems to be better moved to generic code that
> could replace POWER_OFF request with REBOOT like it is done for reboot()
> syscall.

Not sure that it can be done. Somebody will have to verify that it won't
break all those platform power-off handlers. Better to keep this code
as-is in the context of this patchset.
