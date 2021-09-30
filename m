Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4212641D317
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 08:13:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKjbb14Dgz2yxT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 16:13:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=YrCFVIOH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=YrCFVIOH; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKjZv4Ktbz2yn1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 16:12:37 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 om12-20020a17090b3a8c00b0019eff43daf5so3946084pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 23:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=eL9IL0AbEn2/LZHJKGv2qtw10hAX+B2bRvSWPncsnBs=;
 b=YrCFVIOHjtuDWbOZEmtYC4Pv4n3eaYRJTtFxke2JUeWnawSIQ0qzxhQD+GOhVb8kan
 DMjndI+Nn+zkM5gHjeJ6uClogkpHG6Whw68/12yMlOvwfWW9mnArZxH7F4iWJkPTMQAj
 hMgiaUZiS++S15Wxoiot1IHAVYK2HH49BTQgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=eL9IL0AbEn2/LZHJKGv2qtw10hAX+B2bRvSWPncsnBs=;
 b=2VtGuWMurKDsdMzDx7ADU5WBQtEGm+IIRjUTOYq8+hHL1z8zHz9lojKGTvh3H0VYVS
 CLDWWF17ErBdXoHn1/uJi65/OIFThT595U8nq6zTHfpFkGiWREWKNGfpubvii838FHFZ
 eGaoxKjyWvyLdCY1D43ZTlKqa9bgTUinyr2dhWdx9QhPkOqsEsTxJgRpJGPaSM5rael7
 vFUU+6jFaQO2NElT8EToSPoXfGJxjP5R1sX+ODJBBnu6/lmQy8w4UV20N3qkIEDXVLmL
 IEBQRMVy5/xSuYLrfkJLGawl3bprfenZL/6iDxeWmVhcqWNehbKuDmPhO4C+qC6ipD6P
 3vrA==
X-Gm-Message-State: AOAM530dJ1wUSEKR8axZ6EBmgLIlfI2ZP3+a9qBkjzWsvf0GPE07AIUw
 sZw3ZhXmrKBLMiJFXVeGx6DFPg==
X-Google-Smtp-Source: ABdhPJxcv3d1gIloewA1h+os6v1bwFa6MPtlLIYQb/jc4EjwEUFEUElrEnqa6ck3xEFtSA6dyFk3qg==
X-Received: by 2002:a17:902:ba8d:b0:13d:cb44:369c with SMTP id
 k13-20020a170902ba8d00b0013dcb44369cmr2476664pls.40.1632982352759; 
 Wed, 29 Sep 2021 23:12:32 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:7dea:cb77:bac7:65dc])
 by smtp.gmail.com with ESMTPSA id g3sm1486486pgj.66.2021.09.29.23.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 23:12:32 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Use GLOBAL_TOC for
 kvmppc_h_set_dabr/xdabr()
In-Reply-To: <20210923151031.72408-1-mpe@ellerman.id.au>
References: <20210923151031.72408-1-mpe@ellerman.id.au>
Date: Thu, 30 Sep 2021 16:12:29 +1000
Message-ID: <87bl4a6182.fsf@dja-thinkpad.axtens.net>
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
Cc: mikey@neuling.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

> kvmppc_h_set_dabr(), and kvmppc_h_set_xdabr() which jumps into
> it, need to use _GLOBAL_TOC to setup the kernel TOC pointer, because
> kvmppc_h_set_dabr() uses LOAD_REG_ADDR() to load dawr_force_enable.

This makes sense. LOAD_REG_ADDR() does ld reg,name@got(r2) and
_GLOBAL_TOC sets r2 based on r12 and .TOC. .

Looking at
e.g. https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1610846.html
it seems that we use GOT and TOC largely interchangeably... so assuming
I haven't completely misunderstood, the change this patch makes seems to
make sense to me. :)

> When called from hcall_try_real_mode() we have the kernel TOC in r2,
> established near the start of kvmppc_interrupt_hv(), so there is no
> issue.
>
> But they can also be called from kvmppc_pseries_do_hcall() which is
> module code, so the access ends up happening with the kvm-hv module's
> r2, which will not point at dawr_force_enable and could even cause a
> fault.

I checked and there isn't anywhere else the functions are called, so
this will now cover everything.

> With the current code layout and compilers we haven't observed a fault
> in practice, the load hits somewhere in kvm-hv.ko and silently returns
> some bogus value.
>
> Note that we we expect p8/p9 guests to use the DAWR, but SLOF uses
> h_set_dabr() to test if sc1 works correctly, see SLOF's
> lib/libhvcall/brokensc1.c.

I assume that something (the module loader?) patches the callsite to
restore r2 after the function call? I imagine something must otherwise
things would fall apart pretty quickly...

> Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")

That patch seems to only affect the DA_W_R not the DA_B_R - how does it
cause this bug?

All in all this looks good to me:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index 90484425a1e6..30a8a07cff18 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -1999,7 +1999,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
>  	.globl	hcall_real_table_end
>  hcall_real_table_end:
>  
> -_GLOBAL(kvmppc_h_set_xdabr)
> +_GLOBAL_TOC(kvmppc_h_set_xdabr)
>  EXPORT_SYMBOL_GPL(kvmppc_h_set_xdabr)
>  	andi.	r0, r5, DABRX_USER | DABRX_KERNEL
>  	beq	6f
> @@ -2009,7 +2009,7 @@ EXPORT_SYMBOL_GPL(kvmppc_h_set_xdabr)
>  6:	li	r3, H_PARAMETER
>  	blr
>  
> -_GLOBAL(kvmppc_h_set_dabr)
> +_GLOBAL_TOC(kvmppc_h_set_dabr)
>  EXPORT_SYMBOL_GPL(kvmppc_h_set_dabr)
>  	li	r5, DABRX_USER | DABRX_KERNEL
>  3:
> -- 
> 2.25.1
