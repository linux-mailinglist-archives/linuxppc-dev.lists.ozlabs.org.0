Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A1772424
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 14:35:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GgZc4HVb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKG4Y4Q92z3cG0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 22:35:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GgZc4HVb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=wenst@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RK7Qp4DHdz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 17:35:44 +1000 (AEST)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-4873cd125acso163155e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 00:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691393739; x=1691998539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVDqCkVf2XQJK4O1h6mLmsszxeVizs+vrchmcAeH1mM=;
        b=GgZc4HVbVwBDtKoa8hzpHopMi8083b3Mz9ORzFnG0n+Pm7hf19v0EsjuiZnteADzK9
         WVWsARUSgVcKqWXhJOGFSMBSgu3FFxGgoi8u9arCf2twrbwyJYuSgeuR4dyTSMjajF0v
         I8n7QluuJu6VAySsM5yLOwBZ9Gf6kyjHCK/fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691393739; x=1691998539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVDqCkVf2XQJK4O1h6mLmsszxeVizs+vrchmcAeH1mM=;
        b=KHrHntPAWlfNjDliJjHXBLBaIBCOAufbRddW5MtmdZwk13rIkE+zPiQfltGXPFxCk0
         BuWjBhYZG5NXTaCA7l/TVRKuaZ4XCRceeZeD/x8s28mFN249Z4WVdjX5cV9yWHNxH/G2
         kIZ7kmgM04FZn9jQ1UyWNKoSnsX6wOf8dCd9MVIZ10g4sSxjgO0YyJjrrKTIJJNI7l2R
         7uaP6KYpPRX/rcGv51xBWKLr3a9XbXpCioGwaKYwN5bkLYzDY1+l2VUngQ8GrV4ZARDK
         aaTq5nV6pNWVXucThXCD68rUk/QQjGRPMNRJETvY6vC9VQw03Rh6syEJHI4fNcwSoMBd
         0nxQ==
X-Gm-Message-State: AOJu0YxvyZIftNbRouioditdtFLJ9VX5StOdTxPHCbK4LXx8QF490WRd
	+xuCSU1yRsPhX093TIdYwawFqNfkMUOEST/8imEdQA==
X-Google-Smtp-Source: AGHT+IH6RRAXW8L9icGAFpz10EPAQT37UfLDWhYNXFPOSg/fZtT1eceWby7rBEWIJ0DFUgS7mF/xa7sdfTT+OUG3tjs=
X-Received: by 2002:a1f:c8c2:0:b0:486:42c1:5f57 with SMTP id
 y185-20020a1fc8c2000000b0048642c15f57mr2773409vkf.5.1691393739460; Mon, 07
 Aug 2023 00:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230804065935.v4.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
In-Reply-To: <20230804065935.v4.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 7 Aug 2023 15:35:28 +0800
Message-ID: <CAGXv+5HtYi_9mWr+m-oufYiRTzXaGRFBtqSeqbwgE2a=bYNPug@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] nmi_backtrace: Allow excluding an arbitrary CPU
To: Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 07 Aug 2023 22:34:39 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>, Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>, Peter Zijlstra <peterz@infradead.org>, "Darrick J. Wong" <djwong@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>, Pingfan Liu <kernelfans@gmail.com>, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Gaosheng Cui <cuigaosheng1@huawei.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Valentin Schneider <vschneid@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org, Petr Mladek <pmladek@suse.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb
 .de>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 4, 2023 at 10:01=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> The APIs that allow backtracing across CPUs have always had a way to
