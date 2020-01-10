Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00692136675
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 06:14:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vB4G0Vw2zDqVs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 16:14:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=dqJTwC9n; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vB2V5PNDzDq6y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 16:13:03 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id ay11so395625plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2020 21:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tmf+Kxucvb62NiCjSTWMZBNjJ8UNF1K5QBIAcifMgQI=;
 b=dqJTwC9nF+cQfR6H5U3TZiI9pnBoPZjL1vGQJveXhqrGGKv+0e0PiUtmGFRLEVIi9H
 PSrgKfip+Q8V76oK2lCMuGJnruqiAcJBDkHaKQgBPMN7yNGnReo2sKZldcep+jgXgpm4
 1X4p7ZaUv18Ed3P6kabJ4llMEdx8+fvGPmLjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tmf+Kxucvb62NiCjSTWMZBNjJ8UNF1K5QBIAcifMgQI=;
 b=jljB6MdcdxTr86MA2xEnX3HuqRm4IaGHiZkj1/zepD31+XTukHEWh8IXwYtCeHNz0k
 RAi/L4DLuTAn1pnlEVZgfbV6oXUe/18SX2c1eqctyDlSzZxR77lJv+4iBc57VEUhDn3w
 C4qVpx7NyhMYJGWgdLcgfZlp53v6W6vuEXCaWcpznWFF9H1HDPlfV2zvxztmUsBhm8rX
 KwIADGLKN0O4Ru0QU5S3X7bXyoVqUrdVXaftbr9ubn+8NSzDjPARJakff16ElQAgi85Q
 iPBPHguKsdz1rs3XpNu/kMcJ3aPyYtnQJkNYNAzuivmhD2RJiwCOpYs96ma7ODFtq6+f
 zL1A==
X-Gm-Message-State: APjAAAXaFaPPXzxT+EjeRHA1kvsGfNFItTfCglXyNQrOKaVV+NSCS30m
 0beS9QsuxCmfI6ljhSxLo2GxVA==
X-Google-Smtp-Source: APXvYqya22I94aB51t/b5586U5xsAVsE1JwObmcgOBjtPfTa0YzbMamXcKH1ztnT77pUjbQTqlTx0Q==
X-Received: by 2002:a17:90b:8b:: with SMTP id
 bb11mr2367447pjb.27.1578633181385; 
 Thu, 09 Jan 2020 21:13:01 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g19sm847886pfh.134.2020.01.09.21.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 21:13:00 -0800 (PST)
Date: Thu, 9 Jan 2020 21:12:59 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] init: fix misleading "This architecture does not have
 kernel memory protection" message
Message-ID: <202001092112.14F20C4DCE@keescook>
References: <62477e446d9685459d4f27d193af6ff1bd69d55f.1578557581.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62477e446d9685459d4f27d193af6ff1bd69d55f.1578557581.git.christophe.leroy@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 09, 2020 at 08:15:01AM +0000, Christophe Leroy wrote:
> This message leads to think that memory protection is not implemented
> for the said architecture, whereas absence of CONFIG_STRICT_KERNEL_RWX
> only means that memory protection has not been selected at
> compile time.
> 
> Don't print this message when CONFIG_ARCH_HAS_STRICT_KERNEL_RWX is
> selected by the architecture. Instead, print "Kernel memory protection
> not selected by kernel config."
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Oh, yes, I like this. Should the message include a hint to the config
name?

Regardless:

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  init/main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/init/main.c b/init/main.c
> index 2cd736059416..fd31b15cc910 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1090,6 +1090,11 @@ static void mark_readonly(void)
>  	} else
>  		pr_info("Kernel memory protection disabled.\n");
>  }
> +#elif defined(CONFIG_ARCH_HAS_STRICT_KERNEL_RWX)
> +static inline void mark_readonly(void)
> +{
> +	pr_warn("Kernel memory protection not selected by kernel config.\n");
> +}
>  #else
>  static inline void mark_readonly(void)
>  {
> -- 
> 2.13.3
> 

-- 
Kees Cook
