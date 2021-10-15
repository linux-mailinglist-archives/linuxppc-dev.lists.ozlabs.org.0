Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9215242FD73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 23:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWKH41D2Fz3cG2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 08:32:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JeYYnn82;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=JeYYnn82; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWKGM6CVrz301P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 08:31:37 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id t184so8577281pfd.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 14:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kKloKGIwGWmZY9+Er8BC6aPtcIV5M1fZmtHmnCWa8iU=;
 b=JeYYnn823k8n2zSxtjokkfqoZ5ilS26HSi3+OKWmuzF1ap1aszmc7JLPZWsF4HCG0w
 31EKzOJ0R9W8h1AKhQ/AK6BIP9nPFEBX8Fhn+ihNhFPlklATnjeMva6cxWbMA+SX6L+t
 CU/dKvCcEPU/V6JRuGbgX3x4m1PI5C82Th35I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kKloKGIwGWmZY9+Er8BC6aPtcIV5M1fZmtHmnCWa8iU=;
 b=frhsHaFk801QDFhOFCcb7J430HZnrgT8iyiHObm1ntfX6GqoMcMJjB8v1AsP5jnsvx
 5iZKM18M3aUINlx7K2L1nv4E8jKkK5nzCFICUDKyEf1aHFLLVH9DlpLPLvsUSYSlOqkR
 lQs9x4Gf0RdRiHEGUePKeCMwNOxlZQuWIXJatSGK4KwqsD0J7/xb6p+v5V5O/FeFI0oU
 PvllF2hNygto4bNjQH/BLqt8py/DrbTgn3v+kvYHA8sfm84CQ+3Yvg5rFTwrZhVkdyWZ
 ykikaJoIQ9OYOl/8xi4SXhEeaQ6bQ2l9KDRlXemGZJxvccKGNTvV3L0cl8AOgYUjjjA6
 xpdQ==
X-Gm-Message-State: AOAM5318NQHhW3+y+krYLz7e1YoWtBHnXlGW4cejChsqLAQ2XGwrN99/
 oUOkoMYzu7PqFy+W4Tp6BSSgEA==
X-Google-Smtp-Source: ABdhPJwdYjbf9GZPBypn6MBgVe8w8NzMTcIJZgnbet0In82Ohn0MIUwTdtq337oO2srKIC8IRC508w==
X-Received: by 2002:a05:6a00:992:b0:44d:8981:37f6 with SMTP id
 u18-20020a056a00099200b0044d898137f6mr9473913pfg.76.1634333495151; 
 Fri, 15 Oct 2021 14:31:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id gf23sm6006874pjb.26.2021.10.15.14.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 14:31:34 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:31:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 12/13] lkdtm: Fix execute_[user]_location()
Message-ID: <202110151428.187B1CF@keescook>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <cbee30c66890994e116a8eae8094fa8c5336f90a.1634190022.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbee30c66890994e116a8eae8094fa8c5336f90a.1634190022.git.christophe.leroy@csgroup.eu>
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

On Thu, Oct 14, 2021 at 07:50:01AM +0200, Christophe Leroy wrote:
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
>  drivers/misc/lkdtm/perms.c     | 25 +++++++++++++++++++++----
>  include/asm-generic/sections.h |  5 +++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 5266dc28df6e..96b3ebfcb8ed 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -44,19 +44,32 @@ static noinline void do_overwritten(void)
>  	return;
>  }
>  
> +static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
> +{
> +	memcpy(fdesc, do_nothing, sizeof(*fdesc));
> +	fdesc->addr = (unsigned long)dst;
> +	barrier();
> +
> +	return fdesc;
> +}

How about collapsing the "have_function_descriptors()" check into
setup_function_descriptor()?

static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
{
	if (__is_defined(HAVE_FUNCTION_DESCRIPTORS)) {
		memcpy(fdesc, do_nothing, sizeof(*fdesc));
		fdesc->addr = (unsigned long)dst;
		barrier();
		return fdesc;
	} else {
		return dst;
	}
}

> +
>  static noinline void execute_location(void *dst, bool write)
>  {
>  	void (*func)(void) = dst;
> +	func_desc_t fdesc;
> +	void *do_nothing_text = dereference_function_descriptor(do_nothing);
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
>  	pr_info("attempting bad execution at %px\n", func);
> +	if (have_function_descriptors())
> +		func = setup_function_descriptor(&fdesc, dst);
>  	func();
>  	pr_err("FAIL: func returned\n");
>  }
> @@ -67,15 +80,19 @@ static void execute_user_location(void *dst)
>  
>  	/* Intentionally crossing kernel/user memory boundary. */
>  	void (*func)(void) = dst;
> +	func_desc_t fdesc;
> +	void *do_nothing_text = dereference_function_descriptor(do_nothing);
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
>  	pr_info("attempting bad execution at %px\n", func);
> +	if (have_function_descriptors())
> +		func = setup_function_descriptor(&fdesc, dst);
>  	func();
>  	pr_err("FAIL: func returned\n");
>  }


> diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
> index 76163883c6ff..d225318538bd 100644
> --- a/include/asm-generic/sections.h
> +++ b/include/asm-generic/sections.h
> @@ -70,6 +70,11 @@ typedef struct {
>  } func_desc_t;
>  #endif
>  
> +static inline bool have_function_descriptors(void)
> +{
> +	return __is_defined(HAVE_FUNCTION_DESCRIPTORS);
> +}
> +
>  /* random extra sections (if any).  Override
>   * in asm/sections.h */
>  #ifndef arch_is_kernel_text

This hunk seems like it should live in a separate patch.

-- 
Kees Cook
