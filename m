Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E739A46151F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 13:32:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2l935y1hz3cmJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 23:32:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MI4kP55/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MI4kP55/; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2kYQ51Gsz2yfZ;
 Mon, 29 Nov 2021 23:04:41 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id bi37so43921054lfb.5;
 Mon, 29 Nov 2021 04:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PNn5ANXHQBQImIpvHbPbNMd2Lqd15EQlJogO89cnByY=;
 b=MI4kP55/Zlm7TBL7y2OrNMI5h+lPZeZmB7t8OlZkmrVqz5nkh2/Y6HuliAe0oVs0Rk
 rFetODlieSY8yYJ/zujS836D4HMa1RwjML/CAxKtomUWXSGb1qL/KVpTn6q2+Uvz6fll
 o53AZuiQAc2GWbWiafTtGZSuw2c5mqIFJqFNiJYF9aTjEDiBqb562eel2zakvhyPlOl3
 pG/pjhw/StA1ckadkeclKZKjMkX16zdmIl6oAlX+4fS7qeRy6PONzcXzKzm9X1QdAno0
 Kkwc07Ys2BvHYPaVq37PhoNg88rbf4eu8IhUwjBo48bGGmIHfJryc8vu/Bws5bIp8Ted
 95RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PNn5ANXHQBQImIpvHbPbNMd2Lqd15EQlJogO89cnByY=;
 b=bj0k5zSU+mibbNQWTcwC+Euy5sAj7LvCIuc02MOTSO3K0pZ/Xn4DfL76YnN48xzrVX
 w6fTeovYVY/jEybyZaWsIASQAL3kfWBIF7I79y/+E0XdbRwbKyDHBcFjoIp35GrPeloJ
 Adb1UDtAeveAbPzu6YzNmo0ufY+vqwoBRFpTmeEpK8nPQFeSKWwB7k2gcRvzTGLFnLtT
 iSItVHw1fqje3okpqvhJB2AwbwJY+eQ+1t+5uc6xC/HsQl0A3iUKw6pnLMsr6Wye90pp
 J+uyBySqJ864oc2XYEmT5IGwNBzGIpHbMVqmktqW5OZCLTG45WtX9ncYoFkChvFXB+jO
 W2/g==
X-Gm-Message-State: AOAM530EZowsDUgZbvDU8uGag53ecF972rGpmnYSSNp4v/EAos1RYH40
 4kM9k+Qn1oJsVGo7wKk1Mm0=
X-Google-Smtp-Source: ABdhPJwfeiycltlybhTj7UKB2JEhJqYEuRYscpRNQomunXBGc+OXGSTBjoVVWr3Sr9Zkv1hFoSwEuA==
X-Received: by 2002:a05:6512:e9c:: with SMTP id
 bi28mr45440847lfb.245.1638187475542; 
 Mon, 29 Nov 2021 04:04:35 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id g12sm1317274lfu.135.2021.11.29.04.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 04:04:34 -0800 (PST)
Subject: Re: [PATCH v2 28/45] mfd: rn5t618: Use devm_register_power_handler()
To: Lee Jones <lee.jones@linaro.org>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-29-digetx@gmail.com> <YaS/lStp2b8GhVxw@google.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <592f2326-b450-1db1-0d3d-804415cf5de6@gmail.com>
Date: Mon, 29 Nov 2021 15:04:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaS/lStp2b8GhVxw@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Nov 2021 23:30:17 +1100
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
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
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
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-omap@vger.kernel.org,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
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

29.11.2021 14:55, Lee Jones пишет:
> On Thu, 28 Oct 2021, Dmitry Osipenko wrote:
> 
>> Use devm_register_power_handler() that replaces global pm_power_off
>> variable and allows to register multiple power-off handlers. It also
>> provides restart-handler support, i.e. all in one API.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/mfd/rn5t618.c | 56 ++++++++++++++++---------------------------
>>  1 file changed, 21 insertions(+), 35 deletions(-)
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 

Thanks you. This and other driver patches will be slightly changed
because the power-handler was renamed to sys-off handler starting with
the v3 of this series, but yours ack still will be valid here.
