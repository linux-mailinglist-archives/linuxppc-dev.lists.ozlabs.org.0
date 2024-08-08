Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB8494C64F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 23:32:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TPNOSpgx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg0cL6H5Zz2yJL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 07:32:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TPNOSpgx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3ktm1zgykdkweqmzvosaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wg0bg5JPdz2xQL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 07:31:26 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso1238280a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 14:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723152681; x=1723757481; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YuGkjDtUlaXTtwi32m/glrLrjhcbyitEhoCA9sFmL3A=;
        b=TPNOSpgxzGfLNz/mHBoH0HsNlKmpF1f8quC0KIjerana5YiMGgTHpK4uYUt8wLVdHN
         r/wBkV83JVEftigeB0T06kkw3xAGgIkV6RmkC8IZXcFqztUfr+8Q7ZGurtIcCkZ9hDli
         WJvELIA5iYP6hEJpMpofBQvAXcqsZnnsR3Gw45M/3PaaTiYImemzxvpoCuYR02TyNgh8
         Dj3pyHinGZ7EXx+V5qiXF/e/5Rn721ClTqI2gOERFlzWvvDuFEam2PC8ZwfpNbE0vQ9h
         BA1RL9MLSWq6xPYlch5ge+IquOMPaHfoDWSSHPMOoUTTNO+2ZUbqSyxqYD1IYW0MREDo
         y8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723152681; x=1723757481;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YuGkjDtUlaXTtwi32m/glrLrjhcbyitEhoCA9sFmL3A=;
        b=Zy8wyE38IbgippbIGx9pn2EoCPiKY8mVxRPXGz5Bsk3TaaxwBdTs/mLN7Iuxe0CQIj
         5BfgWtDUgFwlopnjVaK18HoGlDGKsZA423JZHL7Wc3Djq+Us8trKBe29r5ZSUbqeSWD2
         YQGOoFnXpmNZ5C9SLDatH03HuD6bY1HWVdF7O+0Qwkcg0aqZURhst45RnuinFVfxwzN/
         e5i1qmevjtSD3IJg59VqkQFWSZ8PfS9XsXZhwBjF1mxVq/9ZDljWOPYzRgbhoiL/A0wP
         3q05VonMKsL3VYnVICuy6UwV6V8gvzSTwhVSEh950+v1TRuWIIHxsxQ7KjEJErrNYeLh
         9BqA==
X-Forwarded-Encrypted: i=1; AJvYcCX/l51MuRQZ72nOiwULKswNm7G3ekagaoo9v2xQojqIbv6bQ1BaAy36rihxVKYfv4QqQmTtWtovhP5NnNlJoALrX/qQwFmd8yLIJfP7Nw==
X-Gm-Message-State: AOJu0Yw3SHSiKPdPz6MD7zcNzN4S3Hpj8+rWRLkJUiCajoo7lF17VxI1
	T7+Z/laysfKs2siJVVQJTgNVFkIUGFFmbpqf9pemd3I2T+x5525ajHocuUJDf17ophnltJXGIqz
	fEA==
X-Google-Smtp-Source: AGHT+IEP73Lm+ojwFY0B1vludlYBr1Am2NVgxUI9/0Rde9EmSF7EgK1uLnCg73xCWYIY67KH9l4Ygd6Hklk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:6685:0:b0:7a1:1b9f:2b16 with SMTP id
 41be03b00d2f7-7c268c1d3d2mr6887a12.2.1723152681108; Thu, 08 Aug 2024 14:31:21
 -0700 (PDT)
Date: Thu, 8 Aug 2024 14:31:19 -0700
In-Reply-To: <ZrU20AqADICwwmCy@x1n>
Mime-Version: 1.0
References: <20240807194812.819412-1-peterx@redhat.com> <20240807194812.819412-3-peterx@redhat.com>
 <ZrTlZ4vZ74sK8Ydd@google.com> <ZrU20AqADICwwmCy@x1n>
Message-ID: <ZrU5JyjIa1CwZ_KD@google.com>
Subject: Re: [PATCH v4 2/7] mm/mprotect: Push mmu notifier to PUDs
From: Sean Christopherson <seanjc@google.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, David Rientjes <rientjes@google.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 08, 2024, Peter Xu wrote:
> Hi, Sean,
> 
> On Thu, Aug 08, 2024 at 08:33:59AM -0700, Sean Christopherson wrote:
> > On Wed, Aug 07, 2024, Peter Xu wrote:
> > > mprotect() does mmu notifiers in PMD levels.  It's there since 2014 of
> > > commit a5338093bfb4 ("mm: move mmu notifier call from change_protection to
> > > change_pmd_range").
> > > 
> > > At that time, the issue was that NUMA balancing can be applied on a huge
> > > range of VM memory, even if nothing was populated.  The notification can be
> > > avoided in this case if no valid pmd detected, which includes either THP or
> > > a PTE pgtable page.
> > > 
> > > Now to pave way for PUD handling, this isn't enough.  We need to generate
> > > mmu notifications even on PUD entries properly.  mprotect() is currently
> > > broken on PUD (e.g., one can easily trigger kernel error with dax 1G
> > > mappings already), this is the start to fix it.
> > > 
> > > To fix that, this patch proposes to push such notifications to the PUD
> > > layers.
> > > 
> > > There is risk on regressing the problem Rik wanted to resolve before, but I
> > > think it shouldn't really happen, and I still chose this solution because
> > > of a few reasons:
> > > 
> > >   1) Consider a large VM that should definitely contain more than GBs of
> > >   memory, it's highly likely that PUDs are also none.  In this case there
> > 
> > I don't follow this.  Did you mean to say it's highly likely that PUDs are *NOT*
> > none?
> 
> I did mean the original wordings.
> 
> Note that in the previous case Rik worked on, it's about a mostly empty VM
> got NUMA hint applied.  So I did mean "PUDs are also none" here, with the
> hope that when the numa hint applies on any part of the unpopulated guest
> memory, it'll find nothing in PUDs. Here it's mostly not about a huge PUD
> mapping as long as the guest memory is not backed by DAX (since only DAX
> supports 1G huge pud so far, while hugetlb has its own path here in
> mprotect, so it must be things like anon or shmem), but a PUD entry that
> contains pmd pgtables.  For that part, I was trying to justify "no pmd
> pgtable installed" with the fact that "a large VM that should definitely
> contain more than GBs of memory", it means the PUD range should hopefully
> never been accessed, so even the pmd pgtable entry should be missing.

Ah, now I get what you were saying.

Problem is, walking the rmaps for the shadow MMU doesn't benefit (much) from
empty PUDs, because KVM needs to blindly walk the rmaps for every gfn covered by
the PUD to see if there are any SPTEs in any shadow MMUs mapping that gfn.  And
that walk is done without ever yielding, which I suspect is the source of the
soft lockups of yore.

And there's no way around that conundrum (walking rmaps), at least not without a
major rewrite in KVM.  In a nested TDP scenario, KVM's stage-2 page tables (for
L2) key off of L2 gfns, not L1 gfns, and so the only way to find mappings is
through the rmaps.
