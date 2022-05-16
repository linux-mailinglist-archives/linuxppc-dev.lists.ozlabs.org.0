Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D13E52931B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 23:45:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2CVP2tbvz3dPN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 07:45:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ui6BaQ6l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=evgreen@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Ui6BaQ6l; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L24463Hrzz3bwG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 02:11:01 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 m6-20020a05683023a600b0060612720715so10363121ots.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 May 2022 09:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ScgtWm2uFkOxfulqs7520gHM/my4MYIe3yq/VcV3Ozw=;
 b=Ui6BaQ6lQ9IwPfOUL4TJm7cJvfYf8UFV8wI0yIE/ecSwLqobvQf4rTIikXPC8Ksnp/
 JRSTr3Fgwya3hm14X44WgUx1HJGuc9H1MoeHAN4VBzxuhJEnypxN8+xF6HAWoKiAVAs3
 mxYrKvjtDKZ5Z0eJvjVSmqSHIwF8R/De7GbNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ScgtWm2uFkOxfulqs7520gHM/my4MYIe3yq/VcV3Ozw=;
 b=p5rvM7NZxd7S+WEil7oBhbIIcvBl5Ev5J8/kY48cl6keafzw1ljqfGRoKllkmENfjv
 rQJaXTNzTYGTzdkarW/bBC4pRJeQzaWWGpfHkDQpUuzpADpdeXRQbxWlyT8f+TMxVZ91
 dZ9TijDfgAlexEho0R5n3wFuktST1gQ45NnwKifcxFi88sMoIE9YBYnogV4jabBAywid
 TRFL5FXZqL1YFtAV/IO1R46CQ7+JrhpG71I1bkKAgXAKRVHNQ5D8takKqzUagsM/aMjm
 RbaMxQsh0frctGFsWoMtBXaMQ4nUhj75icXEN8U7YZ7rfmeReoFGkc0kGV4JkH8qaV6k
 SnXg==
X-Gm-Message-State: AOAM5338Kb0whx9+kElpQDA1PioZcEWvWY9KshPrFSEBI3dOCkGI6gbn
 qecahENhD5pTWAPavPVCsxJ1yPuwEf+tYzN0
X-Google-Smtp-Source: ABdhPJx2uyUY9TwUw3LTZZdWN+zHU8RQO0fbqYXV3+dm8O/g6aeJf0td8t3yfW7Tc+bohqDy0zCjbA==
X-Received: by 2002:a05:6830:3114:b0:606:181f:5daf with SMTP id
 b20-20020a056830311400b00606181f5dafmr6467011ots.335.1652717457864; 
 Mon, 16 May 2022 09:10:57 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com.
 [209.85.160.48]) by smtp.gmail.com with ESMTPSA id
 a1-20020a056870374100b000edda81f868sm5373593oak.10.2022.05.16.09.10.57
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 09:10:57 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-e656032735so20804442fac.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 May 2022 09:10:57 -0700 (PDT)
X-Received: by 2002:a05:6870:63a0:b0:f1:8bca:8459 with SMTP id
 t32-20020a05687063a000b000f18bca8459mr4861359oap.174.1652716966894; Mon, 16
 May 2022 09:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley> <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
