Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F303DE0AF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 22:30:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdqQ91hkyz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 06:30:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=atODWd2W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=adobriyan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=atODWd2W; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdqPc54fsz2ymP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 06:30:11 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso263366wmg.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Aug 2021 13:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=maODhYRPhde4BMWcrZ6/qErSkGLuv+PbRaEyxJhDMo4=;
 b=atODWd2WYUDiR/Yh8mbWci3AG5X+a80G2Q4BLWNFefPGVYYcIpMvWLouyf1ZAf6Njz
 mS8/6gVxf1P3kEdbhzo7tn18wqFDBh+uPpGnO+dFOW5aCzhPaAYz4qoWSgW+pBVd7UwK
 XmBzgBbBFQR2HMtig2PmSXx3J44FoIK33CmJ0g8q9xzgMGEhiw4QpYmuukC0gfX9KGas
 F9xCz3IbIYTj8BaM2LsmhXaQIKI6vIIX1ku7hoqSpP1VqjpBZOLfM0ZA8po18OgoyTFY
 iOkwzV8j6AGKlUnVUx7nwtGpXzaV/d5CzZJaCWTUjcO3Yd5LbZT3SrtadnOT/frT5l/0
 S9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=maODhYRPhde4BMWcrZ6/qErSkGLuv+PbRaEyxJhDMo4=;
 b=ZcqS03dCWDRmEHMCitatmUJteeL5K6dddEIWelnHkhpkjLWo114fKTf6wbd9hk5U7n
 Z1+eXTWKXC6vsh5Gbnt0znSrztsN13HVAuMgUYVJGVeOivQlHoxUK6MyTvs0JqEiKboI
 mrZ1+KLagonrLGnj/1/RW1Z6sOUC8D9kz0m1yx/Q4g59eRsRIsLaoOkig5umqUhroZr4
 yzpDqEXj/VshTF1/UOsEKmO0f13sHhBJRZkELKUS9xszG01sqh5hSDSZzzLT1RZgaoYt
 7As3SNZv2MebeKQYhU/jhO2hcNeEFnvtTVF6CfCYrrUo9W/15GaxjKqexl2+s+9Le9N7
 2Piw==
X-Gm-Message-State: AOAM530w3jGAYPlu/ZWotvsLVlHt3L8EK1NKxlEs7XmhGQH2yP8TZsMn
 iSOMHCLN4CrmlkNGN1GGcw==
X-Google-Smtp-Source: ABdhPJy3nJeqk03qeWAxAMHHcYXnIQ/OnlFxxyu/cuy0wKqXLfdqCXGwTCnG87w460nh7BOq4V8nFA==
X-Received: by 2002:a05:600c:3041:: with SMTP id
 n1mr654363wmh.19.1627936202860; 
 Mon, 02 Aug 2021 13:30:02 -0700 (PDT)
Received: from localhost.localdomain ([46.53.249.181])
 by smtp.gmail.com with ESMTPSA id z20sm10875371wmi.36.2021.08.02.13.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 13:30:02 -0700 (PDT)
Date: Mon, 2 Aug 2021 23:30:00 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 3/3] isystem: delete global -isystem compile option
Message-ID: <YQhVyOdQKUnvz1n5@localhost.localdomain>
References: <20210801201336.2224111-1-adobriyan@gmail.com>
 <20210801201336.2224111-3-adobriyan@gmail.com>
 <20210801213247.GM1583@gate.crashing.org>
 <YQeT5QRXc3CzK9nL@localhost.localdomain>
 <20210802164747.GN1583@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210802164747.GN1583@gate.crashing.org>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 02, 2021 at 11:47:47AM -0500, Segher Boessenkool wrote:
> On Mon, Aug 02, 2021 at 09:42:45AM +0300, Alexey Dobriyan wrote:
> > On Sun, Aug 01, 2021 at 04:32:47PM -0500, Segher Boessenkool wrote:
> > > On Sun, Aug 01, 2021 at 11:13:36PM +0300, Alexey Dobriyan wrote:
> > > > In theory, it enables "leakage" of userspace headers into kernel which
> > > > may present licensing problem.
> > > 
> > > > -NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
> > > > +NOSTDINC_FLAGS += -nostdinc
> > > 
> > > This is removing the compiler's own include files.  These are required
> > > for all kinds of basic features, and required to be compliant to the C
> > > standard at all.
> > 
> > No they are not required.
> 
> This is false, they *are* required, whenever you want to use these
> features.  If you do not include the required headers you get undefined
> behaviour.
> 
> > Kernel uses its own bool, uintptr_t and
> > static_assert, memset(), CHAR_BIT.
> 
> Yes, and it occasionally gets it wrong.  Great fun.  See c46bbf5d2def
> for the latest episode in this saga.  (Yes I know this is uapi so maybe
> not the best example here, but it isn't like the kernel gets such things
> wrong so often these days ;-) )
> 
> The kernel *cannot* make up its own types for this.  It has to use the
> types it is required to use (by C, by the ABIs, etc.)  So why
> reimplement this?

Yes, it can. gcc headers have stuff like this:

	#define __PTRDIFF_TYPE__ long int
	#define __SIZE_TYPE__ long unsigned int

If gcc can defined standard types, kernel can too.

> > noreturn, alignas newest C standard
> > are next.
> 
> What is wrong with <stdalign.h> and <stdnoreturn.h>?

These two are actually quite nice.

Have you seen <stddef.h>? Loads of macrology crap.
Kernel can ship nicer one.

> > This version changelog didn't mention but kernel would use
> > -ffreestanding too if not other problems with the flag.
> 
> It is still true for freestanding C implementations, you just get a
> severely reduced standard library,
> 
> > > These are not "userspace headers", that is what
> > > -nostdinc takes care of already.
> > 
> > They are userspace headers in the sense they are external to the project
> > just like userspace programs are external to the kernel.
> 
> So you are going to rewrite all of the rest of GCC inside the kernel
> project as well?

What an argument. "the rest of GCC" is already there except for stdarg.h.

> > > In the case of GCC all these headers are GPL-with-runtime-exception, so
> > > claiming this can cause licensing problems is fearmongering.
> > 
> > I agree licensing problem doesn't really exist.
> > It would take gcc drop-in replacement with authors insane enough to not
> > license standard headers properly.
> 
> There does still not exist a drop-in replacement for GCC, not if you
> look closely and/or rely on details (like the kernel does).  Some of the
> differences are hidden by "linux/compiler-*.h", but hardly all.
> 
> > > I strongly advise against doing this.
> > 
> > Kernel chose to be self-contained.
> 
> That is largely historical, imo.  Nowadays this is less necessary.

I kind of agree as in kernel should use int8_t and stuff because they
are standard.

Also, -isystem removal disables <float.h> and <stdatomic.h> which is
desireable.

> Also, the kernel chose to *do* use the compiler include files.  It is
> you who wants to abolish that here.
> 
> > -isystem removal makes sense then.
> 
> -nostdinc -isystem $(shell $(CC) -print-file-name=include)  makes sense
> for that: you do indeed not want the userspace headers.  Maiming the
> compiler (by removing some of its functional parts, namely, its generic
> headers) does not make sense.
> 
> > It will be used for intrinsics where necessary.
> 
> Like, everywhere.

No, where necessary. Patch demostrates there are only a few places which
want -isystem back.
