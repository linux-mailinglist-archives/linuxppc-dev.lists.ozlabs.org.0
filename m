Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336DE94B2FC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 00:23:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MjVStxYX;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=s6thDodU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfPp26Ff3z3cVb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 08:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MjVStxYX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=s6thDodU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfPnM4bpgz3cLj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 08:22:47 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723069359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D3f6AgGXBWn26USlUGHHAP7bmp83AGplRMWVB7u+gXs=;
	b=MjVStxYXCwpkumLfhgR5p8beZFpGH2nkbtVVALx+fFHnNmmYvlk9jeWFb2Q/rJYIvBu7Yf
	QmqhkyySGxyYRAosoZO89bM199kAIarC+9Nc93FIuUE3eN99+Tkwo61xTamSAX8SS3iNBN
	iIOfqCr4ykriRm5TOq0tu9JB41vbrUgGFzwYj/6wQo82k+sDITDg/nr4x7+tjiZXPLl4U6
	ByrZvF9YgWAzEcjJn/hOUGeXT/RLW3uVgLtH+5n/Deqdx1JJpBwf45ixi5O+pKIQUNqlPh
	+oebXHH82ss0ROpqZQ7F6Euf9mWjW9YkHsMH+f61njOBq13jB7EdVgFLXZjNGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723069359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D3f6AgGXBWn26USlUGHHAP7bmp83AGplRMWVB7u+gXs=;
	b=s6thDodUfmlaC+uGJBnMaZ8eZ/JEl88E+VPzE73mAN9wUMnkbyFt0RkhXmpAghR+nz/JRl
	U80X7xVZhgnZS4Dg==
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v4 4/7] mm/x86: Make pud_leaf() only care about PSE bit
In-Reply-To: <20240807194812.819412-5-peterx@redhat.com>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-5-peterx@redhat.com>
Date: Thu, 08 Aug 2024 00:22:38 +0200
Message-ID: <87bk240y8h.ffs@tglx>
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
> An entry should be reported as PUD leaf even if it's PROT_NONE, in which
> case PRESENT bit isn't there. I hit bad pud without this when testing dax
> 1G on zapping a PROT_NONE PUD.

That does not qualify as a change log. What you hit is irrelevant unless
you explain the actual underlying problem. See Documentation/process/
including the TIP documentation.

> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index e39311a89bf4..a2a3bd4c1bda 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1078,8 +1078,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
>  #define pud_leaf pud_leaf
>  static inline bool pud_leaf(pud_t pud)
>  {
> -	return (pud_val(pud) & (_PAGE_PSE | _PAGE_PRESENT)) ==
> -		(_PAGE_PSE | _PAGE_PRESENT);
> +	return pud_val(pud) & _PAGE_PSE;
>  }

And the changelog does not explain why this change is not affecting any
existing user of pud_leaf().

Thanks,

        tglx


