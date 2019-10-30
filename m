Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BB2E9599
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 05:14:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472w7j0ydkzF3lx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 15:14:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NlVcq7fl"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472w5j16GvzF3Xm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 15:12:24 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id c2so792770oic.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 21:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=q8SBmE+8CAuRsopHcvNfJ0iOGe3QE73CA4UWHXUOwzo=;
 b=NlVcq7fl9famiHFwVuXroRWduNF6YzH/4yHGpXWGNk+n1bQ4bvpjQCiEgUhbhk3mPO
 9IQaYBsuiz4qQWkVyMbfR379LhuuUs5OLKHBEhrqS7R77grOSQ5TK/b9ec1xu9JMbciY
 q4SvSpPDfoZOHMB/wiwAxLPSHHndu3xnpfwwgIIF8S6myDXUgwH6tB5HawuxGXGexwDn
 AyhsgCsoYV5GwdLBR7tQH7u2Tyr+T2VwgKooE6sztkuOu30ZRd7kgAI2O3QWVLUY2ogx
 xBeFY11McksdtVcE2QO0uNO+mDhhbsA4BtdLVWZRUTdDISkY1P8Gh21QTVXEuYslV5af
 VHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q8SBmE+8CAuRsopHcvNfJ0iOGe3QE73CA4UWHXUOwzo=;
 b=qdpbJD3q2c60DNnffl5HeGUI0gSXIWuvpJITuq7GKsITqCu5fkMu7jFqi5qssHStyc
 hb/gOwq1sizkXisrpqD7Bnh5mwzUez4bHcd8XswjKE5rNwPvgAGsHPvJZvmxtCI3Xpbk
 Zzg/TnfeBKid3SOuOLiLNW9hl+IEqkgwewdXsxUh6KMSIm3j51f07p6bh/jlgvpjjiT9
 6PVvpNrRGZMH9eSBpkvvH+JRnjhqPjtlnmHq4pCZsHPvBl/8AlWK+NwzFVlrBN+OXnW3
 P1aEqQeOn2R6j84FN4671/+nbiBZLw5lSEbljkHkFVPccmyplz84sE85uLv9gjbnFZ77
 YyVg==
X-Gm-Message-State: APjAAAX1y6yOh01bxVaxkrZNkPW68EnuZ19pR1JdUr+RTEmpBPGHLo+0
 dOaZ3Y+XDZX1LfSx9qteKxU=
X-Google-Smtp-Source: APXvYqyxpEloNeg8lmz1nQNKAJqcYExDQ+n8NNJFQFby1voWeWfahZNM3WEyFGqPgTisHyRJNox65g==
X-Received: by 2002:aca:fc11:: with SMTP id a17mr6995309oii.59.1572408741122; 
 Tue, 29 Oct 2019 21:12:21 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id z4sm300942oix.17.2019.10.29.21.12.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Oct 2019 21:12:20 -0700 (PDT)
Date: Tue, 29 Oct 2019 21:12:18 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v4 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
Message-ID: <20191030041218.GB14630@ubuntu-m2-xlarge-x86>
References: <20190911182049.77853-1-natechancellor@gmail.com>
 <20191014025101.18567-1-natechancellor@gmail.com>
 <20191014025101.18567-4-natechancellor@gmail.com>
 <20191014093501.GE28442@gate.crashing.org>
 <CAKwvOdmcUT2A9FG0JD9jd0s=gAavRc_h+RLG6O3mBz4P1FfF8w@mail.gmail.com>
 <20191014191141.GK28442@gate.crashing.org>
 <20191018190022.GA1292@ubuntu-m2-xlarge-x86>
 <20191018200210.GR28442@gate.crashing.org>
 <20191022051529.GA44041@ubuntu-m2-xlarge-x86>
 <20191022085709.GI28442@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022085709.GI28442@gate.crashing.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 22, 2019 at 03:57:09AM -0500, Segher Boessenkool wrote:
> On Mon, Oct 21, 2019 at 10:15:29PM -0700, Nathan Chancellor wrote:
> > On Fri, Oct 18, 2019 at 03:02:10PM -0500, Segher Boessenkool wrote:
> > > I think the proper solution is for the kernel to *do* use -ffreestanding,
> > > and then somehow tell the kernel that memcpy etc. are the standard
> > > functions.  A freestanding GCC already requires memcpy, memmove, memset,
> > > memcmp, and sometimes abort to exist and do the standard thing; why cannot
> > > programs then also rely on it to be the standard functions.
> > > 
> > > What exact functions are the reason the kernel does not use -ffreestanding?
> > > Is it just memcpy?  Is more wanted?
> > 
> > I think Linus summarized it pretty well here:
> > 
> > https://lore.kernel.org/lkml/CAHk-=wi-epJZfBHDbKKDZ64us7WkF=LpUfhvYBmZSteO8Q0RAg@mail.gmail.com/
> 
> GCC recognises __builtin_memcpy (or any other __builtin) just fine even
> with -ffreestanding.
> 
> So the kernel wants a warning (or error) whenever a call to one of these
> library functions is generated by the compiler without the user asking
> for it directly (via a __builtin)?  And that is all that is needed for
> the kernel to use -ffreestanding?
> 
> That shouldn't be hard.  Anything missing here?
> 
> 
> Segher

Yes, I suppose that would be good enough.

I don't know if there are any other optimizations that are missed out on
by using -ffreestanding. It would probably be worth asking other kernel
developers on a separate thread (or the one I linked above).

Would be nice to get this shored up soon since our PowerPC builds have
been broken since the beginning of August :/

Cheers,
Nathan
