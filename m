Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E061B150
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 09:41:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452Xnq4q3czDqGb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 17:41:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=dvyukov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SZjZHRBa"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452Xln4jYDzDqDy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 17:39:59 +1000 (AEST)
Received: by mail-it1-x144.google.com with SMTP id q65so18747585itg.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 00:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OCBAgYZcl/Mx9I9kBUc9k0z+VS+2s/+/8BKjMe5L/4M=;
 b=SZjZHRBaI2LN21jyRT5EZkLIQdXHRrkgReZnW+swFod0bdKDie3+g+WGtklY0kC311
 D1KKaZ2x7uQDR0V2qnPwQzvKPDzqAA94Zpm8YHT/sOwgUG6HPRnEqu85XA+O1k0sypE5
 bbop+wUKsZ4yMehyLmsJ9459MhRGj3LYgqRz4uO/ypZ8wYUyM8rWxxtLJhVeYmIoNPzJ
 P0BGjN9KPs18zjGreU5S/Jg8qeugpnE19O6Fjj/RYomOU65m0ow3YaAVxRMZqaRgh++4
 kfjbw31MpcBw/JJVWa6iRCoFOI7x3lquY0Qvqmfqv/Cd/3KZ+WPUFvwRRIVAPicbMYQz
 mSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCBAgYZcl/Mx9I9kBUc9k0z+VS+2s/+/8BKjMe5L/4M=;
 b=QB355s5eRw1qJzFFgZYsjUkTolLQ1SXLfRjcTf77fQvPT0CjNcNvfLwIrchDyk5Ny8
 UFamrJy+xOSP+Glm8Ex+WeIXvvWO7lbjXILLJ97L+LDBAfY9m1J7hSO3WJeSbNqqrCgy
 RDfHbAAnlfnosvW5UQBsGzeihzW0uSbjOA3wNiCXLG9VSwou2+RVjSmJ2Y+Mv9gz2taG
 NKLNjSWxkUvLsR32YnT7BI9c+JnZX4aZ3a8NhDq7tjf8/TkQt2Mi+yV79CdVof2l5RtL
 MQSdhqtaT/tyInMHyBXNk9vEtEvfD5th4HRjgkpDRE1Pznm3tiOwLv5rrTnbJpnP6mRC
 pFvQ==
X-Gm-Message-State: APjAAAWjqnSTNtCCNEARQsxN3snOMuYGLvlvF2pK9NW+tdT5oSeV9D1y
 Q8mK1UykBcJ69aUJRAVSpWapU3rAoIy5eL9viStr1A==
X-Google-Smtp-Source: APXvYqx3ThZE+Yj0kNbVwe1j3uegPjtZ90tj9AYcwjCq3pZNd6Fh+sqbqj1PKRwpmit1sNvknwuQU89gTtGOhYZrWFU=
X-Received: by 2002:a05:660c:10f:: with SMTP id
 w15mr11634340itj.166.1557733196690; 
 Mon, 13 May 2019 00:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190412143538.11780-1-hch@lst.de>
 <CAK8P3a2bg9YkbNpAb9uZkXLFZ3juCmmbF7cRw+Dm9ZiLFno2OQ@mail.gmail.com>
 <fd59e6e22594f740eaf86abad76ee04d@mailhost.ics.forth.gr>
 <CACT4Y+aKGKm9Wbc1owBr51adkbesHP_Z81pBAoZ5HmJ+uZdsaw@mail.gmail.com>
 <CAK8P3a3xRBZrgv16sSigJhY0vGmb=qF9o=6dC_5DqAJtW3qPGQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3xRBZrgv16sSigJhY0vGmb=qF9o=6dC_5DqAJtW3qPGQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 13 May 2019 09:39:45 +0200
Message-ID: <CACT4Y+ad5z6z0Dweh5hGwYcUUebPEtqsznmX9enPvYB20J16aA@mail.gmail.com>
Subject: Re: [PATCH, RFC] byteorder: sanity check toolchain vs kernel endianess
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, May 11, 2019 at 2:51 AM
To: Dmitry Vyukov
Cc: Nick Kossifidis, Christoph Hellwig, Linus Torvalds, Andrew Morton,
linux-arch, Linux Kernel Mailing List, linuxppc-dev

> On Fri, May 10, 2019 at 6:53 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > >
> > > I think it's good to have a sanity check in-place for consistency.
> >
> >
> > Hi,
> >
> > This broke our cross-builds from x86. I am using:
> >
> > $ powerpc64le-linux-gnu-gcc --version
> > powerpc64le-linux-gnu-gcc (Debian 7.2.0-7) 7.2.0
> >
> > and it says that it's little-endian somehow:
> >
> > $ powerpc64le-linux-gnu-gcc -dM -E - < /dev/null | grep BYTE_ORDER
> > #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> >
> > Is it broke compiler? Or I always hold it wrong? Is there some
> > additional flag I need to add?
>
> It looks like a bug in the kernel Makefiles to me. powerpc32 is always
> big-endian,
> powerpc64 used to be big-endian but is now usually little-endian. There are
> often three separate toolchains that default to the respective user
> space targets
> (ppc32be, ppc64be, ppc64le), but generally you should be able to build
> any of the
> three kernel configurations with any of those compilers, and have the Makefile
> pass the correct -m32/-m64/-mbig-endian/-mlittle-endian command line options
> depending on the kernel configuration. It seems that this is not happening
> here. I have not checked why, but if this is the problem, it should be
> easy enough
> to figure out.


Thanks! This clears a lot.
This may be a bug in our magic as we try to build kernel files outside
of make with own flags (required to extract parts of kernel
interfaces).
So don't spend time looking for the Makefile bugs yet.
