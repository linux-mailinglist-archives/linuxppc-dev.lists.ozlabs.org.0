Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A99471E62
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:55:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0NL2CpPz3cbR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:55:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DpLCPmMg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DpLCPmMg; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9g4V5yY6z3bj9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:52:08 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id d10so19696718lfg.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j1hvlB2w2BrWNScbCJyLwX4oBGKG9hr6NJqtvFkNM/U=;
 b=DpLCPmMgrOty3y0HrpqopSxxp/qGs/dwG/CgN0apuyA6on28PorJtUybksa6iWzXUQ
 1nC+svp1ZReaFc8Ho69TZxII0UpyuP8U7xwSjZaJzyMIRrgh64VdMWwWLpT7FD5pRO3K
 REVQTxyYOO3tzHZOXPhjO1pz+wC6sFrKKUXdbaxaG08xMkm/2y6DNn/B8j1qrJKM7+bp
 P06T1NhQFOSTeILIcDdZiYIbm1FILYdO04vFRszXD6zy1FhLrwMPIaNrfLI1p4FempaK
 JIbIyvDEnU7xy4tOpOMAsYn+ngt9JZU69+QjylTYb0y426O41rF96XAtvzhN80gJmNuF
 j5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j1hvlB2w2BrWNScbCJyLwX4oBGKG9hr6NJqtvFkNM/U=;
 b=hEYWKXa24KUe5gAwc3fvb73KAYsDVfxho6LakX1f9QZ4utPnUWRQvSGkHhjGjSeh2U
 NAuHDoCJgyosY/j/1pJcWgjgvUOOd1NKZPSTkOXxrUebU258TX1rjbfiG58JJ1ReVIQo
 Z4QReNGjzg6IWYSWsTsauZLwPewE1gWQh0xZzEUhX8cr2DsBCXpni6Csjjg4cQr824+P
 YfvSyeWvEq7b1YTsnvw/VQHPGK1DP2KWu8Kyku9Ogqr8wCONHDE3j+AQmeYzbvI91k7o
 nwORcfi1TKHCVcldH4AqOUZQUaFbNHrTpdZLUuGYoiMlWMTdwz3D571dZh6JdjTpXytT
 u0/g==
X-Gm-Message-State: AOAM533B3I/6Rpoy5LSJ+7yvHpqTaUyqTUhm3vaIaDVmKgmdSSamaZRi
 rZCpNqkgjHiC7Jzd1fM4i78=
X-Google-Smtp-Source: ABdhPJwwyZAuw0wQQ6Dju/0DgEoENSIDq2aqqR4iP7Vldq5bfh8DtMEIrZOS6poEr19ZPeaYgjpDkg==
X-Received: by 2002:ac2:58d9:: with SMTP id u25mr14351127lfo.514.1639162324540; 
 Fri, 10 Dec 2021 10:52:04 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id c21sm387216lfv.29.2021.12.10.10.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:52:04 -0800 (PST)
Subject: Re: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-4-digetx@gmail.com>
 <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
Date: Fri, 10 Dec 2021 21:52:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
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

10.12.2021 21:19, Rafael J. Wysocki пишет:
...
>> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
>> +               struct notifier_block *n)
>> +{
>> +       unsigned long flags;
>> +       bool ret;
>> +
>> +       spin_lock_irqsave(&nh->lock, flags);
>> +       ret = notifier_has_unique_priority(&nh->head, n);
>> +       spin_unlock_irqrestore(&nh->lock, flags);
> 
> This only works if the caller can prevent new entries from being added
> to the list at this point or if the caller knows that they cannot be
> added for some reason, but the kerneldoc doesn't mention this
> limitation.

I'll update the comment.

..
>> +bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
>> +               struct notifier_block *n)
>> +{
>> +       bool ret;
>> +
>> +       /*
>> +        * This code gets used during boot-up, when task switching is
>> +        * not yet working and interrupts must remain disabled. At such
>> +        * times we must not call down_read().
>> +        */
>> +       if (system_state != SYSTEM_BOOTING)
> 
> No, please don't do this, it makes the whole thing error-prone.

What should I do then?

>> +               down_read(&nh->rwsem);
>> +
>> +       ret = notifier_has_unique_priority(&nh->head, n);
>> +
>> +       if (system_state != SYSTEM_BOOTING)
>> +               up_read(&nh->rwsem);
> 
> And still what if a new entry with a non-unique priority is added to
> the chain at this point?

If entry with a non-unique priority is added after the check, then
obviously it won't be detected. I don't understand the question. These
down/up_read() are the locks that prevent the race, if that's the question.

