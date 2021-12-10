Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB67471E80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 00:01:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0Wg5Vrbz3g5f
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 10:01:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V/Owe18b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V/Owe18b; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9hM85VXGz3bXV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 06:49:54 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id b40so19901219lfv.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 11:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Fx2AxGyl7h70TiPIfAS4vLJoC4O4KHoawTu1bt5PLU=;
 b=V/Owe18bjaHxi/q9LMXS8LNROf16L9DCZYGpExoCj+SNTLCiSQNB3HcPLajV/NP5JE
 39hqIvfIb3bc7xrS2E0EYCC3yAPKzLg7BnA0PumFQ89YOCGyLF9Ipz3BTISejc0ZvQJA
 z5FDAeVaX1e2/Z9TFGOO31SRX4KXbVNvKZ2tbYOwQTeu/RyJ9cs6xalps+Kn8iqrggDL
 HFUryH5SPjqHR6nW0F4ENPTnll1o3uJ7tQu3AMV7MUX+qx7nV3LMFjM06jk+Y2dJ7HtP
 J+zk+OszrogiRw5+RRL4W19jTgJEJXo+L0tNHRiDg9ofDsu8gJQpDKtlXAuJgOp4GYiB
 LSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Fx2AxGyl7h70TiPIfAS4vLJoC4O4KHoawTu1bt5PLU=;
 b=mPrD9VIx+6Bh9FRBTm4k1o9PM6MeIrw79WzLCehBJk9uTAIjTF/skgi8oYNb2LS5rc
 f6WIvzjDSWkGroaww27wTfob14iSIB6LRu0Fa7Eo8jhuvL+Qn/BqU+EuRt1lovb8N4MR
 RG2vXBY9jQRqMpHu6Nbxa6+JGrb22/iWdfn+cV72dR6329Z2wNbUc/6D4LC6aMQiGG+/
 nvdOgA0v3FDGCMFyDeXEfFErWKgldxEYwTRQbs7LbZFx/b/bV9TR9txQFJPgQ8VV1TaZ
 sXwFC5BRWD9KtYI4Vtks9SsVqycLB67RjI+hkP0yqs5dveh+3HkuA8Yu4Ey7YVHdbl/+
 oAUQ==
X-Gm-Message-State: AOAM532Oyl5bidO0f3TaIo1E+UrphXNdkClqXdWhVELh6aVxaOl/Bt04
 qrtdpyBFAUEKCYMEC5ukGEQ=
X-Google-Smtp-Source: ABdhPJz32UCAa2RfOn9XCHx2JjAq/5XnkzKJ8mqE0CmU9Bnm8cg96K7fElVvubFW0G/2Bv0vNQ8r/g==
X-Received: by 2002:a05:6512:114a:: with SMTP id
 m10mr14457333lfg.188.1639165790431; 
 Fri, 10 Dec 2021 11:49:50 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id z24sm395757lfh.289.2021.12.10.11.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:49:49 -0800 (PST)
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
From: Dmitry Osipenko <digetx@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com> <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
 <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
 <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
 <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com>
 <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
 <45228c88-4d51-591e-5da5-9ec468e71684@gmail.com>
 <ad6c7d73-e7d3-4901-fd63-ef87eecd39a2@gmail.com>
Message-ID: <7875d10b-0d9b-ca29-668b-630ea3650fd0@gmail.com>
Date: Fri, 10 Dec 2021 22:49:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ad6c7d73-e7d3-4901-fd63-ef87eecd39a2@gmail.com>
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

10.12.2021 22:44, Dmitry Osipenko пишет:
> 10.12.2021 22:42, Dmitry Osipenko пишет:
> ...
>>>> There is no strong requirement for priorities to be unique, the reboot.c
>>>> code will work properly.
>>>
>>> In which case adding the WARN() is not appropriate IMV.
>>>
>>> Also I've looked at the existing code and at least in some cases the
>>> order in which the notifiers run doesn't matter.  I'm not sure what
>>> the purpose of this patch is TBH.
>>
>> The purpose is to let developer know that driver needs to be corrected.
>>
>>>> The potential problem is on the user's side and the warning is intended
>>>> to aid the user.
>>>
>>> Unless somebody has the panic_on_warn mentioned previously set and
>>> really the user need not understand what the WARN() is about.  IOW,
>>> WARN() helps developers, not users.
>>>
>>>> We can make it a strong requirement, but only after converting and
>>>> testing all kernel drivers.
>>>
>>> Right.
>>>
>>>> I'll consider to add patches for that.
>>>
>>> But can you avoid adding more patches to this series?
>>
>> I won't add more patches since such patches can be added only after
>> completion of transition to the new API of the whole kernel.
>>
> 
> Thank you for the review.
> 

I meant you, Rafael, and Michał, just in case :)
