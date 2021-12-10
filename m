Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 986DE471E6A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:59:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0Sm3yZpz3cTG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:59:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kS8TNlYi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kS8TNlYi; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9h0N6rwyz30MC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 06:33:38 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id bi37so19884429lfb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 11:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f67p7hle6233nGxb6/xc+P0FVeEPFRJiI9iN2B4WT58=;
 b=kS8TNlYiN6vyIeYsSnRv3CIueRF7pdxQ8UZE6mOB14p99gTRdCMFnHOR44Z3ji5MiJ
 D03uWCT5igggIgLk+p2yc39IbVlARk1+JEGaNZDdXQzNupiaX8nvnDwM3tNyc59SP0HR
 COvxv+cjl6P+TY6I1M8f+NUOUD7TJTgjbz/0uJ+yLcxHdNhreTMQklx4JM+7jiYJuUv/
 resLJQRarl+ZtO8U6+PT9CFznfJa6MhK2xrna+jAtgpFDFUXFJ1z/3ZkYUzHdjAlQrRG
 I07USXxffxsEm/0A0PVKkY0duuTB1Y6XKt0r4xjJRFk8H0T/57tNUYmytuaRwqLJ7SMF
 vNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f67p7hle6233nGxb6/xc+P0FVeEPFRJiI9iN2B4WT58=;
 b=15EHF086uk1JDDUGqnpB+fDxzZbB/Fwf3KbxslQS9V+tr/k7pdXcHsZXynUFmhgi5F
 CL509CvOmCUKG6cn2qbNQcilFULm+x+VcbnPVMrjJgBOslXHo9FJHrwT+4fO1/et0khD
 aplktBa44sVKDS1upFKSlMHcRQLiJc+JiP4YD7NmU3bSyBsXlHqvj+THR1kDMPrtKnAR
 ub8B1GgKd/moLORfIWPZapy5pVe3tnzFTkQO6Vz4phiiUO7F3+k7pnUgjp0fd5YGJnFa
 +p0A6GP1sWb8sB84lYGoKObizXSjnStXCQZZk2XoXhj7V6uFkhV9gy++9EOmPFemxngN
 +kFQ==
X-Gm-Message-State: AOAM53245/1nVlERXryZVjXiDNesE07wRkoR1SWWjxOvcHsLi6Q6h5o7
 n8R8GgidgAQjrgeJJE3wrVM=
X-Google-Smtp-Source: ABdhPJw47o96fQpbRseSJ19MnRQSW7xcHQNSX+uqiAcRJr+V49fJkk5gdmPL9j60fMnbKKwiMUD2ZA==
X-Received: by 2002:a05:6512:6e:: with SMTP id
 i14mr15149045lfo.488.1639164814789; 
 Fri, 10 Dec 2021 11:33:34 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id v23sm394184lji.79.2021.12.10.11.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:33:34 -0800 (PST)
Subject: Re: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-4-digetx@gmail.com>
 <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
 <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
 <CAJZ5v0gwnY07vg71_NB8RDWyv84FtMsmx7UTDd8TkUd7vFzc6A@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fd158245-aa9a-2e48-0145-004f30005a66@gmail.com>
Date: Fri, 10 Dec 2021 22:33:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gwnY07vg71_NB8RDWyv84FtMsmx7UTDd8TkUd7vFzc6A@mail.gmail.com>
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

10.12.2021 22:05, Rafael J. Wysocki пишет:
> On Fri, Dec 10, 2021 at 7:52 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 10.12.2021 21:19, Rafael J. Wysocki пишет:
>> ...
>>>> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
>>>> +               struct notifier_block *n)
>>>> +{
>>>> +       unsigned long flags;
>>>> +       bool ret;
>>>> +
>>>> +       spin_lock_irqsave(&nh->lock, flags);
>>>> +       ret = notifier_has_unique_priority(&nh->head, n);
>>>> +       spin_unlock_irqrestore(&nh->lock, flags);
>>>
>>> This only works if the caller can prevent new entries from being added
>>> to the list at this point or if the caller knows that they cannot be
>>> added for some reason, but the kerneldoc doesn't mention this
>>> limitation.
>>
>> I'll update the comment.
>>
>> ..
>>>> +bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
>>>> +               struct notifier_block *n)
>>>> +{
>>>> +       bool ret;
>>>> +
>>>> +       /*
>>>> +        * This code gets used during boot-up, when task switching is
>>>> +        * not yet working and interrupts must remain disabled. At such
>>>> +        * times we must not call down_read().
>>>> +        */
>>>> +       if (system_state != SYSTEM_BOOTING)
>>>
>>> No, please don't do this, it makes the whole thing error-prone.
>>
>> What should I do then?
> 
> First of all, do you know of any users who may want to call this
> during early initialization?  If so, then why may they want to do
> that?

I'll need to carefully review all those dozens of platform restart
handlers to answer this question.

> Depending on the above, I would consider adding a special mechanism for them.

Please notice that every blocking_notifier_*() function has this
SYSTEM_BOOTING check, it's not my invention. Notifier API needs to be
generic.

>>>> +               down_read(&nh->rwsem);
>>>> +
>>>> +       ret = notifier_has_unique_priority(&nh->head, n);
>>>> +
>>>> +       if (system_state != SYSTEM_BOOTING)
>>>> +               up_read(&nh->rwsem);
>>>
>>> And still what if a new entry with a non-unique priority is added to
>>> the chain at this point?
>>
>> If entry with a non-unique priority is added after the check, then
>> obviously it won't be detected.
> 
> Why isn't this a problem?>> I don't understand the question. These
>> down/up_read() are the locks that prevent the race, if that's the question.
> 
> Not really, they only prevent the race from occurring while
> notifier_has_unique_priority() is running.
> 
> If anyone depends on this check for correctness, they need to lock the
> rwsem, do the check, do the thing depending on the check while holding
> the rwsem and then release the rwsem.  Otherwise it is racy.
> 

It's fine that it's a bit "racy" since in the context of this series. We
always do the check after adding new entry, so it's not a problem.

There are two options:

1. Use blocking_notifier_has_unique_priority() like it's done in this
patchset. Remove it after all drivers are converted to the new API and
add blocking_notifier_chain_register_unique().

2. Add blocking_notifier_chain_register_unique(), but don't let it fail
the registration of non-unique entries until all drivers are converted
to the new API.
