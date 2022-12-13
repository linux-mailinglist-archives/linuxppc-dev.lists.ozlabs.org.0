Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93564B975
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 17:19:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWkGB16VZz3cFv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 03:19:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=NkSnMp/V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=NkSnMp/V;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWkFB04XBz3bgF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 03:18:19 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id o12so3898985pjo.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 08:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wj/NGKhLAYwhK6Lvw/Db918GBFSie4zjOTu3uFrT1gA=;
        b=NkSnMp/V8AsX4vC30wzvTBDvSWE+M7qqraskr+aX6eDcBuYgYQHiZpd5PHFEtwmlex
         b9sLXADwP2UKefS8URj7BbPzAGmqFf6Sql8Lry6ArNmBxIQqSRNMuMWf8z5+Hg1gJY0V
         G/j7FdqVWjtps7jKHZujuEhFxXfcZ0TNsoRlDztocQW2ESX1R86PBEikNrfuO5gPc7mJ
         6/Qoufhc+OUK8D5gU0LfvQQ/f14L5j2fbz4FLayl4GcS/rdSdchyCT6nat7Pvthexifo
         5a34Jkw09BPh2fSzhpIrcgjFsOBxfZOpzDvRra+RnQyxHfSXNAOYkh3mU13qpd7fHBn3
         z4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj/NGKhLAYwhK6Lvw/Db918GBFSie4zjOTu3uFrT1gA=;
        b=EMqKVJvNS8KMUNaV3XGZfoIDzB59Xwaeg7LsnaFS6cfxmGTXKM9WvbZckhVzrg7zYh
         zovaizQGAa3Z0Zk8dey4lP06rod0fs4DOXvKkXpYKmuBXNqPrL10TUFXZ40Y2DERtys7
         zCrnpyHZsbw8TtimUJZWApOD1iLVRCJbQoYupEFUyIAq2THqrHnpPseHWN+Sp6WqV8Vh
         1BON5hu2X3ML35iIVZR0K2qVoe6+qzd5og8AIe9ohI6LmAZ/4+nmP+Y1DnaFrJkU5XjZ
         00ba95JpKvAOZu7xVUhUh4Sd2z+iysQCbWO1VScD2Q3WTjL58NzUg2pSCFJ433Ks7d8F
         uBTw==
X-Gm-Message-State: ANoB5pkW8C6nm/JUbFJi/7df1/XgnlF+ZO8NqHn9qtPnPCtrkgZc44h3
	3OxJ6xdmC0TQa0PgdEdVfweh+g==
X-Google-Smtp-Source: AA0mqf6JTPFlbgzI8iGusijASEg0Bt+tpHInO5Z4ANoXa2VKfVyLMA6BDQNt3aTd/y7ttlWwr47bgg==
X-Received: by 2002:a17:902:ccc8:b0:188:640f:f41e with SMTP id z8-20020a170902ccc800b00188640ff41emr24115756ple.4.1670948294373;
        Tue, 13 Dec 2022 08:18:14 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b001898ca438fcsm39047plg.282.2022.12.13.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 08:18:13 -0800 (PST)
