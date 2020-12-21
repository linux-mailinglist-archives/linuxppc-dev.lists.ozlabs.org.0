Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2B62DF8F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 06:45:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzpNh2RlCzDqLG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 16:45:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzpLx6HzbzDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 16:44:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZnWF70Nm; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CzpLk1qPgz9sVk;
 Mon, 21 Dec 2020 16:44:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608529465;
 bh=8q8pjXmt3fb3/FcKFZZhBpNNcXsp66j8Isw1H4VoFss=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZnWF70NmUxyOGkj7ajnBegDo04rv8gH5Ux9NWJhGuiFgnNMVogs2qsK/JPPvTOxX3
 hzwMtUhjiDSqvHc4ZZWFFrTwkUdkYXJq/1ML2X0U5qamtbWBfarkCtNAXDelPjKyYu
 4R5GrwJUkFnZSYIfsBFzv3+C8RVv3a9uzsg9fDjFKnZkRtQDx75FnOmDIw99taeAnd
 QCskX9h/ngj+6oMYoBPKKaJh3wx/SkbDouSAAbUuPyGD0ebzLrrNquc0B/69DXdzQf
 fJmTp61f2fzdZls70bVcMCLTyxKnMkjf3NMjT+RK4eF560XOppbITSBixDl2QbJUdX
 VnJ3dZzhE+mIA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, "Enrico Weigelt\,
 metux IT consult" <info@metux.net>
Subject: Re: [PATCH 01/23] kernel: irq: irqdescs: warn on spurious IRQ
In-Reply-To: <CAHp75VfYz_K2BYOxqmSx0q+1F2F9Lp1eb70RrNYzJHs3FX+quQ@mail.gmail.com>
References: <20201218143122.19459-1-info@metux.net>
 <20201218143122.19459-2-info@metux.net>
 <CAHp75VfYz_K2BYOxqmSx0q+1F2F9Lp1eb70RrNYzJHs3FX+quQ@mail.gmail.com>
Date: Mon, 21 Dec 2020 16:44:13 +1100
Message-ID: <87ft3zyaqa.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-SH <linux-sh@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H.
 Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, gerg@linux-m68k.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jiri Olsa <jolsa@redhat.com>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-alpha@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, msalter@redhat.com, jacquiot.aurelien@gmail.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, "open list:LINUX
 FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> On Fri, Dec 18, 2020 at 4:37 PM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
>
>> +               if (printk_ratelimit())
>> +                       pr_warn("spurious IRQ: irq=%d hwirq=%d nr_irqs=%d\n",
>> +                               irq, hwirq, nr_irqs);
>
> Perhaps you missed pr_warn_ratelimit() macro which is already in the
> kernel for a long time.

pr_warn_ratelimited() which calls printk_ratelimited().

And see the comment above printk_ratelimit():

/*
 * Please don't use printk_ratelimit(), because it shares ratelimiting state
 * with all other unrelated printk_ratelimit() callsites.  Instead use
 * printk_ratelimited() or plain old __ratelimit().
 */


cheers
