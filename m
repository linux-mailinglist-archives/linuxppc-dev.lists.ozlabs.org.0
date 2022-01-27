Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDB49EDB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 22:46:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlDgN1jCCz3bbg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 08:46:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BHb2Xn1j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BHb2Xn1j; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl3Bz6Blzz3bNs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 01:39:37 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id bu18so5762746lfb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 06:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XkYKE/mqIw+ZogEPzGoXmtOQI8nkKTmA4V70TLbVWS4=;
 b=BHb2Xn1jq66/9MHahrzGm/gWUKtVbh/58wKW18vGWzni3fO5qyqP4VG1OOnOie8Jsh
 gDERoDSbSutwAXYx2C5vNn4TrrwM4BpgdHcNKbywEL+R5MYLhL5n2nGGvdHyYC3+WdiR
 AH7kOLTk/zgQKoF333ryAx/KFlOhDG6pX/tZk4LwhLgv5peCfB01DtWBVE+9RHO5Zn9/
 GlTTQk4e9TGZCrINPfliTtlCZdTAH9LmWOb+qXQAmfLULPmn+Omh2L6j2NgulGAPM/A+
 p0mPzTS/Ny1WZgGK/AicqnPTN5Ub7NU4t23e3Ka67Gnz7TG7Nyg0lXeqh7s3FoDGgrJx
 11/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XkYKE/mqIw+ZogEPzGoXmtOQI8nkKTmA4V70TLbVWS4=;
 b=SBu57AHO3ughvXD4vpXY+GpY9T/O8b1S7ibAvBb8lR1Wnx8ylhk1ESu3lI9+SmWkMp
 HPkxbL2WfKKSV2EttLjGgrbh3noBAhnQrVtMG7F5Hvo4Yh5iAbXYRBvj6eWwZ0Aa7Iql
 AuQ+L1BpPxiBjjursMzrH4GFuPIjaE3sNZXk/VIEQVEPwcVLIk0oKfvshJvv6dCpu+7Z
 R4+bJ8qA1XM8dwWOynJoXYHdiBLgki1RILLdi7xWSicD09uQjlyydpdYdUUxay/BtY5A
 +lv1az6L4eisN2BflMogCqL93wyE/7JdUoTDoUysSAbAfBHmTGDkw8MAXpHf4bXIqU92
 42UA==
X-Gm-Message-State: AOAM53140uor7IMcsCvRp6EvzWdYQBAC2NBntPcY9NQmKL9I3ot3QlSr
 fX/THedx6gA82H0x+hVV7I8=
X-Google-Smtp-Source: ABdhPJy1MhVvMOXi8UxQ8s4idXCyJ+ifGIsp8CpwyHRf9+W1A9LbFInI9I0x2geweWfK/i1YhzfC+Q==
X-Received: by 2002:a05:6512:3d1c:: with SMTP id
 d28mr2997039lfv.135.1643294367899; 
 Thu, 27 Jan 2022 06:39:27 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.googlemail.com with ESMTPSA id r13sm476323lfr.65.2022.01.27.06.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 06:39:22 -0800 (PST)
Message-ID: <e8d3ca39-ddeb-2c21-6000-1cc65da57915@gmail.com>
Date: Thu, 27 Jan 2022 17:39:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 04/21] kernel: Add combined power-off+restart handler
 call chain API
Content-Language: en-US
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20211212210309.9851-1-digetx@gmail.com>
 <20211212210309.9851-5-digetx@gmail.com> <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jan 2022 08:44:30 +1100
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
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
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Lee Jones <lee.jones@linaro.org>, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org,
 linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michał,

09.01.2022 02:35, Michał Mirosław пишет:
> BTW, I couldn't find a right description of my idea of unifying the
> chains before, so let me sketch it now.
> 
> The idea is to have a single system-off chain in which the callback
> gets a mode ({QUERY_*, PREP_*, DO_*} for each of {*_REBOOT, *_POWEROFF, ...?).
> The QUERY_* calls would be made in can_kernel_reboot/poweroff(): all
> would be called, and if at least one returned true, then the shutdown
> mode would continue. All of PREP_* would be called then. After that
> all DO_* would be tried until one doesn't return (succeeded or broke
> the system hard). Classic for(;;); could be a final fallback for the
> case where arch/machine (lowest priority) call would return instead
> of halting the system in machine-dependent way. The QUERY and PREP
> stages could be combined, but I haven't thought about it enough to
> see what conditions would need to be imposed on the callbacks in
> that case (maybe it's not worth the trouble, since it isn't a fast
> path anyway?). The goal here is to have less (duplicated) code in
> kernel, but otherwise it seems equivalent to your API proposal.

Thank you again for yours proposal! IMO, it's much more important to
keep the core code simple and maintainable, rather than try to optimize
it without a very good reason, given that this isn't a hot code path at
all and saving a couple of bytes won't be noticeable. The poweroff,
restart and reboot were separated before this series and I'm finding
that it's easier to follow the code when it's structured that way. I'm
not convinced that we need to change it.
