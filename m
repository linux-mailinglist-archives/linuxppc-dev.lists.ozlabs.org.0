Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D236613FB9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:34:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zHXH2ZfWzDrBJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 08:34:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zGxb4pXGzDqjv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 08:08:03 +1100 (AEDT)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1isCMp-0001BF-Vb; Thu, 16 Jan 2020 22:07:52 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 0F3B5101226; Thu, 16 Jan 2020 22:07:51 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [RFC PATCH v4 08/11] lib: vdso: allow fixed clock mode
In-Reply-To: <CALCETrX9+PZ1h6xex2WZcSqNT7W-6R-E95jv9hLhSdAzhMCrTA@mail.gmail.com>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
 <1b278bc1f6859d4df734fb2cde61cf298e6e07fd.1579196675.git.christophe.leroy@c-s.fr>
 <874kwvf9by.fsf@nanos.tec.linutronix.de>
 <CALCETrX9+PZ1h6xex2WZcSqNT7W-6R-E95jv9hLhSdAzhMCrTA@mail.gmail.com>
Date: Thu, 16 Jan 2020 22:07:51 +0100
Message-ID: <871rrzf6u0.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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
Cc: nathanl@linux.ibm.com, Arnd Bergmann <arnd@arndb.de>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Lutomirski <luto@kernel.org> writes:
> On Thu, Jan 16, 2020 at 12:14 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>> Some architectures have a fixed clocksource which is known at compile
>> time and cannot be replaced or disabled at runtime, e.g. timebase on
>> PowerPC. For such cases the clock mode check in the VDSO code is
>> pointless.
>>
> I wonder if we should use this on x86 bare-metal if we have
> sufficiently invariant TSC.  (Via static_cpu_has(), not compiled in.)
>
> Maybe there is no such x86 machine.

There might be some, but every time I started to trust the TSC a bit
more someone reported the next variant of brokenness.

Admittedly it has become better at least up to two sockets.

For a start we could do that when the TSC is considered reliable, which
is the case when:

  - The TSC is the only available clocksource

  - tsc=reliable is on the kernel command line

> I really really want Intel or AMD to introduce machines where the TSC
> pinky-swears to count in actual nanoseconds.

and is guaranteed to be synchronized across any number of sockets/cpus
and has an enforcable protection against BIOS writers.

Ideally it'd have a writeable MSR attached which allows us to tweak the
frequency in the PPM range via NTP/PTP.

Guess how long quite some people including Linus and myself are asking
for this?

I know that Linus started bitching about the TSC before me, but it's
already a bit over 20 years on my side when I first talked to Intel and
AMD about the requirements for a reliable clocksource.

Just to set the time lines straight.

Constant frequency TSC surfaced on Intel in 2006 with the Core brand and
on AMD in 2007 with Barcelona (Fam 10h).

In 2008 the first TSC surfaced which was not affected by C-States and 5
years later in 2013 some Atoms came out where TSC even worked accross
S3.

The > 2 socket issue is still not resolved AFAICT, but we got at least
the TSC ADJUST MSR around 2012 which allowed us for the first time to
reliably detect and mitigate BIOS wreckage.

All the years I was envy on architectures which had simple designed and
just reliably working timers forever.

So now you can extrapolate how long it will take until you get your
pinky-swearing pony :)

Thanks,

        tglx
