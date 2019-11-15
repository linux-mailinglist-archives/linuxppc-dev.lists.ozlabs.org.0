Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7748FD393
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 05:09:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DlH747RQzF7Cv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 15:09:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=sergey.senozhatsky@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rosvxXmb"; 
 dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Dkhl1KHXzF6SH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 14:43:17 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id g12so3275776qvy.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 19:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R4XvROx888fXHPMG3Yq7w0aZuXsuTxn0lpM2IVqDtzs=;
 b=rosvxXmbxVwR1vACXmA9SkZCr7uwAAKB6UJ8GlY8l4n3tXBdK85d2C9bdYAAEJpyjW
 fFT+vr+mLl81JuDMdjUW+anF/Xfc5QEH7c2oMcSh2P3aCNGkUk5+dRVglouCIodq7WHR
 JntZpByfaG3f7z0ITWNWyjrHYUvHFedDz7NuSv9ofmpS9hbezDyvMp+CoX7pBe/a9BYH
 /5ccIl6Ob9b8/5VHy4+InTzOLbgcfU08QWMmpxugSNVufjRM7H87w0j0Xx9TVnx7E9kd
 kxH5U2h1R9bMcCLWkDU/RL/xXI7ZSl6Xqv3IfS/GbHtrXQnrqR+tQq1vNAk34F04bDED
 gXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R4XvROx888fXHPMG3Yq7w0aZuXsuTxn0lpM2IVqDtzs=;
 b=ccZuVpE+pSWZY4RiSCYzGxBSVVfA/2EIgB3z9s5vWsB/C0dMLbSQLNZULI9AmZPgrC
 +yVNRtSxilAk+OXqkVazrsDu5LYCAS0B9jg+Qk54QBUFD+RQw+d92Cys5GoNTNAjkLS/
 dy1EForyL5zGFa3xlqe13BUxQ63TFTBuq9YEr0l1rP+uufAg1FrheLvpHGlgCkqzEw7m
 u5dDC8bHZZdblwixBpfroq9d1OmzUZ+xFoLSaqleuWdoVRT+KgzBM9E9MKOyHEYv55Hv
 obTyFSzW5dTgHi53S9cIek+y3DvNXrtBRXGMXQIuNWh7ATeA9v3ijE8Agd4wAculYryP
 FapQ==
X-Gm-Message-State: APjAAAVHMuxmYn2mTAGiPYSzVlilcUHXhPpn9vXgHB/oW4WiQswk0vC3
 sybakwzursRnOwXfUJfhE3NBeEfAX78=
X-Google-Smtp-Source: APXvYqwa2DybaatOPAzowDw1CIcEQNF5GJFztVtnxnB/hIwTXcIG59PN65RlFcbDJvpIicCUEmC1oA==
X-Received: by 2002:a63:7cf:: with SMTP id 198mr13931473pgh.372.1573789020559; 
 Thu, 14 Nov 2019 19:37:00 -0800 (PST)
Received: from localhost ([2a00:79e1:abc:f604:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id y22sm8178148pfn.6.2019.11.14.19.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 19:36:59 -0800 (PST)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Fri, 15 Nov 2019 12:36:57 +0900
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191115033657.GA407@tigerII.localdomain>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
 <20191113103922.3dc3e8e9@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113103922.3dc3e8e9@gandalf.local.home>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 15 Nov 2019 15:07:57 +1100
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
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-um@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Richard Henderson <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
 Jeff Dike <jdike@addtoit.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, "David S. Miller" <davem@davemloft.net>,
 Rich Felker <dalias@libc.org>, Len Brown <len.brown@intel.com>,
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

On (19/11/13 10:39), Steven Rostedt wrote:
[..]
> > void show_stack(struct task_struct *task, unsigned long *sp, int log_level)
> > {
> > 	printk_emergency_enter(log_level);
> > 	__show_stack(task, sp);
> > 	printk_emergency_exit();
> > }
> > // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //
> >
> > show_stack() never schedules, disabling preemption around it should
> > not change anything. Should it be interrupted, we will handle it via
> > preempt count.
>
> Please no! The whole point of the printk rewrite was to allow for
> printk to be preemptible and used in more contexts. The show_stack() can
> be all over the place and is not a fast function. Let's not disable
> preemption for it.

I never said that this code should be used all over the place. What
I did say several times was that this code is for quick debugging,
when one sits behind a slow serial console and wants to tweak loglevel
of all printk-s of a particular context/function only.

	-ss
