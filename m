Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E9FA7E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 05:16:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CWWw2wMlzF6v8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 15:16:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="BPU+KO8V"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CT4B3gB1zF52J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 13:25:45 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id h4so325986pgv.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 18:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nujO1oAvQuda3HPNop9afPS+ilUfrJs0rYOKUqnCb18=;
 b=BPU+KO8V4PYZ+J0n2pqqh99W6ac4KcA7jk9+Zx5Bh9OaO6sBVt5ASZ3fj2xsr7WB7h
 SNaYNXc6sIWn6YEyADZbJe7z3JF26ysja52rZqHxSCop1eb2A4pFagSs05W3SzOME71F
 +e50abCI5ARQEy5f8R51YRtyP0PuwpGB72ACdE6tA0mEZfJovs8eMOHA1jiWlzka5K15
 JLUMn+pilZuA3qO/j2ZIJDHqtcvueUv2mdQwVvg7dKtohxfHj+VMahIPeM31ICvNc43E
 iqCMdi8V2KCrPhkZpw3wVaVj1lX/NA93rZJYM+rZ23pl0rachlvFFlb2IN6Z3ISJazGJ
 D/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nujO1oAvQuda3HPNop9afPS+ilUfrJs0rYOKUqnCb18=;
 b=WJ5OyWNFTu5tpVVCnV4/29blU3OExcUY4KeZoj+mIZtgyMNwvvQca11yo0GNQI0Rg/
 H2HuqWgvJSem+6pOYPyHiZ9Ej1F+F4u8lEzHjT7W5c51SkgcYcDj9dSRLWhAB1PqfqAg
 FAPs5ayy8D2SZq3cemfCRWyJYnv77nuiA6akfo1AXaTkrr3usb9Q711DU5ORafBi+A9x
 tlc5IEIgcfgIIul0JosFdpt0DTZ/wid3rwXfeLvPqV1uJthxlqphETyjbawLx+7w6Plf
 6fu4mOdDpQYzVEiHal4ETszhTmVwElsEBv1DlNNk10Rnt1QDzLv6V96pEGwEfLArqlWU
 BOZw==
X-Gm-Message-State: APjAAAXJIifknTwOlGEnVSfcwS2teoMenWFfHkKwHFGKlc1sTKlc3rJd
 UWhkD/IRRTiHt8WcaLQGFObmFw==
X-Google-Smtp-Source: APXvYqxs45XVCS3zCAgepAPxJo7NC1+kdqXWgGiouecxkPxJpR21JojV3y5afr/yBsyQaJO5O2g3Xw==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr830789pge.65.1573611942121;
 Tue, 12 Nov 2019 18:25:42 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id y24sm319473pfr.116.2019.11.12.18.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2019 18:25:41 -0800 (PST)
Subject: Re: [PATCH 00/50] Add log level to show_stack()
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com> <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com> <20191113012337.GA70781@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
Date: Wed, 13 Nov 2019 02:25:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191113012337.GA70781@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 13 Nov 2019 15:12:13 +1100
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
 Jeff Dike <jdike@addtoit.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, "David S. Miller" <davem@davemloft.net>,
 Rich Felker <dalias@libc.org>, Peter Zijlstra <peterz@infradead.org>,
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

On 11/13/19 1:23 AM, Sergey Senozhatsky wrote:
> On (19/11/12 19:12), Sergey Senozhatsky wrote:
>> On (19/11/12 09:35), Petr Mladek wrote:
>> [..]
>>> This is getting too complicated. It would introduce too many
>>> hidden rules. While the explicitly passed loglevel parameter
>>> is straightforward and clear.
>>
>> If loglevel is DEFAULT or NOTICE or INFO then we can overwrite it
>> (either downgrade or upgrade). That's one rule, basically. Not too
>> complicated, I guess.
> 
> Can be taken even a bit further than
> 
> 	show_stack(NULL, NULL, LOGLEVEL_DEBUG);
> or
> 	show_stack(NULL, NULL, LOGLEVEL_ERR);
> 
> For instance,
> 
> 	spin_lock_irqsave(&rq->lock, flags);
> 	printk_emergency_enter(LOGLEVEL_SCHED);
> 		...
> 		show_stack(...);
> 		printk();
> 		printk();
> 		...
> 	spin_unlock_irqrestore(&rq->lock, flags);
> 
> or
> 
> 	spin_lock_irqsave(&uart_port->lock, flags);
> 	printk_emergency_enter(LOGLEVEL_SCHED);
> 		...
> 		printk();
> 		printk();
> 		...

Yeah, that makes sense.

I believe it's up to you, Petr and Steven to decide what's better for
printk(). I mean, after all you care for all this code.

I guess I've pointed that in my point of view price for one-time testing
code is cheaper than adding a new printk feature to swap log levels on
the fly. But again, it's just how I see it - if we fix those printing
problems, than in half year we will forget they ever existed, but in
your proposal, there will still be some clever printk code.

On the other side, also worth to note that current patches set fix
problems for kdb (and for my hung task printing patch), but it's
incomplete for sysrq driver. I've gone through functions used by sysrq
driver and the same changes introducing log level parameter would be
needed for: sched_show_task(), debug_show_all_locks(), show_regs(),
show_state(), show_mem(). Some of them don't need any platform changes,
but at least show_regs() needs.
So, you also need to have that in mind making the decision.

Thanks,
          Dmitry
