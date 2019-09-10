Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8A2AF128
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 20:39:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SYjN33lnzDqsy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 04:39:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EqsljV6R"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SYgc2VJRzF14y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 04:38:02 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id p7so663018wmp.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 11:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Jpk6aWfDsr+wjLXvq2B45mZ3x2l5amVRwHa9kiI1c0I=;
 b=EqsljV6R1Oc8io09+E+9JENgvuhVia+vCgepJpEF5LoHg1IvSODazF1pbnc6Ik5mcZ
 CP41BRoQpdz4FscoDCzm9koKcGOLU4p4HFeLGKc+OxIoDj2cJ3N92wKM9FMkvQHwGpRR
 OKvxvWwVvhdbJkwTMzGQ/cdxuYt704h9RfCiPE4cZIy94+HxnN6UJ4BXvjBHJEf2erGF
 iwE9mckoqYvLxQbzURoSbAMjexskGkQw1khtDcqsd8LivkHoIldnU45INf6I7bbJAg7D
 rhUoDmSy4ogXq7I3GgqCKxV4ZxdOpx7dwnaYmk72vLN85GnC0Lw9R3TMz25sD4qkWi4t
 02rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Jpk6aWfDsr+wjLXvq2B45mZ3x2l5amVRwHa9kiI1c0I=;
 b=U7sJnGTkFdIL1yBDCqbKwrXwOAb57A476c9Sa85qCmwH+8z1IFEOAFLNrHDai1pFIU
 vgQNzqL3zPW02QNDVGkvTwIetf4r6Dl2uwqUrsq1IIJ2MJQmU4NJQJTKDwcMJ6K8RDTz
 1q51YUzpbmSXdN+9rUsM/IvNEKeXb/dZo4RTF6jfip3Uf5gia3WioitMaf0toXuPjkm6
 x0TnBEvuHqsYP9VBY9fdH0rWAeb0yjt8tXBx84G+Iu0ouw0OiKo6rxs+Fcb0DlipBeAg
 4YQDa8fvsSXLiY2RNR3MDDgNtWyHZFJFdnOKQpQ2j7sExpMtdOXNJP+qhdLwKlkmV1WZ
 29cw==
X-Gm-Message-State: APjAAAUAhwQkrm177IpDWB6SJQE9J1x8Ll93Vx9mLCmUXeaYJK8kbdRG
 eyZfdbMWUuh14uF+NKKCIRM=
X-Google-Smtp-Source: APXvYqz0Vt46FkrYxvE8sC2zsou4Fu/K2OM0uY0eeF0c2HkTXA8vITv7APcKVJHnhRDi0P/kPjTb/w==
X-Received: by 2002:a1c:a014:: with SMTP id j20mr165157wme.69.1568140676561;
 Tue, 10 Sep 2019 11:37:56 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id y15sm278829wmj.32.2019.09.10.11.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 11:37:55 -0700 (PDT)
Date: Tue, 10 Sep 2019 11:37:54 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
Message-ID: <20190910183754.GA42190@archlinux-threadripper>
References: <CAKwvOdmXbYrR6n-cxKt3XxkE4Lmj0sSoZBUtHVb0V2LTUFHmug@mail.gmail.com>
 <20190828184529.GC127646@archlinux-threadripper>
 <6801a83ed6d54d95b87a41c57ef6e6b0@AcuMS.aculab.com>
 <20190903055553.GC60296@archlinux-threadripper>
 <20190903193128.GC9749@gate.crashing.org>
 <20190904002401.GA70635@archlinux-threadripper>
 <1bcd7086f3d24dfa82eec03980f30fbc@AcuMS.aculab.com>
 <20190904130135.GN9749@gate.crashing.org>
 <20190904231554.GA42450@archlinux-threadripper>
 <87mufcypf5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mufcypf5.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 LKML <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 David Laight <David.Laight@aculab.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 11, 2019 at 04:30:38AM +1000, Michael Ellerman wrote:
> Nathan Chancellor <natechancellor@gmail.com> writes:
> > On Wed, Sep 04, 2019 at 08:01:35AM -0500, Segher Boessenkool wrote:
> >> On Wed, Sep 04, 2019 at 08:16:45AM +0000, David Laight wrote:
> >> > From: Nathan Chancellor [mailto:natechancellor@gmail.com]
> >> > > Fair enough so I guess we are back to just outright disabling the
> >> > > warning.
> >> > 
> >> > Just disabling the warning won't stop the compiler generating code
> >> > that breaks a 'user' implementation of setjmp().
> >> 
> >> Yeah.  I have a patch (will send in an hour or so) that enables the
> >> "returns_twice" attribute for setjmp (in <asm/setjmp.h>).  In testing
> >> (with GCC trunk) it showed no difference in code generation, but
> >> better save than sorry.
> >> 
> >> It also sets "noreturn" on longjmp, and that *does* help, it saves a
> >> hundred insns or so (all in xmon, no surprise there).
> >> 
> >> I don't think this will make LLVM shut up about this though.  And
> >> technically it is right: the C standard does say that in hosted mode
> >> setjmp is a reserved name and you need to include <setjmp.h> to access
> >> it (not <asm/setjmp.h>).
> >
> > It does not fix the warning, I tested your patch.
> >
> >> So why is the kernel compiled as hosted?  Does adding -ffreestanding
> >> hurt anything?  Is that actually supported on LLVM, on all relevant
> >> versions of it?  Does it shut up the warning there (if not, that would
> >> be an LLVM bug)?
> >
> > It does fix this warning because -ffreestanding implies -fno-builtin,
> > which also solves the warning. LLVM has supported -ffreestanding since
> > at least 3.0.0. There are some parts of the kernel that are compiled
> > with this and it probably should be used in more places but it sounds
> > like there might be some good codegen improvements that are disabled
> > with it:
> >
> > https://lore.kernel.org/lkml/CAHk-=wi-epJZfBHDbKKDZ64us7WkF=LpUfhvYBmZSteO8Q0RAg@mail.gmail.com/
> 
> For xmon.c and crash.c I think using -ffreestanding would be fine.
> They're both crash/debug code, so we don't care about minor optimisation
> differences. If anything we don't want the compiler being too clever
> when generating that code.
> 
> cheers

I will send a v2 later today along with another patch to fix this
warning and another build error.

Cheers,
Nathan
