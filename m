Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE1A447880
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 03:22:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnZdM4Dpfz3bT7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 13:22:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=apuxSRuY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=apuxSRuY; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnY706ytyz2xT9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 12:14:35 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id p16so32591151lfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Nov 2021 17:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N1+snwcBj4tP86kuMCj3Y4Q1vBUEL/Sem2JBurze6Ko=;
 b=apuxSRuYyxkG2byFKoxt6B4SK3xt1zayG+GZKAbfvgzKkxFXAeWb1AzxtxUprSjERR
 whaPt6KEn6/vTE9oOPwvBS4c5ID/DXiDnXsanKsV2qmMrBWiYaIO7BigzI+qvvrAxwrZ
 BmkpTmeKr37leQpkRplTucmSrwDlfNefD7m3qL+hvwRStGquM9P0I0wrBTfpw9rn76sI
 lN0LLW+RgmTAyUEm+V4IH6cGKjORdlWIvcP/u6EPAVmjyc5BQEYpbw/tX7i3HHJcJjAB
 7CLlDSjKnU1JYhgjRjgZm0uF5v+cV0cGD400r4GBT6NRs15v93q/OMHQaBAFH5aMWKYN
 dIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N1+snwcBj4tP86kuMCj3Y4Q1vBUEL/Sem2JBurze6Ko=;
 b=juAgCrlmGaK7SyzrbNJiKl7gTEA2MrJIlcOSQeX4+wax0koRcG/RnJaDRAQo4VdEO+
 q+7aWSetw01ZaEw+pTxiHMYOPZUkAps9q1xRqh59M71pcgrvVVZGw76iCJDw5CNlY+Px
 bRhhvIcwk9gA+d0WcI+rVH0zoo+xTy5CnMMEZZMo5gr1tTL8JIhdy/gKHwrqjsmtWbYF
 /PWYSFlMldIju/rw8uHv+FQL6FToBNRvSZZ0u1hC5U0RDZ139V+Pfv/Ui6n3vQjAEXqk
 Qp3YGoKs3T8ATZPrpWqOEKZEK7cLgiQ5hfo4MbcQp7xrT+E+sfTZElP4U9upu2vLAuev
 Wvyw==
X-Gm-Message-State: AOAM533hARQHsGDgznxIYwkBu1806o5RQen800eADsTngcOe6t+Vlxcl
 PClIcx+1JOB+QWuswiUjIIo=
X-Google-Smtp-Source: ABdhPJwwKCpUyEi2gUYCZoydWPAlQSBS5OGz69Lgly2auw/yDbGC37SlN+Qc84kMLx0VxH8b+KOpeA==
X-Received: by 2002:a05:6512:31d4:: with SMTP id
 j20mr3632382lfe.395.1636334072590; 
 Sun, 07 Nov 2021 17:14:32 -0800 (PST)
