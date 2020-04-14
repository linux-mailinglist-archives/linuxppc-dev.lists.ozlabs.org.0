Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9211A8F37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 01:38:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49224J53B1zDqwg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 09:38:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H2GWCkBa; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49220x1Hm9zDqy1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 09:35:45 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id j26so1376541ots.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 16:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YORqZ9euCUdgELYPYpyBVAiDQUydnxiQ/4UiQLERnY0=;
 b=H2GWCkBadChNGNh1aiAajF4NueL1GJn7l3lksZ/cy0sBil/AVnbJNRSLlTa2R6rulF
 RNgmjNGf2UO/2FVlla/bl+Qs6qxufiL2NJo24ZuIpFVFNxEMyHJRzP8bStz9PBq8siwC
 8TUDOOjmBaZQyYUyBesgv0QbHlO/NStLZ0H4uksls873yyviJbvsrJ+CeIgSH3AB+U1B
 pYfymjMJEqw2O9BumDzs5S5gmfdVd5cD0sGV1MkjAv7q/yujDTS9LekwCHPQgvwLbUI1
 OZtQwYZfqFkIARnFm1xe7LmSqnaTH5/FXbHC9/1qTgWPTJ0fL34EEU0LZL3UkArKe9vo
 SwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YORqZ9euCUdgELYPYpyBVAiDQUydnxiQ/4UiQLERnY0=;
 b=C7SdSWyJBtRr5KJUVVXqJKODX3YZxLCz5Y5RDGg6ZyUXVpyo5Dea3/WNRGv0rDr13A
 f0oFJAnitZ/YZcGuQ+F+2lyANxI5yWAHcDBLz/fU6YdzERsT9V/szhKPBIZJgWKVJl6y
 0N1CnR5k0wNxOqTj39ixal19rQT7aQqfyLErHx91NMciVDwwu2TuBm73oOppxk2Ar6Pt
 GGhUw7gvO2/5ImkvFNLAaj2HuYvwbAa2wGzWpVWMltCE7xUBoyAspcXEj7F8NxLYky2s
 leClmTiYHgNcuZ2DOijwf3Y6SrLkB+JXj8lK/In8p24SEIi+3Z/InUKGDHWBwxuAhZ5/
 T3xQ==
X-Gm-Message-State: AGi0PuYiMmgA8jzjODtvfqJf2cm1lfnx02sxDlGWVO5lQKVtRO+QLmzb
 9xk+FpuZPkUnpDrzo3YB89k=
X-Google-Smtp-Source: APiQypKDqMcdQFeEqQ+eeg0NUDmM2AacSxrjDO2re3WAznHekEDbooPvni0RRNlXN1Kvi61i4Xfmlw==
X-Received: by 2002:a9d:12ce:: with SMTP id g72mr20515638otg.350.1586907341911; 
 Tue, 14 Apr 2020 16:35:41 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id i23sm5852272otp.74.2020.04.14.16.35.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Apr 2020 16:35:41 -0700 (PDT)
Date: Tue, 14 Apr 2020 16:35:39 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc: Fix mtmsr(d) L=1 variant that loses interrupts
Message-ID: <20200414233539.GA5002@ubuntu-s3-xlarge-x86>
References: <20200414111131.465560-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414111131.465560-1-npiggin@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 09:11:31PM +1000, Nicholas Piggin wrote:
> If mtmsr L=1 sets MSR[EE] while there is a maskable exception pending,
> it does not cause an interrupt. This causes the test case to hang:
> 
> https://lists.gnu.org/archive/html/qemu-ppc/2019-10/msg00826.html
> 
> More recently, Linux reduced the occurance of operations (e.g., rfi)
> which stop translation and allow pending interrupts to be processed.
> This started causing hangs in Linux boot in long-running kernel tests,
> running with '-d int' shows the decrementer stops firing despite DEC
> wrapping and MSR[EE]=1.
> 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-April/208301.html
> 
> The cause is the broken mtmsr L=1 behaviour, which is contrary to the
> architecture. From Power ISA v3.0B, p.977, Move To Machine State Register,
> Programming Note states:
> 
>     If MSR[EE]=0 and an External, Decrementer, or Performance Monitor
>     exception is pending, executing an mtmsrd instruction that sets
>     MSR[EE] to 1 will cause the interrupt to occur before the next
>     instruction is executed, if no higher priority exception exists
> 
> Fix this by handling L=1 exactly the same way as L=0, modulo the MSR
> bits altered.
> 
> The confusion arises from L=0 being "context synchronizing" whereas L=1
> is "execution synchronizing", which is a weaker semantic. However this
> is not a relaxation of the requirement that these exceptions cause
> interrupts when MSR[EE]=1 (e.g., when mtmsr executes to completion as
> TCG is doing here), rather it specifies how a pipelined processor can
> have multiple instructions in flight where one may influence how another
> behaves.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Anton Blanchard <anton@ozlabs.org>
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Thanks very much to Nathan for reporting and testing it, I added his
> Tested-by tag despite a more polished patch, as the the basics are 
> still the same (and still fixes his test case here).

