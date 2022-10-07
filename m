Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5C5F81EE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 03:30:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mknfs5mn7z3dx9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 12:30:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GXaDQPYT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GXaDQPYT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GXaDQPYT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GXaDQPYT;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkXdD5yshz304J
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 02:42:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665157369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1lKCnBjxRPjgpNNPlEylbLIMLTQ3r/0aTk3SgXwAPQE=;
	b=GXaDQPYT5eDTFljQ4bdxE4WyMg2zQKtfYpeR43H7MjQw0o9qKhFv7b+Ej+sujcsbIl43nm
	wZGTv7Q+vEI8USeOQsszZjrFlRO0udrpHKvMMiQOEXpIEYDNxdQEe6RjdezUNm254WGKX5
	reeNYpuH24Djyjd1MEcFcdhNDTVjcxM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665157369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1lKCnBjxRPjgpNNPlEylbLIMLTQ3r/0aTk3SgXwAPQE=;
	b=GXaDQPYT5eDTFljQ4bdxE4WyMg2zQKtfYpeR43H7MjQw0o9qKhFv7b+Ej+sujcsbIl43nm
	wZGTv7Q+vEI8USeOQsszZjrFlRO0udrpHKvMMiQOEXpIEYDNxdQEe6RjdezUNm254WGKX5
	reeNYpuH24Djyjd1MEcFcdhNDTVjcxM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-4JzMALUrMJ6W4lFZwHnoXg-1; Fri, 07 Oct 2022 11:42:47 -0400
X-MC-Unique: 4JzMALUrMJ6W4lFZwHnoXg-1
Received: by mail-wm1-f72.google.com with SMTP id k38-20020a05600c1ca600b003b49a809168so4521910wms.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Oct 2022 08:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lKCnBjxRPjgpNNPlEylbLIMLTQ3r/0aTk3SgXwAPQE=;
        b=yUhtYHNVZhTOkRpA/lUlR7+Lh55moyWc5BTu4BlojpAzQOVsqXyiMix/10V7LRIpdX
         p/M2swGSzUmgeS4mSDAdYbDdq1BANt4Nr51iyBP3N4MC3+iaHZ3PvO23yeSAvF/NK9rd
         CsL8mYAiFuPaWKVTo4qKSJz5DHuD+4QhEkJmCJMX8+tlBQ4ZSj2B1xZwbwSy9XLnQjBW
         5P9DSIAbfs+FxF5GjsKABLVqfCk4EbbsBxEu5pukrgIJ3DjqEAO9FpfyHJ/nSaaEHyFo
         kW9PwMx64i32wj1g1qcWSKvvJCgt87qs9NGPf75dfNrnAsLesZENnGK4oVvOH0wXZDWJ
         PEQg==
X-Gm-Message-State: ACrzQf39dr0eG4Ko6hDjcNzY/wLqS50NcaHZM++iaeMb5w4qTyu4ZKv7
	IclNEUM462Z2lL02i50o9whune0EWOX+vsoZ7Llwcj+jugtaInVQDp9Qvx/3/WjZ+F6ECI95+JM
	0mRTM1dm2hlYDwsqXettCwslQ/g==
X-Received: by 2002:a5d:5010:0:b0:22a:cb71:9493 with SMTP id e16-20020a5d5010000000b0022acb719493mr3770650wrt.514.1665157361752;
        Fri, 07 Oct 2022 08:42:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Tr05uM1rtU5aj/QWiT6cTirx56otcH3SojWjYuAUChmPHRHcJ6HatWEhyYipO7y3unWYaxQ==
X-Received: by 2002:a5d:5010:0:b0:22a:cb71:9493 with SMTP id e16-20020a5d5010000000b0022acb719493mr3770632wrt.514.1665157361532;
        Fri, 07 Oct 2022 08:42:41 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id e1-20020a5d5941000000b0022af865810esm2307021wri.75.2022.10.07.08.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:42:40 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	x86@kernel.org
Subject: [RFC PATCH 0/5] Generic IPI sending tracepoint
Date: Fri,  7 Oct 2022 16:41:40 +0100
Message-Id: <20221007154145.1877054-1-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Sat, 08 Oct 2022 12:28:34 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Marcelo Tosatti <mtosatti@redhat.com>, Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, "David S. Miller" <davem@davemloft.net>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Frederic Weisbecker <frederic@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Background
==========

Detecting IPI *reception* is relatively easy, e.g. using
trace_irq_handler_{entry,exit} or even just function-trace
flush_smp_call_function_queue() for SMP calls.  

