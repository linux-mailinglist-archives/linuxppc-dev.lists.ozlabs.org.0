Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C92EFB974
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 21:10:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cwhk5PJ3zF5y2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 07:10:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="kRXw4Avo"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cr3Y6mhfzF6DN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 03:41:29 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id r4so2019064pfl.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 08:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bpYMERXodNN3/IUKFqoV3bu09Kfnjp4MDDbBxGqTaak=;
 b=kRXw4AvoWBw7ukkZ2SwH4DcHmhkOyvtHzm9A9tembEe4SHnL/Wkxs4OG+Y78DFYLKj
 WUQkQ3xkRC7KpV6HsQsVQ8Y83U6DSV4bjqqA4yz8eiAzM5MouyPOfpTV04Q+Swaq6dzO
 iwJ3irSL+AWM6APV8kLc/aiqJnine4lrlZLBQET4Kth1bx1KYWl6QngPsxySaS0LA2u8
 4l3EYQWDxhDPyJMBUmdjQ4AlBq5rQRf2tmZq6s9bjkx4QpbhYyBqV94RH9xa8/CrCe8j
 rdAqy2276oEWDDekf+JPcbvdolRg+K/VuqSY8KHpC1K4x4t7plUDL/CedXLaIDpvWCOd
 tkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bpYMERXodNN3/IUKFqoV3bu09Kfnjp4MDDbBxGqTaak=;
 b=e3VFjJW9PR4iE5JHnE871xorLCP+ggxBvKgikRVal1P9bUrSm8IjtGKjL0s00Sh+HV
 GfKqqpjCt7c0NnqFaZRogvjFmENhN9yVI/H22Vi6uqI8FmMESTHqveNdhq/Yp+040UCw
 jiZe/ve88zMVfTuixT4saJHCQ9yY0OC4PAz802hdacw7vtJ4F+WG2HPjBCivDV0uq5o6
 n5lmEVYD4ROwtb3CzFRo1qbitjS0XGdBWJhbdRPnGiDsqzSeEWiRM9qyHZaECim02mjo
 FbYCAk4Y6ZxPtoVKi+bEzgLHFj2AXa9fZ7rykDvPACtHLmllphjXjmlFAC/QgHrYK2El
 uGPQ==
X-Gm-Message-State: APjAAAU7xyBqDWnPyZLEx7ViWMml91NkEnYWsZ70NN2Dw6KA6ZN0VmHZ
 VGeLWNodIOyk7MVrDPBsU3oQoQ==
X-Google-Smtp-Source: APXvYqxGmsqG/IrGmwAGiFxwnMwQ7BOsmJMkITh9aVjyUYUrJF/k6QpL2RmzoyB1mQQoM3FoiW7TOw==
X-Received: by 2002:a63:c55:: with SMTP id 21mr4829337pgm.282.1573663285447;
 Wed, 13 Nov 2019 08:41:25 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id h4sm2954304pjs.24.2019.11.13.08.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2019 08:41:24 -0800 (PST)
Subject: Re: [PATCH 00/50] Add log level to show_stack()
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
References: <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com> <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com> <20191113012337.GA70781@google.com>
 <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
 <20191113063334.GA147997@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <578d041a-3ce5-28bb-9fcc-cf90fe82b036@arista.com>
Date: Wed, 13 Nov 2019 16:40:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191113063334.GA147997@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 14 Nov 2019 06:57:20 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, Jiri Slaby <jslaby@suse.com>,
 Matt Turner <mattst88@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-um@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Richard Henderson <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Douglas Anderson <dianders@chromium.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Brian Cain <bcain@codeaurora.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 kgdb-bugreport@lists.sourceforge.net, linux-snps-arc@lists.infradead.org,
 Fenghua Yu <fenghua.yu@intel.com>, Borislav Petkov <bp@alien8.de>,
 Jeff Dike <jdike@addtoit.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Mark Salter <msalter@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Michal Simek <monstr@monstr.eu>, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wessel <jason.wessel@windriver.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sergey,

On 11/13/19 6:33 AM, Sergey Senozhatsky wrote:
[..]
> Well, here we go. There is a number of generally useful functions that
> print nice data and where people might want to have better loglevel control
> (for debugging purposes). show_stack() is just one of them. Patching all
> those functions, which you have mentioned above, is hardly a fun task to do.
> Hence the printk() per-CPU per-context loglevel proposition. The code there
> is not clever or complicated and is meant for debugging purposes only, but
> with just 3 lines of code one can do some stuff:
> 
> 	/* @BTW you can't do this with "%s" KERN_FOO ;P */
> +	printk_emergency_enter(LOGLEVEL_SCHED);
> +	debug_show_all_locks();
> +	printk_emergency_exit();

Not that I want to critic your proposal more, but just to clarify what
I've meant by "cleaver and complicated":

I don't think semantically there is any difference between:

printk_emergency_enter(LOGLEVEL_SCHED);
printk();
printk_emergency_exit();
vs
printk("%s ...", KERN_SHED, ...);

I was speaking about complexity not about usage, but about realization
inside printk_emergency_enter(): there will be some business logic that
will do "it's NMI? Use loglevel given. it's KERN_ALERT? Don't downgrade
the loglevel..." and other smart details those are really logic which
one have to think about and later maintain.

There will be also minor issues like people inserting print with one log
level and seeing it in dmesg with another, but I presume those
printk_enter() and printk_exit() will cover little amount of code
without much nesting [as long as it's not getting overused]. And also it
can be documented and people will learn about another feature of printk().

And this year I've seen the presentation "Why printk() is so
complicated?" and I presumed that the approach is to keep things as
simple as possible.

In conclusion:
I see that your proposal also solves the problem [except preemption and
some pr_debug() that shouldn't be printed]. And I think your approach is
better in the sense of short-term (we won't have any missed %s KERN_ in
linux-next), but in a long-term it adds some amount of business logic to
printk and another feature.

Just in case: again, I don't mind, it's up to you, maintainers of
printk. It's also not very fun for me to create those patches.
But they fix console_loglevel issues (I hope we could un-export it in
the end) and also I need it for my other patches those will produce
warnings with debug loglevel when configured through sysctl.

Thanks,
          Dmitry
