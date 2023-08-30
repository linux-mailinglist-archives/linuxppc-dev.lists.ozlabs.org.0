Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6881F78D43C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 10:50:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OXctCXRG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbJ0J2RyVz3c3Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 18:50:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OXctCXRG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbHzN6Nr0z2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 18:49:36 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bf3f59905so692106366b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 01:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1693385369; x=1693990169; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Id0mOtcN/jBp+Q/VaNDUo1xdOQXoPuoHi26wXfM9WY=;
        b=OXctCXRGBgtmXxdmmZYlB4RnSy0C4SgazhStydHgadaNAmdNsyH33UKtU+RQBpa7C0
         EOG8HvvRwQLk1GvARnQ1N7D+vj7fBtFml+XrnyqPHFfWF0AAc7YpFvrxAPe+G8ZsiSRm
         EIjQmaEzZah2Nrdp4ObQaITwJ6DjkvEEX0lMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693385369; x=1693990169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Id0mOtcN/jBp+Q/VaNDUo1xdOQXoPuoHi26wXfM9WY=;
        b=CMNv3nVkBY8qcV5CCjd4RLeDI/0GKOEygoVGNoWEKxIDmRxgQ1Z+i1X7sK3DUtdQRF
         tbRk4Im/jld8Csf0NaIJumUBCXzII7ai+CAFPpdB5XE0RZJ/E/g9qy0nte4yUm5uDutt
         94W8Geb5pnS3m0iT/muTO3d0q3IQp3RqbEq39znwYxqB1ElwGpU3/Za+FXaV65NwPAPa
         S93wx+XqIMa+CcTje6AdGMeVxvsdgTPnsxhz5TGnUSpv1DcL89KjOGkT1WxIE0WF0G7R
         B6uhd46/DCynDux7rTXbFeC4WvhJxFkfUvLrFXNpQrZhtVj07QQbAM9YuuR25atojNRg
         nEfg==
X-Gm-Message-State: AOJu0YwrdBx/jfg9jgoWwsfsyD3+lpn+2dq3dwCiJ3sI0DG9GhuFmtiW
	p8ypQEPZyEByoFlXswsNLYyks8CVuu/Yj+jX5M0=
X-Google-Smtp-Source: AGHT+IEB+1pTenQ0UWuyJyfN9OLvVIPSS49BtWYQVY6y0VGNEnouuuAqeDmshbIfVIF90Wlq7YD5pRXYvTOmghyuMYk=
X-Received: by 2002:a17:906:9bfa:b0:9a1:d2ef:3e3b with SMTP id
 de58-20020a1709069bfa00b009a1d2ef3e3bmr1111379ejc.38.1693385369328; Wed, 30
 Aug 2023 01:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230824064210.907266-1-mpe@ellerman.id.au>
In-Reply-To: <20230824064210.907266-1-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Aug 2023 08:49:17 +0000
Message-ID: <CACPK8Xc7mpxAHXn1O=u2-UFpAY-svQeoW_Hs4cqoToyj2T6CLA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Hide empty pt_regs at base of the stack
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Aug 2023 at 06:42, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> A thread started via eg. user_mode_thread() runs in the kernel to begin
> with and then may later return to userspace. While it's running in the
> kernel it has a pt_regs at the base of its kernel stack, but that
> pt_regs is all zeroes.
>
> If the thread oopses in that state, it leads to an ugly stack trace with
> a big block of zero GPRs, as reported by Joel:
>
>   Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
>   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc7-00004-gf7757129e3de-dirty #3
>   Hardware name: IBM PowerNV (emulated by qemu) POWER9 0x4e1200 opal:v7.0 PowerNV
>   Call Trace:
>   [c0000000036afb00] [c0000000010dd058] dump_stack_lvl+0x6c/0x9c (unreliable)
>   [c0000000036afb30] [c00000000013c524] panic+0x178/0x424
>   [c0000000036afbd0] [c000000002005100] mount_root_generic+0x250/0x324
>   [c0000000036afca0] [c0000000020057d0] prepare_namespace+0x2d4/0x344
>   [c0000000036afd20] [c0000000020049c0] kernel_init_freeable+0x358/0x3ac
>   [c0000000036afdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
>   [c0000000036afe50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
>   --- interrupt: 0 at 0x0
>   NIP:  0000000000000000 LR: 0000000000000000 CTR: 0000000000000000
>   REGS: c0000000036afe80 TRAP: 0000   Not tainted  (6.5.0-rc7-00004-gf7757129e3de-dirty)
>   MSR:  0000000000000000 <>  CR: 00000000  XER: 00000000
>   CFAR: 0000000000000000 IRQMASK: 0
>   GPR00: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR12: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   NIP [0000000000000000] 0x0
>   LR [0000000000000000] 0x0
>   --- interrupt: 0
>
> The all-zero pt_regs looks ugly and conveys no useful information, other
> than its presence. So detect that case and just show the presence of the
> frame by printing the interrupt marker, eg:
>
>   Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
>   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc3-00126-g18e9506562a0-dirty #301
>   Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
>   Call Trace:
>   [c000000003aabb00] [c000000001143db8] dump_stack_lvl+0x6c/0x9c (unreliable)
>   [c000000003aabb30] [c00000000014c624] panic+0x178/0x424
>   [c000000003aabbd0] [c0000000020050fc] mount_root_generic+0x250/0x324
>   [c000000003aabca0] [c0000000020057cc] prepare_namespace+0x2d4/0x344
>   [c000000003aabd20] [c0000000020049bc] kernel_init_freeable+0x358/0x3ac
>   [c000000003aabdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
>   [c000000003aabe50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
>   --- interrupt: 0 at 0x0
>
> To avoid ever suppressing a valid pt_regs make sure the pt_regs has a
> zero MSR and TRAP value, and is located at the very base of the stack.
>
> Reported-by: Joel Stanley <joel@jms.id.au>
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks for the explanation and the patch.

> ---
>  arch/powerpc/kernel/process.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index b68898ac07e1..392404688cec 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2258,6 +2258,22 @@ unsigned long __get_wchan(struct task_struct *p)
>         return ret;
>  }
>
> +static bool empty_user_regs(struct pt_regs *regs, struct task_struct *tsk)
> +{
> +       unsigned long stack_page;
> +
> +       // A non-empty pt_regs should never have a zero MSR or TRAP value.
> +       if (regs->msr || regs->trap)
> +               return false;
> +
> +       // Check it sits at the very base of the stack
> +       stack_page = (unsigned long)task_stack_page(tsk);
> +       if ((unsigned long)(regs + 1) != stack_page + THREAD_SIZE)
> +               return false;
> +
> +       return true;
> +}
> +
>  static int kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
>
>  void __no_sanitize_address show_stack(struct task_struct *tsk,
> @@ -2322,9 +2338,13 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
>                         lr = regs->link;
>                         printk("%s--- interrupt: %lx at %pS\n",
>                                loglvl, regs->trap, (void *)regs->nip);
> -                       __show_regs(regs);
> -                       printk("%s--- interrupt: %lx\n",
> -                              loglvl, regs->trap);
> +
> +                       // Detect the case of an empty pt_regs at the very base
> +                       // of the stack and suppress showing it in full.
> +                       if (!empty_user_regs(regs, tsk)) {
> +                               __show_regs(regs);
> +                               printk("%s--- interrupt: %lx\n", loglvl, regs->trap);
> +                       }
>
>                         firstframe = 1;
>                 }
> --
> 2.41.0
>
