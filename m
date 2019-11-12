Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C15F8877
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 07:26:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByRz1TgpzF5BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 17:26:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=sergey.senozhatsky.work@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D8FdqJ91"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BwCC6kcGzF4cj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 15:44:54 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id 3so12411901pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 20:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z6L3+hI6K7wkMCOOKfC6B5htW9e/NujoD4rmfI82OVU=;
 b=D8FdqJ91C9CViimFs5HkqTNzLfTnpza7YcDlJMaUW/GYDtbpWN+jf3gagVp5Pb54ut
 pJnpc/x6Rud5mFzPf0ZReA35hd11ljJ6cO/5F7Ue3e6hQ2TSEJ94YRDSGLm6NhnyCdqt
 CzzD2BCnxTXK5GtYHwa3Uusyd8eoRKj//LeZNogwczP3XkHhZ0DhI0uDpEhLu6Pcihhn
 H3BS+MU+Nl1Oowf4/jk8zWm4nc12KVZM+ffZ6sfZ7WtTjgYJy574lkrjNaKPgYx+dzhc
 p2jV1Cc9pO8ZsG8xspjchyhzIZQ4FAt5l5TNSRCxJncAjNaATr8g0kc1uRTSgUAVAp1B
 466Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z6L3+hI6K7wkMCOOKfC6B5htW9e/NujoD4rmfI82OVU=;
 b=YsMcFYiB6ggHd2P/SJIQCPESvla4I0Yb6lM2iLjI2jvEf2Ua8a31Gg5zfJTuv/Q/K+
 4lihdQZfFweAU9CL6y/EXJMWYqc+XK8ZoJR0q6AL0Ps9stkxEhUZ+zWa4y0+Z+ICexwS
 su1qFIa4mvnJNCz3WLLZkXSYBg5g08F7Is6bBJo0TjVYhzxtWF1hMvWegQU+v75QrIRU
 p5U0WSGppW0MQsWhwLKM5GIkpfnC5u5jNH/qQjfbbuhhK93ydH7+n4g2sDKCIE47AqT7
 TcPn8Z9TcQg1RN8lQtt8CcW0fa6k7bdeq4BDW6NatHZlrXlk/ZxwQpgmdul/sK16LlUD
 q7rA==
X-Gm-Message-State: APjAAAXA9Zv1RC15kiFS+K2rSR1tMUvXE71+YmFJA17a2i/2jZQDo02f
 wzgyyCM3lgJ4h33IbuyGnW0=
X-Google-Smtp-Source: APXvYqwNPlyjQTahvdEBWCuI4Zd+Adrk+027CcV4KySo2l3EKHcRsdH9n54f0hJl6o3TjoADo67N4w==
X-Received: by 2002:a63:d802:: with SMTP id b2mr32909872pgh.414.1573533890747; 
 Mon, 11 Nov 2019 20:44:50 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id l62sm18583061pgl.24.2019.11.11.20.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 20:44:49 -0800 (PST)
Date: Tue, 12 Nov 2019 13:44:47 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191112044447.GA121272@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Ben Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Dmitry Safonov <dima@arista.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mel Gorman <mgorman@suse.de>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Len Brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-um@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
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

On (19/11/11 10:12), Petr Mladek wrote:
[..]
> > I do recall that we talked about per-CPU printk state bit which would
> > start/end "just print it" section. We probably can extend it to "just
> > log_store" type of functionality. Doesn't look like a very bad idea.
> 
> The problem with per-CPU printk is that we would need to disable
> interrupts.

Or disable preemption and have loglevel per-CPU and per-context.
preempt_count can navigate us to the right context loglevel on
particular CPU. I'm talking here only about backtrace (error)
reporting contexts. Those can be atomic perfectly fine.

I posted a silly code snippet.

[..]
> But yes, this per-code-section loglevel is problematic. The feedback
> against the patchset shows that people want it also the other way.
> I mean to keep pr_debug() as pr_debug().

Hmm. Right.

> A solution might be to use the per-code-section loglevel only instead
> of some special loglevel.

So maybe we can "overwrite" only KERN_DEFAULT loglevels?
We certainly should not mess with SCHED or with anything in between
EMERG and ERR.

> The explicitly passed loglevel makes me feel more confident that
> all needed printk() calls were updated. But it might be a false
> feeling. I do not really have any strong preference.

I'm not like really objecting, just trying to explore some other
options.

	-ss
