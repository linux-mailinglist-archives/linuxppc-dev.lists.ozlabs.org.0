Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 127DF264C96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 20:16:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnRsF1fDlzDqY7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 04:16:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=QjySHJ/1; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnRpC2099zDqmF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 04:13:22 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id t20so5586619qtr.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vsgOBuvd+PmHZlIl6zNL7J0E+9iuQlAQQf0cZFL5gMI=;
 b=QjySHJ/1iTMrz5prM8y+VncJt3fFZa9ZyFpYw/Th/jKpZaffgf1LyWVdNJm/j/vjyA
 nLjh8OzRb1c9mhAkanY5btD+efOqZZ+Udi6ZslYCr7YtJIfes2snd5UrIRKpUyv8hkdr
 36M2e6eOhe91VaA9oyoKzmgg9xjBknxyQhh5BZGAXX5wie19agL2HJs44WBmda9L90te
 rB4sfQyqX1cSC/80uyvJQCn48IBDTjUyr7fuRqyi1tok7cmTDWGXQTd1b0rwTzF0s+WH
 TbjL9aVyKRcQ18FE4ZG1EMR1arXpN/YNqyXD5nLN+6IKf2BR7oX+4/YatX70bdzY6jl7
 k0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vsgOBuvd+PmHZlIl6zNL7J0E+9iuQlAQQf0cZFL5gMI=;
 b=bM9avgwy1TyCx0RX2zup5/Fdpi9Q7sK1KGozMR6TyZ3g/HXg+WIzJnQzMBFqTpfIUd
 vKXxGfMVa2tdEqCXavOfG5qA19Xj2FXIge9oj5d8xd9pg2tHFFiNIK1IEF2OwDrz5vFu
 dfv1Rg1GHn+mp1ayGPSbYNuzPB5j7BdZOtEgM6UBjnKo1s4DHkqFRvfgWq9Jvgal2bgL
 dJPxaFAMTDJRHjH+vQSOWqRiPoSF/p2tJCNQIM26itUbl4lvujZLsylQHziZ+AJ/wUdL
 Vv/2XGy83CQiqn4brFhz8d2eRT3Vw35BV3lBV+1CSx7fImcMHxJfti1VU0YtcUb+n+4r
 0tEA==
X-Gm-Message-State: AOAM530M9eJcOpAwHb7/GW2KZy0UFvna/fCZR6StV6eZ+roE+vHsVyPs
 E+zkEUZvHn+om1gq+33fODM1ZA==
X-Google-Smtp-Source: ABdhPJz+K3felhpgzzPG4kmFLTMR9ObyhixIit5uSjGLCBi1hY0YGP7pJ4KyC/qC7hkyspfqqr9PsQ==
X-Received: by 2002:ac8:7108:: with SMTP id z8mr9521321qto.55.1599761600525;
 Thu, 10 Sep 2020 11:13:20 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id c43sm8103713qtk.24.2020.09.10.11.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 11:13:19 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kGR4R-004OkZ-38; Thu, 10 Sep 2020 15:13:19 -0300
Date: Thu, 10 Sep 2020 15:13:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200910181319.GO87483@ziepe.ca>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 10:35:38AM -0700, Linus Torvalds wrote:
> On Thu, Sep 10, 2020 at 2:40 AM Alexander Gordeev
> <agordeev@linux.ibm.com> wrote:
> >
> > It is only gup_fast case that exposes the issue. It hits because
> > pointers to stack copies are passed to gup_pXd_range iterators, not
> > pointers to real page tables itself.
> 
> Can we possibly change fast-gup to not do the stack copies?
>
> I'd actually rather do something like that, than the "addr_end" thing.

> As you say, none of the other page table walking code does what the
> GUP code does, and I don't think it's required.

As I understand it, the requirement is because fast-gup walks without
the page table spinlock, or mmap_sem held so it must READ_ONCE the
*pXX.

It then checks that it is a valid page table pointer, then calls
pXX_offset().

The arch implementation of pXX_offset() derefs again the passed pXX
pointer. So it defeats the READ_ONCE and the 2nd load could observe
something that is no longer a page table pointer and crash.

Passing it the address of the stack value is a way to force
pXX_offset() to use the READ_ONCE result which has already been tested
to be a page table pointer.

Other page walking code that holds the mmap_sem tends to use
pmd_trans_unstable() which solves this problem by injecting a
barrier. The load hidden in pte_offset() after a pmd_trans_unstable()
can't be re-ordered and will only see a page table entry under the
mmap_sem.

However, I think that logic would have been much clearer following the
GUP model of READ_ONCE vs extra reads and a hidden barrier. At least
it took me a long time to work it out :(

I also think there are real bugs here where places are reading *pXX
multiple times without locking the page table. One was found recently
in the wild in the huge tlb code IIRC.

The mm/pagewalk.c has these missing READ_ONCE bugs too.

So.. To change away from the stack option I think we'd have to pass
the READ_ONCE value to pXX_offset() as an extra argument instead of it
derefing the pointer internally.

Jason
