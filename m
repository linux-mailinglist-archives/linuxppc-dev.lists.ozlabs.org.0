Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 820234B1ACD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 01:57:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvwFR1Bzjz3cDy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 11:57:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M5RXsM8h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=M5RXsM8h; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvwDq1bRsz2xvW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 11:56:58 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso3012366pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 16:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ij/kmXjVco913jFIkkr0+ao7hUYo8HGlc/rK4hm1cYU=;
 b=M5RXsM8hcmF2OyubtKqmtKo9RQPAPFPtvpfZEQCB2c6Yh3rjKFo51PskthrNNxXsr7
 zbR6px5umZ8O8jrv0grWJWpisBdpRGU+wZ/a6x9Q+B7hMAGf18yBfGQq4BkRaDUVXnWe
 yd1fF+V2U67gyXSd8Lol6Adn51X6EmhwjU59k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ij/kmXjVco913jFIkkr0+ao7hUYo8HGlc/rK4hm1cYU=;
 b=aA0a1fA47DeEPZkWQ5BhCKarVNqSbcPDjolmMTTOwLHjYG1u0i+Jz7Bhz7K6lcmQC5
 uIjNipxk19EEHDCyUF1bW5smBCjC4WpKPdPzXqid2cl9GhW/w7sPgYYZLX+uKCg+sjjR
 DPfMla8YJym5vGRzSM8grUk+Zp9AZmY62v7UVA9w+jAdPiQW1q3u3ZtwJvWpRspsKQqD
 leZ7D7IEtjCU55YrXL4a5uqnGrlMMTunw72+R8uyhIGRDKhCadVqDpDHSGlq6hI3yGKs
 XxTs5SHoeOCxcutB+gx88daw3eXgwJFYkqDHVByai+8Lg4WGiZtTSNKRrLb5M32nPmwr
 6hlw==
X-Gm-Message-State: AOAM530xbpJ5g4p6+XgzdM5sLVk1nOa9PnSFqbAI0jKKgoKOgrySgEal
 WS4gP1YdWjC2k//MCfwioYGWXQ==
X-Google-Smtp-Source: ABdhPJxO7mzzG+kyJMfp7NkXFdu5xyqbCDL1T1A1JqI341m3kYcbAuWEHEe++omXhqTKNFgkrZ2BTQ==
X-Received: by 2002:a17:902:cf02:: with SMTP id
 i2mr9960280plg.146.1644541016958; 
 Thu, 10 Feb 2022 16:56:56 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a14sm1718704pgw.27.2022.02.10.16.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 16:56:56 -0800 (PST)
Date: Thu, 10 Feb 2022 16:56:55 -0800
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 08/12] asm-generic: Refactor
 dereference_[kernel]_function_descriptor()
Message-ID: <202202101655.13C794F0F@keescook>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <93a2006a5d90292baf69cb1c34af5785da53efde.1634457599.git.christophe.leroy@csgroup.eu>
 <8735kr814c.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735kr814c.fsf@mpe.ellerman.id.au>
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
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 10, 2022 at 09:30:43PM +1100, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > diff --git a/kernel/extable.c b/kernel/extable.c
> > index b0ea5eb0c3b4..1ef13789bea9 100644
> > --- a/kernel/extable.c
> > +++ b/kernel/extable.c
> > @@ -159,12 +160,32 @@ int kernel_text_address(unsigned long addr)
> >  }
> >  
> >  /*
> > - * On some architectures (PPC64, IA64) function pointers
> > + * On some architectures (PPC64, IA64, PARISC) function pointers
> >   * are actually only tokens to some data that then holds the
> >   * real function address. As a result, to find if a function
> >   * pointer is part of the kernel text, we need to do some
> >   * special dereferencing first.
> >   */
> > +#ifdef CONFIG_HAVE_FUNCTION_DESCRIPTORS
> > +void *dereference_function_descriptor(void *ptr)
> > +{
> > +	func_desc_t *desc = ptr;
> > +	void *p;
> > +
> > +	if (!get_kernel_nofault(p, (void *)&desc->addr))
> > +		ptr = p;
> > +	return ptr;
> > +}
> 
> This needs an EXPORT_SYMBOL_GPL(), otherwise the build breaks after
> patch 10 with CONFIG_LKDTM=m.

Oh good catch!

(There have been a few cases of LKDTM=m being the only thing needed a
symbol, so I've pondered giving it a namespace or constructing a little
ifdef wrapper... but this seems ok to export...)

-- 
Kees Cook
