Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB937311A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 21:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZVxS0snJz30DW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 05:57:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=uk1lUHdu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=uk1lUHdu; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZVwy6shmz2yx4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 05:57:04 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id x19so15102567lfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mw6s2XohgqBEIfIqVR7BYJqyqPXY+TPkZKPNcgefTc0=;
 b=uk1lUHduVqfB52p0w5qh+yWR7Jcovj+7iIvl9eRvoP3yDSQIXfERRLfwNr8nGr+CVn
 kaZKmlFuE+1dcapOpKu3Kk7/YBzwMhF90TZhUFGntJQvLgOTiVitw2kGUqd1TqUeO97F
 4fWitW3ZiRPO89asRrZFb9mlr4yVHh+0HYckDzMXMNdjU6SCRsBIGnPQXaiEsye87gM5
 NP4LjXuAUSb0ZcrCcxDEk3NxXTuNjuvpcoI4qJPkFoyskl1t0ozsT9Jdbyf4g/+zCYpg
 tnJwT3v+0uMCkIa+hXJ091jmYuA4MQEUfI8Dyp2Xz5ZH17A8/NVFewTruCcsc48sH623
 /I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mw6s2XohgqBEIfIqVR7BYJqyqPXY+TPkZKPNcgefTc0=;
 b=Ec16mz8/WsFqk0ca2QMO+kMrZ9Jpgp6qqgD/TX0sm0dLFB5AQarK52kJaPAd7bvUOT
 q0TMehDM+PvmdRo64Qy3GSaQmk2hQQEnlzlWgyR07UVU2fyi82ufS73+k6+IW9Rnoqqi
 0z3+SJKMZXa5VjzfT/HJbcQXgoldQD8W9KhiR6NPQsCzmjEZVLABZQITKilqMZd6A7YL
 NjIQo3i3yNTM1pR4zAeC+QIjuV0kNBFKTLp531DyqrImspMignZMAW2Wk0XMCNp9oFD1
 ajwoxMZ7HC9Pwkkp2fC7NvEJtjm39QIqqgMCEHbsrBALbIFIl+40KGWI3pgyUWpY/nc9
 X7aQ==
X-Gm-Message-State: AOAM5324YqLd4OIqJhrjBomAC3JBbr1N+0zT3RHkaGtkrtbWO4WILeIn
 SvUeVOt9z5IzEz64s12i7Nkhq8JiXQ4U4Zb5anXCSQ==
X-Google-Smtp-Source: ABdhPJzSRjfPxsIpjEl+6iwASpwTUDDphImrump1GAvjTSHZ5fJN0WNOfH+eXLfZLeGPLqY4Fld+6mSkLaL0gGZlF1A=
X-Received: by 2002:ac2:528d:: with SMTP id q13mr9761663lfm.73.1620158218969; 
 Tue, 04 May 2021 12:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210320122227.345427-1-mpe@ellerman.id.au>
 <YIcLcujmoK6Yet9d@archlinux-ax161>
 <de6fc09f-97f5-c934-6393-998ec766b48a@csgroup.eu>
 <CAKwvOd=SkPtOij0tCx=AzUsLD3RrJZBFs0WZKuQJ3c4JM3Nn6Q@mail.gmail.com>
 <CAKwvOd=kU=gOci7y1CjZaKw+w5H3kZ_CfzGG0=r+Fs33hLV4uw@mail.gmail.com>
In-Reply-To: <CAKwvOd=kU=gOci7y1CjZaKw+w5H3kZ_CfzGG0=r+Fs33hLV4uw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 4 May 2021 12:56:47 -0700
Message-ID: <CAKwvOdmdp4GXHabnVWuSvnE+2CZegzdmbeg0TPotM=MFwQ7_GA@mail.gmail.com>
Subject: Re: [PATCH v7] powerpc/irq: Inline call_do_irq() and call_do_softirq()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 30, 2021 at 2:33 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Apr 27, 2021 at 1:42 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Mon, Apr 26, 2021 at 11:39 PM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> > >
> > > As you can see, CLANG doesn't save/restore 'lr' allthought 'lr' is explicitely listed in the
> > > registers clobbered by the inline assembly:
> >
> > Ah, thanks for debugging this. Will follow up in
> > https://bugs.llvm.org/show_bug.cgi?id=50147.
>
> Looks like there's a fix posted for LLVM in: https://reviews.llvm.org/D101657
>
> Though trying to test it in QEMU, I'm hitting some assertion failure
> booting a kernel (even without that patch to LLVM):
> qemu-system-ppc: ../../hw/pci/pci.c:253: pci_bus_change_irq_level:
> Assertion `irq_num >= 0' failed.
> That's with
> QEMU emulator version 5.2.0 (Debian 1:5.2+dfsg-9)
>
> I didn't see anything in https://bugs.launchpad.net/qemu/ about it,
> but figured I'd share in case that assertion failure looked familiar
> to anyone.

Nathan pointed out some previous reports; looks like others are
hitting this, too:
https://github.com/ClangBuiltLinux/linux/issues/1345#issuecomment-830451276


-- 
Thanks,
~Nick Desaulniers
