Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E9F38C123
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 09:57:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmf8N5zH0z3btv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 17:57:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DYK4allm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DYK4allm; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmf7v2xRgz2ykP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 17:56:40 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id d11so20047162wrw.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 00:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZBzGJGY3Lfdn2lNHI2teoZpXLD66Uih3j/hx8ThIHi4=;
 b=DYK4allmsvbOxhLePej2gQFrRaKHJlch3k0v7mM00MGfmxSAWTMg/3INJhD+1Rc3tU
 9mOKiKUjmwPEf4GRDSP8kNtQuJDR5Y+ZpoiZMFHtiReax+43X/DrDH7OYo0+/5D7/STR
 uRRZGHQQgnENF2IGZZW38nUi3XD0QEUGfclsvQs5VCyM5/Kb9GX/SnyiQU+Y6BIvzFQf
 GX0L5Sgxj9RvgHFJFANgnVk4UYQvTAYi5z4Q5wXF1c4tRGb1sqe9ZeDJ0vXhwCiuZvQK
 yYqwZDP6IcXMQDVHvaLwSV915BV14jdKWLHO0eqPTq1w1tXxRe249C+gWXeC+7JSej3I
 vO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZBzGJGY3Lfdn2lNHI2teoZpXLD66Uih3j/hx8ThIHi4=;
 b=pwtiumyHFJiLLLXaZ0UtoSmfQ4v1e00b0VqHNBuKYKDbzoH16OC2abycfyl1Uc6U1P
 8k6S1DFgn6Me7C1RfEL5r0vg9/Ryi6lisBTEjMUFYdiWyYm2SxVqfxhSo9p6EzHOOEMQ
 G4+J7Jf6AjJyLdhLOWFyi7DdW4gu1NXxYBzBHI12u0aA9PJFQdLawHOecQzpDlWrmP+5
 vnmm8CNcDDjfjg8ui6aPu59JhTv0MwkzsoBtehcKMqChVDHQxNPKil/FkUdtvbW5XAcE
 Q/vyLeCsCN4xVfvlGc3fSyUOTy4nV1ImD/QQeYcG8wy0QjO04vI9zPv6TWpX4sKrNkKh
 n9MA==
X-Gm-Message-State: AOAM533U9W5yi3P85P8YblcqBsqkDjdrFPvGg/WX0nDw/YjOeJL+jD9f
 RDbq9XLWXOoN+PZNHo0IuVkxtg==
X-Google-Smtp-Source: ABdhPJwx8/gIMGjk4t/5kik01FomXtSQYBs+juxRo4HxzZoCKemokseJo7KzkcOXTh/L7jhS9L6uHA==
X-Received: by 2002:adf:f109:: with SMTP id r9mr8360005wro.251.1621583796406; 
 Fri, 21 May 2021 00:56:36 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id g11sm1133714wri.59.2021.05.21.00.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 00:56:35 -0700 (PDT)
Date: Fri, 21 May 2021 08:56:33 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/16] Rid W=1 warnings from Char
Message-ID: <20210521075633.GB2549456@dell>
References: <20210520121347.3467794-1-lee.jones@linaro.org>
 <CAK8P3a0VujuG8eU_CEVSvzbk4nAJz8fStedM5eMUrLAr9EJxDQ@mail.gmail.com>
 <20210521072236.GX2549456@dell> <YKdkZdvN+uu6lu0g@kroah.com>
 <YKdk2NYHysgTGlRt@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YKdk2NYHysgTGlRt@kroah.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Airlie <airlied@linux.ie>,
 Clemens Ladisch <clemens@ladisch.de>,
 "C. Scott Ananian" <cananian@alumni.princeton.edu>,
 Paul Mackerras <paulus@samba.org>, Kylene Hall <kjhall@us.ibm.com>,
 Jerome Glisse <j.glisse@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Michael Neuling <mikey@neuling.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Dave Safford <safford@watson.ibm.com>, Harald Welte <laforge@gnumonks.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kanoj Sarcar <kanoj@sgi.com>,
 Bob Picco <robert.picco@hp.com>, Arnd Bergmann <arnd@arndb.de>,
 Thirupathaiah Annapureddy <thiruan@microsoft.com>,
 "cs.c" <support.linux@omnikey.com>, Lijun Pan <ljp@linux.ibm.com>,
 Reiner Sailer <sailer@watson.ibm.com>, Matt Mackall <mpm@selenic.com>,
 van Doorn <leendert@watson.ibm.com>, Theodore Ts'o <tytso@mit.edu>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Fulghum <paulkf@microgate.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 May 2021, Greg Kroah-Hartman wrote:

> On Fri, May 21, 2021 at 09:42:29AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, May 21, 2021 at 08:22:36AM +0100, Lee Jones wrote:
> > > On Thu, 20 May 2021, Arnd Bergmann wrote:
> > > 
> > > > On Thu, May 20, 2021 at 2:13 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > > >
> > > > > This set is part of a larger effort attempting to clean-up W=1
> > > > > kernel builds, which are currently overwhelmingly riddled with
> > > > > niggly little warnings.
> > > > >
> > > > > Lee Jones (16):
> > > > >   char: pcmcia: cm4000_cs: Remove unused variable 'tmp'
> > > > >   char: pcmcia: cm4040_cs: Remove unused variable 'uc'
> > > > >   char: random: Include header containing our prototypes
> > > > >   char: pcmcia: synclink_cs: Fix a bunch of kernel-doc issues
> > > > >   char: pcmcia: synclink_cs: Fix a bunch of kernel-doc issues
> > > > >   char: applicom: Remove 3 unused variables 'ret' and 2 instances of
> > > > >     'byte_reset_it'
> > > > >   char: tpm: tpm1-cmd: Fix a couple of misnamed functions
> > > > >   char: tpm: tpm_ftpm_tee: Fix a couple of kernel-doc misdemeanours
> > > > >   char: agp: backend: Demote some non-conformant kernel-doc headers
> > > > >   char: agp: frontend: Include header file containing our prototypes
> > > > >   char: agp: via-agp: Remove unused variable 'current_size'
> > > > >   char: hpet: Remove unused variable 'm'
> > > > >   char: agp: generic: Place braces around optimised out function in if()
> > > > >   char: agp: uninorth-agp: Remove unused variable 'size'
> > > > >   char: hw_random: pseries-rng: Demote non-conformant kernel-doc header
> > > > >   char: mem: Provide local prototype for non-static function
> > > > 
> > > > Thanks a lot!
> > > > 
> > > > I've looked all the patches now and commented on patches 6 and 16.
> > > > With my comments addressed
> > > > 
> > > > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > Thanks Arnd.
> > > 
> > > Would it be possible for the remaining 14 patches to be taken in
> > > please?  I will work on the 2 Arnd commented on in due course and
> > > resubmit them independently.
> > 
> > Yes, I can queue them up, thanks.
> 
> Wait, I can take the ones for code that I maintain, not for others.
> drivers/char/ is "fun" in that some subdirs have active
> trees/maintainers that are not me and Arnd so they go to Linus through
> other ways.  I'll queue up the ones that I am "allowed" to and you will
> get the emails from that.

Understood, thanks.

Hopefully the other maintainers will be as on the ball as you are.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
