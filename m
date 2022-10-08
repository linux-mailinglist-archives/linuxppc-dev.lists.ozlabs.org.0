Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F52E5F8722
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 21:35:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlFlK2tKYz3dsx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 06:35:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=vz7s=2j=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlFkk0NgFz2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 06:35:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 764F4B80BA9;
	Sat,  8 Oct 2022 19:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0348FC433C1;
	Sat,  8 Oct 2022 19:34:46 +0000 (UTC)
Date: Sat, 8 Oct 2022 15:34:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [RFC PATCH 4/5] irq_work: Trace calls to arch_irq_work_raise()
Message-ID: <20221008153442.159b2f2d@rorschach.local.home>
In-Reply-To: <20221007154533.1878285-4-vschneid@redhat.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
	<20221007154533.1878285-4-vschneid@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-hexagon@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel
 .org, Daniel Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri,  7 Oct 2022 16:45:32 +0100
Valentin Schneider <vschneid@redhat.com> wrote:
>  }
>  
> +static inline void irq_work_raise(void)
> +{
> +	if (arch_irq_work_has_interrupt())
> +		trace_ipi_send_cpu(_RET_IP_, smp_processor_id());

To save on the branch, let's make the above:

	if (trace_ipi_send_cpu_enabled() && arch_irq_work_has_interrupt())

As the "trace_*_enabled()" is a static branch that will make it a nop
when the tracepoint is not enabled.

-- Steve


> +
> +	arch_irq_work_raise();
> +}
> +
>  /* Enqueue on current CPU, work must already be claimed and preempt disabled */
