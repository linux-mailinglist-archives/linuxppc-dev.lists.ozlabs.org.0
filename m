Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 717EC447B5E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 08:48:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hnjs12lMFz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 18:48:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.176;
 helo=mail-qt1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnjrV4vNtz2xLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 18:47:36 +1100 (AEDT)
Received: by mail-qt1-f176.google.com with SMTP id s20so6254115qtk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Nov 2021 23:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=niQCVpji9nu8a8Mfie3ofua8MkF1HzpLuS22ys5pvwg=;
 b=2V5oX6J28mJTPJRSccx4EBI3HSoXQM6udfUHSNyJ5TDPPrNRL2V1Z6fxaID61oHmUy
 TwdrqaY4nQEyOTdmHOn7jG2oK2HArRs/IkuyajEI8IWLLAa9yUZ/pntOH48vk3ngdhZY
 SLyAs+YaPsoO1JGM3BvCCyWv3s+9Felc/p2K8uVclwoCIYKxjUHrLlNSv2BW/bSKznOJ
 oQo9TNrGaJn/x+vZ6brEo/7fGhNRTIGQle0BvBFFU63Tc4uIQCY1h8Frk226DxkCOB1z
 sttYZzQQxugoAFUGjH7UHbvTP0Fc7jNE6CAiJKElc3IYyt7EbBSDW6ooQvWYRqpNyFVR
 g3iQ==
X-Gm-Message-State: AOAM5322GNITMJj7xwMOp4yQwZ2G7GP/z23ae2FdYsYhXeAesaoCDp8K
 7USKUmBiRDiNvFeNqCG0F93AdEfoQ/yjWg==
X-Google-Smtp-Source: ABdhPJyCg6vpgTpxqL6ILZEIh0Iz/b1gpV+sZMyynTi5u8i96hKvUl4z2RIRe17y2oyEoB/Uvb+KnA==
X-Received: by 2002:ac8:7fc1:: with SMTP id b1mr82262824qtk.369.1636357652691; 
 Sun, 07 Nov 2021 23:47:32 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49])
 by smtp.gmail.com with ESMTPSA id n3sm9753665qkp.112.2021.11.07.23.47.32
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:47:32 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id d6so11420202qvb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Nov 2021 23:47:32 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id
 b7mr71214037vsu.35.1636357641114; 
 Sun, 07 Nov 2021 23:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20211108004524.29465-1-digetx@gmail.com>
 <20211108004524.29465-22-digetx@gmail.com>
In-Reply-To: <20211108004524.29465-22-digetx@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 08:47:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpW0389_uJR2xg+HCstXanutPxrcRdvgu8kxH1J9T++w@mail.gmail.com>
Message-ID: <CAMuHMdXpW0389_uJR2xg+HCstXanutPxrcRdvgu8kxH1J9T++w@mail.gmail.com>
Subject: Re: [PATCH v3 21/25] m68k: Switch to new sys-off handler API
To: Dmitry Osipenko <digetx@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
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
 Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Hu <nickhu@andestech.com>,
 linux-pm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 8, 2021 at 1:48 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> Kernel now supports chained power-off handlers. Use
> register_power_off_handler() that registers power-off handlers and
> do_kernel_power_off() that invokes chained power-off handlers. Legacy
> pm_power_off() will be removed once all drivers will be converted to
> the new power-off API.
>
> Normally arch code should adopt only the do_kernel_power_off() at first,
> but m68k is a special case because it uses pm_power_off() "inside out",
> i.e. pm_power_off() invokes machine_power_off() [in fact it does nothing],
> while it's machine_power_off() that should invoke the pm_power_off(), and
> thus, we can't convert platforms to the new API separately. There are only
> two platforms changed here, so it's not a big deal.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
