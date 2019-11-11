Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F883F81E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 22:13:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Bk9x5HN5zF0Y9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 08:13:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="cZIehrzG"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BhHK41NdzF3MS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 06:47:40 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id u18so586069wmc.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 11:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QOJc4N4PavQU2sAVS1vG4t8ohqXXXnqqV8/w5qQonB8=;
 b=cZIehrzGpUFezD2aa4zmv8OufN5OtO0USzsaArEEUTu0egX1JDp7fXq/MKdHB+YxUr
 j/kC7hgtECdh5x1noQBDdzd4zMsGonK7DNa4R/e8/R7qxcehDcLnLo5qSFE4wjuyW42o
 PQpFktb3ed0G2yVCt/fgkRLVHHWNH3ragHLlsd4kHSnraDACO77RcGzlulVu3SB7tcFm
 Ka75d1q24hYXLZJbDgNbGl6ynhrMJhmWegwmwjFp7I5D0Fg2d54s1iF9aPGxd1hnX+B8
 gISwE6rYfN65iX3ZaYqQ/BYKUKfAwSvjgwPgiFEkk/eO1PVC0atmmvIxVoVwNPzimOsY
 R2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QOJc4N4PavQU2sAVS1vG4t8ohqXXXnqqV8/w5qQonB8=;
 b=M/d12HKMuhfQAybp0jnVkMARUW86gNBao0uBWhxkLVCukcqFeAXXFKTCUCnHttNMfN
 Pp/GG9XqWa7MC+wIwyXjq8LILBl+W/aHhsMk4O7w1LCM3AOGgYR2T8BEuVL2JLMaljpW
 jErdrZGi2dyqQojDEYMZSEKFqlCzDnOeh9vx5GgSx371Yfk+4yj+RMt3FkyQ3KSf3H08
 Pq4rw9v2LLrEDV9Q/8m1QJUrr3dp6ZTWWgH8kXM2o2D15Jw4wGjSoQPd3ZkoQc/J4Ey9
 S7W9UIqvqbqJ7hkXdkZNBIUBdTWUQsPiw3flDdoo9/3NHvmGepvZTdMwktakOBmE+0ep
 EyMA==
X-Gm-Message-State: APjAAAXcUzgfW0ctnhg2QbPskZUAtQ4I6NUJ37hBCLnyilxVIrsxywi5
 Hb12F1v0je24w5Qso6xFGe2Xyg==
X-Google-Smtp-Source: APXvYqwUswzQhu0DkD+M5khz/mFK8gHdabdOoahgxknZZUvPWQw4U7A4JmJR+GV6KsoYg/TOZHa6cQ==
X-Received: by 2002:a1c:2342:: with SMTP id j63mr585268wmj.56.1573501654084;
 Mon, 11 Nov 2019 11:47:34 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id f67sm723039wme.16.2019.11.11.11.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 11:47:33 -0800 (PST)
Subject: Re: [PATCH 00/50] Add log level to show_stack()
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Petr Mladek <pmladek@suse.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
Date: Mon, 11 Nov 2019 19:47:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191111012336.GA85185@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:11:23 +1100
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
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
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

Hi Sergey, Petr,

On 11/11/19 1:23 AM, Sergey Senozhatsky wrote:
> On (19/11/08 14:04), Petr Mladek wrote:
> [..]
>> I agree that it is complicated to pass the loglevel as
>> a parameter. It would be better define the default
>> log level for a given code section. It might be stored
>> in task_struct for the normal context and in per-CPU
>> variables for interrupt contexts.
> 
> I do recall that we talked about per-CPU printk state bit which would
> start/end "just print it" section. We probably can extend it to "just
> log_store" type of functionality. Doesn't look like a very bad idea.
> "This task/context is in trouble, whatever it printk()-s is important".

I don't see how bits on task_struct or in per-cpu are easier than
supplying a log level parameter down the stack.
How would it work if sysrq_handle_crash() called by key-press?
How would that interact with deferred printing?
How would it make visible prints from current context, but not from
something that preempted it?

Furthermore, what problems are you trying to solve with this design?
Only sysrq driver? Kdb?
In my perspective it sounds too complicated and over-engineered for
something that has two-three users.
Also I've tried to point that I need to print backtrace sometimes with
KERN_DEBUG loglevel to use it in production for early notices those
needs to go only to log files and currently each architecture decides
which log level it prefers.

And what's so complicated about this patches set? I see only side of the
testing, but the build-testing is covered with 0day bot and cost nothing
and any visible regression may be found during -next period.
While introducing those printk-sections may subtly break things.

I mean, I definitely know less about printk() and its internals than you
- so my points may be a no-sense.

What I'm going to do - is to fix all build and reported issues, I'll
send v2 this week and feel free to NAK it, I will forget about those
patches and won't be offended.
I don't see many people those are "hey, we'll benefit from this".
And doing this patches set was neither quite fun (dirty business), nor
something I can be later proud of (hey, I've introduced the log level
parameter to printing functions!).

Thanks,
          Dima
