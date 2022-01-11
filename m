Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 471EA48B9C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 22:40:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYPJD1wS2z3cQS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 08:40:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o816YNn0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=o816YNn0; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY32G0s6Fz2xsg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 18:57:25 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id o12so53328854lfk.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 23:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LWyZT2KfS7vn2dLo/4rK0hRIU1bTIB9BhSt1xTZyjfs=;
 b=o816YNn0CIDbCy7uwUkg0QIssuplfNYZWg1E7+kMoiU09fEhi1ExzqEDKdXYCKWai9
 qL9GIVzs3SGnxKwGJEOsSM3dx9RhiXQOO+ArNyWLk+C6CEkyik9J0oiqnGoR0d0pIAj9
 53smI6i/pfdhdE0TtmtHvyvhbPCgckL8+ELBFQn7KfvHLFewJSBKJEg5/OYThOUaKs30
 YfS/REggk0oGjchlK3DJSLwWFv3g0lGM/Rxm4G3MobhsE5sy8EV2tAxeU17tchxilpyJ
 Cm1nk2GkD8C8mwFhmX8oxyCwbcyhBHAvQH1mhnlt/pBPXM0S0279pLMAkDnMH4r8aI8U
 4vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LWyZT2KfS7vn2dLo/4rK0hRIU1bTIB9BhSt1xTZyjfs=;
 b=xhw9ciMXpE0RYK3M9k2Xj3Pp0TsKSUun07x7l66V4Rv/qK/0VAXNi173/lnZXY3tDh
 wzyvIqgPjkmt/aCPsIj4bMTtiPNYD8w3unuQkRU/LuBkmFdiXWx2efVQquVrTMrbapNw
 Z19ZiCfo7poNglCEwv9tpawawm6McS9a5hFaViOwHla3o0T/Gcc3K4hEs7nh3w1Infnx
 lT8aX2f9Q3PoSWDwZ7XXRbwwg5PsAj6GVGQ9ouX2zmh8CD4HzO3idyzypLHaijJVBUnN
 d7Q0EUZaZQZUNrvMjoNjkv+NJQbWDD1sNK5VACGTEqsFTtcp3cd3/HQUXjokQJm55mJU
 pJOg==
X-Gm-Message-State: AOAM533ntmyFuY2BL16ISZ8aAisaPPDX3D0RTHf+IFz6lB9LbYIPd7Zf
 0kO2DzyrVa7dykAEv1hThqM=
X-Google-Smtp-Source: ABdhPJwj4SWIivJF19fC8reHgAOesHmr0N4ouSyiTwjUsKFxuFFgsPk/HMJ5T5WGAATZ9pKSch9NEg==
X-Received: by 2002:a05:651c:49a:: with SMTP id
 s26mr2063487ljc.109.1641887836867; 
 Mon, 10 Jan 2022 23:57:16 -0800 (PST)
Received: from ?IPv6:2a00:1370:810c:714f:a10:76ff:fe69:21b6?
 ([2a00:1370:810c:714f:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id x14sm1206180ljd.76.2022.01.10.23.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 23:57:16 -0800 (PST)
Subject: Re: [PATCH v5 04/21] kernel: Add combined power-off+restart handler
 call chain API
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20211212210309.9851-1-digetx@gmail.com>
 <20211212210309.9851-5-digetx@gmail.com> <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <80f5a739-0850-a8db-7493-e8c387109ce0@gmail.com>
Date: Tue, 11 Jan 2022 10:57:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Jan 2022 08:39:15 +1100
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

09.01.2022 02:35, Michał Mirosław пишет:
> On Mon, Dec 13, 2021 at 12:02:52AM +0300, Dmitry Osipenko wrote:
> [...]
>> +/**
>> + * struct power_off_data - Power-off callback argument
>> + *
>> + * @cb_data: Callback data.
>> + */
>> +struct power_off_data {
>> +	void *cb_data;
>> +};
>> +
>> +/**
>> + * struct power_off_prep_data - Power-off preparation callback argument
>> + *
>> + * @cb_data: Callback data.
>> + */
>> +struct power_off_prep_data {
>> +	void *cb_data;
>> +};
> 
> Why two exactly same structures? Why only a single pointer instead? If
> it just to enable type-checking callbacks, then thouse could be opaque
> or zero-sized structs that would be embedded or casted away in
> respective callbacks.

Preparation and final execution are two different operations, it's much
cleaner from a user's perspective to have same separated, IMO. In the
future we may would want to extend one of the structs, and not the
other. Type-checking is another benefit, of course.

The single callback pointer is what is utilized by all current kernel
users. This may change in the future and then it won't be a problem to
extend the power-off API without disrupting whole kernel.

>> +
>> +/**
>> + * struct restart_data - Restart callback argument
>> + *
>> + * @cb_data: Callback data.
>> + * @cmd: Restart command string.
>> + * @stop_chain: Further lower priority callbacks won't be executed if set to
>> + *		true. Can be changed within callback. Default is false.
>> + * @mode: Reboot mode ID.
>> + */
>> +struct restart_data {
>> +	void *cb_data;
>> +	const char *cmd;
>> +	bool stop_chain;
>> +	enum reboot_mode mode;
>> +};
>> +
>> +/**
>> + * struct reboot_prep_data - Reboot and shutdown preparation callback argument
>> + *
>> + * @cb_data: Callback data.
>> + * @cmd: Restart command string.
>> + * @stop_chain: Further lower priority callbacks won't be executed if set to
>> + *		true. Can be changed within callback. Default is false.
> 
> Why would we want to stop power-off or erboot chain? If the callback
> succeded, then further calls won't be made. If it doesn't succeed, but
> possibly breaks the system somehow, it shouldn't return. Then the only
> case left would be to just try the next method of shutting down.

This is what some of the API users were doing for years. I don't know
for sure why they want to stop the chain, it indeed looks like an
incorrect behaviour, but that's up to developers to decide. I only
retained the old behaviour for those users.

>> + * @mode: Preparation mode ID.
>> + */
>> +struct reboot_prep_data {
>> +	void *cb_data;
>> +	const char *cmd;
>> +	bool stop_chain;
>> +	enum reboot_prepare_mode mode;
>> +};
>> +
>> +struct sys_off_handler_private_data {
>> +	struct notifier_block power_off_nb;
>> +	struct notifier_block restart_nb;
>> +	struct notifier_block reboot_nb;
> 
> What's the difference between restart and reboot?

Reboot is always executed before restart and power-off callbacks. This
is explained in the doc-comment of the struct sys_off_handler.

+ * @reboot_prepare_cb: Reboot/shutdown preparation callback. All reboot
+ * preparation callbacks are invoked before @restart_cb or @power_off_cb,
+ * depending on the mode. It's registered with register_reboot_notifier().
+ * The point is to remove boilerplate code from drivers which use this
+ * callback in conjunction with the restart/power-off callbacks.
+ *

This reboot callback usually performs early preparations that are need
to be done before machine is placed into reset state, please see [1] for
the examples.

[1] https://elixir.bootlin.com/linux/v5.16/A/ident/register_reboot_notifier

I agree that "reboot" sounds like a misnomer. This name was coined long
time ago, perhaps not worth to rename it at this point. I'm also not
sure what could be a better name.

>> +	void (*platform_power_off_cb)(void);
>> +	void (*simple_power_off_cb)(void *data);
>> +	void *simple_power_off_cb_data;
>> +	bool registered;
>> +};
> 
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

Michał, thank you for the review and suggestions! I'll take another look
at yours proposal during this merge window, in a preparation to v6.
