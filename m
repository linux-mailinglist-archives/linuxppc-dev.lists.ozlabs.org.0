Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DEEF8876
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 07:24:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByPV3W5NzF3Yp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 17:23:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=sergey.senozhatsky.work@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cdGWTYNC"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BvnF2cj1zF4sK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 15:25:52 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id az9so7978664plb.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 20:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9VefD4i9ErvjrjSu5lBHBfa2VMuQnRlhyfcHWoSsFGA=;
 b=cdGWTYNC6NHRu+kvA4I6kS1Y2LfiO2jKF0r2reR+0mRqcG8yKudKBCw9I9DOXABIX4
 /3TUFbNC4J3e6CiNMFB22KOrjhFeNSMw6A4f5zE4eujUVPhwdAy4UE6JiknhjlsRGWe7
 RTgQRbIczKqjQpk9q9jHQE31BO+69ykoGYVcUuJlUop2q+ad5Zn3tErki59ff20RUtZo
 yWETgjDNltG315ymhYBMnymIi7dXr1HTD7KD2QIijuj5xF7vcEzw9cliyVtugI35e748
 tq7YxpziGywkq1lpdx1pl1YBrcMuX71SP1knncXeWdL4sRO4vx39eBLBEYWFTo///pwr
 NCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9VefD4i9ErvjrjSu5lBHBfa2VMuQnRlhyfcHWoSsFGA=;
 b=LABLG7uCaq11MvoqPUIRB4RpY/N/m1WeHR3UEdLnP24LtvV+jqtPq9gt1iiQQM5oE3
 OZYwytPHL3YBVg9wkxCJmMnLv/cDX4tEtJFFUlN1nZirkIGpS+0lxc5FEWvZ7W+TFatJ
 fDZgOizbFhpBXq4oZx9X6PbWtEoNp+ySLqAWf97jxdcftRFAyCbDXtePrmqs9LdK2Nim
 AaTkWqlqnv8ftt9ZwPRSrR0hWSZoYyaYtKGarqbDseTdFAm+OWNEuIP9+J47f1XqNHgI
 PsYUqDPyZmrlho7Q2myEdsYl+ykJOQhO1F/9ZT2vNhg7LKkqNumt3sPOwJZIcC1Ju/V8
 q04w==
X-Gm-Message-State: APjAAAVws+SsnlQo71hor39lNlT6V5tHuSah/RCuK6L00WzH8W2eldxA
 TlIfhS6uhmWnJ3i6qHVd38U=
X-Google-Smtp-Source: APXvYqyjkigrHz92j3yARMh7vwLk0eQQU3iBJc8XJ3FFSXhKkmIaB79Wx/YFJE8etx6MkatMc7zyFg==
X-Received: by 2002:a17:902:246:: with SMTP id
 64mr28628529plc.339.1573532749511; 
 Mon, 11 Nov 2019 20:25:49 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id 186sm23754823pfb.99.2019.11.11.20.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 20:25:48 -0800 (PST)
Date: Tue, 12 Nov 2019 13:25:46 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191112042546.GA119579@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
 <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
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

On (19/11/12 02:40), Dmitry Safonov wrote:
[..]
> In my point of view the cost of one-time [mostly build] testing every
> architecture is cheaper than introducing some new smart code that will
> live forever.

Well, there may be the need to pass loglevel deeper due to "hey __show_stack()
on that arch invokes bar(), which invokes foo() and now foo() does printk(),
but we don't see it". The context which decided to backtaraces decided
to do so for a reason, probably, so I guess we can look at it as "a special
error reporting code block".

The proposed patch set passes loglevel via slightly unusual channel -
via sprintf(). We probably can do it, but I would prefer to minimize
the number of such printk-s in the kernel. The code snippet which I
posted also does pretty unusual thing w.r.t loglevel. Both approaches
are "non-standard" from that POV.

> I'll reply to your suggestion tomorrow, it's a bit late in my tz.

Sure.

To anyone who will comment on that code snippet - this is not a
"look, here is what you need to do" type of proposal. Just an
alternative approach with its pros and cons.

We had several requests over the years to have something like "forcibly
allow all underlying printk-s from here to here" or "forcibly suppress
or postpone underlying printk-s from here to here", etc.

	-ss
