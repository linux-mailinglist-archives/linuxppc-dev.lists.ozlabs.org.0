Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96323B1401
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 19:49:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TmV43CLnzF4XD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 03:49:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vFOuHT8q"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tm5Y37rFzF4nD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 03:31:12 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x127so16416936pfb.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 10:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mOVlpD6BMnbKiv36TkrT6fFnE/GEkfURpkH4h7Nmx9A=;
 b=vFOuHT8q/eBPKZYTjetLEjaJe6yOUcZW5JGUf5OEuaCTw+ePR0nBx/f3HHUQTCUqQI
 uYEVVwDfqUnPrcGgKSPtyIog0m/i9gn62BCdJUEileXrg/ZTSjiDx2Dw/hL8T16b9Y2z
 0FN6cEQuRsDycs54vUgScb4QhncrgBaEBNq3q+p5H2XxkiGNy4DOPQeBGLB7P0MzTa74
 Ia81d7XZcCkQvsxt8p/jjS9gaBsnZxNDgj7JCztPVUzFz7K6h/sg7WeHsuBmxqLtDjwp
 gc5AdHdJRbIwx35Qv6FNrYeqD3KkACcMSRHgTN4HhTCWOg+6oEN4MQ9CT6EAuxZIXeCd
 eD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mOVlpD6BMnbKiv36TkrT6fFnE/GEkfURpkH4h7Nmx9A=;
 b=UeZl+zbjSeobjpNOKloX3d8sfeabGKoGLEr3dduqCAfCMe7FEkfv20yD1pe3/2vKWX
 EsQxh5tskXxv1cbZO6Q0mUx7HlOmNZB5Bo0ZFWeru2xHffPrEqKMTobAgfgQb5pCHr+8
 2x6B8doxLBBPXECy3ZkVqtJKyJgaY0k0qXOe4wHeJostfGyx9tKzuJFgey3pDXikbkmw
 0G+bC1puSbQZ4CWKL8LHY9geshBhWzWcxWYEskM/6M25qgMjR46064S5Ajc92iEjeXU6
 o84/ePveqo+kdB/tihassvAwzzteh6bEaAiZ3SV+MlbJI13+njvHNBc5WWKKcN/eUWQJ
 L2DQ==
X-Gm-Message-State: APjAAAVqU/5kf15sZ5S8CylZCb0J7RvfcxK9PIGt3S0QV3Nj73AMKLqF
 JXB4856fC3X/icQ8pT2oEFvAkrM2QP38xRd8yIm2mg==
X-Google-Smtp-Source: APXvYqyVEf0vry59fDuLYLixqQV/JiE2ffpPjCKBKhiAyDloxfQvSH0ffpD+0xZh3bmlSGzo28Pk/FqEMIBOISodWS0=
X-Received: by 2002:a63:7153:: with SMTP id b19mr3009136pgn.10.1568309468835; 
 Thu, 12 Sep 2019 10:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190911182049.77853-1-natechancellor@gmail.com>
 <20190911182049.77853-4-natechancellor@gmail.com>
 <CAKwvOdnh+YoACaX4Oxk7ZiEQAQ2VgA6W=Dtbk7gzK5yJduFvGQ@mail.gmail.com>
 <20190912054304.GA103826@archlinux-threadripper>
In-Reply-To: <20190912054304.GA103826@archlinux-threadripper>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 12 Sep 2019 10:30:57 -0700
Message-ID: <CAKwvOdmc-1BrXG01d0PzjqhJsVbgwUMm6mxR4BcTqZ9WKtS6HA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
To: Nathan Chancellor <natechancellor@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 11, 2019 at 10:43 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Wed, Sep 11, 2019 at 02:01:59PM -0700, Nick Desaulniers wrote:
> > On Wed, Sep 11, 2019 at 11:21 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > r370454 gives LLVM the ability to convert certain loops into a reference
> > > to bcmp as an optimization; this breaks prom_init_check.sh:
> > >
> > >   CALL    arch/powerpc/kernel/prom_init_check.sh
> > > Error: External symbol 'bcmp' referenced from prom_init.c
> > > make[2]: *** [arch/powerpc/kernel/Makefile:196: prom_init_check] Error 1
> > >
> > > bcmp is defined in lib/string.c as a wrapper for memcmp so this could be
> > > added to the whitelist. However, commit 450e7dd4001f ("powerpc/prom_init:
> > > don't use string functions from lib/") copied memcmp as prom_memcmp to
> > > avoid KASAN instrumentation so having bcmp be resolved to regular memcmp
> > > would break that assumption. Furthermore, because the compiler is the
> > > one that inserted bcmp, we cannot provide something like prom_bcmp.
> > >
> > > To prevent LLVM from being clever with optimizations like this, use
> > > -ffreestanding to tell LLVM we are not hosted so it is not free to make
> > > transformations like this.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/647
> > > Link: https://github.com/llvm/llvm-project/commit/5c9f3cfec78f9e9ae013de9a0d092a68e3e79e002
> >
> > The above link doesn't work for me (HTTP 404).  PEBKAC?
> > https://github.com/llvm/llvm-project/commit/5c9f3cfec78f9e9ae013de9a0d092a68e3e79e002
>
> Not really sure how an extra 2 got added on the end of that... Must have
> screwed up in vim somehow.
>
> Link: https://github.com/llvm/llvm-project/commit/5c9f3cfec78f9e9ae013de9a0d092a68e3e79e00

That looks better.  Assuming Michael doesn't mind amending the link
when applying:
Reviewed-by: Nick Desaulneris <ndesaulniers@google.com>

>
> I can resend unless the maintainer is able to fix that up when it gets
> applied.
>
> Cheers,
> Nathan



-- 
Thanks,
~Nick Desaulniers
