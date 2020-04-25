Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5F81B8746
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 17:07:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498ZCD4n2YzDqY3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 01:07:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=niveditas98@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=alum.mit.edu
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Qsh9H7XU; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498Z8Q0cgFzDqHl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 01:04:50 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id m67so13337818qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 08:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aFNkj/X0ARFk1lHudyAFFChBsuWKz++VCQGA+5bkEF4=;
 b=Qsh9H7XUkaGUDZISgiDxKbDqE0iw0p/pS6gA7oFdel3Wd2F3lv0ULO/fCkynQ67oCW
 DqWtaidJKbBNrWGqbCP7qSK+SvwCC4f+9bp25MtF/7pRsPwDG6NvOxgGo3PFdQyTbK9U
 HgmY8uxbNL+ONgb2jjOi9yfcQlHZ4sRWWDIWKmQ3rc7aa5T8kHU8NYYx0yOoV4TFOvBB
 zcRXfwiHCdP6/1zuEF9vdLa2ESgC7uFkZYUp8cJLLXcV95+IwNuEuNW7EPeE5REcVFKe
 FtkmVOk/yIUksd6uHUEdCrZ9voizXd/hkn4tOTB0RkHU/FlwCcm37vjPXni2YIZIKT0r
 x0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=aFNkj/X0ARFk1lHudyAFFChBsuWKz++VCQGA+5bkEF4=;
 b=UNsgNBk9jlrRkaPxjmo5+evdjaLZ0gqAXP1yGtdNFwWBqEogOxik8f/smpagUDv+lJ
 EQaD9VsVp0znOb7L1RoEtIGJxGZcQPA4ZQe5wg0qPAqsK9XRGjAOoJOkmOr2BzU18wZD
 9P+KmbLteE3io1OlXHMmKhpsNR+COS7+ebZNE0HwoU5btYdbpWWZooYj4O/aaNgUJSef
 RgWF00k8vhNkE2jQt8jvhjirSX81hA6B+MSpkGIYmYZJX02P97c0H2rYcBqMp1pLeS3q
 xo9q2+OScWzezqSAJApuArhpRJzwLJFVCymVGOh3KKAO5l7dqPBywBkgDhgQ4C1PISaW
 UjKg==
X-Gm-Message-State: AGi0PuY/NCGiVQDa8BM5vYyqSHC8nUjbbo63CQgQelI7qHgMSyFPxWSy
 i6yf8XT3OZaHyg5EonbI5bU=
X-Google-Smtp-Source: APiQypKJgUBaip4pHz85dIJ60/YCLMMEy1fNhqdI2WcdwQ7f+6cxi9Dc6VyvXD4/F3xc3Z0mZd1YHQ==
X-Received: by 2002:a37:e30e:: with SMTP id y14mr13686328qki.61.1587827085314; 
 Sat, 25 Apr 2020 08:04:45 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id p10sm5925035qtu.14.2020.04.25.08.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 08:04:43 -0700 (PDT)
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date: Sat, 25 Apr 2020 11:04:40 -0400
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] x86: Fix early boot crash on gcc-10, next try
Message-ID: <20200425150440.GA470719@rani.riverdale.lan>
References: <20200422102309.GA26846@zn.tnic>
 <CAKwvOd=Dza3UBfeUzs2RW6ko5fDr3jYeGQAYpJXqyEVns6DJHg@mail.gmail.com>
 <20200422192113.GG26846@zn.tnic>
 <CAKwvOdkbcO8RzoafON2mGiSy5P96P5+aY8GySysF2my7q+nTqw@mail.gmail.com>
 <20200422212605.GI26846@zn.tnic>
 <CAKwvOd=exxhfb8N6=1Q=wBUaYcRDEq3L1+TiHDLz+pxWg8OuwQ@mail.gmail.com>
 <20200423125300.GC26021@zn.tnic> <20200423161126.GD26021@zn.tnic>
 <20200425014657.GA2191784@rani.riverdale.lan>
 <20200425085759.GA24294@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200425085759.GA24294@zn.tnic>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, boris.ostrovsky@oracle.com, x86@kernel.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Jakub Jelinek <jakub@redhat.com>,
 Kees Cook <keescook@chromium.org>, Michael Matz <matz@suse.de>,
 Sergei Trofimovich <slyfox@gentoo.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, jgross@suse.com,
 Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 25, 2020 at 10:57:59AM +0200, Borislav Petkov wrote:
> On Fri, Apr 24, 2020 at 09:46:57PM -0400, Arvind Sankar wrote:
> > The comment above boot_init_stack_canary's definition should be updated
> > to note that it needs to be called from a function that, in addition to
> > not returning, either has stackprotector disabled or avoids ending in a
> > tail call.
> 
> How's that?
> 
> diff --git a/arch/x86/include/asm/stackprotector.h b/arch/x86/include/asm/stackprotector.h
> index 91e29b6a86a5..237a54f60d6b 100644
> --- a/arch/x86/include/asm/stackprotector.h
> +++ b/arch/x86/include/asm/stackprotector.h
> @@ -55,8 +55,12 @@
>  /*
>   * Initialize the stackprotector canary value.
>   *
> - * NOTE: this must only be called from functions that never return,
> - * and it must always be inlined.
> + * NOTE: this must only be called from functions that never return, it must
> + * always be inlined and it should be called from a compilation unit for
> + * which stack protector is disabled.
> + *
> + * Alternatively, the caller should not end with a function call which gets
> + * tail-call optimized as that would lead to checking a modified canary value.
>   */
>  static __always_inline void boot_init_stack_canary(void)
>  {

I'd put the clause about stack protector being disabled and the
tail-call one together, to make clear that you still need the never
return and always inline bits. Also, this function is implemented by
multiple arch's and they all have similar comments -- might be better to
consolidate the comment in the generic (dummy) one in
include/linux/stackprotector.h laying out the restrictions that arch
implementations should follow?

> 
> > There are also other calls that likely need to be fixed as well -- in
> > init/main.c, arch/x86/xen/smp_pv.c, and there is a powerpc version of
> > start_secondary in arch/powerpc/kernel/smp.c which may also be affected.
> 
> Yes, there was an attempt to fix former:
> 
> https://lkml.kernel.org/r/20200413123535.10884-1-frederic.pierret@qubes-os.org

There's also the one in init/main.c which is used by multiple
architectures. On x86 at least, the call to arch_call_rest_init at the
end of start_kernel does not get tail-call optimized by gcc-10, but I
don't see anything that actually prevents that from happening. We should
add the asm("") there as well I think, unless the compiler guys see
something about this function that will always prevent the optimization?

Cc'ing PPC list for powerpc start_secondary.
