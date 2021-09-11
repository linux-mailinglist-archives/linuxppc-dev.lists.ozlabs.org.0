Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C0407598
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 10:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H65T92V7hz2yp2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 18:27:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CY2kR6dh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CY2kR6dh; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H65ST0nvsz2yHB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 18:26:46 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id k65so8981402yba.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9dFdl8qolYp+2KOfvbi/BayaeYoUjc2XtP7RYGXYQnk=;
 b=CY2kR6dhJZ7Rqy0coiETxnTG7aDzg00EoMwpHVb6g3bOud7EW5KkTZBerehMQDCul3
 Z7CHvAvYRIrc5bGoA9lXmtCzeZo6RkVoz42Yi0m/GpxZYD+ojEVGyNNbLqsIRiWRvqpG
 Zd/hAQZM5vXrs9A3aoVKEwFfPE0Bo6+ZPPqL5SVaW7VSeNe4qo5I14Wk2I6Psufg6IDQ
 Vpom6NnVsCDjxgbKCM/ob9yZacrJsbLpwJxsLkTmRS1E8AD5dWIOacXOD/gedQzuyqvS
 mVL7Imnr+py9bIc9+OFUuwUayvM5GEy5g2fWjbJNOQ6usR244KARfb0CBCFq1qKLMPan
 Z4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9dFdl8qolYp+2KOfvbi/BayaeYoUjc2XtP7RYGXYQnk=;
 b=fZhjHuTpkpD4e8jtfnFs6JXLjazU7fdMcP+MQaDAmMlhuXxK2VzooP6YaEj4/oGSjx
 /ghaM8OgyzuRT4fKnoROjfhBVgwDQN7GiAohKO668NUZwCST/9d4J2HlxFwUgzV6J3gh
 nVu5BXNQzne0BIWHl1tBPXZCWx46LyrdxxeQ1RVyBHgVzgS9e27pnDT3AMPviN46quTA
 U80ddG3QDN+JnfrjCDCclY9g7p9yHtTDvZMiClj3VHlWCn1avFSgI164vMdbAv6H3rtM
 zHsNNyZfXefi1Fz5AMLq22r24zq52+nP9WQKNazWfjBsh2zgn170HCbD2A9bUiaOgtLu
 Ynrg==
X-Gm-Message-State: AOAM533vybxw+hFpo90zra/CShYbM7hx6UpJm6UJ33yPwEywk+Tz/6SS
 c0Xog9WpOW04ltYSDM+iQjizIVNGCGIuTtUnsOc=
X-Google-Smtp-Source: ABdhPJwR18hCeCRtUI/7xBOE7IFhPyPGPz8V4vhYAO4fbXWIVv+Hn1jLxNjxKEIhU3SX6GhTl9j8h2dNbfnrU9E3g3Q=
X-Received: by 2002:a5b:f43:: with SMTP id y3mr2341483ybr.45.1631348804276;
 Sat, 11 Sep 2021 01:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210911022904.30962-1-cmr@bluescreens.de>
 <20210911022904.30962-2-cmr@bluescreens.de>
In-Reply-To: <20210911022904.30962-2-cmr@bluescreens.de>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Sat, 11 Sep 2021 18:26:32 +1000
Message-ID: <CACzsE9rThU0JBACJoeeHOyEOA8CbFwRExrOhTsySaOH44yJa6g@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] powerpc/64s: Introduce temporary mm for Radix MMU
To: "Christopher M. Riedl" <cmr@bluescreens.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 11, 2021 at 12:35 PM Christopher M. Riedl
<cmr@bluescreens.de> wrote:
>
> x86 supports the notion of a temporary mm which restricts access to
> temporary PTEs to a single CPU. A temporary mm is useful for situations
> where a CPU needs to perform sensitive operations (such as patching a
> STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
> said mappings to other CPUs. Another benefit is that other CPU TLBs do
> not need to be flushed when the temporary mm is torn down.
>
> Mappings in the temporary mm can be set in the userspace portion of the
> address-space.
>
> Interrupts must be disabled while the temporary mm is in use. HW
> breakpoints, which may have been set by userspace as watchpoints on
> addresses now within the temporary mm, are saved and disabled when
> loading the temporary mm. The HW breakpoints are restored when unloading
> the temporary mm. All HW breakpoints are indiscriminately disabled while
> the temporary mm is in use - this may include breakpoints set by perf.

I had thought CPUs with a DAWR might not need to do this because the
privilege level that breakpoints trigger on can be configured. But it
turns out in ptrace, etc we use HW_BRK_TYPE_PRIV_ALL.

>
> Based on x86 implementation:
>
> commit cefa929c034e
> ("x86/mm: Introduce temporary mm structs")
>
> Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>
>
> ---
>
> v6:  * Use {start,stop}_using_temporary_mm() instead of
>        {use,unuse}_temporary_mm() as suggested by Christophe.
>
> v5:  * Drop support for using a temporary mm on Book3s64 Hash MMU.
>
> v4:  * Pass the prev mm instead of NULL to switch_mm_irqs_off() when
>        using/unusing the temp mm as suggested by Jann Horn to keep
>        the context.active counter in-sync on mm/nohash.
>      * Disable SLB preload in the temporary mm when initializing the
>        temp_mm struct.
>      * Include asm/debug.h header to fix build issue with
>        ppc44x_defconfig.
> ---
>  arch/powerpc/include/asm/debug.h |  1 +
>  arch/powerpc/kernel/process.c    |  5 +++
>  arch/powerpc/lib/code-patching.c | 56 ++++++++++++++++++++++++++++++++
>  3 files changed, 62 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
> index 86a14736c76c..dfd82635ea8b 100644
> --- a/arch/powerpc/include/asm/debug.h
> +++ b/arch/powerpc/include/asm/debug.h
> @@ -46,6 +46,7 @@ static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
>  #endif
>
>  void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
> +void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk);
>  bool ppc_breakpoint_available(void);
>  #ifdef CONFIG_PPC_ADV_DEBUG_REGS
>  extern void do_send_trap(struct pt_regs *regs, unsigned long address,
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 50436b52c213..6aa1f5c4d520 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -865,6 +865,11 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
>         return 0;
>  }
>
> +void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk)
> +{
> +       memcpy(brk, this_cpu_ptr(&current_brk[nr]), sizeof(*brk));
> +}

