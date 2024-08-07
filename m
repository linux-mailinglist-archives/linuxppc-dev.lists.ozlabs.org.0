Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE094B306
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 00:29:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3ZxdDYBh;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VmoamQMO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfPx16TG8z3cnv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 08:29:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3ZxdDYBh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VmoamQMO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfPwL0gMbz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 08:28:50 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723069727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l6W13aUL7iArB1u1SHKLVFvFvnvLUQ1pwZnVA+aBUsE=;
	b=3ZxdDYBh9dkkHBe2taR3ntGjkle6rDPMBLXo4UhxX0U5hvgCD7ElxlpVVKzebM7m55YoYg
	6IKzzdSsW1TDc9pIvZYbtMq17EoFTuLcw1atQsU7Bsl9Yw+lnCggeHfiMfyuVHDLhinNCV
	GkL4xmuAy8lmfTKAidBHshnaxOnMmkK7vcvn/I5wTIvG/bMAOekzFsjwDQtCOo5gjYb9Mh
	3KjeJhRTZmnhVGLmBNpWTdiMxBXZNjdkdyW9PbyWAh2qSub1H21tOY/VlFOBZky3I79b+M
	kKAWkAEexeyKsLLvMcde8oZ+cKCdvPGfvph2jGxkNDnZ9tv62FmQT5a2EO1IWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723069727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l6W13aUL7iArB1u1SHKLVFvFvnvLUQ1pwZnVA+aBUsE=;
	b=VmoamQMOr4JMUHfQGwGo1xKYxHHMAQiHW/JDSB/7JHvkAeXPux0Xok96bTkMYXb7wubsH8
	cukq0GYxhuQaqOAQ==
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v4 5/7] mm/x86: arch_check_zapped_pud()
In-Reply-To: <20240807194812.819412-6-peterx@redhat.com>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-6-peterx@redhat.com>
Date: Thu, 08 Aug 2024 00:28:47 +0200
Message-ID: <878qx80xy8.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill
 A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07 2024 at 15:48, Peter Xu wrote:

> Subject: mm/x86: arch_check_zapped_pud()

Is not a proper subject line. It clearly lacks a verb.

  Subject: mm/x86: Implement arch_check_zapped_pud()


> Introduce arch_check_zapped_pud() to sanity check shadow stack on PUD zaps.
> It has the same logic of the PMD helper.

s/of/as/

> +
> +void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud)
> +{
> +	/* See note in arch_check_zapped_pte() */
> +	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
> +			pud_shstk(pud));

Please get rid of the line break. You have 100 characters.

> +}
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 2a6a3cccfc36..2289e9f7aa1b 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -447,6 +447,13 @@ static inline void arch_check_zapped_pmd(struct vm_area_struct *vma,
>  }
>  #endif
>  
> +#ifndef arch_check_zapped_pud
> +static inline void arch_check_zapped_pud(struct vm_area_struct *vma,
> +					 pud_t pud)
> +{

Ditto..

> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 0024266dea0a..81c5da0708ed 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c

Why is a mm change burried in a patch which is named mm/x86?

It's clearly documented that core changes with the generic fallback come
in one patch and the architecture override in a separate one afterwards.

Do we write documentation just for the sake of writing it?

Thanks,

        tglx

