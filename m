Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF981FFC05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 21:50:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nsxR0llRzDrMr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 05:50:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=O8vGhvfO; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nsv262LKzDrG3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 05:48:45 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id d7so4182708lfi.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 12:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAj23S3Mp6rRGO4SN+Gp5C3WPkcIYgiIEGIXxkjYIf0=;
 b=O8vGhvfOfOq9wLj1E8rP/VwqEBx1zwNPyHW+trZ6ABPefealuQSSUilZwTmE1SLwx3
 zEwIy5hJ4gIay72KjTq2B1QzBGNJ+P/4jwxTdP42XjdJJEBlYBl/eBUwneIpV2J18exN
 a/r+v/+JeACo1IVMd6iMfbPGsYHL+wiwfVYwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAj23S3Mp6rRGO4SN+Gp5C3WPkcIYgiIEGIXxkjYIf0=;
 b=DCIXZDAw1nP8DVrqtv4MgoqkprG0wghOz4dNn1fcQAVBpLk3VQft9t0czidpqi3BC5
 DxAqSBZ9FIV72MYh/BbaVXvgimuV8MBwk6Y2wKFOjNliEkdKTOq3eUkV111yXwNNl0Zg
 pF4fWYaDdZQdpbPenpoyaGgfui2yt55hXKsrn/tHu7o66haTbXbW+RFt5GzyolvT+3gF
 0CTbj7rPdvxaL+pRfBQ36B3X7Tom1ASkyV9wAu+hrRgMjBN0WCt8tGF+Y8jVhjjDk6KG
 x0MTYw2QP8AwWr60WzbyZMWojRRxZufgZB7AAdetBCcKJ5HlghOKDEc4mZe9WKpd1b3M
 QynQ==
X-Gm-Message-State: AOAM531x+a8zLFG8dPfiyaSCB9KOl5PA1Bkwao2KyF1SKJKyoxkJdP8p
 VeCQrRZJ1HFmnZnD7tYwWboTfl89yFw=
X-Google-Smtp-Source: ABdhPJzz7oH/Yk2t/atNV61cPCLvLutqAqlSLQxZUHABM0X9MuDvaw41m3FMA8vpGMx0wYf4pme7mw==
X-Received: by 2002:a19:c797:: with SMTP id x145mr3215350lff.143.1592509720019; 
 Thu, 18 Jun 2020 12:48:40 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id y4sm794376ljd.111.2020.06.18.12.48.38
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 12:48:39 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id n24so8712834lji.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 12:48:38 -0700 (PDT)
X-Received: by 2002:a2e:8e78:: with SMTP id t24mr9039ljk.314.1592509718255;
 Thu, 18 Jun 2020 12:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200617073755.8068-1-hch@lst.de>
In-Reply-To: <20200617073755.8068-1-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 18 Jun 2020 12:48:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpnu=882iD9ck9Ywt6R1LYX_Hv-oS7dBMsWZwDRGZ5jA@mail.gmail.com>
Message-ID: <CAHk-=wjpnu=882iD9ck9Ywt6R1LYX_Hv-oS7dBMsWZwDRGZ5jA@mail.gmail.com>
Subject: Re: rename probe_kernel_* and probe_user_*
To: Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>,
 Tony Luck <tony.luck@intel.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Explicitly added architecture lists and developers to the cc to make
this more visible ]

On Wed, Jun 17, 2020 at 12:38 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Andrew and I decided to drop the patches implementing your suggested
> rename of the probe_kernel_* and probe_user_* helpers from -mm as there
> were way to many conflicts.  After -rc1 might be a good time for this as
> all the conflicts are resolved now.

So I've merged this renaming now, together with my changes to make
'get_kernel_nofault()' look and act a lot more like 'get_user()'.

It just felt wrong (and potentially dangerous) to me to have a
'get_kernel_nofault()' naming that implied semantics that we're all
familiar with from 'get_user()', but acting very differently.

But part of the fixups I made for the type checking are for
architectures where I didn't even compile-test the end result. I
looked at every case individually, and the patch looks sane, but I
could have screwed something up.

Basically, 'get_kernel_nofault()' doesn't do the same automagic type
munging from the pointer to the target that 'get_user()' does, but at
least now it checks that the types are superficially compatible.
There should be build failures if they aren't, but I hopefully fixed
everything up properly for all architectures.

This email is partly to ask people to double-check, but partly just as
a heads-up so that _if_ I screwed something up, you'll have the
background and it won't take you by surprise.

               Linus
