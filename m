Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF513718A0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 21:20:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWfHr3QxFz3fFv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 05:20:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SCXzv5NF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SCXzv5NF;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWfH168RSz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 05:20:13 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d41763796so99981b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 12:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1685560811; x=1688152811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=49Ctqz+Z6/EpgEVzBMBiySSOETw/gRZF7F8sKc0/gW4=;
        b=SCXzv5NFJkdSd2DBch3tBur6rt87sHZadMvllcCYrBSlAnujqsn2w6NYfs8kRw7zEH
         UUy5B5M3fdwqVh4cJAPUbO4ymzbGUQhjG0wsWvcB0rzXrJuUXqSQWExeBcxLh5dnJ4hW
         JdIcMLBU2Wr5PTX+4Sgey8hL0W2zyc7yeXyBOoy9FNA13tz08zsvGn7+DUiMDrwaQkpg
         hdZvFD7p3uuyL6jZGaitCwZEBXvEijJ+fMG39fXax6zGLA/zH3JFxhLgU8GjKTvmwn3U
         cfKL4OTNs21hoPihFH4rxpZz8Ex23V4vNxSxIHe04E18MS+FM6lfIrpkz5m+NwO2u7KZ
         /PHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560811; x=1688152811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49Ctqz+Z6/EpgEVzBMBiySSOETw/gRZF7F8sKc0/gW4=;
        b=B+BZvr4iNGI1p57+7EqeG4wxtTaQHE/4ihvvKxGHI6dSfIpVE4SGfcqBbWLrPeMU2O
         ZPTd6RuGizbhQVf5s+ZZzhuCfacCQD6y4O3xNJggasSbb96H2NlUN+zq/0aqArsrsTGo
         JQ3CWsYq4bdKciZ+glimcy6Gb6ipbRWa2UbAWnDiwY/HOsvNe+0wuymfDmla/dJXLM/H
         UjHBNNA30SLHyn7kkquKB0s0oSqQFWcEvho4RuXGIeEEP1UuOCNM99I3L7gjPVJEhzZn
         IgYYtlxJMJJuRTjIgghh8amfCq6kYCmy3tFUhWx7CGWpo38/Y11bnadoWuBrX9cYzvtw
         uL2Q==
X-Gm-Message-State: AC+VfDy2G7iDGlETAs008ik5xcFxXwgez4ZMA/lbdPRJ9RZQ+mGBZDrw
	1nPUDZZzGVWpnINolJvydO4Tqw==
X-Google-Smtp-Source: ACHHUZ5vOhH+Z20smvih3PRoBzyu6112d4DjAZ/k2Hk8Q2510QpTt0jTRAeR3hLBF9CzQodd76AWQw==
X-Received: by 2002:a05:6a00:1344:b0:647:e45f:1a4c with SMTP id k4-20020a056a00134400b00647e45f1a4cmr5931413pfu.11.1685560810753;
        Wed, 31 May 2023 12:20:10 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id 15-20020aa7920f000000b0065017055caasm918208pfo.210.2023.05.31.12.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:20:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q4RMe-0017g6-KI;
	Wed, 31 May 2023 16:20:08 -0300
Date: Wed, 31 May 2023 16:20:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH mm-unstable v2 02/10] mm/kvm: use
 mmu_notifier_ops->test_clear_young()
Message-ID: <ZHed6OuO/ALNfvaX@ziepe.ca>
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-3-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526234435.662652-3-yuzhao@google.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.co
 m>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 26, 2023 at 05:44:27PM -0600, Yu Zhao wrote:
> Replace test_young() and clear_young() with test_clear_young().
> 
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  include/linux/mmu_notifier.h | 29 ++-----------------
>  include/trace/events/kvm.h   | 15 ----------
>  mm/mmu_notifier.c            | 42 ----------------------------
>  virt/kvm/kvm_main.c          | 54 ------------------------------------
>  4 files changed, 2 insertions(+), 138 deletions(-)
> 
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index dfdbb370682d..c8f35fc08703 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -104,26 +104,6 @@ struct mmu_notifier_ops {
>  				 unsigned long start,
>  				 unsigned long end);
>  
> -	/*
> -	 * clear_young is a lightweight version of clear_flush_young. Like the
> -	 * latter, it is supposed to test-and-clear the young/accessed bitflag
> -	 * in the secondary pte, but it may omit flushing the secondary tlb.
> -	 */
> -	int (*clear_young)(struct mmu_notifier *subscription,
> -			   struct mm_struct *mm,
> -			   unsigned long start,
> -			   unsigned long end);
> -
> -	/*
> -	 * test_young is called to check the young/accessed bitflag in
> -	 * the secondary pte. This is used to know if the page is
> -	 * frequently used without actually clearing the flag or tearing
> -	 * down the secondary mapping on the page.
> -	 */
> -	int (*test_young)(struct mmu_notifier *subscription,
> -			  struct mm_struct *mm,
> -			  unsigned long address);
> -
>  	int (*test_clear_young)(struct mmu_notifier *mn, struct mm_struct *mm,
>  				unsigned long start, unsigned long end,
>  				bool clear, unsigned long *bitmap);

Oh, you split the patch. This MMU notifier stuff seems OK for both
patches then, and KVM is the only user:

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
