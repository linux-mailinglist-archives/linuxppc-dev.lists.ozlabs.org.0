Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C87471E79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 00:00:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0VC5Hk3z3fxK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 10:00:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OX0KzgQU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OX0KzgQU; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9hBz49Z9z3c69
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 06:42:49 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id z8so15202006ljz.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 11:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=enFW8kq8VV/q8dA9a71dgatcJTVb3G9Q0VbIAiUg3GI=;
 b=OX0KzgQUdES/90pWlhpcoFWULe5/02wjF+ZN5bPPd3PaEe6K8Rw2QbmG+hYBDryF8r
 t1f6EkNRPieboSxPtviSTR/1V4y4Mr8zIstzUICcEoY48eKM2+0m88Bup+wVJuu+v7rM
 mwIk5EqSpZDyoTDNu1aQivf7cqdLiwt7kJ7MYsCU49jLtqsBENUcVljNfz8djr77JsJw
 nEuxWBBZFJueyYpPkJsYZuSAKA0Qf9vITcyimaXwItLwdGCf5tFbJFT6C3clmEwXp7kg
 1TFGkI4NdX0eDs8czP/NCn+FzZ3eaPKoluKA8KfWOjMbGdEYGco1sgCURxizjwPPW+3Z
 YGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=enFW8kq8VV/q8dA9a71dgatcJTVb3G9Q0VbIAiUg3GI=;
 b=epoRTNGYGNuspyr+w3V8Q7zB8twOv+aBELsoTIPiSxBR1egW08SbpqOTeozO0d+AIV
 fuHOHJEcHvKbCouxIJKqL72uTY8ukQTBjB43WxLUhY7bCUkaNWDzhtlsFgSfUHAmgZ5P
 +zoDkCRVZ4fD80OUIGheZtF1S6H6sp1e/TqOlwN5C00zulIFhgCps93GrU62Pgtwc1D4
 yV/a/hNgI3bBCCEyRQophHaNbvqnchw0Y/otu98GI5m9gbzQOKsw8MJQv3Hw0WX7P7ED
 peQuV4zlmLZeDBsNzhG4D3wK+29JVh+Ua2biqzbliCFG/Y072tZZTrHhLauCmI9LM9pR
 nuew==
X-Gm-Message-State: AOAM532pgkzJYZSP6vmHbYia5Msh9hLIWBq+jr61Xe6Lo6+zMuwCvTkD
 EBd83vOXOgqwvBJJ7vZgQIQ=
X-Google-Smtp-Source: ABdhPJw7x5EmEcRpJsG2MrtTa2zjfPAYa0CkU29XHMHibYlDXJBMyWndjSh2p83fU9klfOOOmpp/mQ==
X-Received: by 2002:a2e:9003:: with SMTP id h3mr15096538ljg.68.1639165365371; 
 Fri, 10 Dec 2021 11:42:45 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id a24sm397890ljd.25.2021.12.10.11.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:42:45 -0800 (PST)
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com> <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
 <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
 <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
 <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com>
 <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <45228c88-4d51-591e-5da5-9ec468e71684@gmail.com>
Date: Fri, 10 Dec 2021 22:42:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
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
 Catalin Marinas <catalin.marinas@arm.com>,
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
 xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
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