Received: from [192.168.2.145] (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.googlemail.com with ESMTPSA id b6sm50427ljr.103.2021.11.07.17.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 17:14:32 -0800 (PST)
Subject: Re: [PATCH v3 00/25] Introduce power-off+restart call chain API
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20211108004524.29465-1-digetx@gmail.com>
Message-ID: <a4cf1410-564b-ced5-1209-fa55ba672431@gmail.com>
Date: Mon, 8 Nov 2021 04:14:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Nov 2021 13:21:56 +1100
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
Cc: linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

08.11.2021 03:44, Dmitry Osipenko пишет:
> Problem
> -------
> 
> SoC devices require power-off call chaining functionality from kernel.
> We have a widely used restart chaining provided by restart notifier API,
> but nothing for power-off.
> 
> Solution
> --------
> 
> Introduce new API that provides both restart and power-off call chains.
> 
> Why combine restart with power-off? Because drivers often do both.
> More practical to have API that provides both under the same roof.
> 
> The new API is designed with simplicity and extensibility in mind.
> It's built upon the existing restart and reboot APIs. The simplicity
> is in new helper functions that are convenient for drivers. The
> extensibility is in the design that doesn't hardcode callback
> arguments, making easy to add new parameters and remove old.
> 
> This is a third attempt to introduce the new API. First was made by
> Guenter Roeck back in 2014, second was made by Thierry Reding in 2017.
> In fact the work didn't stop and recently arm_pm_restart() was removed
> from v5.14 kernel, which was a part of preparatory work started by
> Guenter Roeck. I took into account experience and ideas from the
> previous attempts, extended and polished them.
> 
> Adoption plan
> -------------
> 
> This patchset introduces the new API. It also converts multiple drivers
> and arch code to the new API to demonstrate how it all looks in practice.
> 
> The plan is:
> 
> 1. Merge new API (patches 1-8). This API will co-exist with the old APIs.
> 
> 2. Convert arch code to do_kernel_power_off() (patches 9-21).
> 
> 3. Convert drivers and platform code to the new API.
> 
> 4. Remove obsolete pm_power_off and pm_power_off_prepare variables.
> 
> 5. Make restart-notifier API private to kernel/reboot.c once no users left.
> 
> It's fully implemented here:
> 
> [1] https://github.com/grate-driver/linux/commits/sys-off-handler
> 
> For now I'm sending only the first 25 base patches out of ~180. It's
> preferable to squash 1-2, partially 3 and 4 points of the plan into a
> single patchset to ease and speed up applying of the rest of the patches.
> Majority of drivers and platform patches depend on the base, hence they
> will come later (and per subsystem), once base will land.
> 
> All [1] patches are compile-tested. Tegra and x86 ACPI patches are tested
> on hardware. The remaining should be covered by unit tests (unpublished).
> 
> Results
> -------
> 
> 1. Devices can be powered off properly.
> 
> 2. Global variables are removed from drivers.
> 
> 3. Global pm_power_off and pm_power_off_prepare callback variables are
> removed once all users are converted to the new API. The latter callback
> is removed by patch #25 of this series.
> 
> 4. Ambiguous call chain ordering is prohibited. See patch #5 which adds
> verification of restart handlers priorities, ensuring that they are unique.
> 
> Changelog:
> 
> v3: - Renamed power_handler to sys_off_handler as was suggested by
>       Rafael Wysocki.
> 
>     - Improved doc-comments as was suggested by Rafael Wysocki. Added more
>       doc-comments.
> 
>     - Implemented full set of 180 patches which convert whole kernel in
>       accordance to the plan, see link [1] above. Slightly adjusted API to
>       better suit for the remaining converted drivers.
> 
>       * Added unregister_sys_off_handler() that is handy for a couple old
>         platform drivers.
> 
>       * Dropped devm_register_trivial_restart_handler(), 'simple' variant
>         is enough to have.
> 
>     - Improved "Add atomic/blocking_notifier_has_unique_priority()" patch,
>       as was suggested by Andy Shevchenko. Also replaced down_write() with
>       down_read() and factored out common notifier_has_unique_priority().
> 
>     - Added stop_chain field to struct restart_data and reboot_prep_data
>       after discovering couple drivers wanting that feature.
> 
>     - Added acks that were given to v2.
> 
> v2: - Replaced standalone power-off call chain demo-API with the combined
>       power-off+restart API because this is what drivers want. It's a more
>       comprehensive solution.
> 
>     - Converted multiple drivers and arch code to the new API. Suggested by
>       Andy Shevchenko. I skimmed through the rest of drivers, verifying that
>       new API suits them. The rest of the drivers will be converted once we
>       will settle on the new API, otherwise will be too many patches here.
> 
>     - v2 API doesn't expose notifier to users and require handlers to
>       have unique priority. Suggested by Guenter Roeck.
> 
>     - v2 API has power-off chaining disabled by default and require
>       drivers to explicitly opt-in to the chaining. This preserves old
>       behaviour for existing drivers once they are converted to the new
>       API.
> 
> Dmitry Osipenko (25):
>   notifier: Remove extern annotation from function prototypes
>   notifier: Add blocking_notifier_call_chain_is_empty()
>   notifier: Add atomic/blocking_notifier_has_unique_priority()
>   reboot: Correct typo in a comment
>   reboot: Warn if restart handler has duplicated priority
>   reboot: Warn if unregister_restart_handler() fails
>   reboot: Remove extern annotation from function prototypes
>   kernel: Add combined power-off+restart handler call chain API
>   ARM: Use do_kernel_power_off()
>   csky: Use do_kernel_power_off()
>   riscv: Use do_kernel_power_off()
>   arm64: Use do_kernel_power_off()
>   parisc: Use do_kernel_power_off()
>   xen/x86: Use do_kernel_power_off()
>   sh: Use do_kernel_power_off()
>   x86: Use do_kernel_power_off()
>   ia64: Use do_kernel_power_off()
>   mips: Use do_kernel_power_off()
>   nds32: Use do_kernel_power_off()
>   powerpc: Use do_kernel_power_off()
>   m68k: Switch to new sys-off handler API
>   memory: emif: Use kernel_can_power_off()
>   ACPI: power: Switch to sys-off handler API
>   regulator: pfuze100: Use devm_register_sys_off_handler()
>   reboot: Remove pm_power_off_prepare()
> 
>  arch/arm/kernel/reboot.c               |   4 +-
>  arch/arm64/kernel/process.c            |   3 +-
>  arch/csky/kernel/power.c               |   6 +-
>  arch/ia64/kernel/process.c             |   4 +-
>  arch/m68k/emu/natfeat.c                |   3 +-
>  arch/m68k/include/asm/machdep.h        |   1 -
>  arch/m68k/kernel/process.c             |   5 +-
>  arch/m68k/kernel/setup_mm.c            |   1 -
>  arch/m68k/kernel/setup_no.c            |   1 -
>  arch/m68k/mac/config.c                 |   4 +-
>  arch/mips/kernel/reset.c               |   3 +-
>  arch/nds32/kernel/process.c            |   3 +-
>  arch/parisc/kernel/process.c           |   4 +-
>  arch/powerpc/kernel/setup-common.c     |   4 +-
>  arch/powerpc/xmon/xmon.c               |   3 +-
>  arch/riscv/kernel/reset.c              |  12 +-
>  arch/sh/kernel/reboot.c                |   3 +-
>  arch/x86/kernel/reboot.c               |   4 +-
>  arch/x86/xen/enlighten_pv.c            |   4 +-
>  drivers/acpi/sleep.c                   |  25 +-
>  drivers/memory/emif.c                  |   2 +-
>  drivers/regulator/pfuze100-regulator.c |  38 +-
>  include/linux/notifier.h               |  37 +-
>  include/linux/pm.h                     |   1 -
>  include/linux/reboot.h                 | 305 ++++++++++++--
>  kernel/notifier.c                      |  83 ++++
>  kernel/power/hibernate.c               |   2 +-
>  kernel/reboot.c                        | 556 ++++++++++++++++++++++++-
>  28 files changed, 985 insertions(+), 136 deletions(-)
> 

+CC Linus Walleij, Sebastian Reichel and Philipp Zabel; whom I missed to
include by accident.

https://lore.kernel.org/all/20211108004524.29465-1-digetx@gmail.com/T/#t
