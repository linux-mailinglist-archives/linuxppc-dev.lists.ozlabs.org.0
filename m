Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB8C43F43F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 03:05:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgPP22mPlz3cnK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 12:05:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OJvAD8QI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OJvAD8QI; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgKQ23krsz2ybK;
 Fri, 29 Oct 2021 09:06:00 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id l2so13191762lji.6;
 Thu, 28 Oct 2021 15:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QdlXzZMWoVtcTasTaLsmBsOCqsQBbCgeCfcj0o9XtUc=;
 b=OJvAD8QIK23NiAd5gHFgNc2jMlnwbUhscd64oItZCjDzpbaa9HqfW53eGYcjGvS+Hd
 8DJvk+brxf2GEvT4zQ6W/ef2iXaKU3cVUF0C3X+R0CYtCLZK9UxcbzlXYXArEArHwTk8
 vcyalmRFTF2jyokLO2ef7zgVnqs7E2ea+6mOp4eaXLCsLH7zqMUa5b9lGYh++3iI3c5l
 5SNXuX8KUFV580Mc9ixmfzVIv8iajcv/gjbcoXvjaxxhRQdJfHyZ96a4PDZESCiQ0JsQ
 ezipbNgT7rnH4g7QwqVqZwJlBhjMy6NJ72j6JC2Ohga6KFFIy4TxdzbmMsSK+f4qNFMJ
 K+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QdlXzZMWoVtcTasTaLsmBsOCqsQBbCgeCfcj0o9XtUc=;
 b=j2fgYgRCXGxxaatH8Ue0a+2uZ4waMdR9Qklz3hNBR366hmcTCdiWC5756dzIePbkC8
 vmEZvxWZ4310ixJ5wbXEVF0cm7vPmCDdrKnBV0f2K4x6rV98r4dlaTwqrG6cuj3fjIkt
 24Lfmqd/0fg75hR1n1QdpufsuLQ6VEtYwQCJtG7d/ps9rv6YrlDUyvM7yRoZ28QWaJIT
 asCNKxZ8LUSUaNU5Wul/vWKVJSrJO9ulhJ8adUSrZ3jmRm5MzO74yt/gVI1+vo9amL2N
 jDiRfPHZCl0Bj9BNC1+YRF9aw9XWXeVBwtqH3QpcqHMFW/VJOiTTg+/+g3jI0N2IsEIP
 wfnA==
X-Gm-Message-State: AOAM533Q9xFYmwMDr9RwRAbrAXKEV54gXNpg+09mK53J5lT/3177dztX
 MBokdfEOWc7KAC65g6kikGMXuvhkm88=
X-Google-Smtp-Source: ABdhPJzozZj+Szoqatj9JJ7zamkbp5Jf8v8z0Y7vkU95q/rca882+TrclSa79lyDyuur0f9DZkdGEw==
X-Received: by 2002:a2e:99da:: with SMTP id l26mr5923422ljj.508.1635458756009; 
 Thu, 28 Oct 2021 15:05:56 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id v13sm444651ljk.72.2021.10.28.15.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 15:05:55 -0700 (PDT)
Subject: Re: [PATCH v2 00/45] Introduce power-off+restart call chain API
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20211027211715.12671-1-digetx@gmail.com>
Message-ID: <92067c5e-a256-ff45-eae2-21033c6a83d2@gmail.com>
Date: Fri, 29 Oct 2021 01:05:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-sh@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-acpi@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guo Ren <guoren@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

28.10.2021 00:16, Dmitry Osipenko пишет:
>   mfd: ab8500: Use devm_register_trivial_power_off_handler()
>   reset: ath79: Use devm_register_simple_restart_handler()
>   reset: intel-gw: Use devm_register_simple_restart_handler()
>   reset: lpc18xx: Use devm_register_prioritized_restart_handler()
>   reset: npcm: Use devm_register_prioritized_restart_handler()

These patches got lost because Gmail gave me ban after 40's email. I
think it doesn't worth to re-send them now since you should get an idea
about how API usage looks like without the lost patches.
