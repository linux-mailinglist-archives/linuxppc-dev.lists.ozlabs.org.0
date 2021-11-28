Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9E3460AD7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 23:42:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Nlm6jJ1z3cNB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 09:42:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ve2rGzh1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ve2rGzh1; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Mgy1bnQz2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 08:54:05 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id bi37so39406408lfb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 13:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6vgwLT/ouzyM4jlzEumPwuoC7gyZzE5j02z7WHT5gL0=;
 b=Ve2rGzh1LJA0+OcOlbbQ73O4vszbugE425G36NIT/LJkRhFMX190Vmwf9Z1u+DozQy
 nt7KBoHLP6NcqsCJJVf/XMiWi1msgC02rhfjLu8CKl0SI+0RrFvUKjFjlZH7bdfHOiEX
 jvvRM0yX0DY0N616Cr6USUXBiFSTo4izfqBOoNpjwV+G+cH1cFHUwmonpjoWJX8Ppl5i
 8dEUJUKATxCUbOfS4VM/cGGt6HuPu0povTPAj3Y6GTkQG70Ogmn5eg+CfWVBj+3pxNr6
 ReZIvwRQlO/G/fnEj5DP0/liBCD4UXfZ78eAcvQevgGY/DQsBvKDeMEPHSEvbIQ59N2I
 efCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6vgwLT/ouzyM4jlzEumPwuoC7gyZzE5j02z7WHT5gL0=;
 b=lrafDNILrfzllpup/xZRDW1p05NnkTnCQYZHPeAkNvMSaz1HWJXKiCKyJxWIHndqrh
 WNgxtS1ZFAE8bE0odluH7RXoRzVHkFK6nWelmfd03Ny+7rfg0EAHgxG08Tjs0iA6uidI
 bV2s20Ubjw4dMSoksBJXkbwen+D/eV50E2JFs5ktszg/huq34oyg8e/2pRZVKlcnidgJ
 61BcpjZHRuOgu0wtcmxpuiyF3kPIOFCKNHyP+8mNNxxveiqR0jRh9coF+yaas46lCgWC
 WloGjFI3XqG0l6ufnLI8CqHeBATxn16ERNmjTmacF63/dAtkqkHdjVTZwenGDK7VpDJI
 UY3g==
X-Gm-Message-State: AOAM533qpaoA0KYiHKmWTkGA4IQ1xxPyOdXTkfOHhzVXB0xfjiZ5+lkr
 rEXqqm9O/5dnYQGDN4pzUZs=
X-Google-Smtp-Source: ABdhPJxrac6Czjs8U2D2QGSscJN4jhlYtGpRqd/e7TNYLEXAP/IVggs/yFEWoCFlClXMagpvBwvrwg==
X-Received: by 2002:a05:6512:3c82:: with SMTP id
 h2mr44786433lfv.128.1638136440658; 
 Sun, 28 Nov 2021 13:54:00 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id w15sm1168884ljo.97.2021.11.28.13.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:54:00 -0800 (PST)
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com> <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
 <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>
Date: Mon, 29 Nov 2021 00:53:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Nov 2021 09:41:55 +1100
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
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
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

29.11.2021 00:17, Michał Mirosław пишет:
>> I'm having trouble with parsing this comment. Could you please try to
>> rephrase it? I don't see how you could check whether power-off handler
>> is available if you'll mix all handlers together.
> If notify_call_chain() would be fixed to return NOTIFY_OK if any call
> returned NOTIFY_OK, then this would be a clear way to gather the
> answer if any of the handlers will attempt the final action (reboot or
> power off).
> 

Could you please show a code snippet that implements your suggestion?
