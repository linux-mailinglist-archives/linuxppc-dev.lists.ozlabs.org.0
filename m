Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 798516FE381
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 19:56:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGjPV3JsLz3fbF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 03:55:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (unknown [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGgX005zzz3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 02:31:24 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98C151063;
	Wed, 10 May 2023 09:31:27 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 700EB3F67D;
	Wed, 10 May 2023 09:30:35 -0700 (PDT)
Date: Wed, 10 May 2023 17:30:32 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v8 00/10] arm64: Add framework to turn an IPI as NMI
Message-ID: <ZFvGqD//pm/lZb+p@FVFF77S0Q05N.cambridge.arm.com>
References: <20230419225604.21204-1-dianders@chromium.org>
 <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 11 May 2023 03:54:00 +1000
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Huacai Chen <chenhuacai@kernel.org>, Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Gaosheng Cui <cuigaosheng1@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>, kgdb-bugreport@lists.source
 forge.net, Ulf Hansson <ulf.hansson@linaro.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Ingo Molnar <mingo@kernel.org>, Pierre Gondois <Pierre.Gondois@arm.com>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Stephen Boyd <swboyd@chromium.org>, loongarch@lists.linux.dev, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>, Joey Gouly <joey.gouly@arm.com>, Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>, Sumit Garg <sumit.garg@linaro.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ito-yuichi@fujitsu.com, Philippe =?utf-8?Q?Mathieu-Daud=C3=A
 9?= <f4bug@amsat.org>, linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Eric W. Biederman" <ebiederm@xmission.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 10, 2023 at 08:28:17AM -0700, Doug Anderson wrote:
> Hi,

Hi Doug,

> On Wed, Apr 19, 2023 at 3:57 PM Douglas Anderson <dianders@chromium.org> wrote:
> > This is an attempt to resurrect Sumit's old patch series [1] that
> > allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
> > also to round up CPUs in kdb/kgdb. The last post from Sumit that I
> > could find was v7, so I called this series v8. I haven't copied all of
> > his old changelongs here, but you can find them from the link.
> >
> > Since v7, I have:
> > * Addressed the small amount of feedback that was there for v7.
> > * Rebased.
> > * Added a new patch that prevents us from spamming the logs with idle
> >   tasks.
> > * Added an extra patch to gracefully fall back to regular IPIs if
> >   pseudo-NMIs aren't there.
> >
> > Since there appear to be a few different patches series related to
> > being able to use NMIs to get stack traces of crashed systems, let me
> > try to organize them to the best of my understanding:
> >
> > a) This series. On its own, a) will (among other things) enable stack
> >    traces of all running processes with the soft lockup detector if
> >    you've enabled the sysctl "kernel.softlockup_all_cpu_backtrace". On
> >    its own, a) doesn't give a hard lockup detector.
> >
> > b) A different recently-posted series [2] that adds a hard lockup
> >    detector based on perf. On its own, b) gives a stack crawl of the
> >    locked up CPU but no stack crawls of other CPUs (even if they're
> >    locked too). Together with a) + b) we get everything (full lockup
> >    detect, full ability to get stack crawls).
> >
> > c) The old Android "buddy" hard lockup detector [3] that I'm
> >    considering trying to upstream. If b) lands then I believe c) would
> >    be redundant (at least for arm64). c) on its own is really only
> >    useful on arm64 for platforms that can print CPU_DBGPCSR somehow
> >    (see [4]). a) + c) is roughly as good as a) + b).

> It's been 3 weeks and I haven't heard a peep on this series. That
> means nobody has any objections and it's all good to land, right?
> Right? :-P

FWIW, there are still longstanding soundness issues in the arm64 pseudo-NMI
support (and fixing that requires an overhaul of our DAIF / IRQ flag
management, which I've been chipping away at for a number of releases), so I
hadn't looked at this in detail yet because the foundations are still somewhat
dodgy.

I appreciate that this has been around for a while, and it's on my queue to
look at.

Thanks,
Mark.
