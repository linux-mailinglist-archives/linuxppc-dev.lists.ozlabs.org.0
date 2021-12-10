Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE651471E71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 00:00:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0TW57Hnz3fsh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:59:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eZMbcUXJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b;
 helo=mail-lj1-x22b.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eZMbcUXJ; dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9h5k3TlTz300S
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 06:38:18 +1100 (AEDT)
Received: by mail-lj1-x22b.google.com with SMTP id m12so15213795ljj.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 11:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vz91z0+ORqGgdBCzgXjvRZ+BnKWf40l2Uiz2VnVlq8k=;
 b=eZMbcUXJM6JFal7aKwXhI/zy2v2hsv6rjyETVziUEcyYhNcg6LAUN09SVbxxTQlCdu
 48ThdZHjH5oN83Vb3L4mJIfoBjma15qEEhMbLCJ9enFQmERgo4lteVUQPAb4Y8JgOjsq
 7ZmOQ7grPhjGYig7dCgOjLZZBHSDH75bpeiQUz0UkPGOU7rsqJhk71e0rLD6TE0flZ2X
 dazEIm86TjOs0vu1kBQHUAQAqwylSJZ01JBHT6WLG7J/LOnVfkO/7b9CPxeuZ6NJ8BMo
 jKCmkVO9SLg4PsHP720p1V12OBYdWJK0lEqLDpCAuJd3HSFk0stATZ42n3vOpzDj4hRW
 GlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vz91z0+ORqGgdBCzgXjvRZ+BnKWf40l2Uiz2VnVlq8k=;
 b=QpHXQRiN5FztEGu3KICx5BJlt1/LQRNZRNDZr+ZU1fxjso23CzeHdZrDQS3ZMmRJtQ
 2bPHfZUy76qF0C49RxJUc8y3BTCKrtnben+XyCLGyk6OT435faas9txCgOj22rqFtlpH
 YprD4PsL7j61TmbeaoCxWkIupXu+gNEJfJLdo3wVh68tUeXORoGIiFil6oHdgey0e96u
 M7sio890M0n/OfCY2Hc85vECPTQ2ha/obw37itYw5cG5Vk+9uVEgHO4d3Av1C0xKnMdf
 YRxtZql4D9PLdiZP6l4eN0UStpFaNzDHYsgXM6TddNbcVyzUpRLJkHmQMUqN3wmVsgb0
 hImg==
X-Gm-Message-State: AOAM53319A6BR2HiJ8c9yqOqgF/E3uLAx2TSluvox0kxpZlr8SAbJFfx
 xhEGsynql4ziJXZdOoxPZio=
X-Google-Smtp-Source: ABdhPJwmRMsITckKyfKcY5/bceJH9ZYTPTjj0S432HFHTKbLTU9WPpBsAnrN2ZIngDo5MzFGTcTiYQ==
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr14941958ljb.271.1639165089500; 
 Fri, 10 Dec 2021 11:38:09 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id g26sm381590ljn.107.2021.12.10.11.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:38:09 -0800 (PST)
Subject: Re: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler()
 fails
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-7-digetx@gmail.com>
 <CAJZ5v0ii7tGRDbxw+5GqdyONXvRPznXUqBZd03+pdoAd+pH=JQ@mail.gmail.com>
 <c518ce36-09d2-16a3-cec2-6bab8260e3cf@gmail.com>
 <CAJZ5v0iP_VnNW3ChmdvRFg1gvwvkDGmqtGnf1oVwQxXY303RkQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <41415df9-0d08-2944-5cf2-493468e21a22@gmail.com>
Date: Fri, 10 Dec 2021 22:38:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0iP_VnNW3ChmdvRFg1gvwvkDGmqtGnf1oVwQxXY303RkQ@mail.gmail.com>
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

10.12.2021 22:08, Rafael J. Wysocki пишет:
> On Fri, Dec 10, 2021 at 7:54 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 10.12.2021 21:32, Rafael J. Wysocki пишет:
>>> On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> Emit warning if unregister_restart_handler() fails since it never should
>>>> fail. This will ease further API development by catching mistakes early.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  kernel/reboot.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/kernel/reboot.c b/kernel/reboot.c
>>>> index e6659ae329f1..f0e7b9c13f6b 100644
>>>> --- a/kernel/reboot.c
>>>> +++ b/kernel/reboot.c
>>>> @@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
>>>>   */
>>>>  int unregister_restart_handler(struct notifier_block *nb)
>>>>  {
>>>> -       return atomic_notifier_chain_unregister(&restart_handler_list, nb);
>>>> +       return WARN_ON(atomic_notifier_chain_unregister(&restart_handler_list, nb));
>>>
>>> The only reason why it can fail is if the object pointed to by nb is
>>> not in the chain.
>>
>> I had exactly this case where object wasn't in the chain due to a bug
>> and this warning was very helpful.
> 
> During the development.  In production it would be rather annoying.
> 
>>>  Why WARN() about this?  And what about systems with
>>> panic_on_warn set?
>>
>> That warning condition will never happen normally, only when something
>> is seriously wrong.
>>
>> Those systems with panic_on_warn will get what was they asked for.
> 
> They may not be asking for panicking on bugs in the reboot notifier
> code, though.  That's what your change is making them panic on.
> 

Alright, I'll drop the warnings and turn the warning about uniqueness
into error or warning message.