> exclude the current CPU. This convenience means callers didn't need to
> find a place to allocate a CPU mask just to handle the common case.
>
> Let's extend the API to take a CPU ID to exclude instead of just a
> boolean. This isn't any more complex for the API to handle and allows
> the hardlockup detector to exclude a different CPU (the one it already
> did a trace for) without needing to find space for a CPU mask.
>
> Arguably, this new API also encourages safer behavior. Specifically if
> the caller wants to avoid tracing the current CPU (maybe because they
> already traced the current CPU) this makes it more obvious to the
> caller that they need to make sure that the current CPU ID can't
> change.
>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - Renamed trigger_allbutself_cpu_backtrace() for when trigger is unsuppor=
ted.
>
> Changes in v3:
> - ("nmi_backtrace: Allow excluding an arbitrary CPU") new for v3.
>
>  arch/arm/include/asm/irq.h       |  2 +-
>  arch/arm/kernel/smp.c            |  4 ++--
>  arch/loongarch/include/asm/irq.h |  2 +-
>  arch/loongarch/kernel/process.c  |  4 ++--
>  arch/mips/include/asm/irq.h      |  2 +-
>  arch/mips/kernel/process.c       |  4 ++--
>  arch/powerpc/include/asm/irq.h   |  2 +-
>  arch/powerpc/kernel/stacktrace.c |  4 ++--
>  arch/powerpc/kernel/watchdog.c   |  4 ++--
>  arch/sparc/include/asm/irq_64.h  |  2 +-
>  arch/sparc/kernel/process_64.c   |  6 +++---
>  arch/x86/include/asm/irq.h       |  2 +-
>  arch/x86/kernel/apic/hw_nmi.c    |  4 ++--
>  include/linux/nmi.h              | 14 +++++++-------
>  kernel/watchdog.c                |  2 +-
>  lib/nmi_backtrace.c              |  6 +++---
>  16 files changed, 32 insertions(+), 32 deletions(-)
>

[...]

> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index e3e6a64b98e0..7cf7801856a1 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -157,31 +157,31 @@ static inline void touch_nmi_watchdog(void)
>  #ifdef arch_trigger_cpumask_backtrace
>  static inline bool trigger_all_cpu_backtrace(void)
>  {
> -       arch_trigger_cpumask_backtrace(cpu_online_mask, false);
> +       arch_trigger_cpumask_backtrace(cpu_online_mask, -1);
>         return true;
>  }
>
> -static inline bool trigger_allbutself_cpu_backtrace(void)
> +static inline bool trigger_allbutcpu_cpu_backtrace(int exclude_cpu)
>  {
> -       arch_trigger_cpumask_backtrace(cpu_online_mask, true);
> +       arch_trigger_cpumask_backtrace(cpu_online_mask, exclude_cpu);
>         return true;
>  }
>
>  static inline bool trigger_cpumask_backtrace(struct cpumask *mask)
>  {
> -       arch_trigger_cpumask_backtrace(mask, false);
> +       arch_trigger_cpumask_backtrace(mask, -1);
>         return true;
>  }
>
>  static inline bool trigger_single_cpu_backtrace(int cpu)
>  {
> -       arch_trigger_cpumask_backtrace(cpumask_of(cpu), false);
> +       arch_trigger_cpumask_backtrace(cpumask_of(cpu), -1);
>         return true;
>  }
>
>  /* generic implementation */
>  void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
> -                                  bool exclude_self,
> +                                  int exclude_cpu,
>                                    void (*raise)(cpumask_t *mask));
>  bool nmi_cpu_backtrace(struct pt_regs *regs);
>
> @@ -190,7 +190,7 @@ static inline bool trigger_all_cpu_backtrace(void)
>  {
>         return false;
>  }
> -static inline bool trigger_allbutself_cpu_backtrace(void)
> +static inline bool trigger_allbutcpu_cpu_backtrace(void)
                                                      ^
The parameter here is still wrong. It should be "int exclude_cpu".

This patch in Andrew's queue is causing build errors on next-20230807 on ar=
m64:

kernel/watchdog.c: In function =E2=80=98watchdog_timer_fn=E2=80=99:
kernel/watchdog.c:521:25: error: too many arguments to function
=E2=80=98trigger_allbutcpu_cpu_backtrace=E2=80=99
  521 |
trigger_allbutcpu_cpu_backtrace(smp_processor_id());
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from kernel/watchdog.c:17:
./include/linux/nmi.h:193:20: note: declared here
  193 | static inline bool trigger_allbutcpu_cpu_backtrace(void)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:243: kernel/watchdog.o] Error 1


ChenYu
