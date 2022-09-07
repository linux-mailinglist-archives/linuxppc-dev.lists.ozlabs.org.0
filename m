Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE15AFB0B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 06:20:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMpvF0Rh6z3c2q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:20:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XaM94McY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XaM94McY;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMptY4QZbz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 14:19:31 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso231061pjq.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=nnr89aGKxdd48F2iXzgE91oxHs25etzBcZbMEAxy/H4=;
        b=XaM94McYkmTZUMvujtDYOzoPtE7z90Ns+AM+OU4yMZGCBdcHrvrYm+h2P77Va7WQGH
         sksfTfd56qt0Q8lnEyvOtlzKY/WxpMfkulZAIsMQ1llL52PEdRVxRyNFt8F0MXsshK2Y
         mUIYVtEZZKos2hklQc0IVmL7j7ptrbz68lRz1qBfKN3k+3IZj2QuZEgKwmUxH1DTr/Z/
         J/xN4ZTdAgoH7DWmyH4z1IODODOYJZ9DBKA8IqXsmsHEMh19H2DR7HwHG8vScdL4765G
         l/SwidpDwIGYXdws2Lb5IzH5bd7dDstZGf1gWFwSn9fILjH/3JWfhXCiMU1mhr974tYf
         hong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=nnr89aGKxdd48F2iXzgE91oxHs25etzBcZbMEAxy/H4=;
        b=hBzeAZ9GyXyF8Axnb3aoZwpzrJhkvcpkdT5cGruoEfVy6tFCbSAD/d7R+Ev56GOPEE
         xrQsFUAciEt0COG5nlG+ha0XAngHZGb/fdG2ABQs2x+NprHt8SfR+9y0wf9R3r3BOUUp
         RJiLr9vZDq79faWL3eyRkYOcIEqLf2lyskjfEomY7KYVBhTX8A43GoxHNUpKrdYOOGFe
         ak6dPbyndi23D6inL55OPL884+HDYG4ktvZgC9Li/9IRK5XS2mo8ixkX08FGS27ciWEA
         TsN/zNwH6AunTjZ3TCj5QD0nnJJIOuqkEabdHNP+c09CWTzOpinpA6rw2+OB7w0pPmP3
         xquw==
X-Gm-Message-State: ACgBeo3Dk7acwv+Z5y+XHjGgBwlXRD9wttdiY4vP9npiSRhcVf8NLzx2
	yA/74PH6Cyxc1jMWPhoiI3o=
X-Google-Smtp-Source: AA6agR6iCn3zhK+vGvZXbi7EdAUpwXPYahtAGhjujJeKzGvAGZjaXarrF0HLQRok3DkblS6N1byNYw==
X-Received: by 2002:a17:902:bb97:b0:175:6721:2c34 with SMTP id m23-20020a170902bb9700b0017567212c34mr1859786pls.146.1662524366830;
        Tue, 06 Sep 2022 21:19:26 -0700 (PDT)
