Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EBD94D1A7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 15:54:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hqSktPeD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TDFX5rJq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgQPm0qGxz2yyD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 23:54:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hqSktPeD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TDFX5rJq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgQP24wNHz2yMv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 23:53:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723211614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WDbHYgHEck43iqNj8mlC9mwPoKgwtzUQVA3kNM0mHs4=;
	b=hqSktPeDdyoWftUYy396CXzGk3lENp8rcsLcYr64y06/LrjVg+kyBxA3yxRLZzg3eX9HFH
	Y5ya50Y02vPga13ZnJvFJBKR9vYFjrF9E2uugtkmUIYrB1NaofWQ4krAh+NdpiI87DOOW3
	4PCp8ZFP2YfrJVEq1eD9BPuGVqjFm7E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723211615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WDbHYgHEck43iqNj8mlC9mwPoKgwtzUQVA3kNM0mHs4=;
	b=TDFX5rJqtdEdbbQlnGGg9S1Ua36OGVG3tqPstZD1KYTgs3yWd/iqwfpb11FRQlHL7arxKb
	6B9c/eMjLA8YX/AEE1gau6ucdfIPe0jxaSFwObXqN8wesf1aof13vB4cQ06t1Bgb5w1tDl
	9vCdhdzhg+JEHhu6afevXIMOeQ7JTDc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-GfrO3g3rPRyysQj1Dmzslw-1; Fri, 09 Aug 2024 09:53:33 -0400
X-MC-Unique: GfrO3g3rPRyysQj1Dmzslw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b7ad98c1f8so3760106d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2024 06:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723211612; x=1723816412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDbHYgHEck43iqNj8mlC9mwPoKgwtzUQVA3kNM0mHs4=;
        b=p8+tvWsYcxEAcbmQCVqyiWj42ItqbAkJddbFKhw8R6UI2FOQcfq2AoHeLk/uciMIBO
         y6DTAOyy6p/IM+F0WBBeg9i/AZGJGhPRN7AoGVWRc6AyE33yHSB105kdpF32zYFZXjWe
         kdQHfSnve18hHAwMWXjvKle8eY6dXqskNyIw0m/JV5XYFCJlR2r/LfaURkG/+X1hIIQq
         tevj5oGXBxUwsLawKYn5yvBpQuHhgtg8j0lMU7iyZMkR8sCCqrA1jnf01yVEI48FcMx/
         eD9B5WGVflH1PJzCVyiS8kr5N7R0B9udzx4a02lCuDOQuAYnpVZHXKWu4+JBm4akdOVr
         fZXA==
X-Forwarded-Encrypted: i=1; AJvYcCXmjxnfnMedTAhgtwiEiQUmmGveB3tTr5zMi5cfuw7ltwzfJlwfFOb7c72+RhIJXId26sD1v4TJtJ3rJ14=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx97JX6VVCDDz3Mb7rNCIwFKiCInsfIY3i3aK/fk+Ahy98MxE2r
	sefyTgoQQwdhMW2D6ODWR2fwr78xgkrwQrOty3lHbYdgEPYkJ21/QeQxu0IzdRERGBmcc+/OS+5
	ZsmOKBIXV8DB/+P4g4d+R5DAaxu463XLc92qbG4UA9joh+ISISWPvVMUsqcCK7YE=
X-Received: by 2002:a05:620a:319d:b0:7a1:5683:4aae with SMTP id af79cd13be357-7a4c18681efmr93160385a.10.1723211612576;
        Fri, 09 Aug 2024 06:53:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMiWgDgRbpmEJ2yt83G9IfveiqoJa1zDyWB54xiHqbp4o5xzDhd8cR/4kQNOyjKUHOvFbE/Q==
X-Received: by 2002:a05:620a:319d:b0:7a1:5683:4aae with SMTP id af79cd13be357-7a4c18681efmr93156985a.10.1723211612040;
        Fri, 09 Aug 2024 06:53:32 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3786d43f2sm263955685a.125.2024.08.09.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 06:53:31 -0700 (PDT)
