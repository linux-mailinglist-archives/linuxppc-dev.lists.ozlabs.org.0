Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CFC94CFD2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 14:09:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qVaIQJt3;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/79bjhG1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgN4X6fPcz2yl1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 22:09:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qVaIQJt3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/79bjhG1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgN3r6kMvz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 22:08:40 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723205308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rdiGSFNTrBSYFwpgP8eah13N5RSzPLohIKvfJai2S0w=;
	b=qVaIQJt3ulHehi7WSoVKySGiDzelyn+pRR9wbJgnWO2lp+Qo7AVqYgugRvjWBA4m7AnI5g
	RSkAWMfsf0wMO1SxKPQ1Z9ubxGTX1QtKWxOQMjuNBog7jhsnDOnIJMSDA47fs7C6pAaD/j
	/NTaSYvqc5qqHZ352tolGC+8vN/wRq9LkuYPNfe50M73OT1tBf+zZ3qNXulCLH0w4Pb++n
	h+xPRK4/bE2McX5JcsVG10zAS5tpgG3ORG6F8SCX7pvrhPJx63VtzTIjQf6tRYd4Wv5dRL
	T1G4oa8Gskr9gSAhxvNNCPXsl7Bvwy6Y4TP8oWDZ+v/Ynvg/K49hQvJ2LEoonw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723205308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rdiGSFNTrBSYFwpgP8eah13N5RSzPLohIKvfJai2S0w=;
	b=/79bjhG1R37llYQMGwou1YZqcLFThCIIXln46S8iy0NBQP/SGfyspEPmffXtpRRabZzXZH
	09nuUsMPC+J/+BCg==
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 4/7] mm/x86: Make pud_leaf() only care about PSE bit
In-Reply-To: <ZrTcGxANpcvwp1qt@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-5-peterx@redhat.com> <87bk240y8h.ffs@tglx>
 <ZrTcGxANpcvwp1qt@x1n>
Date: Fri, 09 Aug 2024 14:08:28 +0200
Message-ID: <87mslluceb.ffs@tglx>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill
 A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 08 2024 at 10:54, Peter Xu wrote:
> On Thu, Aug 08, 2024 at 12:22:38AM +0200, Thomas Gleixner wrote:
>> On Wed, Aug 07 2024 at 15:48, Peter Xu wrote:
>> > An entry should be reported as PUD leaf even if it's PROT_NONE, in which
>> > case PRESENT bit isn't there. I hit bad pud without this when testing dax
>> > 1G on zapping a PROT_NONE PUD.
>> 
>> That does not qualify as a change log. What you hit is irrelevant unless
>> you explain the actual underlying problem. See Documentation/process/
>> including the TIP documentation.
>
> Firstly, thanks a lot for the reviews.
>
> I thought the commit message explained exactly what is the underlying
> problem, no?
>
> The problem is even if PROT_NONE, as long as the PSE bit is set on the PUD
> it should be treated as a PUD leaf.

Sure. But why should it be treated so.

> Currently, the code will return pud_leaf()==false for those PROT_NONE
> PUD entries, and IMHO that is wrong.

Your humble opinion is fine, but hardly a technical argument.

> This patch wants to make it right.  I still think that's mostly what I put
> there in the commit message..
>
> Would you please suggest something so I can try to make it better,
> otherwise?  Or it'll be helpful too if you could point out which part of
> the two documentations I should reference.

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

  A good structure is to explain the context, the problem and the
  solution in separate paragraphs and this order

>> > diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
>> > index e39311a89bf4..a2a3bd4c1bda 100644
>> > --- a/arch/x86/include/asm/pgtable.h
>> > +++ b/arch/x86/include/asm/pgtable.h
>> > @@ -1078,8 +1078,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
>> >  #define pud_leaf pud_leaf
>> >  static inline bool pud_leaf(pud_t pud)
>> >  {
>> > -	return (pud_val(pud) & (_PAGE_PSE | _PAGE_PRESENT)) ==
>> > -		(_PAGE_PSE | _PAGE_PRESENT);
>> > +	return pud_val(pud) & _PAGE_PSE;
>> >  }
>> 
>> And the changelog does not explain why this change is not affecting any
>> existing user of pud_leaf().
>
> That's what I want to do: I want to affect them..

Fine. Just the change log does not tell me what the actual problem is
("I hit something" does not qualify) and "should be reported" is not
helpful either as it does not explain anything

> And IMHO it's mostly fine before because mprotect() is broken with 1g
> anyway, and I guess nobody managed to populate any pud entry with PROT_NONE
> on dax 1g before, and that's what this whole series is trying to fix.

Again your humble opinion matters, but technical facts and analysis
matter way more.

Thanks,

        tglx
