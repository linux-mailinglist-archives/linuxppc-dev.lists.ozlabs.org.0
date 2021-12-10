Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C36D7471E5A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:52:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0JT4k4Mz3dtT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:52:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G0qTQ3KG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=G0qTQ3KG; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9fGs4rXHz2yp0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:16:03 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id l22so19517232lfg.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bcvtGiLbR5hJWeiVCch89vaOnPBEjfgkGhnDVgGToIE=;
 b=G0qTQ3KGFrwps8qADsCL0qK6agYLp7ivalOB/mF7ukTMqKqODRUNPClBA+tjj958iZ
 zDP5ALcBXKrVg0xx9H2ws3hyb3r6CIVdqsbS/GVCsvrWbnNO0HGlLBE864udH5VLQpzA
 E4ZCGQvWrQ3sm3YxkToWB7AGuZSE/qHZ86M8KsEpcZTMCU4IFoRlulk9U2f7fjt0DgcE
 dievaYp3/3GIUU6nMVScS6FhLqdlOsaTCJ8+eRNM/gp2aIGsGid35kag1Oq9XwyLJEZe
 Lsdj6NoONSIfbrp21Zrfz1ZI08pSDTMKtV8ZG3ySXOqe/j3lBC+KMsiD//GTJ5tyuvfx
 eTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bcvtGiLbR5hJWeiVCch89vaOnPBEjfgkGhnDVgGToIE=;
 b=wSE3L9UZuLyUun9bRdT4kZaZLecA9roWxmi8+lopL0+Ujprq3awSqrJ3Ml/EO0YXGR
 MvlkCuddlL+oxowjqpNNm775KHiK8001H/stKMtNNVCFgvNNkys4xR/ghqHCN1GtNQxK
 wQlXjt+viA2LMgbuNRz7qLyAaB6hBh2Fy0Uf/K6xWQ3ioaU330injVW25RuYQR23LF7f
 Bp8+EFGW7li7MjBE2EonkFJpMIRnUz1jSL6sdEKdYLITs0Dq84U1drEWk0ITsq1/65zR
 jgskmQOTyRLxlXmlKSmpywlq4cMpqcL9ClvjLrJU1fT2NcfESM9jX8kyoE2lw6AhFzJz
 Rv8g==
X-Gm-Message-State: AOAM531RI0JAEZBRAcT2giHX+mNTZkYXErtQQObAhCKv5r8VgXfYOIX5
 d7tEkinIpiYHrMutPerOFX5QzVWHOPA=
X-Google-Smtp-Source: ABdhPJwR/4XeF0n78EyaU8daj5gqPU1YI5WhyixXiCZ/1XxnYO6fYoSxPShwkvEp5UZp5BYd303wDQ==
X-Received: by 2002:a05:6512:40b:: with SMTP id
 u11mr13847699lfk.377.1639160159550; 
 Fri, 10 Dec 2021 10:15:59 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id q15sm379095lfp.32.2021.12.10.10.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:15:59 -0800 (PST)
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-8-digetx@gmail.com>
 <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
Date: Fri, 10 Dec 2021 21:15:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
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

10.12.2021 21:09, Rafael J. Wysocki пишет:
> On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> There is no need to annotate function prototypes with 'extern', it makes
>> code less readable. Remove unnecessary annotations from <reboot.h>.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> I'm not sure that this is really useful.
> 
> Personally, I tend to respect the existing conventions like this.
> 
> Surely, this change is not required for the rest of the series to work.

Problem that such things start to spread all over the kernel with a
copy-paste approach if there is nobody to clean up the code.

This is not a common convention and sometimes it's getting corrected [1].

[1] https://git.kernel.org/linus/6d7434931