Received: from localhost ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id o22-20020a63f156000000b00434acf7a05fsm2399739pgk.45.2022.09.06.21.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 21:19:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Sep 2022 14:19:21 +1000
Message-Id: <CMPVP7RZXP5G.2D3ZNQPWARIG8@bobo>
Subject: Re: [PACTH v2] powerpc/pseries/mce: Avoid instrumentation in
 realmode
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Ganesh Goudar" <ganeshgr@linux.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>, <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <20220905063811.16454-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20220905063811.16454-1-ganeshgr@linux.ibm.com>
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
Cc: mahesh@linux.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Sep 5, 2022 at 4:38 PM AEST, Ganesh Goudar wrote:
> Part of machine check error handling is done in realmode,
> As of now instrumentation is not possible for any code that
> runs in realmode.
> When MCE is injected on KASAN enabled kernel, crash is
> observed, Hence force inline or mark no instrumentation
> for functions which can run in realmode, to avoid KASAN
> instrumentation.
>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> v2: Force inline few more functions.
> ---
>  arch/powerpc/include/asm/hw_irq.h    | 8 ++++----
>  arch/powerpc/include/asm/interrupt.h | 2 +-
>  arch/powerpc/include/asm/rtas.h      | 4 ++--
>  arch/powerpc/kernel/rtas.c           | 4 ++--
>  4 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index 26ede09c521d..3264991fe524 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -111,7 +111,7 @@ static inline void __hard_RI_enable(void)
>  #ifdef CONFIG_PPC64
>  #include <asm/paca.h>
> =20
> -static inline notrace unsigned long irq_soft_mask_return(void)
> +static __always_inline notrace unsigned long irq_soft_mask_return(void)
>  {
>  	return READ_ONCE(local_paca->irq_soft_mask);
>  }
> @@ -121,7 +121,7 @@ static inline notrace unsigned long irq_soft_mask_ret=
urn(void)
>   * for the critical section and as a clobber because
>   * we changed paca->irq_soft_mask
>   */
> -static inline notrace void irq_soft_mask_set(unsigned long mask)
> +static __always_inline notrace void irq_soft_mask_set(unsigned long mask=
)
>  {
>  	/*
>  	 * The irq mask must always include the STD bit if any are set.

This doesn't give a reason why it's __always_inline, and having the
notrace attribute makes it possibly confusing. I think it would be easy
for someone to break without realising. Could you add a noinstr to these
instead / as well?

What about adding a 'realmode' function annotation that includes noinstr?

Thanks,
Nick

> @@ -144,7 +144,7 @@ static inline notrace void irq_soft_mask_set(unsigned=
 long mask)
>  	barrier();
>  }
> =20
> -static inline notrace unsigned long irq_soft_mask_set_return(unsigned lo=
ng mask)
> +static __always_inline notrace unsigned long irq_soft_mask_set_return(un=
signed long mask)
>  {
>  	unsigned long flags =3D irq_soft_mask_return();
> =20
> @@ -162,7 +162,7 @@ static inline notrace unsigned long irq_soft_mask_or_=
return(unsigned long mask)
>  	return flags;
>  }
> =20
> -static inline unsigned long arch_local_save_flags(void)
> +static __always_inline unsigned long arch_local_save_flags(void)
>  {
>  	return irq_soft_mask_return();
>  }
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/=
asm/interrupt.h
> index 8069dbc4b8d1..090895051712 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -92,7 +92,7 @@ static inline bool is_implicit_soft_masked(struct pt_re=
gs *regs)
>  	return search_kernel_soft_mask_table(regs->nip);
>  }
> =20
> -static inline void srr_regs_clobbered(void)
> +static __always_inline void srr_regs_clobbered(void)
>  {
>  	local_paca->srr_valid =3D 0;
>  	local_paca->hsrr_valid =3D 0;
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/r=
tas.h
> index 00531af17ce0..52d29d664fdf 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -201,13 +201,13 @@ inline uint32_t rtas_ext_event_company_id(struct rt=
as_ext_event_log_v6 *ext_log)
>  #define PSERIES_ELOG_SECT_ID_MCE		(('M' << 8) | 'C')
> =20
>  static
> -inline uint16_t pseries_errorlog_id(struct pseries_errorlog *sect)
> +__always_inline uint16_t pseries_errorlog_id(struct pseries_errorlog *se=
ct)
>  {
>  	return be16_to_cpu(sect->id);
>  }
> =20
>  static
> -inline uint16_t pseries_errorlog_length(struct pseries_errorlog *sect)
> +__always_inline uint16_t pseries_errorlog_length(struct pseries_errorlog=
 *sect)
>  {
>  	return be16_to_cpu(sect->length);
>  }
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 693133972294..f9d78245c0e8 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -48,7 +48,7 @@
>  /* This is here deliberately so it's only used in this file */
>  void enter_rtas(unsigned long);
> =20
> -static inline void do_enter_rtas(unsigned long args)
> +static __always_inline void do_enter_rtas(unsigned long args)
>  {
>  	unsigned long msr;
> =20
> @@ -435,7 +435,7 @@ static char *__fetch_rtas_last_error(char *altbuf)
>  #endif
> =20
> =20
> -static void
> +noinstr static void
>  va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int =
nret,
>  		      va_list list)
>  {
> --=20
> 2.37.1

