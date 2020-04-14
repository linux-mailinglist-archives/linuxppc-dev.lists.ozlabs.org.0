Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 935031A700D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 02:29:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491RFR5W6dzDqPm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:29:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rientjes@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=lct5lXl+; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491RCs6bSdzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 10:28:03 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id k15so5292634pfh.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 17:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Iab8a1FKfuOAzK+EtN5ksWX3Ch8SBZHLkolYH18vMow=;
 b=lct5lXl+IscuWLrw6XCAopB0jz61pOOckI0TmsidUgK4aX5mFUXIL+srhSrr7xsXiI
 R858On8eqIKqa3BXB4MJdWnfFhKywElGKTmO4z+5bqMcrhqViWsYCBSTHeu5VymTDvXy
 vzDM5SQexLRHSqiZTMW5uVEwHz6m0ToMk5ffxuaUr7dFrUjGIrbFJSlBk8RtMkG1HFta
 e9YzM1vFQZlEpZx+IwYLnAg7oi80UtsWCGSGE9hdWjS2nYrQr6DSDyUzhadbwcYpuzTu
 tfVONL2lwfWuYRw4uqk4mrPTFWRAPc4c1PM/LJ8V399ICf9ZbS1MhBB39wQOxCgx1dGp
 +4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Iab8a1FKfuOAzK+EtN5ksWX3Ch8SBZHLkolYH18vMow=;
 b=oEbqtPiTo0ftfEOWg3+lk83LXGhkBd65p8zYt9D41ZlBAtka+B+5Vs4WeA0zF3t/Rc
 TQR5/7yRjniuOKmCn7AnMl0NzdXh7/aS36w9ZAFg+rXaDBxuXgmgPvtW2mWNUYHv+vQk
 JKEsiVdGTJCQir0zocKUCJo6YLMEfHVB9DoIYJ7lGJdnN/Eikfc7YEmatIUXhyK50cfN
 K4JKoZFfZEvKM9Aye6NbIdIwksWWuB6J7poCHhWKggdtI0xstpttsczVSMW1y6/KmJM+
 rL56nd1K6wBYYvt+gH3Pooe6qd/w00NmQWYCZ5vYIW7h8dOtYKAdcEIA5XUnWrX8XNIe
 qytw==
X-Gm-Message-State: AGi0PuY6+FLY4oSb0J31rgRebXCladolMfNVZP/Ajm2sA5pwOwj8JBzI
 vdBbtUMKcEXnZWcaU7jKtAop0g==
X-Google-Smtp-Source: APiQypLZpjmT/ThpynRDdIZHTO4aZH7CnvngDUK8vlIGwZhBDCAfCPTuSg0ilh9qJ0MLoF72azaR+A==
X-Received: by 2002:a63:5724:: with SMTP id l36mr15697582pgb.366.1586824079677; 
 Mon, 13 Apr 2020 17:27:59 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id 132sm9849909pfc.183.2020.04.13.17.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 17:27:59 -0700 (PDT)
Date: Mon, 13 Apr 2020 17:27:58 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] huge vmalloc mappings
In-Reply-To: <20200413125303.423864-1-npiggin@gmail.com>
Message-ID: <alpine.DEB.2.21.2004131727150.260270@chino.kir.corp.google.com>
References: <20200413125303.423864-1-npiggin@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
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
Cc: linux-arch@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Apr 2020, Nicholas Piggin wrote:

> We can get a significant win with larger mappings for some of the big
> global hashes.
> 
> Since RFC, relevant architectures have added p?d_leaf accessors so no
> real arch changes required, and I changed it not to allocate huge
> mappings for modules and a bunch of other fixes.
> 

Hi Nicholas,

Any performance numbers to share besides the git diff in the last patch in 
the series?  I'm wondering if anything from mmtests or lkp-tests makes 
sense to try?

> Nicholas Piggin (4):
>   mm/vmalloc: fix vmalloc_to_page for huge vmap mappings
>   mm: Move ioremap page table mapping function to mm/
>   mm: HUGE_VMAP arch query functions cleanup
>   mm/vmalloc: Hugepage vmalloc mappings
> 
>  arch/arm64/mm/mmu.c                      |   8 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c |   6 +-
>  arch/x86/mm/ioremap.c                    |   6 +-
>  include/linux/io.h                       |   3 -
>  include/linux/vmalloc.h                  |  15 +
>  lib/ioremap.c                            | 203 +----------
>  mm/vmalloc.c                             | 413 +++++++++++++++++++----
>  7 files changed, 380 insertions(+), 274 deletions(-)
> 
> -- 
> 2.23.0
> 
> 
> 
