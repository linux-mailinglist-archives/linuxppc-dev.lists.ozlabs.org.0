Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B344758D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Nov 2021 21:10:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnQMx2mw9z3bgl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 07:10:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Lwzfxq5u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Lwzfxq5u; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnL0M6wN6z2xKK;
 Mon,  8 Nov 2021 03:53:07 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id x27so30772198lfu.5;
 Sun, 07 Nov 2021 08:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FuxjUSeidJvAMVHKU9E/d55P+zyTiwTeSCeqf/uVMDo=;
 b=Lwzfxq5uEYmwUHQaauy1zdfEe4xJydQ9b9Od8uYrwBczi5NJMIekKLJg7wlYTXl+4h
 aBwFrnzPjUuQZKv1Ia+S222jU8dJElyFhzTX7Y6Z3zgW5uo6fxyJ6Ub7QZuJOpIcD/5G
 Z5zvDqw9CupdRxfoeBn7XfS8iSTjIzecdpz5R8YfLYHN44fPq2Sj3DZqQfYaE9SGw4KM
 9QVgWsVoZpReO+np7PVvhGoeoi2Muq2En7xd12JC02FvD5KUvlS8dKa1pfLtqGdyB8C3
 Q31AQZyOLu3Y3rBXma7EsV9dMapOWW+H7dfnyyasqa2gU34jVZGgiKgGYKDrTdyFanCB
 8Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FuxjUSeidJvAMVHKU9E/d55P+zyTiwTeSCeqf/uVMDo=;
 b=XS7HpAty+ZvO8IwoeLlHgJM3g5r38BMvRRdUwslbf8oZK6RnHwB3DrXS47pDqk+oC4
 aCdl+uKZNFsG3iQ4npS4rkWlFNbT415m7sAkjsekMmkdc6OpIVzSNwzN5ISrv76XlCpb
 gmfpHU1OOMccx+TNPTo+kw9j9QEInBbs85ZFzpsH36rp4ABNk4xwFsp9dzHZ55C9eYIP
 fKnGxaA2AfiuYsfWBTkbudMHQLXf1mqZArTF7QQLl20dXL4yGq9PcMo2wGvMkkzUixq5
 eUVCWGGB4F3eZ2l1+FU4YlBxuxYOspMf4chpm9Gg8zp4gqr7Hd8jRZ3V7gLRjZeQaMQM
 Nj+w==
X-Gm-Message-State: AOAM5320/0ijpw3mTxAporsfgCILWrFwFo8QSyGNhAEheCb04qZuEn7a
 sccBXAmHRxJTOL2Dwtkj+sw=
X-Google-Smtp-Source: ABdhPJyYdIEr6ONtuDBexIQwg75AwiW2LoF8DEUBqYkEbum61pW0vPuGJTsEH8z54RKtLjaAI2MWow==
X-Received: by 2002:a05:6512:1082:: with SMTP id
 j2mr64106958lfg.568.1636303982698; 
 Sun, 07 Nov 2021 08:53:02 -0800 (PST)
Received: from [192.168.2.145] (79-139-182-132.dynamic.spd-mgts.ru.
 [79.139.182.132])
 by smtp.googlemail.com with ESMTPSA id c3sm860233lfb.122.2021.11.07.08.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 08:53:02 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
Date: Sun, 7 Nov 2021 19:53:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYbqlmOM95q7Hbjo@latitude>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Nov 2021 07:09:47 +1100
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
 Tali Perry <tali.perry1@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
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
 linux-omap@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-acpi@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-pm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

06.11.2021 23:54, Jonathan Neuschäfer пишет:
> Hi,
> 
> On Thu, Oct 28, 2021 at 12:16:57AM +0300, Dmitry Osipenko wrote:
>> Use devm_register_power_handler() that replaces global pm_power_off
>> variable and allows to register multiple power-off handlers. It also
>> provides restart-handler support, i.e. all in one API.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
> 
> When I boot with (most of) this patchset applied, I get the warning at
> kernel/reboot.c:187:
> 
> 	/*
> 	 * Handler must have unique priority. Otherwise call order is
> 	 * determined by registration order, which is unreliable.
> 	 */
> 	WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list, nb));
> 
> As the NTXEC driver doesn't specify a priority, I think this is an issue
> to be fixed elsewhere.
> 
> Other than that, it works and looks good, as far as I can tell.
> 
> 
> For this patch:
> 
> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> Tested-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Thank you. You have conflicting restart handlers, apparently NTXEC
driver should have higher priority than the watchdog driver. It should
be a common problem for the watchdog drivers, I will lower watchdog's
default priority to fix it.
