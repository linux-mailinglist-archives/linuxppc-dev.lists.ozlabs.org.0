Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092A5502E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 15:24:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y6M21t8WzDqMr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 23:24:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y6Hj4jBYzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 23:21:21 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id e8so17188350otl.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 06:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GgVn9o2XMV2ez9jDzY+0llaXiVjr0qoFXFfqDt3jX2U=;
 b=J+SIhCo+cEHqhJd6pjlJvaQsY83yOy2ueebExbm50jUu+kG2qHYEheypn19ZtdFIcD
 FPKY2E5OllxaLDyQnhXWFT8nuIrvEgSrCkp3cCSC6DPnkRPgsmH4OyeFCyk/TqbFsZ6Y
 2mdSoyz2BTN4OSwnKC0bRABuYi8A9A+EJ3wVtUb0Rml6farASDuq4PNWhvmuBgoNZ1eE
 dsta3LtVll03w0iDt3KauIxOvoX9kwdGspiMUu78pw2X+jqvS8seBRPdIIGKgZ8RTpNG
 MV7bFi/s+muV2av+jwEZv0xLDmK0/JYs1EqDpId1OQtdBjM7i3sZJN+TcPXzZ2+h4V82
 PRLA==
X-Gm-Message-State: APjAAAV8loDO6BDqlJ95VB6I5b7fPRjr9fNnRujIOta9+AeEjTkc559t
 mQ33z5AU7RI3OAv1+hPziuwxPUvapTP3N3RnEYA=
X-Google-Smtp-Source: APXvYqxtTdkEuscypnU/zXHDBFVFEQQfPBzKSH4cOLu0kIQSsZem/FyWnB8vAkRTtysTKJpjYdQxucZzxLUC8tY+nHQ=
X-Received: by 2002:a9d:4109:: with SMTP id o9mr5521556ote.353.1561468878433; 
 Tue, 25 Jun 2019 06:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561459983.git.christophe.leroy@c-s.fr>
 <290a9673b0adac34f0008f2679efd5ab5a5c4478.1561459984.git.christophe.leroy@c-s.fr>
In-Reply-To: <290a9673b0adac34f0008f2679efd5ab5a5c4478.1561459984.git.christophe.leroy@c-s.fr>
From: Mathieu Malaterre <malat@debian.org>
Date: Tue, 25 Jun 2019 15:21:05 +0200
Message-ID: <CA+7wUsxL0OHvOn51hbJyAhpi=OJye=axKfVyauhEVXLqFuFqHA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 11/13] powerpc/ptrace: create ppc_gethwdinfo()
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Michael Neuling <mikey@neuling.org>, LKML <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2019 at 1:22 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> Create ippc_gethwdinfo() to handle PPC_PTRACE_GETHWDBGINFO and

s/ippc_gethwdinfo/ppc_gethwdinfo/

> reduce ifdef mess
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/ptrace/ptrace-adv.c   | 15 +++++++++++++++
>  arch/powerpc/kernel/ptrace/ptrace-decl.h  |  1 +
>  arch/powerpc/kernel/ptrace/ptrace-noadv.c | 20 +++++++++++++++++++
>  arch/powerpc/kernel/ptrace/ptrace.c       | 32 +------------------------------
>  4 files changed, 37 insertions(+), 31 deletions(-)
>
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-adv.c b/arch/powerpc/kernel/ptrace/ptrace-adv.c
> index dcc765940344..f5f334484ebc 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-adv.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-adv.c
> @@ -83,6 +83,21 @@ void user_disable_single_step(struct task_struct *task)
>         clear_tsk_thread_flag(task, TIF_SINGLESTEP);
>  }
>
> +void ppc_gethwdinfo(struct ppc_debug_info *dbginfo)

Would it be possible to rename it to `ppc_gethwdbginfo`, I find it
easier to read.

