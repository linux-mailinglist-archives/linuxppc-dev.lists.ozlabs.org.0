Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C8344758F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Nov 2021 21:11:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnQNg4pH7z3bXv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 07:10:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TxOMGGlg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TxOMGGlg; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnLL13jlnz2x9b;
 Mon,  8 Nov 2021 04:08:23 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id bk14so953132oib.7;
 Sun, 07 Nov 2021 09:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tdjg7OFm02RxoZkWdNYUJLWTVIAPxTK8o9TtiXrumos=;
 b=TxOMGGlgYCG6dkxhcHrWleMH5bQzzwXZ9FgwNICO938yYvOADrHCJxaIH+GmktBmdj
 VF/g/5abCbj1SCo77l//+Q8ZaEKZ59DzYbLYNazQAh1d/LI9QSnOgttApF1NrD9BSZdp
 gXEIPq4X5WBftSdrWeIB1XoHAUTyRVaiGJM3hjDVKwLTIaIl/5BV9x60u06nn/MoayP2
 XKdxX9rsONJssDlEkPGWyc5+2eLAU/A93X+4aNShdnC/nVsO9kvbYnMJEh3NiFo/gq2s
 n/ryBqjSn/iug4O0nxdm910/aVIInOrXjz5uU8hb+PebuTd+WVfeeVeSdkkUcfpq82Ph
 3xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdjg7OFm02RxoZkWdNYUJLWTVIAPxTK8o9TtiXrumos=;
 b=oSj5B3nK3mjiztGJ8Zuc6Ch+By9lS9GkU4gY9T7HQ+RwQWGinZyWkHNB5CGYUcgarF
 SfMy4/thSc3Sq1cdN7ne9oCoSdUn2yYAG785QQZf1mJb48J1S5kRUHtQ/PQRr6xj1oz/
 hkeaZ1rEb9YlwjKQm4rc+nnYHHVCWbCekB6BDxPnudldaO3tiWwZyAc3lHQoWdFaLpgX
 2DRxFVuT2PwoWtfd3Afsn/Or/+1TUr24ofIguDynbcV3vhp6b1ZFWXiTB4lbjsV3Dc6c
 E8FL7GMDGWmMKQIC1b3E40ja1gJSyspRQSS+eo7ymk16rSIbu4/ftrMhB7OQ6yQ2P41v
 OSFg==
X-Gm-Message-State: AOAM533np9BYwTgS/nz5NZ4trMfUV+u0S2leDIaBsdZHPb4G9TV5xwX4
 2ow7OHc7d5LlFLthwqOQUrs=
X-Google-Smtp-Source: ABdhPJwtuSZgtmAkEs0Dks9+MnuUhljSkzaFgRaxP+iMBCUUKLEs54Fh1SgZ30w0yfdl8sLFhcnMyg==
X-Received: by 2002:a05:6808:158a:: with SMTP id
 t10mr3003509oiw.24.1636304899015; 
 Sun, 07 Nov 2021 09:08:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i18sm3076850oik.6.2021.11.07.09.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 09:08:18 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
Date: Sun, 7 Nov 2021 09:08:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
 Thomas Gleixner <tglx@linutronix.de>, Tomer Maimon <tmaimon77@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-ia64@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-omap@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
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

On 11/7/21 8:53 AM, Dmitry Osipenko wrote:
> 06.11.2021 23:54, Jonathan Neuschäfer пишет:
>> Hi,
>>
>> On Thu, Oct 28, 2021 at 12:16:57AM +0300, Dmitry Osipenko wrote:
>>> Use devm_register_power_handler() that replaces global pm_power_off
>>> variable and allows to register multiple power-off handlers. It also
>>> provides restart-handler support, i.e. all in one API.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>
>> When I boot with (most of) this patchset applied, I get the warning at
>> kernel/reboot.c:187:
>>
>> 	/*
>> 	 * Handler must have unique priority. Otherwise call order is
>> 	 * determined by registration order, which is unreliable.
>> 	 */
>> 	WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list, nb));
>>
>> As the NTXEC driver doesn't specify a priority, I think this is an issue
>> to be fixed elsewhere.
>>
>> Other than that, it works and looks good, as far as I can tell.
>>
>>
>> For this patch:
>>
>> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>> Tested-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> Thank you. You have conflicting restart handlers, apparently NTXEC
> driver should have higher priority than the watchdog driver. It should
> be a common problem for the watchdog drivers, I will lower watchdog's
> default priority to fix it.
> 

The watchdog subsystem already uses "0" as default priority, which was
intended as priority of last resort for restart handlers. I do not see
a reason to change that.

Guenter