10.12.2021 22:14, Rafael J. Wysocki пишет:
> On Fri, Dec 10, 2021 at 8:04 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 10.12.2021 21:27, Rafael J. Wysocki пишет:
>>> On Mon, Nov 29, 2021 at 12:34 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> 29.11.2021 03:26, Michał Mirosław пишет:
>>>>> On Mon, Nov 29, 2021 at 12:06:19AM +0300, Dmitry Osipenko wrote:
>>>>>> 28.11.2021 03:28, Michał Mirosław пишет:
>>>>>>> On Fri, Nov 26, 2021 at 09:00:41PM +0300, Dmitry Osipenko wrote:
>>>>>>>> Add sanity check which ensures that there are no two restart handlers
>>>>>>>> registered with the same priority. Normally it's a direct sign of a
>>>>>>>> problem if two handlers use the same priority.
>>>>>>>
>>>>>>> The patch doesn't ensure the property that there are no duplicated-priority
>>>>>>> entries on the chain.
>>>>>>
>>>>>> It's not the exact point of this patch.
>>>>>>
>>>>>>> I'd rather see a atomic_notifier_chain_register_unique() that returns
>>>>>>> -EBUSY or something istead of adding an entry with duplicate priority.
>>>>>>> That way it would need only one list traversal unless you want to
>>>>>>> register the duplicate anyway (then you would call the older
>>>>>>> atomic_notifier_chain_register() after reporting the error).
>>>>>>
>>>>>> The point of this patch is to warn developers about the problem that
>>>>>> needs to be fixed. We already have such troubling drivers in mainline.
>>>>>>
>>>>>> It's not critical to register different handlers with a duplicated
>>>>>> priorities, but such cases really need to be corrected. We shouldn't
>>>>>> break users' machines during transition to the new API, meanwhile
>>>>>> developers should take action of fixing theirs drivers.
>>>>>>
>>>>>>> (Or you could return > 0 when a duplicate is registered in
>>>>>>> atomic_notifier_chain_register() if the callers are prepared
>>>>>>> for that. I don't really like this way, though.)
>>>>>>
>>>>>> I had a similar thought at some point before and decided that I'm not in
>>>>>> favor of this approach. It's nicer to have a dedicated function that
>>>>>> verifies the uniqueness, IMO.
>>>>>
>>>>> I don't like the part that it traverses the list second time to check
>>>>> the uniqueness. But actually you could avoid that if
>>>>> notifier_chain_register() would always add equal-priority entries in
>>>>> reverse order:
>>>>>
>>>>>  static int notifier_chain_register(struct notifier_block **nl,
>>>>>               struct notifier_block *n)
>>>>>  {
>>>>>       while ((*nl) != NULL) {
>>>>>               if (unlikely((*nl) == n)) {
>>>>>                       WARN(1, "double register detected");
>>>>>                       return 0;
>>>>>               }
>>>>> -             if (n->priority > (*nl)->priority)
>>>>> +             if (n->priority >= (*nl)->priority)
>>>>>                       break;
>>>>>               nl = &((*nl)->next);
>>>>>       }
>>>>>       n->next = *nl;
>>>>>       rcu_assign_pointer(*nl, n);
>>>>>       return 0;
>>>>>  }
>>>>>
>>>>> Then the check for uniqueness after adding would be:
>>>>>
>>>>>  WARN(nb->next && nb->priority == nb->next->priority);
>>>>
>>>> We can't just change the registration order because invocation order of
>>>> the call chain depends on the registration order
>>>
>>> It doesn't if unique priorities are required and isn't that what you want?
>>>
>>>> and some of current
>>>> users may rely on that order. I'm pretty sure that changing the order
>>>> will have unfortunate consequences.
>>>
>>> Well, the WARN() doesn't help much then.
>>>
>>> Either you can make all of the users register with unique priorities,
>>> and then you can make the registration reject non-unique ones, or you
>>> cannot assume them to be unique.
>>
>> There is no strong requirement for priorities to be unique, the reboot.c
>> code will work properly.
> 
> In which case adding the WARN() is not appropriate IMV.
> 
> Also I've looked at the existing code and at least in some cases the
> order in which the notifiers run doesn't matter.  I'm not sure what
> the purpose of this patch is TBH.

The purpose is to let developer know that driver needs to be corrected.

>> The potential problem is on the user's side and the warning is intended
>> to aid the user.
> 
> Unless somebody has the panic_on_warn mentioned previously set and
> really the user need not understand what the WARN() is about.  IOW,
> WARN() helps developers, not users.
> 
>> We can make it a strong requirement, but only after converting and
>> testing all kernel drivers.
> 
> Right.
> 
>> I'll consider to add patches for that.
> 
> But can you avoid adding more patches to this series?

I won't add more patches since such patches can be added only after
completion of transition to the new API of the whole kernel.
