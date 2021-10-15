Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82742FD7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 23:33:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWKJc1Tj8z3cJv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 08:33:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f8kTQ/Y/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=f8kTQ/Y/; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWKHx5DVYz2xt6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 08:33:01 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 75so9730705pga.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 14:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YNBNEYisZ+541asH+L6t1hZlJ/Xn9d3ughoW3yhbnMY=;
 b=f8kTQ/Y/ACr3yL4eMWtqbWU2xm18S+76EHKyee4Vqqv4SV8J6qk5BuskJbEb6Ql/TJ
 c9EbbOivEp4/Vy74Zv5n8MvM1vLyBEeJPN8m+5olTn2ub0SZO8xZlaRygBBGEjyk6s6j
 dW6pUEjVARu6NrsLidMTQLR5wt2C5k6t+XvQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YNBNEYisZ+541asH+L6t1hZlJ/Xn9d3ughoW3yhbnMY=;
 b=OeZMkWR5uFQN9HNdUAVJ3Ab7n7Nqfc8UJFtD6aoaM/khMgxmjQyYPGOikt0dIFq+T1
 wtabYsYfod4YqkccGfI/W3bOkdY4i3sex6h1lWK6KqrNNdrlZaDAIxlrKQ+jsYSC/y6S
 wrvXB9YPjo6MG/euqwJprBRgnK3wuXL+CXHa4B+eQV6kfH0K57xhshYOc4wDdZ/Ah8he
 PAH1VOusc6FgyecLfdJQOV8e6UDiFmk9F8tDHdt0O9ZLVapshOXpOtYz8ggLL5JbgvvB
 aeRyOkbpLplVLy93vprP3bbnNgWk2CHlQhg56B324y7dVCzfHAcLh19VdaIJpnXan3Zh
 j1jw==
X-Gm-Message-State: AOAM533Ntq0Z1oSMu68y4pRH9n+UHOTx1+UXolAgBD2P9Hn5hFDgZq4W
 JYSQnZbMIemFkpK8XFumRm6Lcg==
X-Google-Smtp-Source: ABdhPJzAyN+K8Hifn5n3pJa0D9tsRyoaRMolZRmu5TyHtvN6ydh9MAL1iJXdAj5PTEgi34yjsZ8kvg==
X-Received: by 2002:a63:ef58:: with SMTP id c24mr10773001pgk.299.1634333579455; 
 Fri, 15 Oct 2021 14:32:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t126sm5787900pfc.80.2021.10.15.14.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 14:32:59 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:32:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 11/13] lkdtm: Fix lkdtm_EXEC_RODATA()
Message-ID: <202110151432.D8203C19@keescook>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <44946ed0340013a52f8acdee7d6d0781f145cd6b.1634190022.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44946ed0340013a52f8acdee7d6d0781f145cd6b.1634190022.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 14, 2021 at 07:50:00AM +0200, Christophe Leroy wrote:
> Behind its location, lkdtm_EXEC_RODATA() executes
> lkdtm_rodata_do_nothing() which is a real function,
> not a copy of do_nothing().
> 
> So executes it directly instead of using execute_location().
> 
> This is necessary because following patch will fix execute_location()
> to use a copy of the function descriptor of do_nothing() and
> function descriptor of lkdtm_rodata_do_nothing() might be different.
> 
> And fix displayed addresses by dereferencing the function descriptors.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I still don't understand this -- it doesn't look needed at all given the
changes in patch 12. (i.e. everything is using
dereference_function_descriptor() now)

Can't this patch be dropped?

-Kees

> ---
>  drivers/misc/lkdtm/perms.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 035fcca441f0..5266dc28df6e 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -153,7 +153,14 @@ void lkdtm_EXEC_VMALLOC(void)
>  
>  void lkdtm_EXEC_RODATA(void)
>  {
> -	execute_location(lkdtm_rodata_do_nothing, CODE_AS_IS);
> +	pr_info("attempting ok execution at %px\n",
> +		dereference_function_descriptor(do_nothing));
> +	do_nothing();
> +
> +	pr_info("attempting bad execution at %px\n",
> +		dereference_function_descriptor(lkdtm_rodata_do_nothing));
> +	lkdtm_rodata_do_nothing();
> +	pr_err("FAIL: func returned\n");
>  }
>  
>  void lkdtm_EXEC_USERSPACE(void)
> -- 
> 2.31.1
> 

-- 
Kees Cook