Date: Tue, 13 Dec 2022 08:18:13 -0800 (PST)
X-Google-Original-Date: Tue, 13 Dec 2022 08:18:09 PST (-0800)
Subject: Re: [PATCH v3 0/8] Generic IPI sending tracepoint
In-Reply-To: <20221202155817.2102944-1-vschneid@redhat.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vschneid@redhat.com
Message-ID: <mhng-ed30efdc-5b5b-40fa-8661-f99d4e2991ed@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: juri.lelli@redhat.com, mark.rutland@arm.com, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, bigeasy@linutronix.de, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-hexagon@vger.kernel.org, x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, frederic@kernel.org, rostedt@goodmis.org, openrisc@lists.librecores.org, bp@alien8.de, npiggin@gmail.com, loongarch@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, bristot@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 02 Dec 2022 07:58:09 PST (-0800), vschneid@redhat.com wrote:
> Background
> ==========
>
> Detecting IPI *reception* is relatively easy, e.g. using
> trace_irq_handler_{entry,exit} or even just function-trace
> flush_smp_call_function_queue() for SMP calls.
>
> Figuring out their *origin*, is trickier as there is no generic tracepoint tied
> to e.g. smp_call_function():
>
> o AFAIA x86 has no tracepoint tied to sending IPIs, only receiving them
>   (cf. trace_call_function{_single}_entry()).
> o arm/arm64 do have trace_ipi_raise(), which gives us the target cpus but also a
>   mostly useless string (smp_calls will all be "Function call interrupts").
> o Other architectures don't seem to have any IPI-sending related tracepoint.
>
> I believe one reason those tracepoints used by arm/arm64 ended up as they were
> is because these archs used to handle IPIs differently from regular interrupts
> (the IRQ driver would directly invoke an IPI-handling routine), which meant they
> never showed up in trace_irq_handler_{entry, exit}. The trace_ipi_{entry,exit}
> tracepoints gave a way to trace IPI reception but those have become redundant as
> of:
>
>       56afcd3dbd19 ("ARM: Allow IPIs to be handled as normal interrupts")
>       d3afc7f12987 ("arm64: Allow IPIs to be handled as normal interrupts")
>
> which gave IPIs a "proper" handler function used through
> generic_handle_domain_irq(), which makes them show up via
> trace_irq_handler_{entry, exit}.
>
> Changing stuff up
> =================
>
> Per the above, it would make sense to reshuffle trace_ipi_raise() and move it
> into generic code. This also came up during Daniel's talk on Osnoise at the CPU
> isolation MC of LPC 2022 [1].
>
> Now, to be useful, such a tracepoint needs to export:
> o targeted CPU(s)
> o calling context
>
> The only way to get the calling context with trace_ipi_raise() is to trigger a
> stack dump, e.g. $(trace-cmd -e ipi* -T echo 42).
>
> This is instead introducing a new tracepoint which exports the relevant context
> (callsite, and requested callback for when the callsite isn't helpful), and is
> usable by all architectures as it sits in generic code.
>
> Another thing worth mentioning is that depending on the callsite, the _RET_IP_
> fed to the tracepoint is not always useful - generic_exec_single() doesn't tell
> you much about the actual callback being sent via IPI, which is why the new
> tracepoint also has a @callback argument.
>
> Patches
> =======
>
> o Patch 1 is included for convenience and will be merged independently. FYI I
>   have libtraceevent patches [2] to improve the
>   pretty-printing of cpumasks using the new type, which look like:
>   <...>-3322  [021]   560.402583: ipi_send_cpumask:     cpumask=14,17,21 callsite=on_each_cpu_cond_mask+0x40 callback=flush_tlb_func+0x0
>   <...>-187   [010]   562.590584: ipi_send_cpumask:     cpumask=0-23 callsite=on_each_cpu_cond_mask+0x40 callback=do_sync_core+0x0
>
> o Patches 2-6 spread out the tracepoint across relevant sites.
>   Patch 6 ends up sprinkling lots of #include <trace/events/ipi.h> which I'm not
>   the biggest fan of, but is the least horrible solution I've been able to come
>   up with so far.
>
> o Patch 8 is trying to be smart about tracing the callback associated with the
>   IPI.
>
> This results in having IPI trace events for:
>
> o smp_call_function*()
> o smp_send_reschedule()
> o irq_work_queue*()
> o standalone uses of __smp_call_single_queue()
>
> This is incomplete, just looking at arm64 there's more IPI types that aren't
> covered:
>
>   IPI_CPU_STOP,
>   IPI_CPU_CRASH_STOP,
>   IPI_TIMER,
>   IPI_WAKEUP,
>
> ... But it feels like a good starting point.
>
> Links
> =====
>
> [1]: https://youtu.be/5gT57y4OzBM?t=14234
> [2]: https://lore.kernel.org/all/20221116144154.3662923-1-vschneid@redhat.com/
>
> Revisions
> =========
>
> v2 -> v3
> ++++++++
>
> o Dropped the generic export of smp_send_reschedule(), turned it into a macro
>   and a bunch of imports
> o Dropped the send_call_function_single_ipi() macro madness, split it into sched
>   and smp bits using some of Peter's suggestions
>
> v1 -> v2
> ++++++++
>
> o Ditched single-CPU tracepoint
> o Changed tracepoint signature to include callback
> o Changed tracepoint callsite field to void *; the parameter is still UL to save
>   up on casts due to using _RET_IP_.
> o Fixed linking failures due to not exporting smp_send_reschedule()
>
> Steven Rostedt (Google) (1):
>   tracing: Add __cpumask to denote a trace event field that is a
>     cpumask_t
>
> Valentin Schneider (7):
>   trace: Add trace_ipi_send_cpumask()
>   sched, smp: Trace IPIs sent via send_call_function_single_ipi()
>   smp: Trace IPIs sent via arch_send_call_function_ipi_mask()
>   irq_work: Trace self-IPIs sent via arch_irq_work_raise()
>   treewide: Trace IPIs sent via smp_send_reschedule()
>   smp: reword smp call IPI comment
>   sched, smp: Trace smp callback causing an IPI
>
>  arch/alpha/kernel/smp.c                      |  2 +-
>  arch/arc/kernel/smp.c                        |  2 +-
>  arch/arm/kernel/smp.c                        |  5 +-
>  arch/arm/mach-actions/platsmp.c              |  2 +
>  arch/arm64/kernel/smp.c                      |  3 +-
>  arch/csky/kernel/smp.c                       |  2 +-
>  arch/hexagon/kernel/smp.c                    |  2 +-
>  arch/ia64/kernel/smp.c                       |  4 +-
>  arch/loongarch/include/asm/smp.h             |  2 +-
>  arch/mips/include/asm/smp.h                  |  2 +-
>  arch/mips/kernel/rtlx-cmp.c                  |  2 +
>  arch/openrisc/kernel/smp.c                   |  2 +-
>  arch/parisc/kernel/smp.c                     |  4 +-
>  arch/powerpc/kernel/smp.c                    |  6 +-
>  arch/powerpc/kvm/book3s_hv.c                 |  3 +
>  arch/powerpc/platforms/powernv/subcore.c     |  2 +
>  arch/riscv/kernel/smp.c                      |  4 +-
>  arch/s390/kernel/smp.c                       |  2 +-
>  arch/sh/kernel/smp.c                         |  2 +-
>  arch/sparc/kernel/smp_32.c                   |  2 +-
>  arch/sparc/kernel/smp_64.c                   |  2 +-
>  arch/x86/include/asm/smp.h                   |  2 +-
>  arch/x86/kvm/svm/svm.c                       |  4 +
>  arch/x86/kvm/x86.c                           |  2 +
>  arch/xtensa/kernel/smp.c                     |  2 +-
>  include/linux/smp.h                          |  8 +-
>  include/trace/bpf_probe.h                    |  6 ++
>  include/trace/events/ipi.h                   | 22 ++++++
>  include/trace/perf.h                         |  6 ++
>  include/trace/stages/stage1_struct_define.h  |  6 ++
>  include/trace/stages/stage2_data_offsets.h   |  6 ++
>  include/trace/stages/stage3_trace_output.h   |  6 ++
>  include/trace/stages/stage4_event_fields.h   |  6 ++
>  include/trace/stages/stage5_get_offsets.h    |  6 ++
>  include/trace/stages/stage6_event_callback.h | 20 +++++
>  include/trace/stages/stage7_class_define.h   |  2 +
>  kernel/irq_work.c                            | 14 +++-
>  kernel/sched/core.c                          | 19 +++--
>  kernel/sched/smp.h                           |  2 +-
>  kernel/smp.c                                 | 78 ++++++++++++++++----
>  samples/trace_events/trace-events-sample.c   |  2 +-
>  samples/trace_events/trace-events-sample.h   | 34 +++++++--
>  virt/kvm/kvm_main.c                          |  1 +
>  43 files changed, 250 insertions(+), 61 deletions(-)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # riscv
