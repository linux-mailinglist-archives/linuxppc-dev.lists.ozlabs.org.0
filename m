Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC7DD2ED5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 18:48:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pxqc3pvqzDqQk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 03:48:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="jCH7hVEz";
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pxnG5txszDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 03:46:40 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id 205so4279693pfw.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 09:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ucc2HcE1KFej2LH6JBkm0K2H0dlib4/rpE4E9DkdWnQ=;
 b=jCH7hVEz9DolIZ1tWTZ2WBzCCWqtC/N1Zw7aqh/YsT1JbgkR+jdLg1c8HFybVnrnDt
 zDT8Pac3++Knf0BDJnT4AHK6EvCPW0ovTGp9VFWoRwYqDitcprYMafhTNkb/D4GuI+mu
 p5DqysPLL8vgpaaxV3VItm4rQa6UKBD0JpAMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ucc2HcE1KFej2LH6JBkm0K2H0dlib4/rpE4E9DkdWnQ=;
 b=qa95JCyreczQm/EMq/ptYb2lZm18fxdyDFTq6LO+SyEzaQVNQW2aIxOhaprxasjqgq
 B4zLBtCF4Rnfx9NhEuvpDm9poQVYWnx9gxOmLctZGZt8rm68jTjYWwXpDLMBKIzVdjUP
 6+eWIAEb1+7hS4mUZ8P6fO0aDSDK8BanK0YRsYb0miWaDuxW4MvGniJF5ext+NaKqSih
 233j5+o0bp9l3rs8+hZn1+tSEj9Dpj8dRPpiSFrf/znJDokofAVa67i5PzflNb1FtagT
 a03YAImwiIwI05ETWKw14KGfuVuSDzeboPB1IJZQtR+s8k0Sfh8/KFKXP9H6n2+CszZk
 CZKg==
X-Gm-Message-State: APjAAAUrOwvfecjYZcqVQUDQqtk1zkwXRJGGLF033fS5Ax6DJPXWzmGF
 UG7glvhHUVVuIxgJe/eInRjk2g==
X-Google-Smtp-Source: APXvYqz81XDUB+KawYO30nxn2eoCx5FdYR8TngYKUPz81EWriv3MgYEwn6iW+aXgb9GpyhSssUlr1A==
X-Received: by 2002:a63:e1f:: with SMTP id d31mr11802284pgl.379.1570725998193; 
 Thu, 10 Oct 2019 09:46:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k5sm4896915pgo.45.2019.10.10.09.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 09:46:37 -0700 (PDT)
Date: Thu, 10 Oct 2019 09:46:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 07/29] x86: Restore "text" Program Header with dummy
 section
Message-ID: <201910100944.92CFB97157@keescook>
References: <20190926175602.33098-1-keescook@chromium.org>
 <20190926175602.33098-8-keescook@chromium.org>
 <20191010103305.GD7658@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010103305.GD7658@zn.tnic>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 10, 2019 at 12:33:05PM +0200, Borislav Petkov wrote:
> On Thu, Sep 26, 2019 at 10:55:40AM -0700, Kees Cook wrote:
> > Instead of depending on markings in the section following NOTES to
> > restore the associated Program Header, use a dummy section, as done
> > in other architectures.
> 
> This is very laconic and after some staring at ld.info, I think you mean
> this:
> 
> "   If you place a section in one or more segments using ':PHDR', then
> the linker will place all subsequent allocatable sections which do not
> specify ':PHDR' in the same segments."
> 
> but I could be way off. Yes, no?
> 
> IOW, please write in the commit messages first what the problem is
> you're addressing.

Yeah, that's much improved. I really struggled to describe this, given
how weird the linker script logic is here.

> > --- a/arch/x86/kernel/vmlinux.lds.S
> > +++ b/arch/x86/kernel/vmlinux.lds.S
> > @@ -147,8 +147,9 @@ SECTIONS
> >  	} :text = 0x9090
> >  
> >  	NOTES :text :note
> > +	.dummy : { *(.dummy) } :text
> >  
> > -	EXCEPTION_TABLE(16) :text = 0x9090
> > +	EXCEPTION_TABLE(16)
> 
> This is killing the filler byte but I have a suspicion that'll change
> eventually to INT3... :)

Yes, though since the exception table isn't executable, filling with
0x90 has no meaning, and I think when I looked at the alignment there
were actually no fill bytes from here on. But it doesn't matter; it all
goes away in the end.

-- 
Kees Cook
