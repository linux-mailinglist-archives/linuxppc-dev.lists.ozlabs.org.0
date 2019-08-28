Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B54CA0D7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 00:21:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JgFS6qyJzDrJB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 08:21:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jXn6+gJp"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jg7k4pLzzDrJf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 08:16:34 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n9so459503pgc.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 15:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cI7lPiUMiKomeyCUPJV8+wea36GrOdMvUW16YwohpL4=;
 b=jXn6+gJpaxbVNRJosKVFyJhneE9YA5zZwsY8f08DrvC0jdN8yLLcVGCWMK2MI3asR4
 mR/w63vTs01x2zv23z7+ENGGZQxl5lP0L7IswMDFJOeF+PfFa5XufKp3POnqA+d+T6gY
 iU+oHtm3aswQz2vouOHL+N524tw8/MB11zHdlBgBdRzuAh47R8nLGjf1MN97LAs8TJRe
 t/WglKh0C6Rjvv9Re03vW31Joo/EvEeqi4mSkOvC7ypSmqITd1jZJvKuBnm7iaOIvEcf
 ItToIAbDhJ7/bc4XNow2l99yUWnAB+lmrvfN0Ccw9w/MiRJ2uXkTq0B2GJ7+NypqqmIG
 MYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cI7lPiUMiKomeyCUPJV8+wea36GrOdMvUW16YwohpL4=;
 b=HB4ujUkYFquIRKm1GDVYQ0fEtMqcEDngiVIx/u/RVxuGSi4fUcaxwb/O0HDfdZROxO
 pAh6Pez0OJgdJyr9d3Z1vydKDF/v5yBIXwqtSkxTMcZWcLRyFLA4WduMWE8oRG7dDpFF
 7rZaNm9xrH/0tjnV60cJGX7FdTQkHg7ACv4Ss8opduyaFf3dEKZ0G/L9qaKeuizqKRAM
 s3M2GpkBmJSsoTpeZM1IHbUMykAYyfop04pxAtuWG8gtku/HYsFuAsmJfdGd+N+tdtZf
 C0dFl+Jwxs3XvHCr8K86++Q3zUvfDZmqKhVV4npTP9N4l4XmTBZp82qIX0TIri4farxk
 Yotw==
X-Gm-Message-State: APjAAAVd+gHI4Dk8TproQN5YGUbZAnLe5qJPDPphb2QNHf28kpIBP2MN
 eXZP6EDJL5uB8U78IjK+aFkosAltcc0qYvAoRMiOBw==
X-Google-Smtp-Source: APXvYqzuyqHfthUYWwSiGUlecSwGfmshq015FiqdVWTRGOTXZRuEO4B0tLgZTFnI+YVgOwfSzB5KTyCLaEyT79V8AoY=
X-Received: by 2002:a65:690b:: with SMTP id s11mr3546456pgq.10.1567030590292; 
 Wed, 28 Aug 2019 15:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190812023214.107817-1-natechancellor@gmail.com>
 <878srdv206.fsf@mpe.ellerman.id.au>
 <20190828175322.GA121833@archlinux-threadripper>
 <CAKwvOdmXbYrR6n-cxKt3XxkE4Lmj0sSoZBUtHVb0V2LTUFHmug@mail.gmail.com>
 <20190828184529.GC127646@archlinux-threadripper>
In-Reply-To: <20190828184529.GC127646@archlinux-threadripper>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Aug 2019 15:16:19 -0700
Message-ID: <CAKwvOd=wdscd7smcKZk40zD_n1OUVkhYYd7ZnoK8r1Y+pkvYVg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 28, 2019 at 11:45 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 11:01:14AM -0700, Nick Desaulniers wrote:
> > On Wed, Aug 28, 2019 at 10:53 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > Yes, I don't think this would be unreasonable. Are you referring to the
> > > cc-disable-warning flags or the -fno-builtin flags? I personally think
> > > the -fno-builtin flags convey to clang what the kernel is intending to
> > > do better than disabling the warnings outright.
> >
> > The `-f` family of flags have dire implications for codegen, I'd
> > really prefer we think long and hard before adding/removing them to
> > suppress warnings.  I don't think it's a solution for this particular
> > problem.
>
> I am fine with whatever approach gets this warning fixed to the
> maintainer's satisfaction...
>
> However, I think that -fno-builtin-* would be appropriate here because
> we are providing our own setjmp implementation, meaning clang should not
> be trying to do anything with the builtin implementation like building a
> declaration for it.

That's a good reason IMO.  IIRC, the -fno-builtin-* flags don't warn
if * is some unrecognized value, so -fno-builtin-setjmp may not
actually do anything, and you may need to scan the source (of clang or
llvm).

-- 
Thanks,
~Nick Desaulniers
