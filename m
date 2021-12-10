Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F380471E83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 00:02:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0XD0lH2z3gBm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 10:02:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pA5gJzqp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pA5gJzqp; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9hxy4PMVz2yS3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 07:16:36 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id cf39so7943489lfb.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 12:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3TjXmEXDJ/+bmC4Ps/ax4TtRHBZzHR+/4MLS5Bo5vyY=;
 b=pA5gJzqpb6DuYCThgFEy/8I55Q/DWCaUg3a+PUCGAi7titTHPZavt9HNjzNTaNOdtA
 W9bvYLeTFtb26OuFlSespYNsQjEuRbN74aib6efdQf4sRvk0jZOXEyR7Ry1SlPtvny3V
 dHFm88kS0utx46N/B1V95jCju3EdX/3tioPOW0AUjL07+k8WzDTAaYKBNQJxB0pggImt
 zxKY302IiWihQZ6zPY6n4S1ZYz2akRfe0TTR5ci41YrCJJyH8fb1pqNG9DRsK91AXeR3
 4OlRlbRYehYwacP4ScBqgyVswzojoT/ol0CB6bk5gTERql84YP9I/T1kujCvte5MFcNM
 x95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3TjXmEXDJ/+bmC4Ps/ax4TtRHBZzHR+/4MLS5Bo5vyY=;
 b=GPj1TW/oIOB9Gyg6GiNkSAqP9h3W+rR0fbN+H4jsdJ7YeVNJ12qmzr9XB/UTyDqEUd
 EQBvyRijKVIdAlMjma4faUm3q156nJ9SwIByrQCyiEgZfJcJIhFPIBd0YHDTWDOw0xlN
 RPGjZ63R34qB5nY40Ovm4CRgJIXVhb0xcXEV4OJjJ6+CXAWpQH2JnuCeCJHCRRLvVVQh
 /HkVe2BqgfUz6Th+jICGA2QVodBRrY1M2DafSJ/oVhe+RwdQkEkQ4HTWIRRdphxxoGOx
 NNN+Z8fUWuV2+NkdBezBNQp1RNYbZSprJYuc1GEp/I2+S56kkH25vcQDMwrVVTq2M3mz
 2KXw==
X-Gm-Message-State: AOAM5335J1/jOQrz9H6i8asUVhpfxFzG24jII/lbtyBdhqQwMi7WSTvf
 SRbk4crrDSdfcdXns13Oar0=
X-Google-Smtp-Source: ABdhPJwE5tZeH/HHL0CnlLb6JayzZfWyUFquo/I1vHYJYjJlUN8IQfec3+fnfy4fMkF6dVQvXojbFQ==
X-Received: by 2002:a05:6512:2292:: with SMTP id
 f18mr14265704lfu.18.1639167392050; 
 Fri, 10 Dec 2021 12:16:32 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id z23sm409427ljn.23.2021.12.10.12.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 12:16:31 -0800 (PST)
Subject: Re: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
From: Dmitry Osipenko <digetx@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-4-digetx@gmail.com>
 <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
 <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
 <CAJZ5v0gwnY07vg71_NB8RDWyv84FtMsmx7UTDd8TkUd7vFzc6A@mail.gmail.com>
 <fd158245-aa9a-2e48-0145-004f30005a66@gmail.com>
Message-ID: <218e67e2-1d8c-5727-3862-8884d74aa63e@gmail.com>
Date: Fri, 10 Dec 2021 23:16:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fd158245-aa9a-2e48-0145-004f30005a66@gmail.com>
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

10.12.2021 22:33, Dmitry Osipenko пишет:
>> Not really, they only prevent the race from occurring while
>> notifier_has_unique_priority() is running.
>>
>> If anyone depends on this check for correctness, they need to lock the
>> rwsem, do the check, do the thing depending on the check while holding
>> the rwsem and then release the rwsem.  Otherwise it is racy.
>>
> It's fine that it's a bit "racy" since in the context of this series. We
> always do the check after adding new entry, so it's not a problem.
> 
> There are two options:
> 
> 1. Use blocking_notifier_has_unique_priority() like it's done in this
> patchset. Remove it after all drivers are converted to the new API and
> add blocking_notifier_chain_register_unique().
> 
> 2. Add blocking_notifier_chain_register_unique(), but don't let it fail
> the registration of non-unique entries until all drivers are converted
> to the new API.

There is third, perhaps the best option:

3. Add blocking_notifier_chain_register_unique() and fall back to
blocking_notifier_chain_register() if unique fails, do it until all
drivers are converted to the new API.
