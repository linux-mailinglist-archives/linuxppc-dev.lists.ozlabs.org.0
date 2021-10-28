Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFC643F437
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 03:03:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgPLq3JZbz3cR4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 12:03:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y9ted3wn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Y9ted3wn; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgJly4dv6z2xth;
 Fri, 29 Oct 2021 08:36:30 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id p16so16525342lfa.2;
 Thu, 28 Oct 2021 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=thttoNtx85IqBzMI/c95u4NQI+WEGNQqD09v61bWPkE=;
 b=Y9ted3wnUvFPZbztZa+QHRbohuO2ujzfF68/pFicW5dA7D1yuFrKCL4aTWk/1AChzB
 fKwgUocsDwuNOGM2+iseiHe/bj2d1v3+dSRNtXKqEmTsyBkz7IWQs8pVvc2a2gvGjfup
 yLqAO4u/w7mjCphm/lBZwptgCTPupkSC+307KKr7OHU7po5AtPQB8ZhrguBiu6yERIjH
 bK0WN85VLNpdVAhT7soiJpVcCZ4Sp0KIHJV14Uu8RloVE9YJBCz/nPhBHDPyGgkjYHQ0
 imoJdP8GopH3zoQfTkWNgL4xsg20XHFvSLev9dZQthSUfjSrDblQ5bVzKxHiquLI0ZeF
 3ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=thttoNtx85IqBzMI/c95u4NQI+WEGNQqD09v61bWPkE=;
 b=OPhu4PU2ftB1WjYyUDNUuw2y2cE3IrMHATxBHOJDyEFWPXofaFZPyd3e9kA9gdYpwj
 iLE42f5sIS0xhoLc9WV0w7z7yAj+9oltG9A6SyVfEI4C1O1YMB62snim7/CQla/A4jf4
 mCX8MAwT5fPSkrH2+1+fuj1ysMUUd/fVZ51IuUDjVy03gP1A8vVUW75y4U1RiUe1A1IL
 PVptR1DCrMF9IsiQ0AId3h3+DyUyS850Us6wQTUppfDjYbCOAsYPh0oSZUfldRmW44xJ
 jGJqLwPPBLB82n9FQh1FRSbygQfz/rn2HrI+RYd7+rPQ+kLIPDPuxBiPFwDdxh9wn5mo
 dUig==
X-Gm-Message-State: AOAM531WkS9/ELrQ4JWdlB9PO6GsdNMfBLURhJsF59+3b1zQSz4dEzl4
 bxMzbWhrh3iyG3h8RkdmAzU=
X-Google-Smtp-Source: ABdhPJzbYSC0nWI15MXaoXJe2SikVhRJRnLxoLeSiSPsVfPjrcP1DbWpe0jTqiEw6MLnleJHOc1O3g==
X-Received: by 2002:a05:6512:2292:: with SMTP id
 f18mr6437448lfu.619.1635456985989; 
 Thu, 28 Oct 2021 14:36:25 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id s9sm396521ljg.76.2021.10.28.14.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:36:25 -0700 (PDT)
Subject: Re: [PATCH v2 08/45] kernel: Add combined power-off+restart handler
 call chain API
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-9-digetx@gmail.com>
 <CAJZ5v0jMdSjmkswzu18LSxcNk+k92Oz5XFFXmu-h=W8aPP4Oig@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d1837954-bd70-460d-3548-0d5ec5b75704@gmail.com>
Date: Fri, 29 Oct 2021 00:36:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jMdSjmkswzu18LSxcNk+k92Oz5XFFXmu-h=W8aPP4Oig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Oct 2021 12:02:21 +1100
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
 linux-ia64@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Helge Deller <deller@gmx.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nancy Yuen <yuenn@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Linux PM <linux-pm@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

28.10.2021 12:53, Rafael J. Wysocki пишет:
>> +/**
>> + * struct power_handler - Machine power-off + restart handler
>> + *
>> + * Describes power-off and restart handlers which are invoked by kernel
>> + * to power off or restart this machine.  Supports prioritized chaining for
>> + * both restart and power-off handlers.  Callback's priority must be unique.
>> + * Intended to be used by device drivers that are responsible for restarting
>> + * and powering off hardware which kernel is running on.
>> + *
>> + * Struct power_handler can be static.  Members of this structure must not be
>> + * altered while handler is registered.
>> + *
>> + * Fill the structure members and pass it to register_power_handler().
>> + */
>> +struct power_handler {
> The name of this structure is too generic IMV.  There are many things
> that it might apply to in principle.
> 
> What about calling power_off_handler or sys_off_handler as it need not
> be about power at all?

I didn't like much the 'power' either, but couldn't come up with a
better variant. Will change it in v3, thank you.
