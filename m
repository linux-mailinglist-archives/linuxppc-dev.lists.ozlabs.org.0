Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1508238BF24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:14:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmbsn6hkZz3cGC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 16:14:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ZcDfkX6D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=ZcDfkX6D; 
 dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbsG5tvvz2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 16:13:54 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id s25so22583896ljo.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JYeTnt817j0hDOsZg2+6QbAqKD9XseJ4wF7q34isKW0=;
 b=ZcDfkX6DiOjHo/ORJtlZsNPW3AhYiDjdZv3t2+5SASSeC3nXlV3uPxfkE1ZzgFGi7n
 QP3Etv5YCRCh3Mk1agO/XzUjJQ/5zQ030ZiFzpg0YzWVlRUbdXyrgWvYRnu1xLwm4PWT
 1FT1Cxm2cKaLXtGFxz2BVR6Q9tQIL3TmwHeJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JYeTnt817j0hDOsZg2+6QbAqKD9XseJ4wF7q34isKW0=;
 b=phLF08dQGe4iTOYWwyxAdrEZFsntuGlhvLcd5JyxNA9qt24HaB4eHYTKh9W+7zwKx6
 M8Wm+hBTTauCMEqTDawWd+AunMQMxzxe1R9ZtR7Iz0GNUOOp4zXlvhECCF7YH4kcdjOn
 7Lfv4QTGVGG9WnEHVskr9VdkwJ3pQ0w7rNj204boazqjrbzbhErqkxdlikDf6Z0ial6R
 KeXh4/epv7bZAVK+F70t4KNZLcsknMZqaOo1mDmKl5Lc2PuONs8QIQcKTnDIo5bi4+O2
 0yuyR/046gW3bOx5ko7m45bD80MT7NjNtxm0s+S0iW3V1tkiXKsJdEzQWTjz+TGOuHsv
 MAeQ==
X-Gm-Message-State: AOAM5335DW2iQ8qsM1gNDG0JUpQumBBg0LLMWgXz80BjdKOvListsecA
 S8zmlG6f+mxhFxrwqV0vd3eFVkq0DainPX3A
X-Google-Smtp-Source: ABdhPJybosm86UNyha/BbNnH4D5yfZIjDL8WuaPCxbWEflc/dvFAT4zf7ptoChzWwLfZPZy1+Uj8Cg==
X-Received: by 2002:a2e:b0d0:: with SMTP id g16mr5793206ljl.390.1621577629777; 
 Thu, 20 May 2021 23:13:49 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id v1sm518670lfg.141.2021.05.20.23.13.48
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 23:13:49 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id a2so27973359lfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:13:48 -0700 (PDT)
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr1012167lfp.201.1621577628649; 
 Thu, 20 May 2021 23:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
 <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
 <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
In-Reply-To: <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 May 2021 20:13:32 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com>
Message-ID: <CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 5:03 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 5/21/21 8:10 AM, Linus Torvalds wrote:
> >
> > So mremap does need to flush the TLB before releasing the page table
> > lock, because that's the lifetime boundary for the page that got
> > moved.
>
> How will we avoid that happening with
> c49dd340180260c6239e453263a9a244da9a7c85 /
> 2c91bd4a4e2e530582d6fd643ea7b86b27907151 . The commit improves mremap
> performance by moving level3/level2 page table entries. When doing so we
> are not holding level 4 ptl lock (pte_lock()). But rather we are holding
> pmd_lock or pud_lock(). So if we move pages around without holding the
> pte lock, won't the above issue happen even if we do a tlb flush with
> holding pmd lock/pud lock?

Hmm. Interesting.

Your patch (to flush the TLB after clearing the old location, and
before inserting it into the new one) looks like an "obvious" fix.

But I'm putting that "obvious" in quotes, because I'm now wondering if
it actually fixes anything.

Lookie here:

 - CPU1 does a mremap of a pmd or pud.

    It clears the old pmd/pud, flushes the old TLB range, and then
inserts the pmd/pud at the new location.

 - CPU2 does a page shrinker, which calls try_to_unmap, which calls
try_to_unmap_one.

These are entirely asynchronous, because they have no shared lock. The
mremap uses the pmd lock, the try_to_unmap_one() does the rmap walk,
which does the pte lock.

Now, imagine that the following ordering happens with the two
operations above, and a CPU3 that does accesses:

 - CPU2 follows (and sees) the old page tables in the old location and
the took the pte lock

 - the mremap on CPU1 starts - cleared the old pmd, flushed the tlb,
*and* inserts in the new place.

 - a user thread on CPU3 accesses the new location and fills the TLB
of the *new* address

 - only now does CPU2 get to the "pte_get_and_clear()" to remove one page

 - CPU2 does a TLB flush and frees the page

End result:

 - both CPU1 _and_ CPU2 have flushed the TLB.

 - but both flushed the *OLD* address

 - the page is freed

 - CPU3 still has the stale TLB entry pointing to the page that is now
free and might be reused for something else

Am I missing something?

               Linus
