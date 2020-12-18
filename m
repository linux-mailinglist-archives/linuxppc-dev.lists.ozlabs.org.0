Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E479A2DE70E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:57:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyD5x50mWzDqlK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:57:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CBfVYlZ7; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyD4C2mf2zDqC9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:56:10 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id x126so1775259pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 07:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=abkacR5EtfH7n3c7FX6aX1PPXUx2EG3knfWGOF7I8KQ=;
 b=CBfVYlZ7drbVWtqD4bM3rkW3OWAqtTHQ4tOTswiI8hMNopfxOrNSevY5aJbqvp0mM5
 TCt5A9KlDha/typLUMvAinFqZihBhKDs4BnfOvsBgN1UEuOfn2IctSX1c7RAJE00PX2w
 n7klcFUYA8+Wh03OFueMg42mGZ0RkQcUL9Og1KFLwVu3sptluQTtOKanGWeSuBQ6+cvG
 IQarphsJdlgszUZ2XFgxxcoIxIFcXYZtA7DiUUAY+OhzWh0reHMzfpVaZ6Tbo/44jQMr
 d42Q7DDFcqvQMmrXsNBpvMeT3nysS6sMGtm6mQ7XQdIwUbkG3/ZAqQL4skrB49QcSHxQ
 YUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=abkacR5EtfH7n3c7FX6aX1PPXUx2EG3knfWGOF7I8KQ=;
 b=sJpMlewlz+Wx8Yoei2gprDKMEVhxKLPtKi0AqDxz4nrSqSRw05cEBQ0vvbqUg2Gqnb
 lJOIj/E1WBcGNqU4pv5aNMErXIb6MTRwBYLS392W4VZZqcBRXVKfJlVOPdkMzdzgVwHo
 5l3JhaYyXI2a1wu8sYyyIuKQLmGAlLFnul6pDXtAno/MSaMUoerkW/2Nsm3LKnSmhzZJ
 2TCsRIUDv5r2x0TjBUJIfdHgWVtxzJBdhkQswXPOD0NJmiCqCk5P30+beS4hkMgWfequ
 DSRVUBr9yS1UtrbcihRTiMPFDeNtGGTbWuvGG0t+M9MQks9/wi8z9DugL+OkAJa/0A0k
 jBkw==
X-Gm-Message-State: AOAM531LRXGhjjFqeCUhAl+QcxmA4m45Bjy4vNG+ZSOgra7/JjFliedA
 /KK1ijXX8jw1CIlsI48ncW+K1dE/8rEhdNfFuu4=
X-Google-Smtp-Source: ABdhPJx7CKHKNahHF7wOhrRaWmRijCkWWyTNv/8H9aIqR6dzxIZFoFPjsHMLJGY+VN1uh1mCeWPnu3uWBQAXjL7LLn4=
X-Received: by 2002:a63:b1e:: with SMTP id 30mr4683229pgl.203.1608306966654;
 Fri, 18 Dec 2020 07:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20201218143122.19459-1-info@metux.net>
 <20201218143122.19459-2-info@metux.net>
In-Reply-To: <20201218143122.19459-2-info@metux.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 18 Dec 2020 17:55:50 +0200
Message-ID: <CAHp75VfYz_K2BYOxqmSx0q+1F2F9Lp1eb70RrNYzJHs3FX+quQ@mail.gmail.com>
Subject: Re: [PATCH 01/23] kernel: irq: irqdescs: warn on spurious IRQ
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-SH <linux-sh@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, gerg@linux-m68k.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jiri Olsa <jolsa@redhat.com>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-alpha@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, msalter@redhat.com, jacquiot.aurelien@gmail.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 18, 2020 at 4:37 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> +               if (printk_ratelimit())
> +                       pr_warn("spurious IRQ: irq=%d hwirq=%d nr_irqs=%d\n",
> +                               irq, hwirq, nr_irqs);

Perhaps you missed pr_warn_ratelimit() macro which is already in the
kernel for a long time.

-- 
With Best Regards,
Andy Shevchenko
