Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB4A1EB6B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 09:46:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bkcw2ZmCzDqKV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 17:46:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bkZ24kS8zDqR7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 17:43:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lfwH4I7U; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49bkZ22dMpz8sZx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 17:43:54 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49bkZ227nnz9sSn; Tue,  2 Jun 2020 17:43:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lfwH4I7U; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49bkZ01wqCz9sSg
 for <linuxppc-dev@ozlabs.org>; Tue,  2 Jun 2020 17:43:50 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id a2so11728804ejb.10
 for <linuxppc-dev@ozlabs.org>; Tue, 02 Jun 2020 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lnfyIDzAJMqf1ucsdwsMdi9SqxrHCPnb4Jh3ZX3Ss6M=;
 b=lfwH4I7UjfOv6eaTLM/NGdsZkdeuDZELT7sMUdrDV1UdqfwES0BGDFw1iEkRlaLtKi
 LDr5S3pxGF5M2KsHh2goL9VHwembFuMD9D6h9ReWoxFJX2DspXFZzaD3Z3G5+R7tFxvK
 5qe6Z6BqbY9vlehptlixRpAQC+xesgjywr6xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lnfyIDzAJMqf1ucsdwsMdi9SqxrHCPnb4Jh3ZX3Ss6M=;
 b=t82KC/x//MGPshVDarOmnYFaxGwWudn/Hwzq11PnlzPehgtVrzQM2BbA6E1qN750pf
 5GPzpKUUaDhkUFIm232hMEMvwtgVWuuGqr4qo3/FK+hQI2wUpRV0TI8FgHsf864hjy23
 JUPCK27tCVdbA33F0RKehdSA/nb0pymYYULa8Y6RwYjO9vJTQEubODBS7tOE5bzki/DF
 ay57pqo6uOekL2QkQxE5IGtZ/XVMWRguZzJp6ru/s4gSlQj3n3OzMFvSKQ9gSwY67wxW
 VqCmQgAlYWw9ULLTNuSXToCzdXlz1ij3rKWDbLtUDMTX+jy0bqrTM7qeWRPj7oo4TfvU
 kuWg==
X-Gm-Message-State: AOAM532uQbJLIJtB+1RzC2xj7t2ZDa+s8RrXNu2r7/Wf1oH7pMffJaMM
 mZCpWLK0qSOyMBiFeCnwWnVaxNb+96+ujESlPkHP84tk
X-Google-Smtp-Source: ABdhPJxVPH0/yojNVld7HMZw8VijN8922mXodR3BswtuXayi7ZJaAEym0LBIhZMeIofkMdGF8khr+WJIYM5DkZL3DZ8=
X-Received: by 2002:a17:906:1d55:: with SMTP id
 o21mr21810894ejh.491.1591083826148; 
 Tue, 02 Jun 2020 00:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052728.18227-1-jniethe5@gmail.com>
