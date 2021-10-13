Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6FA42B8D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:17:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTkPQ481rz2yxL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:17:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DBeVwPHI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=DBeVwPHI; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTkNl1l29z2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 18:16:36 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id f21so1198039plb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 00:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qi2kcK7gbHZUycBDWjYwOBh1qqhZS2gpMfLgpt9Uq+g=;
 b=DBeVwPHI8FJhK4IF5VHgTTJLctjt6LXWmLThZ2yFnKb+4pyEOAe0Ui9MkqyggUzG0q
 28MfwGk11htf2S4E1fmmF13OlhLumeXU3HW0grwDrGEkj60K3HN3BkQgDptITaIdv9Uy
 kua2TuyZ53AjYkbvnu6ABjlxXEF9G7ygD+r9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qi2kcK7gbHZUycBDWjYwOBh1qqhZS2gpMfLgpt9Uq+g=;
 b=TVKSe0gQ1XmBNXGaYcJ5sH7ZuZymNIrbkKzBR1kMizsfDVKU09TI8t8kc4rK78VWzh
 4cvq/Wt9HlMDMG10R9t5+IeXnYQlYdn/qH9YA6t8u7QoOAbe6xppOJHPShIIdDlG/Wfe
 f0HaQT5vtpzGwMJIL+n5L/fAkRDW86frA+f/oGYL3hAJsiwujPu8HJfheO5yHG2pWtYm
 xi+hfDaIUXHp3ZdtAeEvpej2YUkH/eufZkU5KUfrSSrvBIxIBFvSzakp1Rbb/6XC/12r
 DPs9E08XKAGn/yfVqvqYBpIbVyjEWKNts36U3x90nJBl8+kczz/SRprVgFvZV2rCeZrl
 UdtA==
X-Gm-Message-State: AOAM532UN9RAgk7wfOlX66s5ILSJ3uKYWQY8NbAZZmv+SPFvrHQCSiNy
 gYjAnHuUXps24X/KxKO4madfEg==
X-Google-Smtp-Source: ABdhPJyAOXrKW60jwbhdhdic11/bHUj22V/uWz/NG4QXRJ4qpgyk4BVyCru7dvuvTxCLWVGzDuPokg==
X-Received: by 2002:a17:90a:8807:: with SMTP id
 s7mr11433275pjn.226.1634109393567; 
 Wed, 13 Oct 2021 00:16:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q14sm4820727pjm.17.2021.10.13.00.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:16:33 -0700 (PDT)
Date: Wed, 13 Oct 2021 00:16:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 10/10] lkdtm: Fix execute_[user]_location()
Message-ID: <202110130012.4608FFD38E@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <c551f3f4b803d1a4a184b0fa94475d405ba436d8.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c551f3f4b803d1a4a184b0fa94475d405ba436d8.1633964380.git.christophe.leroy@csgroup.eu>
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

On Mon, Oct 11, 2021 at 05:25:37PM +0200, Christophe Leroy wrote:
> execute_location() and execute_user_location() intent
> to copy do_nothing() text and execute it at a new location.
> However, at the time being it doesn't copy do_nothing() function
> but do_nothing() function descriptor which still points to the
> original text. So at the end it still executes do_nothing() at
> its original location allthough using a copied function descriptor.
> 
> So, fix that by really copying do_nothing() text and build a new
> function descriptor by copying do_nothing() function descriptor and
> updating the target address with the new location.
> 
> Also fix the displayed addresses by dereferencing do_nothing()
> function descriptor.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/misc/lkdtm/perms.c | 45 +++++++++++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index da16564e1ecd..1d03cd44c21d 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -44,19 +44,42 @@ static noinline void do_overwritten(void)
>  	return;
>  }
>  
> +static void *setup_function_descriptor(funct_descr_t *fdesc, void *dst)
> +{
> +	int err;
> +
> +	if (!__is_defined(HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR))
> +		return dst;
> +
> +	err = copy_from_kernel_nofault(fdesc, do_nothing, sizeof(*fdesc));
> +	if (err < 0)
> +		return ERR_PTR(err);
> +
> +	fdesc->addr = (unsigned long)dst;
> +	barrier();
> +
> +	return fdesc;
> +}
> +
>  static noinline void execute_location(void *dst, bool write)
>  {
> -	void (*func)(void) = dst;
> +	void (*func)(void);
> +	funct_descr_t fdesc;
> +	void *do_nothing_text = dereference_symbol_descriptor(do_nothing);
>  
> -	pr_info("attempting ok execution at %px\n", do_nothing);
> +	pr_info("attempting ok execution at %px\n", do_nothing_text);
>  	do_nothing();
>  
>  	if (write == CODE_WRITE) {
> -		memcpy(dst, do_nothing, EXEC_SIZE);
> +		memcpy(dst, do_nothing_text, EXEC_SIZE);
>  		flush_icache_range((unsigned long)dst,
>  				   (unsigned long)dst + EXEC_SIZE);
>  	}
> -	pr_info("attempting bad execution at %px\n", func);
> +	func = setup_function_descriptor(&fdesc, dst);
> +	if (IS_ERR(func))
> +		return;

I think this error case should complain with some details. :) Maybe:

	pr_err("FAIL: could not build function descriptor for %px\n", dst);

> +
> +	pr_info("attempting bad execution at %px\n", dst);

And then leave this pr_info() as it was, before the
setup_function_descriptor() call.

>  	func();
>  	pr_err("FAIL: func returned\n");
>  }
> @@ -66,16 +89,22 @@ static void execute_user_location(void *dst)
>  	int copied;
>  
>  	/* Intentionally crossing kernel/user memory boundary. */
> -	void (*func)(void) = dst;
> +	void (*func)(void);
> +	funct_descr_t fdesc;
> +	void *do_nothing_text = dereference_symbol_descriptor(do_nothing);
>  
> -	pr_info("attempting ok execution at %px\n", do_nothing);
> +	pr_info("attempting ok execution at %px\n", do_nothing_text);
>  	do_nothing();
>  
> -	copied = access_process_vm(current, (unsigned long)dst, do_nothing,
> +	copied = access_process_vm(current, (unsigned long)dst, do_nothing_text,
>  				   EXEC_SIZE, FOLL_WRITE);
>  	if (copied < EXEC_SIZE)
>  		return;
> -	pr_info("attempting bad execution at %px\n", func);
> +	func = setup_function_descriptor(&fdesc, dst);
> +	if (IS_ERR(func))
> +		return;
> +
> +	pr_info("attempting bad execution at %px\n", dst);

Same here.

>  	func();
>  	pr_err("FAIL: func returned\n");
>  }
> -- 
> 2.31.1
> 

-- 
Kees Cook