The breakpoint code is already a little hard to follow. I'm worried
doing this might spread breakpoint handling into more places in the
future.
What about something like having a breakpoint_pause() function which
clears the hardware registers only and then a breakpoint_resume()
function that copies from current_brk[] back to the hardware
registers?
Then we don't have to make another copy of the breakpoint state.

> +
>  void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
>  {
>         memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index f9a3019e37b4..8d61a7d35b89 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c

Sorry I might have missed it, but what was the reason for not putting
this stuff in mmu_context.h?

> @@ -17,6 +17,9 @@
>  #include <asm/code-patching.h>
>  #include <asm/setup.h>
>  #include <asm/inst.h>
> +#include <asm/mmu_context.h>
> +#include <asm/debug.h>
> +#include <asm/tlb.h>
>
>  static int __patch_instruction(u32 *exec_addr, struct ppc_inst instr, u32 *patch_addr)
>  {
> @@ -45,6 +48,59 @@ int raw_patch_instruction(u32 *addr, struct ppc_inst instr)
>  }
>
>  #ifdef CONFIG_STRICT_KERNEL_RWX
> +
> +struct temp_mm {
> +       struct mm_struct *temp;
> +       struct mm_struct *prev;
> +       struct arch_hw_breakpoint brk[HBP_NUM_MAX];
^ Then we wouldn't need this.
> +};
> +
> +static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struct *mm)
> +{
> +       /* We currently only support temporary mm on the Book3s64 Radix MMU */
> +       WARN_ON(!radix_enabled());
> +
> +       temp_mm->temp = mm;
> +       temp_mm->prev = NULL;
> +       memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
> +}
> +
> +static inline void start_using_temporary_mm(struct temp_mm *temp_mm)
> +{
> +       lockdep_assert_irqs_disabled();
> +
> +       temp_mm->prev = current->active_mm;
> +       switch_mm_irqs_off(temp_mm->prev, temp_mm->temp, current);

Now that we only support radix it should be fine again to have it like this:
switch_mm_irqs_off(NULL, temp_mm->temp, current);?
It was changed from that because it would cause issues on nohash I thought.

> +
> +       WARN_ON(!mm_is_thread_local(temp_mm->temp));
> +
> +       if (ppc_breakpoint_available()) {
> +               struct arch_hw_breakpoint null_brk = {0};
> +               int i = 0;
> +
> +               for (; i < nr_wp_slots(); ++i) {
> +                       __get_breakpoint(i, &temp_mm->brk[i]);
> +                       if (temp_mm->brk[i].type != 0)
> +                               __set_breakpoint(i, &null_brk);
> +               }
> +       }
> +}
> +
> +static inline void stop_using_temporary_mm(struct temp_mm *temp_mm)
> +{
> +       lockdep_assert_irqs_disabled();
> +
> +       switch_mm_irqs_off(temp_mm->temp, temp_mm->prev, current);
> +
> +       if (ppc_breakpoint_available()) {
> +               int i = 0;
> +
> +               for (; i < nr_wp_slots(); ++i)
> +                       if (temp_mm->brk[i].type != 0)
> +                               __set_breakpoint(i, &temp_mm->brk[i]);
> +       }
> +}
> +
>  static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
>
>  static int text_area_cpu_up(unsigned int cpu)
> --
> 2.32.0
>
Thanks,
Jordan
