Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED484272F4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 23:17:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HR1Gm1vpQz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 08:17:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XwEeTQEj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=XwEeTQEj; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HR1G245wlz2yM7
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 08:16:24 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id m21so4246041pgu.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Oct 2021 14:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FFhUuMyEWSiHssipR32HBHlOkuAhbMJqyLCYePgaltI=;
 b=XwEeTQEj9C25q3Be6AxZgpwU/xpv7M3dk2CGBP2/4hLXFHJRnOOm/VEYTLRRkjg2VP
 HrMKjukQ1pTEDTLo0POdJQhKKHuGGUPlxVye2ghkzk8TVph1VY/AcZeop9mAcspFeuiP
 WXj6pxbkQkM3z+2L1xT3bzl9wCfFhl6qpsJAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FFhUuMyEWSiHssipR32HBHlOkuAhbMJqyLCYePgaltI=;
 b=KrwdKDI955etjFMaaUkyWAcrSXJbKJuHNQj+n6qD75Q8Rli+vF9UQiMRv7cOXuw4NO
 lZwBCnr6FnfaPdwFCsV9RJ8+XIDrhZs8yPVdmGfoO38cB6sAcxpWY1s+OFaGQsuELwM8
 Y+0ukg8d30YS2qJ8tHW1AuHRhpsB1nOjPo8R7TbufEtrtkJppDb5eB3rgMsSCC3lP0i3
 wmNYlKNx9wU3toD7GRaxF4OKR6JQpV1isT8Jx1Q+NZSBs3pRuU+PwH0UQVonAEYKZk2s
 4OzQyoduqfcNaTRR5YebcUkPBeIebJ8O0g5g9g3482oU1yPO7pkH3I4AaJ7CcGsFtey1
 iD2w==
X-Gm-Message-State: AOAM532PqFLNpK8wHactbW3rL5XQWxPgzzPCVz/9KfRdsAFw3SoKlJIK
 dTMC/wApbA1jWWRwxp/o14U0DA==
X-Google-Smtp-Source: ABdhPJy8fSvRAxviOIXMJWotcF0SS+LrTBEyTOzBnHu49xQwq1LFTd3RfNNEPl87TJRFTU/0RrUVMQ==
X-Received: by 2002:a63:724b:: with SMTP id c11mr6572687pgn.9.1633727780506;
 Fri, 08 Oct 2021 14:16:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t28sm223137pfq.158.2021.10.08.14.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:16:20 -0700 (PDT)
Date: Fri, 8 Oct 2021 14:16:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] lkdtm: Fix content of section containing
 lkdtm_rodata_do_nothing()
Message-ID: <202110081415.E36B67FA@keescook>
References: <8900731fbc05fb8b0de18af7133a8fc07c3c53a1.1633712176.git.christophe.leroy@csgroup.eu>
 <CAKwvOdnWbKdBuSGtmu2DURy5dtVGUYWJ_mwxSL6N5OfbmjU3EA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnWbKdBuSGtmu2DURy5dtVGUYWJ_mwxSL6N5OfbmjU3EA@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 08, 2021 at 11:09:47AM -0700, Nick Desaulniers wrote:
> On Fri, Oct 8, 2021 at 9:59 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> > On a kernel without CONFIG_STRICT_KERNEL_RWX, running EXEC_RODATA
> > test leads to "Illegal instruction" failure.
> >
> > Looking at the content of rodata_objcopy.o, we see that the
> > function content zeroes only:
> >
> >         Disassembly of section .rodata:
> >
> >         0000000000000000 <.lkdtm_rodata_do_nothing>:
> >            0:   00 00 00 00     .long 0x0
> >
> > Add the contents flag in order to keep the content of the section
> > while renaming it.
> >
> >         Disassembly of section .rodata:
> >
> >         0000000000000000 <.lkdtm_rodata_do_nothing>:
> >            0:   4e 80 00 20     blr
> >
> > Fixes: e9e08a07385e ("lkdtm: support llvm-objcopy")
> 
> Thanks for the patch; sorry I broke this.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Hah! Whoops; sorry I don't have an inverted version of this test! I
should have caught this when it broke. :|

-Kees

-- 
Kees Cook
