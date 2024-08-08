Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F54794C189
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:34:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rwXexRm6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfrh215gsz2yNP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 01:34:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rwXexRm6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3aew0zgykdeqykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfrgJ1MwHz2xYp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 01:34:04 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d1831ae05so1036736b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 08:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723131241; x=1723736041; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ0wde8if6L/uO3sLYu5HFWeUlZmqm4xvJMbv4zJJuU=;
        b=rwXexRm60iCIyC5lDjFsNpgH6CzELNEA/oAlQQhwA0sdsZFOZdotuc/yXVVxPV6GB4
         xRR2K2nV169k9qz1yORSEM7G04auA/Kr2J8ucdlOYGXkgOuWxhxJBQdTtgnezKSzlGHV
         Cyzd9QhGzE+deGt5iLxPTpQOm1uQbTWenJ4bweMmJfZ6Kovr4zDYHbe5oR/ckazKQ24y
         p+jUnMsufl7MH4UBBa70YXgwCujn5/iVZOV5hkNq4gXRBVs6n4+CXMqIB3wplDLuixBY
         fyF5CCqhuT4pphLiCasDMW51GBR0jCi+l4cDumTi8dLtZCiHkgV+bmzBfwbFkCGljzXw
         vAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723131241; x=1723736041;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ0wde8if6L/uO3sLYu5HFWeUlZmqm4xvJMbv4zJJuU=;
        b=nS3iN0z3mqnyBldyi5cT4QDfMOibVIdwCb6aVso4lZim8z7XAFpwTWcNSLRPMi42sG
         24mCoy/185P4LHsCOqqXy7H8lnT8PeLz3N0GKjhXpk2twsNXEb9HtN1/mYLvN1c6Dis7
         It1ROdjiGXP1JfeHOLiO3M2ZxoEi6svwbju8s5mql3u8QDoL8F/fe62GSeKxn4/FjmyP
         /9jSqW7rBrRdbFApLldd+1mbce1myNqH/o2clK0dW/dkmHg1mlPCskr1CqgK3c9fEimW
         /BzjnKEWOjrJbdBFfxHZvKm7dRiPY3EgRg5SBCIqKCapIINg+elNpHjsaiOixDjHTA7f
         nJqA==
X-Forwarded-Encrypted: i=1; AJvYcCWzbWXQYNxK7we3fPke2TuOdhppEzwwnAqe91s5+Gn6p0qqjDss4m9d6TLqHildb66ZAF7617yR4ER/hi2KYgIh8FFbAyhLib8BNwSFig==
X-Gm-Message-State: AOJu0YxW/L7a61UVm/2lX7oiGW2CT0zWovgEDfpRMV3E4hN7IXzJWHHr
	EYrS8HCSO0bk7rKcQsAU7Kkk4fQ5iBu8ye3x7S/+QHEZqdIsblKXFoQMcsG5WGaIfgMr4gWXMx7
	EDg==
X-Google-Smtp-Source: AGHT+IFW12G/8DTseTogt5MhAKcrgi/3fN+1gRYM4X6/jrZk3eDJGH2Gd3Qqt40eZzOvum4F7HsKf9TeReU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f25:b0:70d:3548:bb59 with SMTP id
 d2e1a72fcca58-710caf2dba9mr8014b3a.4.1723131241056; Thu, 08 Aug 2024 08:34:01
 -0700 (PDT)
Date: Thu, 8 Aug 2024 08:33:59 -0700
In-Reply-To: <20240807194812.819412-3-peterx@redhat.com>
Mime-Version: 1.0
References: <20240807194812.819412-1-peterx@redhat.com> <20240807194812.819412-3-peterx@redhat.com>
Message-ID: <ZrTlZ4vZ74sK8Ydd@google.com>
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

On Wed, Aug 07, 2024, Peter Xu wrote:
> mprotect() does mmu notifiers in PMD levels.  It's there since 2014 of
> commit a5338093bfb4 ("mm: move mmu notifier call from change_protection to
> change_pmd_range").
> 
> At that time, the issue was that NUMA balancing can be applied on a huge
> range of VM memory, even if nothing was populated.  The notification can be
> avoided in this case if no valid pmd detected, which includes either THP or
> a PTE pgtable page.
> 
> Now to pave way for PUD handling, this isn't enough.  We need to generate
> mmu notifications even on PUD entries properly.  mprotect() is currently
> broken on PUD (e.g., one can easily trigger kernel error with dax 1G
> mappings already), this is the start to fix it.
> 
> To fix that, this patch proposes to push such notifications to the PUD
> layers.
> 
> There is risk on regressing the problem Rik wanted to resolve before, but I
> think it shouldn't really happen, and I still chose this solution because
> of a few reasons:
> 
>   1) Consider a large VM that should definitely contain more than GBs of
>   memory, it's highly likely that PUDs are also none.  In this case there

I don't follow this.  Did you mean to say it's highly likely that PUDs are *NOT*
none?

>   will have no regression.
> 
>   2) KVM has evolved a lot over the years to get rid of rmap walks, which
>   might be the major cause of the previous soft-lockup.  At least TDP MMU
>   already got rid of rmap as long as not nested (which should be the major
>   use case, IIUC), then the TDP MMU pgtable walker will simply see empty VM
>   pgtable (e.g. EPT on x86), the invalidation of a full empty region in
>   most cases could be pretty fast now, comparing to 2014.

The TDP MMU will indeed be a-ok.  It only zaps leaf SPTEs in response to
mmu_notifier invalidations, and checks NEED_RESCHED after processing each SPTE,
i.e. KVM won't zap an entire PUD and get stuck processing all its children.

I doubt the shadow MMU will fair much better than it did years ago though, AFAICT
the relevant code hasn't changed.  E.g. when zapping a large range in response to
an mmu_notifier invalidation, KVM never yields even if blocking is allowed.  That 
said, it is stupidly easy to fix the soft lockup problem in the shadow MMU.  KVM
already has an rmap walk path that plays nice with NEED_RESCHED *and* zaps rmaps,
but because of how things grew organically over the years, KVM never adopted the
cond_resched() logic for the mmu_notifier path.

As a bonus, now the .change_pte() is gone, the only other usage of x86's
kvm_handle_gfn_range() is for the aging mmu_notifiers, and I want to move those
to their own flow too[*], i.e. kvm_handle_gfn_range() in its current form can
be removed entirely.

I'll post a separate series, I don't think it needs to block this work, and I'm
fairly certain I can get this done for 6.12 (shouldn't be a large or scary series,
though I may tack on my lockless aging idea as an RFC).

https://lore.kernel.org/all/Zo137P7BFSxAutL2@google.com
