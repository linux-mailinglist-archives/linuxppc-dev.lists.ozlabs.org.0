Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A33FAD88
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 10:47:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cfsz1PDQzF7Zp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 20:47:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=sergey.senozhatsky.work@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U+7/ZvVf"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CZZF4GdnzF3nh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 17:33:41 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id ay6so649267plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 22:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KPZG4VqXDKJQhwt8QhBKSdwu6zZ1yvGSLXAAovETV8E=;
 b=U+7/ZvVfxKk+hxsLJDRIKIa9v9E62t1+RHHdRG8fTOKlKCc4Kg8kLlVghoiEvtLKpI
 pPB/09WWUgNDAvmTd9ZCgUOuDBo7+0/f9WrOXWR2uZQ/aTiznYX6i7YMJNAQqiVBiT9D
 uNMlkpfHxoC092SA3lqUUmN6Py1jaNvbxPVR7bhPPMcnC5VVTdQfrrvn9g+mwUT9wmS5
 IpQo+ozODVnxdup9AaHr+12x4K6wNPJd6H6aHacy3JkNKTrjQ9VPgzg12dvkP1Aua/p8
 JdT9N+L+Gr2JhZIIZgVnzKCc48NZMHSHGJjqaFnpF0Bg0opyuGJWVOEoMHo8Jbl+CwGg
 Qilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KPZG4VqXDKJQhwt8QhBKSdwu6zZ1yvGSLXAAovETV8E=;
 b=hVSZ27rIlHYkvLqZ5b6ojZdYD3difA/LPMPwXsa0AVAn8MxMItEmTj0oJChmIebd1R
 vlLLfH3RyQK8RBSGkoSVJ+HGthWU1tRaf4C5jr14eYvA08/BvKbA5RnB3eGS8KI+hj5m
 bKxD9FvAhdDI27UxNI3mvHu9TnuAqkhN2aF1EMpBVq/1tu6NJLWZ8tlEfkQQIxlu6F0Q
 i6FYXhv6jRem7yuI9TI9JZE2EgpKxnbjnN+hgrlivldssvonVmIsZF7MIVFSzDS5qVfE
 /T+bxIe0OrkULS6ee1j/fHyfy9FAiLRXbgi2nR3NWNy3INFhatvKZcgl/kHHE4FUBZnW
 JM9A==
X-Gm-Message-State: APjAAAXZU9J/rRTEdd7uXsyW4JKvGO28+KhYZb7pSQdO1ixHwdgOnSBf
 f98NWHxK+htA29cUzc35WGo=
X-Google-Smtp-Source: APXvYqw/EXwYt3YxwlYA4wZk8PjZNxrmOm0/6WUJy4pyQbt0uw3oeq/94f1ysfc7w8q8vIp4HTP4BA==
X-Received: by 2002:a17:902:5a44:: with SMTP id
 f4mr2028828plm.174.1573626818736; 
 Tue, 12 Nov 2019 22:33:38 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id i16sm1209291pfa.184.2019.11.12.22.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 22:33:37 -0800 (PST)
Date: Wed, 13 Nov 2019 15:33:34 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191113063334.GA147997@google.com>
References: <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
 <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com>
 <20191113012337.GA70781@google.com>
 <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 13 Nov 2019 20:43:22 +1100
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
 Paul Burton <paulburton@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, Jiri Slaby <jslaby@suse.com>,
 Matt Turner <mattst88@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Petr Mladek <pmladek@suse.com>, linux-pm@vger.kernel.org,
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
 Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>,
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

On (19/11/13 02:25), Dmitry Safonov wrote:
> I guess I've pointed that in my point of view price for one-time testing
> code is cheaper than adding a new printk feature to swap log levels on
> the fly.
[..]
> I've gone through functions used by sysrq driver and the same changes
> introducing log level parameter would be needed for: sched_show_task(),
> debug_show_all_locks(), show_regs(), show_state(), show_mem(). Some of
> them don't need any platform changes, but at least show_regs() needs.

Good points and nice conclusion.

Well, here we go. There is a number of generally useful functions that
print nice data and where people might want to have better loglevel control
(for debugging purposes). show_stack() is just one of them. Patching all
those functions, which you have mentioned above, is hardly a fun task to do.
Hence the printk() per-CPU per-context loglevel proposition. The code there
is not clever or complicated and is meant for debugging purposes only, but
with just 3 lines of code one can do some stuff:

	/* @BTW you can't do this with "%s" KERN_FOO ;P */
+	printk_emergency_enter(LOGLEVEL_SCHED);
+	debug_show_all_locks();
+	printk_emergency_exit();

Now...
I'm not sure if this whole thing is up to "printk maintainers only".
If no one is going to use "emergency printk contexts" then there is
no point in having that code in the kernel.

	-ss
