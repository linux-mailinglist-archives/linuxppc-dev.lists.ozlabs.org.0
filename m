Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C2D5E9E07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 11:40:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbd6D3w5qz3bY8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 19:40:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IJ12TCHU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IJ12TCHU;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbd5X1sMgz2xh0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 19:39:57 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id y136so6130595pfb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 02:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=gwPHAvmff8jl0JkdHTf6vq6MiHlRcuQH3vGez7t8dZM=;
        b=IJ12TCHUauOU8EgHW636dFzoLDug1TkLCw6EBMnLmGhl+6cHJUXPVA5Y5kj4D9ui3o
         u53twX8x3+AzQEHb+LaEtrtEVQpSFFioQAu52L4A+PtAaGXtEzddFcgboI6nfpQK+XHH
         CZwo02K6tHbWFxzLyYNHrjH5WkM9G82LgnD36m6I/R9vWA1UyUw+w8fKjWXFacjke28c
         RWtBH3CETIuAEsAu044XMHoB7Z2fbWDmYnES8O8pe/nMPw8Z2Mm1Ndn891/hCTPnlND2
         1zoljpDEx9xOTDUZ2ltb+fdB+1JltWrTdfPRh7e+MTMXmq4Wu96M0K0Sa8XaQPES1SvR
         DKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=gwPHAvmff8jl0JkdHTf6vq6MiHlRcuQH3vGez7t8dZM=;
        b=wp0WgjSRlGfaDj6bGrbnSwfAwDx2y+oqGoAoiE4ZSOnfYr64oW019r/AGmDcX+BocC
         Kt2Xpnq63sqxopnIuQ9avMNoIpXj5OMC9eB998/HCwHGZWihXzMTQ79lMSD9i47C0hJu
         JM2h9TV9KoAtZQAcJd+k6jZBPnqBGymVEfnsx9yjDoEmzbUdRLjdlKRVGHyThLwkaAkg
         fxfWtrb/iXrudHYMYpTVc6Y+6C9sDrw7PMMAGlLBoCuQ99paa++TRGWVWa2v1r6xJxFc
         P7ql8mV8QVZ3Ryhaf2urvRT+BxqEZuYBGzqR6ckndtyjbMHzodw+qTfjJHHV/in8jFZ2
         kZFg==
X-Gm-Message-State: ACrzQf2y+ct1beeQW2t80K4/PTOo98apkGR5f0AMA+oAv+yeJP5Zrw7V
	7o8Xp1Ei7h3wbMo3kssgns/n2ypfHS0=
X-Google-Smtp-Source: AMsMyM45kk29VWUzcODJMMM4WaWd93vh7RoZWv3S6A12b1d175PYov0QkphGyAT7RtmrQDO42F9MEQ==
X-Received: by 2002:a63:834a:0:b0:43c:c924:5f1e with SMTP id h71-20020a63834a000000b0043cc9245f1emr1043819pge.233.1664185193542;
        Mon, 26 Sep 2022 02:39:53 -0700 (PDT)
Received: from localhost (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id e1-20020aa798c1000000b00537b1aa9191sm11939487pfm.178.2022.09.26.02.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:39:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Sep 2022 19:39:47 +1000
Message-Id: <CN68EWU3FDSW.16P7YKEX5KT4N@bobo>
Subject: Re: [PATCH v3] powerpc/pseries/mce: Avoid instrumentation in
 realmode
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Ganesh Goudar" <ganeshgr@linux.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>, <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <20220926061827.95102-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20220926061827.95102-1-ganeshgr@linux.ibm.com>
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

On Mon Sep 26, 2022 at 4:18 PM AEST, Ganesh Goudar wrote:
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
>
> v3: Adding noinstr to few functions instead of __always_inline.

I would still like to consider doing a realmode annotation, but
as a minimal fix for the next merge window I suppose this is okay.
There's still no indication for why the annotation exists on the
functions which is a bit annoying, maybe not fundamentally worse
than notrace was, but the scope of reasons why it's there gets
bigger.


> ---
>  arch/powerpc/include/asm/hw_irq.h    | 8 ++++----
>  arch/powerpc/include/asm/interrupt.h | 2 +-
>  arch/powerpc/include/asm/rtas.h      | 4 ++--
>  arch/powerpc/kernel/rtas.c           | 4 ++--
>  4 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index 983551859891..c4d542b4a623 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -111,7 +111,7 @@ static inline void __hard_RI_enable(void)
>  #ifdef CONFIG_PPC64
>  #include <asm/paca.h>
> =20
> -static inline notrace unsigned long irq_soft_mask_return(void)
> +noinstr static unsigned long irq_soft_mask_return(void)
>  {
>  	unsigned long flags;

Don't uninline the ones in headers.

> @@ -128,7 +128,7 @@ static inline notrace unsigned long irq_soft_mask_ret=
urn(void)
>   * for the critical section and as a clobber because
>   * we changed paca->irq_soft_mask
>   */
> -static inline notrace void irq_soft_mask_set(unsigned long mask)
> +noinstr static void irq_soft_mask_set(unsigned long mask)
>  {
>  	/*
>  	 * The irq mask must always include the STD bit if any are set.
> @@ -155,7 +155,7 @@ static inline notrace void irq_soft_mask_set(unsigned=
 long mask)
>  		: "memory");
>  }
> =20
> -static inline notrace unsigned long irq_soft_mask_set_return(unsigned lo=
ng mask)
> +noinstr static unsigned long irq_soft_mask_set_return(unsigned long mask=
)
>  {
>  	unsigned long flags;
> =20
> @@ -191,7 +191,7 @@ static inline notrace unsigned long irq_soft_mask_or_=
return(unsigned long mask)
>  	return flags;
>  }
> =20
> -static inline unsigned long arch_local_save_flags(void)
> +static __always_inline unsigned long arch_local_save_flags(void)
>  {
>  	return irq_soft_mask_return();
>  }

Can we instead add noinstr to this too, the the other ones that were
changed to always inline?

Thanks,
Nick

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

