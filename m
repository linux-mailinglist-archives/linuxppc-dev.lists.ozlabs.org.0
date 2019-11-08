Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A91EF5CBB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:31:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47902p0XKGzF70h
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 12:30:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=0x7f454c46@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rjflubiq"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478tDG6LZXzDrJl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 08:08:43 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id t26so7583069wmi.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 13:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=leuvFNJRBbgvPXZJlD4yDG614p9ePBBBJqh6/bi0nWM=;
 b=rjflubiq8T92r7IsfuflmmOLhAbyeUiuHnf/rQSYhhlSmttRaTaotAvL5xYp4yOydT
 GvzpvT1wRN/Se5w5Bamn3iuJIAGtHWJ3FQg7uwfFHiBZYXDG6coXsfRkKjBQWYAriMTe
 4kTrO4cphBn73YaGY9oVhRABcMWkQkwRmG/gGE9R1eQjZ3xrtTYtO4ekpHSWHoSNgXQt
 LOIHB3CeUqi5Hx5sAbRW5lNwEUAqSAnAREOPMl/n34UjrP0bXjp7N2IIvVwOE5dHTyoC
 y/6fNB8lMSjFK19DQSqAbg52NdT8Yh0NvqWS+ZavZPT5hVJ6jwjvtDCEDMZ1djztH8HA
 lzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=leuvFNJRBbgvPXZJlD4yDG614p9ePBBBJqh6/bi0nWM=;
 b=aPW/TfTySOBsOqigh8FKoQbGLBZsD1t/WcRKM70ZVNw62APWvccMZsQctis+u21p5L
 ej8jyr3v8/9iiHLYnGemwT1tzjqJDAlPsR48Tc+dvjuOu2ww4+FFsfwNDiQYMJ6Yrapg
 fJrKtW/3lqzNXz43oi6I9ZK7j/lOclglDyJfzKkxRNRVpSW2sGTAh3vuPzRzBPM3JtWJ
 ngCW6zgIRgFYm/K6kuu3Kz9n+tNyoN88kuoHvYjRebtmteriD1b16TNTIr43bU/0OVAX
 JsHQckO3z+krmIZjFpssyVPwO1IbavtMFDqjN+rdJ6ZbRqANLZieOE46/oqmFmdu4VEg
 WaFg==
X-Gm-Message-State: APjAAAXdYqqBWIefcEM3gMPeuhAQ1gGTkWMALGV7/9cWbNvcfquV+gwq
 lmw2NvlJ5Uc8Ku3IkiRp8I8=
X-Google-Smtp-Source: APXvYqy4dAVQ+ZAcZ+Na7c6XiIr61o8y7Lfg2+bZQEg4XJKlBUyi7kCGw2dZZvY/2MRfFQOLGhdeXA==
X-Received: by 2002:a1c:810d:: with SMTP id c13mr6004971wmd.154.1573247319697; 
 Fri, 08 Nov 2019 13:08:39 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j63sm9370828wmj.46.2019.11.08.13.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 13:08:38 -0800 (PST)
Subject: Re: [PATCH 00/50] Add log level to show_stack()
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Dmitry Safonov <dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
 <20191106203440.GH3079@worktop.programming.kicks-ass.net>
 <CAGrbwDRgX1BZoFrVYSXhAeeUKHrB=q3w8jXFPOuRvO7HV4Ciqw@mail.gmail.com>
 <20191108173045.GY25745@shell.armlinux.org.uk>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Message-ID: <5a411348-be84-f592-ef2d-ffaec99332bd@gmail.com>
Date: Fri, 8 Nov 2019 21:08:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191108173045.GY25745@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 09 Nov 2019 12:19:43 +1100
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
 linux-um@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Richard Henderson <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Douglas Anderson <dianders@chromium.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Will Deacon <will@kernel.org>,
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
 X86 ML <x86@kernel.org>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Mark Salter <msalter@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Michal Simek <monstr@monstr.eu>, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wessel <jason.wessel@windriver.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/8/19 5:30 PM, Russell King - ARM Linux admin wrote:
> On Fri, Nov 08, 2019 at 04:28:30PM +0000, Dmitry Safonov wrote:
[..]
>>
>> Well, the use-case for lower log-level is that everything goes into logs
>> (/var/log/dmesg or /var/log/messages whatever rsyslog has settting).
>>
>> That has it's value:
>> - after a failure (i.e. panic) messages, those were only signs that
>> something goes wrong can be seen in logs which can give ideas what has
>> happened.
> 
> No they don't.  When the kernel panics, userspace generally stops
> running, so rsyslog won't be able to write them to /var/log/messages.
> 
> How, by "kernel panics" I mean a real kernel panic, which probably
> isn't what you're talking about there.  You are probably talking
> about the whole shebang of non-fatal kernel oops, kernel warnings
> and the like.  If so, I'd ask you to stop confuzzilating terminology.
> 
> If you really want to capture such events, then you need to have the
> kernel write the panic to (e.g.) flash - see the mtdoops driver.

I was talking about things prior the panic: OOMs, MMC write/read
warnings, hung tasks, we also have local patches to produce a warning if
the mutex is being held for too long or a task is starving on CPU time
by hard/soft irqs (I hope I will design something like that for
upstream). I've found those warnings useful to:
(a) have an early message when the things are starting going bad.
(b) analyze contentions or too large scale for a box or faulty hardware
for non-reproducible issues just from logs.

We use kexec to save the dmesg ringbuffer content after the panic.

Thanks,
          Dmitry
