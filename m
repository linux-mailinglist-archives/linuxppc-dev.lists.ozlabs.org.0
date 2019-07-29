Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0450B79A58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 22:53:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yBjN2TPSzDq6N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 06:53:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CWrSj4PA"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yBd20qtYzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 06:49:25 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id b3so27982288plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BeAeQDMMo4FgxNSctdMcxvraGIHZjszW+IJTyoPT1RE=;
 b=CWrSj4PAwWTQSPVCPG3TLcwCJ3DM5xP4Shb9KQgpIvuSr2j12/FxOg1T7ynQznn8Vb
 NnoJJBOIUi8DMiCBZt6Os3TcHq3Kf96+Yf3FrmAt0XsXHJu8PM6ndSQPgA15IqRW6AXb
 y+TEYLWLvvxQ0eYANsZPVCB9hrqAH8P3aiago5gjqmovM7BypAWxlutXnhdCSRqSKMQp
 r0BCWme6WOS5CYNzdpmDzpJbWu8p3qeYykKCqc3sfgShr2xyiOhDXrQO/pjob6eqzvxb
 C8H5a8Lbs+XUJAZodZkhWNV+bG3Vk3DoGec7ycFlXxKf2TAhk/9RbbueZr1vRO+I8l99
 d4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BeAeQDMMo4FgxNSctdMcxvraGIHZjszW+IJTyoPT1RE=;
 b=YYRTq2/VdoVSEKnZb4stwgyGqPllroCshp6vepi3GJ22hhCqRc23RfLYV7o/wQ7dDv
 UOr9P4E7rcKZS3H3MgOJXqcRrgPzUxU8u6EK3kmuwKWi1TcRmYmv8Ihi4yRX1EHmbR4u
 tWOzQE4ojVrY/s+Q99Qp2Eu5xQxay4ofMbxkiaxMq9+ZaEkclQiUfqvDxycBdfzE/ye6
 JPgXT+3Ne8OC+2//fyc0ZNV0r93eX98aqLhtICezoQOivAQCFlwDZPH8iMuIvYA3Fh3L
 fXWKglYN3jlGCcO8Cx72I7cwbr1blTF1vaXCYT+LxbDyfmM84VADGFQPahKzTNxfOkUj
 Ny/A==
X-Gm-Message-State: APjAAAV541/vB5uisriBDJE+mgh51sV5w/G5Wu20vjKwE4tby1GTscj6
 BpjNh8z6I3txPdVU0ftNcEJV9Nby1jH5Q41PAtxqoJkaJCoVKg==
X-Google-Smtp-Source: APXvYqx/TPPendSyXntwM8oOX2jFzT6bLZe6kftdnHHz7ao2NIGtPPiO9c1dYx2w5iDHFoySsocxwIciXxnEX1de5rw=
X-Received: by 2002:a17:902:e703:: with SMTP id
 co3mr14760295plb.119.1564433362401; 
 Mon, 29 Jul 2019 13:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190729202542.205309-1-ndesaulniers@google.com>
 <20190729203246.GA117371@archlinux-threadripper>
 <CAKwvOdm7GRBWYhPy4Ni2jbsXJp8gDF-AqaAxeLbZ03+LvHxADQ@mail.gmail.com>
 <20190729204755.GA118622@archlinux-threadripper>
In-Reply-To: <20190729204755.GA118622@archlinux-threadripper>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 29 Jul 2019 13:49:11 -0700
Message-ID: <CAKwvOdk13rU=Fyb0BUFCL4ZYATxTNS3YG52ziPcqixfg4r7=gQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: workaround clang codegen bug in dcbz
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
Cc: Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2019 at 1:47 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Jul 29, 2019 at 01:45:35PM -0700, Nick Desaulniers wrote:
> > On Mon, Jul 29, 2019 at 1:32 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > On Mon, Jul 29, 2019 at 01:25:41PM -0700, Nick Desaulniers wrote:
> > > > But I'm not sure how the inlined code generated would be affected.
> > >
> > > For the record:
> > >
> > > https://godbolt.org/z/z57VU7
> > >
> > > This seems consistent with what Michael found so I don't think a revert
> > > is entirely unreasonable.
> >
> > Thanks for debugging/reporting/testing and the Godbolt link which
> > clearly shows that the codegen for out of line versions is no
> > different.  The case I can't comment on is what happens when those
> > `static inline` functions get inlined (maybe the original patch
> > improves those cases?).
> > --
> > Thanks,
> > ~Nick Desaulniers
>
> I'll try to build with various versions of GCC and compare the
> disassembly of the one problematic location that I found and see
> what it looks like.

Also, guess I should have included the tag:
Fixes: 6c5875843b87 ("powerpc: slightly improve cache helpers")
-- 
Thanks,
~Nick Desaulniers
