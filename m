Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382143F441
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 03:06:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgPQW2RC5z2xth
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 12:06:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=or9I8eXm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=or9I8eXm; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgMF46yBkz2xWt;
 Fri, 29 Oct 2021 10:28:22 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id j9so16972406lfu.7;
 Thu, 28 Oct 2021 16:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g1ASowQL1SYh3xyvjjnrsnFWzhxhuZ1FkP7TdHa31mE=;
 b=or9I8eXmdc6hOUu3ilMz+ymgHlGQQmwFfcjANI787MFy3461r29Qlx4Drko3A82jiZ
 /Dxbh+rXJkVd+vSmZQz7ByF21FNMWE7Msuh2tmQH7FzEaAaJykw/79BGIIrJtKwboRDm
 04V8OvO+c+XCXlI7f4QRPE7cqx6GZulezk5I+0MnmugoyzWrW9wGp3T/sQ+0YL50opsM
 PEj+17btedXyPtu3l7DUltlj+rCIDD63O2gZoZwfDEKUeboD39P9kLuxM5uqsYcKe9n/
 MuNWRD7sUlbhLEou6B/xsQNLsenMP/929SI9uvSZZXHuqFx/YvhRAZPMrz7X4+YxCerI
 /TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g1ASowQL1SYh3xyvjjnrsnFWzhxhuZ1FkP7TdHa31mE=;
 b=Szsy6q+ssq/t+ZDRFuqF4BRfcyGJzMU648rypYnAOW6FMF009zaIfynFMP71d++r3J
 GilZ455IIebYQUWgNfEYRnBDzw4JeqziWKYcxlmRnmnJiJEJx5u9lZJPEq/NAA3tcJcc
 47bxMOqRWKzbw2akk93hpnqY1npd1MKnzU/gnbF9I/oaf6meMRR4znDWk+imw+NqCUhD
 d3BsDBzM4emnEofSE/YCZ4TssE9PCeReLWAf6WWdRCX4iu0WFOCJu4vlKHTaMU/VGf6y
 OcrkTPclyPzIZjxLL6CJpqxyx6OxKqdRJdfMrgznUQzu5LsFEhc7vLwxUBXYGg9FR3qw
 bRJQ==
X-Gm-Message-State: AOAM533aA9tXpxbIEB0DgyHlI9WNHIoprKXbZDBC1I0KuP7Dvtiwn3AM
 VAR4MCLHONLvzbauLIoFetQ=
X-Google-Smtp-Source: ABdhPJwV2hV4le461ll7P/MiVtzPzva4GF7PaVejAVvhmYPc9uewsxLl7FIVcxk+rSnnrtvlDg/jfg==
X-Received: by 2002:a19:760a:: with SMTP id c10mr6627861lff.302.1635463695803; 
 Thu, 28 Oct 2021 16:28:15 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id bn3sm414682ljb.7.2021.10.28.16.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 16:28:15 -0700 (PDT)
Subject: Re: [PATCH v2 03/45] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
From: Dmitry Osipenko <digetx@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-4-digetx@gmail.com>
 <YXqCz/utp2DFJJ45@smile.fi.intel.com>
 <c5fb7590-03a7-0eea-4040-07472a5c9710@gmail.com>
Message-ID: <8a9c4a9a-ea0d-4bc9-cf57-9bd99b211d47@gmail.com>
Date: Fri, 29 Oct 2021 02:28:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c5fb7590-03a7-0eea-4040-07472a5c9710@gmail.com>
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
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-pm@vger.kernel.org,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

29.10.2021 00:32, Dmitry Osipenko пишет:
>>> +	/*
>>> +	 * This code gets used during boot-up, when task switching is
>>> +	 * not yet working and interrupts must remain disabled.  At
>> One space is enough.
> This comment is replicated multiple times over this source file. You can
> find it before each down_write(). I borrowed the text as-is, for
> consistency.

Actually, it should be down_read() here since there are no writes. I'll
correct it in v3.
