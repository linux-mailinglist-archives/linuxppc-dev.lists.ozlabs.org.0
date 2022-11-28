Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA6639F2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:03:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL7zq6Nr3z3cD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:03:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R7mSEix2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R7mSEix2;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL7yw65tQz2xB5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:02:48 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id s196so8680494pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 18:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOXruZSrzNErMhKWu+i7pwcDBTVdsY9pPmlBvsCV0LI=;
        b=R7mSEix2CPPS1UkKtNmCOp6g8pRkICz6ClVfYLE91l257MckPJ4RB4QtFmEO0mEwFS
         H/A+hyqnPcBbrHCGHSIEAjyfBl2G5xpn03qbSnOjEx+jDY/pstqy0go01S2en4e9RVfw
         LKYuPAHTdd180yqDaZo2wUGgKpLcgpCBSb5JLlISLaelbh5IO7hFRtrZE7u+IiucTINj
         S5zPv/byVugIxVkm/iPDyyH7njUMzz3QPpryWpH+0TOSMOzIn0QFMewunZDeD17K6m9A
         Bxn8zgAgQt8SuEXwt7XwSpDm/TtbNDABUxAAoUShSxesxC/+8jB+ZWL8lbFXebTI+A4u
         25VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOXruZSrzNErMhKWu+i7pwcDBTVdsY9pPmlBvsCV0LI=;
        b=Finn0CxQqsKTCZTnopYlJuu5QLmcP6ow5RMGgejyFmOTgffDVjQqZUwRDHHxAFcnDR
         OJcI1x5g9ZYF7QAaShss+fMHaJ6nP0lfTOyM1Fi8T4jpSlVNZ+xrdlUYkannu4Z8DB6m
         2Ah/anvKf3RHd3W2+SdHIrK0uYT7bka+5WIlqNn37rhZ2kknsYTqiozE9kjBITKEgMZj
         HB+n+sL6j9YTw6rfZ/WnC/RGEdiTwAhiHWu86WuDEYLPfDhqfb0XVr/+3JV9tvficiDM
         BiBR1NlZMVn6U1zFpTbf73VcKWftcxH7+c9HOlepNaJcAXSSTzwIFuVqT31uGx1MZ3rV
         yW1Q==
X-Gm-Message-State: ANoB5pmudPDTZV+cyTOvY6O7VG7t7jopoU94pM2XEGLkQgRISCb81DI0
	o7ce+JQr6t4SgG8Go53Y7RD43d+lnb8=
X-Google-Smtp-Source: AA0mqf7OOUIYYk/09o54kZg0R9ggX/lpndlxZ6lnV8es2E9OgB3uCW+s5YALdnB1QUYlJBjVFl8f9A==
X-Received: by 2002:a63:4643:0:b0:477:751a:4169 with SMTP id v3-20020a634643000000b00477751a4169mr25994822pgk.300.1669600965252;
        Sun, 27 Nov 2022 18:02:45 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id a194-20020a621acb000000b00565b259a52asm6782243pfa.1.2022.11.27.18.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 18:02:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 12:02:41 +1000
Message-Id: <CONK590R2VNT.2F310HEIFYA82@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 3/4] powerpc/64e: Clear gprs on interrupt routine
 entry on Book3E
X-Mailer: aerc 0.13.0
References: <20221107033202.1375238-1-rmclure@linux.ibm.com>
 <20221107033202.1375238-3-rmclure@linux.ibm.com>
In-Reply-To: <20221107033202.1375238-3-rmclure@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 7, 2022 at 1:32 PM AEST, Rohan McLure wrote:
> Zero GPRS r14-r31 on entry into the kernel for interrupt sources to
> limit influence of user-space values in potential speculation gadgets.
> Prior to this commit, all other GPRS are reassigned during the common
> prologue to interrupt handlers and so need not be zeroised explicitly.
>
> This may be done safely, without loss of register state prior to the
> interrupt, as the common prologue saves the initial values of
> non-volatiles, which are unconditionally restored in interrupt_64.S.

In the case of ret_from_crit_except and ret_from_mc_except, it looks
like those are restored by ret_from_level_except, so that's fine.
And fast_interrupt_return you added NVGPRS restore in the previous
patch too.

Maybe actually you could move that interrupt_64.h code that applies to
both 64s and 64e in patch 1. So then the 64s/e enablement patches are
independent and apply to exactly that subarch.

But code-wise I think this looks good.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Mitigation defaults to enabled by INTERRUPT_SANITIZE_REGISTERS.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> Resubmitting patches as their own series after v6 partially merged:
> Link: https://lore.kernel.org/all/166488988686.779920.1379487010269641628=
3.b4-ty@ellerman.id.au/t/
> ---
>  arch/powerpc/kernel/exceptions-64e.S | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/e=
xceptions-64e.S
> index 2f68fb2ee4fc..91d8019123c2 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -358,6 +358,11 @@ ret_from_mc_except:
>  	std	r14,PACA_EXMC+EX_R14(r13);				    \
>  	std	r15,PACA_EXMC+EX_R15(r13)
> =20
> +#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
> +#define SANITIZE_ZEROIZE_NVGPRS()	ZEROIZE_NVGPRS()
> +#else
> +#define SANITIZE_ZEROIZE_NVGPRS()
> +#endif

Could possibly share these macros.

> =20
>  /* Core exception code for all exceptions except TLB misses. */
>  #define EXCEPTION_COMMON_LVL(n, scratch, excf)				    \
> @@ -394,7 +399,8 @@ exc_##n##_common:							    \
>  	std	r12,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame */	    \
>  	std	r3,_TRAP(r1);		/* set trap number		*/  \
>  	std	r0,RESULT(r1);		/* clear regs->result */	    \
> -	SAVE_NVGPRS(r1);
> +	SAVE_NVGPRS(r1);						    \
> +	SANITIZE_ZEROIZE_NVGPRS();	/* minimise speculation influence */
> =20
>  #define EXCEPTION_COMMON(n) \
>  	EXCEPTION_COMMON_LVL(n, SPRN_SPRG_GEN_SCRATCH, PACA_EXGEN)
> --=20
> 2.34.1

