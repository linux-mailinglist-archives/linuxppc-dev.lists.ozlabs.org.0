Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918A347342
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 09:20:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F51Q82wlbz3bqd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 19:20:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.50; helo=mail-vs1-f50.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F51Pq0Lh5z2ysp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 19:20:13 +1100 (AEDT)
Received: by mail-vs1-f50.google.com with SMTP id b5so10885278vsl.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 01:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b99vyQcaCpQD3pMXQougjwNkTLQcQ7H7qW0vVRZg68k=;
 b=piWpUm47SwoKDFWImUAIdOHWgU8pqGDbp0duj+vdNYiipkZ4N8XX/Y5lAY8+tWLCeA
 NUuf40hmw4U8IaDgFunYRTeeabR3l60HGc3m+Wyos+/SBmh1scRff9NpUMcnTwTY/J7J
 4dFLKesSnZpJvrtmk3uwM2LxoM+V4Q+2cT1NHlHzSs684i7zFaV1+9+KtlxyQW64Y9L5
 asP8bVmtaLCT//Nhp65hkLtuFMfGcyJJI0HjXwzvJD7iPYgGrTTXPRuzxKX/uFxepPW1
 Z0VZIjGsD0/FcnuhrcrhAitWfFSV0sviAB8pinejOHP/XaZsbHyQVisqsOzNYjYJUfpV
 AXjw==
X-Gm-Message-State: AOAM532VDzQHNUo0DszqzpCSaIccy8SNUW31fd3baKPxKylINm7pltum
 UlZjkUHfqMkei0EFCzcksSkRGk9eeKF/7Qwp600=
X-Google-Smtp-Source: ABdhPJyjNSyRygty85egDfQ+7ndwN29LWZNv+wRv4AgkR+qa6UdFybjZKqvGwrDgePDt/lvLzh/gWVwzhx66YKHThC4=
X-Received: by 2002:a67:8883:: with SMTP id k125mr950544vsd.18.1616574009774; 
 Wed, 24 Mar 2021 01:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210323091257.90054-1-heying24@huawei.com>
 <YFppJkpZRHMJFay0@piout.net>
In-Reply-To: <YFppJkpZRHMJFay0@piout.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Mar 2021 09:19:58 +0100
Message-ID: <CAMuHMdWfFtJOQQf0b-2QJRd1EMLSW7rDsjNYzjjZhg6=JNZ0AA@mail.gmail.com>
Subject: Re: [PATCH v2 -next] powerpc: kernel/time.c - cleanup warnings
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, frederic@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 kernelfans@gmail.com, Thomas Gleixner <tglx@linutronix.de>,
 Michal Suchanek <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, He Ying <heying24@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alexandre,

On Tue, Mar 23, 2021 at 11:18 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 23/03/2021 05:12:57-0400, He Ying wrote:
> > We found these warnings in arch/powerpc/kernel/time.c as follows:
> > warning: symbol 'decrementer_max' was not declared. Should it be static?
> > warning: symbol 'rtc_lock' was not declared. Should it be static?
> > warning: symbol 'dtl_consumer' was not declared. Should it be static?
> >
> > Declare 'decrementer_max' and 'rtc_lock' in powerpc asm/time.h.
> > Rename 'rtc_lock' in drviers/rtc/rtc-vr41xx.c to 'vr41xx_rtc_lock' to
> > avoid the conflict with the variable in powerpc asm/time.h.
> > Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
> > is declared there.
> >
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: He Ying <heying24@huawei.com>
> > ---
> > v2:
> > - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
> >   rtc_lock in powerpc asm/time.h.
> >
>
> V1 was actually the correct thing to do. rtc_lock is there exactly
> because chrp and maple are using mc146818 compatible RTCs. This is then
> useful because then drivers/char/nvram.c is enabled. The proper fix
> would be to scrap all of that and use rtc-cmos for those platforms as
> this drives the RTC properly and exposes the NVRAM for the mc146818.
>
> Or at least, if there are no users for the char/nvram driver on those
> two platforms, remove the spinlock and stop enabling CONFIG_NVRAM or
> more likely rename the symbol as it seems to be abused by both chrp and
> powermac.

IIRC, on CHRP LongTrail, NVRAM was inherited from CHRP's Mac ancestry,
not from CHRP's PC ancestry, and thus NVRAM is not the one in the
mc146818-compatible RTC.

http://users.telenet.be/geertu/Linux/PPC/DeviceTree.html confirms that,
showing that nvram is a different device node than rtc.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