I did re-run the test with the updated version of your patch and it
passed still so that tag can still stand without any controversy :)

Thank you for the fix again!
Nathan

> This bug possibly goes back to early v2.04 / mtmsrd L=1 support around
> 2007, and the code has been changed several times since then so may
> require some backporting.
> 
> 32-bit / mtmsr untested at the moment, I don't have an environment
> handy.
> 
>  target/ppc/translate.c | 46 +++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b207fb5386..9959259dba 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4361,30 +4361,34 @@ static void gen_mtmsrd(DisasContext *ctx)
>      CHK_SV;
>  
>  #if !defined(CONFIG_USER_ONLY)
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
>      if (ctx->opcode & 0x00010000) {
> -        /* Special form that does not need any synchronisation */
> +        /* L=1 form only updates EE and RI */
>          TCGv t0 = tcg_temp_new();
> +        TCGv t1 = tcg_temp_new();
>          tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
>                          (1 << MSR_RI) | (1 << MSR_EE));
> -        tcg_gen_andi_tl(cpu_msr, cpu_msr,
> +        tcg_gen_andi_tl(t1, cpu_msr,
>                          ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
> -        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
> +        tcg_gen_or_tl(t1, t1, t0);
> +
> +        gen_helper_store_msr(cpu_env, t1);
>          tcg_temp_free(t0);
> +        tcg_temp_free(t1);
> +
>      } else {
>          /*
>           * XXX: we need to update nip before the store if we enter
>           *      power saving mode, we will exit the loop directly from
>           *      ppc_store_msr
>           */
> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_start();
> -        }
>          gen_update_nip(ctx, ctx->base.pc_next);
>          gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
> -        /* Must stop the translation as machine state (may have) changed */
> -        /* Note that mtmsr is not always defined as context-synchronizing */
> -        gen_stop_exception(ctx);
>      }
> +    /* Must stop the translation as machine state (may have) changed */
> +    gen_stop_exception(ctx);
>  #endif /* !defined(CONFIG_USER_ONLY) */
>  }
>  #endif /* defined(TARGET_PPC64) */
> @@ -4394,15 +4398,23 @@ static void gen_mtmsr(DisasContext *ctx)
>      CHK_SV;
>  
>  #if !defined(CONFIG_USER_ONLY)
> -   if (ctx->opcode & 0x00010000) {
> -        /* Special form that does not need any synchronisation */
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    if (ctx->opcode & 0x00010000) {
> +        /* L=1 form only updates EE and RI */
>          TCGv t0 = tcg_temp_new();
> +        TCGv t1 = tcg_temp_new();
>          tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
>                          (1 << MSR_RI) | (1 << MSR_EE));
> -        tcg_gen_andi_tl(cpu_msr, cpu_msr,
> +        tcg_gen_andi_tl(t1, cpu_msr,
>                          ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
> -        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
> +        tcg_gen_or_tl(t1, t1, t0);
> +
> +        gen_helper_store_msr(cpu_env, t1);
>          tcg_temp_free(t0);
> +        tcg_temp_free(t1);
> +
>      } else {
>          TCGv msr = tcg_temp_new();
>  
> @@ -4411,9 +4423,6 @@ static void gen_mtmsr(DisasContext *ctx)
>           *      power saving mode, we will exit the loop directly from
>           *      ppc_store_msr
>           */
> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_start();
> -        }
>          gen_update_nip(ctx, ctx->base.pc_next);
>  #if defined(TARGET_PPC64)
>          tcg_gen_deposit_tl(msr, cpu_msr, cpu_gpr[rS(ctx->opcode)], 0, 32);
> @@ -4422,10 +4431,9 @@ static void gen_mtmsr(DisasContext *ctx)
>  #endif
>          gen_helper_store_msr(cpu_env, msr);
>          tcg_temp_free(msr);
> -        /* Must stop the translation as machine state (may have) changed */
> -        /* Note that mtmsr is not always defined as context-synchronizing */
> -        gen_stop_exception(ctx);
>      }
> +    /* Must stop the translation as machine state (may have) changed */
> +    gen_stop_exception(ctx);
>  #endif
>  }
>  
> -- 
> 2.23.0
> 
