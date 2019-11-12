Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9652F8874
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 07:21:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByM51HdKzF4hs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 17:21:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="MX42aMTT"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BsRY1W4bzF3d6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 13:40:24 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id l17so1429422wmh.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 18:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hc0bl6ua3Awo0puTEJJtiCFLlsTJGov09J6GyMYDUcw=;
 b=MX42aMTTzAgzmolo19ziCaVvJW01j4llkcsSSsPBgIZf5M/QJqFnu0ykgQ+YU9I1XM
 lWWUfFOOmvWQUbOV/+iKy4yX6WRH0x7F+7sbAobnLPJdwSzb9YWyJ9/pnJvSWZVMB+xV
 UFEneok+5nQrKqWY1H/ryexuorVth0ci9XQccgC0yNGEatwsWoLWkeJcz3zYnXhenkJH
 nhLbJhqGH8CSvC3ekwmNTkFJs9KRa26JVi5KOJ0GN3lmDlPGH14xef5YqFU0Sk8qUi0p
 NtXZ7DYgZXwHf2rN/1LtOFtVEw8aJlkAZJ8tf3acCKNzLndcz00BKo1YrVsWG4zo53JF
 Pi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hc0bl6ua3Awo0puTEJJtiCFLlsTJGov09J6GyMYDUcw=;
 b=crgpXI7WGsgiq1Z8GwQDrE8mhEzlaFmTm+7VDgHEo2YueetfneLtqD9aPvq1KEdEIG
 PVbAgMn2A3iOHc3VcvfZMw0cRNN8EhLb9Duv/Q5TDm+JjGPctbIRWnDrnnDUjiR3mHr/
 YcTOc05suVrio0yrMIPTPA18LOhyWNN5LcOvPZYhsHFeeXByh5UCZyqPgpz3sdYOrbvv
 2JLGYQorirzjz83qIHLpDT9uPtUETUk+tSaOZIJVROoOBrroN4nQzWq1ZveofheRjiAk
 Qf4BwSYxdkd5wULVQiF33s4UxXg7AY+eIELMEz+XU6aFelNVID/V4EPn5zUBdjHM4nnz
 D+nw==
X-Gm-Message-State: APjAAAX1WktSQWoe+ueQ9WQk0UYlpceh7aGxuKsLu0Oe+1y2PNuXvPM2
 dw6S7RkqiKx2khIxBPJOrATqkg==
X-Google-Smtp-Source: APXvYqwGQmDILzErOejMnS6vcYmyu3aXwuweLJ3fDyVGcyV1rhcTRlJUkjSBJvf4yqYURAoU8N6Q/w==
X-Received: by 2002:a7b:c211:: with SMTP id x17mr1567811wmi.71.1573526420054; 
 Mon, 11 Nov 2019 18:40:20 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id u26sm1511046wmj.9.2019.11.11.18.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 18:40:19 -0800 (PST)
Subject: Re: [PATCH 00/50] Add log level to show_stack()
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
Date: Tue, 12 Nov 2019 02:40:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191112021747.GA68506@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 12 Nov 2019 17:17:43 +1100
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

On 11/12/19 2:17 AM, Sergey Senozhatsky wrote:
> On (19/11/11 19:47), Dmitry Safonov wrote:
[..]
>> What I'm going to do - is to fix all build and reported issues, I'll
>> send v2 this week and feel free to NAK it, I will forget about those
>> patches and won't be offended.
> 
> Lovely.
> And - no, I'm not going to NAK platform specific changes. Just so you know.
> 
> *All* I'm talking about is an alternative, less "go and touch a ton of
> platform code" approach. The argument "I patched so many files that I'm
> not even going to discuss anything now" is not productive, to say the
> least. Hope this clarifies.

It probably was a wrong impression from the both sides.
My impression was "You touch every architecture - we won't even consider
that". Sorry for the the wrong impression from my side - I'm open for
discussion.

In my point of view the cost of one-time [mostly build] testing every
architecture is cheaper than introducing some new smart code that will
live forever. Though, again you and Petr understand more than me in
printk() code, so I'm not any insisting.

I'll reply to your suggestion tomorrow, it's a bit late in my tz.

Thanks,
          Dmitry
