Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F1F4B1AC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 01:56:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvwCp6NDsz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 11:56:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OJcJvg1l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=OJcJvg1l; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvwBS3P8rz2xvW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 11:54:56 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id r19so13356711pfh.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 16:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uzcyDJDNi5GmBv4U03eJWryB2XjhMP5736i1b/gjtS0=;
 b=OJcJvg1lIs62N3GjVa8/LTlfS7upa/xr+/yqej93ZLvKvNvWRieu71wpl5TeXuyvcg
 R6bQb60X5tmf18alMuGNwUqhlONmwHDA1MWkfgookl0SVxVUgxt0PFdERfjV9Qp+8wzS
 BHxJC5W6t1DrtJBHsXc1qgwdpV2s1Efulp2PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uzcyDJDNi5GmBv4U03eJWryB2XjhMP5736i1b/gjtS0=;
 b=IRX9K23NBI683PeHjtg3YnemUqMxsUgvONtYTk1NgilMo5WS5/W7zKUinKpVolqUiG
 29KvcA8T+/apUGQTg8Tjv+qT1fKY0Rpc8LRA/9vMDVrhlt4m2YW7Ru49cwkUWjUpHbyN
 QJpfwusEHkkFGXeStDeFJbJl7T5N9/zYMPV+1/JUccKkntxPaCRYRpOmX9vrDvD07x4Z
 XA4siGtm9vowXVlrnNNyA1NK17gRWu4UDD5Z1TBZwuGnLMsxHy8RRAcBQbi/ENsAMHjn
 uODi/SMq3gH0l7bomknO7b2RAZ+o3Z+ZGp8Vk5IhsdCdI4XT5K5OZ4LhifHtZDHzUrUF
 8o/g==
X-Gm-Message-State: AOAM530df33kZWD27xLUdwot12omrlhEQEeax/1QVo5HSPEDZVOCA7gH
 CytmfgNpY87QYtVEo+tZe5FpJg==
X-Google-Smtp-Source: ABdhPJy4Ogb4My/UrDG5DujzJYCV/hk5yDp0cjrcj7xH+goA5f18ojJcRJubslgwxb7Z2pArOua10A==
X-Received: by 2002:a05:6a00:178d:: with SMTP id
 s13mr9977850pfg.47.1644540893586; 
 Thu, 10 Feb 2022 16:54:53 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x23sm24719940pfh.216.2022.02.10.16.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 16:54:53 -0800 (PST)
Date: Thu, 10 Feb 2022 16:54:52 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 04/12] powerpc: Prepare func_desc_t for refactorisation
Message-ID: <202202101653.9128E58B84@keescook>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <86c393ce0a6f603f94e6d2ceca08d535f654bb23.1634457599.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86c393ce0a6f603f94e6d2ceca08d535f654bb23.1634457599.git.christophe.leroy@csgroup.eu>
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

On Sun, Oct 17, 2021 at 02:38:17PM +0200, Christophe Leroy wrote:
> In preparation of making func_desc_t generic, change the ELFv2
> version to a struct containing 'addr' element.
> 
> This allows using single helpers common to ELFv1 and ELFv2.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/module_64.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index a89da0ee25e2..b687ef88c4c4 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -33,19 +33,13 @@
>  #ifdef PPC64_ELF_ABI_v2
>  
>  /* An address is simply the address of the function. */
> -typedef unsigned long func_desc_t;
> +typedef struct {
> +	unsigned long addr;
> +} func_desc_t;
>  
>  static func_desc_t func_desc(unsigned long addr)
>  {
> -	return addr;
> -}
> -static unsigned long func_addr(unsigned long addr)
> -{
> -	return addr;
> -}
> -static unsigned long stub_func_addr(func_desc_t func)
> -{
> -	return func;
> +	return (func_desc_t){addr};

There's only 1 element in the struct, so okay, but it hurt my eyes a
little. I would have been happier with:

	return (func_desc_t){ .addr = addr; };

But of course that also looks bonkers because it starts with "return".
So no matter what I do my eyes bug out. ;)

So it's fine either way. :)

Reviewed-by: Kees Cook <keescook@chromium.org>


>  }
>  
>  /* PowerPC64 specific values for the Elf64_Sym st_other field.  */
> @@ -70,14 +64,6 @@ static func_desc_t func_desc(unsigned long addr)
>  {
>  	return *(struct func_desc *)addr;
>  }
> -static unsigned long func_addr(unsigned long addr)
> -{
> -	return func_desc(addr).addr;
> -}
> -static unsigned long stub_func_addr(func_desc_t func)
> -{
> -	return func.addr;
> -}
>  static unsigned int local_entry_offset(const Elf64_Sym *sym)
>  {
>  	return 0;
> @@ -93,6 +79,16 @@ void *dereference_module_function_descriptor(struct module *mod, void *ptr)
>  }
>  #endif
>  
> +static unsigned long func_addr(unsigned long addr)
> +{
> +	return func_desc(addr).addr;
> +}
> +
> +static unsigned long stub_func_addr(func_desc_t func)
> +{
> +	return func.addr;
> +}
> +
>  #define STUB_MAGIC 0x73747562 /* stub */
>  
>  /* Like PPC32, we need little trampolines to do > 24-bit jumps (into
> -- 
> 2.31.1
> 

-- 
Kees Cook
