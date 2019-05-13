Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A49191B546
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:51:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452fLD1x2jzDqGG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 21:51:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=dvyukov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RQ6ygksW"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452fJq41SbzDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:50:34 +1000 (AEST)
Received: by mail-it1-x141.google.com with SMTP id q65so19714305itg.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 04:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ghfMy6obv1hrpZpCwIJ2TJb+OktMKKHOCaRgouBZNU=;
 b=RQ6ygksWQIZXg92jHryig/GzewJP/tQhrxquLavPhVBu0Y2wASBIuqsa+HGqF88A6F
 O+rpZdrLF7sxwiQspnZGxb6Y5DPFZTj0I2Nz7vFJshQCpB2PoElVv0MvXbkETGwCwSLe
 HCxPwApZSxtMvzLe4hqx+XfVSbogEkrUeU8wIZ371zkoDF3Rrpe8mJZCOlSV/9H60wUH
 GoIE6K7V+lSdLJb3xjsJpBen0dHq89nE1v6CNMEGE2JQEoDnFef2WlsEvw7JOgZZI1cm
 SLksF16OHOQLUUs/V/xSCRZRWP9YT8ia9aSVG249Txp1MJ2ydmq9/7jNJJcPj9Z7GOZd
 f0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ghfMy6obv1hrpZpCwIJ2TJb+OktMKKHOCaRgouBZNU=;
 b=frtnn8zPadJlrC1Wqy1Avw1SSrk/lJnrvSS2N5zcKqvj1F96YcADcMqN/AbMs/axbm
 5KpcgHpk29QVo4gN8w82AGgA0Y11+MWmAnqBrtNUPq7oNRqVIykvPismCi1yTMNHG5xc
 srqDv+gSDDyguVab9dvNqCzP0rit0QLrJlahg75hEO39kr9Y8WgU70NbKsPHgkLeor3t
 wQ7PzSYU2jP/+XPe9okMfBGC/hZUmttCjt4L8GQjjRndkTnXalucuJ9DCGlVpDKRoTx/
 sNEVd2tUPn/04fBkD8KmB6xVlpkVCvxqy9HOA02PdvCUySyQOPEwTjnElH1WJet9uUl3
 +Dww==
X-Gm-Message-State: APjAAAXPVT9K2+0BErbJ5YPeHC4R2BTaO6+fzzdW4DD7XYzJAayLgZIM
 rnnoE1YRDuKbIXsMnmeB9URzdUxR2UJbYs34OoZutQ==
X-Google-Smtp-Source: APXvYqwCpb/dVYCrrcvfOEBMqYrddeQJKCrNmIoP+Lnj3ljNYuESeWa8kIYaOWHaeDVEpbuKQnDmFYg8XkabJ4V7PyY=
X-Received: by 2002:a02:1384:: with SMTP id 126mr17144580jaz.72.1557748230654; 
 Mon, 13 May 2019 04:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190412143538.11780-1-hch@lst.de>
 <CAK8P3a2bg9YkbNpAb9uZkXLFZ3juCmmbF7cRw+Dm9ZiLFno2OQ@mail.gmail.com>
 <fd59e6e22594f740eaf86abad76ee04d@mailhost.ics.forth.gr>
 <CACT4Y+aKGKm9Wbc1owBr51adkbesHP_Z81pBAoZ5HmJ+uZdsaw@mail.gmail.com>
 <CAK8P3a3xRBZrgv16sSigJhY0vGmb=qF9o=6dC_5DqAJtW3qPGQ@mail.gmail.com>
 <CACT4Y+ad5z6z0Dweh5hGwYcUUebPEtqsznmX9enPvYB20J16aA@mail.gmail.com>
 <87woiutwq4.fsf@concordia.ellerman.id.au>
In-Reply-To: <87woiutwq4.fsf@concordia.ellerman.id.au>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 13 May 2019 13:50:19 +0200
Message-ID: <CACT4Y+YT52wGuARxe9RqUsMYGNZTwaBowWWUUawyqTBq4G1NDg@mail.gmail.com>
Subject: Re: [PATCH, RFC] byteorder: sanity check toolchain vs kernel endianess
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, May 13, 2019 at 1:33 PM
To: Dmitry Vyukov, Arnd Bergmann
Cc: Nick Kossifidis, Christoph Hellwig, Linus Torvalds, Andrew Morton,
linux-arch, Linux Kernel Mailing List, linuxppc-dev

> Dmitry Vyukov <dvyukov@google.com> writes:
> > From: Arnd Bergmann <arnd@arndb.de>
> > Date: Sat, May 11, 2019 at 2:51 AM
> > To: Dmitry Vyukov
> > Cc: Nick Kossifidis, Christoph Hellwig, Linus Torvalds, Andrew Morton,
> > linux-arch, Linux Kernel Mailing List, linuxppc-dev
> >
> >> On Fri, May 10, 2019 at 6:53 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> >> > >
> >> > > I think it's good to have a sanity check in-place for consistency.
> >> >
> >> >
> >> > Hi,
> >> >
> >> > This broke our cross-builds from x86. I am using:
> >> >
> >> > $ powerpc64le-linux-gnu-gcc --version
> >> > powerpc64le-linux-gnu-gcc (Debian 7.2.0-7) 7.2.0
> >> >
> >> > and it says that it's little-endian somehow:
> >> >
> >> > $ powerpc64le-linux-gnu-gcc -dM -E - < /dev/null | grep BYTE_ORDER
> >> > #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> >> >
> >> > Is it broke compiler? Or I always hold it wrong? Is there some
> >> > additional flag I need to add?
> >>
> >> It looks like a bug in the kernel Makefiles to me. powerpc32 is always
> >> big-endian,
> >> powerpc64 used to be big-endian but is now usually little-endian. There are
> >> often three separate toolchains that default to the respective user
> >> space targets
> >> (ppc32be, ppc64be, ppc64le), but generally you should be able to build
> >> any of the
> >> three kernel configurations with any of those compilers, and have the Makefile
> >> pass the correct -m32/-m64/-mbig-endian/-mlittle-endian command line options
> >> depending on the kernel configuration. It seems that this is not happening
> >> here. I have not checked why, but if this is the problem, it should be
> >> easy enough
> >> to figure out.
> >
> >
> > Thanks! This clears a lot.
> > This may be a bug in our magic as we try to build kernel files outside
> > of make with own flags (required to extract parts of kernel
> > interfaces).
> > So don't spend time looking for the Makefile bugs yet.
>
> OK :)
>
> We did have some bugs in the past (~1-2 y/ago) but AFAIK they are all
> fixed now. These days I build most of my kernels with a bi-endian 64-bit
> toolchain, and switching endian without running `make clean` also works.

For the record, yes, it turn out to be a problem in our code (a latent
bug). We actually used host (x86) gcc to build as-if ppc code that can
run on the host, so it defined neither LE no BE macros. It just
happened to work in the past :)
+Andrew
