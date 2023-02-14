Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6C6696C86
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 19:12:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGTnC4XXbz3cdm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 05:11:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n8kTCiR3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n8kTCiR3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGTmF0Pnjz3bfs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 05:11:08 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3B9161805;
	Tue, 14 Feb 2023 18:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F352C4339B;
	Tue, 14 Feb 2023 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676398265;
	bh=TKLtb/CYAjL8ExEwN2xeP7hJFXlbI5pH9qu3eQ0qmvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8kTCiR3nrn23S9SyNNUTkXUfCumSDdFWvPXylR4gSXNC6g+2D+lxgO1fwXaaokrY
	 YVuLXGZbvvPMISaAP3wcazASy0rreHUgKB6li+yndvVqSXl0jqLsa1A9ETU4D4baHD
	 +///MI1JyNrU0ZT9OEzao9lmsZ8IdtbTtCxXLGbZAyZGrD2bN6mrI5UH2cs9usKRiY
	 bQMkI5fWLLowvUmtkCaAN5DN5oB/0AQwqle2Bn8qcUvo4LBvfw0VUZsTdIt2ANhZAW
	 wrih0yuj8p3luuIs6lJTwcX1j3ukAvE1/aQWQn2g4hCMVpjAMdZ4HwZ/dNztV4bKzz
	 l6j7aiyTxWddw==
Date: Tue, 14 Feb 2023 10:11:01 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 09/24] mips/cpu: Expose play_dead()'s prototype
 definition
Message-ID: <20230214181101.3a2tscbmwdnwbqpu@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <39835bc75af2e812fce56400533cb2ab41bcf0e2.1676358308.git.jpoimboe@kernel.org>
 <080a5ccb-7fa0-1a75-538f-a09dc146fc4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <080a5ccb-7fa0-1a75-538f-a09dc146fc4e@linaro.org>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kern
 el@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 14, 2023 at 08:46:41AM +0100, Philippe Mathieu-Daudé wrote:
> Hi Josh,
> 
> On 14/2/23 08:05, Josh Poimboeuf wrote:
> > Include <asm/smp.h> to make sure play_dead() matches its prototype going
> > forward.
> > 
> > Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > ---
> >   arch/mips/kernel/smp-bmips.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
> > index f5d7bfa3472a..df9158e8329d 100644
> > --- a/arch/mips/kernel/smp-bmips.c
> > +++ b/arch/mips/kernel/smp-bmips.c
> > @@ -38,6 +38,7 @@
> >   #include <asm/traps.h>
> >   #include <asm/barrier.h>
> >   #include <asm/cpu-features.h>
> > +#include <asm/smp.h>
> 
> What about the other implementations?
> 
> $ git grep -L asm/smp.h $(git grep -wlF 'play_dead(void)' arch/mips)
> arch/mips/cavium-octeon/smp.c
> arch/mips/kernel/smp-bmips.c
> arch/mips/kernel/smp-cps.c
> arch/mips/loongson64/smp.c

Indeed.  I really wish we had -Wmissing-prototypes.

I'll squash this in:

diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 89954f5f87fb..4212584e6efa 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -20,6 +20,7 @@
 #include <asm/mmu_context.h>
 #include <asm/time.h>
 #include <asm/setup.h>
+#include <asm/smp.h>
 
 #include <asm/octeon/octeon.h>
 
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index bcd6a944b839..6d69a9ba8167 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -20,6 +20,7 @@
 #include <asm/mipsregs.h>
 #include <asm/pm-cps.h>
 #include <asm/r4kcache.h>
+#include <asm/smp.h>
 #include <asm/smp-cps.h>
 #include <asm/time.h>
 #include <asm/uasm.h>
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index c81c2bd07c62..df8d789ede3c 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -14,6 +14,7 @@
 #include <linux/cpufreq.h>
 #include <linux/kexec.h>
 #include <asm/processor.h>
+#include <asm/smp.h>
 #include <asm/time.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
