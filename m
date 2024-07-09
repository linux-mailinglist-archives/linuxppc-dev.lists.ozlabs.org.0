Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB592B9DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 14:46:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nqjy4LeK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJLMr3ZYXz3dLs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 22:46:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nqjy4LeK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com; envelope-from=coelacanthushex@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJLM71cqRz30Wf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 22:45:53 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1fb05ac6b77so26595225ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2024 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720529151; x=1721133951; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PTkMABYzGdhSQd9C4loTDYzycJLf8ODZaPM06fmE3pI=;
        b=nqjy4LeKWXHwUXLlMoELkRkAPW49wwCRJAhevxranKD8LnnqhA5EwkKqKjvt8fx9Ba
         ei5HO23I5D8W0fm6v8SLg0g9KgBgygjjjJ3lsb6527QZ/p8sqbXUevkQfEomME9HZTnU
         /BTI1qXbyS0y1dOiqpHiwu4OclAw4xuoA8vkxhud0tpNjRbO86zWHH7t3irv321+HcMu
         CJP1Y935+Bxm7TRFBjc5J0VdqhaApDOra3gjDPHe2kTIsiNHrvqfBfQWMTmGmy5pXjSi
         j7ql4vQqMDjy82tCZeU+xmIC1JcIl+RFOcgS8Z9JMuWd12Nsa21s7GGPSRCq41oA7t3W
         GsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720529151; x=1721133951;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTkMABYzGdhSQd9C4loTDYzycJLf8ODZaPM06fmE3pI=;
        b=vtw5XGC6BzIAN7hDHjVjygSENzkYsWlRUaLQ6X3+9Cl3bFpL++aT+PRmGo/3luZa2N
         SgHCJgj6UM9sOTShULjsBSwNK6bayySmt82uZxzuXNl19u3UD4o15YSfIf0wYbcAT85/
         2XiQMRr1jI8mn0XWTj2nNckn32TyOsWM5QYtIaa+lhu5HEZUcAqKwQYQw1PYNl10Tcrm
         lpm2dgSQYbs2yqc7GncDej/+nhajMmH7XE2GERx9pZGonUb6xzuumpoeE2nSPLL7xZNM
         BS84OwUG2YVLygiq7/n6qTb/0M6ROMHO6wcRfc2X+gNXExdjgwr4asQi9lPrOlgwKAQH
         MfZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9ryJn/tcPEN0Y/QPhUMLLaCkDe2/CKIF1E5qGJXbjEjxgr4vrOMfh3GaCpLE9NcV2Ldfp4dB4IBtY0JvF9O4bwRhtZNmGNmwfxaf1oA==
X-Gm-Message-State: AOJu0YzGBvuE9ge+vCxd3KhcGmXCEuggK35qt4HAAvelACvkQDWxCnSA
	hu0oSn6DtILE8UmoWCKzsHSJxw0dqvMlAan2VaAf38SyxHGix41w
X-Google-Smtp-Source: AGHT+IFOaJNRaCw0x5duAR8ySF29N2zLhsw5jMvf8ySrYnWHRx3vmy5Ah54KY0oG4A60mrkmNodEQw==
X-Received: by 2002:a05:6a20:734b:b0:1be:caf6:66e5 with SMTP id adf61e73a8af0-1c29820d407mr2618980637.6.1720529150564;
        Tue, 09 Jul 2024 05:45:50 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6acf9a3sm15241475ad.255.2024.07.09.05.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 05:45:49 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <44535d2d-c95d-4673-b845-032669cf7abf@gmail.com>
Date: Tue, 9 Jul 2024 20:45:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2855/tegra/omap2plus
To: Stefan Wahren <wahrenst@gmx.net>, Kevin Hilman <khilman@kernel.org>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
 <20240530111947.549474-14-CoelacanthusHex@gmail.com>
 <7hv81f78cy.fsf@baylibre.com> <6b7cfe69-4f72-490f-8e86-5343bd244a2d@gmx.net>
Content-Language: en-GB-large
In-Reply-To: <6b7cfe69-4f72-490f-8e86-5343bd244a2d@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Rich Felker <dalias@libc.org>, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Palmer Dabbelt <palmer@rivosinc.com>, linux-mips@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, Sven Joachim <svenjoac@gmx.de>, Mykola Lysenko <mykolal@fb.com>, =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory CLEMENT <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, linux-rpi-kernel@lists.infradead.org, Lennart Poettering <lennart@poettering.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2024-07-09 20:26, Stefan Wahren wrote:
> Hi Celeste,
> 
> there is a typo in the subject line
> 
> s/bcm2855/bcm2835

Will be included in next version.

> 
> Am 09.07.24 um 01:49 schrieb Kevin Hilman:
>> Celeste Liu <coelacanthushex@gmail.com> writes:
>>
>>> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
>>> with systemd") said it's because of recommendation from systemd. But
>>> systemd changed their recommendation later.[1]
>>>
>>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>>> needs an RT budget assigned, otherwise the processes in it will not be able to
>>> get RT at all. The problem with RT group scheduling is that it requires the
>>> budget assigned but there's no way we could assign a default budget, since the
>>> values to assign are both upper and lower time limits, are absolute, and need to
>>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>>> with values that would work by default in the general case.[2]
>>>
>>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>>> can only be enabled when all RT processes are in the root cgroup. But it will
>>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>>
>>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>>> support it.
>>>
>>> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
>>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>>>
>>> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
>>> ---
>>>   arch/arm/configs/bcm2835_defconfig   | 1 -
>>>   arch/arm/configs/omap2plus_defconfig | 1 -
>>>   arch/arm/configs/tegra_defconfig     | 1 -
>> For omap2plus_defconfig:
>>
>> Acked-by: Kevin Hilman <khilman@baylibre.com>
>>
>>
> For bcm2835_defconfig:
> 
> Tested-by: Stefan Wahren <wahrenst@gmx.net>