In-Reply-To: <20200602052728.18227-1-jniethe5@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jun 2020 07:43:34 +0000
Message-ID: <CACPK8XdsJVENx2NzdYZm47ogfs8We98KyngE422O4KQhdowRmA@mail.gmail.com>
Subject: Re: [PATCH 1/4] powerpc: Add a ppc_inst_as_str() helper
To: Jordan Niethe <jniethe5@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Jun 2020 at 05:31, Jordan Niethe <jniethe5@gmail.com> wrote:
>
> There are quite a few places where instructions are printed, this is
> done using a '%x' format specifier. With the introduction of prefixed
> instructions, this does not work well. Currently in these places,
> ppc_inst_val() is used for the value for %x so only the first word of
> prefixed instructions are printed.
>
> When the instructions are word instructions, only a single word should
> be printed. For prefixed instructions both the prefix and suffix should
> be printed. To accommodate both of these situations, instead of a '%x'
> specifier use '%s' and introduce a helper, __ppc_inst_as_str() which
> returns a char *. The char * __ppc_inst_as_str() returns is buffer that
> is passed to it by the caller.
>
> It is cumbersome to require every caller of __ppc_inst_as_str() to now
> declare a buffer. To make it more convenient to use __ppc_inst_as_str(),
> wrap it in a macro that uses a compound statement to allocate a buffer
> on the caller's stack before calling it.
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/powerpc/include/asm/inst.h      | 19 +++++++++++++++++++
>  arch/powerpc/kernel/kprobes.c        |  2 +-
>  arch/powerpc/kernel/trace/ftrace.c   | 26 +++++++++++++-------------
>  arch/powerpc/lib/test_emulate_step.c |  4 ++--
>  arch/powerpc/xmon/xmon.c             |  2 +-
>  5 files changed, 36 insertions(+), 17 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> index 45f3ec868258..3df7806e6dc3 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -122,6 +122,25 @@ static inline u64 ppc_inst_as_u64(struct ppc_inst x)
>  #endif
>  }
>
> +#define PPC_INST_STR_LEN sizeof("0x00000000 0x00000000")
> +
> +static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], struct ppc_inst x)
> +{
> +       if (ppc_inst_prefixed(x))
> +               sprintf(str, "0x%08x 0x%08x", ppc_inst_val(x), ppc_inst_suffix(x));
> +       else
> +               sprintf(str, "0x%08x", ppc_inst_val(x));
> +
> +       return str;
> +}
> +
> +#define ppc_inst_as_str(x)             \
> +({                                     \
> +       char __str[PPC_INST_STR_LEN];   \
> +       __ppc_inst_as_str(__str, x);    \
> +       __str;                          \
> +})
> +
>  int probe_user_read_inst(struct ppc_inst *inst,
>                          struct ppc_inst __user *nip);
>
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 227510df8c55..d0797171dba3 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -244,7 +244,7 @@ static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
>                  * So, we should never get here... but, its still
>                  * good to catch them, just in case...
>                  */
> -               printk("Can't step on instruction %x\n", ppc_inst_val(insn));
> +               printk("Can't step on instruction %s\n", ppc_inst_as_str(insn));
>                 BUG();
>         } else {
>                 /*
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index 5e399628f51a..da11a26d8213 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -73,8 +73,8 @@ ftrace_modify_code(unsigned long ip, struct ppc_inst old, struct ppc_inst new)
>
>         /* Make sure it is what we expect it to be */
>         if (!ppc_inst_equal(replaced, old)) {
> -               pr_err("%p: replaced (%#x) != old (%#x)",
> -               (void *)ip, ppc_inst_val(replaced), ppc_inst_val(old));
> +               pr_err("%p: replaced (%s) != old (%s)",
> +               (void *)ip, ppc_inst_as_str(replaced), ppc_inst_as_str(old));
>                 return -EINVAL;
>         }
>
> @@ -137,7 +137,7 @@ __ftrace_make_nop(struct module *mod,
>
>         /* Make sure that that this is still a 24bit jump */
>         if (!is_bl_op(op)) {
> -               pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
> +               pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
>                 return -EINVAL;
>         }
>
> @@ -172,8 +172,8 @@ __ftrace_make_nop(struct module *mod,
>         /* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
>         if (!ppc_inst_equal(op, ppc_inst(PPC_INST_MFLR)) &&
>             !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
> -               pr_err("Unexpected instruction %08x around bl _mcount\n",
> -                      ppc_inst_val(op));
> +               pr_err("Unexpected instruction %s around bl _mcount\n",
> +                      ppc_inst_as_str(op));
>                 return -EINVAL;
>         }
>  #else
> @@ -203,7 +203,7 @@ __ftrace_make_nop(struct module *mod,
>         }
>
>         if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
> -               pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, ppc_inst_val(op));
> +               pr_err("Expected %08x found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
>                 return -EINVAL;
>         }
>  #endif /* CONFIG_MPROFILE_KERNEL */
> @@ -231,7 +231,7 @@ __ftrace_make_nop(struct module *mod,
>
>         /* Make sure that that this is still a 24bit jump */
>         if (!is_bl_op(op)) {
> -               pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
> +               pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
>                 return -EINVAL;
>         }
>
> @@ -406,7 +406,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
>
>         /* Make sure that that this is still a 24bit jump */
>         if (!is_bl_op(op)) {
> -               pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
> +               pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
>                 return -EINVAL;
>         }
>
> @@ -533,8 +533,8 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>                 return -EFAULT;
>
>         if (!expected_nop_sequence(ip, op[0], op[1])) {
> -               pr_err("Unexpected call sequence at %p: %x %x\n",
> -               ip, ppc_inst_val(op[0]), ppc_inst_val(op[1]));
> +               pr_err("Unexpected call sequence at %p: %s %s\n",
> +               ip, ppc_inst_as_str(op[0]), ppc_inst_as_str(op[1]));
>                 return -EINVAL;
>         }
>
> @@ -597,7 +597,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>
>         /* It should be pointing to a nop */
>         if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_NOP))) {
> -               pr_err("Expected NOP but have %x\n", ppc_inst_val(op));
> +               pr_err("Expected NOP but have %s\n", ppc_inst_as_str(op));
>                 return -EINVAL;
>         }
>
> @@ -654,7 +654,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
>         }
>
>         if (!ppc_inst_equal(op, ppc_inst(PPC_INST_NOP))) {
> -               pr_err("Unexpected call sequence at %p: %x\n", ip, ppc_inst_val(op));
> +               pr_err("Unexpected call sequence at %p: %s\n", ip, ppc_inst_as_str(op));
>                 return -EINVAL;
>         }
>
> @@ -733,7 +733,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>
>         /* Make sure that that this is still a 24bit jump */
>         if (!is_bl_op(op)) {
> -               pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
> +               pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
>                 return -EINVAL;
>         }
>
> diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
> index 46af80279ebc..5fb6f5267d70 100644
> --- a/arch/powerpc/lib/test_emulate_step.c
> +++ b/arch/powerpc/lib/test_emulate_step.c
> @@ -852,7 +852,7 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
>
>         if (analyse_instr(&op, regs, instr) != 1 ||
>             GETTYPE(op.type) != COMPUTE) {
> -               pr_info("emulation failed, instruction = 0x%08x\n", ppc_inst_val(instr));
> +               pr_info("execution failed, instruction = %s\n", ppc_inst_as_str(instr));
>                 return -EFAULT;
>         }
>
> @@ -872,7 +872,7 @@ static int __init execute_compute_instr(struct pt_regs *regs,
>         /* Patch the NOP with the actual instruction */
>         patch_instruction_site(&patch__exec_instr, instr);
>         if (exec_instr(regs)) {
> -               pr_info("execution failed, instruction = 0x%08x\n", ppc_inst_val(instr));
> +               pr_info("execution failed, instruction = %s\n", ppc_inst_as_str(instr));
>                 return -EFAULT;
>         }
>
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 16ee6639a60c..1dd3bf02021b 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -2958,7 +2958,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
>                 dotted = 0;
>                 last_inst = inst;
>                 if (praddr)
> -                       printf(REG"  %.8x", adr, ppc_inst_val(inst));
> +                       printf(REG"  %s", adr, ppc_inst_as_str(inst));
>                 printf("\t");
>                 dump_func(ppc_inst_val(inst), adr);
>                 printf("\n");
> --
> 2.17.1
>
