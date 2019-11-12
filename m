Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A1F9B55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 21:57:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CKnD3QBQzF5jf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 07:57:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="jzJxHJOh";
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CKkr6KcCzF5XW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 07:55:15 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q13so1779923pff.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 12:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p3sGAQxZSRJH4UZHNpIdLrEGYPs7j+wXkkL7B23DozY=;
 b=jzJxHJOhBgrxXGo+3hwTEULMtqhW32uUMjkXF6xooOB4YLF0fDp9kjF2ZcEXOqjPmZ
 wb3eB6O717UcTt+tyAbO8B80zA3u9jbuMXSpdMqJOUrOIw/6tlJouhIZBM+a5PnCN1vj
 lat++UKcoOXZLI/EBlS4RFvn1FgV/ybJGuQ4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p3sGAQxZSRJH4UZHNpIdLrEGYPs7j+wXkkL7B23DozY=;
 b=NPi8Bmsr4zKaBmefEUJkL/4rRExV/cnLpvH7VYTceX0Y4s3h/mtDcenzqgaesGUY8w
 GzkT1Eo1BybMm0rdj+cpG+ACjT1zRrxm5bHSs2xdZUsglHfqiSnD4IcWYGYfl/3kdM+w
 mzvTi4zc2SEG7SxoPgcd+dwDGM3GAIOViN6+r6IPt9xnSInEWY1JrGa3UxrMmTUVvLs5
 Z6f8Mkd/gnXnWrQhbAFZoKc5hA3RWeRO4KU4xm9A+sQhdfW5QzKIVzL96eBd7Y3Iov7l
 COvT3kdqsGOYN4soLjEcb8mN8zo0cFHaZaLrDc4mYv9QIHLdgq6U7cvMLo/mDcmAg8iQ
 R+Sw==
X-Gm-Message-State: APjAAAVxfT0qjne7YDkb7pS9hhwXAeqbs7/yRHN1mjDi/gW5xYQQGSdo
 alzBhB4+CUeWABSu7asla+pJxg==
X-Google-Smtp-Source: APXvYqwhpXomPvDY55lP5tiV27rDluqLmojMV7DK9uMTENiwD2XDmRYC37Ogc+dw1yE3QtfbhDL3ZQ==
X-Received: by 2002:a17:90a:cd03:: with SMTP id
 d3mr9056375pju.137.1573592111764; 
 Tue, 12 Nov 2019 12:55:11 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l74sm11993pje.29.2019.11.12.12.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 12:55:10 -0800 (PST)
Date: Tue, 12 Nov 2019 12:55:09 -0800
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 11/29] vmlinux.lds.h: Replace RODATA with RO_DATA
Message-ID: <201911121252.25720DC6@keescook>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-12-keescook@chromium.org>
 <CAMuHMdXfPyti1wFBb0hhf3CeDSQ=zVv7cV-taeYCmDswMQkXPQ@mail.gmail.com>
 <201911110922.17A2112B0@keescook>
 <CAMuHMdUJ8QPvqf51nVmOg1Zm20SNT7pXR72z=qmco=ecwawZ7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUJ8QPvqf51nVmOg1Zm20SNT7pXR72z=qmco=ecwawZ7A@mail.gmail.com>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Simek <monstr@monstr.eu>,
 the arch/x86 maintainers <x86@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org, Arnd Bergmann <arnd@arndb.de>,
 linux-xtensa@linux-xtensa.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Borislav Petkov <bp@alien8.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 07:08:51PM +0100, Geert Uytterhoeven wrote:
> Hi Kees,
> 
> On Mon, Nov 11, 2019 at 6:23 PM Kees Cook <keescook@chromium.org> wrote:
> > On Mon, Nov 11, 2019 at 05:58:06PM +0100, Geert Uytterhoeven wrote:
> > > On Fri, Oct 11, 2019 at 2:07 AM Kees Cook <keescook@chromium.org> wrote:
> > > > There's no reason to keep the RODATA macro: replace the callers with
> > > > the expected RO_DATA macro.
> > > >
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > > ---
> > > >  arch/alpha/kernel/vmlinux.lds.S      | 2 +-
> > > >  arch/ia64/kernel/vmlinux.lds.S       | 2 +-
> > > >  arch/microblaze/kernel/vmlinux.lds.S | 2 +-
> > > >  arch/mips/kernel/vmlinux.lds.S       | 2 +-
> > > >  arch/um/include/asm/common.lds.S     | 2 +-
> > > >  arch/xtensa/kernel/vmlinux.lds.S     | 2 +-
> > > >  include/asm-generic/vmlinux.lds.h    | 4 +---
> > > >  7 files changed, 7 insertions(+), 9 deletions(-)
> > >
> > > Somehow you missed:
> > >
> > >     arch/m68k/kernel/vmlinux-std.lds:  RODATA
> > >     arch/m68k/kernel/vmlinux-sun3.lds:      RODATA
> >
> > Argh. I've sent a patch; sorry and thanks for catching this. For my own
> > cross-build testing, which defconfig targets will hit these two linker
> > scripts?
> 
> vmlinux-sun3.lds: sun3_defconfig
> vmlinux-std.lds: All other classic 680x0 targets with an MMU, e.g. plain
>                  defconfig aka multi_defconfig.

Excellent, thank you; I've updated my multi-arch build list. :)

-- 
Kees Cook