In-Reply-To: <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
From: Evan Green <evgreen@chromium.org>
Date: Mon, 16 May 2022 09:02:10 -0700
X-Gmail-Original-Message-ID: <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
Message-ID: <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 17 May 2022 07:40:39 +1000
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
Cc: Paul Mackerras <paulus@samba.org>, Justin Chen <justinpopo6@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, xen-devel@lists.xenproject.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Petr Mladek <pmladek@suse.com>, Linux PM <linux-pm@vger.kernel.org>,
 linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, luto@kernel.org,
 Mihai Carabas <mihai.carabas@oracle.com>, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, senozhatsky@chromium.org,
 d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-hyperv@vger.kernel.org,
 dave.hansen@linux.intel.com, linux-s390@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 vgoyal@redhat.com, Sven Schnelle <svens@linux.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, linux-xtensa@linux-xtensa.org,
 john.ogness@linutronix.de, Scott Branden <scott.branden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Markus Mayer <mmayer@broadcom.com>,
 hidehiro.kawai.ez@hitachi.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 kernel-dev@igalia.com, fabiomirmar@gmail.com, halves@canonical.com,
 alejandro.j.jimenez@oracle.com, feng.tang@intel.com,
 Will Deacon <will@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 bhe@redhat.com, Jonathan Corbet <corbet@lwn.net>,
 Dexuan Cui <decui@microsoft.com>, zhenwei pi <pizhenwei@bytedance.com>,
 bcm-kernel-feedback-list@broadcom.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, rostedt@goodmis.org,
 rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 openipmi-developer@lists.sourceforge.net,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-alpha@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, peterz@infradead.org,
 linux-remoteproc@vger.kernel.org, mikelley@microsoft.com,
 sparclinux@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-leds@vger.kernel.org, x86@kernel.org,
 mingo@redhat.com, dyoung@redhat.com, paulmck@kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 David Gow <davidgow@google.com>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>, linux-edac@vger.kernel.org,
 jgross@suse.com, netdev@vger.kernel.org, kernel@gpiccoli.net,
 kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 Julius Werner <jwerner@chromium.org>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 16, 2022 at 8:07 AM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Thanks for the review!
>
> I agree with the blinking stuff, I can rework and add all LED/blinking
> stuff into the loop list, it does make sense. I'll comment a bit in the
> others below...
>
> On 16/05/2022 11:01, Petr Mladek wrote:
> > [...]
> >> --- a/arch/mips/sgi-ip22/ip22-reset.c
> >> +++ b/arch/mips/sgi-ip22/ip22-reset.c
> >> @@ -195,7 +195,7 @@ static int __init reboot_setup(void)
> >>      }
> >>
> >>      timer_setup(&blink_timer, blink_timeout, 0);
> >> -    atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
> >> +    atomic_notifier_chain_register(&panic_hypervisor_list, &panic_block);
> >
> > This notifier enables blinking. It is not much safe. It calls
> > mod_timer() that takes a lock internally.
> >
> > This kind of functionality should go into the last list called
> > before panic() enters the infinite loop. IMHO, all the blinking
> > stuff should go there.
> > [...]
> >> --- a/arch/mips/sgi-ip32/ip32-reset.c
> >> +++ b/arch/mips/sgi-ip32/ip32-reset.c
> >> @@ -145,7 +144,7 @@ static __init int ip32_reboot_setup(void)
> >>      pm_power_off = ip32_machine_halt;
> >>
> >>      timer_setup(&blink_timer, blink_timeout, 0);
> >> -    atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
> >> +    atomic_notifier_chain_register(&panic_hypervisor_list, &panic_block);
> >
> > Same here. Should be done only before the "loop".
> > [...]
>
> Ack.
>
>
> >> --- a/drivers/firmware/google/gsmi.c
> >> +++ b/drivers/firmware/google/gsmi.c
> >> @@ -1034,7 +1034,7 @@ static __init int gsmi_init(void)
> >>
> >>      register_reboot_notifier(&gsmi_reboot_notifier);
> >>      register_die_notifier(&gsmi_die_notifier);
> >> -    atomic_notifier_chain_register(&panic_notifier_list,
> >> +    atomic_notifier_chain_register(&panic_hypervisor_list,
> >>                                     &gsmi_panic_notifier);
> >
> > I am not sure about this one. It looks like some logging or
> > pre_reboot stuff.
> >
>
> Disagree here. I'm looping Google maintainers, so they can comment.
> (CCed Evan, David, Julius)
>
> This notifier is clearly a hypervisor notification mechanism. I've fixed
> a locking stuff there (in previous patch), I feel it's low-risk but even
> if it's mid-risk, the class of such callback remains a perfect fit with
> the hypervisor list IMHO.

This logs a panic to our "eventlog", a tiny logging area in SPI flash
for critical and power-related events. In some cases this ends up
being the only clue we get in a Chromebook feedback report that a
panic occurred, so from my perspective moving it to the front of the
line seems like a good idea.

-Evan
