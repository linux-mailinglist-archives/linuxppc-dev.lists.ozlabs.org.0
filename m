Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C02D49A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 19:58:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrmXq6gttzDqKP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 05:58:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=nVp8+U0Q; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrmVD1fkPzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 05:56:19 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id p6so1432788plr.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Dec 2020 10:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pDJdJ9jg4hC1Qi0/LCWeL6vCBADxdHWZeYcpiMBLSJc=;
 b=nVp8+U0Qroi2FT7wnDNiFbiJGQRepo6/TYrAIEWpub49d3b1Rf71FHqsD/IV1eDXAA
 vDl526q7G5TlunnyghLgc/5lsVrl47BiOypoqpedCRuFKslDZK9BLsAk2ITcKrcxhfUE
 2N6mg+W4189MzMrHgSOsirbNic+iWTEixACsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pDJdJ9jg4hC1Qi0/LCWeL6vCBADxdHWZeYcpiMBLSJc=;
 b=q2IOjYbVla/xuQRILkgMV5473+t2+S5PaaFxotfvCaooYdoc0yQWLbM7qV/uxVul98
 l8sjXG5GWrIgPvaheiB7KyCRVbvgiRdzXIcztjd7ojOKSdhjebMxqkxOwIrUGzRHMroC
 pzIIdk00LS1oA0IlYw8/bPc4AXSjQIRZoC7ZBDjk5DyLlL7gQ3iOc3VggzncHSY0mARx
 0MTKsET0V19e3XP1gIFdevZrkFId3eMpdEdKrl8c6ZOFrhS+qGB9ckNQXg5n4lq90ezj
 ozplTMiHN49bPsCZ/pcmGvo/bu6XDqGPge9m2A3Z3MiumFceoiNInnNTWeELYJz3dEoj
 awDQ==
X-Gm-Message-State: AOAM531kxjhW8WsOFOk2nfI2gw5zz7WcKkejQDf7/Apmo+hoNe+Yp0eq
 M75LH5Zh74P5O980iNvmPBV/8Q==
X-Google-Smtp-Source: ABdhPJwo9EOLqYY/MKKwWwHzNMGDiczNMJB9r3poznesxukytTaNX7puzjij+8ktvXmFygnKe8zSjg==
X-Received: by 2002:a17:90b:1294:: with SMTP id
 fw20mr3388768pjb.187.1607540176026; 
 Wed, 09 Dec 2020 10:56:16 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g85sm3347584pfb.4.2020.12.09.10.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:56:15 -0800 (PST)
Date: Wed, 9 Dec 2020 10:56:14 -0800
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the akpm tree
Message-ID: <202012091055.09D611EF31@keescook>
References: <20201204210000.660293c6@canb.auug.org.au>
 <20201208230157.42c42789@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208230157.42c42789@canb.auug.org.au>
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
Cc: Mathieu Malaterre <malat@debian.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 08, 2020 at 11:01:57PM +1100, Stephen Rothwell wrote:
> Hi Stephen,
> 
> On Fri, 4 Dec 2020 21:00:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > After merging the akpm tree, today's linux-next build (powerpc
> > allyesconfig) produced warnings like this:
> > 
> > ld: warning: orphan section `.data..Lubsan_data177' from `arch/powerpc/oprofile/op_model_pa6t.o' being placed in section `.data..Lubsan_data177'
> > 
> > (lots of these latter ones)
> 
> 781584 of them today!
> 
> > I don't know what produced these, but it is in the akpm-current or
> > akpm trees.
> 
> Presumably the result of commit
> 
>   186c3e18dba3 ("ubsan: enable for all*config builds")
> 
> from the akpm-current tree.
> 
> arch/powerpc/kernel/vmlinux.lds.S has:
> 
> #ifdef CONFIG_PPC32
>         .data : AT(ADDR(.data) - LOAD_OFFSET) {
>                 DATA_DATA
> #ifdef CONFIG_UBSAN
>                 *(.data..Lubsan_data*)
>                 *(.data..Lubsan_type*)
> #endif
>                 *(.data.rel*)
>                 *(SDATA_MAIN)
> 
> added by commit
> 
>   beba24ac5913 ("powerpc/32: Add .data..Lubsan_data*/.data..Lubsan_type* sections explicitly")
> 
> in 2018, but no equivalent for 64 bit.
> 
> I will try the following patch tomorrow:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 Dec 2020 22:58:24 +1100
> Subject: [PATCH] powerpc: Add .data..Lubsan_data*/.data..Lubsan_type* sections explicitly
> 
> Similarly to commit
> 
>   beba24ac5913 ("powerpc/32: Add .data..Lubsan_data*/.data..Lubsan_type* sections explicitly")
> 
> since CONFIG_UBSAN bits can now be enabled for all*config.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 3b4c26e94328..0318ba436f34 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -296,6 +296,10 @@ SECTIONS
>  #else
>  	.data : AT(ADDR(.data) - LOAD_OFFSET) {
>  		DATA_DATA
> +#ifdef CONFIG_UBSAN
> +		*(.data..Lubsan_data*)
> +		*(.data..Lubsan_type*)
> +#endif
>  		*(.data.rel*)
>  		*(.toc1)
>  		*(.branch_lt)
> -- 
> 2.29.2
> 
> -- 
> Cheers,
> Stephen Rothwell

Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks for figuring this one out. :) Andrew, can you add this to your
ubsan patch stack, or do you want me to resend it to you directly?


-- 
Kees Cook
