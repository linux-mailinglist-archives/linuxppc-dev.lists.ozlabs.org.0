Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F373E974D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 20:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlHqf50y2z3cKk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 04:08:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cnGuwp/r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=cnGuwp/r; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlHpz0jxKz301N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 04:07:37 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id l11so3727270plk.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 11:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=biCOyc5zjwp8UgiAEw5DCtCzrssqKWeZMERlP3hCQmo=;
 b=cnGuwp/rcSovo4qSL9gUyfcuHKJUBGgOE17Izgv7XOS9yYhPe57PE3HhW+bn/8sJg9
 2PIFXW05HL1i5Hz7hkSWuC0g1JixZFMD2oSzgmxzjVJRHvimLrai+mryeZipj2mjhzJ/
 4Ey9FHG6Un0Vvb8LqeEW2BM06r7oqcsHJ5ENE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=biCOyc5zjwp8UgiAEw5DCtCzrssqKWeZMERlP3hCQmo=;
 b=rLjAw9fBd+Qqa2qavlUboMjfmCpfuzDuBQkGy8vby5gFzEZZckUcV/WzqvCHeyOjmF
 lrKkWZKILaFKIj5fQWyKGjpkL7RMdwE7GhG32KOoxpxfg2Kqe7GBtBnEkcNZRda2MIwg
 5JkW52XnSu0GabC3nldEvQyXyTBfG9+bJGkeex5PeWuV3rHj7jqlbvyah3hGsMoka9bZ
 TVEBVVV9VMCSh94NhEglgeGHW6a3aWAU0ZuELsIH8P+4/LbzowckRA+b5v4QKXEgz32D
 MsVcdplQ+cWkJblk4Xnl3NR05MHQ3bqb6Z39UiKa48tYno8v2p25xS4w/puZhx27QIml
 8v+g==
X-Gm-Message-State: AOAM532ht6dHjkIb1Q8ap+Mr/mOSH73PYBWmFJ+SABbChM7liLtcdQon
 /z4f96mtE5XI27wnABROuk7Lxg==
X-Google-Smtp-Source: ABdhPJyd21FEcXWllDtq5B+Dci0OC4IztnOEijz0GvcO3tSuSGfCcaDeDOMhAuGFpWKBiCP86naETw==
X-Received: by 2002:a65:40c4:: with SMTP id u4mr972pgp.186.1628705255831;
 Wed, 11 Aug 2021 11:07:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i5sm7407462pjk.47.2021.08.11.11.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 11:07:35 -0700 (PDT)
Date: Wed, 11 Aug 2021 11:07:34 -0700
From: Kees Cook <keescook@chromium.org>
To: "Christopher M. Riedl" <cmr@linux.ibm.com>
Subject: Re: [PATCH v5 2/8] lkdtm/powerpc: Add test to hijack a patch mapping
Message-ID: <202108111057.CC6F897@keescook>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-3-cmr@linux.ibm.com>
 <f933e9de-ff3b-aa5a-bb6e-55770d5ab868@csgroup.eu>
 <CDGVLP8OS8N9.13R0RIGJ1WJ8R@oc8246131445.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CDGVLP8OS8N9.13R0RIGJ1WJ8R@oc8246131445.ibm.com>
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
Cc: peterz@infradead.org, x86@kernel.org, npiggin@gmail.com, tglx@linutronix.de,
 dja@axtens.net, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 11, 2021 at 12:57:00PM -0500, Christopher M. Riedl wrote:
> On Thu Aug 5, 2021 at 4:13 AM CDT, Christophe Leroy wrote:
> >
> >
> > Le 13/07/2021 à 07:31, Christopher M. Riedl a écrit :
> > > When live patching with STRICT_KERNEL_RWX the CPU doing the patching
> > > must temporarily remap the page(s) containing the patch site with +W
> > > permissions. While this temporary mapping is in use, another CPU could
> > > write to the same mapping and maliciously alter kernel text. Implement a
> > > LKDTM test to attempt to exploit such an opening during code patching.
> > > The test is implemented on powerpc and requires LKDTM built into the
> > > kernel (building LKDTM as a module is insufficient).
> > > 
> > > The LKDTM "hijack" test works as follows:
> > > 
> > >    1. A CPU executes an infinite loop to patch an instruction. This is
> > >       the "patching" CPU.
> > >    2. Another CPU attempts to write to the address of the temporary
> > >       mapping used by the "patching" CPU. This other CPU is the
> > >       "hijacker" CPU. The hijack either fails with a fault/error or
> > >       succeeds, in which case some kernel text is now overwritten.
> > > [...]
> > > +#if (IS_BUILTIN(CONFIG_LKDTM) && defined(CONFIG_STRICT_KERNEL_RWX) && \
> > > +	defined(CONFIG_PPC))
> >
> > I think this test shouldn't be limited to CONFIG_PPC and shouldn't be
> > limited to CONFIG_STRICT_KERNEL_RWX. It should be there all the time.

Agreed: if the machinery exists to provide this defense on even one
arch/config/whatever combo, I'd like LKDTM to test for it. This lets use
compare defenses across different combinations more easily, and means
folks must answer questions like "why doesn't $combination provide
$defense?"

> > Also why limiting it to IS_BUILTIN(CONFIG_LKDTM) ?
> 
> The test needs read_cpu_patching_addr() which definitely cannot be
> exposed outside of the kernel (ie. builtin).

FWIW, I'm okay with this. There isn't a solution that feels entirely
"right", so either a build-time requirement like this, or using an
exception for modules like this:

arch/x86/kernel/cpu/common.c:#if IS_MODULE(CONFIG_LKDTM)
arch/x86/kernel/cpu/common.c-EXPORT_SYMBOL_GPL(native_write_cr4);
arch/x86/kernel/cpu/common.c-#endif

I think neither is great. Another idea is maybe using a name-spaced
export, like:

EXPORT_SYMBOL_NS_GPL(native_write_cr4, LKDTM);

But that still means it gets exposed to malicious discovery, so probably
not.

I suspect the best is to just do the BUILTIN check, since building LKDTM
as a module on a _production_ kernel is rare if it exists at all. The
only downside is needing to completely reboot to perform updated tests,
but then, I frequently find myself breaking the kernel badly on bad
tests, so I have to reboot anyway. ;)

-Kees

-- 
Kees Cook
