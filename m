Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAED6FEAC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 06:36:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGzcn5CwYz3fLc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 14:36:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RNxRw3AE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RNxRw3AE;
	dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGzbs0WrFz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 14:35:51 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-ba65a4f502fso1797526276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 21:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683779748; x=1686371748;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+p7cDTQzCuKi1QAFDlX+tde47HjymadRIrRiXpBnjrE=;
        b=RNxRw3AER9+L5QAQHv+p6mRvl+kLRPDjAKnUfRCQOcDelCmEsaqcsoNCZ9z6jDnrrF
         1dGvlmTRCSz6GivkNmP4B8tOGOOSq6Wt3W4n6WYv2A/10cBkSKHBqKgYZ1kIdqfRxRv2
         b6/PqCtdX4ix7yNCLa/PS5e6wv2Gw1YtT/EuoE2wpe5IJsk/tNbOekNlZ2HocnjPlgpj
         lSA1YwTzKnLyqwSgSKCOk/yYtynRYu60PUe/zpxP112dZ3XnJoa/QQJP9/l4IL72dAw3
         efPluGkJmhM0YEv05bCCm1C2B3NBAmU0VrOlKGR25w8Huvmiap7lbD8JzalsqF5imjPe
         EiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683779748; x=1686371748;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+p7cDTQzCuKi1QAFDlX+tde47HjymadRIrRiXpBnjrE=;
        b=ejSkiGtZ51MECcFaW+YSRiIV8TW0PZI3ZcThegSNn+heVzihE9cYSURXl5oXvJK2G5
         pTpyTY4iQIXPhbXNzvwNzStayNwBv/yx0OzNMD774sl/mYwodST/s7n7xoZnXf6OOpPm
         lEDAxaexkgZbqvU04yyAP8sgYIUj2y0MdXJdtLSaZVaA5ZOJ5gY+UuZTFB7k0V41wWst
         sQtk9toF4PILXsk+KLrN34JcPOn7dQG8ykWhe8HOeNsajAmqt+I/4lT4V2DuD5hzQ6We
         UYcmAn+4nqxJrrAtxW8GHJkZc0y7a1NvlOi2Y+ljfp3zYl1iMAiP5sggc7BiRCKdamHv
         wu+g==
X-Gm-Message-State: AC+VfDyMH0xqXcimRQsFEGAXnjMUR2ha1uBVe7dW5e/KrRxoHmXVZvK8
	n37Pzg6WLv0zdcvmRrbT+kPWgA==
X-Google-Smtp-Source: ACHHUZ4jNGBbv4gj0OghzQ/5FaHnsUorF/gO/2yZgUAa0GVD52UTO1h980KsCPnjFH9AHSAArpdGLQ==
X-Received: by 2002:a25:4884:0:b0:b9d:fe06:1f5b with SMTP id v126-20020a254884000000b00b9dfe061f5bmr18740294yba.15.1683779748403;
        Wed, 10 May 2023 21:35:48 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id a81-20020a251a54000000b00b7767ca749esm4213494yba.59.2023.05.10.21.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 21:35:47 -0700 (PDT)
Date: Wed, 10 May 2023 21:35:44 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 00/23] arch: allow pte_offset_map[_lock]() to fail
In-Reply-To: <ZFs0k2rrLPH9A/UU@casper.infradead.org>
Message-ID: <d7f3c7b2-25b8-ef66-98a8-43d68f4499f@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <ZFs0k2rrLPH9A/UU@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chr
 is@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 May 2023, Matthew Wilcox wrote:
> On Tue, May 09, 2023 at 09:39:13PM -0700, Hugh Dickins wrote:
> > Two: pte_offset_map() will need to do an rcu_read_lock(), with the
> > corresponding rcu_read_unlock() in pte_unmap().  But most architectures
> > never supported CONFIG_HIGHPTE, so some don't always call pte_unmap()
> > after pte_offset_map(), or have used userspace pte_offset_map() where
> > pte_offset_kernel() is more correct.  No problem in the current tree,
> > but a problem once an rcu_read_unlock() will be needed to keep balance.
> 
> Hi Hugh,
> 
> I shall have to spend some time looking at these patches, but at LSFMM
> just a few hours ago, I proposed and nobody objected to removing
> CONFIG_HIGHPTE.  I don't intend to take action on that consensus
> immediately, so I can certainly wait until your patches are applied, but
> if this information simplifies what you're doing, feel free to act on it.

Thanks a lot, Matthew: very considerate, as usual.

Yes, I did see your "Whither Highmem?" (wither highmem!) proposal on the
list, and it did make me think, better get these patches and preview out
soon, before you get to vanish pte_unmap() altogether.  HIGHMEM or not,
HIGHPTE or not, I think pte_offset_map() and pte_unmap() still have an
important role to play.

I don't really understand why you're going down a remove-CONFIG_HIGHPTE
route: I thought you were motivated by the awkardness of kmap on large
folios; but I don't see how removing HIGHPTE helps with that at all
(unless you have a "large page tables" effort in mind, but I doubt it).

But I've no investment in CONFIG_HIGHPTE if people think now is the
time to remove it: I disagree, but wouldn't miss it myself - so long
as you leave pte_offset_map() and pte_unmap() (under whatever names).

I don't think removing CONFIG_HIGHPTE will simplify what I'm doing.
For a moment it looked like it would: the PAE case is nasty (and our
data centres have not been on PAE for a long time, so it wasn't a
problem I had to face before); and knowing pmd_high must be 0 for a
page table looked like it would help, but now I'm not so sure of that
(hmm, I'm changing my mind again as I write).

Peter's pmdp_get_lockless() does rely for complete correctness on
interrupts being disabled, and I suspect that I may be forced in the
PAE case to do so briefly; but detest that notion.  For now I'm just
deferring it, hoping for a better idea before third series finalized.

I mention this (and Cc Peter) in passing: don't want this arch thread
to go down into that rabbit hole: we can start a fresh thread on it if
you wish, but right now my priority is commit messages for the second
series, rather than solving (or even detailing) the PAE problem.

Hugh