> +{
> +       dbginfo->version = 1;
> +       dbginfo->num_instruction_bps = CONFIG_PPC_ADV_DEBUG_IACS;
> +       dbginfo->num_data_bps = CONFIG_PPC_ADV_DEBUG_DACS;
> +       dbginfo->num_condition_regs = CONFIG_PPC_ADV_DEBUG_DVCS;
> +       dbginfo->data_bp_alignment = 4;
> +       dbginfo->sizeof_condition = 4;
> +       dbginfo->features = PPC_DEBUG_FEATURE_INSN_BP_RANGE |
> +                           PPC_DEBUG_FEATURE_INSN_BP_MASK;
> +       if (IS_ENABLED(CONFIG_PPC_ADV_DEBUG_DAC_RANGE))
> +               dbginfo->features |= PPC_DEBUG_FEATURE_DATA_BP_RANGE |
> +                                    PPC_DEBUG_FEATURE_DATA_BP_MASK;
> +}
> +
>  int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
>                         unsigned long __user *datalp)
>  {
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
> index cd5b8256ba56..2404b987b23c 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
> +++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
> @@ -141,6 +141,7 @@ int tm_cgpr32_set(struct task_struct *target, const struct user_regset *regset,
>  extern const struct user_regset_view user_ppc_native_view;
>
>  /* ptrace-(no)adv */
> +void ppc_gethwdinfo(struct ppc_debug_info *dbginfo);
>  int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
>                         unsigned long __user *datalp);
>  int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data);
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> index 985cca136f85..426fedd7ab6c 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> @@ -64,6 +64,26 @@ void user_disable_single_step(struct task_struct *task)
>         clear_tsk_thread_flag(task, TIF_SINGLESTEP);
>  }
>
> +void ppc_gethwdinfo(struct ppc_debug_info *dbginfo)
> +{
> +       dbginfo->version = 1;
> +       dbginfo->num_instruction_bps = 0;
> +       if (ppc_breakpoint_available())
> +               dbginfo->num_data_bps = 1;
> +       else
> +               dbginfo->num_data_bps = 0;
> +       dbginfo->num_condition_regs = 0;
> +       dbginfo->data_bp_alignment = sizeof(long);
> +       dbginfo->sizeof_condition = 0;
> +       if (IS_ENABLED(CONFIG_HAVE_HW_BREAKPOINT)) {
> +               dbginfo->features = PPC_DEBUG_FEATURE_DATA_BP_RANGE;
> +               if (dawr_enabled())
> +                       dbginfo->features |= PPC_DEBUG_FEATURE_DATA_BP_DAWR;
> +       } else {
> +               dbginfo->features = 0;
> +       }
> +}
> +
>  int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
>                         unsigned long __user *datalp)
>  {
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index e789afae6f56..31e8c5a9171e 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -159,37 +159,7 @@ long arch_ptrace(struct task_struct *child, long request,
>         case PPC_PTRACE_GETHWDBGINFO: {
>                 struct ppc_debug_info dbginfo;
>
> -               dbginfo.version = 1;
> -#ifdef CONFIG_PPC_ADV_DEBUG_REGS
> -               dbginfo.num_instruction_bps = CONFIG_PPC_ADV_DEBUG_IACS;
> -               dbginfo.num_data_bps = CONFIG_PPC_ADV_DEBUG_DACS;
> -               dbginfo.num_condition_regs = CONFIG_PPC_ADV_DEBUG_DVCS;
> -               dbginfo.data_bp_alignment = 4;
> -               dbginfo.sizeof_condition = 4;
> -               dbginfo.features = PPC_DEBUG_FEATURE_INSN_BP_RANGE |
> -                                  PPC_DEBUG_FEATURE_INSN_BP_MASK;
> -#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
> -               dbginfo.features |=
> -                                  PPC_DEBUG_FEATURE_DATA_BP_RANGE |
> -                                  PPC_DEBUG_FEATURE_DATA_BP_MASK;
> -#endif
> -#else /* !CONFIG_PPC_ADV_DEBUG_REGS */
> -               dbginfo.num_instruction_bps = 0;
> -               if (ppc_breakpoint_available())
> -                       dbginfo.num_data_bps = 1;
> -               else
> -                       dbginfo.num_data_bps = 0;
> -               dbginfo.num_condition_regs = 0;
> -               dbginfo.data_bp_alignment = sizeof(long);
> -               dbginfo.sizeof_condition = 0;
> -#ifdef CONFIG_HAVE_HW_BREAKPOINT
> -               dbginfo.features = PPC_DEBUG_FEATURE_DATA_BP_RANGE;
> -               if (dawr_enabled())
> -                       dbginfo.features |= PPC_DEBUG_FEATURE_DATA_BP_DAWR;
> -#else
> -               dbginfo.features = 0;
> -#endif /* CONFIG_HAVE_HW_BREAKPOINT */
> -#endif /* CONFIG_PPC_ADV_DEBUG_REGS */
> +               ppc_gethwdinfo(&dbginfo);
>
>                 if (copy_to_user(datavp, &dbginfo,
>                                  sizeof(struct ppc_debug_info)))
> --
> 2.13.3
>
