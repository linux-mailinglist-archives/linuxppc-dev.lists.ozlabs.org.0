Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F5231A6C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 22:22:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcmgL1NkYzDwvd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Feb 2021 08:22:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=jtrl4rTR; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dcmdc1xW9zDwl9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Feb 2021 08:21:23 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id t26so492333pgv.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 13:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=1XvoCECmT3plBnzkkShbH513g0PqtMrwBfSxXnTuz4M=;
 b=jtrl4rTRTNfdeUfERBe+i8OnVzvNKOFSbA1R2RDlyCReQu/Jtlj5OK/AmjCusU0q+W
 xX0XiW/dLFnGKqaRkurtus9XYm8GxQFxL4FyVK8TXEVPlysgT0KiWtjD5UYJbmVPQbj1
 xGYZAiOfNbLS1cC1QOlVbaZ0v1cL8zEZqdqtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=1XvoCECmT3plBnzkkShbH513g0PqtMrwBfSxXnTuz4M=;
 b=QALZx+OQUR+NZqnz9ktVjZjbgjTwxRy0wwfPlXkJl9J0q7R0nA0nEIuQjhyfmmpeG2
 Cg1AQzyqPOSKiP2Q0Cak7z1Iu3dBnOFBPod3ZC9+xMipcbMhurfKXgclKizeM5SmYuU4
 h6RYLxUy3RoFydpVh7Zr5pnLBj3aqtiztqXMBnfou8koAsXQVr6Jxh+gT3cNEBkVi6/m
 Sx7j2Wpei2TN1nzSmLRD4T5tF7nLWMJ1Gg8la5OXrAmpK+YcvEvRjb1dYK9wP0oCBU45
 Al1x5VQsdiJ2fyZeTwzNlMoOraQKh08CIaT/rc09691C50Ehtb8VR3hhuRChX3CBx4om
 sH2Q==
X-Gm-Message-State: AOAM533QQ2N4KZM7KEQ2qrEnOX+/PXg61Rwz/oKvzHLJDsQpAdKeOQsL
 9l5yApaQcaMNhz/pT6BsL//1TQ==
X-Google-Smtp-Source: ABdhPJzJwHbl+rCCaT77OYMjE9995QNqGrh3Kxd0AeXSFpTATlPuMpMIJ44c1e9tj5ZLSfkqupUf2Q==
X-Received: by 2002:aa7:8a99:0:b029:1a6:c8b8:1414 with SMTP id
 a25-20020aa78a990000b02901a6c8b81414mr4515942pfc.66.1613164879764; 
 Fri, 12 Feb 2021 13:21:19 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-c245-dfb7-be39-91ab.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:c245:dfb7:be39:91ab])
 by smtp.gmail.com with ESMTPSA id v9sm7389773pjd.30.2021.02.12.13.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 13:21:19 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 10/10] powerpc/signal64: Use __get_user() to copy
 sigset_t
In-Reply-To: <20210203184323.20792-11-cmr@codefail.de>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-11-cmr@codefail.de>
Date: Sat, 13 Feb 2021 08:21:16 +1100
Message-ID: <87v9axc78z.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Christopher M. Riedl" <cmr@codefail.de> writes:

> Usually sigset_t is exactly 8B which is a "trivial" size and does not
> warrant using __copy_from_user(). Use __get_user() directly in
> anticipation of future work to remove the trivial size optimizations
> from __copy_from_user(). Calling __get_user() also results in a small
> boost to signal handling throughput here.

Modulo the comments from Christophe, this looks good to me. It seems to
do what it says on the tin.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Do you know if this patch is responsible for the slightly increase in
radix performance you observed in your cover letter? The rest of the
series shouldn't really make things faster than the no-KUAP case...

Kind regards,
Daniel

>
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>  arch/powerpc/kernel/signal_64.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 817b64e1e409..42fdc4a7ff72 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -97,6 +97,14 @@ static void prepare_setup_sigcontext(struct task_struct *tsk, int ctx_has_vsx_re
>  #endif /* CONFIG_VSX */
>  }
>  
> +static inline int get_user_sigset(sigset_t *dst, const sigset_t *src)
> +{
> +	if (sizeof(sigset_t) <= 8)
> +		return __get_user(dst->sig[0], &src->sig[0]);
> +	else
> +		return __copy_from_user(dst, src, sizeof(sigset_t));
> +}
> +
>  /*
>   * Set up the sigcontext for the signal frame.
>   */
> @@ -701,8 +709,9 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>  	 * We kill the task with a SIGSEGV in this situation.
>  	 */
>  
> -	if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
> +	if (get_user_sigset(&set, &new_ctx->uc_sigmask))
>  		do_exit(SIGSEGV);
> +
>  	set_current_blocked(&set);
>  
>  	if (!user_read_access_begin(new_ctx, ctx_size))
> @@ -740,8 +749,9 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  	if (!access_ok(uc, sizeof(*uc)))
>  		goto badframe;
>  
> -	if (__copy_from_user(&set, &uc->uc_sigmask, sizeof(set)))
> +	if (get_user_sigset(&set, &uc->uc_sigmask))
>  		goto badframe;
> +
>  	set_current_blocked(&set);
>  
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> -- 
> 2.26.1