Date: Fri, 9 Aug 2024 09:53:28 -0400
From: Peter Xu <peterx@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 4/7] mm/x86: Make pud_leaf() only care about PSE bit
Message-ID: <ZrYfWLkey3v7cDi0@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-5-peterx@redhat.com>
 <87bk240y8h.ffs@tglx>
 <ZrTcGxANpcvwp1qt@x1n>
 <87mslluceb.ffs@tglx>
MIME-Version: 1.0
In-Reply-To: <87mslluceb.ffs@tglx>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 09, 2024 at 02:08:28PM +0200, Thomas Gleixner wrote:
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
> 
>   A good structure is to explain the context, the problem and the
>   solution in separate paragraphs and this order

I'll try to follow, thanks.

[...]

> > And IMHO it's mostly fine before because mprotect() is broken with 1g
> > anyway, and I guess nobody managed to populate any pud entry with PROT_NONE
> > on dax 1g before, and that's what this whole series is trying to fix.
> 
> Again your humble opinion matters, but technical facts and analysis
> matter way more.

All the rest comments in the reply were about "why it's a PUD leaf".  So
let me reply in one shot.

Referring to pXd_leaf() documentation in linux/pgtable.h:

/*
 * pXd_leaf() is the API to check whether a pgtable entry is a huge page
 * mapping.  It should work globally across all archs, without any
 * dependency on CONFIG_* options.  For architectures that do not support
 * huge mappings on specific levels, below fallbacks will be used.
 *
 * A leaf pgtable entry should always imply the following:
 *
 * - It is a "present" entry.  IOW, before using this API, please check it
 *   with pXd_present() first. NOTE: it may not always mean the "present
 *   bit" is set.  For example, PROT_NONE entries are always "present".
 *
 * - It should _never_ be a swap entry of any type.  Above "present" check
 *   should have guarded this, but let's be crystal clear on this.
 *
 * - It should contain a huge PFN, which points to a huge page larger than
 *   PAGE_SIZE of the platform.  The PFN format isn't important here.
 *
 * - It should cover all kinds of huge mappings (e.g., pXd_trans_huge(),
 *   pXd_devmap(), or hugetlb mappings).
 */

It explicitly stated that PROT_NONE should be treated as a present entry,
and also a leaf. The document is for pXd_leaf(), so it should cover puds
too.  In this specific case of the zapping path, it's only possible it's a
DAX 1G thp.  But pud_leaf() should work for hugetlb too, for example, when
PROT_NONE applied on top of a 1G hugetlb with PSE set.

Unfortunately, I wrote this document in 64078b3d57.. so that's also another
way of saying "my humble opinion".. it's just nobody disagreed so far, and
please shoot if you see any issue out of it.

IOW, I don't think we must define pXd_leaf() like this - we used to define
pXd_leaf() to cover migration entries at least on x86, for example. But per
my own past mm experience, the current way is the right thing to do to make
everything much easier and less error prone.  Sorry, I can't get rid of
"IMHO" here.

Another example of "we can define pXd_leaf() in other ways" is I believe
for PPC 8XX series it's possible to make special use of pmd_leaf() by
allowing pmd_leaf() to return true even for two continuous pte pgtable
covering 8MB memory.  But that will be an extremely special use of
pmd_leaf() even if it comes, maybe worth an update above when it happens,
and it'll only be used by powerpc not any other arch.  It won't happen if
we want to drop 8MB support, though.

So in short, I don't think there's a 100% correct "technical" answer of
saying "how to define pxx_leaf()"; things just keep evolving, and "humble
opinions" keeps coming with some good reasons.  Hope that answers the
question to some extent.

Taking all things into account, I wonder whether below enriched commit
message would get me closer to your ACK on this, trying to follow the rule
you referenced on the order of how context/problem/solution should be
ordered and addressed:

    When working on mprotect() on 1G dax entries, I hit an zap bad pud
    error when zapping a huge pud that is with PROT_NONE permission.

    Here the problem is x86's pud_leaf() requires both PRESENT and PSE bits
    set to report a pud entry as a leaf, but that doesn't look right, as
    it's not following the pXd_leaf() definition that we stick with so far,
    where PROT_NONE entries should be reported as leaves.

    To fix it, change x86's pud_leaf() implementation to only check against
    PSE bit to report a leaf, irrelevant of whether PRESENT bit is set.

Thanks,

-- 
Peter Xu