Figuring out their *origin*, is trickier as there is no generic tracepoint tied
to e.g. smp_call_function():

o AFAIA x86 has no tracepoint tied to sending IPIs, only receiving them
  (cf. trace_call_function{_single}_entry()).
o arm/arm64 do have trace_ipi_raise(), which gives us the target cpus but also a
  mostly useless string (smp_calls will all be "Function call interrupts").
o Other architectures don't seem to have any IPI-sending related tracepoint.  

I believe one reason those tracepoints used by arm/arm64 ended up as they were
is because these archs used to handle IPIs differently from regular interrupts
(the IRQ driver would directly invoke an IPI-handling routine), which meant they 
never showed up in trace_irq_handler_{entry, exit}. The trace_ipi_{entry,exit}
tracepoints gave a way to trace IPI reception but those have become redundant as
of: 

      56afcd3dbd19 ("ARM: Allow IPIs to be handled as normal interrupts")
      d3afc7f12987 ("arm64: Allow IPIs to be handled as normal interrupts")

which gave IPIs a "proper" handler function used through
generic_handle_domain_irq(), which makes them show up via
trace_irq_handler_{entry, exit}.

Changing stuff up
=================

Per the above, it would make sense to reshuffle trace_ipi_raise() and move it
into generic code. This also came up during Daniel's talk on Osnoise at the CPU
isolation MC of LPC 2022 [1]. 

Now, to be useful, such a tracepoint needs to export:
o targeted CPU(s)
o calling context

The only way to get the calling context with trace_ipi_raise() is to trigger a
stack dump, e.g. $(trace-cmd -e ipi* -T echo 42).

As for the targeted CPUs, the existing tracepoint does export them, albeit in
cpumask form, which is quite inconvenient from a tooling perspective. For
instance, as far as I'm aware, it's not possible to do event filtering on a
cpumask via trace-cmd.

Because of the above points, this is introducing a new tracepoint.

Patches
=======

This results in having trace events for:

o smp_call_function*()
o smp_send_reschedule()
o irq_work_queue*()

This is incomplete, just looking at arm64 there's more IPI types that aren't covered:

  IPI_CPU_STOP,
  IPI_CPU_CRASH_STOP,
  IPI_TIMER,
  IPI_WAKEUP,

... But it feels like a good starting point.

Another thing worth mentioning is that depending on the callsite, the _RET_IP_
fed to the tracepoint is not always useful - generic_exec_single() doesn't tell
you much about the actual callback being sent via IPI, so there might be value
in exploding the single tracepoint into at least one variant for smp_calls.

Links
=====

[1]: https://youtu.be/5gT57y4OzBM?t=14234

Valentin Schneider (5):
  trace: Add trace_ipi_send_{cpu, cpumask}
  sched, smp: Trace send_call_function_single_ipi()
  smp: Add a multi-CPU variant to send_call_function_single_ipi()
  irq_work: Trace calls to arch_irq_work_raise()
  treewide: Rename and trace arch-definitions of smp_send_reschedule()

 arch/alpha/kernel/smp.c          |  2 +-
 arch/arc/kernel/smp.c            |  2 +-
 arch/arm/kernel/smp.c            |  5 +----
 arch/arm64/kernel/smp.c          |  3 +--
 arch/csky/kernel/smp.c           |  2 +-
 arch/hexagon/kernel/smp.c        |  2 +-
 arch/ia64/kernel/smp.c           |  4 ++--
 arch/loongarch/include/asm/smp.h |  2 +-
 arch/mips/include/asm/smp.h      |  2 +-
 arch/openrisc/kernel/smp.c       |  2 +-
 arch/parisc/kernel/smp.c         |  4 ++--
 arch/powerpc/kernel/smp.c        |  4 ++--
 arch/riscv/kernel/smp.c          |  4 ++--
 arch/s390/kernel/smp.c           |  2 +-
 arch/sh/kernel/smp.c             |  2 +-
 arch/sparc/kernel/smp_32.c       |  2 +-
 arch/sparc/kernel/smp_64.c       |  2 +-
 arch/x86/include/asm/smp.h       |  2 +-
 arch/xtensa/kernel/smp.c         |  2 +-
 include/linux/smp.h              |  1 +
 include/trace/events/ipi.h       | 27 +++++++++++++++++++++++++++
 kernel/irq_work.c                | 12 +++++++++++-
 kernel/sched/core.c              |  7 +++++--
 kernel/smp.c                     | 18 +++++++++++++++++-
 24 files changed, 84 insertions(+), 31 deletions(-)

--
2.31.1

