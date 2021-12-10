Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CAC471E5B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:52:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0KD3DMLz3cnX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:52:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AqjAg4O7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AqjAg4O7; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9fLv4pTrz2ywR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:19:35 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id m6so7747334lfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EXOlhuwO6PwxX2A+xhcTtBM4hDyUpnAJiexjEXDAvCY=;
 b=AqjAg4O7giyzVdt+tBG9uHdplJtifqxLx/yVu+cgoY6plA3iYDA6wXW+lamp4aSGK0
 JtAw3aPoKL/gydUbbFYOf1pi7KNgtnB7CRHE+MknWMiFR30YU057EAppHMp3RQPfHd8d
 06yVvqsThCCunZ4BRns7COFfMth1pjRjda7taFbydUf0oWJrqvgB05orw4q9ScnuxSKa
 RGrhlOCs187IEnib8HCpTe8JzWEZV9cVroOWHPffKJtOeT7C/Fogm7PG4qgUyWMygMmF
 ds56Fkt5Zck/MXhrzJhxcRgHcy1bwpmNWqyftpmBQa7CL/iiV+9v5OptrusSns2ZXc73
 k16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EXOlhuwO6PwxX2A+xhcTtBM4hDyUpnAJiexjEXDAvCY=;
 b=JerITK+bELFANRtzb5MGJsaPPN0MdkXnd3G88gVss/EkAleJQqy8bOphxAb8t0KOJJ
 nyYOcYWYgX5NzsmhtORXJljcIzMKSNeADdOYq2T+2PSTqWqa2E8TJGc5L99TrX2zl3uu
 lsNdn9kFPFDVgP0WcdFHI56PpIcROqFQa/40KK7EM9IlYO+WxChci8QmV8tMHcLt5Se5
 2rcnd2h19Ldgnof2t3801Eop1E+Q4zrK+BHvf0A6uNd3dvwq7Ufd/ol0yp9GWYPbuQ8+
 IuPK5O/K9tPm34E90ARPq1bFlQcCXBSsblSbILZ4ZwbjTShL6+x8gfvPY7gDKbeSEEf1
 OGPQ==
X-Gm-Message-State: AOAM533r2tAbE7RpB3Dk5RabNH4agfvEuBKRrfWBNF7efHepeiFeA3u6
 UiZ1H4eMu10b/lFrVTejjGk=
X-Google-Smtp-Source: ABdhPJzMrOyS+fXdy9iuUu0OwY3ayky869D80K4hHhkf8whZoWRjpK8Gq06BVfaBtvKTtjzQFmSyrg==
X-Received: by 2002:a05:6512:2603:: with SMTP id
 bt3mr13366040lfb.202.1639160372149; 
 Fri, 10 Dec 2021 10:19:32 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id u16sm379604lfu.42.2021.12.10.10.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:19:31 -0800 (PST)
Subject: Re: [PATCH v4 02/25] notifier: Add
 blocking_notifier_call_chain_is_empty()
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-3-digetx@gmail.com>
 <CAJZ5v0gy5M5yYT7k5CY0JtW4MvsgKq4psBEw81UKz=pjGo0xPw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9307a684-0b0b-0488-75be-7845d9b973a1@gmail.com>
Date: Fri, 10 Dec 2021 21:19:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gy5M5yYT7k5CY0JtW4MvsgKq4psBEw81UKz=pjGo0xPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Dec 2021 09:47:48 +1100
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
 Linux-sh list <linux-sh@vger.kernel.org>,
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
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Lee Jones <lee.jones@linaro.org>, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

10.12.2021 21:14, Rafael J. Wysocki пишет:
> On Fri, Nov 26, 2021 at 7:01 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Add blocking_notifier_call_chain_is_empty() that returns true if call
>> chain is empty.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  include/linux/notifier.h |  2 ++
>>  kernel/notifier.c        | 14 ++++++++++++++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/include/linux/notifier.h b/include/linux/notifier.h
>> index 4b80a815b666..924c9d7c8e73 100644
>> --- a/include/linux/notifier.h
>> +++ b/include/linux/notifier.h
>> @@ -173,6 +173,8 @@ int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
>>  int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
>>                 unsigned long val_up, unsigned long val_down, void *v);
>>
>> +bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
>> +
>>  #define NOTIFY_DONE            0x0000          /* Don't care */
>>  #define NOTIFY_OK              0x0001          /* Suits me */
>>  #define NOTIFY_STOP_MASK       0x8000          /* Don't call further */
>> diff --git a/kernel/notifier.c b/kernel/notifier.c
>> index b8251dc0bc0f..b20cb7b9b1f0 100644
>> --- a/kernel/notifier.c
>> +++ b/kernel/notifier.c
>> @@ -322,6 +322,20 @@ int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
>>  }
>>  EXPORT_SYMBOL_GPL(blocking_notifier_call_chain);
>>
>> +/**
>> + *     blocking_notifier_call_chain_is_empty - Check whether notifier chain is empty
>> + *     @nh: Pointer to head of the blocking notifier chain
>> + *
>> + *     Checks whether notifier chain is empty.
>> + *
>> + *     Returns true is notifier chain is empty, false otherwise.
>> + */
>> +bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
>> +{
>> +       return !rcu_access_pointer(nh->head);
>> +}
>> +EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_is_empty);
> 
> The check is not reliable (racy) without locking, so I wouldn't export
> anything like this to modules.
> 
> At least IMO it should be added along with a user.
> 

I'll remove the export since it's indeed not obvious how other users may
want to use this function.
