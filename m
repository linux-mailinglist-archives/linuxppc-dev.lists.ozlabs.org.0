Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CEB697CDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 14:10:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGz305BGbz3cfl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 00:10:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGz2T0zPZz3c6d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 00:10:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F7ABFEC;
	Wed, 15 Feb 2023 05:10:16 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.142])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8797A3F663;
	Wed, 15 Feb 2023 05:09:26 -0800 (PST)
Date: Wed, 15 Feb 2023 13:09:21 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 04/24] arm64/cpu: Mark cpu_die() __noreturn
Message-ID: <Y+zZgZIP7RPIgyQf@FVFF77S0Q05N>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <e47fc487980d5330e6059ac6e16416bec88cda0e.1676358308.git.jpoimboe@kernel.org>
 <14274f04-2991-95bd-c29b-07e86e8755c1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14274f04-2991-95bd-c29b-07e86e8755c1@linaro.org>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, dietmar.eggemann@arm.com, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.fran
 ken.de, bristot@redhat.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 14, 2023 at 09:13:08AM +0100, Philippe Mathieu-Daudé wrote:
> On 14/2/23 08:05, Josh Poimboeuf wrote:
> > cpu_die() doesn't return.  Annotate it as such.  By extension this also
> > makes arch_cpu_idle_dead() noreturn.
> > 
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > ---
> >   arch/arm64/include/asm/smp.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> > index fc55f5a57a06..5733a31bab08 100644
> > --- a/arch/arm64/include/asm/smp.h
> > +++ b/arch/arm64/include/asm/smp.h
> > @@ -100,7 +100,7 @@ static inline void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
> >   extern int __cpu_disable(void);
> >   extern void __cpu_die(unsigned int cpu);
> > -extern void cpu_die(void);
> > +extern void __noreturn cpu_die(void);
> >   extern void cpu_die_early(void);
> 
> Shouldn't cpu_operations::cpu_die() be declared noreturn first?

The cpu_die() function ends with a BUG(), and so does not return, even if a
cpu_operations::cpu_die() function that it calls erroneously returned.

We *could* mark cpu_operations::cpu_die() as noreturn, but I'd prefer that we
did not so that the compiler doesn't optimize away the BUG() which is there to
catch such erroneous returns.

That said, could we please add __noreturn to the implementation of cpu_die() in
arch/arm64/kernel/smp.c? i.e. the fixup below.

With that fixup:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

---->8----
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index ffc5d76cf695..a98a76f7c1c6 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -361,7 +361,7 @@ void __cpu_die(unsigned int cpu)
  * Called from the idle thread for the CPU which has been shutdown.
  *
  */
-void cpu_die(void)
+void __noreturn cpu_die(void)
 {
        unsigned int cpu = smp_processor_id();
        const struct cpu_operations *ops = get_cpu_ops(cpu);
