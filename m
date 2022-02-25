Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F784C3D6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 05:47:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4chb0CCqz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 15:47:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ez/pn28O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=ez/pn28O; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4cgw2QKtz3bNg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 15:47:05 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 gl14-20020a17090b120e00b001bc2182c3d5so6753794pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 20:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SyanVPTDj26hoM0+/34vC3ojlwHE6zX0sye59Y+Rtjs=;
 b=ez/pn28OrXoTJLAydt7fC3l/1BRKMczx0EuxgJzCsoJxTes/Q7y60tcVMO7wzlZseu
 9ifY3jRNBn24/NGKwkqqOVQOACDLdGJKM8O1juUN8Vb5C+HPbiKG5WnRq7DsniVf7u8e
 fw6ieiJnZPOJ/xg6orBYtG5jEZmuIWIwk6hF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SyanVPTDj26hoM0+/34vC3ojlwHE6zX0sye59Y+Rtjs=;
 b=IXxdnwCZquNO2/QjugjmcB9+zh1AJrAk0Etg4iG+zLmdRMy9Xl3zbrazZzZuMOpgs+
 4aNlN+nmcLDFDPu9wMkAmAPTJtuQXLwwwZ56KAgNr1eUc3ycM8KesWW1jeBupPO0wV4a
 lGjpflZKYdZjZbNgAqSwYZiu2bKZBbUtSu4/hXBUiadoFPv+wp/sKIZCrGStT2mFfZ8e
 ebf7Cnp/abrgSD1KOKdshiimqEIt5ckmDmty+D1Af3XJA/heeN9YpZMxI+kN5dukJcEX
 gWQtAkZYWTwRpKwhtN7/E8rCuNuOw8dtSUy3WMSgFd4qoo8ryJkcMfyYZoY9zoKSFnrp
 jkZw==
X-Gm-Message-State: AOAM531Tvd6/Mqs1GzHPgVnb8VbutwAQnD/O7uhu3Hc2KDhPVs9WBmIZ
 4Hxn0Qja7E3jZT0WOmeoy3Tvxg==
X-Google-Smtp-Source: ABdhPJzy/9ym4pKvdp7gXGiiTJRBM16FFuwlMDSrJbIDB/E//S1S2eCPnNgmXzRLoOrLqxAOu4UIKw==
X-Received: by 2002:a17:902:f64e:b0:14d:20db:8478 with SMTP id
 m14-20020a170902f64e00b0014d20db8478mr5755429plg.158.1645764423449; 
 Thu, 24 Feb 2022 20:47:03 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a623810000000b004e1b132bc9esm1254834pfa.149.2022.02.24.20.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 20:47:03 -0800 (PST)
Date: Thu, 24 Feb 2022 20:47:02 -0800
From: Kees Cook <keescook@chromium.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v2] usercopy: Check valid lifetime via stack depth
Message-ID: <202202242046.33FF8372@keescook>
References: <20220224060342.1855457-1-keescook@chromium.org>
 <85d42900efaa4fdb8c20de2147d938c7@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85d42900efaa4fdb8c20de2147d938c7@AcuMS.aculab.com>
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 24, 2022 at 08:58:20AM +0000, David Laight wrote:
> From: Kees Cook
> > Sent: 24 February 2022 06:04
> > 
> > Under CONFIG_HARDENED_USERCOPY=y, when exact stack frame boundary checking
> > is not available (i.e. everything except x86 with FRAME_POINTER), check
> > a stack object as being at least "current depth valid", in the sense
> > that any object within the stack region but not between start-of-stack
> > and current_stack_pointer should be considered unavailable (i.e. its
> > lifetime is from a call no longer present on the stack).
> > 
> ...
> > diff --git a/mm/usercopy.c b/mm/usercopy.c
> > index d0d268135d96..5d28725af95f 100644
> > --- a/mm/usercopy.c
> > +++ b/mm/usercopy.c
> > @@ -22,6 +22,30 @@
> >  #include <asm/sections.h>
> >  #include "slab.h"
> > 
> > +/*
> > + * Only called if obj is within stack/stackend bounds. Determine if within
> > + * current stack depth.
> > + */
> > +static inline int check_stack_object_depth(const void *obj,
> > +					   unsigned long len)
> > +{
> > +#ifdef CONFIG_ARCH_HAS_CURRENT_STACK_POINTER
> > +#ifndef CONFIG_STACK_GROWSUP
> 
> Pointless negation
> 
> > +	const void * const high = stackend;
> > +	const void * const low = (void *)current_stack_pointer;
> > +#else
> > +	const void * const high = (void *)current_stack_pointer;
> > +	const void * const low = stack;
> > +#endif
> > +
> > +	/* Reject: object not within current stack depth. */
> > +	if (obj < low || high < obj + len)
> > +		return BAD_STACK;
> > +
> > +#endif
> > +	return GOOD_STACK;
> > +}
> 
> If the comment at the top of the function is correct then
> only a single test for the correct end of the buffer against
> the current stack pointer is needed.
> Something like:
> #ifdef CONFIG_STACK_GROWSUP
> 	if ((void *)current_stack_pointer < obj + len)
> 		return BAD_STACK;
> #else
> 	if (obj < (void *)current_stack_pointer)
> 		return BAD_STACK;
> #endif
> 	return GOOD_STACK;

Oh, yeah, excellent point. I suspect the compiler would probably
optimize it all away, but yes, this is, in fact, easier to read, and
short enough I should probably just not bother with a separate function.

Thanks!

-Kees

> 
> Although it may depend on exactly where the stack pointer
> points to - especially for GROWSUP.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

-- 
Kees Cook
