Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179EF8AB02D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 16:06:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0QE+OLZS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLbzp6HMgz3dKF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 00:06:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0QE+OLZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3sxoizgykdp4ykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLbz20XCZz2yGk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 00:06:04 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1e2a1619cfcso21347105ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713535562; x=1714140362; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7m+OFN3f7RK1NWDGOjcIbMxbJWaEeT5t2cMPNC651Yw=;
        b=0QE+OLZS1B77bC3hRHlDXsQvIofcK4dt34uXEguISBoDmEqRawYkIm57BUZpEfmQ4Y
         lQun8bKLprskv6U1Y24T8G5M23yfwtlogCHBi7R4lMZ+wvGpIEtGtXALjLYguP0gUV2E
         UswmjQAB9kIz/s867sPKIMwejgi0OHvZBFoQwcfMsq0ALm+51BCKB+wwRC23WuO5Xq7N
         qTQv7zuK+xprOJOGKBCC3v030bgIvKo6sGqMSbtOxa4bKctwzgcdy8M99ox7Mst3GfV9
         MSbziHpx5uq29BLeIymiFuWB6EZiMiSWH5rvffb3mYcX/vqdxDaqztLu/pmB0yAlPxWn
         j4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535562; x=1714140362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7m+OFN3f7RK1NWDGOjcIbMxbJWaEeT5t2cMPNC651Yw=;
        b=KF7TTYEe3x37cOzy9zcrYDhTkokoesWTnmcq4G0CggaL2DcNCH70iikQf7sfzsdlNq
         9+ZQd4xy0Iu91I1CHebJYF2OuV99bo2ONEOBPdZ6S+c7QzIrGZH59R98t1TZSDjtpN5H
         jqiqR1WcSgOnPIwdzHWtBuxZ/1qByAH9RA/jdXT9KEToTSnQLXLR3vpQ+EhoqzkaJdNw
         Jwcsqqw0UDUT2Ymxh2w7+VLCQSUFgxK3dzyccfJRfY3ue3i32/47jP+aBF7/Ue90pKzE
         4CzSs7KBfy3AqmG3NUgrdDa6SaUoiMBSrq8pMcgXkPC7mxCgoqU1mp7oOyJQJ+Zs3/Sc
         mR2w==
X-Forwarded-Encrypted: i=1; AJvYcCUetTCHGI3tc4rXb6c0SIVCOpZyP97BNTjEVltZbeWlOxEeJPmwxcf8h3V7EvMbyHTBnhHMbCkNGpw0K4tR4DWXEfeM8Fq3MtHf+3V12w==
X-Gm-Message-State: AOJu0Yx6Bk8oNe45MeqYePmTNSG008IVOdIEhGdTcvLtqY3dwEPBgvaI
	pTMr/9Np1fDokpwnmxa5Pb0R2y7UIAtJH2fCbzP4ckyL0rdRySIT8yZ5xuLNwWlOO3rNe1ZhskF
	NOQ==
X-Google-Smtp-Source: AGHT+IFVr0e57cGhUmbwZXAzUZi28t0zaJY3a/EePbJv+HQcnlGd85ionAxsgZB2Zmftzq48Qq8oRL7k/7k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2352:b0:1e5:e61c:35af with SMTP id
 c18-20020a170903235200b001e5e61c35afmr243172plh.1.1713535561835; Fri, 19 Apr
 2024 07:06:01 -0700 (PDT)
Date: Fri, 19 Apr 2024 07:06:00 -0700
In-Reply-To: <20240419140321.GF3148@willie-the-truck>
Mime-Version: 1.0
References: <20240409175108.1512861-1-seanjc@google.com> <20240409175108.1512861-2-seanjc@google.com>
 <20240413115324.53303a68@canb.auug.org.au> <87edb9d33r.fsf@mail.lhotse>
 <87bk6dd2l4.fsf@mail.lhotse> <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
 <Zh06O35yKIF2vNdE@google.com> <20240419140321.GF3148@willie-the-truck>
Message-ID: <ZiJ6SDcbTBQjrG3r@google.com>
Subject: Re: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>, Daniel Sneddon <daniel.sneddon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 19, 2024, Will Deacon wrote:
> On Mon, Apr 15, 2024 at 07:31:23AM -0700, Sean Christopherson wrote:
> > On Mon, Apr 15, 2024, Geert Uytterhoeven wrote:
> > Oof.  I completely missed that "cpu_mitigations" wasn't x86-only.  I can't think
> > of better solution than an on-by-default generic Kconfig, though can't that it
> > more simply be:
> > 
> > diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> > index 2b8fd6bb7da0..5930cb56ee29 100644
> > --- a/drivers/base/Kconfig
> > +++ b/drivers/base/Kconfig
> > @@ -191,6 +191,9 @@ config GENERIC_CPU_AUTOPROBE
> >  config GENERIC_CPU_VULNERABILITIES
> >         bool
> >  
> > +config SPECULATION_MITIGATIONS
> > +       def_bool !X86
> > +
> >  config SOC_BUS
> >         bool
> >         select GLOB
> 
> I can't see this in -next yet. Do you plan to post it as a proper patch
> to collect acks etc?

Sorry, I neglected to Cc everyone.

https://lore.kernel.org/all/20240417001507.2264512-2-seanjc@google.com
